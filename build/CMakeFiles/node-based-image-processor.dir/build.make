﻿# CMAKE generated file: DO NOT EDIT!
# Generated by "NMake Makefiles" Generator, CMake Version 4.0

# Delete rule output on recipe failure.
.DELETE_ON_ERROR:

#=============================================================================
# Special targets provided by cmake.

# Disable implicit rules so canonical targets will work.
.SUFFIXES:

.SUFFIXES: .hpux_make_needs_suffix_list

# Command-line flag to silence nested $(MAKE).
$(VERBOSE)MAKESILENT = -s

#Suppress display of executed commands.
$(VERBOSE).SILENT:

# A target that is always out of date.
cmake_force:
.PHONY : cmake_force

#=============================================================================
# Set environment variables for the build.

!IF "$(OS)" == "Windows_NT"
NULL=
!ELSE
NULL=nul
!ENDIF
SHELL = cmd.exe

# The CMake executable.
CMAKE_COMMAND = D:\Softwares\bin\cmake.exe

# The command to remove a file.
RM = D:\Softwares\bin\cmake.exe -E rm -f

# Escaping for special characters.
EQUALS = =

# The top-level source directory on which CMake was run.
CMAKE_SOURCE_DIR = "D:\Github Repos\node-based-image-processor"

# The top-level build directory on which CMake was run.
CMAKE_BINARY_DIR = "D:\Github Repos\node-based-image-processor\build"

# Include any dependencies generated for this target.
include CMakeFiles\node-based-image-processor.dir\depend.make
# Include any dependencies generated by the compiler for this target.
include CMakeFiles\node-based-image-processor.dir\compiler_depend.make

# Include the progress variables for this target.
include CMakeFiles\node-based-image-processor.dir\progress.make

# Include the compile flags for this target's objects.
include CMakeFiles\node-based-image-processor.dir\flags.make

CMakeFiles\node-based-image-processor.dir\codegen:
.PHONY : CMakeFiles\node-based-image-processor.dir\codegen

CMakeFiles\node-based-image-processor.dir\src\main.cpp.obj: CMakeFiles\node-based-image-processor.dir\flags.make
CMakeFiles\node-based-image-processor.dir\src\main.cpp.obj: "D:\Github Repos\node-based-image-processor\src\main.cpp"
CMakeFiles\node-based-image-processor.dir\src\main.cpp.obj: CMakeFiles\node-based-image-processor.dir\compiler_depend.ts
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --green --progress-dir="D:\Github Repos\node-based-image-processor\build\CMakeFiles" --progress-num=$(CMAKE_PROGRESS_1) "Building CXX object CMakeFiles/node-based-image-processor.dir/src/main.cpp.obj"
	$(CMAKE_COMMAND) -E cmake_cl_compile_depends --dep-file=CMakeFiles\node-based-image-processor.dir\src\main.cpp.obj.d --working-dir="D:\Github Repos\node-based-image-processor\build" --filter-prefix="Note: including file: " -- C:\PROGRA~2\MICROS~3\2019\BUILDT~1\VC\Tools\MSVC\1429~1.301\bin\Hostx86\x86\cl.exe @<<
 /nologo /TP $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) /showIncludes /FoCMakeFiles\node-based-image-processor.dir\src\main.cpp.obj /FdCMakeFiles\node-based-image-processor.dir\ /FS -c "D:\Github Repos\node-based-image-processor\src\main.cpp"
<<

CMakeFiles\node-based-image-processor.dir\src\main.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --green "Preprocessing CXX source to CMakeFiles/node-based-image-processor.dir/src/main.cpp.i"
	C:\PROGRA~2\MICROS~3\2019\BUILDT~1\VC\Tools\MSVC\1429~1.301\bin\Hostx86\x86\cl.exe > CMakeFiles\node-based-image-processor.dir\src\main.cpp.i @<<
 /nologo /TP $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E "D:\Github Repos\node-based-image-processor\src\main.cpp"
<<

CMakeFiles\node-based-image-processor.dir\src\main.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --green "Compiling CXX source to assembly CMakeFiles/node-based-image-processor.dir/src/main.cpp.s"
	C:\PROGRA~2\MICROS~3\2019\BUILDT~1\VC\Tools\MSVC\1429~1.301\bin\Hostx86\x86\cl.exe @<<
 /nologo /TP $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) /FoNUL /FAs /FaCMakeFiles\node-based-image-processor.dir\src\main.cpp.s /c "D:\Github Repos\node-based-image-processor\src\main.cpp"
<<

