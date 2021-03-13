


~tempo={120/121.35}


// one synth ///////////////////////////////////////

(
~one.ar(2);
~one.clock = p.clock;
~one.quant=12;
~one.fadeTime=1;
~one={
    var pulse = Pulse.ar(~tempo*4/[3,6,8,24,12,4]);
    var sig = SinOsc.ar( [60,57,55].midicps*(12 / ((2..9).log2) ) , LFSaw.ar(~tempo/4)*2pi) * LFTri.ar(~tempo*4/[1,2,3,4],pulse);
    sig = CombL.ar(sig,1,1,1);
  Splay.ar(sig,0.5,0.15);
};
~one.play;
);
~one.stop(4);
~one.clear;
~one.pause;
~one.resume;
