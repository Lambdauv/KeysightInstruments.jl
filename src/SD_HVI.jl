export SD_HVI_assignHardwareWithIndexAndSlot,
SD_HVI_assignHardwareWithUserNameAndSerialNumber,
SD_HVI_assignHardwareWithUserNameAndSlot,
SD_HVI_assignHardwareWithUserNameAndModuleID,
SD_HVI_getModuleIndex,
SD_HVI_getModuleIDwithIndex,
SD_HVI_getModuleIDwithUserName,
SD_HVI_writeIntegerConstantWithIndex,
SD_HVI_writeIntegerConstantWithUserName,
SD_HVI_writeDoubleConstantWithIndex,
SD_HVI_writeDoubleConstantWithUserName,
SD_HVI_readIntegerConstantWithIndex,
SD_HVI_readIntegerConstantWithUserName,
SD_HVI_readDoubleConstantWithIndex,
SD_HVI_readDoubleConstantWithUserName,
SD_HVI_load,
SD_HVI_open,
SD_HVI_close,
SD_HVI_start,
SD_HVI_pause,
SD_HVI_resume,
SD_HVI_stop,
SD_HVI_reset,
SD_HVI_compilationErrorMessage,
SD_HVI_getNumberOfModules,
SD_HVI_getModuleName

# Load and run existing HVI

#int SD_HVI_load(int HVIID);
SD_HVI_load(HVIID::Integer) =
	ccall((:SD_HVI_load, klib), Cint, (Cint,), HVIID)
#int SD_HVI_open(char* HVIfile);
SD_HVI_open(HVIfile::String) =
	ccall((:SD_HVI_open, klib), Cint, (Cstring,), HVIfile)
#int SD_HVI_close(int HVIID);
SD_HVI_close(HVIID::Integer) =
	ccall((:SD_HVI_close, klib), Cint, (Cint,), HVIID)
#int SD_HVI_start(int HVIID);
SD_HVI_start(HVIID::Integer) =
	ccall((:SD_HVI_start, klib), Cint, (Cint,), HVIID)
#int SD_HVI_pause(int HVIID);
SD_HVI_pause(HVIID::Integer) =
	ccall((:SD_HVI_pause, klib), Cint, (Cint,), HVIID)
#int SD_HVI_resume(int HVIID);
SD_HVI_resume(HVIID::Integer) =
	ccall((:SD_HVI_resume, klib), Cint, (Cint,), HVIID)
#int SD_HVI_stop(int HVIID);
SD_HVI_stop(HVIID::Integer) =
	ccall((:SD_HVI_stop, klib), Cint, (Cint,), HVIID)
#int SD_HVI_reset(int HVIID);
SD_HVI_reset(HVIID::Integer) =
	ccall((:SD_HVI_reset, klib), Cint, (Cint,), HVIID)
#int SD_HVI_compilationErrorMessage(int HVIID, int errorIndex, char *message, int maxSize);
SD_HVI_compilationErrorMessage(HVIID::Integer, errorIndex::Integer, message::String, maxSize::Integer) =
	ccall((:SD_HVI_compilationErrorMessage, klib), Cint, (Cint, Cint, Cstring, Cint), HVIID, errorIndex, mesasge, maxSize)

# Assign Hardware

#int SD_HVI_assignHardwareWithIndexAndSerialNumber(int HVIID, int index, const char *productName, const char *serialNumber);
SD_HVI_assignHardwareWithIndexAndSerialNumber(HVIID::Integer, index::Integer, productName::String, serialNumber::String) =
ccall((:SD_HVI_assignHardwareWithIndexAndSerialNumber, klib), Cint, (Cint, Cint, Cstring, Cstring), HVIID, index, productName, serialNumber)

#int SD_HVI_assignHardwareWithIndexAndSlot(int HVIID, int index, int chassis, int slot);
SD_HVI_assignHardwareWithIndexAndSlot(HVIID::Integer, index::Integer, chassis::Integer, intslot::Integer) =
	ccall((:SD_HVI_assignHardwareWithIndexAndSlot, klib), Cint, (Cint, Cint, Cint, Cint), HVIId, index, chassis, intslot)

#int SD_HVI_assignHardwareWithUserNameAndSerialNumber(int HVIID, const char *moduleUserName, const char *productName, const char *serialNumber);
SD_HVI_assignHardwareWithUserNameAndSerialNumber(HVIID::Integer, moduleUserName::String, productName::String, serialNumber::String) =
	ccall((:SD_HVI_assignHardwareWithUserNameAndSerialNumber, klib), Cint, (Cint, Cstring, Cstring, Cstring), HVIID, moduleUserName, productName, serialNumber)

#int SD_HVI_assignHardwareWithUserNameAndSlot(int HVIID, const char *moduleUserName, int chassis, int slot);
SD_HVI_assignHardwareWithUserNameAndSlot(HVIID::Integer, moduleUserName::String, chassis::Integer, intslot::Integer) =
	ccall((:SD_HVI_assignHardwareWithUserNameAndSlot, klib), Cint, (Cint, Cstring, Cint, Cint), HVIID, moduleUserName, chassis, intslot)

#int SD_HVI_assignHardwareWithUserNameAndModuleID(int HVIID, const char *moduleUserName, int module);
SD_HVI_assignHardwareWithUserNameAndModuleID(HVIID::Integer, moduleUserName::String, moduleID::Integer) =
	ccall((:SD_HVI_assignHardwareWithUserNameAndModuleID, klib), Cint, (Cint, Cstring, Cint), HVIID, moduleUserName, moduleID)


# Get module info