CMakeFiles\node-based-image-processor.dir\src\gui.cpp.obj: CMakeFiles\node-based-image-processor.dir\flags.make
CMakeFiles\node-based-image-processor.dir\src\gui.cpp.obj: "D:\Github Repos\node-based-image-processor\src\gui.cpp"
CMakeFiles\node-based-image-processor.dir\src\gui.cpp.obj: CMakeFiles\node-based-image-processor.dir\compiler_depend.ts
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --green --progress-dir="D:\Github Repos\node-based-image-processor\build\CMakeFiles" --progress-num=$(CMAKE_PROGRESS_2) "Building CXX object CMakeFiles/node-based-image-processor.dir/src/gui.cpp.obj"
	$(CMAKE_COMMAND) -E cmake_cl_compile_depends --dep-file=CMakeFiles\node-based-image-processor.dir\src\gui.cpp.obj.d --working-dir="D:\Github Repos\node-based-image-processor\build" --filter-prefix="Note: including file: " -- C:\PROGRA~2\MICROS~3\2019\BUILDT~1\VC\Tools\MSVC\1429~1.301\bin\Hostx86\x86\cl.exe @<<
 /nologo /TP $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) /showIncludes /FoCMakeFiles\node-based-image-processor.dir\src\gui.cpp.obj /FdCMakeFiles\node-based-image-processor.dir\ /FS -c "D:\Github Repos\node-based-image-processor\src\gui.cpp"
<<

CMakeFiles\node-based-image-processor.dir\src\gui.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --green "Preprocessing CXX source to CMakeFiles/node-based-image-processor.dir/src/gui.cpp.i"
	C:\PROGRA~2\MICROS~3\2019\BUILDT~1\VC\Tools\MSVC\1429~1.301\bin\Hostx86\x86\cl.exe > CMakeFiles\node-based-image-processor.dir\src\gui.cpp.i @<<
 /nologo /TP $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E "D:\Github Repos\node-based-image-processor\src\gui.cpp"
<<

CMakeFiles\node-based-image-processor.dir\src\gui.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --green "Compiling CXX source to assembly CMakeFiles/node-based-image-processor.dir/src/gui.cpp.s"
	C:\PROGRA~2\MICROS~3\2019\BUILDT~1\VC\Tools\MSVC\1429~1.301\bin\Hostx86\x86\cl.exe @<<
 /nologo /TP $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) /FoNUL /FAs /FaCMakeFiles\node-based-image-processor.dir\src\gui.cpp.s /c "D:\Github Repos\node-based-image-processor\src\gui.cpp"
<<

CMakeFiles\node-based-image-processor.dir\libs\imgui\imgui.cpp.obj: CMakeFiles\node-based-image-processor.dir\flags.make
CMakeFiles\node-based-image-processor.dir\libs\imgui\imgui.cpp.obj: "D:\Github Repos\node-based-image-processor\libs\imgui\imgui.cpp"
CMakeFiles\node-based-image-processor.dir\libs\imgui\imgui.cpp.obj: CMakeFiles\node-based-image-processor.dir\compiler_depend.ts
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --green --progress-dir="D:\Github Repos\node-based-image-processor\build\CMakeFiles" --progress-num=$(CMAKE_PROGRESS_3) "Building CXX object CMakeFiles/node-based-image-processor.dir/libs/imgui/imgui.cpp.obj"
	$(CMAKE_COMMAND) -E cmake_cl_compile_depends --dep-file=CMakeFiles\node-based-image-processor.dir\libs\imgui\imgui.cpp.obj.d --working-dir="D:\Github Repos\node-based-image-processor\build" --filter-prefix="Note: including file: " -- C:\PROGRA~2\MICROS~3\2019\BUILDT~1\VC\Tools\MSVC\1429~1.301\bin\Hostx86\x86\cl.exe @<<
 /nologo /TP $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) /showIncludes /FoCMakeFiles\node-based-image-processor.dir\libs\imgui\imgui.cpp.obj /FdCMakeFiles\node-based-image-processor.dir\ /FS -c "D:\Github Repos\node-based-image-processor\libs\imgui\imgui.cpp"
<<

CMakeFiles\node-based-image-processor.dir\libs\imgui\imgui.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --green "Preprocessing CXX source to CMakeFiles/node-based-image-processor.dir/libs/imgui/imgui.cpp.i"
	C:\PROGRA~2\MICROS~3\2019\BUILDT~1\VC\Tools\MSVC\1429~1.301\bin\Hostx86\x86\cl.exe > CMakeFiles\node-based-image-processor.dir\libs\imgui\imgui.cpp.i @<<
 /nologo /TP $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E "D:\Github Repos\node-based-image-processor\libs\imgui\imgui.cpp"
