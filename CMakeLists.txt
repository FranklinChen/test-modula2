cmake_minimum_required(VERSION 3.10)

project(hello)

find_program(GM2_COMPILER gm2)

set_source_files_properties(hello.mod PROPERTIES LANGUAGE Modula-2)

add_executable(hello hello.mod)
