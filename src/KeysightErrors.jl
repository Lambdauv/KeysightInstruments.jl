# SD_Error
export keysight_error

const SD_ERROR_OPENING_MODULE                   = Cint(-8000)
const SD_ERROR_CLOSING_MODULE                   = Cint(-8001)
const SD_ERROR_OPENING_HVI                      = Cint(-8002)
const SD_ERROR_CLOSING_HVI                      = Cint(-8003)
const SD_ERROR_MODULE_NOT_OPENED                = Cint(-8004)
const SD_ERROR_MODULE_NOT_OPENED_BY_USER        = Cint(-8005)
const SD_ERROR_MODULE_ALREADY_OPENED            = Cint(-8006)
const SD_ERROR_HVI_NOT_OPENED                   = Cint(-8007)
const SD_ERROR_INVALID_OBJECTID                 = Cint(-8008)
const SD_ERROR_INVALID_MODULEID                 = Cint(-8009)
const SD_ERROR_INVALID_MODULEUSERNAME           = Cint(-8010)
const SD_ERROR_INVALID_HVIID                    = Cint(-8011)
const SD_ERROR_INVALID_OBJECT                   = Cint(-8012)
const SD_ERROR_INVALID_NCHANNEL                 = Cint(-8013)
const SD_ERROR_BUS_DOES_NOT_EXIST               = Cint(-8014)
const SD_ERROR_BITMAP_ASSIGNED_DOES_NOT_EXIST   = Cint(-8015)
const SD_ERROR_BUS_INVALID_SIZE                 = Cint(-8016)
const SD_ERROR_BUS_INVALID_DATA                 = Cint(-8017)
const SD_ERROR_INVALID_VALUE                    = Cint(-8018)
const SD_ERROR_CREATING_WAVE                    = Cint(-8019)
const SD_ERROR_NOT_VALID_PARAMETERS             = Cint(-8020)
const SD_ERROR_AWG                              = Cint(-8021)
const SD_ERROR_DAQ_INVALID_FUNCTIONALITY        = Cint(-8022)
const SD_ERROR_DAQ_POOL_ALREADY_RUNNING         = Cint(-8023)
const SD_ERROR_UNKNOWN                          = Cint(-8024)
const SD_ERROR_INVALID_PARAMETERS               = Cint(-8025)
const SD_ERROR_MODULE_NOT_FOUND                 = Cint(-8026)
const SD_ERROR_DRIVER_RESOURCE_BUSY             = Cint(-8027)
const SD_ERROR_DRIVER_RESOURCE_NOT_READY        = Cint(-8028)
const SD_ERROR_DRIVER_ALLOCATE_BUFFER           = Cint(-8029)
const SD_ERROR_ALLOCATE_BUFFER                  = Cint(-8030)
const SD_ERROR_RESOURCE_NOT_READY               = Cint(-8031)
const SD_ERROR_HARDWARE                         = Cint(-8032)
const SD_ERROR_INVALID_OPERATION                = Cint(-8033)
const SD_ERROR_NO_COMPILED_CODE                 = Cint(-8034)
const SD_ERROR_FW_VERIFICATION                  = Cint(-8035)
const SD_ERROR_COMPATIBILITY                    = Cint(-8036)
const SD_ERROR_INVALID_TYPE                     = Cint(-8037)
const SD_ERROR_DEMO_MODULE                      = Cint(-8038)
const SD_ERROR_INVALID_BUFFER                   = Cint(-8039)
const SD_ERROR_INVALID_INDEX                    = Cint(-8040)
const SD_ERROR_INVALID_NHISTOGRAM               = Cint(-8041)
const SD_ERROR_INVALID_NBINS                    = Cint(-8042)
const SD_ERROR_INVALID_MASK                     = Cint(-8043)
const SD_ERROR_INVALID_WAVEFORM                 = Cint(-8044)
const SD_ERROR_INVALID_STROBE                   = Cint(-8045)
const SD_ERROR_INVALID_STROBE_VALUE             = Cint(-8046)
const SD_ERROR_INVALID_DEBOUNCING               = Cint(-8047)
const SD_ERROR_INVALID_PRESCALER                = Cint(-8048)
const SD_ERROR_INVALID_PORT                     = Cint(-8049)
const SD_ERROR_INVALID_DIRECTION                = Cint(-8050)
const SD_ERROR_INVALID_MODE                     = Cint(-8051)
const SD_ERROR_INVALID_FREQUENCY                = Cint(-8052)
const SD_ERROR_INVALID_IMPEDANCE                = Cint(-8053)
const SD_ERROR_INVALID_GAIN                     = Cint(-8054)
const SD_ERROR_INVALID_FULLSCALE                = Cint(-8055)
const SD_ERROR_INVALID_FILE                     = Cint(-8056)
const SD_ERROR_INVALID_SLOT                     = Cint(-8057)
const SD_ERROR_INVALID_NAME                     = Cint(-8058)
const SD_ERROR_INVALID_SERIAL                   = Cint(-8059)
const SD_ERROR_INVALID_START                    = Cint(-8060)
const SD_ERROR_INVALID_END                      = Cint(-8061)
const SD_ERROR_INVALID_CYCLES                   = Cint(-8062)
const SD_ERROR_HVI_INVALID_NUMBER_MODULES       = Cint(-8063)
const SD_ERROR_DAQ_P2P_ALREADY_RUNNING          = Cint(-8064)

