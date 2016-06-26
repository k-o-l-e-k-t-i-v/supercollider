
(
  p.clock.tempo_(120/60*4);
  
  ~offset = {(0..7)/8};
  
  ~tick.quant = 1;
  ~tick = {Mix(Impulse.kr( ~tempo / 2 , ~offset ))};
  
  ~counter = {PulseCount.kr(~tick.kr)};
);


// one synth ///////////////////////////////////////

(
~one.ar(2);
~one.quant=2;
~one.fadeTime=0.02;
~one={
  //         |       |       |       |       |  
  var pat = [1,0,0,0,1,0,0,0,1,0,0,0,1,0,0,0].rotate(1);
  var imp = PulseDivider.kr(~tick.kr,[1,2,3,4],~counter.kr);
  var hit = Select.kr(PulseCount.kr(imp)%pat.size,pat);
  var env = EnvGen.ar(Env([0.001,1,0.0001],[0.002,0.5],[3,-3],curve:'exp'),imp * hit);
  var f = LFTri.ar(2/[1,2,3,4]).exprange(50.01,15000)/4;
  var rate = 22050*[2,1/20000,1/20000];
  var t = PulseCount.ar(Impulse.ar(rate),Impulse.ar(f/[1,1.5,50]))/rate ** 0.4 * f;
  var sig = Perlin3.ar(t[0],t[1],t[2]);
  //sig = Resonz.ar(sig,500*[1,2,4,8],0.12);
  sig = CompanderD.ar(sig,3/4,1/2,1/2);
  sig = sig * env;
  Splay.ar(sig,0.05,0.5);
};
~one.play;
);
~one.stop(4);
~one.clear;
~one.pause;
~one.resume;


PulseCount.help
