

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

s.scope;

// ssnt synth ///////////////////////////////////////

(
~ssnt.quant=2;
~ssnt.fadeTime=0.2;
~ssnt={
  //         |       |       |       |       |  
  var pat = [1,0,0,0,1,1,0,0,1,0,0,0,1,1,0,0].rotate(1);
  var imp = PulseDivider.kr(~tick.kr,1,~counter.kr);
  var hit = Select.kr(PulseCount.kr(imp)%pat.size,pat);
  var mod = Select.kr(PulseCount.kr(hit)/12%4,[1,1.25,1.125,2]);
  var env = EnvGen.ar(Env([0.001,1,0.001],[0.002,1.5],[3,-3],curve:'exp'),imp * hit);
  var sig = SinOsc.ar(50+(env**40*100),SinOsc.ar(50+(env**10*10)*mod).range(-pi,pi));
  sig = sig * env;
  Splay.ar(sig,0.75,0.5);
};
~ssnt.play;
);
~ssnt.stop(7);
~ssnt.clear;



// kick synth ///////////////////////////////////////

(
~kick.quant=2;
~kick.fadeTime=0.2;
~kick={
  //         |       |       |       |       |  
  var pat = [1,0,0,0,1,0,0,0,1,0,0,0,1,0,0,0].rotate(1);
  var imp = PulseDivider.kr(~tick.kr,2,~counter.kr);
  var hit = Select.kr(PulseCount.kr(imp)%pat.size,pat);
  var env = EnvGen.ar(Env([0.001,1,0.001],[0.002,1.5],[1,-1],curve:'exp'),imp * hit);
  var sig = Mix.ar(SinOsc.ar(50+(env**(10..100)*100),mul:0.1));
  sig = sig * env;
  Splay.ar(sig,0.75,0.65);
};
~kick.play;
);
~kick.stop(7);
~kick.clear;


// crackle synth ///////////////////////////////////////

(
~crackle.quant=2;
~crackle.fadeTime=0.2;
~crackle={
  //         |       |       |       |       |  
  var pat = [1,0,0,0,1,0,0,0,1,0,0,0,1,1,1,1].rotate(3);
  var imp = PulseDivider.kr(~tick.kr,fib(4),~counter.kr);
  var hit = Select.kr(PulseCount.kr(imp)%pat.size,pat);
  var env = EnvGen.ar(Env([0.001,1,0.001],[0.002,0.25],[3,-3],curve:'exp'),imp * hit);
  var sig = Crackle.ar([0.2,0.3,0.4,0.5]+env);
  sig = sig * env;
  Splay.ar(sig,0.75,0.5);
};
~crackle.play;
);


// ff filter ///////////////////////////////////////

(
~ff.quant=1;
~ff.fadeTime=1;
~ff={
  var high,mid,low;
  var sig = ~ssnt + ~kick + ~crackle;
  
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
