p.push();


~tempo={110/120};


// keep synth ///////////////////////////////////////

(
~keep.ar(2);
~keep.quant=4;
~keep.fadeTime=2;
~keep={
    var last = Duty.kr(16/~tempo,0,Dseq([8,5,8,11],inf));
    var mid = Duty.kr(4/~tempo,0,Dseq([5,6,4,3],inf));
    var freq = [36,48,55].midicps*(2**([1,mid,last]/12))+1 + LFNoise1.kr(~tempo/4/[1,2,3]);
    var sig = LFSaw.ar([~tempo/4/[1,4,8],~tempo/16,freq],mul:2pi) + LFNoise1.ar(48000,mul:0.1);
    sig = Perlin3.ar(sig[0].cos,sig[1].sin,sig[2].sin) * Pulse.ar(~tempo*LFNoise1.kr(~tempo/4/[1,2,3]).range(1,8).round(4).lag(1)/[1,2,3]);
    sig = LeakDC.ar(sig);
    sig = CombL.ar(sig,1/freq*4,1/freq.lag(0.5)*2,1)/4+sig;
    sig = LPF.ar(sig,1500);
    sig= CompanderD.ar(sig,3/4,1/2,1);
    sig = GVerb.ar(sig,60,3)/8+sig;
    Splay.ar(sig,0.95,0.025);
};
~keep.play;
);
~keep.stop(4);
~keep.clear;
~keep.pause;
~keep.resume;
