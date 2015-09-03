
(
  p=ProxySpace.push(s.reboot);
  p.makeTempoClock;
);

(
  p.clock.tempo_(60/60);

  ~offset = (0..7)/8;

  ~tick.quant = 1;
  ~tick = {Mix(Impulse.kr( ~tempo / 2 , ~offset ))};

  ~counter = {PulseCount.kr(~tick.kr)};
  ~time = {LFSaw.kr(~tempo/4).range(0,1)};
)

// aaa synth ///////////////////////////////////////

(
  ~aaa.quant=2;
  ~aaa.fadeTime=0.2;
  ~aaa={
    var pat = [1,0,0,0,1,0,0,0,1,0,0,0,1,0,0,0].rotate(1);
    var imp = PulseDivider.kr(~tick.kr,(1..16),~counter.kr);
    var hit = Select.kr(PulseCount.kr(imp)%pat.size,pat);
    var env = EnvGen.ar(Env([0.001,1,0.001],[1.002,0.5],[3,-3],curve:'exp'),imp * hit);
    var notes = ([60,64,67]).midicps;
    var sig = SinOsc.ar(notes*2pi/(1+(1..16).reciprocal));
    16.do{|i|
          sig = SinOsc.ar(notes*pi/(1+(i+1).reciprocal)+SinOsc.ar(1/(i+1)).range(-4*env,4*env),sig.lag(0.001),mul:1/(i+1)) + sig; 
          sig= Normalizer.ar(sig);
         };
    sig = sig * LFNoise2.kr(1/4/(1..16)).exprange(0.0001,1) * env;
    sig = GVerb.ar(sig,80,spread:[40,50])+sig;
    sig = CompanderD.ar(sig,3/4,1/3,1/2);
    sig = HPF.ar(sig,50);
    Splay.ar(sig.flat,0.25,0.75);
  };
  ~aaa.play;
);
~aaa.stop(7);
~aaa.clear;
