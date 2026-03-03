# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Project Overview

A Modula-2 demo project using GCC's `gm2` compiler, built with CMake. Supports Linux (Ubuntu, Fedora, Arch) and macOS (via MacPorts). Windows is not supported.

## Build Commands

```bash
cmake -S . -B build
cmake --build build
build/hello
build/stackdemo
build/setdemo
build/procdemo
build/variantdemo
```

There is no test framework; verification is running the built executables and checking their output.

## Dependencies

- **CMake** 3.10+
- **GCC gm2** compiler (version 13-15)
- **macOS**: Install via MacPorts (`sudo port install gcc15`). Homebrew's gcc excludes gm2 on macOS Sequoia 15.0+
- **Ubuntu**: `sudo apt-get install gm2`

## Architecture

- `src/hello.mod` — Single-file hello world program
- `src/Stack.def` — Definition module: opaque `Stack` type and procedure signatures
- `src/Stack.mod` — Implementation module: pointer-to-record stack with dynamic memory
- `src/StackDemo.mod` — Program module: demonstrates Stack ADT usage
- `src/SetDemo.mod` — Single-file demo of enumerations, SET types, and CASE statements
- `src/ProcDemo.mod` — Single-file demo of procedure types, procedure variables, and higher-order procedures
- `src/VariantDemo.mod` — Single-file demo of variant records (tagged unions) with CASE dispatch
- `CMakeLists.txt` — Finds gm2 across platform-specific paths, builds five targets: `hello`, `setdemo`, `procdemo`, `variantdemo` (single file), `stackdemo` (separate compilation with .o intermediate)
- `.github/workflows/ci.yml` — CI for Ubuntu and macOS; macOS uses MacPorts via `melusina-org/setup-macports@v1` with config in `macos.yaml`

## Maintaining GCC/gm2 Versions

Version-specific references are spread across multiple files. Use the checklists below when adding or dropping a GCC version.

**How to check for updates:**
- GCC releases: https://gcc.gnu.org/releases.html
- gm2-specific release notes: https://gcc.gnu.org/gcc-NN/changes.html (replace NN with version)
- MacPorts port search: https://ports.macports.org/search/?q=gcc&name=on

**Checklist for adding a new GCC version:**
- `CMakeLists.txt` — add new name to `find_program` NAMES (e.g., `gm2-mp-16`, `gm2-16`)
- `macos.yaml` — update port name (e.g., `gcc15` → `gcc16`) once confirmed working
- `README.md` — update version numbers in "gm2 Platform Status"
- `CLAUDE.md` — update version range in Dependencies
- `.github/workflows/ci.yml` — update any hardcoded GCC version references

**Checklist for dropping an old GCC version:**
- Same files as above; remove old version references
