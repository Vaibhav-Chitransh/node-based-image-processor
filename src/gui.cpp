#define IMGUI_IMPL_WIN32_ENABLE_DPI_AWARENESS
#define IMGUI_IMPL_WIN32_DISABLE_OBSOLETE_FUNCTIONS
#define IMGUI_IMPL_WIN32_HAS_WNDPROC_HANDLER
#include <windows.h>
#include <windowsx.h>
#include <d3d11.h>
#include <tchar.h>
#include <imgui.h>
#include <backends/imgui_impl_win32.h>
#include <backends/imgui_impl_dx11.h>
#include <opencv2/opencv.hpp>
#include <shobjidl.h> 
#include <string>

#pragma comment(lib, "d3d11.lib")

// Global Declarations
ID3D11Device* g_pd3dDevice = nullptr;
ID3D11DeviceContext* g_pd3dDeviceContext = nullptr;
IDXGISwapChain* g_pSwapChain = nullptr;
ID3D11RenderTargetView* g_mainRenderTargetView = nullptr;
HWND g_hWnd = nullptr;

// Image Buffers
cv::Mat original_image;
ID3D11ShaderResourceView* g_texture = nullptr;
ID3D11ShaderResourceView* g_processedTexture = nullptr;
int g_imageWidth = 0, g_imageHeight = 0;

// Node State
bool show_grayscale = false;
bool show_brightness = false;
float brightness_value = 0.0f;
bool show_contrast = false;
float contrast_value = 1.0f;
bool show_blur = false;
int blur_radius = 1;
bool use_gaussian = true;
bool show_edge_detection = false;
bool use_canny = true;
int lower_threshold = 100;
int upper_threshold = 200;
int kernel_size = 1;
bool overlay_edges = false;

// Function declarations
bool LoadImageToTexture(const cv::Mat& image, ID3D11ShaderResourceView** out_texture, int& width, int& height);
void CreateRenderTarget();
void CleanupRenderTarget();
void CleanupDeviceD3D();
bool CreateDeviceD3D(HWND hWnd);

// Helper Functions
std::wstring OpenFileDialog() {
    HRESULT hr = CoInitializeEx(NULL, COINIT_APARTMENTTHREADED | COINIT_DISABLE_OLE1DDE);
    if (FAILED(hr))
        return L"";

    IFileOpenDialog *pFileOpen;
    hr = CoCreateInstance(CLSID_FileOpenDialog, NULL, CLSCTX_ALL, 
                         IID_IFileOpenDialog, reinterpret_cast<void**>(&pFileOpen));

    if (SUCCEEDED(hr)) {
        // Set file types
        COMDLG_FILTERSPEC fileTypes[] = {
            {L"Image Files", L"*.jpg;*.jpeg;*.png;*.bmp"},
            {L"All Files", L"*.*"}
        };
        pFileOpen->SetFileTypes(2, fileTypes);

        // Show the dialog
        hr = pFileOpen->Show(NULL);

        if (SUCCEEDED(hr)) {
            IShellItem *pItem;
            hr = pFileOpen->GetResult(&pItem);
            if (SUCCEEDED(hr)) {
                PWSTR filePath;
                hr = pItem->GetDisplayName(SIGDN_FILESYSPATH, &filePath);
                if (SUCCEEDED(hr)) {
                    std::wstring path(filePath);
                    CoTaskMemFree(filePath);
                    pItem->Release();
                    pFileOpen->Release();
                    CoUninitialize();
                    return path;
                }
                pItem->Release();
            }
        }
        pFileOpen->Release();
    }
    CoUninitialize();
    return L"";
}

bool LoadNewImage(const std::wstring& path) {
    if (path.empty()) return false;

    // Convert wide string to string
    std::string pathStr(path.begin(), path.end());
    
    // Load the new image
    cv::Mat new_image = cv::imread(pathStr);
    if (new_image.empty()) return false;

    // Clean up old textures
    if (g_texture) {
        g_texture->Release();
        g_texture = nullptr;
    }
    if (g_processedTexture) {
        g_processedTexture->Release();
        g_processedTexture = nullptr;
    }

    // Update the original image and create new texture
    original_image = new_image;
    return LoadImageToTexture(original_image, &g_texture, g_imageWidth, g_imageHeight);
}

