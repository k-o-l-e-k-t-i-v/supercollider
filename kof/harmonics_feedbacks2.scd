


(
  p.clock.tempo_(120/60);
  
  ~offset = {(0..7)/8};
  
  ~tick.quant = 1;
  ~tick = {Mix(Impulse.kr( ~tempo / 2 , ~offset ))};
  
  ~counter = {PulseCount.kr(~tick.kr)};
);


// little synth ///////////////////////////////////////

(
~little.ar(2);
~little.quant=2;
~little.fadeTime=8;
~little={
  var high,mid,low;
  var mm = TChoose.kr(Impulse.kr(1/8/[1,2,3,4]),[1,1.5,1.33333,2,1.125,4]);
  var f = TChoose.kr(Impulse.kr(1/4/[1,2,3,4]),432/4/[1,1.5,1.333,2,4,8]);
  var sig = BrownNoise.ar(0.51!2) * (Pulse.ar(4/[1,2,4,8],mul:0.5)**LFNoise2.kr(1/4!4).range(0.2,10)) + LocalIn.ar(2);
  f = f / TChoose.kr(Impulse.kr(1/4/[1,2,3,4]),[1,1.333,1.5,2,4]/mm);
  sig = CombN.ar(sig,1/f,1/f,32) * LFTri.ar(1/4/[1,2,3,4]) + sig;
  sig = Normalizer.ar(sig)/1.5 * Pulse.ar(4/[1,2,3,4]);

  //f = f + TChoose.kr(Impulse.kr(1/8!3),[0,1,2,3,4]).octcps;
  low = CompanderD.ar(RLPF.ar(sig,LFNoise2.kr(1/8!4).range(100,1800),0.2),3/4,1/3,1/2);
  mid = CompanderD.ar(BPF.ar(sig,LFNoise2.kr(1/8!4).range(700,15000),0.2),3/4,1/2.5,1/2);
  high = CompanderD.ar(RHPF.ar(sig,LFNoise2.kr(1/8!4).range(1000,15000),0.2),3/4,1/2,1/2);
  sig = CompanderD.ar((high+mid+low).flat,3/4,1/2,1/2,0.002,0.3);
  //sig = sig.distort ** 0.2;
  sig = GVerb.ar(sig,90,4)/4+sig;
  //sig = PitchShift.ar(sig,1/f,0.995);

  LocalOut.ar(sig);
  
  Splay.ar(sig,0.85,0.75);
};
~little.play;
);
~little.stop(4);
~little.clear;
~little.pause;
~little.resume;

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
  sig = CombN.ar(sig,1/4,1/[4,8,16],32)+sig;
  //sig = GVerb.ar(LPF.ar(sig,7000)+HPF.ar(sig,300),100,[3,4],spread:[95,96])/4 + sig;
  low = CompanderD.ar(LPF.ar(sig,LFNoise2.kr(1/2!2).range(100,800)),3/4,1/2,1/2);
  mid = CompanderD.ar(BPF.ar(sig,LFNoise2.kr(1/2!2).range(700,1500),2),3/4,1/2,1/2);
  high = CompanderD.ar(HPF.ar(sig,LFNoise2.kr(1/2!2).range(1000,10000)),3/4,1/2,1/2);
  sig = CompanderD.ar((high+mid+low).flat,3/4,1/2,1/2,0.002,0.3);
  sig = LPF.ar(DWGReverb.ar(NumChannels.ar(sig,2),4000),2000);
  Splay.ar(sig,0.75,0.25);
};
~ff.play;
);
~ff.stop(7);
~ff.clear;
