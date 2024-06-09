


p.push();
~tempo = {110/120};

// one synth ///////////////////////////////////////

(
~one.ar(2);
~one.quant=4;
~one.fadeTime=2;
~one={
    var sig, in, freq;
    freq = 2**([1,5,8,12]/12+1) * 440;
    in = Blip.ar(SinOsc.kr(5,0,20,freq), 1000, 0.2) + Impulse.ar(~tempo*4/[1,2,3,4]);
    sig = Formlet.ar(in, XLine.kr(freq/4,freq,8), 0.005, 0.04);  //var freqs, times, sig;
    Splay.ar(sig,0.95,0.35);
};
~one.play;
);
~one.stop(4);
~one.clear;
~one.pause;
~one.resume;


