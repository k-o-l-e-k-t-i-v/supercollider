p.push();
(
{
    var dur = 26 * 60; // 26 minutes in seconds
    var startFreq = 4;
    var endFreq = 22000;

    // Create a line from 0 to 1 over dur seconds
    var lin = Line.kr(0, 1, dur);

    // Convert linear ramp to logarithmic frequency sweep
    var freq = startFreq * (endFreq / startFreq).pow(lin);

    // Use freq as the frequency of a sine oscillator
    SinOsc.ar(freq!2, 0, 0.5)
}.play;
)

