# SD_Module Functions
export SD_Module_openWithSerialNumber, SD_Module_openWithSlot,
	SD_Module_openWithSerialNumberCompatibility, SD_Module_openWithSlotCompatibility,
	SD_Module_close, SD_Module_count, SD_Module_getProductNameBySlot,
	SD_Module_getProductNameByIndex, SD_Module_getSerialNumberBySlot,
	SD_Module_getSerialNumberByIndex, SD_Module_getTypeBySlot, SD_Module_getTypeByIndex,
	SD_Module_getChassisByIndex, SD_Module_getSlotByIndex, SD_Module_runSelfTest,
	SD_Module_getStatus, SD_Module_getSerialNumber, SD_Module_getProductName,
	SD_Module_getFirmwareVersion, SD_Module_getHardwareVersion, SD_Module_getChassis,
	SD_Module_getSlot, SD_Module_FPGAreadPCport, SD_Module_FPGAwritePCport,
	SD_Module_FPGAload, SD_Module_FPGAreset, SD_Module_readVariable,
	SD_Module_readVariableWithName, SD_Module_writeVariable, SD_Module_writeVariableWithName,
	SD_Module_readRegister, SD_Module_readRegisterWithName, SD_Module_readDoubleRegister,
	SD_Module_readDoubleRegisterWithName, SD_Module_writeRegister, SD_Module_writeRegisterWithName,
	SD_Module_writeDoubleRegister, SD_Module_writeDoubleRegisterWithName,
	SD_Module_PXItriggerWrite, SD_Module_PXItriggerRead, SD_Module_openHVI,
	SD_Module_compileHVI, SD_Module_compilationErrorMessageHVI, SD_Module_loadHVI,
	SD_Module_startHVI, SD_Module_pauseHVI, SD_Module_resumeHVI, SD_Module_stopHVI,
	SD_Module_resetHVI, SD_Module_DAQp2pStop, SD_Module_pipeSinkAddr,
	SD_Module_DAQp2pConfig, SD_Module_translateTriggerPXItoExternalTriggerLine,
	SD_Module_translateTriggerIOtoExternalTriggerLine

## open
"""
This function initializes a hardware module therefore it must be called before
using any other module-related function. A module can be opened using the
serial number or the chassis and slot number. The first option ensures the same
module is always opened regardless its chassis or slot location.
### Compatibility Options
- Legacy : Channel enumeration starts with CH0 --> COMPATIBILITY_LEGACY = 0
- Keysight : Channel enumeration starts with CH1 --> COMPATIBILITY_KEYSIGHT = 1
"""
## int SD_Module_openWithSerialNumber(const char *partNumber, const char *serialNumber);
SD_Module_openWithSerialNumber(partNumber::String, serialNumber::String) =
    ccall((:SD_Module_openWithSerialNumber, klib), Cint, (Cstring, Cstring),
        partNumber, serialNumber)

## int SD_Module_openWithSlot(const char *partNumber, int nChassis, int nSlot);
SD_Module_openWithSlot(partNumber::String, chassis::Integer, slot::Integer) =
    ccall((:SD_Module_openWithSlot, klib), Cint, (Cstring, Cint, Cint),
        partNumber, chassis, slot)

## int SD_Module_openWithSerialNumberCompatibility(const char* productName, const char* serialNumber, int compatibility);
SD_Module_openWithSerialNumberCompatibility(productName::String,
    serialNumber::String, compatibility::Integer) =
    ccall((:SD_Module_openWithSerialNumberCompatibility, klib), Cint,
        (Cstring, Cstring, Cint), productName, serialNumber, compatibility)

## int SD_Module_openWithSlotCompatibility(const char* productName, int chassis, int slot, int compatibility);
SD_Module_openWithSlotCompatibility(productName::String, chassis::Integer,
    slot::Integer, compatibility::Integer) =
    ccall((:SD_Module_openWithSlotCompatibility, klib), Cint, (Cstring, Cint,
        Cint, Cint), productName, chassis, slot, compatibility)

## int SD_Module_close(int moduleID);
"""
This function releases all the resources allocated for the module instance. It
must be always called before exiting the application.
"""
SD_Module_close(moduleID::Integer) =
    ccall((:SD_Module_close, klib), Cint, (Cint,), moduleID)

