#int SD_HVI_load(int HVIID);
#int SD_HVI_open(char* HVIfile);
#int SD_HVI_close(int HVIID);
#int SD_HVI_start(int HVIID);
#int SD_HVI_pause(int HVIID);
#int SD_HVI_resume(int HVIID);
#int SD_HVI_stop(int HVIID);
#int SD_HVI_reset(int HVIID);
#int SD_HVI_compilationErrorMessage(int HVIID, int errorIndex, char *message, int maxSize);

#int SD_HVI_assignHardwareWithIndexAndSerialNumber(int HVIID, int index, const char *productName, const char *serialNumber);
SD_HVI_assignHardwareWithIndexAndSerialNumber(HVIID::Integer, index::Integer, productName::String, serialNumber::String) =
ccall((:SD_HVI_assignHardwareWithIndexAndSerialNumber, klib), Cint, (Cint, Cint, Cstring, Cstring), HVIID, index, productName, serialNumber)

#int SD_HVI_assignHardwareWithIndexAndSlot(int HVIID, int index, int chassis, intslot);
#int SD_HVI_assignHardwareWithUserNameAndSerialNumber(int HVIID, const char *moduleUserName, const char *productName, const char *serialNumber);
#int SD_HVI_assignHardwareWithUserNameAndSlot(int HVIID, const char *moduleUserName, int chassis, intslot);
#int SD_HVI_assignHardwareWithUserNameAndModuleID(int HVIID, const char *moduleUserName, int module);

#int SD_HVI::getNumberOfModules();
#int SD_HVI_getModuleIndex(int HVIID, const char *moduleUserName);
#int SD_HVI_getModuleIDwithIndex(int HVIID, int index);
#int SD_HVI_getModuleIDwithUserName(int HVIID, const char *moduleUserName);

#int SD_HVI_writeIntegerConstantWithIndex(int HVIID, int moduleIndex, const char *constantName, intvalue);
#int SD_HVI_writeIntegerConstantWithUserName(int HVIID, const char *moduleUserName, const char *constantName, intvalue);
#int SD_HVI_writeDoubleConstantWithIndex(int HVIID, int moduleIndex, const char *constantName, double value, const char *unit);
#int SD_HVI_writeDoubleConstantWithUserName(int HVIID, const char *moduleUserName, const char *constantName, double value, const char *unit);

#int SD_HVI_readIntegerConstantWithIndex(int HVIID, int moduleIndex, const char *constantName, int &value);
#int SD_HVI_readIntegerConstantWithUserName(int HVIID, const char *moduleUserName, const char *constantName, int &value);
#int SD_HVI_readDoubleConstantWithIndex(int HVIID, int moduleIndex, const char *constantName, double &value, const char * &unit);
#int SD_HVI_readDoubleConstantWithUserName(int HVIID, const char *moduleUserName, const char *constantName, double &value, const char * &unit);
