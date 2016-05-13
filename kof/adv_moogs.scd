


(
  p.clock.tempo_(120/60*2);
  
  ~offset = (0..7)/8;
  
  ~tick.quant = 1;
  ~tick = {Mix(Impulse.kr( ~tempo / 2 , ~offset ))};
  
  ~counter = {PulseCount.kr(~tick.kr)};
);



// one synth ///////////////////////////////////////

(
~one.ar(2);
~one.quant=2;
~one.fadeTime=0.2;
~one={|base = 6|

  var mod = Duty.kr(4,0,Dseq([1,2,1.5,1.3333],inf));
  //         |       |       |       |       |  
  var pat = [1,0,0,0,1,0,0,0,1,0,0,0,1,0,1,0].rotate(3);
  var imp = PulseDivider.kr(~tick.kr,(1..4)*2,~counter.kr);
  var hit = Select.kr(PulseCount.kr(imp)%pat.size,pat);
  var env = EnvGen.ar(Env([0.001,1,0.0001],[0.005,1.5*(1..4)],[3,-3],curve:'exp'),imp * hit);
  var sig = Formant.ar(base.octcps/[1,2,4/3,3/2]/mod,env**LFNoise2.kr(1/40/(1..4),mul:2)*100+50,env**LFNoise2.kr(1/60/(1..4),mul:2)*1000+50);
  sig = sig * env;
  sig = MoogFF.ar(sig,env**LFNoise2.kr(1/4!16,mul:2)*1800+50,LFNoise2.kr(1/60!16).range(0.01,0.4));
  sig = CompanderD.ar(sig,3/4,1/2,1/20);
  Splay.ar(sig,0.5,0.5);
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
~kick.quant=2;
~kick.fadeTime=0.2;
~kick={
  //         |       |       |       |       |  
  var pat = [1,0,0,0,1,0,0,0,1,0,0,0,1,0,1,0].rotate(1);
  var imp = PulseDivider.kr(~tick.kr,2,~counter.kr);
  var hit = Select.kr(PulseCount.kr(imp)%pat.size,pat);
  var env = EnvGen.ar(Env([0.001,1,0.0001],[0.002,2.5],[3,-3],curve:'exp'),imp * hit);
  var sig = SinOsc.ar(50!2,env**20*8pi);
  sig = sig * env;
  Splay.ar(sig,0.75,0.95);
};
~kick.play;
);
~kick.stop(4);
~kick.clear;
~kick.pause;
~kick.resume;