#int SD_HVI_getNumberOfModules(int HVIID);
SD_HVI_getNumberOfModules(HVIID::Integer) =
	ccall((:SD_HVI_getNumberOfModules, klib), Cint, (Cint,), HVIID)

#int SD_HVI_getModuleName(int HVIID, int index, char *buffer, int size);
SD_HVI_getModuleName(HVIID::Integer, index::Integer, buffer::String, size::Integer) =
	ccall((:SD_HVI_getModuleName, klib), Cint, (Cint, Cint, Cstring, Cint), HVIID, index, buffer, size)

#int SD_HVI_getModuleIndex(int HVIID, const char *moduleUserName);
SD_HVI_getModuleIndex(HVIID::Integer, moduleUserName::String) =
	ccall((:SD_HVI_getModuleIndex, klib), Cint, (Cint, Cstring), HVIID, moduleUserName)

#int SD_HVI_getModuleIDwithIndex(int HVIID, int index);
SD_HVI_getModuleIDwithIndex(HVIID::Integer, index::Integer) =
	ccall((:SD_HVI_getModuleIDwithIndex, klib), Cint, (Cint, Cint), HVIID, index)

#int SD_HVI_getModuleIDwithUserName(int HVIID, const char *moduleUserName);
SD_HVI_getModuleIDwithUserName(HVIID::Integer, moduleUserName::String) =
	ccall((:SD_HVI_getModuleIDwithUserName, klib), Cint, (Cint, Cstring), HVIID, moduleUserName)

# Communicate with HVI's constants

#int SD_HVI_writeIntegerConstantWithIndex(int HVIID, int moduleIndex, const char *constantName, int value);
SD_HVI_writeIntegerConstantWithIndex(HVIID::Integer, moduleIndex::Integer, constantName::String, value::Integer) =
	ccall((:SD_HVI_writeIntegerConstantWithIndex, klib), Cint, (Cint, Cint, Cstring, Cint), HVIID, moduleIndex, constantName, value)

#int SD_HVI_writeIntegerConstantWithUserName(int HVIID, const char *moduleUserName, const char *constantName, int value);
SD_HVI_writeIntegerConstantWithUserName(HVIID::Integer, moduleUserName::String, constantName::String, value::Integer) =
	ccall((:SD_HVI_writeIntegerConstantWithUserName, klib), Cint, (Cint, Cstring, Cstring, Cint), HVIID, moduleUserName, constantName, value)

#int SD_HVI_writeDoubleConstantWithIndex(int HVIID, int moduleIndex, const char *constantName, double value, const char *unit);
SD_HVI_writeDoubleConstantWithIndex(HVIID::Integer, moduleIndex::Integer, constantName::String, value::Float64, unit::String) =
	ccall((:SD_HVI_writeDoubleConstantWithIndex, klib), Cint, (Cint, Cint, Cstring, Cdouble, Cstring), HVIID, moduleIndex, constantName, value, unit)

#int SD_HVI_writeDoubleConstantWithUserName(int HVIID, const char *moduleUserName, const char *constantName, double value, const char *unit);
SD_HVI_writeDoubleConstantWithUserName(HVIID::Integer, moduleUserName::String, constantName::String, value::Float64, unit::String) =
	ccall((:SD_HVI_writeDoubleConstantWithUserName, klib), Cint, (Cint, Cstring, Cstring, Cdouble, Cstring), HVIID, moduleUserName, constantName, value, unit)

#int SD_HVI_readIntegerConstantWithIndex(int HVIID, int moduleIndex, const char *constantName, int &value);
function SD_HVI_readIntegerConstantWithIndex(HVIID::Integer, moduleIndex::Integer, constantName::String)
	value = Ref{Cint}(0)
	ret = ccall((:SD_HVI_readIntegerConstantWithIndex, klib), Cint, (Cint, Cint, Cstring, Ref{Cint}), HVIID, moduleIndex, constantName, value)
	return ret, value
end

#int SD_HVI_readIntegerConstantWithUserName(int HVIID, const char *moduleUserName, const char *constantName, int &value);
function SD_HVI_readIntegerConstantWithUserName(HVIID::Integer, moduleUserName::String, constantName::String)
	value = Ref{Cint}(0)
	ret = ccall((:SD_HVI_readIntegerConstantWithUserName, klib), Cint, (Cint, Cstring, Cstring, Ref{Cint}), HVIID, moduleUserName, constantName, value)
	return ret, value
end

#int SD_HVI_readDoubleConstantWithIndex(int HVIID, int moduleIndex, const char *constantName, double &value, const char * &unit);
function SD_HVI_readDoubleConstantWithIndex(HVIID::Integer, moduleIndex::Integer, constantName::String)
	value = Ref{Cdouble}(0)
	unit = Ref{Cstring}("")
	ret = ccall((:SD_HVI_readDoubleConstantWithIndex, klib), Cint, (Cint, Cint, Cstring, Ref{Cdouble}, Ref{Cstring}), HVIID, moduleIndex, constantName, value, unit)
	return ret, value, unit
end

#int SD_HVI_readDoubleConstantWithUserName(int HVIID, const char *moduleUserName, const char *constantName, double &value, const char * &unit);
function SD_HVI_readDoubleConstantWithUserName(HVIID::Integer, moduleUserName::String, constantName::String)
	value = Ref{Cdouble}(0)
	unit = Ref{Cstring}("")
	ret = ccall((:SD_HVI_readDoubleConstantWithUserName, klib), Cint, (Cint, Cstring, Cstring, Ref{Cdouble}, Ref{Cstring}), HVIID, moduleUserName, constantName, value, unit)
	return ret, value, unit
end
