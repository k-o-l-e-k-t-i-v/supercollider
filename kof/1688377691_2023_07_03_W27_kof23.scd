p.push();


~tempo={110/120};


// one synth ///////////////////////////////////////

(
~one.ar(2);
~one.quant=0;
~one.fadeTime=12;
~one={
    var rez = LFNoise1.ar(~tempo/4/[1,2,3]).exprange(0.1,8);
    var detune = 2;
    var oct = 1/(2**([8,5,1]/12));
    var mod3 = Duty.kr(4/~tempo,0,Dseq([1,-3],inf));
    var mod2 = Duty.kr(4*16/~tempo,0,Dseq([5,4,5,6],inf));
    var mod = Duty.kr(4*24/~tempo,0,Dseq([8,9,8,6,8,7,8,2,5,4,6,1,2,-1],inf));
    var freq = [40,440]*oct*(2**([mod3,mod2,mod]/12)) + LFNoise1.kr(~tempo/[1,2,3]).range(detune*(-1),detune);
    var sig = LFSaw.ar(freq,mul:LFTri.kr(~tempo/4/[1,2,3]));
    var w = LFNoise1.kr(~tempo/[1,2,3]).range(1,4);
    var side;
    sig = Perlin3.ar(sig[0].cos+1,sig[1].sin+1,sig[2].sin+1+w)/2 + SinOsc.ar(freq,mul:0.2);
    sig = LeakDC.ar(sig);
    sig = HPF.ar(sig,freq/w);
    sig = LPF.ar(sig,freq*w);
    side = sig * Pulse.ar(~tempo*4/[1,2,3]);
    sig = sig * LFTri.kr(~tempo/24/[1,2,3]) + (CombL.ar(Dust.ar(4!3)*sig+WhiteNoise.ar(0.1!3),2/freq,1/freq,2) /4);
    sig = CombC.ar(Perlin3.ar(sig[0].cos*rez[0],sig[1].sin*rez[1],sig[2].sin*rez[2]),2/freq,1/freq,0.2)/4+sig;
    sig = sig * LFTri.kr(~tempo/24/[1,2,3]);
    sig = LeakDC.ar(sig);
    sig = Vibrato.ar(sig,[4,5,6],0.1);
    sig = GVerb.ar(HPF.ar(sig,420),80,3)/4+HPF.ar(sig,110);
    sig = CompanderD.ar(sig,3/4,1/2,1)/5+side;
    Splay.ar(sig,0.85,0.25);
};
~one.play;
);
~one.stop(4);
~one.clear(120);
~one.pause;
~one.resume;


(
//////////////////////////  FADE -> OUT ///////////////////////////////////////////////////////
{
  p.arProxyNames.do({|synth| if(synth.asSymbol!=\master){p[synth.asSymbol].clear(90);};});
}.fork;  
)
