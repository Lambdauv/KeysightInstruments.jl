# SD_Module Functions
export SD_Module_openWithSerialNumber, SD_Module_openWithSlot
export SD_Module_openWithSerialNumberCompatibility
export SD_Module_openWithSlotCompatibility, SD_Module_close, SD_Module_moduleCount
export SD_Module_getProductNameByIndex, SD_Module_getProductNameBySlot
export SD_Module_getSerialNumberByIndex, SD_Module_getSerialNumberBySlot
export SD_Module_getChassis, SD_Module_getSlot, SD_Module_PXItriggerWrite
export SD_Module_PXItriggerRead, SD_Module_FPGAwritePCport
export SD_Module_FPGAreadPCport, SD_Module_writeRegister
export SD_Module_writeRegisterWithName, SD_Module_writeDoubleRegister
export SD_Module_writeDoubleRegisterWithName
#lib = path/to/library_file (.dll for windows, .so for linux)

## open
"""
This function initializes a hardware module therefore it must be called before
using any other module-related function. A module can be opened using the
serial number or the chassis and slot number. The first option ensures the same
module is always opened regardless its chassis or slot location.
### Compatibility Options
Legacy : Channel enumeration starts with CH0 --> COMPATIBILITY_LEGACY = 0
Keysight : Channel enumeration starts with CH1 --> COMPATIBILITY_KEYSIGHT = 1
"""
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
const COMPATIBILITY_LEGACY          = Cint(0)
const COMPATIBILITY_KEYSIGHT        = Cint(1)

## close
"""
This function releases all the resources allocated for the module instance. It
must be always called before exiting the application.
"""
SD_Module_close(moduleID::Int) =
    ccall((:SD_Module_close, lib), Cint, (Cint,), moduleID)

## moduleCount
"""
This function returns the number of Keysight modules installed in the system.
"""
SD_Module_moduleCount() =
    ccall((:SD_Module_moduleCount, lib), Cint, ())

## getProductName
"""
This function returns the product name of the specified device.
"""
function SD_Module_getProductNameByIndex(index::Int)
    productName = Vector{UInt8}(128)
    val = ccall((:SD_Module_getProductNameByIndex, lib), Cint,
		(Cint, Ptr{UInt8}), index, productName)
	productName[end] = 0	# ensure null-termination
	if val >= 0
		return unsafe_string(pointer(productName))
	else
		return val
	end
end

function SD_Module_getProductNameBySlot(chassis::Int, slot::Int)
    productName = Vector{UInt8}(128)
	val = ccall((:SD_Module_getProductNameBySlot, lib), Cint,
		(Cint, Cint, Ptr{UInt8}), chassis, slot, productName)
	productName[end] = 0	# ensure null-termination
	if val >= 0
		return unsafe_string(pointer(productName))
	else
		return val
	end
end

## getSerialNumber
"""
This function returns the serial number of the specified device.
"""
function SD_Module_getSerialNumberByIndex(index::Int)
	serialNumber = Vector{UInt8}(128)
	val = ccall((:SD_Module_getSerialNumberByIndex, lib), Cint,
		(Cint, Ptr{UInt8}), index, serialNumber)
	serialNumber[end] = 0	# ensure null-termination
	if val >= 0
		return unsafe_string(pointer(serialNumber))
	else
		return val
	end
end

function SD_Module_getSerialNumberBySlot(chassis::Int, slot::Int)
	serialNumber = Vector{UInt8}
	val = ccall((:SD_Module_getSerialNumberBySlot, lib), Cint,
		(Cint, Cint, Ptr{UInt8}), chassis, slot, serialNumber)
	serialNumber[end] = 0	# ensure null-termination
	if val >= 0
		return unsafe_string(pointer(serialNumber))
	else
		return val
	end
end

## getChassis
"""
This function returns the chassis number where the device is located.
"""
SD_Module_getChassis(index::Int) =
	ccall((:SD_Module_getChassis, lib), Cint, (Cint,), index)

## getSlot
"""
This function returns the slot number where the device is located.
"""
SD_Module_getSlot(index::Int) =
	ccall((:SD_Module_getSlot, lib), Cint, (Cint,), index)

## PXItriggerWrite
"""
This function sets the digital value of a PXI trigger in the PXI backplane.
This function is only available in PXI / PXI Express form factors.
"""
SD_Module_PXItriggerWrite(moduleID::Int, nPXItrigger::Int, value::Int) =
	ccall((:SD_Module_PXItriggerWrite, lib), Cint, (Cint, Cint, Cint),
		moduleID, nPXItrigger, value)

## PXItriggerRead
"""
This function reads the digital value of a PXI trigger in the PXI backplane.
This function is only available in PXI / PXI Express form factors.
"""
SD_Module_PXItriggerRead(moduleID::Int, nPXItrigger::Int) =
	ccall((:SD_Module_PXItriggerRead, lib), Cint, (Cint, Cint),
		moduleID, nPXItrigger)

##### SD_Module Functions (FPGA-related)
## FPGAwritePCport
"""
This function writes data at the PCport FPGA Block.
"""
SD_Module_FPGAwritePCport(moduleID::Int, nPCport::Int, data::Int,
    dataSize::Int, address::Int, addressMode::Int, accessMode::Int) =
    ccall((:SD_Module_FPGAwritePCport, lib), Cint,
        (Cint, Cint, Ptr{Clong}, Cint,Cint, Cint, Cint),
        moduleID, nPCport, data, dataSize, address, addressMode, accessMode)

## FPGAreadPCport
"""
This function reads data at the PCport FPGA Block.
"""
SD_Module_FPGAreadPCport(moduleID::Int, nPCport::Int, data,
    dataSize::Int, address::Int, addressMode::Int, accessMode::Int) =
    ccall((:SD_Module_FPGAreadPCport, lib), Cint,
        (Cint, Cint, Ptr{Cint}, Cint, Cint, Cint, Cint),
        moduleID, nPCport, data, dataSize, address, addressMode, accessMode)

##### SD_Module Functions (HVI-related): Needs modification
## writeRegister
"""
This function writes a value in an HVI register of a hardware module.
"""
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
"""
This function reads a value from an HVI register of a hardware module.
"""
SD_Module_readRegister(moduleID::Int, regNumber::Int, regValue::Int) =
	ccall((:SD_Module_readRegister, lib), Cint, (Cint, Cint, Cint),
		moduleID, regNumber, regValue)

SD_Module_readRegisterWithName(moduleID::Int, regName::String, regValue::Int) =
	ccall((:SD_Module_readRegisterWithName, lib), Cint, (Cint, Cstring, Cint),
		moduleID, regName, regValue)

function SD_Module_readDoubleRegister(moduleID::Int, regNumber::Int,
	unit::String)
	errorOut = Cint(0)
	regValue = ccall((:SD_Module_readDoubleRegister, lib), Cdouble, (Cint, Cint,
		Cstring, Ref{Cint}), moduleID, regNumber, unit, errorOut)
	return errorOut, regValue
end

function SD_Module_readDoubleRegisterWithName(moduleID::Int, regName::String,
	unit::String)
	errorOut = Cint(0)
	regValue = ccall((:SD_Module_readDoubleRegisterWithName, lib), Cdouble,
		(Cint, Cstring, Cstring, Ref{Cint}), moduleID, regName, unit, errorOut)
	return errorOut, regValue
end
