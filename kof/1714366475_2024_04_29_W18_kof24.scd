p.push();
~tempo = {110/120};

// one synth ///////////////////////////////////////

(
~one.ar(2);
~one.quant=0;
~one.fadeTime=2;
~one={
    var freq = 300 *.x ((2**([1,2,3,4]/.x[5]))+1);
    var env = LFSaw.ar(~tempo/[1,2,3,4]);
    var sig = SinOsc.ar(freq.scramble,mul:env);
    Splay.ar(sig,0.5,0.15);
};
~one.play;
);
~one.stop(4);
~one.clear;
~one.pause;
~one.resume;
