
p.push();


// one synth ///////////////////////////////////////

(
~one.ar(2);
~one.quant=4;
~one.fadeTime=2;
~one={
    var sig = 2**([1,9,8]/LFSaw.ar(4).range(8,14)+1);
    var base = 432/2;
    var freq = base * sig;
    sig = SinOsc.ar(freq,mul:0.1);
    Splay.ar(sig,0.5,0.25);
};
~one.play;
);
~one.stop(4);
~one.clear;
~one.pause;
~one.resume;
