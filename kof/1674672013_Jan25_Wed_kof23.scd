s.reboot;
p.push();

~tempo = {110/60}

// oneeee synth ///////////////////////////////////////

(
~oneeee.ar(2);
~oneeee.quant=0;
~oneeee.fadeTime=0.1;
~oneeee={
    var mel = Duty.kr(4/~tempo,0,Dseq([1,2,1.5,1.33333,1,1,1,1],inf));
    var base = [40,40,400,4000]/mel;
    var frac = Duty.kr([4,3,2,1]*.x[1,2,4,8]/.x[1,2,3,4]/~tempo,0,Dseq(1/(1..12)+1,inf)).lag(0.125);
    var perl = Perlin3.ar(SinOsc.ar(frac*base),SinOsc.ar(base/frac).range(0,2pi),LFTri.ar(base/((1..12)+1)).range(0,8pi));
    var sig = perl * Decay.ar(Impulse.ar(~tempo/(1..12)/frac),LFSaw.kr(~tempo/24/[1,2,3,4]).range(0.001,0.5));
    var pre = sig;
    sig = sig * Pulse.ar(~tempo/[1,2,3,4]);
    sig = CombL.ar( sig,4/frac/~tempo,1/frac/~tempo,4/~tempo)/8 + pre;
    sig = CompanderD.ar(sig,3/4,1/2,1) + pre;
    Splay.ar(sig,LFSaw.kr(~tempo/4).range(0.2,0.8),0.75);
};
~oneeee.play;
);
~oneeee.stop(4);
~oneeee.clear;
~oneeee.pause;
~oneeee.resume;
