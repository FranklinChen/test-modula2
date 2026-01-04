cmake_minimum_required(VERSION 3.10)

project(hello)

# Look for gm2 in various possible locations and names
find_program(GM2_COMPILER
  NAMES gm2 gm2-mp-15 gm2-14 gm2-13 gm2-12 gm2-11
  PATHS /opt/local/bin /opt/homebrew/bin /usr/local/bin
  NO_DEFAULT_PATH
)

# If not found in custom paths, look in standard locations
if(NOT GM2_COMPILER)
  find_program(GM2_COMPILER gm2)
endif()

if(NOT GM2_COMPILER)
  message(FATAL_ERROR "gm2 compiler not found. Tried: gm2, gm2-mp-15, gm2-14, gm2-13, gm2-12, gm2-11 in common installation directories")
endif()

set(HELLO_MOD "${CMAKE_CURRENT_SOURCE_DIR}/hello.mod")
set(HELLO_EXE "${CMAKE_CURRENT_BINARY_DIR}/hello")

add_custom_command(
	OUTPUT "${HELLO_EXE}"
	COMMAND "${GM2_COMPILER}" "${HELLO_MOD}" -o "${HELLO_EXE}"
	DEPENDS "${HELLO_MOD}"
)

add_custom_target(everything ALL DEPENDS "${HELLO_EXE}")