<<

CMakeFiles\node-based-image-processor.dir\libs\imgui\imgui.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --green "Compiling CXX source to assembly CMakeFiles/node-based-image-processor.dir/libs/imgui/imgui.cpp.s"
	C:\PROGRA~2\MICROS~3\2019\BUILDT~1\VC\Tools\MSVC\1429~1.301\bin\Hostx86\x86\cl.exe @<<
 /nologo /TP $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) /FoNUL /FAs /FaCMakeFiles\node-based-image-processor.dir\libs\imgui\imgui.cpp.s /c "D:\Github Repos\node-based-image-processor\libs\imgui\imgui.cpp"
<<

CMakeFiles\node-based-image-processor.dir\libs\imgui\imgui_draw.cpp.obj: CMakeFiles\node-based-image-processor.dir\flags.make
CMakeFiles\node-based-image-processor.dir\libs\imgui\imgui_draw.cpp.obj: "D:\Github Repos\node-based-image-processor\libs\imgui\imgui_draw.cpp"
CMakeFiles\node-based-image-processor.dir\libs\imgui\imgui_draw.cpp.obj: CMakeFiles\node-based-image-processor.dir\compiler_depend.ts
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --green --progress-dir="D:\Github Repos\node-based-image-processor\build\CMakeFiles" --progress-num=$(CMAKE_PROGRESS_4) "Building CXX object CMakeFiles/node-based-image-processor.dir/libs/imgui/imgui_draw.cpp.obj"
	$(CMAKE_COMMAND) -E cmake_cl_compile_depends --dep-file=CMakeFiles\node-based-image-processor.dir\libs\imgui\imgui_draw.cpp.obj.d --working-dir="D:\Github Repos\node-based-image-processor\build" --filter-prefix="Note: including file: " -- C:\PROGRA~2\MICROS~3\2019\BUILDT~1\VC\Tools\MSVC\1429~1.301\bin\Hostx86\x86\cl.exe @<<
 /nologo /TP $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) /showIncludes /FoCMakeFiles\node-based-image-processor.dir\libs\imgui\imgui_draw.cpp.obj /FdCMakeFiles\node-based-image-processor.dir\ /FS -c "D:\Github Repos\node-based-image-processor\libs\imgui\imgui_draw.cpp"
<<

CMakeFiles\node-based-image-processor.dir\libs\imgui\imgui_draw.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --green "Preprocessing CXX source to CMakeFiles/node-based-image-processor.dir/libs/imgui/imgui_draw.cpp.i"
	C:\PROGRA~2\MICROS~3\2019\BUILDT~1\VC\Tools\MSVC\1429~1.301\bin\Hostx86\x86\cl.exe > CMakeFiles\node-based-image-processor.dir\libs\imgui\imgui_draw.cpp.i @<<
 /nologo /TP $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E "D:\Github Repos\node-based-image-processor\libs\imgui\imgui_draw.cpp"
<<

CMakeFiles\node-based-image-processor.dir\libs\imgui\imgui_draw.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --green "Compiling CXX source to assembly CMakeFiles/node-based-image-processor.dir/libs/imgui/imgui_draw.cpp.s"
	C:\PROGRA~2\MICROS~3\2019\BUILDT~1\VC\Tools\MSVC\1429~1.301\bin\Hostx86\x86\cl.exe @<<
 /nologo /TP $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) /FoNUL /FAs /FaCMakeFiles\node-based-image-processor.dir\libs\imgui\imgui_draw.cpp.s /c "D:\Github Repos\node-based-image-processor\libs\imgui\imgui_draw.cpp"
<<

CMakeFiles\node-based-image-processor.dir\libs\imgui\imgui_tables.cpp.obj: CMakeFiles\node-based-image-processor.dir\flags.make
CMakeFiles\node-based-image-processor.dir\libs\imgui\imgui_tables.cpp.obj: "D:\Github Repos\node-based-image-processor\libs\imgui\imgui_tables.cpp"
CMakeFiles\node-based-image-processor.dir\libs\imgui\imgui_tables.cpp.obj: CMakeFiles\node-based-image-processor.dir\compiler_depend.ts
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --green --progress-dir="D:\Github Repos\node-based-image-processor\build\CMakeFiles" --progress-num=$(CMAKE_PROGRESS_5) "Building CXX object CMakeFiles/node-based-image-processor.dir/libs/imgui/imgui_tables.cpp.obj"
	$(CMAKE_COMMAND) -E cmake_cl_compile_depends --dep-file=CMakeFiles\node-based-image-processor.dir\libs\imgui\imgui_tables.cpp.obj.d --working-dir="D:\Github Repos\node-based-image-processor\build" --filter-prefix="Note: including file: " -- C:\PROGRA~2\MICROS~3\2019\BUILDT~1\VC\Tools\MSVC\1429~1.301\bin\Hostx86\x86\cl.exe @<<
 /nologo /TP $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) /showIncludes /FoCMakeFiles\node-based-image-processor.dir\libs\imgui\imgui_tables.cpp.obj /FdCMakeFiles\node-based-image-processor.dir\ /FS -c "D:\Github Repos\node-based-image-processor\libs\imgui\imgui_tables.cpp"
