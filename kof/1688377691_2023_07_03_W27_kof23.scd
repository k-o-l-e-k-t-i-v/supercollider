p.push();


~tempo={110/120};


// one synth ///////////////////////////////////////

(
~one.ar(2);
~one.quant=4;
~one.fadeTime=2;
~one={
    var rez = LFNoise1.ar(~tempo/4/[1,2,3]).exprange(0.1,8);
    var detune = 2;
    var oct = 1/2;
    var mod3 = Duty.kr(4/~tempo,0,Dseq([1,-3],inf));
    var mod2 = Duty.kr(4*2/~tempo,0,Dseq([5,7,5,4],inf));
    var mod = Duty.kr(4*3/~tempo,0,Dseq([8,9,8,6,8,7,8,2,5,4,6,1,2,-1],inf));
    var freq = 320*oct*(2**([mod3,mod2,mod]/12)) + LFNoise1.kr(~tempo/[1,2,3]).range(detune*(-1),detune);
    var sig = LFSaw.ar(freq,mul:LFTri.kr(~tempo/4/[1,2,3]))/4 + SinOsc.ar(freq,mul:0.4);
    var w = LFNoise1.kr(~tempo/[1,2,3]).range(1,4);
    sig = HPF.ar(sig,freq/w);
    sig = LPF.ar(sig,freq*w);
    sig = Perlin3.ar(sig[0]/2+1,sig[1]/2+1,sig[2]+1)/2 + sig;
    sig = LeakDC.ar(sig);
    sig = sig * LFTri.kr(~tempo/16) + (Dust.ar(4)*WhiteNoise.ar(0.4!3));
    sig = CombL.ar(Perlin3.ar(sig[0]*rez[0],sig[1]*rez[1],sig[2]*rez[2]),2/freq,2/freq,1)/4+sig;
    sig = sig * LFTri.kr(~tempo/4/[1,2,3]);
    sig = LeakDC.ar(sig);
    sig = GVerb.ar(sig,80,3)/4+sig;
    sig = CompanderD.ar(sig,3/4,1/2,1);
    Splay.ar(sig,0.5,0.25);
};
~one.play;
);
~one.stop(4);
~one.clear;
~one.pause;
~one.resume;


(
//////////////////////////  FADE -> OUT ///////////////////////////////////////////////////////
{
  p.arProxyNames.do({|synth| if(synth.asSymbol!=\master){p[synth.asSymbol].clear(90);};});
}.fork;  
)
