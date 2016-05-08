p.arProxyNames.collect{|n| var snth = (p[n.asSymbol]);if(true){snth.stop(60)}};
p.arProxyNames.collect{|n| var snth = (p[n.asSymbol]);snth.clear};

(
  p.clock.tempo_(120/60);
  
  ~offset = (0..7)/8;
  
  ~tick.quant = 1;
  ~tick = {Mix(Impulse.kr( ~tempo / 2 , ~offset ))};
  
  ~counter = {PulseCount.kr(~tick.kr)};
);

// one synth ///////////////////////////////////////

(
~one.ar(2);
~one.quant=2;
~one.fadeTime=12.2;
~one={
  //         |       |       |       |       |  
  var pat = [1,0,0,0,1,0,0,0,1,0,0,0,1,0,1,0].rotate(3);
  var imp = PulseDivider.kr(~tick.kr,[1,2,3,4]*16,~counter.kr % pat.size);
  var hit = Select.kr(PulseCount.kr(imp)%pat.size,pat);
  var env = EnvGen.ar(Env([0.001,1,0.0001],[0.002,4.75*[1,2,3,4]],[3,-3],curve:'exp'),imp * hit);
  var sig = [
  SinOsc.ar([50,51]),
  SinOsc.ar(1500!2/[1.33333,2,4,8]),
  LFSaw.ar(1000/[1,2,1.5,1.3333]),
  VarSaw.ar(150/[1,2,1.5,4/3]),
  SinOsc.ar(3000/[1.33333,2,4,8]),
  LFSaw.ar([50,100,75,125])**4,
  Dust.ar(4000),
  SinOsc.ar(50!2*1.25,env**80*8pi),
  LFPulse.ar([1,2,3,4]) * SinOsc.ar(15000/[1,2,1.3333,1.5])/2,
  BrownNoise.ar(0.5),
  SinOsc.ar(50!2*1.3333,env**30*8pi),
  SinOsc.ar(50!2*1.125,env**20*8pi),
  Formant.ar(50*[1,2,1.5,1.3333]+SinOsc.ar(1/[4,5,6,7],mul:pi),50,150);
  WhiteNoise.ar(env**4),
  SinOsc.ar(50!2/1.33333,env**80*8pi),
  ];
  
  sig = SelectX.ar(LFTri.ar(1/60/[1,2,3,4]).range(0,1)**2*sig.size,sig);
  sig = sig * (LFTri.ar(1/4/[1,2,3,4])**4) + (sig.tanh/2**LFNoise2.kr(1/4/[1,2,3,4]).range(1,80));
  sig = sig * env;
  sig = LeakDC.ar(sig);
  sig = AllpassN.ar(sig,1,2,4);
  sig = Limiter.ar(sig);
  sig = CompanderD.ar(sig,3/4,1/2,1/2);
  sig = LPF.ar(GVerb.ar(sig.softclip.softclip/8,100,5),3200)+sig;
  sig = CompanderD.ar(sig,3/4,1/2,1/2);
  Splay.ar(sig,0.05,0.095,SinOsc.kr(1.1/4/[1,2,3,4]));
};
~one.play;
);
~one.stop(4);
~one.clear;
~one.pause;
~one.resume;



// kick synth ///////////////////////////////////////

(
~kick.ar(2);
~kick.quant=2;
~kick.fadeTime=16.2;
~kick={
  //         |       |       |       |       |  
  var pat = [1,0,0,0,1,0,0,0,1,0,0,0,1,0,1,0].rotate(1);
  var imp = PulseDivider.kr(~tick.kr,16,~counter.kr);
  var hit = Select.kr(PulseCount.kr(imp)%pat.size,pat);
  var env = EnvGen.ar(Env([0.001,1,0.0001],[0.002,8.5],[3,-3],curve:'exp'),imp * hit);
  var sig = SinOsc.ar(50!2,env**LFNoise2.kr(1/8).range(10,40)*8pi);
  sig = sig * env;
  sig = CompanderD.ar(sig,3/4,1/2,1/2);
  Splay.ar(sig,0.05,0.65);
};
~kick.play;
);
~kick.stop(4);
~kick.clear;
~kick.pause;
~kick.resume;
