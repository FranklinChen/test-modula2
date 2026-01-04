# Test using Modula-2 via GCC's gm2

[![CI](https://github.com/FranklinChen/test-modula2/actions/workflows/ci.yml/badge.svg)](https://github.com/FranklinChen/test-modula2/actions/workflows/ci.yml)

Make sure a recent version of `gcc` (say, 13 and higher) is installed, along with `gm2`.

## Installation by Platform

### Linux (Ubuntu)
```bash
sudo apt-get install gm2
```

### macOS
**Using MacPorts (required for full functionality)**
```bash
# Install MacPorts first from https://www.macports.org/install.php
# Then install gcc which includes gm2
sudo port install gcc15 +gm2
```

Note: Homebrew's gcc does not include gm2 support. Our CI system uses MacPorts to install gm2 on macOS.

I only know how to do this on Linux and macOS, but not on Windows.

Then run:

```
cmake -S . -B build
cmake --build build
build/hello
```
