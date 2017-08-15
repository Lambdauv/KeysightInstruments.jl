# KeysightConstants.jl

"""
Compatibility Options for function `open` in `SD_Module.jl`
- Legacy : Channel enumeration starts with CH0 --> COMPATIBILITY_LEGACY = 0
- Keysight : Channel enumeration starts with CH1 --> COMPATIBILITY_KEYSIGHT = 1
"""
const COMPATIBILITY_LEGACY              = Cint(0)
const COMPATIBILITY_KEYSIGHT            = Cint(1)

"""
Options for the input impedance setting for function `channelInputConfig` in
`SD_AIN.jl`
- High Impedance : Input impedance is high --> AIN_IMPEDANCE_HZ = 0
- 50Ω : Input impedance is 50Ω  --> AIN_IMPEDANCE_50 = 1
"""
const AIN_IMPEDANCE_HZ                  = Cint(0)
const AIN_IMPEDANCE_50                  = Cint(1)

"""
Options for the input coupling setting for function `channelInputConfig` in
`SD_AIN.jl`
- DC : DC coupling --> AIN_COUPLING_DC = 0
- AC : AC coupling --> AIN_COUPLING_AC = 1
"""
const AIN_COUPLING_DC                   = Cint(0)
const AIN_COUPLING_AC                   = Cint(1)

"""
Options for the analog trigger (parameter `analogTriggerMode` in function
`channelTriggerConfig` in 'SD_AIN.jl'
- Rising Edge : Trigger is generated when the input signal is rising and crosses
the threshold --> AIN_RISING_EDGE = 0
- Falling Edge : Trigger is generated when the input signal is falling and
crosses the threshold --> AIN_FALLING_EDGE = 1
- Both Edges : Trigger is generated when the input signal crosses the threshold,
no matter if it is rising or falling --> AIN_BOTH_EDGES = 3
"""
const AIN_RISING_EDGE                   = Cint(1)
const AIN_FALLING_EDGE                  = Cint(2)
const AIN_BOTH_EDGES                    = Cint(3)

"""
Options for trigger modes
### DAQ trigger modes
parameter `triggerMode` in function `DAQconfig` in `SD_AIN.jl`
- Auto (Immediate) : The acquisition starts automatically after a call to
function DAQstart --> AUTOTRIG = 0
- Software / HVI : Software trigger. The acquisition is triggered by the
function DAQtrigger, provided that the DAQ is running. DAQtrigger can be
executed from the user application (VI) or from an HVI --> SWHVITRIG = 1
- Hardware Digital Trigger : Hardware trigger. The DAQ waits for an external
digital trigger --> HWDIGTRIG = 2
- Hardware Analog Trigger : Hardware trigger. The DAQ waits for an external
analog trigger (only products with analog inputs) --> HWANATRIG = 3
### Trigger methods for the waveforms queued in an AWG
parameter `triggerMode` in function `AWG`, or in function `AWGqueueWaveform` in
`SD_AOU.jl`.
- Auto : The waveform is launched automatically after function AWGstart, or
when the previous waveform in the queue finishes --> AUTOTRIG = 0
- Software / HVI : Software trigger. The AWG is triggered by the function
AWGtrigger, provided that the AWG is running. AWGtrigger can be executed from
the user application (VI) or from an HVI --> SWHVITRIG = 1
- Software / HVI (per cycle) : Software trigger. Identical to the previous
option, but the trigger is required per each waveform cycle
--> SWHVITRIG_CYCLE = 5
- External Trigger : Hardware trigger. The AWG waits for an external trigger
--> EXTTRIG = 2
- External Trigger (per cycle) : Hardware trigger. Identical to the previous
option, but the trigger is required per each waveform cycle --> EXTTRIG_CYCLE = 6
"""
const AUTOTRIG                      = Cint(0)
const SWHVITRIG                     = Cint(1)
const HWDIGTRIG                     = Cint(2)
const HWANATRIG                     = Cint(3)
const EXTTRIG                       = Cint(2)
const SWHVITRIG_CYCLE               = Cint(5)
const EXTTRIG_CYCLE                 = Cint(6)