<<

CMakeFiles\node-based-image-processor.dir\libs\imgui\imgui_tables.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --green "Preprocessing CXX source to CMakeFiles/node-based-image-processor.dir/libs/imgui/imgui_tables.cpp.i"
	C:\PROGRA~2\MICROS~3\2019\BUILDT~1\VC\Tools\MSVC\1429~1.301\bin\Hostx86\x86\cl.exe > CMakeFiles\node-based-image-processor.dir\libs\imgui\imgui_tables.cpp.i @<<
 /nologo /TP $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E "D:\Github Repos\node-based-image-processor\libs\imgui\imgui_tables.cpp"
<<

CMakeFiles\node-based-image-processor.dir\libs\imgui\imgui_tables.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --green "Compiling CXX source to assembly CMakeFiles/node-based-image-processor.dir/libs/imgui/imgui_tables.cpp.s"
	C:\PROGRA~2\MICROS~3\2019\BUILDT~1\VC\Tools\MSVC\1429~1.301\bin\Hostx86\x86\cl.exe @<<
 /nologo /TP $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) /FoNUL /FAs /FaCMakeFiles\node-based-image-processor.dir\libs\imgui\imgui_tables.cpp.s /c "D:\Github Repos\node-based-image-processor\libs\imgui\imgui_tables.cpp"
<<

CMakeFiles\node-based-image-processor.dir\libs\imgui\imgui_widgets.cpp.obj: CMakeFiles\node-based-image-processor.dir\flags.make
CMakeFiles\node-based-image-processor.dir\libs\imgui\imgui_widgets.cpp.obj: "D:\Github Repos\node-based-image-processor\libs\imgui\imgui_widgets.cpp"
CMakeFiles\node-based-image-processor.dir\libs\imgui\imgui_widgets.cpp.obj: CMakeFiles\node-based-image-processor.dir\compiler_depend.ts
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --green --progress-dir="D:\Github Repos\node-based-image-processor\build\CMakeFiles" --progress-num=$(CMAKE_PROGRESS_6) "Building CXX object CMakeFiles/node-based-image-processor.dir/libs/imgui/imgui_widgets.cpp.obj"
	$(CMAKE_COMMAND) -E cmake_cl_compile_depends --dep-file=CMakeFiles\node-based-image-processor.dir\libs\imgui\imgui_widgets.cpp.obj.d --working-dir="D:\Github Repos\node-based-image-processor\build" --filter-prefix="Note: including file: " -- C:\PROGRA~2\MICROS~3\2019\BUILDT~1\VC\Tools\MSVC\1429~1.301\bin\Hostx86\x86\cl.exe @<<
 /nologo /TP $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) /showIncludes /FoCMakeFiles\node-based-image-processor.dir\libs\imgui\imgui_widgets.cpp.obj /FdCMakeFiles\node-based-image-processor.dir\ /FS -c "D:\Github Repos\node-based-image-processor\libs\imgui\imgui_widgets.cpp"
<<

CMakeFiles\node-based-image-processor.dir\libs\imgui\imgui_widgets.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --green "Preprocessing CXX source to CMakeFiles/node-based-image-processor.dir/libs/imgui/imgui_widgets.cpp.i"
	C:\PROGRA~2\MICROS~3\2019\BUILDT~1\VC\Tools\MSVC\1429~1.301\bin\Hostx86\x86\cl.exe > CMakeFiles\node-based-image-processor.dir\libs\imgui\imgui_widgets.cpp.i @<<
 /nologo /TP $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E "D:\Github Repos\node-based-image-processor\libs\imgui\imgui_widgets.cpp"
<<

