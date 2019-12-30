# FindGlibcMath.cmake
#
# Finds the glibc math (m) library.
#
# This will define the following variables
#
#    GLIBC_MATH_FOUND
#    GLIBC_MATH_INCLUDE_DIRS
#    GLIBC_MATH_LIBRARIES
#
# and the following imported targets
#
#    GLIBC::math
#
# Author: Steff Lukas <steff.lukas@luossfi.org>

find_path(GLIBC_MATH_INCLUDE_DIR
          NAMES math.h)
mark_as_advanced(GLIBC_MATH_INCLUDE_DIR)

find_library(GLIBC_MATH_LIBRARY
             NAMES m)
mark_as_advanced(GLIBC_MATH_LIBRARY)

include(FindPackageHandleStandardArgs)
find_package_handle_standard_args("glibc_math"
                                  FOUND_VAR GLIBC_MATH_FOUND
                                  REQUIRED_VARS GLIBC_MATH_LIBRARY GLIBC_MATH_INCLUDE_DIR)

if (GLIBC_MATH_FOUND)
  set(GLIBC_MATH_LIBRARIES ${GLIBC_MATH_LIBRARY})
  set(GLIBC_MATH_INCLUDE_DIRS ${GLIBC_MATH_INCLUDE_DIRS})

  if (NOT TARGET GLIBC::math)
    add_library(GLIBC::math UNKNOWN IMPORTED)
    set_target_properties(GLIBC::math PROPERTIES
                          INTERFACE_INCLUDE_DIRECTORIES "${GLIBC_MATH_INCLUDE_DIRS}"
                          IMPORTED_LINK_INTERFACE_LANGUAGES "C"
                          IMPORTED_LOCATION "${GLIBC_MATH_LIBRARY}")
  endif ()
endif ()
