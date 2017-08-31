# KeysightInstruments
[Keysight](http://www.keysight.com) API wrapper for [Julia](julialang.org),
bare bones.

Adapted from C API by Eun Jong Kim (ekim7206@gmail.com) and Andrew Keller.
Based on user's guide for [M31XXA/M33XXA Digitizers](http://literature.cdn.keysight.com/litweb/pdf/M3100-90002.pdf?id=2796080)
and [M32XXA/M33XXA AWGs](http://literature.cdn.keysight.com/litweb/pdf/M3201-90001.pdf?id=2787170).

You need to install [Keysight SD1 software](http://www.keysight.com/main/software.jspx?cc=US&lc=eng&nid=-33786.536905585&id=2784055&pageMode=CV) to run this module. (Based on version 2.01.15 released on 2017-08-23)

## Usage
```jl
Pkg.clone("https://github.com/PainterQubits/KeysightInstruments.jl.git")
using KeysightInstruments
```