CMakeFiles\node-based-image-processor.dir\libs\imgui\imgui_widgets.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --green "Compiling CXX source to assembly CMakeFiles/node-based-image-processor.dir/libs/imgui/imgui_widgets.cpp.s"
	C:\PROGRA~2\MICROS~3\2019\BUILDT~1\VC\Tools\MSVC\1429~1.301\bin\Hostx86\x86\cl.exe @<<
 /nologo /TP $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) /FoNUL /FAs /FaCMakeFiles\node-based-image-processor.dir\libs\imgui\imgui_widgets.cpp.s /c "D:\Github Repos\node-based-image-processor\libs\imgui\imgui_widgets.cpp"
<<

CMakeFiles\node-based-image-processor.dir\libs\imgui\imgui_demo.cpp.obj: CMakeFiles\node-based-image-processor.dir\flags.make
CMakeFiles\node-based-image-processor.dir\libs\imgui\imgui_demo.cpp.obj: "D:\Github Repos\node-based-image-processor\libs\imgui\imgui_demo.cpp"
CMakeFiles\node-based-image-processor.dir\libs\imgui\imgui_demo.cpp.obj: CMakeFiles\node-based-image-processor.dir\compiler_depend.ts
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --green --progress-dir="D:\Github Repos\node-based-image-processor\build\CMakeFiles" --progress-num=$(CMAKE_PROGRESS_7) "Building CXX object CMakeFiles/node-based-image-processor.dir/libs/imgui/imgui_demo.cpp.obj"
	$(CMAKE_COMMAND) -E cmake_cl_compile_depends --dep-file=CMakeFiles\node-based-image-processor.dir\libs\imgui\imgui_demo.cpp.obj.d --working-dir="D:\Github Repos\node-based-image-processor\build" --filter-prefix="Note: including file: " -- C:\PROGRA~2\MICROS~3\2019\BUILDT~1\VC\Tools\MSVC\1429~1.301\bin\Hostx86\x86\cl.exe @<<
 /nologo /TP $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) /showIncludes /FoCMakeFiles\node-based-image-processor.dir\libs\imgui\imgui_demo.cpp.obj /FdCMakeFiles\node-based-image-processor.dir\ /FS -c "D:\Github Repos\node-based-image-processor\libs\imgui\imgui_demo.cpp"
<<

CMakeFiles\node-based-image-processor.dir\libs\imgui\imgui_demo.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --green "Preprocessing CXX source to CMakeFiles/node-based-image-processor.dir/libs/imgui/imgui_demo.cpp.i"
	C:\PROGRA~2\MICROS~3\2019\BUILDT~1\VC\Tools\MSVC\1429~1.301\bin\Hostx86\x86\cl.exe > CMakeFiles\node-based-image-processor.dir\libs\imgui\imgui_demo.cpp.i @<<
 /nologo /TP $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E "D:\Github Repos\node-based-image-processor\libs\imgui\imgui_demo.cpp"
<<

CMakeFiles\node-based-image-processor.dir\libs\imgui\imgui_demo.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --green "Compiling CXX source to assembly CMakeFiles/node-based-image-processor.dir/libs/imgui/imgui_demo.cpp.s"
	C:\PROGRA~2\MICROS~3\2019\BUILDT~1\VC\Tools\MSVC\1429~1.301\bin\Hostx86\x86\cl.exe @<<
 /nologo /TP $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) /FoNUL /FAs /FaCMakeFiles\node-based-image-processor.dir\libs\imgui\imgui_demo.cpp.s /c "D:\Github Repos\node-based-image-processor\libs\imgui\imgui_demo.cpp"
<<

CMakeFiles\node-based-image-processor.dir\libs\imgui\backends\imgui_impl_dx11.cpp.obj: CMakeFiles\node-based-image-processor.dir\flags.make
CMakeFiles\node-based-image-processor.dir\libs\imgui\backends\imgui_impl_dx11.cpp.obj: "D:\Github Repos\node-based-image-processor\libs\imgui\backends\imgui_impl_dx11.cpp"
CMakeFiles\node-based-image-processor.dir\libs\imgui\backends\imgui_impl_dx11.cpp.obj: CMakeFiles\node-based-image-processor.dir\compiler_depend.ts
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --green --progress-dir="D:\Github Repos\node-based-image-processor\build\CMakeFiles" --progress-num=$(CMAKE_PROGRESS_8) "Building CXX object CMakeFiles/node-based-image-processor.dir/libs/imgui/backends/imgui_impl_dx11.cpp.obj"
	$(CMAKE_COMMAND) -E cmake_cl_compile_depends --dep-file=CMakeFiles\node-based-image-processor.dir\libs\imgui\backends\imgui_impl_dx11.cpp.obj.d --working-dir="D:\Github Repos\node-based-image-processor\build" --filter-prefix="Note: including file: " -- C:\PROGRA~2\MICROS~3\2019\BUILDT~1\VC\Tools\MSVC\1429~1.301\bin\Hostx86\x86\cl.exe @<<
 /nologo /TP $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) /showIncludes /FoCMakeFiles\node-based-image-processor.dir\libs\imgui\backends\imgui_impl_dx11.cpp.obj /FdCMakeFiles\node-based-image-processor.dir\ /FS -c "D:\Github Repos\node-based-image-processor\libs\imgui\backends\imgui_impl_dx11.cpp"
