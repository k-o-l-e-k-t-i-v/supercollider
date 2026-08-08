


// feedback synth ///////////////////////////////////////

(
~feedback.ar(2);
~feedback.quant=4;
~feedback.fadeTime=2;
~feedback={
    var freq = \freq.kr(55);
    var cutoff = \cutoff.kr(1200).lag(0.01);
    var res = \res.kr(3.0).lag(0.01); // Resonance amount (0 to 4)
    
    // Raw oscillator core (sawtooth)
    var sig = LFSaw.ar(freq) * 0.4;
    
    // Feedback loop via LocalIn (introduces 1-block feedback delay)
    var fdbk = LocalIn.ar(1);
    
    // Non-linear input saturation mimicking transistor pairs
    var filterIn = tanh(sig - (res * fdbk));
    
    // Calculate one-pole coefficient based on cutoff frequency
    var coef = exp(-2 * pi * (cutoff / SampleRate.ir()));
    
    // Four cascaded OnePole lowpass stages
    var s1 = OnePole.ar(filterIn, coef);
    var s2 = OnePole.ar(s1, coef);
    var s3 = OnePole.ar(s2, coef);
    var s4 = OnePole.ar(s3, coef);
    
    // Send stage 4 back into the feedback loop
    LocalOut.ar(s4);
    
    // Scale and duplicate for stereo output
    (s4 * 0.6).dup;

  Splay.ar(sig,0.5,0.25);
};
~feedback.play;
);
~feedback.stop(4);
~feedback.clear;
~feedback.pause;
~feedback.resume;
