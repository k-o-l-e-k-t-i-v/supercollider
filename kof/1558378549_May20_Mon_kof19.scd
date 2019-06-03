
p.push
p.bpm(1)

~tempo={LFNoise0.kr(~tempo*4).exprange(0.5,8).round(1/2)};

// one synth ///////////////////////////////////////

(
~one.ar(2);
~one.quant=2;
~one.fadeTime=4;
~one={
  var sig = SinOsc.ar(50,Pulse.ar(~tempo)) * Pulse.ar(~tempo);
  Splay.ar(Mix(LPF.ar(sig,250))+HPF.ar(sig,250),0.75,0.25);
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


// hiss synth ///////////////////////////////////////

(
~hiss.ar(2);
~hiss.quant=[16,0];
~hiss.fadeTime=0.02;
~hiss={
  //  |       |       |       |       |  
  var pat = [
    1,0,0,0, 0,0,0,0, 1,0,0,0, 0,0,0,0,
    1,0,0,0, 0,0,0,0, 1,0,0,0, 0,0,0,0,
    1,0,0,0, 0,0,0,0, 1,0,0,0, 0,0,0,0,
    1,0,0,0, 0,0,0,0, 1,0,0,0, 1,1,1,1,
  ].rotate(3);
  var imp = PulseDivider.kr(~tick.kr,1,~counter.kr%pat.size);
  var hit = Select.kr(PulseCount.kr(imp)%pat.size,pat);
  var env = EnvGen.ar(Env([0.001,1,0.0001],[0.002,0.5],[3,-3]),imp * hit);
  var sig = SinOsc.ar(15000!2,mul:0.1);
  sig = sig * env;
  Splay.ar(sig,0.75,0.5);
};
~hiss.play;
);
~hiss.stop(4);
~hiss.clear;
~hiss.pause;
~hiss.resume;
