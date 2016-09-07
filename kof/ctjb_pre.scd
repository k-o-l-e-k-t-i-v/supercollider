


// one synth ///////////////////////////////////////

(
~one.ar(2);
~one.quant=2;
~one.fadeTime=4;
~one={
  var sig = Pulse.ar(4/[1,2,3,4]) * SinOsc.ar(50,Pulse.ar(2/[1,2,2,3]));
  Splay.ar(sig,0.5,0.5);
};
~one.play;
);
~one.stop(4);
~one.clear;
~one.pause;
~one.resume;

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
  var imp = PulseDivider.kr(~tick.kr,4,~counter.kr);
  var hit = Select.kr(PulseCount.kr(imp)%pat.size,pat);
  var env = EnvGen.ar(Env([0.001,1,0.0001],[0.002,2.5],[3,-3],curve:'exp'),imp * hit);
  var sig = SinOsc.ar(50!2,env**20**pi) + Pulse.ar(4);
  sig = sig * env;
  Splay.ar(sig,0.75,0.5);
};
~kick.play;
);
~kick.stop(4);
~kick.clear;
~kick.pause;
~kick.resume;


// low synth ///////////////////////////////////////

(
~low.ar(2);
~low.quant=2;
~low.fadeTime=4;
~low={
  var sig = LFSaw.ar([50,75,100,1500]) * LFTri.ar(1/8/[1,2,3,4]);
  Splay.ar(sig,0.5,0.05);
};
~low.play;
~ff.rebuild;
);
~low.stop(4);
~low.clear;
~low.pause;
~low.resume;

// two synth ///////////////////////////////////////

(
~two.ar(2);
~two.quant=2;
~two.fadeTime=4;
~two={
  var sig = PinkNoise.ar(0.2!4) * DelayN.ar(Pulse.ar(4/[1,2,3,4]),1/4,1/4);
   sig = sig + (LFSaw.ar(15000/[1,8,1.5,4],mul:0.15) * LFSaw.ar(4/[1,2,3,4]));
  Splay.ar(sig,0.5,0.25);
};
~two.play;
);
~two.stop(4);
~two.clear;
~two.pause;
~two.resume;


// ff filter ///////////////////////////////////////

(
~ff.quant=1;
~ff.fadeTime=1;
~ff={
  var synths = p.playingProxies;
  var high,mid,low;
  var sig = [];

  var mod2 = Duty.kr(16,0,Dseq([1,2,1.5,1.33333],inf));
  var mod = Duty.kr(4,0,Dseq([1,2,1.5,1.33333]*mod2,inf));
  synths.collect{|n| if(n!=\ff){sig=sig++p.[n.asSymbol];}};

  //sig = Resonz.ar(sig,MouseX.kr(100,10000,(1..8)),MouseY.kr(0.1,1,(1..4)/16))/4;
  sig = CombN.ar(sig,1/50*mod,1/50*mod,1/4)+sig;
  //sig = GVerb.ar(LPF.ar(sig,7000)+HPF.ar(sig,300),100,[3,4],spread:[95,96])/4 + sig;
  low = CompanderD.ar(LPF.ar(sig,LFNoise2.kr(1/2!2).range(100,800)),3/4,1,1/2);
  mid = CompanderD.ar(BPF.ar(sig,LFNoise2.kr(1/2!2).range(700,1500),2),3/4,1,1/2);
  high = CompanderD.ar(HPF.ar(sig,LFNoise2.kr(1/2!2).range(1000,10000)),3/4,1,1/2);
  sig = CompanderD.ar((high+mid+low).flat,3/4,1,1/2,0.002,0.3);
  sig = LPF.ar(DWGReverb.ar(NumChannels.ar(sig,2),[4000,4100]),2000);
  Splay.ar(sig,0.5,0.95);
};
~ff.play;
);
~ff.stop(7);
~ff.clear;


// oneen synth ///////////////////////////////////////

(
~oneen.ar(2);
~oneen.quant=2;
~oneen.fadeTime=4;
~oneen={
  var sig = SinOsc.ar(50!2);
  Splay.ar(sig,0.5,0.5);
};
~oneen.play;
);
~oneen.stop(4);
~oneen.clear;
~oneen.pause;
~oneen.resume;
