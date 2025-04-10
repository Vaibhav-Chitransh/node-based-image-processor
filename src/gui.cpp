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

#pragma comment(lib, "d3d11.lib")

// Global Declarations
ID3D11Device* g_pd3dDevice = nullptr;
ID3D11DeviceContext* g_pd3dDeviceContext = nullptr;
IDXGISwapChain* g_pSwapChain = nullptr;
ID3D11RenderTargetView* g_mainRenderTargetView = nullptr;
HWND g_hWnd = nullptr;

// Image Textures & Buffers
ID3D11ShaderResourceView* g_texture = nullptr;
ID3D11ShaderResourceView* g_processedTexture = nullptr;
int g_imageWidth = 0, g_imageHeight = 0;
cv::Mat original_image;
cv::Mat processed_image;
bool show_grayscale = false;

// Helper Functions
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
    // Register window class
    WNDCLASSEX wc = { sizeof(WNDCLASSEX), CS_CLASSDC, WndProc, 0L, 0L,
                      GetModuleHandle(NULL), NULL, NULL, NULL, NULL,
                      _T("ImGuiWindow"), NULL };
    RegisterClassEx(&wc);
    g_hWnd = CreateWindow(wc.lpszClassName, _T("Node-Based Image Editor"),
                          WS_OVERLAPPEDWINDOW, 100, 100, 1280, 720,
                          NULL, NULL, wc.hInstance, NULL);

    // Initialize D3D
    if (!CreateDeviceD3D(g_hWnd)) {
        CleanupDeviceD3D();
        UnregisterClass(wc.lpszClassName, wc.hInstance);
        return 1;
    }

    ShowWindow(g_hWnd, SW_SHOWDEFAULT);
    UpdateWindow(g_hWnd);

    // Setup Dear ImGui
    IMGUI_CHECKVERSION();
    ImGui::CreateContext();
    ImGuiIO& io = ImGui::GetIO(); (void)io;
    ImGui::StyleColorsDark();
    ImGui_ImplWin32_Init(g_hWnd);
    ImGui_ImplDX11_Init(g_pd3dDevice, g_pd3dDeviceContext);

    // Load the original image
    original_image = cv::imread("../assets/test.jpg");
    if (!original_image.empty()) {
        LoadImageToTexture(original_image, &g_texture, g_imageWidth, g_imageHeight);
    }

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

        // GUI Window
        ImGui::Begin("Welcome to Node-Based Image Editor!");
        ImGui::Text("This is a basic ImGui window.");
        ImGui::Button("Click Me!");

        ImGui::Separator();
        ImGui::Checkbox("Apply Grayscale", &show_grayscale);

        if (show_grayscale) {
            cv::cvtColor(original_image, processed_image, cv::COLOR_BGR2GRAY);
            LoadImageToTexture(processed_image, &g_processedTexture, g_imageWidth, g_imageHeight);
        }

        if (g_processedTexture && show_grayscale) {
            ImGui::Separator();
            ImGui::Text("Processed Image (Grayscale):");
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

        g_pSwapChain->Present(1, 0); // Vsync
    }

    ImGui_ImplDX11_Shutdown();
    ImGui_ImplWin32_Shutdown();
    ImGui::DestroyContext();
    CleanupDeviceD3D();
    UnregisterClass(wc.lpszClassName, wc.hInstance);
    return 0;
}
