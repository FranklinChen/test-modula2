cmake_minimum_required(VERSION 3.10)

project(hello)

find_program(GM2_COMPILER gm2)

if(NOT GM2_COMPILER)
  message(FATAL_ERROR "gm2 compiler not found in PATH")
endif()

set(HELLO_MOD "${CMAKE_CURRENT_SOURCE_DIR}/hello.mod")
set(HELLO_EXE "${CMAKE_CURRENT_BINARY_DIR}/hello")

add_custom_command(
	OUTPUT "${HELLO_EXE}"
	COMMAND "${GM2_COMPILER}" "${HELLO_MOD}" -o "${HELLO_EXE}"
	DEPENDS "${HELLO_MOD}"
)

add_custom_target(everything ALL DEPENDS "${HELLO_EXE}")