<<

CMakeFiles\node-based-image-processor.dir\libs\imgui\backends\imgui_impl_dx11.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --green "Preprocessing CXX source to CMakeFiles/node-based-image-processor.dir/libs/imgui/backends/imgui_impl_dx11.cpp.i"
	C:\PROGRA~2\MICROS~3\2019\BUILDT~1\VC\Tools\MSVC\1429~1.301\bin\Hostx86\x86\cl.exe > CMakeFiles\node-based-image-processor.dir\libs\imgui\backends\imgui_impl_dx11.cpp.i @<<
 /nologo /TP $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E "D:\Github Repos\node-based-image-processor\libs\imgui\backends\imgui_impl_dx11.cpp"
<<

CMakeFiles\node-based-image-processor.dir\libs\imgui\backends\imgui_impl_dx11.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --green "Compiling CXX source to assembly CMakeFiles/node-based-image-processor.dir/libs/imgui/backends/imgui_impl_dx11.cpp.s"
	C:\PROGRA~2\MICROS~3\2019\BUILDT~1\VC\Tools\MSVC\1429~1.301\bin\Hostx86\x86\cl.exe @<<
 /nologo /TP $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) /FoNUL /FAs /FaCMakeFiles\node-based-image-processor.dir\libs\imgui\backends\imgui_impl_dx11.cpp.s /c "D:\Github Repos\node-based-image-processor\libs\imgui\backends\imgui_impl_dx11.cpp"
<<

CMakeFiles\node-based-image-processor.dir\libs\imgui\backends\imgui_impl_win32.cpp.obj: CMakeFiles\node-based-image-processor.dir\flags.make
CMakeFiles\node-based-image-processor.dir\libs\imgui\backends\imgui_impl_win32.cpp.obj: "D:\Github Repos\node-based-image-processor\libs\imgui\backends\imgui_impl_win32.cpp"
CMakeFiles\node-based-image-processor.dir\libs\imgui\backends\imgui_impl_win32.cpp.obj: CMakeFiles\node-based-image-processor.dir\compiler_depend.ts
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --green --progress-dir="D:\Github Repos\node-based-image-processor\build\CMakeFiles" --progress-num=$(CMAKE_PROGRESS_9) "Building CXX object CMakeFiles/node-based-image-processor.dir/libs/imgui/backends/imgui_impl_win32.cpp.obj"
	$(CMAKE_COMMAND) -E cmake_cl_compile_depends --dep-file=CMakeFiles\node-based-image-processor.dir\libs\imgui\backends\imgui_impl_win32.cpp.obj.d --working-dir="D:\Github Repos\node-based-image-processor\build" --filter-prefix="Note: including file: " -- C:\PROGRA~2\MICROS~3\2019\BUILDT~1\VC\Tools\MSVC\1429~1.301\bin\Hostx86\x86\cl.exe @<<
 /nologo /TP $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) /showIncludes /FoCMakeFiles\node-based-image-processor.dir\libs\imgui\backends\imgui_impl_win32.cpp.obj /FdCMakeFiles\node-based-image-processor.dir\ /FS -c "D:\Github Repos\node-based-image-processor\libs\imgui\backends\imgui_impl_win32.cpp"
<<

CMakeFiles\node-based-image-processor.dir\libs\imgui\backends\imgui_impl_win32.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --green "Preprocessing CXX source to CMakeFiles/node-based-image-processor.dir/libs/imgui/backends/imgui_impl_win32.cpp.i"
	C:\PROGRA~2\MICROS~3\2019\BUILDT~1\VC\Tools\MSVC\1429~1.301\bin\Hostx86\x86\cl.exe > CMakeFiles\node-based-image-processor.dir\libs\imgui\backends\imgui_impl_win32.cpp.i @<<
 /nologo /TP $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E "D:\Github Repos\node-based-image-processor\libs\imgui\backends\imgui_impl_win32.cpp"
<<

