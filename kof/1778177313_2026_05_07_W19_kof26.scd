// In SuperCollider:
(
{
    // Read 720*576 pixels directly from the C-mapped memory
    // '1' is the number of channels, but we treat the whole block as a signal
    var sig = SharedMemoryIn.ar("/sc_diff_buffer", WIDTH * HEIGHT); 

    // Use it as a wavetable or a modulator
    LeakDC.ar(sig) * 0.1; 
}.play;
)
