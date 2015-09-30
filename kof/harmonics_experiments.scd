
(
  p=ProxySpace.push(s.boot);
  p.makeTempoClock;
);

(
  p.clock.tempo_(60/60/4);
  
  ~offset = (0..7)/8;
  
  ~tick.quant = 1;
  ~tick = {Mix(Impulse.kr( ~tempo / 2 , ~offset ))};
  
  ~counter = {PulseCount.kr(~tick.kr)};
);

// ss synth ///////////////////////////////////////

(
~ss.ar(2);
~ss.quant=2;
~ss.fadeTime=4.2;
~ss={
  //         |       |       |       |       |  
  var pat = [1,0,0,0,1,0,0,0,1,0,0,0,1,1,1,1].rotate(1);
  var imp = PulseDivider.kr(~tick.kr,1,~counter.kr);
  var hit = Select.kr(PulseCount.kr(imp)/(1..16)%pat.size,pat);
  var env = EnvGen.ar(Env([0.001,1,0.001],[1.002,4.5],[3,-3],curve:'exp'),imp * hit);
  var sig = SinOsc.ar(432.0+((1..4)/1600)/(1+(1..80).reciprocal*[1,2,3,4].reciprocal*pi),mul:0.15/(1..4));
  sig = Normalizer.ar(sig);
  sig = sig * env;
  Splay.ar(sig,0.95,0.15);
};
~ss.play;
);
~ss.stop(7);
~ss.clear;


// ff filter ///////////////////////////////////////

(
~ff.quant=1;
~ff.fadeTime=1;
~ff={
  var high,mid,low;
  var sig = ~ss.ar;
  
  sig = GVerb.ar(LPF.ar(sig,500)+HPF.ar(sig,500),40,[3,4,5,6],spread:[40,90])/8 + sig;
  low = CompanderD.ar(LPF.ar(sig,LFNoise2.kr(1/4!2).range(30,300)),3/4,1/2,1/2);
  mid = CompanderD.ar(BPF.ar(sig,LFNoise2.kr(1/4!2).range(300,3000),2),3/4,1/2,1/2)+sig;
  high = CompanderD.ar(HPF.ar(sig,LFNoise2.kr(1/4!2).range(3000,16000)),3/4,1/2,1/2);
  sig = CompanderD.ar((high+mid+low).flat,3/4,1/1.1,1/1.1);
  Splay.ar(sig,0.95,0.25);
};
~ff.play;
);
~ff.stop(7);
~ff.clear;
