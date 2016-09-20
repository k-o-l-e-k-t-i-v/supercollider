




(
  p.clock.tempo_(140/60);
  
  ~offset = {(0..7)/8};
  
  ~tick.quant = 1;
  ~tick = {Mix(Impulse.kr( ~tempo / 2 , ~offset ))};
  
  ~counter = {PulseCount.kr(~tick.kr)};
);


// perl synth ///////////////////////////////////////

(
~perl.ar(2);
~perl.quant=2;
~perl.fadeTime=4;
~perl={
  var mod = Duty.kr(4,0,Dseq([1,2,1.5,1.33333],inf))  ;
  var sig = LFSaw.ar([1,1/4,500/mod]) ** 4 * 400;
  sig = Perlin3.ar(sig[0],sig[1],sig[2]) * (LFSaw.ar(1/4/[1,2,3,4])**2);
  Splay.ar(sig,0.75,0.5);
};
~perl.play;
~ff.rebuild;
);
~perl.stop(4);
~perl.clear;
~perl.pause;
~perl.resume;

// okok synth ///////////////////////////////////////

(
~okok.ar(2);
~okok.quant=2;
~okok.fadeTime=0.2;
~okok={
  var mod = Duty.kr([1,2,3,4]*4,0,Dseq([1,2,1.5,1.33333],inf))  ;
  //         |       |       |       |       |  
  var pat = [1,0,0,0,1,1,0,0,1,0,0,0,1,0,1,0].rotate(1);
  var imp = PulseDivider.kr(~tick.kr,1,~counter.kr % pat.size);
  var hit = Select.kr(PulseCount.kr(imp)%pat.size,pat);
  var env = EnvGen.ar(Env([0.001,1,0.0001],[0.00502,0.505],[3,-3],curve:'exp'),imp * hit);
  var sig = [
  LFSaw.ar(150!2/mod),
  LFSaw.ar(15000!2/mod),
  SinOsc.ar(5000!2/mod),
  LFSaw.ar(500!2),
  WhiteNoise.ar(0.4),
  Pulse.ar(4),
  LFNoise2.ar(14000),
  SinOsc.ar(2500/mod)
  ];
  sig = Select.ar(PulseCount.kr(imp*hit)%sig.size,sig);
  sig = sig * env;
  Splay.ar(sig,0.05,0.5);
};
~okok.play;
);
~okok.stop(4);
~okok.clear;
~okok.pause;
~okok.resume;

// one synth ///////////////////////////////////////

(
~one.ar(2);
~one.quant=2;
~one.fadeTime=0.2;
~one={
  //         |       |       |       |       |  
  var pat = [1,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0].rotate(1);
  var imp = PulseDivider.kr(~tick.kr,1,~counter.kr%pat.size);
  var hit = Select.kr(PulseCount.kr(imp)%pat.size,pat);
  var env = EnvGen.ar(Env([0.001,1,0.0001],[0.002,0.5],[3,-1],curve:'exp'),imp * hit);
  var sig = SinOsc.ar(50!2+(env**2*80),env**40*8pi);
  sig = sig * env;
  Splay.ar(sig,0.75,0.75);
};
~one.play;
);
~one.stop(4);
~one.clear;
~one.pause;
~one.resume;


// two synth ///////////////////////////////////////

(
~two.ar(2);
~two.quant=2;
~two.fadeTime=0.2;
~two={
  //         |       |       |       |       |  
  var pat = [
    0,0,0,0,1,0,0,0,0,0,0,0,1,0,0,0,
    0,0,0,0,1,0,0,0,0,0,0,0,1,0,0,0,
    0,0,0,0,1,0,0,0,0,0,0,0,1,1,0,0,
    0,0,0,0,1,0,0,0,0,0,0,0,1,0,1,0,
  ].rotate(1);
  var imp = PulseDivider.kr(~tick.kr,[1,2,3,4],~counter.kr%pat.size);
  var hit = Select.kr(PulseCount.kr(imp)%pat.size,pat);
  var env = EnvGen.ar(Env([0.001,1,0.0001],[0.002,0.5],[3,-3],curve:'exp'),imp * hit);
  var sig = SinOsc.ar(50!2+(env**20*40),env**40*8pi);
  sig = sig * env;
  Splay.ar(sig,0.005,0.95);
};
~two.play;
);
~two.stop(4);
~two.clear;
~two.pause;
~two.resume;


// switch synth ///////////////////////////////////////

(
~switch.ar(2);
~switch.quant=2;
~switch.fadeTime=0.2;
~switch={
  //         |       |       |       |       |  
  var pat = [0,0,1,0,0,0,1,1,0,0,1,0,0,0,1,0].rotate(1);
  var imp = PulseDivider.kr(~tick.kr,[1,2,3,4],~counter.kr%pat.size);
  var hit = Select.kr(PulseCount.kr(imp)%pat.size,pat);
  var env = EnvGen.ar(Env([0.001,1,0.0001],[0.002,0.5*[1,2,3,4]],[3,-3],curve:'exp'),imp * hit);
  var sig = WhiteNoise.ar(0.2!4) * Pulse.ar(100,50,25,10);
  sig = RHPF.ar(sig,[1000,2500,12500,15000],LFNoise2.kr(1/4!4).range(0.1,0.9));
  sig = sig * env;
  Splay.ar(sig,0.05,0.15);
};
~switch.play;
);
~switch.stop(4);
~switch.clear;
~switch.pause;
~switch.resume;




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
  sig = CombN.ar(sig*LFSaw.ar(1/4/[1,2,3,4]),1/50*[1,2,1.5,1.33333],1/50,16)+sig;
  //sig = GVerb.ar(LPF.ar(sig,7000)+HPF.ar(sig,300),100,[3,4],spread:[95,96])/4 + sig;
  low = CompanderD.ar(LPF.ar(sig,LFNoise2.kr(1/2!2).range(100,800)),3/4,1,1/2);
  mid = CompanderD.ar(BPF.ar(sig,LFNoise2.kr(1/2!2).range(700,1500),2),3/4,1,1/2);
  high = CompanderD.ar(HPF.ar(sig,LFNoise2.kr(1/2!2).range(1000,10000)),3/4,1,1/2);
  sig = CompanderD.ar((high+mid+low).flat,3/4,1,1/2,0.002,0.3);
  sig = LPF.ar(DWGReverb.ar(NumChannels.ar(sig,2),[4000,4010]),2000);
  Splay.ar(sig,0.5,0.15);
};
~ff.play;
);
~ff.stop(7);
~ff.clear;
