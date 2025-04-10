cmake_minimum_required(VERSION 3.15)
project(node-based-image-processor)

set(CMAKE_CXX_STANDARD 17)

# Set vcpkg toolchain
set(CMAKE_TOOLCHAIN_FILE "D:/vcpkg/scripts/buildsystems/vcpkg.cmake"
    CACHE STRING "Vcpkg toolchain file")

# Find OpenCV via vcpkg
set(OpenCV_ROOT "D:/vcpkg/installed/x64-windows")
find_package(OpenCV REQUIRED CONFIG)

# Add the main file
add_executable(node-based-image-processor
    src/main.cpp
    src/gui.cpp
)

set_target_properties(node-based-image-processor PROPERTIES
    WIN32_EXECUTABLE TRUE
)

# Add ImGui files
set(IMGUI_DIR ${CMAKE_SOURCE_DIR}/libs/imgui)

target_sources(node-based-image-processor PRIVATE
    ${IMGUI_DIR}/imgui.cpp
    ${IMGUI_DIR}/imgui_draw.cpp
    ${IMGUI_DIR}/imgui_tables.cpp
    ${IMGUI_DIR}/imgui_widgets.cpp
    ${IMGUI_DIR}/imgui_demo.cpp
    ${IMGUI_DIR}/backends/imgui_impl_dx11.cpp
    ${IMGUI_DIR}/backends/imgui_impl_win32.cpp
)

# Include ImGui + OpenCV
target_include_directories(node-based-image-processor PRIVATE
    ${IMGUI_DIR}
    ${IMGUI_DIR}/backends
    ${OpenCV_INCLUDE_DIRS}
)

# Link OpenCV libraries (ImGui has no external linking)
target_link_libraries(node-based-image-processor PRIVATE ${OpenCV_LIBS} d3d11)
