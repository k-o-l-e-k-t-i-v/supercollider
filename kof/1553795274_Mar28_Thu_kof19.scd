p.push
p.bpm(112.3*2)
// one synth ///////////////////////////////////////

(
~one2.ar(2);
~one2.quant=16;
~one2.fadeTime=1;
~one2={
  var sig = SinOsc.ar(10000) * Pulse.ar(~tempo/[1,2,3,4]) + LFSaw.ar(50+(SinOsc.ar(~tempo/16/[1,2,3,4])*([1,2,3,4]/64*~tempo)));
  Splay.ar(sig,0.5,0.05);
};
~one2.play;
);
~one2.stop(4);
~one2.clear;
~one2.pause;
~one2.resume;

// one synth ///////////////////////////////////////

(
~one.ar(2);
~one.quant=16;
~one.fadeTime=0.2;
~one={
  //         |       |       |       |       |  
  var pat = [1,0,0,0,1,0,0,0,1,0,0,0,1,0,0,0].rotate(5);
  var imp = PulseDivider.kr(~tick.kr,4,~counter.kr % pat.size);
  var hit = Select.kr(PulseCount.kr(imp)%pat.size,pat);
  var env = EnvGen.ar(Env([0.001,1,0.0001],[0.002,1.5],[3,-3],curve:'exp'),imp * hit);
  var mel = Duty.kr(32/~tempo*[1,2,3,4],0,Dseq([1,2,1.5,1.33333],inf));
  var sig = [
  SinOsc.ar(50!2*mel),
  PinkNoise.ar(0.2),
  Pulse.ar(~tempo),
  BrownNoise.ar(0.15),
  SinOsc.ar(150!2*mel,mul:0.2),
  GrayNoise.ar(0.1),
  LFSaw.ar(50!2,mul:0.21),
  SinOsc.ar(15000!2/mel,mul:0.1),
  ];
  sig = Select.ar(PulseCount.kr(imp*hit)%sig.size,sig);
  sig = Perlin3.ar(sig+LFSaw.ar(~tempo/320),sig+1/[1,2,3,4],sig+1*LFSaw.ar(~tempo/16/[1,2,3,4]).exprange(0.01,80));
  sig = LeakDC.ar(sig);
  //sig = sig * env;
  sig = Compander.ar(sig,~kick.ar,0.1,1,0.1);
  Splay.ar(sig,0.35,0.5);
};
~one.play;
);
~one.stop(4);
~one.clear;
~one.pause;
~one.resume;

(
  //s.latency=0.2;
  //p.clock.tempo_(120/60);
  p.arProxyNames.do({|synth| if(synth.asSymbol!=\master){p[synth.asSymbol].rebuild;};});
  ~tick.kr(1);
  ~tick.quant = 16;
  ~counter.quant = 16;
  ~counter = {PulseCount.kr(~tick.kr);};
  ~tick = { Impulse.kr( ~tempo * 4 ); };
);


// kick synth ///////////////////////////////////////

(
~kick.ar(2);
~kick.quant=[16,0];
~kick.fadeTime=0.02;
~kick={
  //  |       |       |       |       |  
  var pat = [
    1,0,0,0, 0,0,0,0, 1,0,0,0, 0,0,0,0,
    1,0,0,0, 0,0,0,0, 1,0,0,0, 0,0,0,0,
    1,0,0,0, 0,0,0,0, 1,0,0,0, 0,0,0,0,
    1,0,0,0, 0,0,0,0, 1,0,0,0, 1,0,1,0,
  ].rotate(5);
  var imp = PulseDivider.kr(~tick.kr,1,~counter.kr%pat.size);
  var hit = Select.kr(PulseCount.kr(imp)%pat.size,pat);
  var env = EnvGen.ar(Env([0.001,1,0.0001],[0.002,2.5],[3,-3]),imp * hit);
  var sig = SinOsc.ar(50!2+(env**60*50),env**60*8pi);
  sig = sig * env;
  Splay.ar(sig,0.75,0.5);
};
~kick.play;
);
~kick.stop(4);
~kick.clear;
~kick.pause;
~kick.resume;
