
s.reboot;
p.push();
p.bpm(120);


// one synth ///////////////////////////////////////

(
~one.ar(2);
~one.clock = p.clock;
~one.quant=4;
~one.fadeTime=4;
~one={
  var sig = WhiteNoise.ar(0.2!2);
  Splay.ar(sig,0.5,0.5,SinOsc.ar(8));
};
~one.play;
);
~one.stop(4);
~one.clear;
~one.pause;
~one.resume;


// sw synth ///////////////////////////////////////

(
~sw.ar(2);
~sw.quant=16;
~sw.fadeTime=0.2;
~sw={
  //         |       |       |       |       |  
  var pat = [
      1,0,0,0,1,0,0,0,1,0,0,0,1,0,0,0,
      1,0,0,0,1,0,0,0,1,0,0,0,1,0,0,0,
      1,0,0,0,1,0,0,0,1,0,0,0,1,0,0,0,
      1,0,0,0,1,0,0,0,1,0,0,0,1,0,0,0
  ].rotate(3);
  var imp = PulseDivider.kr(~tick.kr,1,~counter.kr % pat.size);
  var hit = Select.kr(PulseCount.kr(imp)%pat.size,pat);
  var env = {EnvGen.ar(Env([0.001,1,0.0001],[0.002,4.15]*MouseX.kr(0,1),[3,-3],curve:'exp'),imp * hit)};
  var sig = [
  SinOsc.ar(55!2,Pulse.ar(8/[1,2,3,4])),
  WhiteNoise.ar(0.1!2),
  SinOsc.ar(55!2,env**20*4pi),
  PinkNoise.ar(0.1!2),
  SinOsc.ar(55!2,SinOsc.ar(16/[1,2,3,4])),
  BrownNoise.ar(0.1),
  SinOsc.ar(55!2,Pulse.ar(4/[1,2,3,4])),
  WhiteNoise.ar(0.1),
  ];
  sig = Select.ar(PulseCount.kr(imp*hit)%sig.size,sig);
  sig = Compander.ar(sig,~kick.ar,0.1,1,0.1);
  sig = sig * env;
  Splay.ar(sig,1,0.75);
};
~sw.play;
);
~sw.stop(30);
~sw.clear;
~sw.pause;
~sw.resume;


(
  s.latency=2/3;
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
