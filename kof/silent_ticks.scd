



(
  p=ProxySpace.push(s.boot);
  p.makeTempoClock;
);


(
  p.clock.tempo_(1.628*120/60);
  
  ~offset = (0..7)/8;
  
  ~tick.quant = 1;
  ~tick = {Mix(Impulse.kr( ~tempo / 2 , ~offset ))};
  
  ~counter = {PulseCount.kr(~tick.kr)};
);


// ss synth ///////////////////////////////////////

(
~ss.ar(2);
~ss.quant=2;
~ss.fadeTime=0.2;
~ss={
  //         |       |       |       |       |  
  var pat = [1,0,0,0,1,0,0,0,1,0,0,0,1,0,0,0].rotate(1);
  var imp = PulseDivider.kr(~tick.kr,1,~counter.kr);
  var hit = Select.kr(PulseCount.kr(imp)%pat.size,pat);
  var env = EnvGen.ar(Env([0.00001,1,1,0.00001],[0.25,0.25*1.628,0.25]*LFNoise2.ar(4!16),[3,1,-3],curve:'exp'),imp * hit);
  var base = 60.midicps*2pi;
  var sig = 
  SinOsc.ar(base/(2*[1,2,3,4].reciprocal**2),mul:0.2) ++
    LFSaw.ar(base/(4*[1,2,3,4].reciprocal**1.5),mul:0.2) ++
    VarSaw.ar(base/(8*[1,2,3,4].reciprocal**1.25),mul:0.2) ++
  LFNoise2.ar(base*(1..16),mul:0.2);

  env = env * LFNoise2.kr(1/4!16) * LFNoise2.ar(200!16);
  sig = Resonz.ar(sig,LFNoise2.kr(4!16).range(base/4,base*4));
  sig = Select.ar(PulseCount.kr(imp*hit)%sig.pyramid.size,sig.pyramid.scramble);
  sig = sig * env;
  Splay.ar(sig.flat,0.15,0.75);
};
~ss.play;
);
~ss.stop(4);
~ss.clear;
~ss.pause;
~ss.resume;

// kick synth ///////////////////////////////////////

(
~kick.ar(2);
~kick.quant=2;
~kick.fadeTime=0.2;
~kick={
  //         |       |       |       |       |  
  var pat = [1,0,0,0,1,1,0,0,1,0,0,0,1,1,1,1].rotate(3);
  var imp = PulseDivider.kr(~tick.kr,64,~counter.kr)!4;
  var hit = Select.kr(PulseCount.kr(imp)/[1,2,3,4]%pat.size,pat);
  var env = EnvGen.ar(Env([0.001,1,0.001],[0.002,2.5],[3,-3],curve:'exp'),imp * hit);
  var sig = SinOsc.ar(50 + (env**[100,10,20,40]*1000),(1..4)/4*pi);
  sig = sig * env;
  Splay.ar(sig.flat,0.15,0.25);
};
~kick.play;
);
~kick.stop(4);
~kick.clear;
~kick.pause;
~kick.resume;

