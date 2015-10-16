

(
  p=ProxySpace.push(s.boot);
  p.makeTempoClock;
);


(
  p.clock.tempo_(2);
  
  ~offset = (0..7)/8;
  
  ~tick.quant = 1;
  ~tick = {Mix(Impulse.kr( ~tempo / 2 , ~offset ))};
  
  ~counter = {PulseCount.kr(~tick.kr)};
);


// ll synth ///////////////////////////////////////

(
~ll.ar(2);
~ll.quant=2;
~ll.fadeTime=0.02;
~ll={
  //         |       |       |       |       |  
  var pat = [1,0,0,0,1,1,0,0,1,0,0,0,1,1,0,0].rotate(1);
  var imp = PulseDivider.kr(~tick.kr,2,~counter.kr);
  var hit = Select.kr(PulseCount.kr(imp)/[1,2,3,4]%pat.size,pat);
  var mod = Select.kr(PulseCount.kr(imp*hit)/4%4,[1,1.5,1.25,2]);
  var env = EnvGen.ar(Env([0.001,1,0.001],[0.002,1.5],[3,-3],curve:'exp'),imp * hit);
  var sig = SinOsc.ar(50+(env**100*1000),SinOsc.ar(500*env/[1,2,3,4]).range(-pi,pi));
  sig = CombL.ar(sig,1,1/(1000/mod*[1,2,1.5,4]+SinOsc.ar(1/4/fib(4)).range(-2pi,2pi)).lag(0.02),4)/2;
  sig = sig * env;
  
  Splay.ar(sig,0.75,0.05);
};
~ll.play;
);
~ll.stop(4);
~ll.clear;
~ll.pause;
~ll.resume;


// hit synth ///////////////////////////////////////

(
~hit.ar(2);
~hit.quant=2;
~hit.fadeTime=0.2;
~hit={
  //         |       |       |       |       |  
  var pat = [1,0,0,0,1,1,0,0,1,0,0,0,1,1,0,0].rotate(3);
  var imp = PulseDivider.kr(~tick.kr,2,~counter.kr);
  var hit = Select.kr(PulseCount.kr(imp)/[1,2,3,4]%pat.size,pat);
  var env = EnvGen.ar(Env([0.001,1,0.001],[0.002,0.25],[3,1,-3],curve:'exp'),imp * hit);
  var sig = LFNoise2.ar(50+(env**10*1000)!4) + SinOsc.ar(50+(env**10*100));
  sig = sig * env;
  Splay.ar(sig.flat,0.25,0.5);
};
~hit.play;
);
~hit.stop(4);
~hit.clear;
~hit.pause;
~hit.resume;


// dd filter ///////////////////////////////////////

(
~dd.quant=1;
~dd.fadeTime=1;
~dd={
  var high,mid,low;
  var sig = ~ll + ~hit;
  
  sig = GVerb.ar(LPF.ar(sig,5000)+HPF.ar(sig,500),40,[3,4,5,6],spread:[40,90])/8 + sig;
  low = CompanderD.ar(LPF.ar(sig,400),3/4,1/2,1/2);
  mid = CompanderD.ar(BPF.ar(sig,600,2),3/4,1/2,1/2);
  high = CompanderD.ar(HPF.ar(sig,900),3/4,1/2,1/2);
  sig = CompanderD.ar((high+mid+low).flat,3/4,1/1.1,1/1.1);
  Splay.ar(sig,0.75,0.25);
};
~dd.play;
);
~dd.stop(7);
~dd.clear;
