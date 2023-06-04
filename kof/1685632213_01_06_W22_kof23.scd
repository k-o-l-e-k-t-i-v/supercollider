


s.boot();

p=ProxySpace.push(s)




~tempo = {110/120}

// one synth ///////////////////////////////////////

(
~one.ar(2);
~one.quant=4;
~one.fadeTime=1;
~one={
    var detune = LFNoise2.kr(~tempo/16/[1,2,3,4]);
    var base = Duty.kr([4,8,16]/~tempo,0,Dseq([60,65,72,65].midicps,inf))/[1,2,4,1/2] + detune;
    var note = base / Duty.kr(4*[1,4,16,32]/~tempo,0,Dseq([1,2,1.5,1.33333],inf));// * Pulse.ar(~tempo*4/[1,2,3,4]);
    var sig = LFSaw.ar([~tempo/4/[1,2,3,4],~tempo*4/[1,2,3,4],note],mul:2pi);
    var side;
    sig = Perlin3.ar(sig[0].sin+LFNoise1.kr(~tempo/[1,2,3,4]).range(1,10),sig[1].sin+LFNoise1.kr(~tempo/64/[1,2,3,4]).range(1,10),sig[2].cos+1);
    sig = LeakDC.ar(sig) * Pulse.ar(~tempo*4/[1,2,3,4].nthPrime);
    sig = LPF.ar(sig,15000)/4 + RHPF.ar(sig,36.midicps,0.2);
    side = sig;
    side = GVerb.ar(sig,60,3)/2 + side;
    side = CompanderD.ar(sig,1/2,LFNoise2.kr(~tempo/4/[1,2,3,4]).range(1/10,9/10),1) + sig;
    Splay.ar(sig,0.95,0.25);
};
~one.play;
);
~one.stop(4);
~one.clear;
~one.pause;
~one.resume;
