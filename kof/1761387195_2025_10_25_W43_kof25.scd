p.push();

// one synth ///////////////////////////////////////

(
~one.ar(2);
~one.quant=4;
~one.fadeTime=2;
~one={
    var sig = SinOsc.ar(LFSaw.ar(24).exprange(10.01,1732)) * Pulse.ar(4/[1,2,3,4]);
    var len = Duty.kr([4,3,2,1]/~tempo,0,Dseq(2**([1,5,8,7,9,8,12,-4]/12+1),inf))/[60,36,72].midicps;
    sig = CombN.ar(sig,len*2,len,0.75/[4,3,2,1]);
    Splay.ar(sig,0.05,0.15);
};
~one.play;
);
~one.stop(4);
~one.clear;
~one.pause;
~one.resume;



