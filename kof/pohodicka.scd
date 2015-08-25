



(
  p=ProxySpace.push(s.boot);
  p.makeTempoClock;
);


(
  p.clock.tempo_(60/60);
  
  ~offset = (0..7)/8;
  
  ~tick.quant = 1;
  ~tick = {Mix(Impulse.kr( ~tempo / 2 , ~offset ))};
  
  ~counter = {PulseCount.kr(~tick.kr)};
  ~time = {LFSaw.kr(~tempo/4).range(0,1)};
)




(
// form synth ///////////////////////////////////////

(
~form.quant=2;
~form.fadeTime=4.2;
~form={
  //         |       |       |       |       |  
  var pat = [1,0,0,0,1,0,0,0,1,0,0,0,1,0,0,0];
  var imp = PulseDivider.kr(~tick.kr,fib(8).scramble,~counter.kr);
  var hit = Select.kr(PulseCount.kr(imp)%pat.size,pat);
  var env = EnvGen.ar(Env([0.001,1,0.001],[0.02,~tempo/4*(fib(8))],[3,-3],curve:'exp'),imp * hit);
  var notes = [60,64,67,71,74,77,81,84,88,91].midicps;
  var sig = Formant.ar(notes/pi,notes/2,LFNoise2.kr(~tempo/4!8).range(100,400));
  sig = sig * env;
  Splay.ar(sig.flat,0.75,0.25);
};
~form.play;
);


// form synth ///////////////////////////////////////

(
~form2.quant=2;
~form2.fadeTime=4.2;
~form2={
  //         |       |       |       |       |  
  var pat = [1,0,0,0,1,0,0,0,1,0,0,0,1,0,0,0];
  var imp = PulseDivider.kr(~tick.kr,fib(8).scramble*2,~counter.kr);
  var hit = Select.kr(PulseCount.kr(imp)%pat.size,pat);
  var env = EnvGen.ar(Env([0.001,1,0.001],[~tempo/fib(8),~tempo/2*(fib(8))],[3,-3],curve:'exp'),imp * hit);
  var notes = [60,64,67,71,74,77,81,84,88,91].midicps;
  var sig = Formant.ar(notes/2pi,notes/4,LFNoise2.kr(~tempo/4!8).range(100,400));
  sig = sig * env;
  Splay.ar(sig.flat,0.75,0.5);
};
~form2.play;
);

~refresh={loop{~form.rebuild; ~form2.rebuild; 16.wait;};}.fork;
)

// kick synth ///////////////////////////////////////

(
~kick.quant=2;
~kick.fadeTime=0.2;
~kick={
  //         |       |       |       |       |  
  var pat = [1,0,0,0,1,0,0,0,1,0,0,0,1,0,1,0];
  var imp = PulseDivider.kr(~tick.kr,1,~counter.kr);
  var hit = Select.kr(PulseCount.kr(imp)%pat.size,pat);
  var env = EnvGen.ar(Env([0.001,1,0.001],[0.002,0.5],[3,-3],curve:'exp'),imp * hit);
  var sig = SinOsc.ar(50+(env**5*50));
  sig = sig * env;
  Splay.ar(sig,0.75,0.5);
};
~kick.play;
);
~kick.stop(7);
~kick.clear;


// hh synth ///////////////////////////////////////

(
~hh.quant=2;
~hh.fadeTime=0.2;
~hh={
  //         |       |       |       |       |  
  var pat = [0,0,1,0,0,0,1,0,0,0,1,0,0,0,1,1];
  var imp = PulseDivider.kr(~tick.kr,1,~counter.kr);
  var hit = Select.kr(PulseCount.kr(imp)%pat.size,pat);
  var env = EnvGen.ar(Env([0.001,1,0.001],[0.002,0.15],[3,-3],curve:'exp'),imp * hit);
  var sig = Crackle.ar(2);
  sig = sig * env;
  Splay.ar(sig,0.75,0.5);
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
  var sig = ~form + ~form2 + ~kick + ~hh;
  
  sig = GVerb.ar(LPF.ar(sig,5000)+HPF.ar(sig,500),40,[3,4,5,6],spread:[4,90])/8 + sig;
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
