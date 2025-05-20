p.push();



p.bpm(30);

// additive synth ///////////////////////////////////////

(
~additive.ar(2);
~additive.quant=4;
~additive.fadeTime=2;
~additive={
    var chord = Duty.kr(26/~tempo,0,Dseq([[1,5,8],[1,5,7],[1,5,6],[3,5,7]],inf));
    var base = [60,36].midicps;
    var mel = Perlin3.ar(LFSaw.ar(~tempo/26/(1..12).nthPrime,mul:2pi).cos,LFSaw.ar(~tempo/26,mul:2pi).sin,(1..12)+LFSaw.ar(~tempo/26,mul:2pi).sin + LFSaw.ar(LFNoise2.kr([1,2,3,4]/26).range(2,120),mul:LFNoise1.ar(1/4)/4));
    var freqs = (2**(chord/12+1) *.x [1,2,4,8,16,32,64] * (base + mel*base/4)) % 12000 + SinOsc.kr(mel,mul:base/4,add:base);
    var sig = SinOsc.ar(freqs,mul:0.5/(1..12)) * Decay.ar(Impulse.ar(~tempo/26/2*(1..12).nthPrime),0.5*(1..6) );
    sig = PitchShift.ar(sig,0.1,mel.exprange(0.995,1.115));
    sig = CombL.ar(sig,2/freqs,1/freqs,4)/2+sig;
    sig = GVerb.ar(LPF.ar(sig,1200),60,3)/16+LPF.ar(sig,12000);
    sig = Resonz.ar(sig,freqs/2,0.2)/16+sig;
    sig = CompanderD.ar(sig,3/4,1/2,1)/2+sig;
    Splay.ar(sig,0.66,0.5);
};
~additive.play;
);
~additive.stop(30);
~additive.clear;
~additive.pause;
~additive.resume;
