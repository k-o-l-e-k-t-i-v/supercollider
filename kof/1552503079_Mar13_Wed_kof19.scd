


p.push();

p.bpm(112.5*2)


// hissa synth ///////////////////////////////////////

(
~hissa.ar(2);
~hissa.quant=[16,0];
~hissa.fadeTime=0.02;
~hissa={
  //  |       |       |       |       |  
  var pat = [
    1,0,0,0, 0,0,0,0, 0,0,0,0, 0,0,0,0,
    0,0,0,0, 0,0,0,0, 0,0,0,0, 0,0,0,0,
    0,0,0,0, 0,0,0,0, 0,0,0,0, 0,0,0,0,
    0,0,0,0, 0,0,0,0, 0,0,0,0, 0,0,0,0,
  ].rotate(1);
  var imp = PulseDivider.kr(~tick.kr,1,~counter.kr%pat.size);
  var hit = Select.kr(PulseCount.kr(imp)%pat.size,pat);
  var env = EnvGen.ar(Env([0.001,1,0.0001],[0.002,0.5],[3,-3]),imp * hit);
  var sig = BrownNoise.ar(env**10);
  sig = CombL.ar(sig,~tempo,~tempo,4);
  sig = sig * env;
  Splay.ar(sig,0.75,0.5);
};
~hissa.play;
);
~hissa.stop(4);
~hissa.clear;
~hissa.pause;
~hissa.resume;

// kick1 synth ///////////////////////////////////////

(
~kick1.ar(2);
~kick1.quant=[16,0];
~kick1.fadeTime=0.02;
~kick1={
  //  |       |       |       |       |  
  var pat = [
    1,0,0,0, 0,0,0,0, 1,0,0,0, 0,0,0,0,
    1,0,0,0, 0,0,0,0, 1,0,0,0, 0,0,0,0,
    1,0,0,0, 0,0,0,0, 1,0,0,0, 0,0,0,0,
    1,0,0,0, 0,0,0,0, 1,0,0,0, 0,0,1,0,
  ].rotate(1);
  var imp = PulseDivider.kr(~tick.kr,1,~counter.kr%pat.size);
  var hit = Select.kr(PulseCount.kr(imp)%pat.size,pat);
  var env = EnvGen.ar(Env([0.001,1,0.0001],[0.002,0.65*LFNoise1.kr(~tempo/32).range(0.5,1.5)],[3,-3]),imp * hit);
  var sig = SinOsc.ar(45!2+PinkNoise.ar(env**40*8),env**50*8pi) + BrownNoise.ar(env**20);
  sig = sig * env;
  Splay.ar(sig,0.75,0.5);
};
~kick1.play;
);
~kick1.stop(4);
~kick1.clear;
~kick1.pause;
~kick1.resume;



// kick2 synth ///////////////////////////////////////

(
~kick2.ar(2);
~kick2.quant=[16,0];
~kick2.fadeTime=0.02;
~kick2={
  //  |       |       |       |       |  
  var pat = [
    1,0,0,0, 0,0,0,0, 1,0,0,0, 0,0,0,0,
    1,0,0,0, 0,0,0,0, 1,0,0,0, 0,0,0,0,
    1,0,0,0, 0,0,0,0, 1,0,0,0, 0,0,0,0,
    1,0,0,0, 0,0,0,0, 1,0,0,0, 0,0,1,0,
  ].rotate(5);
  var mel = Duty.kr(32/~tempo*[1,2,4,8],0,Dseq([1,2,1.5,1.33333],inf));
  var imp = PulseDivider.kr(~tick.kr,1,~counter.kr%pat.size);
  var hit = Select.kr(PulseCount.kr(imp)%pat.size,pat);
  var env = EnvGen.ar(Env([0.001,1,0.0001],[0.002,1.5*LFNoise1.kr(~tempo/32).range(0.5,1.5)],[3,-3]),imp * hit);
  var sig = SinOsc.ar(50!2+BrownNoise.ar(env**50*8),env**60*8pi) + (SinOsc.ar(1500!2/mel,mul:0.03)*Pulse.ar(~tempo*2));
  sig = sig * env;
  Splay.ar(sig,0.75,0.5);
};
~kick2.play;
);
~kick2.stop(4);
~kick2.clear;
~kick2.pause;
~kick2.resume;


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
    1,0,0,0, 0,0,0,0, 0,0,0,0, 0,0,0,0,
    1,0,0,0, 1,0,1,0, 0,0,0,0, 0,0,0,0,
    1,0,0,0, 0,0,0,0, 0,0,0,0, 1,0,1,0,
    1,0,0,0, 1,0,0,0, 1,0,0,0, 1,1,1,1,
  ].rotate(5);
  var imp = PulseDivider.kr(~tick.kr,[1,2,3,4],~counter.kr%pat.size);
  var hit = Select.kr(PulseCount.kr(imp)%pat.size,pat);
  var env = EnvGen.ar(Env([0.001,1,0.0001],[0.002,1.75/[1,2,3,4]],[3,-3]),imp * hit);
  var sig = WhiteNoise.ar(env**20) * Pulse.ar(~tempo*8/[1,2,3,4]);
  sig = HPF.ar(sig,5000*[1,2,3,4]);
  sig = sig * env;
  sig = Compander.ar(sig,~kick1.ar+~kick2.ar,0.1,1,0.1);
  Splay.ar(sig,0.25,0.5);
};
~hiss.play;
);
~hiss.stop(4);
~hiss.clear;
~hiss.pause;
~hiss.resume;


// one synth ///////////////////////////////////////

(
~one.ar(2);
~one.quant=[16,5];
~one.fadeTime=4;
~one={
    var mel2 = Duty.kr(32/~tempo,0,Dseq([1,2,1.5,1.33333],inf)).lag(1);
    var mel = Duty.kr(~tempo/(1..16)*32,0,Dseq([1,2,1,2,1,1.5,4,8,16,32],inf))*mel2;

  var sig = LFSaw.ar(15000/mel*[1,2,1.5,2]+SinOsc.kr([2,3,4,5]),mul:0.2)*Pulse.ar(~tempo/(1..16));
  sig = MoogFF.ar(sig,15000/mel,LFTri.ar(~tempo/32));
  sig = CombN.ar(sig,1/500/mel,1/500/mel.lag(0.5),LFNoise1.kr(~tempo/16!4).range(0.1,1));
  sig = Compander.ar(sig,~kick1.ar+~kick2.ar,0.1,1,0.1);
  Splay.ar(sig,0.5,0.015);
};
~one.play;
);
~one.stop(4);
~one.clear;
~one.pause;
~one.resume;
