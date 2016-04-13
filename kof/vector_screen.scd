


// one synth ///////////////////////////////////////

(
~one.ar(2);
~one.quant=2;
~one.fadeTime=1;
~one={
  var mod = LFTri.ar(1/10/[1,2,3,4])**4*50;
  var sig = Perlin3.ar(LFTri.ar(1/100/(1..8)),LFTri.ar(1/50)*mod,LFTri.ar(1/400));
  sig = Pulse.ar(sig.range(48,52));
  sig = CombN.ar(sig,1/5,1/5,1)/2;
  sig = CompanderD.ar(sig,3/4,1/2,1/2);
  sig = DWGReverb.ar(sig,4000)/8+sig;
  //sig = BPF.ar(sig,LFNoise2.kr(1/40).range(50,1900),0.2);
  Splay.ar(sig,0.95,0.25);
};
~one.play;
);
~one.stop(4);
~one.clear;
~one.pause;
~one.resume;



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
~one.fadeTime=1;
~one={
  var sig = [] ++ Pulse.ar(50*4/1,LFNoise2.kr(1/2!2)) * 3.618 ++ Pulse.ar(50.1,LFNoise2.kr(1/4));
  //sig = sig + Pulse.ar(15001/[4,3],mul:0.1);
  Splay.ar(sig,1,0.25);
};
~one.play;
);
~one.stop(10);
~one.clear;
~one.pause;
~one.resume;


// one synth ///////////////////////////////////////

(
~one.ar(2);
~one.quant=2;
~one.fadeTime=0.2;
~one={
  //         |       |       |       |       |  
  var pat = [1,0,0,0,1,0,0,0,1,0,0,0,1,0,0,0].rotate(1);
  var imp = PulseDivider.kr(~tick.kr,1,~counter.kr % pat.size);
  var hit = Select.kr(PulseCount.kr(imp)%pat.size,pat);
  var env = EnvGen.ar(Env([0.001,1,0.0001],[0.002,2.5],[3,-3],curve:'exp'),imp * hit);
  var sig = [
  SinOsc.ar([40,50]),
  LFNoise0.ar(5000!2),
  SinOsc.ar([100,200]),
  Pulse.ar([4,50]),
  ];
  sig = Select.ar(PulseCount.kr(imp*hit)%sig.size,sig);
  sig = sig * env;
  Splay.ar(sig,0.75,0.5);
};
~one.play;
);
~one.stop(4);
~one.clear;
~one.pause;
~one.resume;
