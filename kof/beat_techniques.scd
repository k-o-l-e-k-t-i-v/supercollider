



(
  p=ProxySpace.push(s.reboot,clock:TempoClock.default);
);


(
  ~tempo = 2/3;
  ~offset = (0..7)/8;
  t = TempoClock.default = TempoClock.new(~tempo);
  ~tick.quant = 2;
  ~tick = {Mix(Impulse.kr( ~tempo / 2 , ~offset ))};
  
  ~offset = (0..7)+0.5/8;
  ~tick2.quant = 2;
  ~tick2 = {Mix(Impulse.kr( ~tempo / 2 , ~offset ))};
  ~counter = {PulseCount.kr(~tick.kr)};
  ~time = {LFSaw.kr(~tempo/4).range(0,1)};
)



// kick synth ///////////////////////////////////////

(
~kick.quant=1;
~kick.fadeTime=0.02;
~kick={
  var imp = TDelay.kr(PulseDivider.kr(~tick.kr,2,~counter.kr),1/8*(1..8)/~tempo);
  var env = EnvGen.ar(Env([0.001,1,0.001],[0.002,0.225*(1..8)],[3,-3]),imp);
  var sig = SinOsc.ar(env**[8,4,3]*[80,9,100,12,100]+36.midicps,mul:0.8);
  sig = sig * SinOsc.ar(~tempo*env*10);
  sig = sig * env;
  Splay.ar(sig.flat,0.75,0.75);
};
~kick.play;
);
~kick.stop(7);
~kick.clear;



// hh synth ///////////////////////////////////////

(
~hh.quant=1;
~hh.fadeTime=3.02;
~hh={
  var imp = PulseDivider.kr(~tick2.kr,2,~counter.kr);
  var ret = TDelay.kr(imp,1/8*(1..4)/~tempo);
  var env = EnvGen.ar(Env([0.001,1,0.001],[0.002,0.155],[3,-6]),ret);
  var sig = WhiteNoise.ar(0.1!2);
  sig = HPF.ar(sig,LFNoise2.kr(~tempo/16!8).range(1000,10000));
  sig = sig * env;
  Splay.ar(sig.flat,0.75,0.35);
};
~hh.play;
);
~hh.stop(7);
~hh.clear;


// filter filter ///////////////////////////////////////

(
~filter.quant=1;
~filter.fadeTime=1;
~filter={
  var high,mid,low;
  var sig = ~kick.ar + ~hh.ar;
  
  sig = GVerb.ar(LPF.ar(sig,2000)+HPF.ar(sig,300),[10,50],[3,4],spread:[22,45])/16 + sig;
  low = CompanderD.ar(LPF.ar(sig,300*LFNoise2.kr(1/4)+300),3/4,1/3,1/2);
  mid = CompanderD.ar(BPF.ar(sig,800*LFNoise2.kr(1/4)+800,2),3/4,1/3,1/2);
  high = CompanderD.ar(HPF.ar(sig,1900*LFNoise2.kr(1/4)+1900),3/4,1/3,1/2);
  sig = CompanderD.ar((high+mid+low).flat,3/4,1/1.1,1/1.1);
  Splay.ar(sig.distort,0.75,0.15);
};
~filter.play;
);
~filter.stop(7);
~filter.clear;
