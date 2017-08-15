# SD_AIN Functions
export SD_AIN_channelInputConfig, SD_AIN_channelPrescalerConfig
export SD_AIN_channelTriggerConfig, SD_AIN_DAQconfig, SD_AIN_DAQdigitalTriggerConfig
export SD_AIN_DAQanalogTriggerConfig, SD_AIN_DAQread, SD_AIN_DAQstart
export SD_AIN_DAQstartMultiple, SD_AIN_DAQstop, SD_AIN_DAQstopMultiple
export SD_AIN_DAQpause, SD_AIN_DAQpauseMultiple, SD_AIN_DAQresume
export SD_AIN_DAQresumeMultiple, SD_AIN_DAQflush, SD_AIN_DAQflushMultiple
export SD_AIN_DAQtrigger, SD_AIN_DAQtriggerMultiple, SD_AIN_DAQcounterRead
export SD_AIN_triggerIOconfig, SD_AIN_triggerIOwrite, SD_AIN_triggerIOread
export SD_AIN_clockSetFrequency, SD_AIN_clockGetFrequency, SD_AIN_clockGetSyncFrequency
export SD_AIN_clockResetPhase, SD_AIN_DAQbufferPoolConfig, SD_AIN_DAQbufferAdd
export SD_AIN_DAQbufferGet, SD_AIN_DAQbufferRelease, SD_AIN_DAQbufferRemove
export SD_AIN_FFT

## channelInputConfig
"""
This function configures the input full scale, impedance and coupling as
applicable according to the product.
"""
SD_AIN_channelInputConfig(moduleID::Int, nChannel::Int, fullScale::Float64,
	coupling::Int) =
	ccall((:SD_AIN_channelInputConfig, lib), Cint, (Cint, Cint, Cdouble, Cint),
		moduleID, nChannel, fullScale, coupling)

## channelPrescalerConfig
"""
This function configures the input prescaler.
"""
SD_AIN_channelPrescalerConfig(moduleID::Int, nChannel::Int, prescaler::Int) =
	ccall((:SD_AIN_channelPrescalerConfig, lib), Cint, (Cint, Cint, Cint),
		moduleID, nChannel, prescaler)

## channelTriggerConfig
"""
This function configures the analog trigger block for each channel.
"""
SD_AIN_channelTriggerConfig(moduleID::Int, nChannel::Int,
	analogTriggerMode::Int, threshold::Float64) =
	ccall((:SD_AIN_channelTriggerConfig, lib), Cint, (Cint, Cint, Cint,
		Cdouble), moduleID, nChannel, analogTriggerMode, threshold)

## DAQconfig
"""
This function configures the acquisition of words in two possible reading modes:
- Blocking: Using the function to read the words. DAQread is a blocking function
that is released when the amount of words specified in DAQpoints is acquired or
when timeout elapses. This mode is enabled when a callback function is not
specified (it is set to null).
- Non-blocking: The user specifies a callback function which is called whenever
the DAQeventDataReady event is signaled or when timeout elapses. In the latter
condition, there may be words available, but less than the amount specified in
DAQpoints.
"""
SD_AIN_DAQconfig(moduleID::Int, nDAQ::Int, DAQpointsPerCycle::Int, cycles::Int,
	triggerDelay::Int, triggerMode::Int) =
	ccall((:SD_AIN_DAQconfig, lib), Cint, (Cint, Cint, Cint, Cint, Cint, Cint),
		moduleID, nDAQ, DAQpointsPerCycle, cycles, triggerDelay, triggerMode)

## DAQdigitalTriggerConfig
"""
This function configures the digital hardware triggers for the selected DAQ.
"""
SD_AIN_DAQdigitalTriggerConfig(moduleID::Int, nDAQ::Int, triggerSource::Int,
	triggerNumber::Int, triggerBehavior::Int) =
	ccall((:SD_AIN_DAQdigitalTriggerConfig, lib), Cint, (Cint, Cint, Cint, Cint,
		Cint), moduleID, nDAQ, triggerSource, triggerNumber, triggerBehavior)

## DAQanalogTriggerConfig
"""
This function configures the analog hardware trigger for the selected DAQ.
"""
SD_AIN_DAQanalogTriggerConfig(moduleID::Int, nDAQ::Int, triggerNumber::Int) =
	ccall((:SD_AIN_DAQanalogTriggerConfig, lib), Cint, (Cint, Cint, Cint),
		moduleID, nDAQ, triggerNumber)

