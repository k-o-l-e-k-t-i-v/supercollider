
(
  p.clock.tempo_(128/60*4);
  
  ~offset = {(0..7)/8};
  
  ~tick.quant = 1;
  ~tick = {Mix(Impulse.kr( ~tempo / 2 , ~offset ))};
  
  ~counter = {PulseCount.kr(~tick.kr)};
);


// tesst synth ///////////////////////////////////////

(
~tesst.ar(2);
~tesst.quant=2;
~tesst.fadeTime=14.2;
~tesst={
  //         |       |       |       |       |  
  var pat = [1,0,0,0,1,0,0,0,1,0,0,0,1,0,1,0].rotate(1);
  var imp = PulseDivider.kr(~tick.kr,[1,2,3,4],~counter.kr % pat.size);
  var hit = Select.kr(PulseCount.kr(imp)%pat.size,pat);
  var env = EnvGen.ar(Env([0.001,1,0.0001],[0.002,0.05],[3,-3],curve:'exp'),imp * hit);
  var sig = [
  LFSaw.ar(50!2),
  SinOsc.ar(50!2),
  SinOsc.ar(1500 !2) * LFPulse.ar(4/[1,2,3,4]),
  LFNoise0.ar(1500!2),
  ];
  sig = Select.ar(PulseCount.kr(imp*hit)%sig.size,sig);
  //sig = sig * env;
  Splay.ar(sig,0.75,0.95);
};
~tesst.play;
);
~tesst.stop(4);
~tesst.clear;
~tesst.pause;
~tesst.resume;



// test synth ///////////////////////////////////////

(
~test.ar(2);
~test.quant=2;
~test.fadeTime=4;
~test={
  var sig = SinOsc.ar(5000!2) * Pulse.ar(~tempo.ar);
  Splay.ar(sig,0.5,0.95);
};
~test.play;
);
~test.stop(4);
~test.clear;
~test.pause;
~test.resume;


// ff filter ///////////////////////////////////////

(
~ff.quant=1;
~ff.fadeTime=8;
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
  Splay.ar(sig,0.75,0.55);
};
~ff.play;
);
~ff.stop(7);
~ff.clear;
