# FindUUID.cmake
#
# Finds the UUID library.
#
# This will define the following variables
#
#    UUID_FOUND
#    UUID_INCLUDE_DIRS
#    UUID_LIBRARIES
#
# and the following imported targets
#
#    UUID::uuid
#
# Author: Steff Lukas <steff.lukas@luossfi.org>

find_path(UUID_INCLUDE_DIR
          NAMES uuid/uuid.h)
mark_as_advanced(UUID_INCLUDE_DIR)

find_library(UUID_LIBRARY
             NAMES uuid)
mark_as_advanced(UUID_LIBRARY)

include(FindPackageHandleStandardArgs)
find_package_handle_standard_args(uuid
                                  FOUND_VAR UUID_FOUND
                                  REQUIRED_VARS UUID_LIBRARY UUID_INCLUDE_DIR)

if (UUID_FOUND)
  set(UUID_LIBRARIES ${UUID_LIBRARY})
  set(UUID_INCLUDE_DIRS ${UUID_INCLUDE_DIRS})

  if (NOT TARGET UUID::uuid)
    add_library(UUID::uuid UNKNOWN IMPORTED)
    set_target_properties(UUID::uuid PROPERTIES
                          INTERFACE_INCLUDE_DIRECTORIES "${UUID_INCLUDE_DIRS}"
                          IMPORTED_LINK_INTERFACE_LANGUAGES "C"
                          IMPORTED_LOCATION "${UUID_LIBRARY}")
  endif ()
endif ()
