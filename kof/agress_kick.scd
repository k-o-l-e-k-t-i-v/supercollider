



(
  p.clock.tempo_(140/60*2);
  
  ~offset = (0..7)/8;
  
  ~tick.quant = 1;
  ~tick = {Mix(Impulse.kr( ~tempo / 2 , ~offset ))};
  
  ~counter = {PulseCount.kr(~tick.kr)};
);




// aggressive synth ///////////////////////////////////////

(
~aggressive.ar(2);
~aggressive.quant=2;
~aggressive.fadeTime=0.2;
~aggressive={
  //         |       |       |       |       |  
  var pat = [
    1,0,0,0,1,0,0,0,1,0,0,0,1,0,0,0,
    1,0,0,0,1,0,0,0,1,0,0,0,1,0,0,0,
    1,0,0,0,1,0,0,0,1,0,0,0,1,0,0,0,
    1,0,0,0,1,0,0,0,1,0,0,0,1,0,1,0,
    1,0,0,0,1,0,0,0,1,0,0,0,1,0,0,0,
    1,0,0,0,1,0,0,0,1,0,0,0,1,0,0,0,
    1,0,0,0,1,0,0,0,1,0,0,0,1,0,0,0,
    1,0,1,0,1,0,1,0,1,0,1,0,1,0,1,1,
  ].rotate(1);
  var mod = Duty.kr(8*~tempo.kr,0,Dseq([1,4,2,1.5,8,1.25],inf));
  var imp = PulseDivider.kr(~tick.kr,fib(8),~counter.kr);
  var hit = Select.kr(PulseCount.kr(imp)%pat.size,pat);
  var env = EnvGen.ar(Env([0.001,1,0.0001],[0.002,0.25*fib(8)*mod],[3,-3],curve:'exp'),imp * hit);
  var sig = SinOsc.ar(50+((1..8)*0.125pi*mod),env**(LFNoise2.kr(1/16!8).range(5,200/mod)*(1..8))*8pi);
  sig = sig * env;
  sig = CompanderD.ar(sig,3/4,1/2,1/2);
  Splay.ar(sig,0.95,0.5);
};
~aggressive.play;
);
~aggressive.stop(4);
~aggressive.clear;
~aggressive.pause;
~aggressive.resume;