## DAQread
"""
This function reads the words acquired with the selected DAQ. It can be used
only after calling the function DAQconfig and when a callback function is not
configured. DAQread is a blocking function released when the configured amount
of words is acquired, or when the configured timeout elapses (if timeout is set
to ”0” , then DAQread waits until DAQpoints are acquired). In the timeout
elapses, there may be words available, but less than the configured amount.
"""
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
"""
This function starts acquisition on the selected DAQ. Acquisition will start
when a trigger is received.
"""
SD_AIN_DAQstart(moduleID::Int, nDAQ::Int) =
	ccall((:SD_AIN_DAQstart, lib), Cint, (Cint, Cint), moduleID, nDAQ)

## DAQstartMultiple
"""
This function starts acquisition on the selected DAQs. Acquisition will start
when a trigger is received.
"""
SD_AIN_DAQstartMultiple(moduleID::Int, DAQmask::Int) =
	ccall((:SD_AIN_DAQstartMultiple, lib), Cint, (Cint, Cint),
		moduleID, DAQmask)

## DAQstop
"""
This function stops the words acquisition on the selected DAQ.
"""
SD_AIN_DAQstop(moduleID::Int, nDAQ::Int) =
	ccall((:SD_AIN_DAQstop, lib), Cint, (Cint, Cint), moduleID, nDAQ)

## DAQstopMultiple
"""
This function pauses the words acquisition on the selected DAQs.
"""
SD_AIN_DAQstopMultiple(moduleID::Int, DAQmask::Int) =
	ccall((:SD_AIN_DAQstopMultiple, lib), Cint, (Cint, Cint),
		moduleID, DAQmask)

## DAQpause
"""
This function pauses the words acquisition on the selected DAQ. Acquisition can
be resumed using DAQresume.
"""
SD_AIN_DAQpause(moduleID::Int, nDAQ::Int) =
    ccall((:SD_AIN_DAQpause, lib), Cint, (Cint, Cint), moduleID, nDAQ)

## DAQpauseMultiple
"""
This function pauses the words acquisition on the selected DAQs. Acquisition can
be resumed using DAQresume.
"""
SD_AIN_DAQpauseMultiple(moduleID::Int, DAQmask::Int) =
    ccall((:SD_AIN_DAQpauseMultiple, lib), Cint, (Cint, Cint),
        moduleID, DAQmask)

## DAQresume
"""
This function resumes acquisition on the selected DAQ.
"""
SD_AIN_DAQresume(moduleID::Int, nDAQ::Int) =
	ccall((:SD_AIN_DAQresume, lib), Cint, (Cint, Cint), moduleID, nDAQ)

## DAQresumeMultiple
"""
This function resumes acquisition on the selected DAQs.
"""
SD_AIN_DAQresumeMultiple(moduleID::Int, DAQmask::Int) =
    ccall((:SD_AIN_DAQresumeMultiple, lib), Cint, (Cint, Cint),
        moduleID, DAQmask)

## DAQflush
"""
This function flushes the acquisition buffers and resets the acquisition counter
included in a Data Acquisition block.
"""
SD_AIN_DAQflush(moduleID::Int, nDAQ::Int) =
    ccall((:SD_AIN_DAQflush, lib), Cint, (Cint, Cint), moduleID, nDAQ)

## DAQflushMultiple
"""
This function flushes the acquisition buffers and resets the acquisition counter
included in a Data Acquisition block.
"""
SD_AIN_DAQflushMultiple(moduleID::Int, DAQmask::Int) =
    ccall((:SD_AIN_DAQflushMultiple, lib), Cint, (Cint, Cint),
        moduleID, DAQmask)

## DAQtrigger
"""
This function triggers the acquisition of words in the selected DAQs provided
that they are configured for VI/HVI Trigger.
"""
SD_AIN_DAQtrigger(moduleID::Int, nDAQ::Int) =
    ccall((:SD_AIN_DAQtrigger, lib), Cint, (Cint, Cint), moduleID, nDAQ)

## DAQtriggerMultiple
"""
This function triggers the acquisition of words in the selected DAQs provided
that they are configured for VI/HVI Trigger.
"""
SD_AIN_DAQtriggerMultiple(moduleID::Int, DAQmask::Int) =
    ccall((:SD_AIN_DAQtriggerMultiple, lib), Cint, (Cint, Cint),
        moduleID, DAQmask)

## DAQcounterRead
"""
This function reads the number of words acquired by the selected DAQ since the
last call to DAQflush or DAQ.
"""
SD_AIN_DAQcounterRead(moduleID::Int, DAQ::Int) =
    ccall((:SD_AIN_DAQcounterRead, lib), Cint, (Cint, Cint), moduleID, DAQ)

