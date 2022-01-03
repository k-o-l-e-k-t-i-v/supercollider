p.push();
p.bpm(121.35)
// one synth ///////////////////////////////////////

(
~one.ar(2);
~one.quant=8;
~one.fadeTime=4;
~one={
    var mod = Duty.kr(4/~tempo,0,Dseq(([60,62,65,67]+.x[0,7,-4]).scramble,inf)).midicps/4;
    var note = Duty.kr([4,2,24]/~tempo,0,Dseq([1,2,1.5,1.33333],inf))**(12/[1,12,6]);
    var sig = SinOsc.ar(mod,Pulse.ar(~tempo*[3,4,1.5])*2pi) * Pulse.ar(~tempo*[4,3,1.5]);
    sig = sig * Pulse.ar(~tempo/[1,2,1.5]);
    sig = CombL.ar(sig,[3,4,1.5]/~tempo+LFNoise2.kr(~tempo/24/[1,2,3]),1/[mod*note,mod+1*note]/~tempo,LFNoise2.kr(~tempo/[4,3],mul:4));
    sig = LeakDC.ar(sig).softclip;
    Splay.ar(sig,0.15,0.05);
};
~one.play;
);
~one.stop(4);
~one.clear;
~one.pause;
~one.resume;
