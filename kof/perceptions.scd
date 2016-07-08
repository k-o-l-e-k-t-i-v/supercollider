
// one synth ///////////////////////////////////////

(
~one.ar(2);
~one.quant=2;
~one.fadeTime=32;
~one={
  var f,sig,slo;
  slo = 4;
  f = TChoose.kr(Impulse.ar(1/slo/(1..16)),[60,65,67,64,57,72,36].midicps)/[1,1.5];
  20.do{|n|
  f = f/{TChoose.kr(Impulse.kr(1/slo/n/(1..16)),[1,2,1.333333,1/2,1/1.333333,1.5,1/1.5])};
};
  sig = Formant.ar(f,f*4,LFTri.ar(1/slo/(1..16)).range(50,5000)) * (LFTri.ar(1/8/(1..16))**4);
  
  //sig = Pulse.ar(8/(1..16)) * sig;
  sig = Vibrato.ar(sig,[6,7,8,9],0.12) + (WhiteNoise.ar(0.01)*Pulse.ar(TChoose.kr(Impulse.ar(4/slo/(1..16)),[2,4,8,16,32,44,22,33])));
  sig = MoogFF.ar(sig,f*4,2.85);
  //sig = sig /2 + LPF.ar(sig,f+SinOsc.kr([1,2,3,4],mul:2pi),0.2);
  sig = CompanderD.ar(sig,3/4,1/2,1/2);
  Splay.ar(sig,0.85,0.75);
};
~one.play;
);
~one.stop(120);
~one.clear;
~one.pause;
~one.resume;

(
  p.clock.tempo_(240/60);
  
  ~offset = {(0..7)/8};
  
  ~tick.quant = 1;
  ~tick = {Mix(Impulse.kr( ~tempo / 2 , ~offset ))};
  
  ~counter = {PulseCount.kr(~tick.kr)};
);

// click synth ///////////////////////////////////////

(
~click.ar(60);
~click.quant=2;
~click.fadeTime=16.2;
~click={
  //         |       |       |       |       |  
  var pat = [1,0,0,0,1,0,0,0,1,0,0,0,1,0,0,0].rotate(1);
  var imp = PulseDivider.kr(~tick.kr,[4,5,6,7],~counter.kr);
  var hit = Select.kr(PulseCount.kr(imp)%pat.size,pat);
  var env = EnvGen.ar(Env([0.001,1,0.0001],[0.002,4.5],[3,-3],curve:'exp'),imp * hit);
  var sig = LFPulse.ar([4,5,6,7]);
  sig = HPF.ar(sig,8000);
  sig = sig * env;
  Splay.ar(sig,0.75,0.15);
};
~click.play;
);
~click.stop(60);
~click.clear;
~click.pause;
~click.resume;


// ff filter ///////////////////////////////////////

(
~ff.quant=1;
~ff.fadeTime=32;
~ff={
  var synths = p.playingProxies;
  var high,mid,low;
  var sig = [];
  synths.collect{|n| if(n!=\ff){sig=sig++p.[n.asSymbol];}};

  //sig = Resonz.ar(sig,MouseX.kr(100,10000,(1..8)),MouseY.kr(0.1,1,(1..4)/16))/4;
  //sig = CombN.ar(sig,4,[4,8,16],32)+sig;
  sig = GVerb.ar(LPF.ar(sig,7000)+HPF.ar(sig,300),100,[3,4],spread:[95,96])/4 + sig;
  low = CompanderD.ar(LPF.ar(sig,LFNoise2.kr(1/2!2).range(100,800)),3/4,1/3,1/2);
  mid = CompanderD.ar(BPF.ar(sig,LFNoise2.kr(1/2!2).range(700,1500),2),3/4,1/1.5,1/2);
  high = CompanderD.ar(HPF.ar(sig,LFNoise2.kr(1/2!2).range(1000,10000)),3/4,1/1.25,1/2);
  sig = CompanderD.ar((high+mid+low).flat,3/4,1/2,1/2,0.002,0.3);
  sig = LPF.ar(DWGReverb.ar(NumChannels.ar(sig,2),4000),2000);
  Splay.ar(sig,0.75,0.15/2);
};
~ff.play;
);
~ff.stop(60);
~ff.clear;
