

(
  p=ProxySpace.push(s.boot);
  p.makeTempoClock;
);

(
  ~moog.quant=2;
  ~moog.fadeTime=4;
  ~moog={
    var mod2 = Duty.kr(1/4,0,Dseq([1,1.125,1.5,1.25,1,2,1.3333,1.125].pyramid,inf)).lag(0.05).linexp(1,2,1,100) ;
    var mod3 = Duty.kr(16/[1,1,2,4],0,Dseq([1,2,1,2,1,4,8],inf));
    var mod = Duty.kr([4,8,4,16],0,Dseq([1,1.125,1.5,1.25,1,2,1.3333,1.125],inf)).lag(0.25) ;
    var sig = LFSaw.ar([50,150,75.01,100.1]*mod3/(mod),SinOsc.kr(1/4/[1,2,3,4]));
    sig = sig + BrownNoise.ar(0.1!4);
    sig = MoogFF.ar(sig.distort/2+sig,LFCub.ar(1/4/(1..4)).range(50,5200/mod2),SinOsc.kr(1/12.1/fib(4)).range(1.1,2.7));
    sig = sig * EnvGen.ar(Env([0.001,1,0.0001],[0.025,0.15*[1,2,1.5,3]],[3,-3]),Impulse.ar(4/fib(8)));
    sig = sig * LFSaw.ar(1/4/[1,2,3,4]).exprange(0.001,1);
    sig = sig * LFNoise2.kr(1/4!4);
    sig = GVerb.ar(LPF.ar(HPF.ar(sig,70),800),100,spread:90)/8+sig;
    sig = LPF.ar(sig,12000/[1,2,4,8]);
    sig = Resonz.ar(sig,LFNoise2.kr(1/4!4).range(150,12500),0.25)*4+sig;
    sig = CompanderD.ar(sig,4/5,1/2.75,1/2);
    Splay.ar(sig.flat,0.85,0.25,Mix{SinOsc.kr(1/[4,5,6,7])}/4);
  };
  ~moog.play;
)
