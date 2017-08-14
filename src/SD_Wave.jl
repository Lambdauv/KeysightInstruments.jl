##### SD_Wave Functions
## new
"""
This function creates a waveform object from data points contained in an array
in memory.
"""
SD_Wave_newFromArrayDouble(waveformType::Int, waveformPoints::Int,
    waveformDataA::Array{Float64}, waveformDataB::Array{Float64}=0) =
    ccall((:SD_Wave_newFromArrayDouble, lib), Cint,
        (Cint, Cint, Ref{Cdouble}, Ref{Cdouble}),
        waveformType, waveformPoints, waveformDataA, waveformDataB)

"""
This function creates a waveform object from data points contained in an array
in a file.
"""

SD_Wave_newFromFile(waveformFile::String) =
    ccall((:SD_Wave_newFromFile, lib), Cint, (Cstring,), waveformFile)

## delete
"""
This function removes a waveform created with the function.
"""
SD_Wave_delete(waveformID::Int) =
    ccall((:SD_Wave_delete, lib), Cint, (Cint,), waveformID)
