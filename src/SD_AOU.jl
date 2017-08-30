# SD_AOU Functions for Keysight M32XXA/M33XXA AWGs
export SD_AOU_initialize, SD_AOU_clockGetFrequency, SD_AOU_clockGetSyncFrequency,
    SD_AOU_clockSetFrequency, SD_AOU_clockResetPhase, SD_AOU_channelWaveShape,
    SD_AOU_channelFrequency, SD_AOU_channelPhase, SD_AOU_channelPhaseReset,
    SD_AOU_channelPhaseResetMultiple, SD_AOU_channelAmplitude, SD_AOU_channelOffset,
    SD_AOU_modulationAngleConfig, SD_AOU_modulationAmplitudeConfig,
    SD_AOU_modulationIQconfig, SD_AOU_clockIOconfig, SD_AOU_triggerIOconfigV5,
    SD_AOU_triggerIOconfig, SD_AOU_triggerIOwrite, SD_AOU_triggerIOread,
    SD_AOU_waveformGetAddress, SD_AOU_waveformGetMemorySize,
    SD_AOU_waveformMemoryGetWriteAddress, SD_AOU_waveformMemorySetWriteAddress,
    SD_AOU_waveformReLoadArrayInt16, SD_AOU_waveformReLoad,
    SD_AOU_waveformLoadArrayInt16, SD_AOU_waveformLoad, SD_AOU_waveformFlush,
    SD_AOU_AWGqueueWaveform, SD_AOU_AWGstreamingConfig, SD_AOU_AWGstreamingRelease,
    SD_AOU_AWGidleValue, SD_AOU_AWGidleValueRead, SD_AOU_waveformLoadP2Pstart,
    SD_AOU_waveformLoadP2Pclose, SD_AOU_waveformLoadP2PgetPhysicalAddress,
    SD_AOU_waveformLoadP2PwriteDataTest, SD_AOU_AWGstart, SD_AOU_AWGstop,
    SD_AOU_AWGresume, SD_AOU_AWGpause, SD_AOU_AWGtrigger, SD_AOU_AWGjumpNextWaveform,
    SD_AOU_AWGjumpNextWaveformMultiple, SD_AOU_AWGisRunning, SD_AOU_AWGnWFplaying,
    SD_AOU_AWGstartMultiple, SD_AOU_AWGstopMultiple, SD_AOU_AWGresumeMultiple,
    SD_AOU_AWGpauseMultiple, SD_AOU_AWGtriggerMultiple, SD_AOU_AWGflush,
    SD_AOU_AWGfromFile, SD_AOU_AWGfromArray, SD_AOU_AWGtriggerExternalConfig,
    SD_AOU_AWGqueueConfig, SD_AOU_AWGqueueConfigRead, SD_AOU_AWGqueueMarkerConfig,
    SD_AOU_AWGqueueSyncMode

## int SD_AOU_initialize(int moduleID);
SD_AOU_initialize(moduleID::Integer) =
    ccall((:SD_AOU_initialize, klib), Cint, (Cint,), moduleID)

## double SD_AOU_clockGetFrequency(int moduleID);
"""
This function returns the real hardware clock frequency. It may differ from the
frequency set with the function clockSetFrequency, due to the hardware
frequency resolution.
"""
SD_AOU_clockGetFrequency(moduleID::Integer) =
    ccall((:SD_AOU_clockGetFrequency, klib), Cdouble, (Cint,), moduleID)

## double SD_AOU_clockGetSyncFrequency(int moduleID);
"""
This function returns the frequency of Clock System
"""
SD_AOU_clockGetSyncFrequency(moduleID::Integer) =
    ccall((:SD_AOU_clockGetSyncFrequency, klib), Cint, (Cint,), moduleID)

## double SD_AOU_clockSetFrequency(int moduleID, double frequency, int mode);
"""
This function sets the module clock frequency.
### CLK Set Frequency Mode
- Low Jitter Mode : The clock system is set to achieve the lowest jitter,
sacrificing tuning speed --> CLK_LOW_JITTER = 0
- Fast Tuning Mode : The clock system is set to achieve the lowest tuning time,
sacrificing jitter performance --> CLK_FAST_TUNE = 1
"""
SD_AOU_clockSetFrequency(moduleID::Integer, frequency::Real, mode::Integer) =
    ccall((:SD_AOU_clockSetFrequency, klib), Cdouble, (Cint, Cdouble, Cint),
        moduleID, frequency, mode)


