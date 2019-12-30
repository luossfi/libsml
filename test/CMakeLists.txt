# -- Unit Test Framework --
add_library(unity STATIC
            unity/unity.c
            unity/unity_fixture.c)

target_include_directories(unity PUBLIC unity)

# -- SML Unit Tests --
add_executable(sml_unit_tests
               test_main.c
               src/sml_boolean_test.c
               src/sml_buffer_test.c
               src/sml_file_test.c
               src/sml_get_profile_pack_request_test.c
               src/sml_list_test.c
               src/sml_message_test.c
               src/sml_number_test.c
               src/sml_octet_string_test.c
               src/sml_open_request_test.c
               src/sml_status_test.c
               src/sml_time_test.c
               src/sml_tree_test.c
               src/sml_value_test.c
               src/sml_value_test.c
               src/test_helper.c)

target_link_libraries(sml_unit_tests PRIVATE sml unity)

add_test(sml_unit_tests sml_unit_tests)
