


p.push();
p.bpm(45);


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

// one synth ///////////////////////////////////////

(
s.latency = 0.25;
~one.ar(2);
~one.clock = p.clock;
~one.quant=4;
~one.fadeTime=0.1;
~one={
  var sig = SinOsc.ar(50!2,Pulse.ar(~tempo*3)) * Pulse.ar(~tempo*4);
  Splay.ar(sig,0.5,0.25);
};
~one.play;
);
~one.stop(4);
~one.clear;
~one.pause;
~one.resume;

// kickSaw synth ///////////////////////////////////////

(
~kickSaw.ar(2);
~kickSaw.clock = p.clock;
~kickSaw.quant=[16,0];
~kickSaw.fadeTime=0.02;
~kickSaw={
  //  |       |       |       |       |  
  var pat = [
    1,0,0,0, 0,0,0,0, 0,0,0,0, 0,0,0,0,
    1,0,0,0, 0,0,0,0, 0,0,0,0, 0,0,0,0,
    1,0,0,0, 0,0,0,0, 0,0,0,0, 0,0,0,0,
    1,0,0,0, 0,0,0,0, 0,0,0,0, 0,0,0,0,
  ].rotate(3);
  var mod =  Duty.kr(16/~tempo,0,Dseq([1,2,1.5,1.33333],inf));
  var imp = PulseDivider.kr(~tick.kr,[1,2,3,4],~counter.kr%pat.size);
  var hit = Select.kr(PulseCount.kr(imp)%pat.size,pat);
  var env = EnvGen.ar(Env([0.001,1,0.0001],[1.0,1.5],[3,-3]),imp * hit);
  var sig = VarSaw.ar(50*mod,0,env**0.2*8pi*LFTri.kr(1/15));
  sig = sig * env;
  Splay.ar(sig,0.75,0.5);
};
~kickSaw.play;
);
~kickSaw.stop(4);
~kickSaw.clear;
~kickSaw.pause;
~kickSaw.resume;