## int SD_AOU_clockResetPhase(int moduleID, int triggerBehavior, int PXItrigger, double skew);
SD_AOU_clockResetPhase(moduleID::Integer, triggerBehavior::Integer,
    PXItrigger::Integer, skew::Real) =
    ccall((:SD_AOU_clockResetPhase, klib), Cint, (Cint, Cint, Cint, Cdouble),
        moduleID, triggerBehavior, PXItrigger, skew)

## int SD_AOU_channelWaveShape(int moduleID, int nChannel, int waveShape);
"""
This function sets the channel output waveform type.
### Output Signal Selection
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
SD_AOU_channelWaveShape(moduleID::Integer, nChannel::Integer, waveShape::Integer) =
    ccall((:SD_AOU_channelWaveShape, klib), Cint, (Cint, Cint, Cint),
        moduleID, nChannel, waveShape)

## int SD_AOU_channelFrequency(int moduleID, int nChannel, double frequency);
"""
This function sets the frequency for the periodic signals generated by the
Function Generators.
"""
SD_AOU_channelFrequency(moduleID::Integer, nChannel::Integer, frequency::Real) =
    ccall((:SD_AOU_channelFrequency, klib), Cint, (Cint, Cint, Cdouble),
        moduleID, nChannel, frequency)

## int SD_AOU_channelPhase(int moduleID, int nChannel, double phase);
"""
This function sets the phase for the periodic signals generated by the
Function Generators.
"""
SD_AOU_channelPhase(moduleID::Integer, nChannel::Integer, phase::Real) =
    ccall((:SD_AOU_channelPhase, klib), Cint, (Cint, Cint, Cdouble),
        moduleID, nChannel, phase)

## int SD_AOU_channelPhaseReset(int moduleID, int channel);
"""
This function resets the accumulated phase of the selected signal. This
accumulated phase is the result of the phase continuous operation of the
product.
"""
SD_AOU_channelPhaseReset(moduleID::Integer, nChannel::Integer) =
    ccall((:SD_AOU_channelPhaseReset, klib), Cint, (Cint, Cint),
        moduleID, nChannel)

## int SD_AOU_channelPhaseResetMultiple(int moduleID, int channelMask);
"""
This function resets the accumulated phase of the selected channels
simultaneously. This accumulated phase is the result of the phase continuous
operation of the product.
"""
SD_AOU_channelPhaseResetMultiple(moduleID::Integer, channelMask::Integer) =
    ccall((:SD_AOU_channelPhaseResetMultiple, klib), Cint, (Cint, Cint),
        moduleID, channelMask)

## int SD_AOU_channelAmplitude(int moduleID, int nChannel, double amplitude);
"""
This function sets the amplitude of a channel.
"""
SD_AOU_channelAmplitude(moduleID::Integer, nChannel::Integer, amplitude::Real) =
    ccall((:SD_AOU_channelAmplitude, klib), Cint, (Cint, Cint, Cdouble),
        moduleID, nChannel, amplitude)

## int SD_AOU_channelOffset(int moduleID, int nChannel, double offset);
"""
This function sets the DC offset of a channel.
"""
SD_AOU_channelOffset(moduleID::Integer, nChannel::Integer, offset::Real) =
    ccall((:SD_AOU_channelOffset, klib), Cint, (Cint, Cint, Cdouble),
        moduleID, nChannel, offset)

## int SD_AOU_modulationAngleConfig(int moduleID, int nChannel, int modulationType, double deviationGain);
"""
This function configures the modulation in frequency/phase for the selected
channel.
### Angle Modulation Types
- No Modulation : Modulation is disabled --> AOU_MOD_OFF = 0 (default)
- Frequency Modulation : The AWG is used to modulate the channel frequency
--> AOU_MOD_FM = 1
- Frequency Modulation (32 bits): The AWG is used to modulate the channel
frequency. For models with -DM1 dual modulation option --> AOU_MOD_FM_32b = 1
- Phase Modulation : The AWG is used to modulate the channel phase
--> AOU_MOD_PM = 2
"""
SD_AOU_modulationAngleConfig(moduleID::Integer, nChannel::Integer,
    modulationType::Integer, deviationGain::Real) =
    ccall((:SD_AOU_modulationAngleConfig, klib), Cint, (Cint, Cint, Cint, Cdouble),
        moduleID, nChannel, modulationType, deviationGain)

## int SD_AOU_modulationAmplitudeConfig(int moduleID, int nChannel, int modulationType, double deviationGain);
"""
This function configures the modulation in amplitude/offset for the selected
channel.
"""
SD_AOU_modulationAmplitudeConfig(moduleID::Integer, nChannel::Integer,
    modulationType::Integer, deviationGain::Real) =
    ccall((:SD_AOU_modulationAmplitudeConfig, klib), Cint, (Cint, Cint, Cint,
        Cdouble), moduleID, nChannel, modulationType, deviationGain)

## int SD_AOU_modulationIQconfig(int moduleID, int nChannel, int enable);
"""
This function sets the IQ modulation for the selected channel.
### Amplitude Modulation Options
- No Modulation : Modulation is disabled. The channel amplitude and offset are
only set by the main registers set by the main registers
--> AOU_MOD_OFF = 0 (default)
- Amplitude Modulation : The modulating signal is used to modulate the channel
amplitude --> AOU_MOD_AM = 1
- Offset Modulation : The modulating signal is used to modulate the channel
offset --> AOU_MOD_OFFSET = 2
"""
SD_AOU_modulationIQconfig(moduleID::Integer, nChannel::Integer, enable::Integer) =
    ccall((:SD_AOU_modulationIQconfig, klib), Cint, (Cint, Cint, Cint),
        moduleID, nChannel, enable)

# Clock
## int SD_AOU_clockIOconfig(int moduleID, int clockConfig);
"""
This function configures the operation of the clock output connector.
### CLK Output Configurations
- Disable : The CLK connector is disabled --> CLK_CONN_DISABLED = 0 (default)
- CLKref Output : A copy of the reference clock is available at the CLK
connector --> CLK_REF_OUTPUT = 1
"""
SD_AOU_clockIOconfig(moduleID::Integer, clockConfig::Integer) =
    ccall((:SD_AOU_clockIOconfig, klib), Cint, (Cint, Cint), moduleID,
        clockIOconfig)

# Trigger
## int SD_AOU_triggerIOconfigV5(int moduleID, int direction, int syncMode);
SD_AOU_triggerIOconfigV5(moduleID::Integer, direction::Integer, syncMode::Integer) =
    ccall((:SD_AOU_triggerIOconfigV5, klib), Cint, (Cint, Cint, Cint),
        moduleID, direction, syncMode)

## int SD_AOU_triggerIOconfig(int moduleID, int direction);
"""
This function configures the trigger connector/line direction and
synchronization/sampling method
### Trigger I/O Options
- Trigger Output (readable) : TRG operates as a general purpose digital output
signal, which can be written by the user software --> AOU_TRG_OUT = 0
- Trigger Input : TRG operates as a trigger input, or as general purpose
digital input signal, which can be read by the user software --> AOU_TRG_IN = 1
### Trigger Synchronization/Sampling Options
- Non-synchronized mode : The trigger is sampled with an internal 100 MHz clock
--> SYNC_NONE = 0
- Synchronized mode : (PXI form factor only) The trigger is sampled using CLK10
--> SYNC_CLK_0 = 1
"""
SD_AOU_triggerIOconfig(moduleID::Integer, direction::Integer) =
    ccall((:SD_AOU_triggerIOconfig, klib), Cint, (Cint, Cint), moduleID, direction)

## int SD_AOU_triggerIOwrite(int moduleID, int value, int syncMode);
"""
This function sets the trigger output. The trigger must be configured as output
using function triggerIOconfig.
"""
SD_AOU_triggerIOwrite(moduleID::Integer, value::Integer, syncMode::Integer) =
    ccall((:SD_AOU_triggerIOwrite, klib), Cint, (Cint, Cint, Cint),
        moduleID, value, syncMode)

## int SD_AOU_triggerIOread(int moduleID);
"""
This function reads the trigger input.
"""
SD_AOU_triggerIOread(moduleID::Integer) =
    ccall((:SD_AOU_triggerIOread, klib), Cint, (Cint,), moduleID)

## int SD_AOU_waveformGetAddress(int moduleID, int waveformNumber);
SD_AOU_waveformGetAddress(moduleID::Integer, waveformNumber::Integer) =
    ccall((:SD_AOU_waveformGetAddress, klib), Cint, (Cint, Cint),
        moduleID, waveformNumber)

## int SD_AOU_waveformGetMemorySize(int moduleID, int waveformNumber);
SD_AOU_waveformGetMemorySize(moduleID::Integer, waveformNumber::Integer) =
    ccall((:SD_AOU_waveformGetMemorySize, klib), Cint, (Cint, Cint),
        moduleID, waveformNumber)

## int SD_AOU_waveformMemoryGetWriteAddress(int moduleID);
SD_AOU_waveformMemoryGetWriteAddress(moduleID::Integer) =
    ccall((:SD_AOU_waveformMemoryGetWriteAddress, klib), Cint, (Cint,), moduleID)

## int SD_AOU_waveformMemorySetWriteAddress(int moduleID, int writeAddress);
SD_AOU_waveformMemorySetWriteAddress(moduleID::Integer, writeAddress::Integer) =
    ccall((:SD_AOU_waveformMemorySetWriteAddress, klib), Cint, (Cint, Cint),
        moduleID, writeAddress)

## int SD_AOU_waveformReLoadArrayInt16(int moduleID, int waveformType, int waveformPoints, short *waveformDataRaw, int waveformNumber, int paddingMode SD_DEFAULT_NULL);
function SD_AOU_waveformReLoadArrayInt16(moduleID::Integer, waveformType::Integer,
    waveformDataRaw::Vector{Int16}, waveformNumber::Integer, paddingMode::Integer)
    waveformPoints = length(waveformDataRaw)
    val = ccall((:SD_AOU_waveformReLoadArrayInt16, klib), Cint,
        (Cint, Cint, Cint, Ref{Cshort}, Cint, Cint), moduleID, waveformType,
        waveformPoints, waveformDataRaw, waveformNumber, paddingMode)
    return val
end

## int SD_AOU_waveformReLoad(int moduleID, int waveformID, int waveformNumber, int paddingMode SD_DEFAULT_NULL);
"""
This function replaces a waveform located in the module onboard RAM. The size of
the new waveform must be smaller than or equal to the existing waveform.
"""
SD_AOU_waveformReLoad(moduleID::Integer, waveformID::Integer, waveformNumber::Integer,
    paddingMode::Integer) =
    ccall((:SD_AOU_waveformReLoad, klib), Cint, (Cint, Cint, Cint, Cint),
        moduleID, waveformID, waveformNumber, paddingMode)

## int SD_AOU_waveformLoadArrayInt16(int moduleID, int waveformType, int waveformPoints, short *waveformDataRaw, int waveformNumber, int paddingMode SD_DEFAULT_NULL);
function SD_AOU_waveformLoadArrayInt16(moduleID::Integer, waveformType::Integer,
    waveformDataRaw::Vector{Int16}, waveformNumber::Integer, paddingMode::Integer)
    waveformPoints = length(waveformDataRaw) # Not sure..
    val = ccall((:SD_AOU_waveformLoadArrayInt16, klib), Cint,
        (Cint, Cint, Cint, Ref{Cshort}, Cint, Cint), moduleID, waveformType,
        waveformPoints, waveformDataRaw, waveformNumber, paddingMode)
    return val
end

## int SD_AOU_waveformLoad(int moduleID, int waveformID, int waveformNumber, int paddingMode SD_DEFAULT_NULL);
"""
This function loads the specified waveform into the module onboard RAM.
Waveforms must be created first with the SD-Wave class.
"""
SD_AOU_waveformLoad(moduleID::Integer, waveformID::Integer,
    waveformNumber::Integer, paddingMode::Integer) =
    ccall((:SD_AOU_waveformLoad, klib), Cint, (Cint, Cint, Cint, Cint),
        moduleID, waveformID, waveformNumber, paddingMode)

## int SD_AOU_waveformFlush(int moduleID);
"""
This function deletes all the waveforms from the module onboard RAM and flushes
all the AWG queues.
"""
SD_AOU_waveformFlush(moduleID::Integer) =
    ccall((:SD_AOU_waveformFlush, klib), Cint, (Cint,), moduleID)

## int SD_AOU_AWGqueueWaveform(int moduleID, int nAWG, int waveformNumber, int triggerMode, int startDelay, int cycles, int prescaler);
"""
This function queues the specified waveform in one of the AWGs of the module.
The waveform must be already loaded in the module onboard RAM.
"""
SD_AOU_AWGqueueWaveform(moduleID::Integer, nAWG::Integer, waveformNumber::Integer,
    triggerMode::Integer, startDelay::Integer, cycles::Integer, prescaler::Integer) =
    ccall((:SD_AOU_AWGqueueWaveform, klib), Cint, (Cint, Cint, Cint, Cint, Cint,
        Cint, Cint), moduleID, nAWG, waveformNumber, triggerMode, startDelay,
        cycles, prescaler)

## TODO int SD_AOU_AWGstreamingConfig(int moduleID, int nAWG, int triggerMode, int startDelay, int prescaler, int waveformPoints, callbackWGPtr callbackFunction, void *callbackUserObj);
#SD_AOU_AWGstreamingConfig(moduleID::Integer, nAWG::Integer, triggerMode::Integer,
#    startDelay::Integer, prescaler::Integer, waveformPoints::Integer, )

## int SD_AOU_AWGstreamingRelease(int moduleID, int nAWG);
SD_AOU_AWGstreamingRelease(moduleID::Integer, nAWG::Integer) =
    ccall((:SD_AOU_AWGstreamingRelease, klib), Cint, (Cint, Cint), moduleID,
        nAWG)

## int SD_AOU_AWGidleValue(int moduleID, int nAWG, double value);
SD_AOU_AWGidleValue(moduleID::Integer, nAWG::Integer, value::Real) =
    ccall((:SD_AOU_AWGidleValue, klib), Cint, (Cint, Cint, Cdouble),
        moduleID, nAWG, value)

## double SD_AOU_AWGidleValueRead(int moduleID, int nAWG);
SD_AOU_AWGidleValueRead(moduleID::Integer, nAWG::Integer) =
    ccall((:SD_AOU_AWGidleValueRead, klib), Cdouble, (Cint, Cint), moduleID, nAWG)

## int SD_AOU_waveformLoadP2Pstart(int moduleID, int wfType, int points, int waveformNumber);
SD_AOU_waveformLoadP2Pstart(moduleID::Integer, wfType::Integer, points::Integer,
    waveformNumber::Integer) =
    ccall((:SD_AOU_waveformLoadP2Pstart, klib), Cint, (Cint, Cint, Cint, Cint),
        moduleID, wfType, points, waveformNumber)

## int SD_AOU_waveformLoadP2Pclose(int moduleID, int nDWwritten);
SD_AOU_waveformLoadP2Pclose(moduleID::Integer, nDWwritten::Integer) =
    ccall((:SD_AOU_waveformLoadP2Pclose, klib), Cint, (Cint, Cint), moduleID,
        nDWwritten)

## unsigned long long SD_AOU_waveformLoadP2PgetPhysicalAddress(int moduleID);
SD_AOU_waveformLoadP2PgetPhysicalAddress(moduleID::Integer) =
    ccall((:SD_AOU_waveformLoadP2PgetPhysicalAddress, klib), Culonglong,
        (Cint,), moduleID)

## int SD_AOU_waveformLoadP2PwriteDataTest(int moduleID, int wfType, int points, short *dataRaw, int paddingMode SD_DEFAULT_NULL);
function SD_AOU_waveformLoadP2PwriteDataTest(moduleID::Integer, wfType::Integer,
    dataRaw::Vector{Int16}, paddingMode::Integer)
    points = length(dataRaw)
    val = ccall((:SD_AOU_waveformLoadP2PwriteDataTest, klib), Cint,
        (Cint, Cint, Cint, Ref{Cshort}, Cint), moduleID, wfType, points,
        dataRaw, paddingMode)
    return val
end

## int SD_AOU_AWGstart(int moduleID, int nAWG);
"""
This function starts he selected AWG from the beginning of its queue. The
generation will start immediately or when a trigger is received, depending on
the trigger selection of the first waveform in the queue and provided that at
least one waveform is queued in the AWG.
"""
SD_AOU_AWGstart(moduleID::Integer, nAWG::Integer) =
    ccall((:SD_AOU_AWGstart, klib), Cint, (Cint, Cint), moduleID, nAWG)

## int SD_AOU_AWGstop(int moduleID, int nAWG);
"""
This function stops the selected AWG, setting the output to zero and resetting
the AWG queue to its initial position. All following incoming triggers are
ignored.
"""
SD_AOU_AWGstop(moduleID::Integer, nAWG::Integer) =
    ccall((:SD_AOU_AWGstop, klib), Cint, (Cint, Cint), moduleID, nAWG)

## int SD_AOU_AWGresume(int moduleID, int nAWG);
"""
The function resumes the operation of the selected AWG from the current
position of the queue.
"""
SD_AOU_AWGresume(moduleID::Integer, nAWG::Integer) =
    ccall((:SD_AOU_AWGresume, klib), Cint, (Cint, Cint), moduleID, nAWG)

## int SD_AOU_AWGpause(int moduleID, int nAWG);
"""
This function pauses the selected AWG, leaving the last waveform point at the
output, and ignoring all incoming triggers. The waveform generation can be
resumed calling AWGresume.
"""
SD_AOU_AWGpause(moduleID::Integer, nAWG::Integer) =
    ccall((:SD_AOU_AWGpause, klib), Cint, (Cint, Cint), moduleID, nAWG)

## int SD_AOU_AWGtrigger(int moduleID, int nAWG);
"""
This function triggers the selected AWG. The waveform waiting in the current
position of the queue is launched provided it is configured with VI/HVI Trigger.
"""
SD_AOU_AWGtrigger(moduleID::Integer, nAWG::Integer) =
    ccall((:SD_AOU_AWGtrigger, klib), Cint, (Cint, Cint), moduleID, nAWG)

## int SD_AOU_AWGjumpNextWaveform(int moduleID, int nAWG);
"""
This function forces a jump to the next waveform in the AWG queue. The jump is
executed once the current waveform has finished a complete cycle.
"""
SD_AOU_AWGjumpNextWaveform(moduleID::Integer, nAWG::Integer) =
    ccall((:SD_AOU_AWGjumpNextWaveform, klib), Cint, (Cint, Cint), moduleID, nAWG)

## int SD_AOU_AWGjumpNextWaveformMultiple(int moduleID, int AWGmask);
"""
This function forces a jump to the next waveform in the queue of several AWGs.
The jumps are executed once the current waveforms have finished a complete
cycle.
"""
SD_AOU_AWGjumpNextWaveformMultiple(moduleID::Integer, AWGmask::Integer) =
    ccall((:SD_AOU_AWGjumpNextWaveformMultiple, klib), Cint, (Cint, Cint),
        moduleID, AWGmask)

## int SD_AOU_AWGisRunning(int moduleID, int nAWG);
"""
This function returns if the AWG is running or stopped.
"""
SD_AOU_AWGisRunning(moduleID::Integer, nAWG::Integer) =
    ccall((:SD_AOU_AWGisRunning, klib), Cint, (Cint, Cint), moduleID, nAWG)

## int SD_AOU_AWGnWFplaying(int moduleID, int nAWG);
"""
This function returns the waveformNumber of the waveform which is currently
being generated.
"""
SD_AOU_AWGnWFplaying(moduleID::Integer, nAWG::Integer) =
    ccall((:SD_AOU_AWGnWFplaying, klib), Cint, (Cint, Cint), moduleID, nAWG)

## int SD_AOU_AWGstartMultiple(int moduleID, int AWGmask);
"""
This function starts the selected AWGs from the beginning of their queues. The
generation will start immediately or when a trigger is received, depending on
the trigger selection of the first waveform in their queues and provided that at
least one waveform is queued in these AWGs (functions AWGqueueWaveform, or AWG).
"""
SD_AOU_AWGstartMultiple(moduleID::Integer, AWGmask::Integer) =
    ccall((:SD_AOU_AWGstartMultiple, klib), Cint, (Cint, Cint),
        moduleID, AWGmask)

## int SD_AOU_AWGstopMultiple(int moduleID, int AWGmask);
"""
This function stops the selected AWGs, setting their outputs to zero and
resetting their respective queues to the initial positions. All following
incoming triggers are ignored.
"""
SD_AOU_AWGstopMultiple(moduleID::Integer, AWGmask::Integer) =
    ccall((:SD_AOU_AWGstopMultiple, klib), Cint, (Cint, Cint), moduleID, AWGmask)

## int SD_AOU_AWGresumeMultiple(int moduleID, int AWGmask);
"""
This function resumes the operation of the selected AWGs from the current
position of their respective queues.
"""
SD_AOU_AWGresumeMultiple(moduleID::Integer, AWGmask::Integer) =
    ccall((:SD_AOU_AWGresumeMultiple, klib), Cint, (Cint, Cint), moduleID,
        AWGmask)

## int SD_AOU_AWGpauseMultiple(int moduleID, int AWGmask);
"""
This function pauses the selected AWGs, leaving the last waveform point at the
output, and ignoring all incoming triggers. The waveform generation can be
resumed calling AWGresume.
"""
SD_AOU_AWGpauseMultiple(moduleID::Integer, AWGmask::Integer) =
    ccall((:SD_AOU_AWGpauseMultiple, klib), Cint, (Cint, Cint), moduleID,
        AWGmask)

## int SD_AOU_AWGtriggerMultiple(int moduleID, int AWGmask);
"""
This function triggers the selected AWGs. The waveform waiting in the current
position of the queue is launched provided it is configured with VI/HVI Trigger.
"""
SD_AOU_AWGtriggerMultiple(moduleID::Integer, AWGmask::Integer) =
    ccall((:SD_AOU_AWGtriggerMultiple, klib), Cint, (Cint, Cint), moduleID,
        AWGmask)

## int SD_AOU_AWGflush(int moduleID, int nAWG);
"""
This function empties the queue of the selected AWGs. Waveforms are not removed
from the module onboard RAM.
"""
SD_AOU_AWGflush(moduleID::Integer, nAWG::Integer) =
    ccall((:SD_AOU_AWGflush, klib), Cint, (Cint, Cint), moduleID, nAWG)

## int SD_AOU_AWGfromFile(int moduleID, int nAWG, const char *waveformFile, int triggerMode, int startDelay, int cycles, int prescaler, int paddingMode SD_DEFAULT_NULL);
SD_AOU_AWGfromFile(moduleID::Integer, nAWG::Integer, waveformFile::String,
    triggerMode::Integer, startDelay::Integer, cycles::Integer,
    prescaler::Integer, paddingMode::Integer) =
    ccall((:SD_AOU_AWGfromFile, klib), Cint, (Cint, Cint, Cstring, Cint, Cint,
        Cint, Cint, Cint), moduleID, nAWG, waveformFile, triggerMode, startDelay,
        cycles, prescaler, paddingMode)
# not sure if waveformFile is a pointer to the file or just a string of filename

## int SD_AOU_AWGfromArray(int moduleID, int nAWG, int triggerMode, int startDelay, int cycles, int prescaler, int waveformType, int waveformPoints, double* waveformDataA, double* waveformDataB SD_DEFAULT_NULL, int paddingMode SD_DEFAULT_NULL);
"""
This function provides a one-step method to load, queue and start a single
waveform in one of the module AWGs. The waveform can be loaded from an array of
points in memory or from a file.
### AWG Trigger Mode
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
function SD_AOU_AWGfromArray(moduleID::Integer, nAWG::Integer, triggerMode::Integer,
    startDelay::Integer, cycles::Integer, prescaler::Integer, waveformType::Integer,
    waveformDataA, waveformDataB=0, paddingMode::Integer=0)
    waveformPoints = length(waveformDataA)
    val = ccall((:SD_AOU_AWGfromArray, klib), Cint, (Cint, Cint, Cint, Cint,
        Cint, Cint, Cint, Cint, Ref{Cdouble}, Ref{Cdouble}), moduleID, nAWG,
        triggerMode, startDelay, cycles, prescaler, waveformType,
        waveformPoints, waveformDataA, waveformDataB, paddingMode)
    return val