## int SD_Module_count();
"""
This function returns the number of Keysight modules installed in the system.
"""
SD_Module_count() =
    ccall((:SD_Module_count, klib), Cint, ())

## int SD_Module_getProductNameBySlot(int chassis, int slot, char *name);
function SD_Module_getProductNameBySlot(chassis::Integer, slot::Integer)
    name = Vector{UInt8}(128)
	val = ccall((:SD_Module_getProductNameBySlot, klib), Cint,
		(Cint, Cint, Ptr{UInt8}), chassis, slot, name)
	name[end] = 0	# ensure null-termination
	if val >= 0
		return unsafe_string(pointer(name))
	else
		return val
	end
end

## int SD_Module_getProductNameByIndex(int index, char *name);
"""
This function returns the product name of the specified device.
"""
function SD_Module_getProductNameByIndex(index::Integer)
    name = Vector{UInt8}(128)
    val = ccall((:SD_Module_getProductNameByIndex, klib), Cint,
		(Cint, Ptr{UInt8}), index, name)
	name[end] = 0	# ensure null-termination
	if val >= 0
		return unsafe_string(pointer(name))
	else
		return val
	end
end

## int SD_Module_getSerialNumberBySlot(int chassis, int slot, char *serial);
function SD_Module_getSerialNumberBySlot(chassis::Integer, slot::Integer)
	serial = Vector{UInt8}
	val = ccall((:SD_Module_getSerialNumberBySlot, klib), Cint,
		(Cint, Cint, Ptr{UInt8}), chassis, slot, serial)
	serial[end] = 0	# ensure null-termination
	if val >= 0
		return unsafe_string(pointer(serial))
	else
		return val
	end
end

## int SD_Module_getSerialNumberByIndex(int index, char *name);
"""
This function returns the serial number of the specified device.
"""
function SD_Module_getSerialNumberByIndex(index::Integer)
	serial = Vector{UInt8}(128)
	val = ccall((:SD_Module_getSerialNumberByIndex, klib), Cint,
		(Cint, Ptr{UInt8}), index, serial)
	serial[end] = 0	# ensure null-termination
	if val >= 0
		return unsafe_string(pointer(serial))
	else
		return val
	end
end

## int SD_Module_getTypeBySlot(int chassis, int slot);
SD_Module_getTypeBySlot(chassis::Integer, slot::Integer) =
	ccall((:SD_Module_getTypeBySlot, klib), Cint, (Cint, Cint), chassis, slot)

## int SD_Module_getTypeByIndex(int index);
SD_Module_getTypeByIndex(index::Integer) =
	ccall((:SD_Module_getTypeByIndex, klib), Cint, (Cint,), index)

## int SD_Module_getChassisByIndex(int index);
SD_Module_getChassisByIndex(index::Integer) =
	ccall((:SD_Module_getChassisByIndex, klib), Cint, (Cint,), index)
## int SD_Module_getSlotByIndex(int index);
SD_Module_getSlotByIndex(index::Integer) =
	ccall((:SD_Module_getSlotByIndex, klib), Cint, (Cint,), index)

## int SD_Module_runSelfTest(int moduleID);
SD_Module_runSelfTest(moduleID::Integer) =
	ccall((:SD_Module_runSelfTest, klib), Cint, (Cint,), moduleID)

## int SD_Module_getStatus(int moduleID);
SD_Module_getStatus(moduleID::Integer) =
	ccall((:SD_Module_getStatus, klib), Cint, (Cint,), moduleID)

## char* SD_Module_getSerialNumber(int moduleID, char *serialNumber);
function SD_Module_getSerialNumber(moduleID::Integer)
	serialNumber = Vector{UInt8}(128)
	val = ccall((:SD_Module_getSerialNumber, klib), Cstring, (Cint, Ptr{UInt8}),
		moduleID, serialNumber)
		return unsafe_string(pointer(serialNumber))
end

## char* SD_Module_getProductName(int moduleID, char *productName);
function SD_Module_getProductName(moduleID::Integer)
	productName = Vector{UInt8}(128)
	val = ccall((:SD_Module_getProductName, klib), Cstring, (Cint, Ptr{UInt8}),
		moduleID, productName)
	return unsafe_string(pointer(productName))
end

## double SD_Module_getFirmwareVersion(int moduleID);
SD_Module_getFirmwareVersion(moduleID::Integer) =
	ccall((:SD_Module_getFirmwareVersion, klib), Cdouble, (Cint,), moduleID)

