

p.push();

~tempo = {110/60}

// vim:set et sw=4 ts=4: synth ///////////////////////////////////////

(
~one.ar(2);
~one.quant=4;
~one.fadeTime=0.02;
~one={
    var mid = Duty.kr(4/~tempo,0,Dseq([61,60,60,65,60,67,60,72],inf)).lag(1/4) -.x [0,12];
    var slope = LFTri.kr(~tempo/37.5).range(1.001,0.0099);
    var peak = [67,mid,36].midicps/ [8,4,1/24];
    var frac = Duty.kr([1/4,1/2,1,4,8,24]/~tempo,0,Dseq([1,2,1.5,1.33333],inf)).lag(1/48) * 1/peak;
    var env = Pulse.ar(~tempo*2/[4,3,4/3,2]);
    var sig = SinOsc.ar(peak/4 + (env ** slope * peak),env*2pi) * env;
    sig = RLPF.ar(sig.softclip,SinOsc.kr(~tempo/[1,2,3,4]).exprange(peak,peak*4),0.45) - (sig * Pulse.ar(~tempo/[1,2,3])) + sig;
    sig = CombL.ar(sig,frac/~tempo,frac/~tempo,4/~tempo) + sig;
    sig = CompanderD.ar(sig,3/4,0.9,0.15);
    Splay.ar(sig,SinOsc.kr(~tempo/2).range(0,1),0.045);
};
~one.play;
);
~one.stop(4);
~one.clear;
~one.pause;
~one.resume;