"""
External trigger source
### External trigger source for the DAQ
parameter `externalSource` in function `DAQdigitalTriggerConfig`
- External I/O Trigger : The DAQ trigger is a TRG connector/line of the product.
PXI form factor only: this trigger can be synchronized to CLK10
--> TRIG_EXTERNAL = 0
- PXI Trigger : PXI form factor only. The DAQ trigger is a PXI trigger line
and it is synchronized to CLK10 --> TRIG_PXI = 1
### External trigger source for the AWGs
parameter `externalSource` in function `AWGtriggerExternalConfig`
- External I/O Trigger : The AWG trigger is a TRG connector/line of the module
I/O Triggers. PXI form factor only: this trigger can be synchronized to CLK10
--> TRIG_EXTERNAL = 0
- PXI Trigger [0..n] : PXI form factor only. The AWG external trigger is a PXI
trigger line and it is synchronized to CLK10 --> TRIG_PXI_AWG(=4000) + Trigger No.
"""
const TRIG_EXTERNAL                 = Cint(0)
const TRIG_PXI                      = Cint(1)
const TRIG_PXI_AWG                  = Cint(4000)

"""
Hardware digital trigger behavior for the DAQ (parameter `triggerBehavior`
in function `DAQdigitalTriggerConfig` in 'SD_AIN.jl') or External trigger
behavior for the AWGs (parameter `triggerBehavior` in function
`AWGtriggerExternalConfig` in 'SD_AOU.jl')
- Active High : Trigger is active when it is at level high --> TRIG_HIGH = 1
- Active Low : Trigger is active when it is at level low --> TRIG_LOW = 2
- Rising Edge : Trigger is active on the rising edge --> TRIG_RISE = 3
- Falling Edge : Trigger is active on the falling edge --> TRIG_FALL = 4
"""
const TRIG_HIGH                     = Cint(1)
const TRIG_LOW                      = Cint(2)
const TRIG_RISE                     = Cint(3)
const TRIG_FALL                     = Cint(4)

"""
### Trigger I/O Options
M31/M33XXA Digitizers & M32/M33XXA AWGs TRG connectors configuration (parameter
`direction` in function `triggerIOconfig` in both 'SD_AIN.jl' and 'SD_AOU.jl'
- Trigger Output (readable) : TRG operates as a general purpose digital output
signal, which can be written by the user software --> AOU_TRIG_OUT = 0
- Trigger Input : TRG operates as a trigger input, or as general purpose digital
input signal, which can be read by the user software --> AOU_TRIG_IN = 1
"""
const AOU_TRG_OUT                   = Cint(0)
const AOU_TRG_IN                    = Cint(1)

"""
### Trigger Synchronization/Sampling Options
M31/M33XXA Digitizers & M32/M33XXA AWGs TRG connectors configuration (parameter
`syncMode` in function `triggerIOconfig` in both 'SD_AIN.jl' and 'SD_AOU.jl'
- Non-synchronized mode : The trigger is sampled with an internal 100 MHz clock
--> SYNC_NONE = 0
- Synchronized mode : (PXI form factor only) The trigger is sampled using CLK10
--> SYNC_CLK_0 = 1
"""
const SYNC_NONE                     = Cint(0)
const SYNC_CLK_0                    = Cint(1)

"""
### Clock set frequency mode
parameter `mode` in function 'clockSetFrequency' in both 'SD_AIN.jl' and
'SD_AOU.jl'
- Low Jitter Mode : The clock system is set to achieve the lowest jitter,
sacrificing tuning speed --> CLK_LOW_JITTER = 0
- Fast Tuning Mode : The clock system is set to achieve the lowest tuning time,
sacrificing jitter performance --> CLK_FAST_TUNE = 1
"""
const CLK_LOW_JITTER                = Cint(0)
const CLK_FAST_TUNE                 = Cint(1)

"""
### Window types used in FFT function
M31/M33XXA digitizer FFT window types. Parameter `windowType` in function `FFT`
in `SD_AIN.jl`
- Rectangular : Simplest B-spine window --> WINDOW_RECTANGULAR = 0 (default)
- Bartlett : Hybrid window --> WINDOW_BARTLETT = 1
- Hanning : Side-lobes roll off about 18 dB per octave --> WINDOW_HANNING = 2
- Hamming : Optimized to minimize the maximum nearest side lobe
--> WINDOW_HAMMING = 3
- Blackman : Higher-order generalized cosine windows for applications that
require windowing by the convolution in the frequency-domain
--> WINDOW_BLACKMAN = 4
- Kaiser : Adjustable window maximizing energy concentration in the main lobe
--> WINDOW_KAISER = 5
- Gauss : Adjustable window (can be used for quadratic interpolation in
frequency estimation) --> WINDOW_GAUSS = 6
"""
const WINDOW_RECTANGULAR            = Cint(0)
const WINDOW_BARTLETT               = Cint(1)
const WINDOW_HANNING                = Cint(2)
const WINDOW_HAMMING                = Cint(3)
const WINDOW_BLACKMAN               = Cint(4)
const WINDOW_KAISER                 = Cint(5)
const WINDOW_GAUSS                  = Cint(6)