## double SD_Module_getHardwareVersion(int moduleID);
SD_Module_getHardwareVersion(moduleID::Integer) =
	ccall((:SD_Module_getHardwareVersion, klib), Cdouble, (Cint,), moduleID)

## int SD_Module_getChassis(int moduleID);
"""
This function returns the chassis number where the device is located.
"""
SD_Module_getChassis(moduleID::Integer) =
	ccall((:SD_Module_getChassis, klib), Cint, (Cint,), moduleID)

## int SD_Module_getSlot(int moduleID);
"""
This function returns the slot number where the device is located.
"""
SD_Module_getSlot(moduleID::Integer) =
	ccall((:SD_Module_getSlot, klib), Cint, (Cint,), moduleID)

# FPGA
# int SD_Module_FPGAreadPCport(int moduleID, int port, int *buffer, int nDW, int address, int addressMode, int accessMode);
"""
This function reads data at the PCport FPGA Block.
"""
function SD_Module_FPGAreadPCport(moduleID::Integer, nPCport::Integer,
    nDW::Integer, address::Integer, addressMode::Integer, accessMode::Integer)
	buffer = Vector{Cint}(nDW)
    val = ccall((:SD_Module_FPGAreadPCport, klib), Cint,
        (Cint, Cint, Ref{Cint}, Cint, Cint, Cint, Cint),
        moduleID, nPCport, buffer, nDW, address, addressMode, accessMode)
	if val >= 0
		return buffer
	else
		return val
	end
end

## int SD_Module_FPGAwritePCport(int moduleID, int port, int *buffer, int nDW, int address, int addressMode, int accessMode);
"""
This function writes data at the PCport FPGA Block.
"""
function SD_Module_FPGAwritePCport(moduleID::Integer, nPCport::Integer, data,
    address::Integer, addressMode::Integer, accessMode::Integer)
	nDW = length(data)
    val = ccall((:SD_Module_FPGAwritePCport, klib), Cint,
        (Cint, Cint, Ref{Cint}, Cint, Cint, Cint, Cint),
        moduleID, nPCport, data, nDW, address, addressMode, accessMode)
	return val
end

## int SD_Module_FPGAload(int moduleID, const char *fileName);
SD_Module_FPGAload(moduleID::Integer, fileName::String) =
	ccall((:SD_Module_FPGAload, klib), Cint, (Cint, Cstring), moduleID, fileName)

## int SD_Module_FPGAreset(int moduleID, int mode);
SD_Module_FPGAreset(moduleID::Integer, mode::Integer) =
	ccall((:SD_Module_FPGAreset, klib), Cint, (Cint, Cint), moduleID, mode)

# HVI Registers
# int SD_Module_readVariable(int moduleID, int varNumber, int SD_DLL_API_REF_C errorOut);
 function SD_Module_readVariable(moduleID::Integer, varNumber::Integer)
 	errorOut = Cint(0)
 	val = ccall((:SD_Module_readVariable, klib), Cint,
		(Cint, Cint, Ref{Cint}), moduleID, varNumber, errorOut)
 	if errorOut < 0
 		return errorOut
 	else
 		return val
 	end
 end

# int SD_Module_readVariableWithName(int moduleID, const char *varName, int SD_DLL_API_REF_C errorOut);
function SD_Module_readVariableWithName(moduleID::Integer, varName::String)
	errorOut = Cint(0)
	val = ccall((:SD_Module_readVariableWithName, klib), Cint,
		(Cint, Cstring, Ref{Cint}), moduleID, varName, errorOut)
	if errorOut < 0
		return errorOut
	else
		return val
	end
end

# int SD_Module_writeVariable(int moduleID, int varNumber, int varValue);
SD_Module_writeVariable(moduleID::Integer, varNumber::Integer,
	varValue::Integer) =
	ccall((:SD_Module_writeVariable, klib), Cint, (Cint, Cint, Cint),
		moduleID, varNumber, varValue)

# int SD_Module_writeVariableWithName(int moduleID, const char *varName, int varValue);
SD_Module_writeVariableWithName(moduleID::Integer, varName::String,
	varValue::Integer) =
	ccall((:SD_Module_writeVariableWithName, klib), Cint, (Cint, Cstring, Cint),
		moduleID, varName, varValue)