error_dict = Dict(
    SD_ERROR_OPENING_MODULE =>
        "Keysight Error: Opening module",
    SD_ERROR_CLOSING_MODULE =>
        "Keysight Error: Closing module",
    SD_ERROR_OPENING_HVI =>
        "Keysight Error: Opening HVI",
    SD_ERROR_CLOSING_HVI =>
        "Keysight Error: Closing HVI",
    SD_ERROR_MODULE_NOT_OPENED =>
        "Keysight Error: Module not opened",
    SD_ERROR_MODULE_NOT_OPENED_BY_USER =>
        "Keysight Error: Module not opened by user",
    SD_ERROR_MODULE_ALREADY_OPENED =>
        "Keysight Error: Module already opened",
    SD_ERROR_HVI_NOT_OPENED =>
        "Keysight Error: HVI not opened",
    SD_ERROR_INVALID_OBJECTID =>
        "Keysight Error: Invalid ObjectID",
    SD_ERROR_INVALID_MODULEID =>
        "Keysight Error: Invalid ModuleID",
    SD_ERROR_INVALID_MODULEUSERNAME =>
        "Keysight Error: Invalid Module User Name",
    SD_ERROR_INVALID_HVIID =>
        "Keysight Error: Invalid HVI",
    SD_ERROR_INVALID_OBJECT =>
        "Keysight Error: Invalid Object",
    SD_ERROR_INVALID_NCHANNEL =>
        "Keysight Error: Invalid channel number",
    SD_ERROR_BUS_DOES_NOT_EXIST =>
        "Keysight Error: Bus doesn’t exist",
    SD_ERROR_BITMAP_ASSIGNED_DOES_NOT_EXIST =>
        "Keysight Error: Any input assigned to the bitMap does not exist",
    SD_ERROR_BUS_INVALID_SIZE =>
        "Keysight Error: Input size does not fit on this bus",
    SD_ERROR_BUS_INVALID_DATA =>
        "Keysight Error: Input data does not fit on this bus",
    SD_ERROR_INVALID_VALUE =>
        "Keysight Error: Invalid value",
    SD_ERROR_CREATING_WAVE =>
        "Keysight Error: Creating Waveform",
    SD_ERROR_NOT_VALID_PARAMETERS =>
        "Keysight Error: Invalid Parameters",
    SD_ERROR_AWG =>
        "Keysight Error: AWG function failed",
    SD_ERROR_DAQ_INVALID_FUNCTIONALITY =>
        "Keysight Error: Invalid DAQ functionality",
    SD_ERROR_DAQ_POOL_ALREADY_RUNNING =>
        "Keysight Error: DAQ buffer pool is already running",
    SD_ERROR_UNKNOWN =>
        "Keysight Error: Unknown error",
    SD_ERROR_INVALID_PARAMETERS =>
        "Keysight Error: Invalid parameter",
    SD_ERROR_MODULE_NOT_FOUND =>
        "Keysight Error: Module not found",
    SD_ERROR_DRIVER_RESOURCE_BUSY =>
        "Keysight Error: Driver resource busy",
    SD_ERROR_DRIVER_RESOURCE_NOT_READY =>
        "Keysight Error: Driver resource not ready",
    SD_ERROR_DRIVER_ALLOCATE_BUFFER =>
        "Keysight Error: Cannot allocate buffer in driver",
    SD_ERROR_ALLOCATE_BUFFER =>
        "Keysight Error: Cannot allocate buffer",
    SD_ERROR_RESOURCE_NOT_READY =>
        "Keysight Error: Resource not ready",
    SD_ERROR_HARDWARE =>
        "Keysight Error: Hardware error",
    SD_ERROR_INVALID_OPERATION =>
        "Keysight Error: Invalid Operation",
    SD_ERROR_NO_COMPILED_CODE =>
        "Keysight Error: No compiled code in the module",
    SD_ERROR_FW_VERIFICATION =>
        "Keysight Error: Firmware verification failed",
    SD_ERROR_COMPATIBILITY =>
        "Keysight Error: Compatibility error",
    SD_ERROR_INVALID_TYPE =>
        "Keysight Error: Invalid type",
    SD_ERROR_DEMO_MODULE =>
        "Keysight Error: Demo module",
    SD_ERROR_INVALID_BUFFER =>
        "Keysight Error: Invalid buffer",
    SD_ERROR_INVALID_INDEX =>
        "Keysight Error: Invalid index",
    SD_ERROR_INVALID_NHISTOGRAM =>
        "Keysight Error: Invalid histogram number",
    SD_ERROR_INVALID_NBINS =>
        "Keysight Error: Invalid number of bins",
    SD_ERROR_INVALID_MASK =>
        "Keysight Error: Invalid mask",
    SD_ERROR_INVALID_WAVEFORM =>
        "Keysight Error: Invalid waveform",
    SD_ERROR_INVALID_STROBE =>
        "Keysight Error: Invalid strobe",
    SD_ERROR_INVALID_STROBE_VALUE =>
        "Keysight Error: Invalid strobe value",
    SD_ERROR_INVALID_DEBOUNCING =>
        "Keysight Error: Invalid debouncing",
    SD_ERROR_INVALID_PRESCALER =>
        "Keysight Error: Invalid prescaler",
    SD_ERROR_INVALID_PORT =>
        "Keysight Error: Invalid port",
    SD_ERROR_INVALID_DIRECTION =>
        "Keysight Error: Invalid direction",
    SD_ERROR_INVALID_MODE =>
        "Keysight Error: Invalid mode",
    SD_ERROR_INVALID_FREQUENCY =>
        "Keysight Error: Invalid frequency",
    SD_ERROR_INVALID_IMPEDANCE =>
        "Keysight Error: Invalid impedance",
    SD_ERROR_INVALID_GAIN =>
        "Keysight Error: Invalid gain",
    SD_ERROR_INVALID_FULLSCALE =>
        "Keysight Error: Invalid fullscale",
    SD_ERROR_INVALID_FILE =>
        "Keysight Error: Invalid file",
    SD_ERROR_INVALID_SLOT =>
        "Keysight Error: Invalid slot",
    SD_ERROR_INVALID_NAME =>
        "Keysight Error: Invalid product name",
    SD_ERROR_INVALID_SERIAL =>
        "Keysight Error: Invalid serial number",
    SD_ERROR_INVALID_START =>
        "Keysight Error: Invalid start",
    SD_ERROR_INVALID_END =>
        "Keysight Error: Invalid end",
    SD_ERROR_INVALID_CYCLES =>
        "Keysight Error: Invalid number of cycles",
    SD_ERROR_HVI_INVALID_NUMBER_MODULES =>
        "Keysight Error: Invalid number of modules on HVI",
    SD_ERROR_DAQ_P2P_ALREADY_RUNNING =>
        "Keysight Error: DAQ P2P is already running")

keysight_error(errorCode) = error_dict[errorCode]
