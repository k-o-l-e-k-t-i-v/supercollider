


(
  p=ProxySpace.push(s.boot);
  p.makeTempoClock;
);



(
  p.clock.tempo_(240/60);
  
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
  var pat = [1,0,0,0,1,0,0,0,1,0,0,0,1,0,0,0].rotate(1);
  var imp = PulseDivider.kr(~tick.kr,1,~counter.kr);
  var hit = Select.kr(PulseCount.kr(imp)%pat.size,pat);
  var env = EnvGen.ar(Env([0.001,1,1,0.001],[0.002,0.05,0.0002],[3,1,-3],curve:'exp'),imp * hit);
  var sig = [
    SinOsc.ar(440) + Pulse.ar(4),
    Pulse.ar(4),
    LFSaw.ar(15000),
    LFNoise2.ar(15000),
    SinOsc.ar(800),
    Pulse.ar(400),
    DC.ar(0)
  ];
  sig = Select.ar(PulseCount.kr(hit)/[1,2]%sig.size,sig);
  sig = Resonz.ar(sig,LFNoise2.ar(1/4!4).range(200,15000))+sig;
  sig = sig * env;
  Splay.ar(sig,0.75,0.25);
};
~switch.play;
);
~switch.pause;
~switch.resume;

// kick synth ///////////////////////////////////////

(
~kick.ar(2);
~kick.quant=2;
~kick.fadeTime=0.2;
~kick={
  //         |       |       |       |       |  
  var pat = [1,0,0,0,1,0,0,0,1,0,0,0,1,0,0,0].rotate(3);
  var imp = PulseDivider.kr(~tick.kr,2,~counter.kr);
  var hit = Select.kr(PulseCount.kr(imp)%pat.size,pat);
  var env = EnvGen.ar(Env([0.001,1,0.001],[0.002,1.5],[3,-3],curve:'exp'),imp * hit);
  var sig = SinOsc.ar(50+(env**40*400));
  sig = sig * env;
  Splay.ar(sig,0.75,0.5);
};
~kick.play;
);
~kick.pause;
~kick.resume;


// hh synth ///////////////////////////////////////

(
~hh.ar(2);
~hh.quant=2;
~hh.fadeTime=0.2;
~hh={
  //         |       |       |       |       |  
  var pat = [0,0,0,0,0,0,0,0,0,0,0,0,1,1,1,1].rotate(1);
  var imp = PulseDivider.kr(~tick.kr,2,~counter.kr);
  var hit = Select.kr(PulseCount.kr(imp)/[1,2,3,4]%pat.size,pat);
  var env = EnvGen.ar(Env([0.001,1,0.001],[0.002,0.15],[3,-3],curve:'exp'),imp * hit);
  var sig = LFNoise2.ar(15000/[1,2,4,8]);
  sig = sig * env;
  Splay.ar(sig,0.75,0.5);
};
~hh.play;
);
~hh.pause;
~hh.resume;


// ff filter ///////////////////////////////////////

(
~ff.quant=1;
~ff.fadeTime=1;
~ff={
  var high,mid,low;
  var sig = ~hh + ~kick + ~switch;
  
  sig = GVerb.ar(LPF.ar(sig,5000)+HPF.ar(sig,500),40,[3,4,5,6],spread:[40,90])/8 + sig;
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
