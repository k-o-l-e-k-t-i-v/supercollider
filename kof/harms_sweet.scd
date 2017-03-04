



p.push();
p.bpm(90*2);



// one synth ///////////////////////////////////////

(
~one.ar(2);
~one.clock = p.clock;
~one.quant=8;
~one.fadeTime=4;
~one={
  var sig = SinOsc.ar(50!2,Pulse.ar(~tempo/2)) * LFTri.ar(~tempo/[1,2,3,4]/4) * Pulse.ar(~tempo/[1,2,3,4]);
  Splay.ar(sig,0.5,0.25);
};
~one.play;
);
~one.stop(4);
~one.clear;
~one.pause;
~one.resume;


// kick synth ///////////////////////////////////////

(
~kick.ar(2);
~kick.clock = p.clock;
~kick.quant=[16,0];
~kick.fadeTime=0.02;
~kick={
  //  |       |       |       |       |  
  var pat = [
    1,0,0,0, 0,0,0,0, 1,0,0,0, 0,0,0,0,
  ].rotate(1);
  var imp = PulseDivider.kr(~tick.kr,4,~counter.kr%pat.size);
  var hit = Select.kr(PulseCount.kr(imp)%pat.size,pat);
  var env = EnvGen.ar(Env([0.001,1,0.0001],[0.002,0.5],[3,-3]),imp * hit);
  var sig = SinOsc.ar(50!2,env**100*8pi);
  sig = sig * env;
  Splay.ar(sig,0.75,0.5);
};
~kick.play;
);
~kick.stop(4);
~kick.clear;
~kick.pause;
~kick.resume;


// kick2 synth ///////////////////////////////////////

(
~kick2.ar(2);
~kick2.clock = p.clock;
~kick2.quant=[16,0];
~kick2.fadeTime=0.02;
~kick2={
  //  |       |       |       |       |  
  var pat = [
    0,0,0,0, 1,0,0,0, 0,0,0,0, 1,0,0,0,
  ].rotate(1);
  var imp = PulseDivider.kr(~tick.kr,1,~counter.kr%pat.size);
  var hit = Select.kr(PulseCount.kr(imp)%pat.size,pat);
  var env = EnvGen.ar(Env([0.001,1,0.0001],[0.002,2.5],[3,-3]),imp * hit);
  var sig = SinOsc.ar(50!2,env**80*8pi);
  sig = sig * env;
  Splay.ar(sig,0.75,0.5);
};
~kick2.play;
);
~kick2.stop(4);
~kick2.clear;
~kick2.pause;
~kick2.resume;


// dusty synth ///////////////////////////////////////

(
~dusty.ar(2);
~dusty.clock = p.clock;
~dusty.quant=[8,0];
~dusty.fadeTime=0.02;
~dusty={
  //  |       |       |       |       |  
  var pat = [
    1,0,1,0, 1,0,1,0, 1,0,1,0, 1,0,1,0,
  ].rotate(3);
  var imp = PulseDivider.kr(~tick.kr,[2,16,32],~counter.kr%pat.size);
  var hit = Select.kr(PulseCount.kr(imp)%pat.size,pat);
  var env = {EnvGen.ar(Env([0.001,1,0.0001],[0.005,0.25]*LFNoise1.kr(~tempo/16!3).range(0.1,2),[3,-3]),imp * hit)};
  var sig = Dust.ar(env**LFNoise2.kr(~tempo!3).range(0.1,100)*1500);
  var mod = Duty.kr(16/~tempo,0,Dseq([1,2,1,1.5],inf));
  var not = Duty.kr([4,8,32]/~tempo*4,0,Dseq([60,65,60,67,63,60,60,60,72,48],inf));
  sig = SinOsc.ar(not.midicps/mod,mul:0.2)*Resonz.ar(sig,not.midicps/mod,0.02+LFNoise2.kr(~tempo/16).range(0.00001,0.01));
  sig = Normalizer.ar(sig);
  sig = sig * env;
  Splay.ar(sig,0.75,0.2);
};
~dusty.play;
);
~dusty.stop(4);
~dusty.clear;
~dusty.pause;
~dusty.resume;


(
//////////////////////////  FADE -> OUT ///////////////////////////////////////////////////////
{
  p.arProxyNames.do({|synth| if(synth.asSymbol!=\master){p[synth.asSymbol].clear(40);};});
}.fork;  
)

// hiss synth ///////////////////////////////////////

(
~hiss.ar(2);
~hiss.clock = p.clock;
~hiss.quant=[8,0];
~hiss.fadeTime=0.02;
~hiss={
  //  |       |       |       |       |  
  var pat = [
    1,0,0,0, 1,0,0,0, 1,0,1,0, 1,1,1,1,
  ].rotate(3);
  var imp = PulseDivider.kr(~tick.kr,[1,2,3,4],~counter.kr%pat.size);
  var hit = Select.kr(PulseCount.kr(imp)%pat.size,pat);
  var env = EnvGen.ar(Env([0.001,1,0.0001],[0.002,0.05*[1,2,3,4]],[3,-3]),imp * hit);
  var sig = HPF.ar(WhiteNoise.ar(0.9!4),19000/[1,2,3,4]);
  sig = sig * env;
  Splay.ar(sig,0.75,0.5);
};
~hiss.play;
);
~hiss.stop(4);
~hiss.clear;
~hiss.pause;
~hiss.resume;


(
  s.latency=0.5;
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
