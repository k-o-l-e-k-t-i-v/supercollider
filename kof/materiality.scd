




(
  p=ProxySpace.push(s.boot);
  p.makeTempoClock;
);


(
  p.clock.tempo_(120/60/4);
  
  ~offset = (0..7)/8;
  
  ~tick.quant = 1;
  ~tick = {Mix(Impulse.kr( ~tempo / 2 , ~offset ))};
  
  ~counter = {PulseCount.kr(~tick.kr)};
);


// switch synth ///////////////////////////////////////

(
~switch.ar(2);
~switch.quant=2;
~switch.fadeTime=0.2;
~switch={
  //         |       |       |       |       |  
  var pat = [1,0,0,0,1,0,0,0,1,0,0,0,1,1,1,1].rotate(1);
  var imp = PulseDivider.kr(~tick.kr,fib(4),~counter.kr);
  var hit = Select.kr(PulseCount.kr(imp)/(1..4)%pat.size,pat);
  var env = [
    EnvGen.ar(Env([0.001,1,1,0.001],[0.002,0.95,0.002],[3,1,-3],curve:'exp'),imp * hit),
    EnvGen.ar(Env([0.001,1,1,0.001],[0.002,0.05,0.002],[3,1,-3],curve:'exp'),imp * hit),
    EnvGen.ar(Env([0.001,1,1,0.001],[0.002,0.75,0.002],[3,1,-3],curve:'exp'),imp * hit),
    EnvGen.ar(Env([0.001,1,1,0.001],[0.002,0.15,0.002],[3,1,-3],curve:'exp'),imp * hit)
  ];

  var sig = [ 
    SinOsc.ar(50+(env**40*400)+[0,0.1],SinOsc.ar(50/2).range(-pi,pi)),
    SinOsc.ar(1500+[0,0.1],SinOsc.ar([40.01,40]).range(-pi,pi),mul:0.5),
    Pulse.ar([4,4.01]*fib(4)) /8,
    LFNoise2.ar(15000+[0,1]/[1,1.5,1.25,4]) / 4
  ];
  
  sig = Select.ar(PulseCount.kr(hit)%sig.size,sig);
  env = Select.ar(PulseCount.kr(hit)%env.size,env);
  
  sig = sig * env;
  Splay.ar(sig.flat,0.75,0.5);
};
~switch.play;
);
~switch.stop(7);
~switch.clear;

// ff filter ///////////////////////////////////////

(
~ff.quant=1;
~ff.fadeTime=1;
~ff={
  var high,mid,low;
  var sig = ~switch;
  
  //sig = GVerb.ar(LPF.ar(sig,5000)+HPF.ar(sig,500),40,[3,4,5,6],spread:[40,90])/8 + sig;
  low = CompanderD.ar(LPF.ar(sig,400),3/4,1/2,1/2);
  mid = CompanderD.ar(BPF.ar(sig,600,2),3/4,1/2,1/2);
  high = CompanderD.ar(HPF.ar(sig,900),3/4,1/2,1/2);
  sig = CompanderD.ar((high+mid+low).flat,3/4,1/1.1,1/1.1);
  Splay.ar(sig,0.75,0.25);
};
~ff.play;
);
~ff.stop(7);
~ff.clear;
