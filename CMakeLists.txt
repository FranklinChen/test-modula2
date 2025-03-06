cmake_minimum_required(VERSION 3.10)

project(hello)

find_program(GM2_COMPILER gm2)

if(NOT GM2_COMPILER)
  message(FATAL_ERROR "gm2 compiler not found in PATH")
endif()

add_custom_command(
  OUTPUT hello
  COMMAND ${GM2_COMPILER} hello.mod -o hello
  DEPENDS hello.mod
)

add_custom_target(hello ALL DEPENDS hello)