void CreateRenderTarget() {
    ID3D11Texture2D* pBackBuffer = nullptr;
    g_pSwapChain->GetBuffer(0, IID_PPV_ARGS(&pBackBuffer));
    g_pd3dDevice->CreateRenderTargetView(pBackBuffer, nullptr, &g_mainRenderTargetView);
    pBackBuffer->Release();
}

void CleanupRenderTarget() {
    if (g_mainRenderTargetView) {
        g_mainRenderTargetView->Release();
        g_mainRenderTargetView = nullptr;
    }
}

void CleanupDeviceD3D() {
    CleanupRenderTarget();
    if (g_pSwapChain) { g_pSwapChain->Release(); g_pSwapChain = nullptr; }
    if (g_pd3dDeviceContext) { g_pd3dDeviceContext->Release(); g_pd3dDeviceContext = nullptr; }
    if (g_pd3dDevice) { g_pd3dDevice->Release(); g_pd3dDevice = nullptr; }
}

bool CreateDeviceD3D(HWND hWnd) {
    DXGI_SWAP_CHAIN_DESC sd = {};
    sd.BufferCount = 2;
    sd.BufferDesc.Width = 1280;
    sd.BufferDesc.Height = 720;
    sd.BufferDesc.Format = DXGI_FORMAT_R8G8B8A8_UNORM;
    sd.BufferUsage = DXGI_USAGE_RENDER_TARGET_OUTPUT;
    sd.OutputWindow = hWnd;
    sd.SampleDesc.Count = 1;
    sd.Windowed = TRUE;
    sd.SwapEffect = DXGI_SWAP_EFFECT_DISCARD;

    UINT createDeviceFlags = 0;
    D3D_FEATURE_LEVEL featureLevel;
    const D3D_FEATURE_LEVEL featureLevelArray[1] = { D3D_FEATURE_LEVEL_11_0 };

    if (D3D11CreateDeviceAndSwapChain(nullptr, D3D_DRIVER_TYPE_HARDWARE, nullptr, createDeviceFlags,
        featureLevelArray, 1, D3D11_SDK_VERSION, &sd, &g_pSwapChain,
        &g_pd3dDevice, &featureLevel, &g_pd3dDeviceContext) != S_OK)
        return false;

    CreateRenderTarget();
    return true;
}

bool LoadImageToTexture(const cv::Mat& image, ID3D11ShaderResourceView** out_texture, int& width, int& height) {
    if (image.empty()) return false;

    width = image.cols;
    height = image.rows;

    cv::Mat rgba_image;
    if (image.channels() == 3)
        cv::cvtColor(image, rgba_image, cv::COLOR_BGR2RGBA);
    else if (image.channels() == 1)
        cv::cvtColor(image, rgba_image, cv::COLOR_GRAY2RGBA);
    else
        rgba_image = image;

    D3D11_TEXTURE2D_DESC desc = {};
    desc.Width = width;
    desc.Height = height;
    desc.MipLevels = 1;
    desc.ArraySize = 1;
    desc.Format = DXGI_FORMAT_R8G8B8A8_UNORM;
    desc.SampleDesc.Count = 1;
    desc.Usage = D3D11_USAGE_DEFAULT;
    desc.BindFlags = D3D11_BIND_SHADER_RESOURCE;

    D3D11_SUBRESOURCE_DATA initData = {};
    initData.pSysMem = rgba_image.data;
    initData.SysMemPitch = rgba_image.cols * 4;

    ID3D11Texture2D* tex = nullptr;
    HRESULT hr = g_pd3dDevice->CreateTexture2D(&desc, &initData, &tex);
    if (FAILED(hr)) return false;

    hr = g_pd3dDevice->CreateShaderResourceView(tex, nullptr, out_texture);
    tex->Release();

    return SUCCEEDED(hr);
}

