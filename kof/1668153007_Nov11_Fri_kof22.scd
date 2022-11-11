

p.push();

// vim:set et sw=4 ts=4: synth ///////////////////////////////////////

(
~one.ar(2);
~one.quant=2;
~one.fadeTime=4;
~one={
    var base = [60,67,36,72].midicps /.x [1,2,4];
    var harmonics = (1+(1/(1..12))) * base;
    var sig = SinOsc.ar(harmonics,SinOsc.ar(harmonics**2)*2pi,(1/((1..12)**2)));
    sig = sig + LFSaw.ar(harmonics/2,0.5,mul:0.5);
    sig= RLPF.ar(sig,harmonics*[1,0.5],0.2);
    Splay.ar(sig,0.5,0.25);
};
~one.play;
);
~one.stop(4);
~one.clear;
~one.pause;
~one.resume;
