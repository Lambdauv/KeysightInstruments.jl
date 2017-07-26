module KeysightDigitizer
# User's guide for M31XXA/M33XXA Digitizers
# http://literature.cdn.keysight.com/litweb/pdf/M3100-90002.pdf?id=2796080
# package code goes here

##### SD_Module Functions
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

SD_Module_close(moduleID::Int) =
  ccall((:SD_Module_close, lib), Cint, (Cint,), moduleID)

SD_Module_moduleCount() =
  ccall((:SD_Module_moduleCount, lib), Cint, ())
###########need to ask Andrew
SD_Module_getProductNameByIndex(index::Int, productName::String) =
  ccall((:SD_Module_getProductNameByIndex, lib), Cint, (Cint, Cstring),
    index, productName)
###########need to ask Andrew
SD_Module_getProductNameBySlot(chassis::Int, slot::Int, productName::String) =
  ccall((:SD_Module_getProductNameBySlot, lib), Cint, (Cint, Cint, Cstring),
    chassis, slot, productName)
############need o ask Andrew
SD_Module_getSerialNumberByIndex(index::Int, serialNumber::String) =
  ccall((:SD_Module_getSerialNumberByIndex, lib), Cint, (Cint, Cstring),
    index, serialNumber)
##########need to ask Andrew
SD_Module_getSerialNumberBySlot(chassis::Int, slot::Int, serialNumber::String) =
  ccall((:SD_Module_getSerialNumberBySlot, lib), Cint, (Cint, Cint, Cstring),
    chassis, slot, serialNumber)

SD_Module_getChassis(index::Int) =

ccall((:SD_Module_getChassis, lib), Cint, (Cint,), index)
SD_Module_getSlot(index::Int) =
  ccall((:SD_Module_getSlot, lib), Cint, (Cint,), index)

SD_Module_PXItriggerWrite(moduleID::Int, nPXItrigger::Int, value::Int) =
  ccall((:SD_Module_PXItriggerWrite, lib), Cint, (Cint, Cint, Cint),
    moduleID, nPXItrigger, value)

SD_Module_PXItriggerRead(moduleID::Int, nPXItrigger::Int) =
  ccall((:SD_Module_PXItriggerRead, lib), Cint, (Cint, Cint),
    moduleID, nPXItrigger)

##### SD_Module Functions (FPGA-related)
SD_Module_FPGAwritePCport(moduleID::Int, nPCport::Int, data::Int,
  dataSize::Int, address::Int, addressMode::Int, accessMode::Int) =
  ccall((:SD_Module_FPGAwritePCport, lib), Cint, (Cint, Cint, Ptr{Clong}, Cint,
    Cint, Cint, Cint), moduleID, nPCport, data, dataSize, address, addressMode,
    accessMode)

SD_Module_FPGAreadPCport(moduleID::Int, nPCport::Int, data,
  dataSize::Int, address::Int, addressMode::Int, accessMode::Int) =
  ccall((:SD_Module_FPGAreadPCport, lib), Cint, (Cint, Cint, Ptr{Cint}, Cint,
    Cint, Cint, Cint), moduleID, nPCport, data, dataSize, address, addressMode,
    accessMode)

##### SD_Module Functions (HVI-related)
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

SD_Module_readRegister(moduleID::Int, regNumber::Int, regValue::Int) =
  ccall((:SD_Module_readRegister, lib), Cint, (Cint, Cint, Cint),
    moduleID, regNumber, regValue)

