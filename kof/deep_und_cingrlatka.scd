

(
  p.clock.tempo_(120/60);
  
  ~offset = {(0..7)/8};
  
  ~tick.quant = 1;
  ~tick = {Mix(Impulse.kr( ~tempo / 2 , ~offset ))};
  
  ~counter = {PulseCount.kr(~tick.kr)};
);

// perlin synth ///////////////////////////////////////

(
~perlin.ar(2);
~perlin.quant=2;
~perlin.fadeTime=8.2;
~perlin={
  var mod = Duty.kr(4,0,Dseq([1,2,1.5,1.33333],inf)) ;
  var sig = LFSaw.ar([1/4/[1,2,3,4],1/4,50]) * 2;
  sig = Perlin3.ar(sig[0],sig[1],sig[2]);
  sig = Resonz.ar(sig,[500,50*mod,150,500/1.5],0.12);
  sig = Pulse.ar(4/[1,2,3,4]) * sig;
  //sig = AllpassN.ar(sig,1/50,1+BrownNoise.ar(0.00001),4);
  sig = CompanderD.ar(sig,3/4,1/2,1/2).distort;
  Splay.ar(sig,0.9,0.5);
};
~perlin.play;
);
~perlin.stop(4);
~perlin.clear;
~perlin.pause;
~perlin.resume;

// hkick synth ///////////////////////////////////////

(
~hkick.ar(2);
~hkick.quant=2;
~hkick.fadeTime=0.2;
~hkick={
  //         |       |       |       |       |  
  var pat = [1,0,0,0,1,1,0,0,1,0,0,0,1,0,1,0].rotate(3);
  var imp = PulseDivider.kr(~tick.kr,[1,2,3,4]*2,~counter.kr);
  var hit = Select.kr(PulseCount.kr(imp)%pat.size,pat);
  var env = EnvGen.ar(Env([0.001,1,0.0001],[0.002,1.25],[3,-3],curve:'exp'),imp * hit);
  var sig = SinOsc.ar(50!2,env**20*8pi);
  sig = sig * env;
  Splay.ar(sig,0.05,0.5);
};
~hkick.play;
);
~hkick.stop(4);
~hkick.clear;
~hkick.pause;
~hkick.resume;

// high synth ///////////////////////////////////////

(
~high.ar(2);
~high.quant=2;
~high.fadeTime=0.2;
~high={
  //         |       |       |       |       |  
  var pat = [1,0,1,0,1,0,1,0,1,0,1,0,1,0,1,0].rotate(1);
  var imp = PulseDivider.kr(~tick.kr,[1,2,3,4],~counter.kr);
  var hit = Select.kr(PulseCount.kr(imp)%pat.size,pat);
  var env = EnvGen.ar(Env([0.001,1,0.0001],[0.005,0.15],[3,-3],curve:'exp'),imp * hit);
  var sig = Crackle.ar([0.1,0.4,0.5,0.87]+(env**20));
  sig = sig * env;
  Splay.ar(sig,0.995,0.25);
};
~high.play;
);
~high.stop(4);
~high.clear;
~high.pause;
~high.resume;

// dd filter ///////////////////////////////////////

(
~dd.quant=1;
~dd.fadeTime=1;
~dd={
  var synths = p.playingProxies;
  var high,mid,low;
  var sig = [];
  var f = Duty.kr(4,0,Dseq(50/[1,2,1.5,1.333,1,1,2,4],inf)).lag(1);
  synths.collect{|n| if(n!=\dd){sig=sig++p.[n.asSymbol];}};

  //sig = Resonz.ar(sig,MouseX.kr(100,10000,(1..8)),MouseY.kr(0.1,1,(1..4)/16))/4;
  //sig = CombC.ar(sig,1/f,1/f,4)/5+sig;
  sig = GVerb.ar(LPF.ar(sig,7000)+HPF.ar(sig,300),100,[3,4],spread:[95,96])/20 + sig;
  low = CompanderD.ar(LPF.ar(sig,LFNoise2.kr(1/2!2).range(100,800)),3/4,1/2,1/2);
  mid = CompanderD.ar(BPF.ar(sig,LFNoise2.kr(1/2!2).range(700,1500),2),3/4,1/1.5,1/2);
  high = CompanderD.ar(HPF.ar(sig,LFNoise2.kr(1/2!2).range(1000,10000)),3/4,1/1,1/2);
  sig = CompanderD.ar((high+mid+low).flat,3/4,1/2,1/2,0.002,0.3);
  sig = LPF.ar(DWGReverb.ar(NumChannels.ar(sig,2),1000),1200);

  Splay.ar(sig,0.75,0.05);
};
~dd.play;
);
~dd.stop(7);
~dd.clear;
