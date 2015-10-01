


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


// sw synth ///////////////////////////////////////

(
~sw.ar(2);
~sw.quant=2;
~sw.fadeTime=0.2;
~sw={
  //         |       |       |       |       |  
  var pat = [1,0,0,0,1,0,0,0,1,0,0,0,1,0,0,0].rotate(3);
  var imp = PulseDivider.kr(~tick.kr,4,~counter.kr);
  var hit = Select.kr(PulseCount.kr(imp)/[1,2,4,8]%pat.size,pat);
  var env = EnvGen.ar(Env([0.001,1,1,0.001],[0.002,0.05*[1,2,3,4],0.002],[3,1,-3],curve:'exp'),imp * hit);
  var sig = [
    SinOsc.ar(432*2pi/(1+[1,2,4,7].reciprocal**2),mul:1/(1..4)),
    SinOsc.ar(16000!2) * Pulse.ar(4),
    SinOsc.ar(50,SinOsc.ar(50/4).range(-pi,pi)),
    LFNoise2.ar(15000!2)
  ];
  sig = Select.ar(PulseCount.kr(hit * imp)%sig.size,sig);

  sig = sig * env;
  Splay.ar(sig,0.75,0.5);
};
~sw.play;
);
~sw.stop(7);
~sw.clear;



// slow synth ///////////////////////////////////////

(
~slow2.ar(2);
~slow2.quant=2;
~slow2.fadeTime=0.2;
~slow2={
  //         |       |       |       |       |  
  var pat = [1,0,0,0,1,0,0,0,1,0,0,0,1,0,0,0].rotate(3);
  var imp = PulseDivider.kr(~tick.kr,64,~counter.kr);
  var hit = Select.kr(PulseCount.kr(imp)%pat.size,pat);
  var env = EnvGen.ar(Env([0.001,1,0.001],[2.002,2.5],[3,-3],curve:'exp'),imp * hit);
  var sig = Pulse.ar(4);
  sig = sig * env;
  Splay.ar(sig,0.75,0.5);
};
~slow2.play;
);
~slow.stop(7);
~slow.clear;

// slow synth ///////////////////////////////////////

(
~slow.ar(2);
~slow.quant=2;
~slow.fadeTime=0.2;
~slow={
  //         |       |       |       |       |  
  var pat = [1,0,0,0,1,0,0,0,1,0,0,0,1,0,0,0].rotate(1);
  var imp = PulseDivider.kr(~tick.kr,64,~counter.kr);
  var hit = Select.kr(PulseCount.kr(imp)%pat.size,pat);
  var env = EnvGen.ar(Env([0.001,1,0.001],[1.002,1.5],[3,-3],curve:'exp'),imp * hit);
  var sig = LFSaw.ar(50,0,SinOsc.ar(4).range(-pi,pi));
  sig = sig * env;
  Splay.ar(sig,0.75,0.5);
};
~slow.play;
);
~slow.stop(7);
~slow.clear;


// kick synth ///////////////////////////////////////

(
~kick.ar(2);
~kick.quant=2;
~kick.fadeTime=0.2;
~kick={
  //         |       |       |       |       |  
  var pat = [1,0,0,0,1,0,0,0,1,0,0,0,1,1,0,0].rotate(1);
  var imp = PulseDivider.kr(~tick.kr,2,~counter.kr);
  var hit = Select.kr(PulseCount.kr(imp)%pat.size,pat);
  var env = EnvGen.ar(Env([0.001,1,0.001],[0.002,2.5],[3,-3],curve:'exp'),imp * hit);
  var sig = SinOsc.ar(50+(env**50*500));
  sig = sig * env;
  Splay.ar(sig,0.75,0.5);
};
~kick.play;
);
~kick.stop(7);
~kick.clear;


// nn synth ///////////////////////////////////////

(
~nn.ar(2);
~nn.quant=2;
~nn.fadeTime=0.2;
~nn={
  //         |       |       |       |       |  
  var pat = [1,0,0,0,1,0,0,0,1,0,0,0,1,0,0,0].rotate(3);
  var imp = PulseDivider.kr(~tick.kr,4,~counter.kr);
  var hit = Select.kr(PulseCount.kr(imp)/[1,2,3,4]%pat.size,pat);
  var env = EnvGen.ar(Env([0.001,1,0.001],[0.002,0.15],[3,-3],curve:'exp'),imp * hit);
  var sig = LFNoise2.ar(5000*[1,2,4,8]);
  sig = sig * env;
  Splay.ar(sig,0.75,0.5);
};
~nn.play;
);
~nn.stop(7);
~nn.clear;

// ff filter ///////////////////////////////////////

(
~ff.quant=1;
~ff.fadeTime=1;
~ff={
  var high,mid,low;
  var sig = ~sw + ~nn + ~kick + ~slow + ~slow2;
  
  sig = GVerb.ar(LPF.ar(sig,5000)+HPF.ar(sig,500),100,[3,4,5,6],spread:[40,90])/32 + sig;
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