SD_Module_readDoubleRegister(moduleID::Int, regNumber::Int, unit::String,

SD_Module_readDoubleRegisterWithName()

##### SD_AIN Functions
SD_AIN_channelInputConfig(moduleID::Int, nChannel::Int, fullScale::Float64,
  coupling::Int) =
  ccall((:SD_AIN_channelInputConfig, lib), Cint, (Cint, Cint, Cdouble, Cint),
    moduleID, nChannel, fullScale)

SD_AIN_channelPrescalerConfig(moduleID::Int, nChannel::Int, prescaler::Int) =
  ccall((:SD_AIN_channelPrescalerConfig, lib), Cint, (Cint, Cint, Cint),
    moduleID, nChannel, prescaler)

SD_AIN_channelTriggerConfig(moduleID::Int, nChannel::Int,
  analogTriggerMode::Int, threshold::Float64) =
  ccall((:SD_AIN_channelTriggerConfig, lib), Cint, (Cint, Cint, Cint, Cdouble),
    moduleID, nChannel, analogTriggerMode, threshold)

SD_AIN_DAQconfig(moduleID::Int, nDAQ::Int, DAQpointsPerCycle::Int, cycles::Int,
  triggerDelay::Int, triggerMode::Int) =
  ccall((:SD_AIN_DAQconfig, lib), Cint, (Cint, Cint, Cint, Cint, Cint, Cint),
    moduleID, nDAQ, DAQpointsPerCycle, cycles, triggerDelay, triggerMode)

SD_AIN_DAQdigitalTriggerConfig(moduleID::Int, nDAQ::Int, triggerSource::Int,
  triggerNumber::Int, triggerBehavior::Int) =
  ccall((:SD_AIN_DAQdigitalTriggerConfig, lib), Cint, (Cint, Cint, Cint, Cint,
    Cint), moduleID, nDAQ, triggerSource, triggerNumber, triggerBehavior)

SD_AIN_DAQanalogTriggerConfig(moduleID::Int, nDAQ::Int, triggerNumber::Int) =
  ccall((:SD_AIN_DAQanalogTriggerConfig, lib), Cint, (Cint, Cint, Cint),
    moduleID, nDAQ, triggerNumber)

SD_AIN_DAQread(moduleID::Int, nDAQ::Int, DAQdata, DAQpoints::Int,
  timeout::Int) =
  ccall((:SD_AIN_DAQread, lib), Cint, (Cint, Cint, Ptr{Cshort}, Cint, Cint),
    moduleID, nDAQ, DAQdata, DAQpoints, timeout)
#    int SD_AIN_DAQread(int moduleID, int nDAQ,short* DAQdata, int DAQpoints, int timeout);

SD_AIN_DAQstart(moduleID::Int, nDAQ::Int) =
  ccall((:SD_AIN_DAQstart, lib), Cint, (Cint, Cint), moduleID, nDAQ)

SD_AIN_DAQstartMultiple(moduleID::Int, DAQmask::Int) =
  ccall((:SD_AIN_DAQstartMultiple, lib), Cint, (Cint, Cint), moduleID, DAQmask)

SD_AIN_DAQstop(moduleID::Int, nDAQ::Int) =
  ccall((:SD_AIN_DAQstop, lib), Cint, (Cint, Cint), moduleID, nDAQ)

SD_AIN_DAQstopMultiple(moduleID::Int, DAQmask::Int) =
  ccall((:SD_AIN_DAQstopMultiple, lib), Cint, (Cint, Cint), moduleID, DAQmask)

SD_AIN_DAQpause(moduleID::Int, nDAQ::Int) =
  ccall((:SD_AIN_DAQpause, lib), Cint, (Cint, Cint), moduleID, nDAQ)

SD_AIN_DAQpauseMultiple(moduleID::Int, DAQmask::Int) =
  ccall((:SD_AIN_DAQpauseMultiple, lib), Cint, (Cint, Cint), moduleID, DAQmask)

SD_AIN_DAQresume(moduleID::Int, nDAQ::Int) =
  ccall((:SD_AIN_DAQresume, lib), Cint, (Cint, Cint), moduleID, nDAQ)

SD_AIN_DAQresumeMultiple(moduleID::Int, DAQmask::Int) =
  ccall((:SD_AIN_DAQresumeMultiple, lib), Cint, (Cint, Cint), moduleID, DAQmask)

SD_AIN_DAQflush(moduleID::Int, nDAQ::Int) =
  ccall((:SD_AIN_DAQflush, lib), Cint, (Cint, Cint), moduleID, nDAQ)

SD_AIN_DAQflushMultiple(moduleID::Int, DAQmask::Int) =
  ccall((:SD_AIN_DAQflushMultiple, lib), Cint, (Cint, Cint), moduleID, DAQmask)

SD_AIN_DAQtrigger(moduleID::Int, nDAQ::Int) =
  ccall((:SD_AIN_DAQtrigger, lib), Cint, (Cint, Cint), moduleID, nDAQ)

SD_AIN_DAQtriggerMultiple(moduleID::Int, DAQmask::Int) =
  ccall((:SD_AIN_DAQtriggerMultiple, lib), Cint, (Cint, Cint), moduleID, DAQmask)

SD_AIN_DAQcounterRead(moduleID::Int, DAQ::int) =
  ccall((:SD_AIN_DAQcounterRead, lib), Cint, (Cint, Cint), moduleID, DAQ)

SD_AIN_triggerIOconfig(moduleID::Int, direction::Int, syncMode::Int) =
  ccall((:SD_AIN_triggerIOconfig, lib), Cint, (Cint, Cint, Cint),
    moduleID, direction, syncMode)

SD_AIN_triggerIOwrite(moduleID::Int, value::Int) =
  ccall((:SD_AIN_triggerIOwrite, lib), Cint, (Cint, Cint), moduleID, value)

SD_AIN_triggerIOread(moduleID::Int) =
  ccall((:SD_AIN_triggerIOread, lib), Cint, (Cint,), moduleID)

SD_AIN_clockSetFrequency(moduleID::Int, frequency::Float64, mode::Int) =
  ccall((:SD_AIN_clockSetFrequency, lib), Cdouble, (Cint, Cdouble, Cint),
    moduleID, frequency, mode)

SD_AIN_clockGetFrequency(moduleID::Int) =
  ccall((:SD_AIN_clockGetFrequency, lib), Cdouble, (Cint,), moduleID)

SD_AIN_clockGetSyncFrequency(moduleID::Int) =
  ccall((:SD_AIN_clockGetSyncFrequency, lib), Cint, (Cint,), moduleID)

SD_AIN_clockResetPhase(moduleID::Int, triggerBehavior::Int, PXItrigger::Int,
  skew::Float64) =
  ccall((:SD_AIN_clockResetPhase, lib), Cint, (Cint, Cint, Cint, Cdouble),
    moduleID, triggerBehavior, PXItrigger, skew)

SD_AIN_DAQbufferPoolConfig(moduleID::Int, nDAQ::Int, dataBuffer, nPoints::Int, timeOut::Int, )
# int SD_AIN_DAQbufferPoolConfig(int moduleID, int nDAQ,short* dataBuffer, int nPoints, int timeOut, callbackEventPtr callbackFunction,void *callbackUserObj);

SD_AIN_DAQbufferAdd(moduleID::Int, nDAQ::Int, dataBuffer, nPoints::Int) =
  ccall((:SD_AIN_DAQbufferAdd, lib), Cint, (Cint, Cint, Ptr{Cshort}, Cint),
    moduleID, nDAQ, dataBuffer, nPoints)

SD_AIN_DAQbufferGet(moduleID::Int, nDAQ::Int, )
#    short* SD_AIN_DAQbufferGet(int moduleID, int nDAQ, int &readPointsOut, int &errorOut);

SD_AIN_DAQbufferRelease(moduleID::Int, nDAQ::Int) =
  ccall((:SD_AIN_DAQbufferRelease, lib), Cint, (Cint, Cint), moduleID, nDAQ)

SD_AIN_DAQbufferRemove(moduleID::Int, nDAQ::Int) =
  ccall((:SD_AIN_DAQbufferRemove, lib), Ptr{Cshort}, (Cint, Cint),
    moduleID, nDAQ)

SD_AIN_FFT()
#    int SD_AIN_FFT(int moduleID, int channel,short *data, int size, double *result, int resultSize, double *resultPhase, bool dB, int windowType);

end # module
