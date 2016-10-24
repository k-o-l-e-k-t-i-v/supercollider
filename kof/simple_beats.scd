
(
  p=ProxySpace.push(s.boot);
  p.makeTempoClock;
);

p=NetProxy.connect()


(
~tick.kr(1);
~tick.quant=4;
~tick.clock = p.clock;
~tick = { Impulse.kr(~tempo*4); };
)

p.makeTempoClock;
p.clock.tempo_(140/60)

(
    s.latency=0;
    ~tick.kr;
    ~counter = {PulseCount.kr(~tick.kr)};
    ~tick.fadeTime=0;
    ~tick.quant=0;
    t = p.clock;
    t.sched(t.timeToNextBeat(1),{~tick.rebuild; 1/4;});
  p.clock.tempo_(127/60);
);  


(
  ~master.quant=2;
  ~master.play;
  ~master.fadeTime = 0.01;
  ~master = {|wet=0.35,lp=800,hp=50,len=10,rev = 2|
  var sig = In.ar([0,1]);
  var orig = sig;
  var fx;
  //fx = Limiter.ar(sig,0.95);
  sig = Compander.ar(sig,3/4,1/1.1,1/3);
  fx = LPF.ar(sig,lp);
  fx = HPF.ar(fx,hp);
  fx = DWGReverb.ar(NumChannels.ar(fx,2),[4000,4010],1/len)/rev;
  sig = SelectX.ar(wet,[orig,fx]);
  sig = NumChannels.ar(sig,2);
  ReplaceOut.ar(0,sig);
  };
);
p.moveNodeToTail(\master);

// one synth ///////////////////////////////////////

(
~one.ar(2);
~one.quant=8;
~one.fadeTime=8.2;
~one={
  //         |       |       |       |       |  
  var pat = [1,0,0,0,1,0,0,0,1,0,0,0,1,1,1,1].rotate(1);
  var imp = PulseDivider.kr(~tick.kr,1,~counter.kr%pat.size);
  var hit = Select.kr(PulseCount.kr(imp)%pat.size,pat);
  var env = EnvGen.ar(Env([0.001,1,0.0001],[0.002,3.5],[3,-3],curve:'exp'),imp * hit);
  var sig = SinOsc.ar(50!2,env**50*LFNoise2.kr(1/4).range(1pi,8pi));
  sig = sig * env;
  Splay.ar(sig,0.75,0.5);
};
~one.play;
);
~one.stop(4);
~one.clear;
~one.pause;
~one.resume;

// two synth ///////////////////////////////////////

(
~two.ar(2);
~two.quant=8;
~two.fadeTime=0.2;
~two={
  //         |       |       |       |       |  
  var pat = [1,0,0,0,1,0,0,0,1,0,1,1,1,1,1,1].pyramid.rotate(3);
  var imp = PulseDivider.kr(~tick.kr,[1,2,3,4],~counter.kr%pat.size);
  var hit = Select.kr(PulseCount.kr(imp)%pat.size,pat);
  var env = EnvGen.ar(Env([0.001,1,0.0001],[0.002,0.15*[1,2,3,8]],[3,-3],curve:'exp'),imp * hit);
  var sig = Crackle.ar(0.1+(env**4));
  sig = sig * env;
  Splay.ar(sig,0.75,0.15);
};
~two.play;
);
~two.stop(4);
~two.clear;
~two.pause;
~two.resume;

(
  ~master.quant=2;
  ~master.play;
  ~master.fadeTime = 0.01;
  ~master = {|wet=0.25,lp=2500,hp=250,len=10,rev = 1|
  var sig = In.ar([0,1]);
  var orig = sig;
  var fx;
  //fx = Limiter.ar(sig,0.95);
  sig = Compander.ar(sig,3/4,1/1.1,1/3);
  fx = LPF.ar(sig,lp);
  fx = HPF.ar(fx,hp);
  fx = DWGReverb.ar(NumChannels.ar(fx,2),[5000,5010],1/len)/rev;
  sig = SelectX.ar(wet,[orig,fx]);
  sig = NumChannels.ar(sig,2);
  ReplaceOut.ar(0,sig);
  };
);
p.moveNodeToTail(\master);



(
{
  p.stop(30);
  ~master.play;
  30.wait;
  p.clean;
}.fork;  
)