// Win32 Message Handler
LRESULT WINAPI WndProc(HWND hWnd, UINT msg, WPARAM wParam, LPARAM lParam) {
    ImGuiIO& io = ImGui::GetIO();
    switch (msg) {
    case WM_LBUTTONDOWN: io.AddMouseButtonEvent(0, true); return 0;
    case WM_LBUTTONUP:   io.AddMouseButtonEvent(0, false); return 0;
    case WM_MOUSEMOVE:   io.AddMousePosEvent((float)GET_X_LPARAM(lParam), (float)GET_Y_LPARAM(lParam)); return 0;
    case WM_MOUSEWHEEL:  io.AddMouseWheelEvent(0.0f, GET_WHEEL_DELTA_WPARAM(wParam) / (float)WHEEL_DELTA); return 0;
    }

    switch (msg) {
    case WM_SIZE:
        if (g_pd3dDevice != nullptr && wParam != SIZE_MINIMIZED) {
            CleanupRenderTarget();
            g_pSwapChain->ResizeBuffers(0, (UINT)LOWORD(lParam), (UINT)HIWORD(lParam), DXGI_FORMAT_UNKNOWN, 0);
            CreateRenderTarget();
        }
        return 0;
    case WM_DESTROY:
        PostQuitMessage(0);
        return 0;
    }
    return DefWindowProc(hWnd, msg, wParam, lParam);
}

