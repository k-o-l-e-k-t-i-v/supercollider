


(
  p.clock.tempo_(120/60);
  
  ~offset = {(0..7)/8};
  
  ~tick.quant = 1;
  ~tick = {Mix(Impulse.kr( ~tempo / 2 , ~offset ))};
  
  ~counter = {PulseCount.kr(~tick.kr)};
);

(
  p=ProxySpace.push(s.boot);
  p.makeTempoClock;
);

// one synth ///////////////////////////////////////

(
~one.ar(2);
~one.quant=2;
~one.fadeTime=30.2;
~one={
  //         |       |       |       |       |  
  var pat = [1,0,0,0,1,0,0,0,1,0,0,0,1,0,0,0].rotate(1);
  var imp = PulseDivider.kr(~tick.kr,1,~counter.kr);
  var hit = Select.kr(PulseCount.kr(imp)%pat.size,pat);
  var env = EnvGen.ar(Env([0.001,1,0.0001],[0.002,0.5],[3,-3],curve:'exp'),imp * hit);
  var f = Duty.ar(1/48000*4,0,Dseq([500,50]/[1,2,1.5,1.333333],inf));
  var t = SinOsc.ar([48000/f/[1,3,5,7].nthPrime,1/1600,1/3200]).lag(1/48000*f).range(0,1) * [2,1,2] ** LFNoise2.kr(1/4/[1,2,3,4]).range(1.5,2.5);
  var sig = Perlin3.ar(t[0],t[1],t[2]) ** LFNoise2.kr(1/4/[1,2,3,4]).range(1.5,4);
  sig = LeakDC.ar(sig);
  sig = HPF.ar(sig,30);
  sig = CompanderD.ar(sig,3/4,1/2,1/2);
  //sig = sig * env;
  Splay.ar(sig,0.15,0.5);
};
~one.play;
~ff.rebuild;
);
~one.stop(40);
~one.clear;
~one.pause;
~one.resume;

(
~two.ar(2);
~two.quant=2;
~two.fadeTime=45.2;
~two={
  //         |       |       |       |       |  
  var pat = [1,0,0,0,1,0,0,0,1,0,0,0,1,0,0,0].rotate(1);
  var imp = PulseDivider.kr(~tick.kr,1,~counter.kr);
  var hit = Select.kr(PulseCount.kr(imp)%pat.size,pat);
  var env = EnvGen.ar(Env([0.001,1,0.0001],[0.002,0.5],[3,-3],curve:'exp'),imp * hit);
  var f = Duty.kr(1/48000*4,0,Dseq(150/[1,2,1.5,1.333333],inf));
  var t = LFTri.ar([48000/f/[1,3,5,7].nthPrime,1/1600,1/3200]).lag(1/48000*f) * [2,1,10] ** LFNoise2.kr(1/4/[1,2,3,4]).range(1.1,5);
  var sig = Perlin3.ar(t[0],t[1],t[2]) ** LFNoise2.kr(1/4/[1,2,3,4]).range(1.5,4);
  sig = LeakDC.ar(sig);
  sig = HPF.ar(sig,30);
  //sig = sig * env;
  Splay.ar(sig,0.25,0.15);
};
~two.play;
~ff.rebuild;
);
~two.stop(4);
~two.clear;
~two.pause;
~two.resume;


// ff filter ///////////////////////////////////////

(
~ff.quant=1;
~ff.fadeTime=15;
~ff={
  var synths = p.playingProxies;
  var high,mid,low;
  var sig = [];
  synths.collect{|n| if(n!=\ff){sig=sig++p.[n.asSymbol];}};

  //sig = Resonz.ar(sig,MouseX.kr(100,10000,(1..8)),MouseY.kr(0.1,1,(1..4)/16))/4;
  //sig = CombN.ar(sig,4,[4,8,16],32)+sig;
  //sig = GVerb.ar(LPF.ar(sig,7000)+HPF.ar(sig,300),100,[3,4],spread:[95,96])/4 + sig;
  low = CompanderD.ar(RLPF.ar(sig,LFNoise2.kr(1/2!2).range(100,800),0.2),3/4,1/2,1/2);
  mid = CompanderD.ar(BPF.ar(sig,LFNoise2.kr(1/2!2).range(700,1500),2),3/4,1/2,1/2);
  high = CompanderD.ar(RHPF.ar(sig,LFNoise2.kr(1/2!2).range(1000,10000),0.2),3/4,1/2,1/2);
  sig = CompanderD.ar((high+mid+low).flat,3/4,1/2,1/2,0.002,0.3);
  sig = LPF.ar(DWGReverb.ar(NumChannels.ar(sig,2),4000),2000);
  Splay.ar(sig,0.25,0.15);
};
~ff.play;
);
~ff.stop(70);
~ff.clear;
