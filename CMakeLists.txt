cmake_minimum_required(VERSION 3.10)

project(modula2-demos)

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

set(SRC_DIR "${CMAKE_CURRENT_SOURCE_DIR}/src")

# --- hello (single file) ---

set(HELLO_MOD "${SRC_DIR}/hello.mod")
set(HELLO_EXE "${CMAKE_CURRENT_BINARY_DIR}/hello")

add_custom_command(
	OUTPUT "${HELLO_EXE}"
	COMMAND "${GM2_COMPILER}" "${HELLO_MOD}" -o "${HELLO_EXE}"
	DEPENDS "${HELLO_MOD}"
)

# --- setdemo (single file) ---

set(SETDEMO_MOD "${SRC_DIR}/SetDemo.mod")
set(SETDEMO_EXE "${CMAKE_CURRENT_BINARY_DIR}/setdemo")

add_custom_command(
	OUTPUT "${SETDEMO_EXE}"
	COMMAND "${GM2_COMPILER}" "${SETDEMO_MOD}" -o "${SETDEMO_EXE}"
	DEPENDS "${SETDEMO_MOD}"
)

# --- procdemo (single file) ---

set(PROCDEMO_MOD "${SRC_DIR}/ProcDemo.mod")
set(PROCDEMO_EXE "${CMAKE_CURRENT_BINARY_DIR}/procdemo")

add_custom_command(
	OUTPUT "${PROCDEMO_EXE}"
	COMMAND "${GM2_COMPILER}" "${PROCDEMO_MOD}" -o "${PROCDEMO_EXE}"
	DEPENDS "${PROCDEMO_MOD}"
)

# --- variantdemo (single file) ---

set(VARIANTDEMO_MOD "${SRC_DIR}/VariantDemo.mod")
set(VARIANTDEMO_EXE "${CMAKE_CURRENT_BINARY_DIR}/variantdemo")

add_custom_command(
	OUTPUT "${VARIANTDEMO_EXE}"
	COMMAND "${GM2_COMPILER}" "${VARIANTDEMO_MOD}" -o "${VARIANTDEMO_EXE}"
	DEPENDS "${VARIANTDEMO_MOD}"
)

# --- stackdemo (separate compilation) ---

set(STACK_DEF "${SRC_DIR}/Stack.def")
set(STACK_MOD "${SRC_DIR}/Stack.mod")
set(STACKDEMO_MOD "${SRC_DIR}/StackDemo.mod")
set(STACK_OBJ "${CMAKE_CURRENT_BINARY_DIR}/Stack.o")
set(STACKDEMO_EXE "${CMAKE_CURRENT_BINARY_DIR}/stackdemo")

# Step 1: compile the implementation module to an object file
add_custom_command(
	OUTPUT "${STACK_OBJ}"
	COMMAND "${GM2_COMPILER}" -c -I"${SRC_DIR}" "${STACK_MOD}" -o "${STACK_OBJ}"
	DEPENDS "${STACK_DEF}" "${STACK_MOD}"
)

# Step 2: compile the program module and link with the object file
add_custom_command(
	OUTPUT "${STACKDEMO_EXE}"
	COMMAND "${GM2_COMPILER}" -I"${SRC_DIR}" "${STACKDEMO_MOD}" "${STACK_OBJ}" -o "${STACKDEMO_EXE}"
	DEPENDS "${STACKDEMO_MOD}" "${STACK_OBJ}"
)

add_custom_target(everything ALL
	DEPENDS "${HELLO_EXE}" "${SETDEMO_EXE}" "${PROCDEMO_EXE}" "${VARIANTDEMO_EXE}" "${STACKDEMO_EXE}"
)