## triggerIOconfig
"""
This function configures the trigger connector/line direction and
synchronization/sampling method.
"""
SD_AIN_triggerIOconfig(moduleID::Int, direction::Int, syncMode::Int) =
    ccall((:SD_AIN_triggerIOconfig, lib), Cint, (Cint, Cint, Cint),
        moduleID, direction, syncMode)

## triggerIOwrite
"""
This function sets the trigger output. The trigger must be configured as output
using function triggerIOconfig and I/O Triggers.
"""
SD_AIN_triggerIOwrite(moduleID::Int, value::Int) =
    ccall((:SD_AIN_triggerIOwrite, lib), Cint, (Cint, Cint), moduleID, value)

## triggerIOread
"""
This function reads the trigger input.
"""
SD_AIN_triggerIOread(moduleID::Int) =
    ccall((:SD_AIN_triggerIOread, lib), Cint, (Cint,), moduleID)

## clockSetFrequency
"""
This function sets the module clock frequency, see FlexCLK Technology (models
with variable sampling rate).
"""
SD_AIN_clockSetFrequency(moduleID::Int, frequency::Float64, mode::Int) =
    ccall((:SD_AIN_clockSetFrequency, lib), Cdouble, (Cint, Cdouble, Cint),
        moduleID, frequency, mode)

## clockGetFrequency
"""
This function returns the real hardware clock frequency. It may differ from the
frequency set with the function clockSetFrequency, due to the hardware
frequency resolution.
"""
SD_AIN_clockGetFrequency(moduleID::Int) =
	ccall((:SD_AIN_clockGetFrequency, lib), Cdouble, (Cint,), moduleID)

## clockGetSyncFrequency
"""
This function returns the frequency of Clock System.
"""
SD_AIN_clockGetSyncFrequency(moduleID::Int) =
	ccall((:SD_AIN_clockGetSyncFrequency, lib), Cint, (Cint,), moduleID)

## clockResetPhase
"""
This function sets the module in a sync state, waiting for the first trigger to
reset the phase of the internal clocks CLKsync and CLKsys.
"""
SD_AIN_clockResetPhase(moduleID::Int, triggerBehavior::Int, PXItrigger::Int,
	skew::Float64) =
	ccall((:SD_AIN_clockResetPhase, lib), Cint, (Cint, Cint, Cint, Cdouble),
		moduleID, triggerBehavior, PXItrigger, skew)

## DAQbufferPoolConfig : TODO
"""
This function configures buffer pool that will be filled with the data of the
channel to be transferred to PC.
"""
#SD_AIN_DAQbufferPoolConfig(moduleID::Int, nDAQ::Int, dataBuffer::, nPoints::Int, timeOut::Int, )
# int SD_AIN_DAQbufferPoolConfig(int moduleID, int nDAQ,short* dataBuffer, int nPoints, int timeOut, callbackEventPtr callbackFunction,void *callbackUserObj);

## DAQbufferAdd : TODO
"""
Adds an additional buffer to the channel’s previously configured pool.
"""
#SD_AIN_DAQbufferAdd(moduleID::Int, nDAQ::Int, dataBuffer::Vector{Int16},
#	nPoints::Int) =
#	ccall((:SD_AIN_DAQbufferAdd, lib), Cint, (Cint, Cint, Ref{Cshort}, Cint),
#		moduleID, nDAQ, dataBuffer, nPoints)

## DAQbufferGet : TODO
"""
Gets a filled buffer from the channel buffer pool. User has to call DAQbufferAdd
with this buffer to tell the pool that the buffer can be used again.
"""
#SD_AIN_DAQbufferGet(moduleID::Int, nDAQ::Int) =
#    short* SD_AIN_DAQbufferGet(int moduleID, int nDAQ, int &readPointsOut, int &errorOut);

## DAQbufferPoolRelease : TODO
"""
Releases the channel buffer pool and its resources. After this call, user has to
call DAQbufferRemove consecutively to get all buffers back and release them.
"""
SD_AIN_DAQbufferRelease(moduleID::Int, nDAQ::Int) =
	ccall((:SD_AIN_DAQbufferRelease, lib), Cint, (Cint, Cint), moduleID, nDAQ)

## DAQbufferPoolRemove : TODO
"""
Ask for a buffer to be removed from the channel buffer pool. If NULL pointer is
returned, no more buffers remains in buffer pool. Returned buffer is a
previously added buffer from user and user has to release/delete it.
"""
#function SD_AIN_DAQbufferRemove(moduleID::Int, nDAQ::Int)
#	ptr = ccall((:SD_AIN_DAQbufferRemove, lib), Ptr{Cshort}, (Cint, Cint),
#		moduleID, nDAQ)
#	return unsafe_load(ptr)
#end

## FFT
"""
Calculates the FFT of data captured by DAQread for the selected channel.
"""
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
