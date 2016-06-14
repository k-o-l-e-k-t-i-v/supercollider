
(
  p.clock.tempo_(90/60);
  
  ~offset = {(0..7)/8};
  
  ~tick.quant = 1;
  ~tick = {Mix(Impulse.kr( ~tempo / 2 , ~offset ))};
  
  ~counter = {PulseCount.kr(~tick.kr)};
);

// kick synth ///////////////////////////////////////

(
~kick.ar(2);
~kick.quant=2;
~kick.fadeTime=0.2;
~kick={
  //         |       |       |       |       |  
  var pat = [1,0,0,0,1,0,0,0,1,0,0,0,1,0,0,0].rotate(1);
  var imp = PulseDivider.kr(~tick.kr,[1,2,3,4],~counter.kr);
  var hit = Select.kr(PulseCount.kr(imp)%pat.size,pat);
  var env = EnvGen.ar(Env([0.001,1,0.0001],[0.002,3.5],[3,-3],curve:'exp'),imp * hit);
  var sig = SinOsc.ar(50!2,env**40*8pi) + SinOsc.ar(500,mul:0.1);
  sig = sig * env;
  Splay.ar(sig,0.05,0.25);
};
~kick.play;
);
~kick.stop(4);
~kick.clear;
~kick.pause;
~kick.resume;

// kick2 synth ///////////////////////////////////////

(
~kick2.ar(2);
~kick2.quant=2;
~kick2.fadeTime=0.2;
~kick2={
  //         |       |       |       |       |  
  var pat = [1,0,0,0,1,0,0,0,1,0,0,0,1,1,0,0].rotate(3);
  var mod = Duty.kr(4/~tempo,0,Dseq([1,2,1.5,1.25],inf));
  var imp = PulseDivider.kr(~tick.kr,[1,2,3,4],~counter.kr);
  var hit = Select.kr(PulseCount.kr(imp)%pat.size,pat);
  var env = EnvGen.ar(Env([0.001,1,0.0001],[0.005,3.5],[3,-3],curve:'exp'),imp * hit);
  var sig = SinOsc.ar(50!2,env**80*8pi);// + SinOsc.ar(150/mod/[1,2,1.5,1.333]+SinOsc.kr(4/[1,2,3,4],mul:2),mul:0.3);
  sig = sig * env;
  Splay.ar(sig,0.05,0.25);
};
~kick2.play;
);
~kick2.stop(4);
~kick2.clear;
~kick2.pause;
~kick2.resume;

// plu synth ///////////////////////////////////////

(
~plu.ar(2);
~plu.quant=2;
~plu.fadeTime=4;
~plu={
  var mod = Duty.kr(8/~tempo,0,Dseq([1,2,1.5,1.3333],inf)).lag(1/8);
  var sig = LFNoise1.ar(16000/16*(1..16),mul:1/(1..16));
  sig = Pluck.ar(sig,Impulse.ar(4/(1..16)*~tempo),0.02,LFNoise0.ar(1/8/(1..16)).range(0.001,0.018).round(1/500)/mod,4.02/(1..16),LFNoise2.kr(1/16/(1..16)));
  sig = CompanderD.ar(sig,3/4,1/2,1/2);
  sig = LeakDC.ar(sig);
  sig = NumChannels.ar(sig,2);
  Splay.ar(sig,0.5,0.15);
};
~plu.play;
~ff.rebuild;
);
~plu.stop(4);
~plu.clear;
~plu.pause;
~plu.resume;


// ff filter ///////////////////////////////////////

(
~ff.quant=1;
~ff.fadeTime=1;
~ff={
  var synths = p.playingProxies;
  var high,mid,low;
  var sig = [];
  synths.collect{|n| if(n!=\ff){sig=sig++p.[n.asSymbol];}};

  //sig = Resonz.ar(sig,MouseX.kr(100,10000,(1..8)),MouseY.kr(0.1,1,(1..4)/16))/4;
  //sig = CombN.ar(sig,4,[4,8,16],32)+sig;
  sig = GVerb.ar(LPF.ar(sig,4000)+HPF.ar(sig,300),100,[3,4],spread:[95,96])/2 + sig;
  low = CompanderD.ar(LPF.ar(sig,LFNoise2.kr(1/2!2).range(100,800)),3/4,1/2,1/2);
  mid = CompanderD.ar(BPF.ar(sig,LFNoise2.kr(1/2!2).range(700,1500),2),3/4,1/1.2,1/2);
  high = CompanderD.ar(HPF.ar(sig,LFNoise2.kr(1/2!2).range(1000,10000)),3/4,1/1.2,1/2);
  sig = CompanderD.ar((high+mid+low).flat,3/4,1/2,1/2,0.002,0.3);
  sig = LPF.ar(DWGReverb.ar(NumChannels.ar(sig,2),4000),1000);
  Splay.ar(sig,0.75,0.125);
};
~ff.play;
);
~ff.stop(7);
~ff.clear;