// Application Entry
int WINAPI WinMain(HINSTANCE hInstance, HINSTANCE, LPSTR, int) {
    WNDCLASSEX wc = { sizeof(WNDCLASSEX), CS_CLASSDC, WndProc, 0L, 0L,
                      GetModuleHandle(NULL), NULL, NULL, NULL, NULL,
                      _T("ImGuiWindow"), NULL };
    RegisterClassEx(&wc);
    g_hWnd = CreateWindow(wc.lpszClassName, _T("Node-Based Image Editor"),
                          WS_OVERLAPPEDWINDOW, 100, 100, 1280, 720,
                          NULL, NULL, wc.hInstance, NULL);

    if (!CreateDeviceD3D(g_hWnd)) {
        CleanupDeviceD3D();
        UnregisterClass(wc.lpszClassName, wc.hInstance);
        return 1;
    }

    ShowWindow(g_hWnd, SW_SHOWDEFAULT);
    UpdateWindow(g_hWnd);

    // Setup ImGui
    IMGUI_CHECKVERSION();
    ImGui::CreateContext();
    ImGuiIO& io = ImGui::GetIO(); (void)io;
    ImGui::StyleColorsDark();
    ImGui_ImplWin32_Init(g_hWnd);
    ImGui_ImplDX11_Init(g_pd3dDevice, g_pd3dDeviceContext);

    // Main loop
    MSG msg;
    ZeroMemory(&msg, sizeof(msg));
    while (msg.message != WM_QUIT) {
        if (PeekMessage(&msg, NULL, 0U, 0U, PM_REMOVE)) {
            TranslateMessage(&msg);
            DispatchMessage(&msg);
            continue;
        }

        ImGui_ImplDX11_NewFrame();
        ImGui_ImplWin32_NewFrame();
        ImGui::NewFrame();

        ImGui::Begin("Welcome to Node-Based Image Editor!");
        
        if (ImGui::Button("Load Image")) {
            std::wstring filePath = OpenFileDialog();
            if (!filePath.empty()) {
                LoadNewImage(filePath);
            }
        }

        // Add status text to show if image is loaded
        if (original_image.empty()) {
            ImGui::TextColored(ImVec4(1.0f, 0.0f, 0.0f, 1.0f), "No image loaded!");
        } else {
            ImGui::TextColored(ImVec4(0.0f, 1.0f, 0.0f, 1.0f), 
                "Image loaded: %dx%d", original_image.cols, original_image.rows);
        }

        ImGui::Separator();
        ImGui::Checkbox("Apply Grayscale", &show_grayscale);
        ImGui::Checkbox("Apply Brightness", &show_brightness);
        ImGui::Checkbox("Apply Contrast", &show_contrast);
        ImGui::Checkbox("Apply Blur", &show_blur);
        ImGui::Checkbox("Apply Edge Detection", &show_edge_detection);

        if (show_brightness) {
            ImGui::SliderFloat("Brightness", &brightness_value, -100.0f, 100.0f);
        }

        if (show_contrast) {
            ImGui::SliderFloat("Contrast", &contrast_value, 0.0f, 3.0f);
        }

        if (show_blur) {
            ImGui::SliderInt("Blur Radius", &blur_radius, 1, 20);
            ImGui::Checkbox("Use Gaussian Blur", &use_gaussian);
        }

        if (show_edge_detection) {
            ImGui::Checkbox("Use Canny Edge Detection", &use_canny);
            ImGui::SliderInt("Lower Threshold", &lower_threshold, 0, 255);
            ImGui::SliderInt("Upper Threshold", &upper_threshold, 0, 255);
            ImGui::SliderInt("Kernel Size", &kernel_size, 1, 4, "%d");
            ImGui::Text("Actual Kernel Size: %dx%d", kernel_size * 2 - 1, kernel_size * 2 - 1);
            ImGui::Checkbox("Overlay on Original", &overlay_edges);
        }

        // Chain processing
        if (!original_image.empty() && (show_grayscale || show_brightness || show_contrast || show_blur || show_edge_detection)) {
            cv::Mat current = original_image.clone();

            if (show_grayscale) {
                cv::cvtColor(current, current, cv::COLOR_BGR2GRAY);
            }

            if (show_brightness || show_contrast) {
                current.convertTo(current, -1, contrast_value, brightness_value);
            }

            if (show_blur) {
                cv::Size kernel_size(2 * blur_radius + 1, 2 * blur_radius + 1);
                if (use_gaussian) {
                    cv::GaussianBlur(current, current, kernel_size, 0);
                } else {
                    cv::blur(current, current, kernel_size);
                }
            }

            if (show_edge_detection) {
                cv::Mat edges;
                cv::Mat gray;
                
                // Ensure kernel size is odd
                int adjusted_kernel_size = kernel_size * 2 - 1;
                
                // Convert to grayscale for edge detection
                if (current.channels() == 3) {
                    cv::cvtColor(current, gray, cv::COLOR_BGR2GRAY);
                } else {
                    gray = current.clone();
                }

                if (use_canny) {
                    // Apply Gaussian blur before Canny
                    cv::GaussianBlur(gray, gray, cv::Size(adjusted_kernel_size, adjusted_kernel_size), 0);
                    cv::Canny(gray, edges, lower_threshold, upper_threshold);
                } else {
                    // Sobel edge detection
                    cv::Mat grad_x, grad_y;
                    cv::Mat abs_grad_x, abs_grad_y;
                    
                    cv::Sobel(gray, grad_x, CV_16S, 1, 0, adjusted_kernel_size);
                    cv::Sobel(gray, grad_y, CV_16S, 0, 1, adjusted_kernel_size);
                    
                    cv::convertScaleAbs(grad_x, abs_grad_x);
                    cv::convertScaleAbs(grad_y, abs_grad_y);
                    
                    cv::addWeighted(abs_grad_x, 0.5, abs_grad_y, 0.5, 0, edges);
                    cv::threshold(edges, edges, lower_threshold, 255, cv::THRESH_BINARY);
                }

                if (overlay_edges) {
                    cv::Mat edges_bgr;
                    cv::cvtColor(edges, edges_bgr, cv::COLOR_GRAY2BGR);
                    cv::Mat overlay = current.clone();
                    overlay.setTo(cv::Scalar(0, 0, 255), edges);
                    cv::addWeighted(current, 0.7, overlay, 0.3, 0, current);
                } else {
                    cv::cvtColor(edges, current, cv::COLOR_GRAY2BGR);
                }
            }

            LoadImageToTexture(current, &g_processedTexture, g_imageWidth, g_imageHeight);
        }

        // Show image
        if ((g_processedTexture && (show_grayscale || show_brightness || show_contrast || show_blur || show_edge_detection))) {
            ImGui::Separator();
            ImGui::Text("Processed Image:");
            ImGui::Image((ImTextureID)g_processedTexture, ImVec2((float)g_imageWidth, (float)g_imageHeight));
        } else if (g_texture) {
            ImGui::Separator();
            ImGui::Text("Original Image:");
            ImGui::Image((ImTextureID)g_texture, ImVec2((float)g_imageWidth, (float)g_imageHeight));
        }

        ImGui::End();

        ImGui::Render();
        g_pd3dDeviceContext->OMSetRenderTargets(1, &g_mainRenderTargetView, NULL);
        const float clear_color[4] = { 0.1f, 0.1f, 0.1f, 1.0f };
        g_pd3dDeviceContext->ClearRenderTargetView(g_mainRenderTargetView, clear_color);
        ImGui_ImplDX11_RenderDrawData(ImGui::GetDrawData());

        g_pSwapChain->Present(1, 0);
    }

    ImGui_ImplDX11_Shutdown();
    ImGui_ImplWin32_Shutdown();
    ImGui::DestroyContext();
    CleanupDeviceD3D();
    UnregisterClass(wc.lpszClassName, wc.hInstance);
    return 0;
}