end

## int SD_AOU_AWGtriggerExternalConfig(int moduleID, int nAWG, int externalSource, int triggerBehavior, int sync);
"""
This function configures the external triggers for the selected AWG. The
external trigger is used in case the waveform is queued with the external
trigger mode option (function AWGqueueWaveform).
### AWG External Trigger Source
- External I/O Trigger : The AWG trigger is a TRG connector/line of the module
I/O Triggers. PXI form factor only: this trigger can be synchronized to CLK10
--> TRIG_EXTERNAL = 0
- PXI Trigger [0..n] : PXI form factor only. The AWG external trigger is a PXI
trigger line and it is synchronized to CLK10 --> TRIG_PXI_AWG(=4000) + Trigger No.
### AWG External Trigger Behavior
- Active High : Trigger is active when it is at level high --> TRIG_HIGH = 1
- Active Low : Trigger is active when it is at level low --> TRIG_LOW = 2
- Rising Edge : Trigger is active on the rising edge --> TRIG_RISE = 3
- Falling Edge : Trigger is active on the falling edge --> TRIG_FALL = 4
"""
SD_AOU_AWGtriggerExternalConfig(moduleID::Integer, nAWG::Integer, externalSource::Integer,
    triggerBehavior::Integer, sync::Integer) =
    ccall((:SD_AOU_AWGtriggerExternalConfig, klib), Cint, (Cint, Cint, Cint,
        Cint, Cint), moduleID, nAWG, externalSource, triggerBehavior, sync)

