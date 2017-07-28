module KeysightDigitizer
# User's guide for M31XXA/M33XXA Digitizers
# http://literature.cdn.keysight.com/litweb/pdf/M3100-90002.pdf?id=2796080
# package code goes here


## should the moduleID let to be a global constant?

##### SD_Module Functions
## open
SD_Module_openWithSerialNumber(productName::String, serialNumber::String) =
  ccall((:SD_Module_openWithSerialNumber, lib), Cint, (Cstring, Cstring),
    productName, serialNumber)

SD_Module_openWithSlot(productName::String, chassis::Int, slot::Int) =
  ccall((:SD_Module_openWithSlot, lib), Cint, (Cstring, Cint, Cint),
    productName, chassis, slot)

SD_Module_openWithSerialNumberCompatibility(productName::String,
  serialNumber::String, compatibility::Int) =
  ccall((:SD_Module_openWithSerialNumberCompatibility, lib), Cint,
    (Cstring, Cstring, Cint), productName, serialNumber, compatibility)

SD_Module_openWithSlotCompatibility(productName::String, chassis::Int,
  slot::Int, compatibility::Int) =
  ccall((:SD_Module_openWithSlotCompatibility, lib), Cint, (Cstring, Cint,
    Cint, Cint), productName, chassis, slot, compatibility)

## close
SD_Module_close(moduleID::Int) =
  ccall((:SD_Module_close, lib), Cint, (Cint,), moduleID)

## moduleCount
SD_Module_moduleCount() =
  ccall((:SD_Module_moduleCount, lib), Cint, ())

## getProductName
function SD_Module_getProductNameByIndex(index::Int)
  productName = Vector{UInt8}(128)
  val = ccall((:SD_Module_getProductNameByIndex, lib), Cint, (Cint, Ptr{UInt8}),
    index, productName)
	productName[end] = 0	# ensure null-termination
	return val, unsafe_string(pointer(productName))
end

function SD_Module_getProductNameBySlot(chassis::Int, slot::Int)
	productName = Vector{UInt8}(128)
	val = ccall((:SD_Module_getProductNameBySlot, lib), Cint,
		(Cint, Cint, Ptr{UInt8}), chassis, slot, productName)
	productName[end] = 0	# ensure null-termination
	return val, unsafe_string(pointer(productName))
end

## getSerialNumber
function SD_Module_getSerialNumberByIndex(index::Int)
	serialNumber = Vector{UInt8}(128)
	val = ccall((:SD_Module_getSerialNumberByIndex, lib), Cint,
		(Cint, Ptr{UInt8}), index, serialNumber)
	serialNumber[end] = 0	# ensure null-termination
	return val, unsafe_string(pointer(serialNumber))
end

function SD_Module_getSerialNumberBySlot(chassis::Int, slot::Int)
	serialNumber = Vector{UInt8}
	val = ccall((:SD_Module_getSerialNumberBySlot, lib), Cint,
		(Cint, Cint, Ptr{UInt8}), chassis, slot, serialNumber)
	serialNumber[end] = 0	# ensure null-termination
	return val, unsafe_string(pointer(serialNumber))
end

## getChassis
SD_Module_getChassis(index::Int) =
	ccall((:SD_Module_getChassis, lib), Cint, (Cint,), index)

## getSlot
SD_Module_getSlot(index::Int) =
	ccall((:SD_Module_getSlot, lib), Cint, (Cint,), index)

## PXItriggerWrite
SD_Module_PXItriggerWrite(moduleID::Int, nPXItrigger::Int, value::Int) =
	ccall((:SD_Module_PXItriggerWrite, lib), Cint, (Cint, Cint, Cint),
		moduleID, nPXItrigger, value)

## PXItriggerRead
SD_Module_PXItriggerRead(moduleID::Int, nPXItrigger::Int) =
	ccall((:SD_Module_PXItriggerRead, lib), Cint, (Cint, Cint),
		moduleID, nPXItrigger)
#####################################################################TODO
##### SD_Module Functions (FPGA-related): Needs modification
## FPGAwritePCport
SD_Module_FPGAwritePCport(moduleID::Int, nPCport::Int, data::Int,
  dataSize::Int, address::Int, addressMode::Int, accessMode::Int) =
  ccall((:SD_Module_FPGAwritePCport, lib), Cint, (Cint, Cint, Ptr{Clong}, Cint,
    Cint, Cint, Cint), moduleID, nPCport, data, dataSize, address, addressMode,
    accessMode)

## FPGAreadPCport
SD_Module_FPGAreadPCport(moduleID::Int, nPCport::Int, data,
  dataSize::Int, address::Int, addressMode::Int, accessMode::Int) =
  ccall((:SD_Module_FPGAreadPCport, lib), Cint, (Cint, Cint, Ptr{Cint}, Cint,
    Cint, Cint, Cint), moduleID, nPCport, data, dataSize, address, addressMode,
    accessMode)
