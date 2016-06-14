

// utopia synth ///////////////////////////////////////

(
~utopia.ar(2);
~utopia.quant=2;
~utopia.fadeTime=0.2;
~utopia={
  //         |       |       |       |       |  
  var pat = [1,0,0,0,1,0,0,0,1,0,0,0,1,0,0,0].rotate(1);
  var imp = PulseDivider.kr(~tick.kr,1,~counter.kr);
  var hit = Select.kr(PulseCount.kr(imp)%pat.size,pat);
  var env = EnvGen.ar(Env([0.001,1,0.0001],[0.002,0.5],[3,-3],curve:'exp'),imp * hit);
  var sig = WhiteNoise.ar(0.1!4) * LFSaw.ar(1/4/[1,2,3,4]);
  //sig = sig * env;
  Splay.ar(sig,0.75,0.15);
};
~utopia.play;
);
~utopia.stop(4);
~utopia.clear;
~utopia.pause;
~utopia.resume;

// one synth ///////////////////////////////////////

(
~one.ar(2);
~one.quant=2;
~one.fadeTime=0.2;
~one={
  //         |       |       |       |       |  
  var pat = [1,0,0,0,1,0,0,0,1,0,0,0,1,0,0,0].rotate(1);
  var imp = PulseDivider.kr(~tick.kr,1,~counter.kr);
  var hit = Select.kr(PulseCount.kr(imp)%pat.size,pat);
  var env = EnvGen.ar(Env([0.001,1,0.0001],[0.002,0.5],[3,-3],curve:'exp'),imp * hit);
  var sig = SinOsc.ar(5000!2) * LFPulse.ar(8);
  //sig = sig * env;
  Splay.ar(sig,0.75,0.5);
};
~one.play;
);
~one.stop(4);
~one.clear;
~one.pause;
~one.resume;

// one filter ///////////////////////////////////////

(
~one.quant=1;
~one.fadeTime=1;
~one={
  var synths = p.playingProxies;
  var high,mid,low;
  var sig = [];
  synths.collect{|n| if(n!=\one){sig=sig++p.[n.asSymbol];}};

  //sig = Resonz.ar(sig,MouseX.kr(100,10000,(1..8)),MouseY.kr(0.1,1,(1..4)/16))/4;
  //sig = CombN.ar(sig,4,[4,8,16],32)+sig;
  //sig = GVerb.ar(LPF.ar(sig,7000)+HPF.ar(sig,300),100,[3,4],spread:[95,96])/4 + sig;
  low = CompanderD.ar(LPF.ar(sig,LFNoise2.kr(1/2!2).range(100,800)),3/4,1/2,1/2);
  mid = CompanderD.ar(BPF.ar(sig,LFNoise2.kr(1/2!2).range(700,1500),2),3/4,1/2,1/2);
  high = CompanderD.ar(HPF.ar(sig,LFNoise2.kr(1/2!2).range(1000,10000)),3/4,1/2,1/2);
  sig = CompanderD.ar((high+mid+low).flat,3/4,1/2,1/2,0.002,0.3);
  sig = LPF.ar(DWGReverb.ar(NumChannels.ar(sig,2),4000),2000)+sig;
  Splay.ar(sig,0.75,0.0025);
};
~one.play;
);
~one.stop(7);
~one.clear;




// one synth ///////////////////////////////////////

(
~one.ar(2);
~one.quant=2;
~one.fadeTime=5;
~one={
  var sig = SinOsc.ar([1,50.1,150/1.3333]) + LFSaw.ar(1/40/[1,2,3,4]) / 2 ** 4 * 2;
  sig = Perlin3.ar(sig[0],sig[1],sig[2]);
  Splay.ar(sig,0.5,0.125);
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
  var imp = PulseDivider.kr(~tick.kr,16,~counter.kr);
  var hit = Select.kr(PulseCount.kr(imp)%pat.size,pat);
  var env = EnvGen.ar(Env([0.001,1,0.0001],[0.002,4.5],[3,-3],curve:'exp'),imp * hit);
  var sig = SinOsc.ar(60!2,env**20*8pi);
  sig = sig * env;
  Splay.ar(sig,0.75,0.05);
};
~kick.play;
);
~kick.stop(4);
~kick.clear;
~kick.pause;
~kick.resume;


// two synth ///////////////////////////////////////

(
~two.ar(2);
~two.quant=2;
~two.fadeTime=4;
~two={
  var sig = LFNoise2.ar(LFSaw.ar(1/16).exprange(50.01,15000)) * Pulse.ar(1/4/[2,3,4,5]);
  Splay.ar(sig,0.5,0.025);
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
  synths.collect{|n| if(n!=\ff){sig=sig++p.[n.asSymbol];}};

  //sig = Resonz.ar(sig,MouseX.kr(100,10000,(1..8)),MouseY.kr(0.1,1,(1..4)/16))/4;
  //sig = CombN.ar(sig,4,[4,8,16],32)+sig;
  //sig = GVerb.ar(LPF.ar(sig,7000)+HPF.ar(sig,300),100,[3,4],spread:[95,96])/4 + sig;
  low = CompanderD.ar(LPF.ar(sig,LFNoise2.kr(1/2!2).range(100,800)),3/4,1/2,1/2);
  mid = CompanderD.ar(BPF.ar(sig,LFNoise2.kr(1/2!2).range(700,1500),2),3/4,1/2,1/2);
  high = CompanderD.ar(HPF.ar(sig,LFNoise2.kr(1/2!2).range(1000,10000)),3/4,1/2,1/2);
  sig = CompanderD.ar((high+mid+low).flat,3/4,1/2,1/2,0.002,0.3);
  sig = LPF.ar(DWGReverb.ar(NumChannels.ar(sig,2),4000),2000)+sig;
  Splay.ar(sig,0.75,0.15);
};
~ff.play;
);
~ff.stop(7);
~ff.clear;


~mover.quant=2;
~mover={LFSaw.ar(1/4)};


// switch synth ///////////////////////////////////////

(
~switch.ar(2);
~switch.quant=2;
~switch.fadeTime=0.2;
~switch={
  //         |       |       |       |       |  
  var pat = [1,0,0,0,1,0,0,0,1,0,0,0,1,0,0,0].rotate(1);
  var imp = PulseDivider.kr(~tick.kr,1,~counter.kr % pat.size);
  var hit = Select.kr(PulseCount.kr(imp)%pat.size,pat);
  var env = EnvGen.ar(Env([0.001,1,0.0001],[0.002,0.5],[3,-3],curve:'exp'),imp * hit);
  var sig = [
  SinOsc.ar(50),
  LFNoise2.ar(1400),
  LFNoise2.ar(14000),
  Pulse.ar(50),
];
  sig = SelectX.ar(~mover*sig.size,sig);
  sig = sig * env;
  Splay.ar(sig,0.75,0.005);
};
~switch.play;
);
~switch.stop(4);
~switch.clear;
~switch.pause;
~switch.resume;