## int SD_Module_readRegister(int moduleID, int varNumber, int SD_DLL_API_REF_C errorOut);
"""
This function reads a value from an HVI register of a hardware module.
"""
function SD_Module_readRegister(moduleID::Integer, varNumber::Integer)
	errorOut = Cint(0)
	val = ccall((:SD_Module_readRegister, klib), Cint, (Cint, Cint, Ref{Cint}),
		moduleID, varNumber, errorOut)
	if errorOut < 0
		return errorOut
	else
		return val
	end
end

## int SD_Module_readRegisterWithName(int moduleID, const char *varName, int SD_DLL_API_REF_C errorOut);
function SD_Module_readRegisterWithName(moduleID::Integer, varName::String)
	errorOut = Cint(0)
	val = ccall((:SD_Module_readRegisterWithName, klib), Cint,
		(Cint, Cstring, Ref{Cint}), moduleID, varName, errorOut)
	if errorOut < 0
		return errorOut
	else
		return val
	end
end

## double SD_Module_readDoubleRegister(int moduleID, int varNumber, const char *unit, int SD_DLL_API_REF_C errorOut);
function SD_Module_readDoubleRegister(moduleID::Integer, varNumber::Integer,
	unit::String)
	errorOut = Cint(0)
	val = ccall((:SD_Module_readDoubleRegister, klib), Cdouble, (Cint, Cint,
		Cstring, Ref{Cint}), moduleID, varNumber, unit, errorOut)
	if errorOut < 0
		return errorOut
	else
		return val
	end
end

## double SD_Module_readDoubleRegisterWithName(int moduleID, const char *varName, const char *unit, int SD_DLL_API_REF_C errorOut);
function SD_Module_readDoubleRegisterWithName(moduleID::Integer, varName::String,
	unit::String)
	errorOut = Cint(0)
	regValue = ccall((:SD_Module_readDoubleRegisterWithName, klib), Cdouble,
		(Cint, Cstring, Cstring, Ref{Cint}), moduleID, varName, unit, errorOut)
	if errorOut < 0
		return errorOut
	else
		return val
	end
end

## int SD_Module_writeRegister(int moduleID, int varNumber, int varValue);
"""
This function writes a value in an HVI register of a hardware module.
"""
SD_Module_writeRegister(moduleID::Integer, varNumber::Integer, varValue::Integer) =
	ccall((:SD_Module_writeRegister, klib), Cint, (Cint, Cint, Cint),
		moduleID, varNumber, varValue)

## int SD_Module_writeRegisterWithName(int moduleID, const char *varName, int varValue);
SD_Module_writeRegisterWithName(moduleID::Integer, varName::String, varValue::Integer) =
	ccall((:SD_Module_writeRegisterWithName, klib), Cint, (Cint, Cstring, Cint),
		moduleID, varName, varValue)

## int SD_Module_writeDoubleRegister(int moduleID, int varNumber, double value, const char *unit);
SD_Module_writeDoubleRegister(moduleID::Integer, varNumber::Integer, value::Real,
	unit::String) =
	ccall((:SD_Module_writeDoubleRegister, klib), Cint, (Cint, Cint, Cdouble,
		Cstring), moduleID, varNumber, value, unit)

## int SD_Module_writeDoubleRegisterWithName(int moduleID, const char *varName, double value, const char *unit);
SD_Module_writeDoubleRegisterWithName(moduleID::Integer, varName::String,
	value::Real, unit::String) =
	ccall((:SD_Module_writeDoubleRegisterWithName, klib), Cint, (Cint, Cstring,
		Cdouble, Cstring), moduleID, varName, value, unit)

## int SD_Module_PXItriggerWrite(int moduleID, int nPXItrigger, int value);
"""
This function sets the digital value of a PXI trigger in the PXI backplane.
This function is only available in PXI / PXI Express form factors.
"""
SD_Module_PXItriggerWrite(moduleID::Integer, nPXItrigger::Integer, value::Integer) =
	ccall((:SD_Module_PXItriggerWrite, klib), Cint, (Cint, Cint, Cint),
		moduleID, nPXItrigger, value)

