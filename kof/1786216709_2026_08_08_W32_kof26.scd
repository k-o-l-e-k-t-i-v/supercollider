p=ProxySpace.push(s);


// feedback synth ///////////////////////////////////////

(
~feedback.ar(2);
~feedback.quant=4;
~feedback.fadeTime=2;
~feedback={
    var freq = \freq.kr(55);
    var cutoff = \cutoff.kr(1200).lag(0.01);
    var res = \res.kr(3.0).lag(0.01); // Resonance amount (0 to 4)
    
    var sig = LFSaw.ar(freq) * 0.4;
    
    var fdbk = LocalIn.ar(1);
    
    var filterIn = tanh(sig - (res * fdbk));
    
    var a = LFSaw.kr([1,1,1/36]).range(0,2pi);
    var perl = Perlin3.kr(a[0].cos,a[1].sin,a[2].tanh) / 10.0;
    var coef = exp(-2 * pi * (cutoff / SampleRate.ir())) + perl;
    
    var s1 = OnePole.ar(filterIn, coef);
    var s2 = OnePole.ar(s1, coef);
    var s3 = OnePole.ar(s2, coef);
    var s4 = OnePole.ar(s3, coef);
    
    LocalOut.ar(s4);
    
    (s4 * 0.6).dup;

    //Splay.ar(s4,0,0.25);
};
~feedback.play;
);
~feedback.stop(4);
~feedback.clear;
~feedback.pause;
~feedback.resume;

// Push the resonance high into self-oscillation
~feedback.set(\res, 1.0, \cutoff, 400);

// Shift the base frequency
~feedback.set(\freq, 110);

// Sweep the cutoff down for a deep analog growl
~feedback.set(\cutoff, 1500, \res, 3.5);

// Silence the proxy
~feedback.stop();
