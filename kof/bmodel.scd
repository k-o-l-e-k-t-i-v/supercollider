
(
  p=ProxySpace.push(s.boot);
  p.makeTempoClock;
);



Kolektiv(\kof)


(
  p.clock.tempo_(120/60*2);
  
  ~offset = (0..7)/8;
  
  ~tick.quant = 1;
  ~tick = {Mix(Impulse.kr( ~tempo / 2 , ~offset ))};
  
  ~counter = {PulseCount.kr(~tick.kr)};
);

// input synth ///////////////////////////////////////

(
~input.ar(2);
~input.quant=2;
~input.fadeTime=4.2;
~input={
  var mod = Duty.kr(~tempo/16,0,Dseq([1,2,1.5,1.25],inf));
  //         |       |       |       |       |  
  var pat = [1,0,0,0,1,0,0,0,1,0,0,0,1,0,0,0].rotate(3);
  var imp = PulseDivider.kr(~tick.kr,[1,2,3,4],~counter.kr);
  var hit = Select.kr(PulseCount.kr(imp)%pat.size,pat);
  var env = EnvGen.ar(Env([0.001,1,0.0001],[0.002,0.5],[3,-3],curve:'exp'),imp * hit);
  var sig = AudioIn.ar([1,2],mul:1);
  //sig = Resonz.ar(sig,500*[1,2,4,8,16],0.02) * LFSaw.ar(~tempo.kr/[1,2,3,4]).exprange(0.001,1);
  
  sig = RLPF.ar(sig,1502*(1..8).reciprocal,0.5);
  sig= HPF.ar(sig,500);
  //sig = Normalizer.ar(sig);
 // sig = PitchShift.ar(sig,0.25,mod);
  //sig = sig * env;
  sig = DelayN.ar(sig,1,[1,2,4,8])+sig;
  sig = GVerb.ar(sig,100,10)/2+sig;
  Splay.ar(sig,0.75,0.55);
};
~input.play;
);
~input.stop(4);
~input.clear;
~input.pause;
~input.resume;


// kick synth ///////////////////////////////////////

(
~kick.ar(2);
~kick.quant=2;
~kick.fadeTime=0.2;
~kick={
  //         |       |       |       |       |  
  var pat = [1,0,0,0,1,0,0,0,1,0,0,0,1,0,0,0].rotate(1);
  var imp = PulseDivider.kr(~tick.kr,[2],~counter.kr);
  var hit = Select.kr(PulseCount.kr(imp)%pat.size,pat);
  var env = EnvGen.ar(Env([0.001,1,0.0001],[0.002,3.5],[3,-3],curve:'exp'),imp * hit);
  var sig = SinOsc.ar(50+(env**50*500));
  sig = sig * env;
  Splay.ar(sig,0.75,0.95);
};
~kick.play;
);
~kick.stop(4);
~kick.clear;
~kick.pause;
~kick.resume;

// ws synth ///////////////////////////////////////

(
~ws.ar(2);
~ws.quant=2;
~ws.fadeTime=0.2;
~ws={
  var mod = Duty.kr(4,0,Dseq([1,2,1.5,1.25],inf));
  //         |       |       |       |       |  
  var pat = [1,0,0,0,1,0,0,0,1,0,0,0,1,0,0,0].rotate(1);
  var imp = PulseDivider.kr(~tick.kr,1,~counter.kr);
  var hit = Select.kr(PulseCount.kr(imp)%pat.size,pat);
  var env = EnvGen.ar(Env([0.001,1,0.0001],[0.002,1.5],[3,-3],curve:'exp'),imp * hit);
  var sig = [
 // SinOsc.ar(50,SinOsc.ar(50)),
  LFNoise2.ar(15000/mod),
  Pulse.ar(4),
  SinOsc.ar(1200/mod,mul:0.2),
  //WhiteNoise.ar(1),
  SinOsc.ar(75/mod,SinOsc.ar(4)*pi),
  ];
  sig = Select.ar(PulseCount.kr(imp*hit)%sig.size,sig);
  //sig = sig * env;
  Splay.ar(sig,0.75,0.25,SinOsc.ar(4));
};
~ws.play;
);
~ws.stop(4);
~ws.clear;
~ws.pause;
~ws.resume;

// ff filter ///////////////////////////////////////

(
~ff.quant=1;
~ff.fadeTime=1;
~ff={
  var high,mid,low;
  var sig = ~one.ar + ~kick.ar;

  sig = Resonz.ar(sig,LFNoise2.kr(1/4!2).range(100,10000),LFNoise2.kr(1/4!2).range(0.1,1))/4;
  sig = CompanderD.ar(sig,3/4,1/3,1/2);
  sig = CombN.ar(sig,4,[4,8,16],32)+sig;
  sig = GVerb.ar(LPF.ar(sig,7000)+HPF.ar(sig,300),100,[3,4],spread:[95,96])/4 + sig;
  low = CompanderD.ar(LPF.ar(sig,LFNoise2.kr(1/2!2).range(100,800)),3/4,1/2,1/2);
  mid = CompanderD.ar(BPF.ar(sig,LFNoise2.kr(1/2!2).range(700,1500),2),3/4,1/2,1/2);
  high = CompanderD.ar(HPF.ar(sig,LFNoise2.kr(1/2!2).range(1000,10000)),3/4,1/2,1/2);
  sig = CompanderD.ar((high+mid+low).flat,3/4,1/1.1,1/1.1);
  Splay.ar(sig,0.75,0.1);
};
~ff.play;
);
~ff.stop(7);
~ff.clear;


// one synth ///////////////////////////////////////

(
~one.ar(2);
~one.quant=2;
~one.fadeTime=4.2;
~one={
  //var mod
  //         |       |       |       |       |  
  var pat = [1,0,0,0,1,0,0,0,1,0,0,0,1,0,0,0].rotate(1);
  var imp = PulseDivider.kr(~tick.kr,2,~counter.kr);
  var hit = Select.kr(PulseCount.kr(imp)%pat.size,pat);
  var env = EnvGen.ar(Env([0.001,1,0.0001],[1.012,2.5],[3,-3],curve:'exp'),imp * hit);
  var sig = Dust.ar(LFSaw.ar(1/4).exprange(0.001,16000));
  sig = SinOsc.ar(50,SinOsc.ar(4)*pi) * sig;
  sig = sig * env;
  Splay.ar(sig,0.75,0.35,SinOsc.ar(4)*pi);
};
~one.play;
);
~one.stop(4);
~one.clear;
~one.pause;
~one.resume;

// two synth ///////////////////////////////////////

(
~two.ar(2);
~two.quant=2;
~two.fadeTime=0.2;
~two={
  //         |       |       |       |       |  
  var pat = [1,0,0,0,1,0,0,0,1,0,0,0,1,0,0,0].rotate(1);
  var imp = PulseDivider.kr(~tick.kr,[1,2,3,4],~counter.kr);
  var hit = Select.kr(PulseCount.kr(imp)%pat.size,pat);
  var env = EnvGen.ar(Env([0.001,1,0.0001],[0.002,1.5],[3,-3],curve:'exp'),imp * hit);
  var sig = LFNoise2.ar(1000);
  sig = sig * env;
  Splay.ar(sig,0.75,0.5);
};
~two.play;
);
~two.stop(4);
~two.clear;
~two.pause;
~two.resume;

