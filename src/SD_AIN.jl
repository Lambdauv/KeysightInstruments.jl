##### SD_AIN Functions
## channelInputConfig
SD_AIN_channelInputConfig(moduleID::Int, nChannel::Int, fullScale::Float64,
	coupling::Int) =
	ccall((:SD_AIN_channelInputConfig, lib), Cint, (Cint, Cint, Cdouble, Cint),
		moduleID, nChannel, fullScale, coupling)

## channelPrescalerConfig
SD_AIN_channelPrescalerConfig(moduleID::Int, nChannel::Int, prescaler::Int) =
	ccall((:SD_AIN_channelPrescalerConfig, lib), Cint, (Cint, Cint, Cint),
		moduleID, nChannel, prescaler)

## channelTriggerConfig
SD_AIN_channelTriggerConfig(moduleID::Int, nChannel::Int,
	analogTriggerMode::Int, threshold::Float64) =
	ccall((:SD_AIN_channelTriggerConfig, lib), Cint, (Cint, Cint, Cint,
		Cdouble), moduleID, nChannel, analogTriggerMode, threshold)

## DAQconfig
SD_AIN_DAQconfig(moduleID::Int, nDAQ::Int, DAQpointsPerCycle::Int, cycles::Int,
	triggerDelay::Int, triggerMode::Int) =
	ccall((:SD_AIN_DAQconfig, lib), Cint, (Cint, Cint, Cint, Cint, Cint, Cint),
		moduleID, nDAQ, DAQpointsPerCycle, cycles, triggerDelay, triggerMode)

## DAQdigitalTriggerConfig
SD_AIN_DAQdigitalTriggerConfig(moduleID::Int, nDAQ::Int, triggerSource::Int,
	triggerNumber::Int, triggerBehavior::Int) =
	ccall((:SD_AIN_DAQdigitalTriggerConfig, lib), Cint, (Cint, Cint, Cint, Cint,
		Cint), moduleID, nDAQ, triggerSource, triggerNumber, triggerBehavior)

## DAQanalogTriggerConfig
SD_AIN_DAQanalogTriggerConfig(moduleID::Int, nDAQ::Int, triggerNumber::Int) =
	ccall((:SD_AIN_DAQanalogTriggerConfig, lib), Cint, (Cint, Cint, Cint),
		moduleID, nDAQ, triggerNumber)

## DAQread
function SD_AIN_DAQread(moduleID::Int, nDAQ::Int, DAQpoints::Int, timeout::Int)
	DAQdata = Vector{Cshort}(DAQpoints) 	# Create an array to retrieve data
	# DAQdata contains DAQpoints words. Its size is DAQpoints × 2bytes/word.
 	val = ccall((:SD_AIN_DAQread, lib), Cint, (Cint, Cint, Ref{Cshort}, Cint,
		Cint), moduleID, nDAQ, DAQdata, DAQpoints, timeout)
	if val >= 0
		return DAQdata
	else
		return val
	end
end

## DAQstart
SD_AIN_DAQstart(moduleID::Int, nDAQ::Int) =
	ccall((:SD_AIN_DAQstart, lib), Cint, (Cint, Cint), moduleID, nDAQ)

## DAQstartMultiple
SD_AIN_DAQstartMultiple(moduleID::Int, DAQmask::Int) =
	ccall((:SD_AIN_DAQstartMultiple, lib), Cint, (Cint, Cint),
		moduleID, DAQmask)

## DAQstop
SD_AIN_DAQstop(moduleID::Int, nDAQ::Int) =
	ccall((:SD_AIN_DAQstop, lib), Cint, (Cint, Cint), moduleID, nDAQ)

## DAQstopMultiple
SD_AIN_DAQstopMultiple(moduleID::Int, DAQmask::Int) =
	ccall((:SD_AIN_DAQstopMultiple, lib), Cint, (Cint, Cint),
		moduleID, DAQmask)

## DAQpause
SD_AIN_DAQpause(moduleID::Int, nDAQ::Int) =
    ccall((:SD_AIN_DAQpause, lib), Cint, (Cint, Cint), moduleID, nDAQ)

## DAQpauseMultiple
SD_AIN_DAQpauseMultiple(moduleID::Int, DAQmask::Int) =
    ccall((:SD_AIN_DAQpauseMultiple, lib), Cint, (Cint, Cint),
        moduleID, DAQmask)

## DAQresume
SD_AIN_DAQresume(moduleID::Int, nDAQ::Int) =
	ccall((:SD_AIN_DAQresume, lib), Cint, (Cint, Cint), moduleID, nDAQ)

## DAQresumeMultiple
SD_AIN_DAQresumeMultiple(moduleID::Int, DAQmask::Int) =
    ccall((:SD_AIN_DAQresumeMultiple, lib), Cint, (Cint, Cint),
        moduleID, DAQmask)

## DAQflush
SD_AIN_DAQflush(moduleID::Int, nDAQ::Int) =
    ccall((:SD_AIN_DAQflush, lib), Cint, (Cint, Cint), moduleID, nDAQ)

