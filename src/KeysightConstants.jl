
## Compatibility
const COMPATIBILITY_LEGACY          = Cint(0)
const COMPATIBILITY_KEYSIGHT        = Cint(1)

## channelInputConfig
# Input Impedance
const AIN_IMPEDANCE_HZ              = Cint(0)
const AIN_IMPEDANCE_50              = Cint(1)
# Input Coupling
const AIN_COUPLING_DC               = Cint(0)
const AIN_COUPLING_AC               = Cint(1)

## channelTriggerConfig
const AIN_RISING_EDGE               = Cint(1)
const AIN_FALLING_EDGE              = Cint(2)
const AIN_BOTH_EDGES                = Cint(3)

## DAQconfig
const AUTOTRIG                      = Cint(0)
const SWHVITRIG                     = Cint(1)
const HWDIGTRIG                     = Cint(2)
const HWANATRIG                     = Cint(3)

## DAQdigitalTriggerConfig
# DAQ Hardware Digital Trigger Source
const TRIG_EXTERNAL                 = Cint(0)
const TRIG_PXI                      = Cint(1)
# DAQ Hardware Digital Trigger Behavior
const TRIG_HIGH                     = Cint(1)
const TRIG_LOW                      = Cint(2)
const TRIG_RISE                     = Cint(3)
const TRIG_FALL                     = Cint(4)

## triggerIOconfig
# Trigger I/O Options
const AOU_TRG_OUT                   = Cint(0)
const AOU_TRG_IN                    = Cint(1)
# Trigger Synchronization/Sampling Options
const SYNC_NONE                     = Cint(0)
const SYNC_CLK_0                    = Cint(1)

## clockSetFrequency
# CLK Set Frequency Mode
const CLK_LOW_JITTER                = Cint(0)
const CLK_FAST_TUNE                 = Cint(1)

## FFT
# Window types used in FFT function
const WINDOW_RECTANGULAR            = Cint(0)
const WINDOW_BARTLETT               = Cint(1)
const WINDOW_HANNING                = Cint(2)
const WINDOW_HAMMING                = Cint(3)
const WINDOW_BLACKMAN               = Cint(4)
const WINDOW_KAISER                 = Cint(5)
const WINDOW_GAUSS                  = Cint(6)
