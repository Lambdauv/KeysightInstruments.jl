export SD_AIO_clockIOconfig, SD_AIO_clockGetFrequency, SD_AIO_clockGetSyncFrequency,
	SD_AIO_clockSetFrequency, SD_AIO_clockResetPhase, SD_AIO_triggerIOconfig,
	SD_AIO_triggerIOwrite, SD_AIO_triggerIOread
# Clock
## int __cdecl SD_AIO_clockIOconfig(int moduleID, int port, int clockConfig);
SD_AIO_clockIOconfig(moduleID::Integer, port::Integer, clockConfig::Integer) =
	ccall((:SD_AIO_clockIOconfig, klib), Cint, (Cint, Cint, Cint),
		moduleID, port, clockConfig)

## double SD_AIO_clockGetFrequency(int moduleID, int port);
SD_AIO_clockGetFrequency(moduleID::Integer, port::Integer) =
	ccall((:SD_AIO_clockGetFrequency, klib), Cdouble, (Cint, Cint),
		moduleID, port)

## double SD_AIO_clockGetSyncFrequency(int moduleID, int port);
SD_AIO_clockGetSyncFrequency(moduleID::Integer, port::Integer) =
	ccall((:SD_AIO_clockGetSyncFrequency, klib), Cdouble, (Cint, Cint),
		moduleID, port)

## double SD_AIO_clockSetFrequency(int moduleID, int port, double frequency, int mode SD_DEFAULT_CLOCK_FREQ_MODE);
SD_AIO_clockSetFrequency(moduleID::Integer, port::Integer, frequency::Real,
	mode::Integer) =
	ccall((:SD_AIO_clockSetFrequency, klib), Cdouble, (Cint, Cint, Cdouble, Cint),
		moduleID, port, frequency, mode)

## int SD_AIO_clockResetPhase(int moduleID, int port, int triggerBehavior, int PXItrigger, double skew SD_DEFAULT_CLOCK_SKEW);
SD_AIO_clockResetPhase(moduleID::Integer, port::Integer, triggerBehavior::Integer,
	PXItrigger::Integer, skew::Real) =
	ccall((:SD_AIO_clockResetPhase, klib), Cint,
		(Cint, Cint, Cint, Cint, Cdouble),
		moduleID, port, triggerBehavior, PXItrigger, skew)

# Trigger
## int SD_AIO_triggerIOconfig(int moduleID, int port, int direction);
SD_AIO_triggerIOconfig(moduleID::Integer, port::Integer, direction::Integer) =
	ccall((:SD_AIO_triggerIOconfig, klib), Cint, (Cint, Cint, Cint),
		moduleID, port, direction)

## int SD_AIO_triggerIOwrite(int moduleID, int port, int value, int syncMode);
SD_AIO_triggerIOwrite(moduleID::Integer, port::Integer, value::Integer,
	syncMode::Integer) =
	ccall((:SD_AIO_triggerIOwrite, klib), Cint, (Cint, Cint, Cint, Cint),
		moduleID, port, value, syncMode)

## int SD_AIO_triggerIOread(int moduleID, int port);
SD_AIO_triggerIOread(moduleID::Integer, port::Integer) =
	ccall((:SD_AIO_triggerIOread, klib), Cint, (Cint, Cint), moduleID, port)
