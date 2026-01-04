# Test using Modula-2 via GCC's gm2

## Project Overview

This is a simple test project demonstrating the use of Modula-2 programming language through GCC's gm2 compiler. The project contains a basic "Hello World" program written in Modula-2 and uses CMake as the build system to compile and run the program.

The project is designed to work on Linux and macOS systems where GCC with gm2 support is available. It includes CI configuration to test the build on both Ubuntu and macOS platforms.

## Project Structure

- `CMakeLists.txt` - CMake build configuration that locates the gm2 compiler and sets up the build process
- `hello.mod` - The main Modula-2 source file containing a simple "Hello World" program
- `README.md` - Basic instructions for building and running the project
- `.gitignore` - Git ignore rules (ignores the build directory)
- `.github/workflows/ci.yml` - GitHub Actions CI workflow for automated testing

## Building and Running

### Prerequisites
- A recent version of GCC (13 or higher) with gm2 support
- CMake (3.10 or higher)
- On macOS: `brew install gcc`
- On Ubuntu: `sudo apt-get install gm2`

### Build Commands
```bash
cmake -S . -B build
cmake --build build
build/hello
```

### Expected Output
The program should output:
```
hello world
```

## Development Conventions

- The project uses Modula-2 syntax with standard library imports (StrIO for string I/O)
- CMake is used for build configuration and dependency management
- The build artifacts are placed in the `build/` directory which is git-ignored
- CI testing is performed on both Ubuntu and macOS platforms

## Modula-2 Source Code

The `hello.mod` file contains:
```modula2
MODULE hello ;

FROM StrIO IMPORT WriteString, WriteLn ;

BEGIN
   WriteString ('hello world') ; WriteLn
END hello.
```

This is a basic Modula-2 program that imports string I/O functions and outputs "hello world" to the console.