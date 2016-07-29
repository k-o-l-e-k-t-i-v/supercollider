



// sinus synth ///////////////////////////////////////

(
~sinus.ar(2);
~sinus.quant=2;
~sinus.fadeTime=4;
~sinus={
  var mod,t,sig;
  mod = Duty.kr(4,0,Dseq([1,2,3,4].reciprocal+1,inf)).lag(1);
  
  t = LFTri.ar([50/mod,1/4,1/3200]).distort;
  t = CombN.ar(t,1/50,1/50*mod,32).distort * LFSaw.ar(1/32,mul:3200);
  sig = Perlin3.ar(t[0],t[1],t[2]) * (LFTri.ar(8/[1,2,3,4]) ** 1.2);
  sig = LPF.ar(sig,3900);
  sig = Resonz.ar(sig,[200,400,800,1600],0.2) * Pulse.ar(4/[1,2,3,4]);
  sig = CompanderD.ar(sig,3/4,1/3,1/2);
  sig = sig + (LFPulse.ar([8,4,9,13]) * LFPulse.ar([1,1/2,1/4,1/5]) * SinOsc.ar(7000*[1,1.5,2,3],mul:0.1));
  Splay.ar(sig,0.05,0.5);
};
~sinus.play;
);
~sinus.stop(4);
~sinus.clear;
~sinus.pause;
~sinus.resume;

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
  low = CompanderD.ar(LPF.ar(sig,LFNoise2.kr(1/2!2).range(100,800)),3/4,1/2,1/2);
  mid = CompanderD.ar(BPF.ar(sig,LFNoise2.kr(1/2!2).range(700,1500),2),3/4,1/2,1/2);
  high = CompanderD.ar(HPF.ar(sig,LFNoise2.kr(1/2!2).range(1000,10000)),3/4,1/2,1/2);
  sig = CompanderD.ar((high+mid+low).flat,3/4,1/2,1/2,0.002,0.3);
  sig = LPF.ar(DWGReverb.ar(NumChannels.ar(sig,2),4000),2000);
  Splay.ar(sig,0.75,0.15);
};
~ff.play;
);
~ff.stop(7);
~ff.clear;


(
  p.clock.tempo_(240/60);
  
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
  var imp = PulseDivider.kr(~tick.kr,2,~counter.kr);
  var hit = Select.kr(PulseCount.kr(imp)%pat.size,pat);
  var env = EnvGen.ar(Env([0.001,1,0.0001],[0.002,2.5],[3,-3],curve:'exp'),imp * hit);
  var sig = SinOsc.ar(50!2,env**40*8pi);
  sig = sig * env;
  Splay.ar(sig,0.75,0.5);
};
~kick.play;
);
~kick.stop(4);
~kick.clear;
~kick.pause;
~kick.resume;
