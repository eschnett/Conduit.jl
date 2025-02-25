# Conduit.jl: Simplified Data Exchange for HPC Simulations

Conduit.jl is a Julia API for the
[Conduit](https://github.com/LLNL/conduit) project.

* [![Documentation](https://img.shields.io/badge/Docs-Dev-blue.svg)](https://eschnett.github.io/Conduit.jl/dev/)
* [![GitHub
  CI](https://github.com/eschnett/Conduit.jl/workflows/CI/badge.svg)](https://github.com/eschnett/Conduit.jl/actions)
* [![codecov](https://codecov.io/gh/eschnett/Conduit.jl/graph/badge.svg?token=P6DHWYIKNG)](https://codecov.io/gh/eschnett/Conduit.jl)

From the conduit web site:
- Conduit is an open source project from Lawrence Livermore National
  Laboratory that provides an intuitive model for describing
  hierarchical scientific data in C++, C, Fortran, and Python. It is
  used for data coupling between packages in-core, serialization, and
  I/O tasks.

This Julia implementation has a low-level and a high-level interface.
The low-level interface faithfully wraps the Conduit C API, using
pointers etc. The high-level API provides a Julia-esque interface with
Julia arrays, the Julia type system, etc. Most people would use the
high-level interface.
