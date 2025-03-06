# Test using Modula-2 via GCC's gm2

[![CI](https://github.com/FranklinChen/test-modula2/actions/workflows/ci.yml/badge.svg)](https://github.com/FranklinChen/test-modula2/actions/workflows/ci.yml)

Make sure a recent version of `gcc` (say, 13 and higher) is installed, along with `gm2`.

```
cmake -S . -B build
cmake --build build
build/hello
```
