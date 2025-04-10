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

#pragma comment(lib, "d3d11.lib")

// Global Declarations
ID3D11Device *g_pd3dDevice = nullptr;
ID3D11DeviceContext *g_pd3dDeviceContext = nullptr;
IDXGISwapChain *g_pSwapChain = nullptr;
ID3D11RenderTargetView *g_mainRenderTargetView = nullptr;
HWND g_hWnd = nullptr;

// Helper Functions
void CreateRenderTarget()
{
    ID3D11Texture2D *pBackBuffer = nullptr;
    g_pSwapChain->GetBuffer(0, IID_PPV_ARGS(&pBackBuffer));
    g_pd3dDevice->CreateRenderTargetView(pBackBuffer, nullptr, &g_mainRenderTargetView);
    pBackBuffer->Release();
}

void CleanupRenderTarget()
{
    if (g_mainRenderTargetView)
    {
        g_mainRenderTargetView->Release();
        g_mainRenderTargetView = nullptr;
    }
}

void CleanupDeviceD3D()
{
    CleanupRenderTarget();
    if (g_pSwapChain)
    {
        g_pSwapChain->Release();
        g_pSwapChain = nullptr;
    }
    if (g_pd3dDeviceContext)
    {
        g_pd3dDeviceContext->Release();
        g_pd3dDeviceContext = nullptr;
    }
    if (g_pd3dDevice)
    {
        g_pd3dDevice->Release();
        g_pd3dDevice = nullptr;
    }
}

bool CreateDeviceD3D(HWND hWnd)
{
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
    const D3D_FEATURE_LEVEL featureLevelArray[1] = {D3D_FEATURE_LEVEL_11_0};

    if (D3D11CreateDeviceAndSwapChain(nullptr, D3D_DRIVER_TYPE_HARDWARE, nullptr, createDeviceFlags,
                                      featureLevelArray, 1, D3D11_SDK_VERSION, &sd, &g_pSwapChain,
                                      &g_pd3dDevice, &featureLevel, &g_pd3dDeviceContext) != S_OK)
        return false;

    CreateRenderTarget();
    return true;
}

// Win32 Message Handler
LRESULT WINAPI WndProc(HWND hWnd, UINT msg, WPARAM wParam, LPARAM lParam)
{
    ImGuiIO &io = ImGui::GetIO();
    switch (msg)
    {
    case WM_LBUTTONDOWN:
        io.AddMouseButtonEvent(0, true);
        return 0;
    case WM_LBUTTONUP:
        io.AddMouseButtonEvent(0, false);
        return 0;
    case WM_MOUSEMOVE:
        io.AddMousePosEvent((float)GET_X_LPARAM(lParam), (float)GET_Y_LPARAM(lParam));
        return 0;
    case WM_MOUSEWHEEL:
        io.AddMouseWheelEvent(0.0f, GET_WHEEL_DELTA_WPARAM(wParam) / (float)WHEEL_DELTA);
        return 0;
    }

    switch (msg)
    {
    case WM_SIZE:
        if (g_pd3dDevice != nullptr && wParam != SIZE_MINIMIZED)
        {
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

int WINAPI WinMain(HINSTANCE hInstance, HINSTANCE, LPSTR, int)
{
    // Register window class
    WNDCLASSEX wc = {sizeof(WNDCLASSEX), CS_CLASSDC, WndProc, 0L, 0L,
                     GetModuleHandle(NULL), NULL, NULL, NULL, NULL,
                     _T("ImGuiWindow"), NULL};
    RegisterClassEx(&wc);
    g_hWnd = CreateWindow(wc.lpszClassName, _T("Node-Based Image Editor"),
                          WS_OVERLAPPEDWINDOW, 100, 100, 1280, 720,
                          NULL, NULL, wc.hInstance, NULL);

    // Initialize D3D
    if (!CreateDeviceD3D(g_hWnd))
    {
        CleanupDeviceD3D();
        UnregisterClass(wc.lpszClassName, wc.hInstance);
        return 1;
    }

    ShowWindow(g_hWnd, SW_SHOWDEFAULT);
    UpdateWindow(g_hWnd);

    // Setup Dear ImGui context
    IMGUI_CHECKVERSION();
    ImGui::CreateContext();
    ImGuiIO &io = ImGui::GetIO();
    (void)io;

    // Setup Dear ImGui style
    ImGui::StyleColorsDark();

    // Setup Platform/Renderer bindings
    ImGui_ImplWin32_Init(g_hWnd);
    ImGui_ImplDX11_Init(g_pd3dDevice, g_pd3dDeviceContext);

    // Main loop
    MSG msg;
    ZeroMemory(&msg, sizeof(msg));
    while (msg.message != WM_QUIT)
    {
        if (PeekMessage(&msg, NULL, 0U, 0U, PM_REMOVE))
        {
            TranslateMessage(&msg);
            DispatchMessage(&msg);
            continue;
        }

        // Start new ImGui frame
        ImGui_ImplDX11_NewFrame();
        ImGui_ImplWin32_NewFrame();
        ImGui::NewFrame();

        // Your GUI here
        ImGui::Begin("Welcome to Node-Based Image Editor!");
        ImGui::Text("This is a basic ImGui window.");
        ImGui::Button("Click Me!");
        ImGui::End();

        // Rendering
        ImGui::Render();
        g_pd3dDeviceContext->OMSetRenderTargets(1, &g_mainRenderTargetView, NULL);
        const float clear_color[4] = {0.1f, 0.1f, 0.1f, 1.0f};
        g_pd3dDeviceContext->ClearRenderTargetView(g_mainRenderTargetView, clear_color);
        ImGui_ImplDX11_RenderDrawData(ImGui::GetDrawData());

        g_pSwapChain->Present(1, 0); // Vsync
    }

    // Cleanup
    ImGui_ImplDX11_Shutdown();
    ImGui_ImplWin32_Shutdown();
    ImGui::DestroyContext();
    CleanupDeviceD3D();
    UnregisterClass(wc.lpszClassName, wc.hInstance);

    return 0;
}
