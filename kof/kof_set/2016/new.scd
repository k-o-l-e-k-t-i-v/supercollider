

(
  ~master.quant=2;
  ~master.play;
  ~master.fadeTime = 0.01;
  ~master = {|wet=0.45,lp=3500,hp=250,len=10,rev = 3|
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
  p.moveNodeToTail(\master);
);



// one synth ///////////////////////////////////////

(
~one.ar(2);
~one.clock = p.clock;
~one.quant=16;
~one.fadeTime=16.1;
~one={
  var sig = SinOsc.ar(50!2,Pulse.ar(4)**80*pi) * Pulse.ar(1);

  Splay.ar(sig,0.05,0.75);
};
~one.play;
);
~one.stop(16);
~one.clear;
~one.pause;
~one.resume;

(
//////////////////////////  FADE -> OUT ///////////////////////////////////////////////////////
{
  p.arProxyNames.do({|synth| if(synth.asSymbol!=\master){p[synth.asSymbol].clear(20);};});
}.fork;  
)


(
  p.clock.sched(p.clock.timeToNextBeat(1 * 16),{ 
  ~one.play;
      ~two.play;
  ~swit.play;
  ~synth.play;
  });
);


(
  //s.latency=0.2;
  //p.clock.tempo_(120/60);
  p.arProxyNames.do({|synth| if(synth.asSymbol!=\master){p[synth.asSymbol].rebuild;};});
  ~tick.kr(1);
  ~tick.clock = p.clock;
  ~tick.quant = 16;
  ~counter.clock = p.clock;
  ~counter.quant = 16;
  ~counter = {PulseCount.kr(~tick.kr);};
  ~tick = { Impulse.kr( ~tempo * 4 ); };
);

(
  p=ProxySpace.push(s.boot);
  p.makeTempoClock;
);

// two synth ///////////////////////////////////////

(
~two.ar(2);
~two.clock = p.clock;
~two.quant=[16,0];
~two.fadeTime=0.02;
~two={
  //  |       |       |       |       |  
  var pat = [
    1,0,0,0, 1,0,0,0, 1,0,0,0, 1,0,0,0,
    1,0,0,0, 1,0,0,0, 1,0,0,0, 1,0,0,0,
    1,0,0,0, 1,0,0,0, 1,0,0,0, 1,0,0,0,
    1,0,0,0, 1,0,0,0, 1,0,0,0, 1,0,1,0,
  ].rotate(1);
  var imp = PulseDivider.kr(~tick.kr,1,~counter.kr%pat.size);
  var hit = Select.kr(PulseCount.kr(imp)%pat.size,pat);
  var env = {EnvGen.ar(Env([0.001,1,0.0001],[0.002,1.75] * LFNoise2.ar(1/16!4).range(1/2,4),[3,-3]),imp * hit)};
  var sig = {SinOsc.ar(50!2,env**LFNoise2.ar(1/32!2).range(40,80)*8pi)};
  sig = sig * env;
  Splay.ar(sig,0.05,0.95);
};
~two.play;
);
~two.stop(16);
~two.clear;
~two.pause;
~two.resume;


(
//////////////////////////  FADE -> OUT ///////////////////////////////////////////////////////
{
  p.arProxyNames.do({|synth| if(synth.asSymbol!=\master){p[synth.asSymbol].clear(20);};});
}.fork;  
)

// synth synth ///////////////////////////////////////

(
~synth.ar(2);
~synth.clock = p.clock;
~synth.quant=[16,0];
~synth.fadeTime=0.02;
~synth={
  //  |       |       |       |       |  
  var pat = [
    1,0,0,0, 0,0,0,0, 0,0,0,0, 0,0,0,0,
    0,0,0,0, 0,0,0,0, 0,0,0,0, 0,0,0,0,
    0,0,0,0, 0,0,0,0, 0,0,0,0, 0,0,0,0,
    0,0,0,0, 0,0,0,0, 0,0,0,0, 0,0,0,0,
  ].rotate(1);
  var imp = PulseDivider.kr(~tick.kr,[1,2,3,4],~counter.kr%pat.size);
  var hit = Select.kr(PulseCount.kr(imp)%pat.size,pat);
  var env = EnvGen.ar(Env([0.001,1,0.0001],[0.002,8.5],[3,-3]),imp * hit);
  var sig = SinOsc.ar([60,67,36,48].midicps/4,0,env**0.2*2pi * SinOsc.ar(4/[1,2,3,4]));
  sig = sig * env;
  Splay.ar(sig,0.75,0.2);
};
~synth.play;
);
~synth.stop(40);
~synth.clear;
~synth.pause;
~synth.resume;

(
//////////////////////////  FADE -> OUT ///////////////////////////////////////////////////////
{
  p.arProxyNames.do({|synth| if(synth.asSymbol!=\master){p[synth.asSymbol].clear(20);};});
}.fork;  
)


// swit synth ///////////////////////////////////////

3.nthPrime

(
~swit.ar(2);
~swit.clock = p.clock;
~swit.quant=[16,0];
~swit.fadeTime=0.02;
~swit={
  //  |       |       |       |       |  
  var pat = [
    1,0,1,0, 1,0,0,0, 1,0,0,0, 1,1,1,1,
    1,0,0,0, 1,0,1,0, 1,0,0,0, 1,0,0,0,
    0,0,1,0, 0,0,0,0, 0,0,1,0, 1,0,1,0,
    1,0,1,0, 0,0,1,0, 0,0,0,0, 1,1,1,1,
  ].rotate(1);

  var mel = Duty.kr(16,0,Dseq([1,2,1.5,1.33333],inf));
  var imp = PulseDivider.kr(~tick.kr,[1,2,3,4]);
  var hit = Select.kr(PulseCount.kr(imp)%pat.size,pat);
  var env = {EnvGen.ar(Env([0.001,1,0.0001],[0.002,0.15]*LFNoise2.kr(4!4).range(1,20),[3,-3]),imp * hit)};
  var t = LFSaw.ar([4,5,60.midicps]) + LFSaw.ar(1/500).range(1,400);
  var sig = Perlin3.ar([t[0],t[1],t[2]]) * ;
  sig = BPF.ar(sig,LFNoise2.kr(1/4!4).range(200,20000));
  sig = sig * env;
  Splay.ar(sig,0.75,0.15,SinOsc.ar(4.01));
};
~swit.play;
);
~swit.stop(16);
~swit.clear;
~swit.pause;
~swit.resume;