## int SD_AOU_AWGqueueConfig(int moduleID, int nAWG, int mode);
"""
This function configures the cyclic mode of the queue. All waveforms must be
already queued in one of the AWGs of the module.
"""
SD_AOU_AWGqueueConfig(moduleID::Integer, nAWG::Integer, mode::Integer) =
    ccall((:SD_AOU_AWGqueueConfig, klib), Cint, (Cint, Cint, Cint), moduleID,
        nAWG, mode)

## int SD_AOU_AWGqueueConfigRead(int moduleID, int nAWG);
"""
This function reads the value of a cyclic mode of the queue. All waveforms must
be already queued in one of the AWGs of the module.
"""
SD_AOU_AWGqueueConfigRead(moduleID::Integer, nAWG::Integer) =
    ccall((:SD_AOU_AWGqueueConfigRead, klib), Cint, (Cint, Cint), moduleID, nAWG)

## int SD_AOU_AWGqueueMarkerConfig(int moduleID, int nAWG, int markerMode, int trgPXImask, int trgIOmask, int value, int syncMode, int length, int delay);
"""
This function configures the Marker generation for each AWG. All waveforms must
be already queued in one of the AWGs of the module.
"""
SD_AOU_AWGqueueMarkerConfig(moduleID::Integer, nAWG::Integer, markerMode::Integer,
    trgPXImask::Integer, trgIOmask::Integer, value::Integer, syncMode::Integer,
    length::Integer, delay::Integer) =
    ccall((:SD_AOU_AWGqueueMarkerConfig, klib), Cint,
        (Cint, Cint, Cint, Cint, Cint, Cint, Cint, Cint, Cint),
        moduleID, nAWG, markerMode, trgPXImask, trgIOmask, value, syncMode,
        length, delay)

## int SD_AOU_AWGqueueSyncMode(int moduleID, int nAWG, int syncMode);
"""
This function configures the sync mode of the queue. All waveforms must be
already queued in one of the AWGs of the module.
"""
SD_AOU_AWGqueueSyncMode(moduleID::Integer, nAWG::Integer, syncMode::Integer) =
    ccall((:SD_AOU_AWGqueueSyncMode, klib), Cint, (Cint, Cint, Cint),
        moduleID, nAWG, syncMode)

# Functions that exist in the manual, but not in the library `SD_AIN.h` file
# ## AWGreset
# """
# This function resets the selected AWG to its initial position.
# """
# SD_AOU_AWGreset(moduleID::Integer, nAWG::Integer) =
#     ccall((:SD_AOU_AWGreset, klib), Cint, (Cint, Cint), moduleID, nAWG)
