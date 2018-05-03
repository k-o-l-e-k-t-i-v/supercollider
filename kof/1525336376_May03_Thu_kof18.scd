


p.push();
p.bpm(125);

(
  s.latency=0.2;
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

// fast_Switch synth ///////////////////////////////////////

(
~fast_Switch.ar(2);
~fast_Switch.quant=16;
~fast_Switch.fadeTime=0.2;
~fast_Switch={
  //         |       |       |       |       |  
  var pat = [
      1,0,0,0,1,0,0,0,1,0,0,0,1,0,0,0,
      1,0,0,0,1,0,0,0,1,0,0,0,1,0,1,0,
      1,0,0,0,1,0,0,0,1,0,0,0,1,0,0,0,
      1,0,0,0,1,0,0,0,1,0,0,0,1,1,0,0
  ].rotate(3);


  var mod = Duty.kr(32*[1,2,3,4]/~tempo,0,Dseq([1,2,1.5,1.33333,1,1,1,1,2,4],inf));
  var imp = PulseDivider.kr(~tick.kr,(1..8),~counter.kr % pat.size);
  var hit = Select.kr(PulseCount.kr(imp)%pat.size,pat);
  var env = EnvGen.ar(Env([0.001,1,0.0001],[0.002,4.5],[3,-3],curve:'exp'),imp * hit);
  
  var sig = [
  SinOsc.ar(50!2*mod),
  SinOsc.ar(5000!2/mod),
  SinOsc.ar(50!2),
  SinOsc.ar(500!2/mod),
  SinOsc.ar(50!2*mod),
  SinOsc.ar(15000!2/mod),
  SinOsc.ar(50!2),
  SinOsc.ar(150!2/mod),
  SinOsc.ar(50!2*mod),
  SinOsc.ar(250!2/mod),
  SinOsc.ar(50!2),
  SinOsc.ar(440!2/mod),
  SinOsc.ar(50!2*mod),
  SinOsc.ar(1000!2/mod),
  SinOsc.ar(50!2*mod),
  SinOsc.ar(500!2/mod),
  ];
  
  sig = Select.ar(PulseCount.kr(imp*hit)%sig.size,sig);
  sig = sig * LPF.ar(sig,900) * env;
  Splay.ar(sig,0.75,0.5);
};
~fast_Switch.play;
);
~fast_Switch.stop(4);
~fast_Switch.clear;
~fast_Switch.pause;
~fast_Switch.resume;


// kick synth ///////////////////////////////////////

(
~kick.ar(2);
~kick.clock = p.clock;
~kick.quant=[16,0];
~kick.fadeTime=0.02;
~kick={
  //  |       |       |       |       |  
  var pat = [
    1,0,0,0, 0,0,0,0, 0,0,0,0, 0,0,0,0,
    0,0,0,0, 0,0,0,0, 0,0,0,0, 0,0,0,0,
    0,0,0,0, 0,0,0,0, 0,0,0,0, 0,0,0,0,
    0,0,0,0, 0,0,0,0, 0,0,0,0, 0,0,0,0,
  ].rotate(1);
  var imp = PulseDivider.kr(~tick.kr,1,~counter.kr%pat.size);
  var hit = Select.kr(PulseCount.kr(imp)%pat.size,pat);
  var env = EnvGen.ar(Env([0.001,1,0.0001],[0.002,2.5],[3,-3]),imp * hit);
  var sig = SinOsc.ar(50 + (env**50*500),env**(80*LFNoise2.kr(~tempo/32!2))*8pi+BrownNoise.ar(0.2*env));
  sig = sig * env;
  Splay.ar(sig,0.75,0.95,SinOsc.ar(~tempo*16,[0,pi]));
};
~kick.play;
);
~kick.stop(4);
~kick.clear;
~kick.pause;
~kick.resume;