##########################################################################TODO
##### SD_Module Functions (HVI-related): Needs modification
## writeRegister
SD_Module_writeRegister(moduleID::Int, regNumber::Int, regValue::Int) =
  ccall((:SD_Module_writeRegister, lib), Cint, (Cint, Cint, Cint),
    moduleID, regNumber, regValue)

SD_Module_writeRegisterWithName(moduleID::Int, regName::String, regValue::Int) =
  ccall((:SD_Module_writeRegisterWithName, lib), Cint, (Cint, Cstring, Cint),
    moduleID, regName, regValue)

SD_Module_writeDoubleRegister(moduleID::Int, regNumber::Int, regValue::Float64,
  unit::String) =
  ccall((:SD_Module_writeDoubleRegister, lib), Cint, (Cint, Cint, Cdouble,
    Cstring), moduleID, regNumber, regValue, unit)

SD_Module_writeDoubleRegisterWithName(moduleID::Int, regName::String,
  regValue::Float64, unit::String) =
  ccall((:SD_Module_writeDoubleRegisterWithName, lib), Cint, (Cint, Cstring,
    Cdouble, Cstring), moduleID, regName, regValue, unit)

## readRegister
#SD_Module_readRegister(moduleID::Int, regNumber::Int, regValue::Int) =
#  ccall((:SD_Module_readRegister, lib), Cint, (Cint, Cint, Cint),
#    moduleID, regNumber, regValue)

#SD_Module_readRegisterWithName(moduleID::Int, regName::String, )
####
#SD_Module_readDoubleRegister(moduleID::Int, regNumber::Int, unit::String,
#double SD_Module_readDoubleRegister(int moduleID, int regNumber, const char* unit, int& errorOut);
#SD_Module_readDoubleRegisterWithName()
#=double SD_Module_readDoubleRegisterWithName(int moduleID, const char* regName,
const char* unit, int& errorOut);=#

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
function SD_AIN_DAQread(moduleID::Int, nDAQ::Int, DAQpoints::Int,
	timeout::Int) =
	DAQdata = Vector{Cshort}(DAQpoints) 	# Create an array to retrieve data
	# DAQdata contains DAQpoints words. Its size is DAQpoints × 2bytes/word.
 	val = ccall((:SD_AIN_DAQread, lib), Cint, (Cint, Cint, Ref{Cshort}, Cint,
		Cint), moduleID, nDAQ, DAQdata, DAQpoints, timeout)
	return DAQdata, val
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
  ccall((:SD_AIN_DAQpauseMultiple, lib), Cint, (Cint, Cint), moduleID, DAQmask)

## DAQresume
SD_AIN_DAQresume(moduleID::Int, nDAQ::Int) =
	ccall((:SD_AIN_DAQresume, lib), Cint, (Cint, Cint), moduleID, nDAQ)

## DAQresumeMultiple
SD_AIN_DAQresumeMultiple(moduleID::Int, DAQmask::Int) =
  ccall((:SD_AIN_DAQresumeMultiple, lib), Cint, (Cint, Cint), moduleID, DAQmask)

## DAQflush
SD_AIN_DAQflush(moduleID::Int, nDAQ::Int) =
  ccall((:SD_AIN_DAQflush, lib), Cint, (Cint, Cint), moduleID, nDAQ)

## DAQflushMultiple
SD_AIN_DAQflushMultiple(moduleID::Int, DAQmask::Int) =
  ccall((:SD_AIN_DAQflushMultiple, lib), Cint, (Cint, Cint), moduleID, DAQmask)

## DAQtrigger
SD_AIN_DAQtrigger(moduleID::Int, nDAQ::Int) =
  ccall((:SD_AIN_DAQtrigger, lib), Cint, (Cint, Cint), moduleID, nDAQ)

## DAQtriggerMultiple
SD_AIN_DAQtriggerMultiple(moduleID::Int, DAQmask::Int) =
  ccall((:SD_AIN_DAQtriggerMultiple, lib), Cint, (Cint, Cint),
  	moduleID, DAQmask)

## DAQcounterRead
SD_AIN_DAQcounterRead(moduleID::Int, DAQ::int) =
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
function SD_AIN_FFT(moduleID::Int, channel::Int, data::Array{Float64}, dB::Bool,
	windowType::Int)
	dataSize = length(data)
	result = Vector{Cdouble}(resultSize)
	ccall((:SD_AIN_FFT, lib), Cint, (Cint, Cint, Ref{Cshort}, Cint,
		Ref{Cdouble}, Cint, Ref{Cdouble}, Bool, Cint), moduleID, channel, data,
		dataSize, result, resultSize, resultPhase, dB, windowType)

#= int SD_AIN_FFT(int moduleID, int channel, short *data, int size,
double *result, int resultSize, double *resultPhase, bool dB, int windowType);=#
end

end # module
