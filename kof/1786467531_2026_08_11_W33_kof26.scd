
(
var flow = 100;     // Lowest frequency (Hz)
var fhigh = 1200;   // Highest frequency (Hz)
var n = 8;          // Number of voices

// Total semitone span mapped logarithmically (log2(x) = log(x) / log(2))
var semitoneSpan = 12 * (log(fhigh / flow) / log(2));

// Distance between each voice in semitones
var delta = semitoneSpan / (n - 1);

// Generate the array of exact frequencies
var freqs = flow * (2 ** ((Array.series(n, 0, 1) * delta) / 12));

freqs.postln;
)


