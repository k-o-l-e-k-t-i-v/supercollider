Kolektiv.free;
Kolektiv(\kof)
Kolektiv.players;
Kolektiv.historyRestart;
Kolektiv.historySave
(
  ~offset = (0..7)/8;

  ~tick.quant = 1;
  ~tick = {Mix(Impulse.kr( ~tempo / 2 , ~offset ))};

  ~counter = {PulseCount.kr(~tick.kr)};
);


Kolektiv.tempo = 240;


// pulse synth ///////////////////////////////////////

(
~pulse.ar(2);
~pulse.quant=2;
~pulse.fadeTime=4.2;
~pulse={
  //         |       |       |       |       |  
  var pat = [1,0,0,0,1,0,0,0,1,0,0,0,1,0,0,0].rotate(1);
  var imp = PulseDivider.kr(~tick.kr,2,~counter.kr);
  var hit = Select.kr(PulseCount.kr(imp)/[1,2,3,4]%pat.size,pat);
  var env = EnvGen.ar(Env([0.001,0.1,1,0.001],[0.002,0.05,0.002],[3,1,-3],curve:'exp'),imp * hit);
  var sig = Pulse.ar(50) * LFSaw.ar(150*[1,2,10,20]) + SinOsc.ar(50*(1+(1..4).reciprocal),SinOsc.ar(50/fib(8)).range(-pi,pi));
  sig = LPF.ar(sig,80+LFNoise2.ar(8/fib(4)).range(0,10000) );
  sig = sig * env;
  //sig = CombN.ar(sig,1/2,1/8,4);
  Splay.ar(sig,0.25,0.25);
};
~pulse.play;
);
~pulse.stop(4);
~pulse.clear;
~pulse.pause;
~pulse.resume;

// rr synth ///////////////////////////////////////

(
~rr.ar(2);
~rr.quant=2;
~rr.fadeTime=0.2;
~rr={
  //         |       |       |       |       |  
  var pat = [1,0,0,0,1,0,0,0,1,0,0,0,1,0,0,0].rotate(3);
  var imp = PulseDivider.kr(~tick.kr,2,~counter.kr);
  var hit = Select.kr(PulseCount.kr(imp)/[1,2,3,4]%pat.size,pat);
  var env = EnvGen.ar(Env([0.001,1,0.001],[0.002,4.5],[3,-3],curve:'exp'),imp * hit);
  var sig = SinOsc.ar(50+(env**[40,60,70,90]*400));
  sig = sig * env;
  Splay.ar(sig,0.25,0.95);
};
~rr.play;
);
~rr.stop(4);
~rr.clear;
~rr.pause;
~rr.resume;


// hh synth ///////////////////////////////////////

(
~hh.ar(2);
~hh.quant=2;
~hh.fadeTime=0.2;
~hh={
  //         |       |       |       |       |  
  var pat = [1,0,0,0,1,0,0,0,1,0,0,0,1,0,0,0].rotate(1);
  var imp = PulseDivider.kr(~tick.kr,2,~counter.kr);
  var hit = Select.kr(PulseCount.kr(imp)/[1,2,3,4]%pat.size,pat);
  var env = EnvGen.ar(Env([0.001,1,0.001],[0.002,0.05],[3,-3],curve:'exp'),imp * hit);
  var sig = WhiteNoise.ar(1!4);
  sig = sig * env;
  Splay.ar(sig,0.75,0.25);
};
~hh.play;
);
~hh.stop(4);
~hh.clear;
~hh.pause;
~hh.resume;



// ss synth ///////////////////////////////////////

(
~ssa.ar(2);
~ssa.quant=2;
~ssa.fadeTime=4.2;
~ssa={
  //         |       |       |       |       |  
  var pat = [1,0,0,0,1,0,0,0,1,0,0,0,1,0,0,0].rotate(3);
  var imp = PulseDivider.kr(~tick.kr,1,~counter.kr);
  var hit = Select.kr(PulseCount.kr(imp)/[1,2,3,4]%pat.size,pat);
  var env = EnvGen.ar(Env([0.001,1,0.001],[0.002,0.25],[3,-3],curve:'exp'),imp * hit);
  var sig = SinOsc.ar(15000/1.25/(1+(1..4).reciprocal**1.5)+SinOsc.ar(4/fib(4)).range(-40,40),SinOsc.ar(50/[1,2,3,4]).range(-pi,pi));
  sig = sig * env;
  Splay.ar(sig,0.75,0.75);
};
~ssa.play;
);
~ssa.stop(4);
~ssa.clear;
~ssa.pause;
~ssa.resume;


// ss synth ///////////////////////////////////////

(
~ss.ar(2);
~ss.quant=2;
~ss.fadeTime=0.2;
~ss={
  //         |       |       |       |       |  
  var pat = [1,0,0,0,1,0,0,0,1,0,0,0,1,0,0,0].rotate(3);
  var imp = PulseDivider.kr(~tick.kr,16,~counter.kr);
  var hit = Select.kr(PulseCount.kr(imp)%pat.size,pat);
  var env = EnvGen.ar(Env([0.001,1,1,0.001],[0.002,0.05,0.0002],[3,1,-3],curve:'exp'),imp * hit);
  var sig = [
  SinOsc.ar(5000),
    LFSaw.ar(15000),
    Pulse.ar(4),
    LFSaw.ar(50),
    Pulse.ar(50),
    LFSaw.ar(50)
  ];
  sig = Select.ar(PulseCount.kr(imp*hit)%sig.size,sig);
  sig = sig * env;
  Splay.ar(sig,0.75,0.05);
};
~ss.play;
);
~ss.stop(4);
~ss.clear;
~ss.pause;
~ss.resume;



// ff filter ///////////////////////////////////////

(
~ff.quant=1;
~ff.fadeTime=1;
~ff={
  var high,mid,low;
  var sig = ~ss.ar + ~rr.ar + ~hh.ar + ~ssa.ar;
  
  sig = GVerb.ar(LPF.ar(sig,5000)+HPF.ar(sig,500),40,[3,4,5,6],spread:[40,90])/8 + sig;
  low = CompanderD.ar(LPF.ar(sig,400),3/4,1/2,1/2);
  mid = CompanderD.ar(BPF.ar(sig,600,2),3/4,1/2,1/2);
  high = CompanderD.ar(HPF.ar(sig,900),3/4,1/2,1/2);
  sig = CompanderD.ar((high+mid+low).flat,3/4,1/1.1,1/1.1);
  Splay.ar(sig,0.75,0.15);
};
~ff.play;
);
~ff.stop(7);
~ff.clear;
