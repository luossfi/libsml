# -- SML Examples --
add_executable(sml_server
               sml_server.c)

target_link_libraries(sml_server PRIVATE sml GLIBC::math)

install(TARGETS sml_server
        RUNTIME DESTINATION ${CMAKE_INSTALL_BINDIR})
