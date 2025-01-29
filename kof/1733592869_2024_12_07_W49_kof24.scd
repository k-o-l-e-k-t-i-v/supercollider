

p.push



// one synth (a dark one) ///////////////////////////////////////

(
~one.ar(2);
~one.quant=4;
~one.fadeTime=6;
~one={
    var over = 2**(([1,2,4,8,12,1,1/4,1/8,1/16].scramble/12)+1) ;
    var base = [60,64,68,72].midicps;
    var freq = base+((1..12)/1200).scramble;
    var sig = LFSaw.ar([freq,2**((1..12)/12+1)/8,freq*over]) * 2pi;
    var shift = SinOsc.ar(1/(1..12)/360,add:1,mul:4);
    sig = MoogFF.ar(Perlin3.ar(sig[0].sin+shift[0],sig[1].tanh+shift[1],sig[2].cos+shift[2]),freq*[4,4/3,1/2,8],2);
    sig = sig.flat * (LFNoise2.kr(1/36!sig.size)**2);
    sig = CombL.ar(sig,3/4,1/2,1/4);
    sig = LeakDC.ar(sig);
    sig = CompanderD.ar(sig,3/4,1/2,1);
    sig = GVerb.ar(sig,60,3)/24+sig;
    Splay.ar(sig,0.25,0.95);
};
~one.play;
);
~one.stop(15);
~one.clear;
~one.pause;
~one.resume;
