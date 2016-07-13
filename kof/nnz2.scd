


(
  p.clock.tempo_(240/60);
  
  ~offset = {(0..7)/8};
  
  ~tick.quant = 1;
  ~tick = {Mix(Impulse.kr( ~tempo / 2 , ~offset ))};
  
  ~counter = {PulseCount.kr(~tick.kr)};
);


(
// one synth ///////////////////////////////////////

(
~one.ar(2);
~one.quant=2;
~one.fadeTime=0.002;
~one={
  //         |       |       |       |       |  
  var pat = [1,0,0,0,1,0,0,0,1,0,0,0,1,0,1,0].rotate(1);
  var imp = PulseDivider.kr(~tick.kr,[1,2,3,4],~counter.kr);
  var hit = Select.kr(PulseCount.kr(imp)%pat.size,pat);
  var env = EnvGen.ar(Env([0.001,1,0.0001],[0.002,4.5],[3,-3],curve:'exp'),imp * hit);
  var sig = SinOsc.ar(50!2,env**[10,20,2,4]*8pi);
  sig = sig * env;
  Splay.ar(sig,0.005,1);
};
~one.play;
);
//~one.stop(4);
//~one.clear;
//~one.pause;
//~one.resume;


// melody synth ///////////////////////////////////////

(
~melody.ar(2);
~melody.quant=2;
~melody.fadeTime=0.2;
~melody={
  //         |       |       |       |       |  
  var pat = [1,0,0,0,1,0,0,0,1,0,0,0,1,0,0,0].rotate(1);
  var imp = PulseDivider.kr(~tick.kr,[1,2,3,4],~counter.kr);
  var hit = Select.kr(PulseCount.kr(imp)%pat.size,pat);
  var env = EnvGen.ar(Env([0.001,1,0.0001],[0.002,0.195],[3,-3],curve:'exp'),imp * hit);
  var sig = SinOsc.ar(15000/[1,1.5,2,40]);
  sig = sig * env;
  Splay.ar(sig,0.75,0.45);
};
~melody.play;
);
)
~melody.stop(4);
~melody.clear;
~melody.pause;
~melody.resume;

// noise synth ///////////////////////////////////////

(
~noise.ar(2);
~noise.quant=2;
~noise.fadeTime=16.2;
~noise={
  //         |       |       |       |       |  
  var pat = [1,0,0,0,1,0,0,0,1,0,0,0,1,0,1,0].rotate(3);
  var imp = PulseDivider.kr(~tick.kr,[1,2,3,4],~counter.kr);
  var hit = Select.kr(PulseCount.kr(imp)%pat.size,pat);
  var env = EnvGen.ar(Env([0.001,1,0.0001],[0.002,0.55],[3,-3],curve:'exp'),imp * hit);
  var sig = LFNoise2.ar(17000/[1,2,4,10]) * (LFTri.ar(1/16/[1,2,3,4]) ** 4);
  //sig = sig * env;
  Splay.ar(sig,0.75,0.15);
};
~noise.play;
);
~noise.stop(4);
~noise.clear;
~noise.pause;
~noise.resume;



// onennn synth ///////////////////////////////////////

(
~onennn.ar(2);
~onennn.quant=2;
~onennn.fadeTime=4;
~onennn={
  var t = LFSaw.ar([1,2,50]) * 4;
  var sig = Perlin3.ar(t[0],t[1],t[2]);
  Splay.ar(sig,0.95,0.25);
};
~onennn.play;
);
~onennn.stop(4);
~onennn.clear;
~onennn.pause;
~onennn.resume;




// ff filter ///////////////////////////////////////

(
~ff.quant=1;
~ff.fadeTime=1;
~ff={
  var synths = p.playingProxies;
  var high,mid,low;
  var sig = [];
  var mod = Duty.kr(4,0,Dseq([1,2,1.5,1.333],inf));
  synths.collect{|n| if(n!=\ff){sig=sig++p.[n.asSymbol];}};

  //sig = Resonz.ar(sig,MouseX.kr(100,10000,(1..8)),MouseY.kr(0.1,1,(1..4)/16))/4;
  sig = CombN.ar(sig,1/50,1/50*mod,8)+sig;
  //sig = GVerb.ar(LPF.ar(sig,7000)+HPF.ar(sig,300),100,[3,4],spread:[95,96])/4 + sig;
  low = CompanderD.ar(RLPF.ar(sig,LFNoise2.kr(1/2!2).range(100,800)),3/4,1/2.5,1/2);
  mid = CompanderD.ar(BPF.ar(sig,LFNoise2.kr(1/2!2).range(700,1500),2),3/4,1/2,1/2);
  high = CompanderD.ar(RHPF.ar(sig,LFNoise2.kr(1/2!2).range(1000,10000)),3/4,1/2,1/2);
  sig = CompanderD.ar((high+mid+low).flat,3/4,1/2,1/2,0.002,0.3);
  sig = LPF.ar(DWGReverb.ar(NumChannels.ar(sig,2),4000),2000);
  Splay.ar(sig,0.75,0.35);
};
~ff.play;
);
~ff.stop(7);
~ff.clear;
