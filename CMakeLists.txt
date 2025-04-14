cmake_minimum_required(VERSION 3.15)

# Use vcpkg toolchain if available
if(NOT DEFINED CMAKE_TOOLCHAIN_FILE)
    set(CMAKE_TOOLCHAIN_FILE "D:/vcpkg/scripts/buildsystems/vcpkg.cmake" CACHE STRING "")
endif()

project(node-based-image-processor)

set(CMAKE_CXX_STANDARD 17)

# Force Release mode unless explicitly set
if(NOT CMAKE_BUILD_TYPE)
    set(CMAKE_BUILD_TYPE Release)
endif()

# Determine architecture
if(CMAKE_SIZEOF_VOID_P EQUAL 8)
    set(ARCH_PATH "x64-windows")
else()
    set(ARCH_PATH "x86-windows")
endif()

# Check if OpenCV is installed
message(STATUS "Checking for OpenCV in vcpkg...")
if(EXISTS "D:/vcpkg/installed/${ARCH_PATH}/include/opencv2/opencv.hpp")
    # Manually set OpenCV paths
    set(OpenCV_INCLUDE_DIRS "D:/vcpkg/installed/${ARCH_PATH}/include")
    
    # Find all OpenCV libraries
    file(GLOB OpenCV_LIBS "D:/vcpkg/installed/${ARCH_PATH}/lib/opencv_*.lib")
    message(STATUS "Found OpenCV libraries: ${OpenCV_LIBS}")
else()
    message(FATAL_ERROR "OpenCV not found. Please install it with: vcpkg install opencv:${ARCH_PATH}")
endif()

# Manually set Protobuf paths
set(PROTOBUF_INCLUDE_DIR "D:/vcpkg/installed/${ARCH_PATH}/include")
set(PROTOBUF_LIBRARY "D:/vcpkg/installed/${ARCH_PATH}/lib/libprotobuf.lib")
set(PROTOBUF_LITE_LIBRARY "D:/vcpkg/installed/${ARCH_PATH}/lib/libprotobuf-lite.lib")
set(PROTOBUF_PROTOC_LIBRARY "D:/vcpkg/installed/${ARCH_PATH}/lib/libprotoc.lib")

# Add executable and sources
add_executable(node-based-image-processor
    src/main.cpp
    src/gui.cpp
)

# Link OpenCV and manually link Protobuf libs
target_link_libraries(node-based-image-processor PRIVATE
    ${OpenCV_LIBS}
    ${PROTOBUF_LIBRARY}
    ${PROTOBUF_LITE_LIBRARY}
    ${PROTOBUF_PROTOC_LIBRARY}
    d3d11
)

# ImGui setup
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

target_include_directories(node-based-image-processor PRIVATE
    ${IMGUI_DIR}
    ${IMGUI_DIR}/backends
    ${OpenCV_INCLUDE_DIRS}
    ${PROTOBUF_INCLUDE_DIR}
)

# Set Windows-specific properties
set_target_properties(node-based-image-processor PROPERTIES
    WIN32_EXECUTABLE TRUE
)