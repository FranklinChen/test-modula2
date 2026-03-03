# Modula-2 Demo Programs using GCC gm2

[![CI](https://github.com/FranklinChen/test-modula2/actions/workflows/ci.yml/badge.svg)](https://github.com/FranklinChen/test-modula2/actions/workflows/ci.yml)

Demo programs showcasing Modula-2 features, compiled with GCC's `gm2` front-end and built with CMake.

## License

This project is licensed under the BSD 3-Clause License. See [LICENSE](LICENSE) for details.

## gm2 Platform Status

[gm2](https://gcc.gnu.org/onlinedocs/gm2/) shipped as part of GCC since **GCC 13.1** (April 2023) and is available in GCC 13, 14, and 15, with 16 in development.

### Linux

| Distro | Package | Notes |
|--------|---------|-------|
| **Ubuntu/Debian** | `sudo apt-get install gm2` | Ubuntu 24.04 (noble) has GCC 13-based gm2 |
| **Fedora** | `sudo dnf install gcc-gm2` | |
| **Arch Linux** | `gcc-m2` sub-package | |
| **RHEL/CentOS** | Not available | System GCC is 11, which predates gm2 |

### macOS

| Method | Status | Notes |
|--------|--------|-------|
| **MacPorts** | Works | `gcc14` and `gcc15` both include gm2 by default |
| **Homebrew** | **Broken on Sequoia (15.0+)** | Excluded due to bootstrap build failures ([GCC bug #116378](https://gcc.gnu.org/bugzilla/show_bug.cgi?id=116378)). Works on older macOS versions |

Install via MacPorts:
```bash
# Install MacPorts first from https://www.macports.org/install.php
sudo port install gcc15
```

### Windows

Not supported by this project. Alternative Modula-2 compilers for Windows include [ADW Modula-2](https://www.modula2.org/adwm2/) (free) and [XDS Modula-2](https://www.excelsior-usa.com/xds.html).

### Other Compilers

- **p1 Modula-2** (macOS, commercial) — [p1.co](https://www.p1.co)
- **XDS Modula-2** (Linux, Windows) — [excelsior-usa.com](https://www.excelsior-usa.com/xds.html)
- **ADW Modula-2** (Windows, free) — [modula2.org](https://www.modula2.org/adwm2/)

## Building

Requires CMake 3.10+ and a gm2 compiler.

```bash
cmake -S . -B build
cmake --build build
```

## Demo Programs

### hello — Hello World

A minimal Modula-2 program.

```bash
build/hello
# Output: hello world
```

**File**: `src/hello.mod`

### stackdemo — Stack ADT with Opaque Types

Demonstrates Modula-2's flagship feature: **separate compilation with opaque types**. A `Stack` abstract data type is defined in a definition module, implemented with pointer-to-record in an implementation module, and used from a program module — the client cannot see the internal representation.

```bash
build/stackdemo
# Output:
# Stack demo: push 10, 20, 30 then pop all
#   popped: 30
#   popped: 20
#   popped: 10
# done
```

**Features**: modules, separate compilation, opaque types, data abstraction, dynamic memory (`Storage.ALLOCATE`/`DEALLOCATE`).

**Files**: `src/Stack.def` (definition), `src/Stack.mod` (implementation), `src/StackDemo.mod` (program)

### setdemo — Enumerations and SET Operations

Demonstrates Modula-2's strong typing with enumeration types, first-class SET operations, and CASE statements.

```bash
build/setdemo
```

**Features**: enumeration types, `SET OF` type, set operations (`+` union, `*` intersection, `-` difference, `/` symmetric difference), `IN` membership test, `INCL`/`EXCL` procedures, `CASE` statements, `FOR` loop over enumerations.

**File**: `src/SetDemo.mod`

### procdemo — Procedure Variables

Demonstrates procedure types and procedure variables (first-class procedures). Defines an `IntOp` procedure type, several operations (Double, Square, Negate), and a higher-order `ApplyAndPrint` procedure that applies any `IntOp` to an array.

```bash
build/procdemo
# Output:
# Procedure variable demo
# Original: 1, 2, 3, 4, 5
# Double: 2, 4, 6, 8, 10
# Square: 1, 4, 9, 16, 25
# Negate: -1, -2, -3, -4, -5
```

**Features**: `PROCEDURE` types, procedure variables, passing procedures as arguments, `HIGH` function for open arrays.

**File**: `src/ProcDemo.mod`

### variantdemo — Variant Records

Demonstrates variant records (tagged unions). Defines a `Shape` record with `CASE kind : ShapeKind OF` variants (Circle, Rectangle, Triangle), each with different fields, plus `Describe` and `Perimeter` procedures that dispatch on the tag.

```bash
build/variantdemo
# Output:
# Variant record demo
#
#   Circle with radius 5
#   Perimeter: 30
#   Rectangle 4 x 7
#   Perimeter: 22
#   Triangle with sides 3, 4, 5
#   Perimeter: 12
```

**Features**: variant records, `CASE` tag dispatch, enumeration types, record field access.

**File**: `src/VariantDemo.mod`
