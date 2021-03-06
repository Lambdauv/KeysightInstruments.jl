__precompile__(true)
module KeysightInstruments
# Based on user's guide for M31XXA/M33XXA Digitizers:
# http://literature.cdn.keysight.com/litweb/pdf/M3100-90002.pdf?id=2796080
# and for M32XXA/M33XXA AWGs:
# http://literature.cdn.keysight.com/litweb/pdf/M3201-90001.pdf?id=2787170

"""
Load libraries: First need to install Keysight SD1 software from
http://www.keysight.com/main/software.jspx?cc=US&lc=eng&nid=-33786.536905585&id=2784055&pageMode=CV
"""
const klib = is_windows() ? "SD1core.dll" : "libSD1core.so"

# Keysight Constants
include("KeysightConstants.jl")
# SD_Module Functions
include("SD_Module.jl")
# SD_AIN Functions
include("SD_AIN.jl")
# SD_AOU Functions
include("SD_AOU.jl")
# SD_Wave Functions
include("SD_Wave.jl")
# SD_HVI Functions
include("SD_HVI.jl")

# Keysight Errors
include("KeysightErrors.jl")
end # module
