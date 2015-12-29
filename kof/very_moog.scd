

(
  p=ProxySpace.push(s.boot);
  p.makeTempoClock;
);

(
  ~moog.quant=2;
  ~moog.fadeTime=4;
  ~moog={
    var mod2 = Duty.kr(4,0,Dseq([1,1.125,1.5,1.25,1,2,1.3333,1.125],inf)).lag(0.005).linexp(1,2,1,100) ;
    var mod = Duty.kr([4,8,4,16],0,Dseq([1,1.125,1.5,1.25,1,2,1.3333,1.125],inf)).lag(0.5) ;
    var sig = LFSaw.ar([50,150,100.001,151]/(mod),SinOsc.kr(1/4/[1,2,3,4]));
    sig = MoogFF.ar(sig,LFCub.ar(1/4/(1..4)).range(50,12500/mod2),SinOsc.kr(1/12.1/fib(4)).range(1.1,2.7));
    sig = sig * LFSaw.ar(1/4/[1,2,3,4]).exprange(0.001,1);
    sig = GVerb.ar(LPF.ar(sig,2800),100,spread:90)/2+sig;
    sig = LPF.ar(sig,12000/[1,2,4,8]);
    sig = CompanderD.ar(sig,3/4,1/3,1/2);
    Splay.ar(sig.flat,0.85,0.25);
  };
  ~moog.play;
)