CMakeFiles\node-based-image-processor.dir\libs\imgui\backends\imgui_impl_win32.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --green "Compiling CXX source to assembly CMakeFiles/node-based-image-processor.dir/libs/imgui/backends/imgui_impl_win32.cpp.s"
	C:\PROGRA~2\MICROS~3\2019\BUILDT~1\VC\Tools\MSVC\1429~1.301\bin\Hostx86\x86\cl.exe @<<
 /nologo /TP $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) /FoNUL /FAs /FaCMakeFiles\node-based-image-processor.dir\libs\imgui\backends\imgui_impl_win32.cpp.s /c "D:\Github Repos\node-based-image-processor\libs\imgui\backends\imgui_impl_win32.cpp"
<<

# Object files for target node-based-image-processor
node__based__image__processor_OBJECTS = \
"CMakeFiles\node-based-image-processor.dir\src\main.cpp.obj" \
"CMakeFiles\node-based-image-processor.dir\src\gui.cpp.obj" \
"CMakeFiles\node-based-image-processor.dir\libs\imgui\imgui.cpp.obj" \
"CMakeFiles\node-based-image-processor.dir\libs\imgui\imgui_draw.cpp.obj" \
"CMakeFiles\node-based-image-processor.dir\libs\imgui\imgui_tables.cpp.obj" \
"CMakeFiles\node-based-image-processor.dir\libs\imgui\imgui_widgets.cpp.obj" \
"CMakeFiles\node-based-image-processor.dir\libs\imgui\imgui_demo.cpp.obj" \
"CMakeFiles\node-based-image-processor.dir\libs\imgui\backends\imgui_impl_dx11.cpp.obj" \
"CMakeFiles\node-based-image-processor.dir\libs\imgui\backends\imgui_impl_win32.cpp.obj"

# External object files for target node-based-image-processor
node__based__image__processor_EXTERNAL_OBJECTS =