"""
### Output signal selection
parameter `waveShape` in function `channelWaveShape` in `SD_AOU.jl`
- HIZ : The output signal is set to HIZ (no output signal is provided, only
available for M3202A) AOU_HIZ = -1
- No Signal : The output signal is set to 0. All other channel settings are
maintained --> AOU_OFF = 0 (default)
- Sinusoidal : Generated by the Function Generator --> AOU_SINUSOIDAL = 1
- Triangular : Generated by the Function Generator --> AOU_TRIANGULAR = 2
- Square : Generated by the Function Generator --> AOU_SQUARE = 4
- DC Voltage : The output DC voltage is set by the channel amplitude setting
--> AOU_DC = 5
- Arbitrary Waveform : Generated by the Arbitrary Waveform Generator
--> AOU_AWG = 6
- Partner Channel : Only for odd channels. It is the output of the previous
channel (to create differential signals, etc.) --> AOU_PARTNER = 8
"""
const AOU_HIZ               = Cint(-1)
const AOU_OFF               = Cint(0)
const AOU_SINUSOIDAL        = Cint(1)
const AOU_TRIANGULAR        = Cint(2)
const AOU_SQUARE            = Cint(4)
const AOU_DC                = Cint(5)
const AOU_AWG               = Cint(6)
const AOU_PARTNER           = Cint(8)

"""
## Modulation Options
### Angle Modulation Options
Parameter `modulationType` in function `modulationAngleConfig` in `SD_AOU.jl`
- No Modulation : Modulation is disabled --> AOU_MOD_OFF = 0 (default)
- Frequency Modulation : The AWG is used to modulate the channel frequency
--> AOU_MOD_FM = 1
- Frequency Modulation (32 bits): The AWG is used to modulate the channel
frequency. For models with -DM1 dual modulation option --> AOU_MOD_FM_32b = 1
- Phase Modulation : The AWG is used to modulate the channel phase
--> AOU_MOD_PM = 2
### Amplitude Modulation Options
- No Modulation : Modulation is disabled. The channel amplitude and offset are
only set by the main registers set by the main registers
--> AOU_MOD_OFF = 0 (default)
- Amplitude Modulation : The modulating signal is used to modulate the channel
amplitude --> AOU_MOD_AM = 1
- Offset Modulation : The modulating signal is used to modulate the channel
offset --> AOU_MOD_OFFSET = 2
"""
const AOU_MOD_OFF                   = Cint(0)
const AOU_MOD_FM                    = Cint(1)
const AOU_MOD_FM_32b                = Cint(1)
const AOU_MOD_PM                    = Cint(2)
const AOU_MOD_AM                    = Cint(1)
const AOU_MOD_OFFSET                = Cint(2)

"""
## CLK Output Options
M32/M33XXA AWGs output clock configuration. Parameter `clockConfig` in function
`clockIOconfig` in `SD_AOU.jl`
"""
const CLK_CONN_DISABLED                 = Cint(0)
const CLK_REF_OUTPUT                    = Cint(1)

"""
## AWG Waveform Types
Waveform types for the AWGs (parameter `waveformType` in the waveform file or in
function `new` in `SD_Wave.jl`
- Analog 16 Bits : Analog normalized waveforms (-1..1) defined with doubles
--> WAVE_ANALOG_16 = 0
- Analog 32 Bits : Analog normalized waveforms (-1..1) defined with doubles
--> WAVE_ANALOG_32 = 1
- Analog 16 Bits Dual : Analog normalized waveforms (-1..1) defined with
doubles, with two components (A and B) --> WAVE_ANALOG_16_DUAL = 4
- Analog 32 Bits Dual : Analog normalized waveforms (-1..1) defined with
doubles, with two components (A and B) --> WAVE_ANALOG_32_DUAL = 6
- IQ : Analog normalized waveforms (-1..1) defined with doubles, with two
components (I and Q) --> WAVE_IQ = 2
- IQ Polar : Analog waveforms (-1..1 module, -180..+180 phase) defined with
doubles, with two components (Module and Phase) --> WAVE_IQPOLAR = 3
- Digital : Digital waveforms defined with integers --> WAVE_DIGITAL = 5
"""
const WAVE_ANALOG_16                = Cint(0)
const WAVE_ANALOG_32                = Cint(1)
const WAVE_ANALOG_16_DUAL           = Cint(4)
const WAVE_ANALOG_32_DUAL           = Cint(6)
const WAVE_IQ                       = Cint(2)
const WAVE_IQPOLAR                  = Cint(3)
const WAVE_DIGITAL                  = Cint(5)
