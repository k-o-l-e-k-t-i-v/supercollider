

p.push();

p.bpm(115.79);

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

// nth synth ///////////////////////////////////////

(
~nth.ar(2);
~nth.clock = p.clock;
~nth.quant=[12,0];
~nth.fadeTime=0.02;
~nth={
  //  |       |       |       |       |  
  var pat = [
    1,0,0, 0,0,0, 1,0,0, 0,0,0,
  ].rotate(1);
  var imp = PulseDivider.kr(~tick.kr,1,~counter.kr%pat.size);
  var hit = Select.kr(PulseCount.kr(imp)%pat.size,pat);
  var mod = ToggleFF.kr(hit);
  var env = EnvGen.ar(Env([0.001,1,0.0001],[0.002,0.5+(mod*2)],[3,-3]),imp * hit);
  var sig = SinOsc.ar(50!2+(mod*25),env**(40+(mod*40))*8pi);
  sig = sig * env;
  Splay.ar(sig,0.75,0.5);
};
~nth.play;
);
~nth.stop(4);
~nth.clear;
~nth.pause;
~nth.resume;

// hiss synth ///////////////////////////////////////

(
~hiss.ar(2);
~hiss.clock = p.clock;
~hiss.quant=[12,0];
~hiss.fadeTime=0.02;
~hiss={
  //  |       |       |       |       |  
  var pat = [
    0,1,1, 0,1,1, 0,1,1, 0,1,1
  ].rotate(1);
  var imp = PulseDivider.kr(~tick.kr,1,~counter.kr%pat.size);
  var hit = Select.kr(PulseCount.kr(imp)%pat.size,pat);
  var env = EnvGen.ar(Env([0.001,1,0.0001],[0.002,0.55],[3,-3]),imp * hit);
  var sig = WhiteNoise.ar(0.75!2) * BrownNoise.ar(env**2);
  var dut = Duty.kr(~tempo/12,0,Dseq([4,8,12,16,1,2,1.5,1.33333],inf));
  var dut2 = Duty.kr(~tempo/[3,4,1,1/4],0,Dseq([4,8,12,16,1,2,1.5,1.33333],inf));
  sig = HPF.ar(sig,5000) + VarSaw.ar(dut*440*(env**0.01)/dut2,mul:0.07);
  sig = sig * env;
  sig= CombN.ar(sig,1/50,2/50,~tempo/6);
  Splay.ar(sig,0.75,0.95);
};
~hiss.play;
);
~hiss.stop(4);
~hiss.clear;
~hiss.pause;
~hiss.resume;
