

(
  p=ProxySpace.push(s.boot);
  p.makeTempoClock;
);

(
  p.clock.tempo_(60/60);
  
  ~offset = (0..7)/8;
  
  ~tick.quant = 1;
  ~tick = {Mix(Impulse.kr( ~tempo / 2 , ~offset ))};
  
  ~counter = {PulseCount.kr(~tick.kr)};
);


// sss synth ///////////////////////////////////////

(
~sss.ar(2);
~sss.quant=2;
~sss.fadeTime=0.2;
~sss={
  //         |       |       |       |       |  
  var pat = [1,0,0,0,1,0,0,0,1,0,0,0,1,0,0,0].rotate(1);
  var imp = PulseDivider.kr(~tick.kr,1,~counter.kr);
  var hit = Select.kr(PulseCount.kr(imp)%pat.size,pat);
  var env = EnvGen.ar(Env([0.001,0.6,1,0.001],[0.2,0.5,0.2],[3,1,-3],curve:'exp'),imp * hit);
  var sig = SinOsc.ar(LFNoise2.ar(4!8).range(10,16000),mul:0.1) * Decay.ar(Dust.ar(2!16),0.02);
  sig = CombN.ar(sig,4,LFTri.ar(2.01/fib(8)).range(1/40,1/4),20)+sig;
  sig = CombN.ar(sig,1/2,1/LFNoise2.ar(1/8/fib(16)).range(1,50),20)+sig;
  sig = Normalizer.ar(sig) * LFTri.ar(~tempo.kr/4/fib(8)).exprange(0.001,0.2);
  //sig = sig * env;
  Splay.ar(sig,0.25,0.5);
};
~sss.play;
);
~sss.stop(4);
~sss.clear;
~sss.pause;
~sss.resume;
