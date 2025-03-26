(
var frequencies = [];
var path = "/home/kof/src/2025/03-brezen/brightnessmapper/frequencies.txt".standardizePath;

// Check if the file exists and read its contents
if (File.exists(path)) {
    var contents = FileReader.read(path); // Read the entire content of the file
    contents.do { |line|
        // If the line contains a string, clean up and add the frequency
        if (line.isString) {
            var cleanedLine = line.compressSpaces; // Clean up spaces
            cleanedLine.split($ ).do { |value| // Split the line by space
                frequencies = frequencies.add(value.asFloat); // Convert to float and add to the list
            };
        } {
            line.do { |value|
                frequencies = frequencies.add(value.asFloat);
            };
        };
    };
    frequencies.postln; // Print all the loaded frequencies
} {
    "File not found!".postln;
};

// Define a SynthDef to play a frequency through DynKlank
SynthDef(\elementSound, { |freqs, amp = 0.3, dur = 1.0 |
    var sound;

    // Create a sum of sine waves at each frequency
    sound = freqs.collect { |freq|
        SinOsc.ar(freq, 0, amp); // Generate a sine wave at each frequency
    }.foldAdd; // Sum the sine waves together to combine them

    // Apply an envelope to the overall sound
    sound = EnvGen.kr(Env.perc(0.01, 0.5), doneAction: 2) * sound; // Envelope for shaping the sound

    // Output the sound to speakers
    Out.ar(0, sound);
}).add;

// Function to play the spectral lines as sound
~playElementSound = {
    frequencies.do { |freq|
        // Trigger a Synth to play each frequency
        Synth(\elementSound, [
            \freqs, [freq],   // Frequency for the current element (wrapped in an array)
            \amp, 0.3,       // Set the amplitude for the sound
            \dur, 1.0        // Set the duration for the sound
        ]);
        1.0.wait; // Wait for 1 second before the next frequency plays
    };
};

// Start playing the frequencies as sound
~playElementSound.value;
)

p.push();
