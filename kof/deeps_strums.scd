




(
  p.clock.tempo_(120/60);
  
  ~offset = (0..7)/8;
  
  ~tick.quant = 1;
  ~tick = {Mix(Impulse.kr( ~tempo / 2 , ~offset ))};
  
  ~counter = {PulseCount.kr(~tick.kr)};
);



// one synth ///////////////////////////////////////

(
~one.ar(2);
~one.quant=2;
~one.fadeTime=4;
~one={
  var mod = Duty.kr(16,0,Dseq([1,2,1.5,1.25],inf)).lag(1);
  var sig = LFNoise2.ar(50!4) * LFSaw.ar(50*[1,2,4,8]/mod);
  sig = Resonz.ar(sig,50*({(1..10).choose.reciprocal}!4+1*[1,2,8,4])/mod,LFNoise2.kr(1/4!4).range(0.01,0.2)) * LFNoise2.kr(1/4!4);
  sig = sig * LFSaw.ar(4/[1,2,3,4]);
  sig = CombN.ar(sig,1/50,1/50*[1,1.5,4,8]/mod,4);
  sig = AllpassN.ar(sig,1/4,1,1);
  sig = CompanderD.ar(sig,3/4,1/2,1/2);
  sig = LPF.ar(GVerb.ar(sig,40,4),1800)+sig;
  Splay.ar(sig,0.85,0.5,LFNoise2.kr(4));
};
~one.play;
);
~one.stop(4);
~one.clear;
~one.pause;
~one.resume;