## int SD_Module_PXItriggerRead(int moduleID, int nPXItrigger);
"""
This function reads the digital value of a PXI trigger in the PXI backplane.
This function is only available in PXI / PXI Express form factors.
"""
SD_Module_PXItriggerRead(moduleID::Integer, nPXItrigger::Integer) =
	ccall((:SD_Module_PXItriggerRead, klib), Cint, (Cint, Cint),
		moduleID, nPXItrigger)

# HVI Management
## int SD_Module_openHVI(int moduleID, const char *fileHVI);
SD_Module_openHVI(moduleID::Integer, fileHVI::String) =
	ccall((:SD_Module_openHVI, klib), Cint, (Cint, Cstring), moduleID, fileHVI)

## int SD_Module_compileHVI(int moduleID);
SD_Module_compileHVI(moduleID::Integer) =
	ccall((:SD_Module_compileHVI, klib), Cint, (Cint,), moduleID)

## int SD_Module_compilationErrorMessageHVI(int moduleID, int errorIndex, char *message, int maxSize);
SD_Module_compilationErrorMessageHVI(moduleID::Integer, errorIndex::Integer,
	message::String, maxSize::Integer) =
	ccall((:SD_Module_compilationErrorMessageHVI, klib), Cint,
		(Cint, Cint, Cstring, Cint), moduleID, errorIndex, message, maxSize)

## int SD_Module_loadHVI(int moduleID);
SD_Module_loadHVI(moduleID::Integer) =
	ccall((:SD_Module_loadHVI, klib), Cint, (Cint,), moduleID)

# HVI Control
## int SD_Module_startHVI(int moduleID);
SD_Module_startHVI(moduleID::Integer) =
	ccall((:SD_Module_startHVI, klib), Cint, (Cint,), moduleID)

## int SD_Module_pauseHVI(int moduleID);
SD_Module_pauseHVI(moduleID::Integer) =
	ccall((:SD_Module_pauseHVI, klib), Cint, (Cint,), moduleID)

## int SD_Module_resumeHVI(int moduleID);
SD_Module_resumeHVI(moduleID::Integer) =
	ccall((:SD_Module_resumeHVI, klib), Cint, (Cint,), moduleID)

## int SD_Module_stopHVI(int moduleID);
SD_Module_stopHVI(moduleID::Integer) =
	ccall((:SD_Module_stopHVI, klib), Cint, (Cint,), moduleID)

## int SD_Module_resetHVI(int moduleID);
SD_Module_resetHVI(moduleID::Integer) =
	ccall((:SD_Module_resetHVI, klib), Cint, (Cint,), moduleID)

# P2P
## int SD_Module_DAQp2pStop(int moduleID, int nChannel);
SD_Module_DAQp2pStop(moduleID::Integer, nChannel::Integer) =
	ccall((:SD_Module_DAQp2pStop, klib), Cint, (Cint, Cint), moduleID, nChannel)

## unsigned long long SD_Module_pipeSinkAddr(int moduleID, int nPipeSink);
SD_Module_pipeSinkAddr(moduleID::Integer, nPipeSink::Integer) =
	ccall((:SD_Module_pipeSinkAddr, klib), Culonglong, (Cint, Cint),
		moduleID, nPipeSink)

## int SD_Module_DAQp2pConfig(int moduleID, int nChannel, int dataSize, int timeOut, unsigned long long pipeSink);
SD_Module_DAQp2pConfig(moduleID::Integer, nChannel::Integer, dataSize::Integer,
	timeOut::Integer, pipeSink) =
	ccall((:SD_Module_DAQp2pConfig, klib), Cint, (Cint, Cint, Cint, Cint, Culonglong),
		moduleID, nChannel, dataSize, timeOut, pipeSink)

# External Trigger Lines
## int SD_Module_translateTriggerPXItoExternalTriggerLine(int moduleID, int trigger);
SD_Module_translateTriggerPXItoExternalTriggerLine(moduleID::Integer,
	trigger::Integer) =
	ccall((:SD_Module_translateTriggerPXItoExternalTriggerLine, klib), Cint,
		(Cint, Cint), moduleID, trigger)

## int SD_Module_translateTriggerIOtoExternalTriggerLine(int moduleID, int trigger);
SD_Module_translateTriggerIOtoExternalTriggerLine(moduleID::Integer,
	trigger::Integer) =
	ccall((:SD_Module_translateTriggerIOtoExternalTriggerLine, klib), Cint,
		(Cint, Cint), moduleID, trigger)
