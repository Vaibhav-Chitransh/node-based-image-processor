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
add_executable(node-based-image-processor src/main.cpp)

# Include OpenCV headers
target_include_directories(node-based-image-processor PRIVATE ${OpenCV_INCLUDE_DIRS})
target_link_libraries(node-based-image-processor PRIVATE ${OpenCV_LIBS})

# Including Imgui 
find_package(imgui CONFIG REQUIRED)
target_link_libraries(node-based-image-processor PRIVATE imgui::imgui)
