# SD_Wave Functions for Keysight M32XXA/M33XXA AWGs
export SD_Wave_newFromArrayInteger, SD_Wave_newFromArrayDouble,
    SD_Wave_newFromFile, SD_Wave_delete

## new
"""
This function creates a waveform object from data points contained in an array
in memory.
### AWG Waveform types
- Analog 16 Bits : Analog normalized waveforms (-1..1) defined with doubles
--> WAVE_ANALOG_16 = 0
- Analog 32 Bits : Analog normalized waveforms (-1..1) defined with doubles
--> WAVE_ANALOG_32 = 1
- Analog 16 Bits Dual : Analog normalized waveforms (-1..1) defined with
doubles, with two components (A and B) --> WAVE_ANALOG_16_DUAL = 4
- Analog 32 Bits Dual : Analog normalized waveforms (-1..1) defined with
doubles, with two components (A and B) --> WAVE_ANALOG_32_DUAL = 6
- IQ : Analog normalized waveforms (-1..1) defined with doubles, with two
components (I and Q) --> WAVE_IQ = 2
- IQ Polar : Analog waveforms (-1..1 module, -180..+180 phase) defined with
doubles, with two components (Module and Phase) --> WAVE_IQPOLAR = 3
- Digital : Digital waveforms defined with integers --> WAVE_DIGITAL = 5
"""
## int SD_Wave_newFromArrayInteger(int waveformType, int waveformPoints, int *waveformDataA, int *waveformDataB SD_DEFAULT_NULL);
SD_Wave_newFromArrayInteger(waveformType::Integer, waveformDataA,
    waveformDataB=0) =
    ccall((:SD_Wave_newFromArrayInteger, klib), Cint,
        (Cint, Cint, Ref{Cint}, Ref{Cint}),
        waveformType, length(waveformDataA), waveformDataA, waveformDataB)

## int SD_Wave_newFromArrayDouble(int waveformType, int waveformPoints, double *waveformDataA, double *waveformDataB SD_DEFAULT_NULL);
SD_Wave_newFromArrayDouble(waveformType::Integer, waveformDataA,
    waveformDataB=0) =
    ccall((:SD_Wave_newFromArrayDouble, klib), Cint,
        (Cint, Cint, Ref{Cdouble}, Ref{Cdouble}),
        waveformType, length(waveformDataA), waveformDataA, waveformDataB)

## int SD_Wave_newFromFile(const char *waveformFile);
"""
This function creates a waveform object from data points contained in an array
in a file.
"""
SD_Wave_newFromFile(waveformFile::String) =
    ccall((:SD_Wave_newFromFile, klib), Cint, (Cstring,), waveformFile)

## int SD_Wave_delete(int waveformID);
"""
This function removes a waveform created with the function.
"""
SD_Wave_delete(waveformID::Integer) =
    ccall((:SD_Wave_delete, klib), Cint, (Cint,), waveformID)