node-based-image-processor.exe: CMakeFiles\node-based-image-processor.dir\src\main.cpp.obj
node-based-image-processor.exe: CMakeFiles\node-based-image-processor.dir\src\gui.cpp.obj
node-based-image-processor.exe: CMakeFiles\node-based-image-processor.dir\libs\imgui\imgui.cpp.obj
node-based-image-processor.exe: CMakeFiles\node-based-image-processor.dir\libs\imgui\imgui_draw.cpp.obj
node-based-image-processor.exe: CMakeFiles\node-based-image-processor.dir\libs\imgui\imgui_tables.cpp.obj
node-based-image-processor.exe: CMakeFiles\node-based-image-processor.dir\libs\imgui\imgui_widgets.cpp.obj
node-based-image-processor.exe: CMakeFiles\node-based-image-processor.dir\libs\imgui\imgui_demo.cpp.obj
node-based-image-processor.exe: CMakeFiles\node-based-image-processor.dir\libs\imgui\backends\imgui_impl_dx11.cpp.obj
node-based-image-processor.exe: CMakeFiles\node-based-image-processor.dir\libs\imgui\backends\imgui_impl_win32.cpp.obj
node-based-image-processor.exe: CMakeFiles\node-based-image-processor.dir\build.make
node-based-image-processor.exe: D:\vcpkg\installed\x86-windows\lib\opencv_calib3d4.lib
node-based-image-processor.exe: D:\vcpkg\installed\x86-windows\lib\opencv_core4.lib
node-based-image-processor.exe: D:\vcpkg\installed\x86-windows\lib\opencv_dnn4.lib
node-based-image-processor.exe: D:\vcpkg\installed\x86-windows\lib\opencv_features2d4.lib
node-based-image-processor.exe: D:\vcpkg\installed\x86-windows\lib\opencv_flann4.lib
node-based-image-processor.exe: D:\vcpkg\installed\x86-windows\lib\opencv_highgui4.lib
node-based-image-processor.exe: D:\vcpkg\installed\x86-windows\lib\opencv_imgcodecs4.lib
node-based-image-processor.exe: D:\vcpkg\installed\x86-windows\lib\opencv_imgproc4.lib
node-based-image-processor.exe: D:\vcpkg\installed\x86-windows\lib\opencv_ml4.lib
node-based-image-processor.exe: D:\vcpkg\installed\x86-windows\lib\opencv_objdetect4.lib
node-based-image-processor.exe: D:\vcpkg\installed\x86-windows\lib\opencv_photo4.lib
node-based-image-processor.exe: D:\vcpkg\installed\x86-windows\lib\opencv_stitching4.lib
node-based-image-processor.exe: D:\vcpkg\installed\x86-windows\lib\opencv_video4.lib
node-based-image-processor.exe: D:\vcpkg\installed\x86-windows\lib\opencv_videoio4.lib
node-based-image-processor.exe: D:\vcpkg\installed\x86-windows\lib\libprotobuf.lib
node-based-image-processor.exe: D:\vcpkg\installed\x86-windows\lib\libprotobuf-lite.lib
node-based-image-processor.exe: D:\vcpkg\installed\x86-windows\lib\libprotoc.lib
node-based-image-processor.exe: CMakeFiles\node-based-image-processor.dir\objects1.rsp
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --green --bold --progress-dir="D:\Github Repos\node-based-image-processor\build\CMakeFiles" --progress-num=$(CMAKE_PROGRESS_10) "Linking CXX executable node-based-image-processor.exe"
	D:\Softwares\bin\cmake.exe -E vs_link_exe --msvc-ver=1929 --intdir=CMakeFiles\node-based-image-processor.dir --rc=C:\PROGRA~2\WI3CF2~1\10\bin\100190~1.0\x86\rc.exe --mt=C:\PROGRA~2\WI3CF2~1\10\bin\100190~1.0\x86\mt.exe --manifests -- C:\PROGRA~2\MICROS~3\2019\BUILDT~1\VC\Tools\MSVC\1429~1.301\bin\Hostx86\x86\link.exe /nologo @CMakeFiles\node-based-image-processor.dir\objects1.rsp @<<
 /out:node-based-image-processor.exe /implib:node-based-image-processor.lib /pdb:"D:\Github Repos\node-based-image-processor\build\node-based-image-processor.pdb" /version:0.0 /machine:X86 /INCREMENTAL:NO /subsystem:windows  D:\vcpkg\installed\x86-windows\lib\opencv_calib3d4.lib D:\vcpkg\installed\x86-windows\lib\opencv_core4.lib D:\vcpkg\installed\x86-windows\lib\opencv_dnn4.lib D:\vcpkg\installed\x86-windows\lib\opencv_features2d4.lib D:\vcpkg\installed\x86-windows\lib\opencv_flann4.lib D:\vcpkg\installed\x86-windows\lib\opencv_highgui4.lib D:\vcpkg\installed\x86-windows\lib\opencv_imgcodecs4.lib D:\vcpkg\installed\x86-windows\lib\opencv_imgproc4.lib D:\vcpkg\installed\x86-windows\lib\opencv_ml4.lib D:\vcpkg\installed\x86-windows\lib\opencv_objdetect4.lib D:\vcpkg\installed\x86-windows\lib\opencv_photo4.lib D:\vcpkg\installed\x86-windows\lib\opencv_stitching4.lib D:\vcpkg\installed\x86-windows\lib\opencv_video4.lib D:\vcpkg\installed\x86-windows\lib\opencv_videoio4.lib D:\vcpkg\installed\x86-windows\lib\libprotobuf.lib D:\vcpkg\installed\x86-windows\lib\libprotobuf-lite.lib D:\vcpkg\installed\x86-windows\lib\libprotoc.lib d3d11.lib kernel32.lib user32.lib gdi32.lib winspool.lib shell32.lib ole32.lib oleaut32.lib uuid.lib comdlg32.lib advapi32.lib 
<<
	C:\Windows\System32\WindowsPowerShell\v1.0\powershell.exe -noprofile -executionpolicy Bypass -file D:/vcpkg/scripts/buildsystems/msbuild/applocal.ps1 -targetBinary "D:/Github Repos/node-based-image-processor/build/node-based-image-processor.exe" -installedDir D:/vcpkg/installed/x86-windows/bin -OutVariable out

# Rule to build all files generated by this target.
CMakeFiles\node-based-image-processor.dir\build: node-based-image-processor.exe
.PHONY : CMakeFiles\node-based-image-processor.dir\build

CMakeFiles\node-based-image-processor.dir\clean:
	$(CMAKE_COMMAND) -P CMakeFiles\node-based-image-processor.dir\cmake_clean.cmake
.PHONY : CMakeFiles\node-based-image-processor.dir\clean

CMakeFiles\node-based-image-processor.dir\depend:
	$(CMAKE_COMMAND) -E cmake_depends "NMake Makefiles" "D:\Github Repos\node-based-image-processor" "D:\Github Repos\node-based-image-processor" "D:\Github Repos\node-based-image-processor\build" "D:\Github Repos\node-based-image-processor\build" "D:\Github Repos\node-based-image-processor\build\CMakeFiles\node-based-image-processor.dir\DependInfo.cmake" "--color=$(COLOR)"
.PHONY : CMakeFiles\node-based-image-processor.dir\depend

