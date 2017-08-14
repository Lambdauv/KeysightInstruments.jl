## open
export SD_Module_openWithSerialNumber, SD_Module_openWithSlot
export SD_Module_openWithSerialNumberCompatibility
export SD_Module_openWithSlotCompatibility
## close
export SD_Module_close
## getProductName
export SD_Module_getProductNameByIndex, SD_Module_getProductNameBySlot
## getSerialNumber
export SD_Module_getSerialNumberByIndex, SD_Module_getSerialNumberBySlot

#lib = path/to/library_file (.dll for windows, .so for linux)

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
    ccall((:SD_Module_FPGAwritePCport, lib), Cint,
        (Cint, Cint, Ptr{Clong}, Cint,Cint, Cint, Cint),
        moduleID, nPCport, data, dataSize, address, addressMode, accessMode)

## FPGAreadPCport
SD_Module_FPGAreadPCport(moduleID::Int, nPCport::Int, data,
    dataSize::Int, address::Int, addressMode::Int, accessMode::Int) =
    ccall((:SD_Module_FPGAreadPCport, lib), Cint,
        (Cint, Cint, Ptr{Cint}, Cint, Cint, Cint, Cint),
        moduleID, nPCport, data, dataSize, address, addressMode, accessMode)
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
