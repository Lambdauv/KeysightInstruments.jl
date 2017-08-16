# KeysightInstruments
[Keysight](http://www.keysight.com) API wrapper for [Julia](julialang.org),
bare bones.

Adapted from C API by Eun Jong Kim (ekim7206@gmail.com) and Andrew Keller.

## Usage
```jl
Pkg.clone("https://github.com/PainterQubits/KeysightInstruments.jl.git")
using KeysightInstruments
```
## To do
- Complete wrapping functions `DAQbufferPoolConfig` and `DAQbufferGet`
- Load libraries (`*.dll` for windows or `*.so` for linux)
