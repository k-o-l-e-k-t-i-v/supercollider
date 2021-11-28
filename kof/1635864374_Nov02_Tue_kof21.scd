p.push();


~tempo = {0.864};
~fr = {50/60};

// one synth ///////////////////////////////////////

(
~one.ar(2);
~one.quant=24;
~one.fadeTime=1;
~one={
    var imp = Pulse.ar(~tempo*4/(1..12));
    var sig = SinOsc.ar(~fr + (imp.abs**3 * (~fr*100)), imp*pi);
    sig = CombL.ar(sig,~tempo/4,~tempo/4,4);
    Splay.ar(sig,0.05,0.15);
};
~one.play;
);
~one.stop(4);
~one.clear;
~one.pause;
~one.resume;



