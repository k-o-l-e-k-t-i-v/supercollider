p.push();


// one synth ///////////////////////////////////////

(
~one.ar(2);
~one.quant=4;
~one.fadeTime=2;
~one={
    var base = 1500 / Duty.kr(36/~tempo,0,Dseq([1,2,1,1.5],inf));
    var mel = Duty.kr([4,7]/~tempo,0,Dseq([1,2,1.5,1.33333],inf)) * Duty.kr([3,4,5]/~tempo,0,Dseq(2**([1,5,1,8]/12+1),inf));
    var sig = SinOsc.ar(35+Pulse.ar(~tempo/[1,2,3,4],mul:5),Pulse.ar(~tempo/[1,2,3,4]),mul:0.33) * Pulse.ar(~tempo/[1,2,3,4]) * (LFSaw.ar(~tempo/4/[1,2,3,4])**2);
    sig = sig + (Pulse.ar(~tempo*4/[1,2,4,5])*LFSaw.ar(base*mel,mul:0.1));
    sig = CompanderD.ar(sig,3/4,1/2,1);
    sig = CombL.ar(PitchShift.ar(sig,LFNoise2.kr(~tempo/4!4))+0.5,[4,3,2,1]/~tempo,[4,3,2,1]/~tempo,1) + (HPF.ar(GVerb.ar(sig,90,3)/32,300));
    Splay.ar(sig,0.95,0.5);
};
~one.play;
);
~one.stop(4);
~one.clear;
~one.pause;
~one.resume;
