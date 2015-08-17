





(
  p=ProxySpace.push(s.reboot,clock:TempoClock.default);
);



(
  ~tempo = 2;
  ~offset = (0..7)/8;
  t = TempoClock.new(~tempo);
  ~tick.quant = 1;
  ~tick = {Mix(Impulse.kr( ~tempo / 2 , ~offset ))};
  
  ~offset = (0..7)+0.5/8;
  ~tick2.quant = 1;
  ~tick2 = {Mix(Impulse.kr( ~tempo / 2 , ~offset ))};
  ~counter = {PulseCount.kr(~tick.kr)};
  ~time = {LFSaw.kr(~tempo/4).range(0,1)};
)



// kick synth ///////////////////////////////////////

(
~kick.quant=4;
~kick.fadeTime=0.02;
~kick={
  var pat = [0,0,0,1,1,1,0,0,1,1,0,0,0,1,1,1];
  var imp = PulseDivider.kr(~tick.kr,2,~counter.kr);
  var hit = Select.kr(PulseCount.kr(imp)%pat.size,pat);
  var env = EnvGen.ar(Env([0.001,1,0.001],[0.002,2.5],[3,-3]),imp * hit);
  var sig = SinOsc.ar(70+(env**80*400));
  sig = sig * env;
  Splay.ar(sig,0.75,0.5);
};
~kick.play;
);
~kick.stop(7);
~kick.clear;

(
~hat.quant=4;
~hat.fadeTime=0.02;
~hat={
  //         |     |     |     |     |
  var pat = [0,0,0,0,0,0,0,0,0,1,1,1,1];
  var imp = PulseDivider.kr(~tick.kr,1,~counter.kr);
  var hit = Select.kr(PulseCount.kr(imp)%pat.size,pat);
  var env = EnvGen.ar(Env([0.001,1,0.001],[0.002,0.15],[3,-3]),imp * hit);
  var sig = HPF.ar(WhiteNoise.ar(1!4),LFNoise2.kr(2).range(1000,10000));
  sig = sig * env;
  Splay.ar(sig,0.75,0.5);
};
~hat.play;
);



// bass synth ///////////////////////////////////////

(
~bass.quant=1;
~bass.fadeTime=4.02;
~bass={
  //         |   |   |   |   |   |   |   |  
  var pat = [1,0,0,0,1,0,0,0,1,0,0,0,1,0,0,0];
  var imp = PulseDivider.kr(~tick.kr,8,~counter.kr);
  var hit = Select.kr(PulseCount.kr(imp)%pat.size,pat);
  var env = EnvGen.ar(Env([0.001,1,0.001],[1.202,3.5],[3,-3]),imp * hit);
  var sig = LFSaw.ar([50,75]+(env**0.1*10) * (1.0001**(1..8)));
  sig = LPF.ar(sig,1800);
  sig = sig * env;
  Splay.ar(sig,0.75,0.5);
};
~bass.play;
);
~bass.stop(7);
~bass.clear;


// high synth ///////////////////////////////////////

(
~high.quant=1;
~high.fadeTime=0.02;
~high={
  //         |   |   |   |   |   |   |   |  
  var pat = [1,0,1,0,1,0,1,0,1,0,1,0,1,0,1,0];
  var imp = PulseDivider.kr(~tick.kr,64,~counter.kr);
  var hit = Select.kr(PulseCount.kr(imp)%pat.size,pat);
  var env = EnvGen.ar(Env([0.001,1,0.001],[0.002,4.5],[3,-3]),imp * hit);
  var sig = SinOsc.ar(8000) * LFPulse.ar(4);
  sig = sig * env;
  Splay.ar(sig,0.75,0.25);
};
~high.play;
);
~high.stop(7);
~high.clear;

// filter filter ///////////////////////////////////////

(
~filter.quant=1;
~filter.fadeTime=1;
~filter={
  var high,mid,low;
  var sig = ~kick + ~hat + ~bass;
  
  sig = GVerb.ar(LPF.ar(sig,5000)+HPF.ar(sig,500),40,[3,4,5,6],spread:[10,90])/8 + sig;
  low = CompanderD.ar(LPF.ar(sig,600),3/4,1/2,1/2);
  mid = CompanderD.ar(BPF.ar(sig,800,2),3/4,1/2,1/2);
  high = CompanderD.ar(HPF.ar(sig,900),3/4,1/2,1/2);
  sig = CompanderD.ar((high+mid+low).flat,3/4,1/1.1,1/1.1);
  Splay.ar(sig,0.75,0.25);
};
~filter.play;
);
~filter.stop(7);
~filter.clear;
