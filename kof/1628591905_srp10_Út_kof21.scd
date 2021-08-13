s.boot;


p.push
p.bpm(89.6/2)


// one synth ///////////////////////////////////////

(
~one.ar(2);
~one.quant=24;
~one.fadeTime=0.1;
~one={
    var tone = Duty.kr(24/~tempo,0,Dseq([1,2,1.5,1.33333],inf)).lag(8/(1..24)) *
    432;
    var base = tone*(1+(1/(1..24))) + SinOsc.kr(1/(1..24));
    var sig = LFSaw.ar([base,base,1/(1..24)],SinOsc.ar(~tempo/4)*2pi)*2pi;
    sig = Perlin3.ar(sig[0].cos,sig[1].sin,sig[2].sin);
    sig = sig * Decay.ar(Impulse.ar(~tempo/48*(1..24).nthPrime%8,(4/(1..24))));
    sig = sig  * Pulse.ar(~tempo*4/[1,2,3,4]) + LPF.ar(sig,1600);
   // sig = LPF.ar(sig,1700);
    Splay.ar(sig,0.95,0.35);
};
~one.play;
);
~one.stop(4);
~one.clear;
~one.pause;
~one.resume;
