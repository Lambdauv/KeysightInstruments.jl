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

SD_Module_getProductNameByIndex(index::Int, productName::String) =
  ccall((:SD_Module_getProductNameByIndex, lib), Cint, (Cint, Cstring),
    index, productName)

SD_Module_getProductNameBySlot(chassis::Int, slot::Int, productName::String) =
  ccall((:SD_Module_getProductNameBySlot, lib), Cint, (Cint, Cint, Cstring),
    chassis, slot, productName)

SD_Module_getSerialNumberByIndex(index::Int, serialNumber::String) =
  ccall((:SD_Module_getSerialNumberByIndex, lib), Cint, (Cint, Cstring),
    index, serialNumber)

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



##### SD_AIN Functions
end # module
