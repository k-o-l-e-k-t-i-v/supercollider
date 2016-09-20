

// armar synth ///////////////////////////////////////

(
~armar.ar(2);
~armar.quant=2;
~armar.fadeTime=0.1;
~armar={
  var p;
  var mmo = Duty.kr(4,0,Dseq([1,2,1.5,1.33333],inf));
  var sig = LFTri.ar([1/160/(1..10),1/160,70+((1..10)*[1,1.5,2,1.3333])]) + LFSaw.ar(1/(60+(1..10))) * (40/(1..10));
  
  
  p = Perlin3.ar(sig[0],sig[1],sig).sum/2;
  //p = p * SinOsc.ar(p.range(4,5));

  //sig = Select.ar(sig*p.size,p);
  sig = LeakDC.ar(p);
  sig = Normalizer.ar(sig);
  sig = LPF.ar(sig,14000);
  sig = HPF.ar(sig,15);
  sig = CompanderD.ar(sig,3/4,1,1/20);
  Splay.ar(sig,0.65,0.15);
};
~armar.play;
);
~armar.stop(4);
~armar.clear;
~armar.pause;
~armar.resume;



(
  p.clock.tempo_(120/60);
  
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
  var imp = PulseDivider.kr(~tick.kr,1,~counter.kr);
  var hit = Select.kr(PulseCount.kr(imp)%pat.size,pat);
  var env = EnvGen.ar(Env([0.001,1,0.0001],[0.002,1.5],[3,-3],curve:'exp'),imp * hit);
  var sig = SinOsc.ar(50!2,env**20*8pi);
  sig = sig * env;
  Splay.ar(sig,0.75,0.65);
};
~kick.play;
);
~kick.stop(4);
~kick.clear;
~kick.pause;
~kick.resume;




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
  //sig = GVerb.ar(LPF.ar(sig,7000)+HPF.ar(sig,300),100,[3,4],spread:[95,96])/4 + sig;
  low = CompanderD.ar(LPF.ar(sig,LFNoise2.kr(1/2!2).range(100,18000)),3/4,1,1/2);
  mid = CompanderD.ar(Resonz.ar(sig,LFNoise2.kr(1/2!2).range(700,15000),0.2),3/4,1,1/2);
  high = CompanderD.ar(HPF.ar(sig,LFNoise2.kr(1/2!2).range(100,18000)),3/4,1,1/2);
  sig = CompanderD.ar((high+mid+low).flat,3/4,1,1/2,0.002,0.3);
  sig = LPF.ar(DWGReverb.ar(NumChannels.ar(sig,2),[4000,4010]),2000);
  Splay.ar(sig,0.5,0.5);
};
~ff.play;
);
~ff.stop(7);
~ff.clear;