## DAQflushMultiple
SD_AIN_DAQflushMultiple(moduleID::Int, DAQmask::Int) =
    ccall((:SD_AIN_DAQflushMultiple, lib), Cint, (Cint, Cint),
        moduleID, DAQmask)

## DAQtrigger
SD_AIN_DAQtrigger(moduleID::Int, nDAQ::Int) =
    ccall((:SD_AIN_DAQtrigger, lib), Cint, (Cint, Cint), moduleID, nDAQ)

## DAQtriggerMultiple
SD_AIN_DAQtriggerMultiple(moduleID::Int, DAQmask::Int) =
    ccall((:SD_AIN_DAQtriggerMultiple, lib), Cint, (Cint, Cint),
        moduleID, DAQmask)

## DAQcounterRead
SD_AIN_DAQcounterRead(moduleID::Int, DAQ::Int) =
    ccall((:SD_AIN_DAQcounterRead, lib), Cint, (Cint, Cint), moduleID, DAQ)

## triggerIOconfig
SD_AIN_triggerIOconfig(moduleID::Int, direction::Int, syncMode::Int) =
    ccall((:SD_AIN_triggerIOconfig, lib), Cint, (Cint, Cint, Cint),
        moduleID, direction, syncMode)

## triggerIOwrite
SD_AIN_triggerIOwrite(moduleID::Int, value::Int) =
    ccall((:SD_AIN_triggerIOwrite, lib), Cint, (Cint, Cint), moduleID, value)

## triggerIOread
SD_AIN_triggerIOread(moduleID::Int) =
    ccall((:SD_AIN_triggerIOread, lib), Cint, (Cint,), moduleID)

## clockSetFrequency
SD_AIN_clockSetFrequency(moduleID::Int, frequency::Float64, mode::Int) =
    ccall((:SD_AIN_clockSetFrequency, lib), Cdouble, (Cint, Cdouble, Cint),
        moduleID, frequency, mode)

## clockGetFrequency
SD_AIN_clockGetFrequency(moduleID::Int) =
	ccall((:SD_AIN_clockGetFrequency, lib), Cdouble, (Cint,), moduleID)

## clockGetSyncFrequency
SD_AIN_clockGetSyncFrequency(moduleID::Int) =
	ccall((:SD_AIN_clockGetSyncFrequency, lib), Cint, (Cint,), moduleID)

## clockResetPhase
SD_AIN_clockResetPhase(moduleID::Int, triggerBehavior::Int, PXItrigger::Int,
	skew::Float64) =
	ccall((:SD_AIN_clockResetPhase, lib), Cint, (Cint, Cint, Cint, Cdouble),
		moduleID, triggerBehavior, PXItrigger, skew)

## DAQbufferPoolConfig : TODO
#SD_AIN_DAQbufferPoolConfig(moduleID::Int, nDAQ::Int, dataBuffer::, nPoints::Int, timeOut::Int, )
# int SD_AIN_DAQbufferPoolConfig(int moduleID, int nDAQ,short* dataBuffer, int nPoints, int timeOut, callbackEventPtr callbackFunction,void *callbackUserObj);

## DAQbufferAdd : TODO
#SD_AIN_DAQbufferAdd(moduleID::Int, nDAQ::Int, dataBuffer::Vector{Int16},
#	nPoints::Int) =
#	ccall((:SD_AIN_DAQbufferAdd, lib), Cint, (Cint, Cint, Ref{Cshort}, Cint),
#		moduleID, nDAQ, dataBuffer, nPoints)

## DAQbufferGet : TODO
#SD_AIN_DAQbufferGet(moduleID::Int, nDAQ::Int) =
#    short* SD_AIN_DAQbufferGet(int moduleID, int nDAQ, int &readPointsOut, int &errorOut);

## DAQbufferPoolRelease : TODO
SD_AIN_DAQbufferRelease(moduleID::Int, nDAQ::Int) =
	ccall((:SD_AIN_DAQbufferRelease, lib), Cint, (Cint, Cint), moduleID, nDAQ)

## DAQbufferPoolRemove : TODO
#function SD_AIN_DAQbufferRemove(moduleID::Int, nDAQ::Int)
#	ptr = ccall((:SD_AIN_DAQbufferRemove, lib), Ptr{Cshort}, (Cint, Cint),
#		moduleID, nDAQ)
#	return unsafe_load(ptr)
#end

## FFT
function SD_AIN_FFT(moduleID::Int, channel::Int, data::Array{Int16}, dB::Bool,
    windowType::Int)
	dataSize = length(data)
	resultSize = dataSize
	resultMag = Vector{Cdouble}(resultSize)
	resultPhase = Vector{Cdouble}(resultSize)
	val = ccall((:SD_AIN_FFT, lib), Cint, (Cint, Cint, Ref{Cshort}, Cint,
		Ref{Cdouble}, Cint, Ref{Cdouble}, Bool, Cint), moduleID, channel, data,
		dataSize, resultMag, resultSize, resultPhase, dB, windowType)
	if val >= 0
		return resultMag, resultPhase
	else
		return val
	end
end
#= int SD_AIN_FFT(int moduleID, int channel, short *data, int size,
double *result, int resultSize, double *resultPhase, bool dB, int windowType);=#
