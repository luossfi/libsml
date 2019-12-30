cmake_minimum_required(VERSION 3.15)
project(libSML VERSION 1.0.0 LANGUAGES C)

# -- Options --
option(USE_UUID "use UUID lib for generating message ids (def = on)" ON)
option(BUILD_SHARED_LIBS "build shared libraries instead of static (def = off)" OFF)
option(BUILD_TESTS "build unit tests (default = on)" ON)
option(BUILD_EXAMPLES "build examples (default = on)" ON)

# -- Modules --
set(CMAKE_MODULE_PATH "${CMAKE_SOURCE_DIR}/cmake")
include(GNUInstallDirs)

# -- UUID Library --
if (USE_UUID)
  include(FindUUID)
  if (NOT UUID_FOUND)
    set(USE_UUID OFF)
    message("uuid library not found on the system, building without it.")
  endif ()
endif ()

# -- SML Library --
add_subdirectory(sml)

# -- glibc Math Library (needed by the examples) --
if (BUILD_EXAMPLES)
  include(FindGlibcMath)
  if (NOT GLIBC_MATH_FOUND)
    set(BUILD_EXAMPLES OFF)
    message("glibc math library not found on the system, disabling building the examples.")
  endif ()
endif ()

# -- SML Examples --
if (BUILD_EXAMPLES)
  add_subdirectory(examples)
endif ()

# -- SML Tests --
if (BUILD_TESTS)
  enable_testing()
  add_subdirectory(test)
endif ()
