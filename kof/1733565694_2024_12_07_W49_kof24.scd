

p.push();


// one synth ///////////////////////////////////////

(
~one.ar(2);
~one.quant=4;
~one.fadeTime=2;
~one={
    var chord = Duty.kr(5/~tempo,0,Dseq([[1,5,8,1],[1,6,8,11],[2,5,9,1],[2,6,11,1],[1,1,1,1]],inf));
    var slope = LFNoise2.ar([1,2,3]/36).range(0.5,4);
    var filter = LFTri.ar(1/72/[1,2,3,4]).exprange(1.01,16);
    var wide = LFTri.ar(1/72/[2,1,4,3]).exprange(0.01,0.25);
    var freq = 48.midicps * Duty.kr([5,4,3]/~tempo,0,Dseq(2**(chord/12+1),inf)) ;
    var frac = LFSaw.ar(4/[1,2,3,4]).exprange(1.001,2/freq);
    var sig = LFSaw.ar(freq/[1,40,1600],mul:2pi) ** slope;
    sig = Perlin3.ar(sig[0].cos+LFTri.ar(1/36,mul:2pi),sig[1].sin+LFTri.ar(7/36,mul:2pi),LFTri.ar(9/36,mul:2pi)+sig[2].asin);
    sig = sig + SinOsc.ar(freq/2,mul:0.5);
    sig = LeakDC.ar(sig);
    sig = CombL.ar(sig,frac/2,frac/2,4)/24+sig;
    sig = BPF.ar(sig,freq*([2,4,8]/filter),wide);
    sig = CompanderD.ar(BPF.ar(sig,22000/(1..12)),3/4,1/2,1) / (12..1);
    sig = CompanderD.ar(sig,3/4,1/2,1);
    sig = GVerb.ar(sig,60,3)/36+sig;
    Splay.ar(sig,0.25,0.15);
};
~one.play;
);
~one.stop(30);
~one.clear;
~one.pause;
~one.resume;
