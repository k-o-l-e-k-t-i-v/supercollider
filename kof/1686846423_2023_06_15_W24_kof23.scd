


s.boot();


p=ProxySpace.push();


(
~simple={
    var oct = Duty.kr(16,0,Dseq([1,4/3,1,5/4],inf));
    var mod = Duty.kr(4,0,Dseq([0,1,0,-2,0,3,0,-2],inf));
    var detune = SinOsc.ar([8,16,32]).range(-2,12);
    var freq = [110,220,55] * oct * (2**([1,5,12+mod]/12)) + detune;
    var sig = LFSaw.ar([1/2,1/2,freq/1000]).range(2pi,4pi);
    sig = sig + LFNoise1.kr([1/4,freq/2]).range(1,4);
    sig = Perlin3.ar(sig[0].cos,sig[1].sin,sig[2].sin*sig[2].cos);
    sig = sig + LFSaw.ar(freq,mul:1/[10,5,2]);
    sig = LeakDC.ar(sig);
    sig = sig * ([] ++ Pulse.ar(4) ++ Pulse.ar(3) ++ LFPulse.ar(2));
    sig = sig * LFTri.ar(1/4/[1,2,3]);
    sig = CompanderD.ar(sig,3/4,1/2,1);
    sig = CombL.ar(sig,1/freq.lag(1/4),1/freq.lag(1/2),2)/4+sig;
    sig = LPF.ar(sig,3000) + HPF.ar(sig,6000);
    sig = Vibrato.ar(sig,[4,5,6],0.2);
    sig = sig.softclip;
    sig = GVerb.ar(sig,70,6)/2+sig;
    Splay.ar(sig,0.95,0.15);
};
~simple.play();
)

