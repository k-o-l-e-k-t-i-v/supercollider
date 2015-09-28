

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



// ss synth ///////////////////////////////////////

(
~ss.ar(2);
~ss.quant=2;
~ss.fadeTime=0.2;
~ss={
  //         |       |       |       |       |  
  var pat = [1,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0].rotate(3);
  var imp = PulseDivider.kr(~tick.kr,8,~counter.kr);
  var hit = Select.kr(PulseCount.kr(imp)/[1,2,4,8]%pat.size,pat);
  var env = EnvGen.ar(Env([0.001,1,0.001],[1.2502,0.005],[1,-3],curve:'exp'),imp * hit);
  var sig = LFNoise2.ar(18000/([1,2,4,8]*pi)) ;
  //sig = LPF.ar(sig,800);
  sig = sig * env;
  Splay.ar(sig,0.15,0.5);
};
~ss.play;
);
~ss.stop(7);
~ss.clear;


// kick synth ///////////////////////////////////////

(
~kick.ar(2);
~kick.quant=2;
~kick.fadeTime=0.2;
~kick={
  //         |       |       |       |       |  
  var pat = [1,0,0,0,1,0,0,0,1,0,0,0,1,0,0,0].rotate(1);
  var imp = PulseDivider.kr(~tick.kr,2,~counter.kr);
  var hit = Select.kr(PulseCount.kr(imp)/[1,2,4,8]%pat.size,pat);
  var env = EnvGen.ar(Env([0.001,1,0.001],[0.002,2.5],[3,-3],curve:'exp'),imp * hit);
  var sig = SinOsc.ar(50+(env**50*1000/[1,2,4,8]));
  sig = sig * env;
  Splay.ar(sig,0.75,0.5);
};
~kick.play;
);
~kick.stop(7);
~kick.clear;


// high synth ///////////////////////////////////////

(
~high.ar(2);
~high.quant=2;
~high.fadeTime=0.2;
~high={
  //         |       |       |       |       |  
  var pat = [1,0,0,0,1,0,0,0,1,0,0,0,1,1,1,1].rotate(1);
  var imp = PulseDivider.kr(~tick.kr,64,~counter.kr);
  var hit = Select.kr(PulseCount.kr(imp)/[2,4,8,16]%pat.size,pat);
  var env = EnvGen.ar(Env([0.001,1,1,0.001],[0.005,0.15,0.001],[100,1,100],curve:'exp'),imp * hit);
  var sig = LFNoise2.ar(16000/[1,2,4,8]);
  sig = sig * env;
  Splay.ar(sig,0.75,0.5);
};
~high.play;
);
~high.stop(7);
~high.clear;


// ff filter ///////////////////////////////////////

(
~ff.quant=1;
~ff.fadeTime=1;
~ff={
  var high,mid,low;
  var sig = ~ss + ~kick + ~high;
  
  sig = GVerb.ar(LPF.ar(sig,16000)+HPF.ar(sig,250),200,[3,4,5,6]*8,spread:[90,95])/4 + sig;
  low = CompanderD.ar(LPF.ar(sig,LFNoise2.kr(1/4!2).range(100,400)),3/4,1/2,1/2);
  mid = CompanderD.ar(BPF.ar(sig,LFNoise2.kr(1/4!2).range(200,800),2),3/4,1/2,1/2);
  high = CompanderD.ar(HPF.ar(sig,LFNoise2.kr(1/4!2).range(1000,4000)),3/4,1/2,1/2);
  sig = CompanderD.ar((high+mid+low).flat,3/4,1/2,1/2);
  Splay.ar(sig,0.75,0.25);
};
~ff.play;
);
~ff.stop(7);
~ff.clear;
