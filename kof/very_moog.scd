p.bpm(90)

(
  p=ProxySpace.push(s.boot);
  p.makeTempoClock;
);

p.push();
~tempo = {120/60/2};

(
  ~moog.quant=2;
  ~moog.fadeTime=4;
  ~moog={
    var mod2 = Duty.kr(1/4/~tempo,0,Dseq([1,1.5,2,1,2,1.3333].pyramid,inf)).lag(0.05).linexp(1,2,1,100) ;
    var mod3 = 2**Duty.kr(16/[1,1,2,4]/ ~tempo,0,Dseq(2**([1,3,1,2,1,5,8].pyramid/12+1),inf));
    var mod = Duty.kr([4,8,4,16]/~tempo,0,Dseq([1,2,1.5,2,1,2,1.3333,1].pyramid,inf)).lag(0.25) ;
    var sig = LFSaw.ar([60,36,60,72].midicps/4*mod3/(mod),SinOsc.kr(~tempo/4/[1,2,3,4]));
    sig = sig + BrownNoise.ar(0.1!4);
    sig = MoogFF.ar(sig.distort/2+sig,LFCub.ar(~tempo/4/(1..4)).range(50,5200/mod2),SinOsc.kr(1/12.1/fib(4)).range(1.1,2.7));
    sig = sig * EnvGen.ar(Env([0.001,1,0.0001],[0.05,0.15*[1,2,1.5,3]],[3,-3]),Impulse.ar(~tempo*2/fib(8)));
    sig = sig * LFSaw.ar(~tempo/4/[1,2,3,4]).exprange(0.001,1);
    sig = sig * LFNoise2.kr(~tempo/4!4);
    sig = GVerb.ar(LPF.ar(HPF.ar(sig,70),800),100,spread:90)/8+sig;
    sig = LPF.ar(sig,12000/[1,2,4,8]);
    sig = Resonz.ar(sig,LFNoise2.kr(~tempo/4!4).range(150,15500),0.25)*4+sig;
    sig = CompanderD.ar(sig,4/5,1/3.75,1/2);
    sig = GVerb.ar(sig,90,3)/16+sig;
    Splay.ar(sig.flat,0.85,0.5,Mix{SinOsc.kr(~tempo/[4,5,6,7])}/4);
  };
  ~moog.play;
)

(
  ~master.quant=2;
  ~master.play;
  ~master.fadeTime = 0.01;
  ~master = {|wet=0.15,lp=3500,hp=250,len=10,rev = 3|
  var sig = In.ar([0,1]);
  var orig = sig;
  var fx;
  //fx = Limiter.ar(sig,0.95);
  sig = CompanderD.ar(sig,3/4,1/1.1,1/3);
  fx = LPF.ar(sig,lp);
  fx = HPF.ar(fx,hp);
  fx = DWGReverbC1C3.ar(NumChannels.ar(fx,2),[5000,5010],1/len)/rev;
  sig = SelectX.ar(wet,[orig,fx]);
  sig = NumChannels.ar(sig,2);
  ReplaceOut.ar(0,sig);
  };
);
p.moveNodeToTail(\master);
