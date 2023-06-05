
s.boot();
p = ProxySpace.push(s);



~tempo = {110/120}

// one synth ///////////////////////////////////////

(
~one.ar(2);
~one.quant=8;
~one.fadeTime=5;
~one={
    var wide  = LFNoise2.kr(~tempo/4).range(1/2,9/10);
    var lo = LFNoise2.kr(~tempo/4!2).range(1/2,1/10);
    var high = LFNoise2.kr(~tempo/4!2).range(1/2,1/10);
    var sep = LFNoise2.kr(~tempo/24!2).range(1/4,3/4);
    var frsep = sep.range(500,5000);
    var base = 432 * Duty.kr([4,16,24]/~tempo,0,Dseq([1,1/8,1/2,4/3],inf)).lag(1/5000);
    var scalar = LFNoise2.ar(1/4/[1,2,3,4])/2;
    var sig1 = LFSaw.ar([[~tempo,~tempo + 0.002],~tempo/[4,4.001],~tempo/[160,160.001]]) * 2pi;
    var sig2 = LFSaw.ar([base,base/2,base*1.5]) * 2pi;
    var sig = Perlin3.ar(sig1[0].cos+scalar,sig1[1].sin+scalar,sig1[2].sin+scalar) * Perlin3.ar(sig2[0].cos+1*scalar,sig2[1].sin+1*scalar,sig2[2].cos+1*scalar);
    sig = LeakDC.ar(sig);
    //sig = sig * Pulse.ar(~tempo*[4,2]/[1,2,3,4]);
    sig = CombL.ar(sig,2/base,1/base,[1/3,1/2]+scalar)/4+sig;
    sig = LeakDC.ar(sig);
    sig = LPF.ar(sig,1500);
    sig = GVerb.ar(sig,50,3)/6+sig;
    sig = CompanderD.ar(LPF.ar(sig,frsep),sep,lo,1) + CompanderD.ar(HPF.ar(sig,frsep),sep,high,1);
    sig = sig.softclip;
    Splay.ar(sig,wide,0.4);
};
~one.play;
);
~one.stop(16);
~one.clear;
~one.pause;
