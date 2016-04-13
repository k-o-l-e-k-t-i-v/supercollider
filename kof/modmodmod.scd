



(
  p.clock.tempo_(240/60);
  
  ~offset = (0..7)/8;
  
  ~tick.quant = 1;
  ~tick = {Mix(Impulse.kr( ~tempo / 2 , ~offset ))};
  
  ~counter = {PulseCount.kr(~tick.kr)};
);



// one synth ///////////////////////////////////////

(
~one.ar(2);
~one.quant=2;
~one.fadeTime=0.2;
~one={
  var mod = Duty.kr(4,0,Dseq([1,2,1.5,1.25],inf));
  //         |       |       |       |       |  
  var pat = [1,0,1,0,1,0,1,0,1,0,1,0,1,0,1,0].rotate(1);
  var imp = PulseDivider.kr(~tick.kr,[1,2,3,4],~counter.kr);
  var hit = Select.kr(PulseCount.kr(imp)%pat.size,pat);
  var env = EnvGen.ar(Env([0.001,1,0.0001],[0.002,1.5],[3,-3],curve:'exp'),imp * hit);
  var sig = SinOsc.ar(50+(env+LFNoise2.ar(1/10!4,mul:env**20)**10*100));
  sig = sig * env;
  sig = CombN.ar(sig,1/100,mod/[10,20,40,80]+LFNoise2.kr(1/4!4).range(0.0001,0.02),0.8)/2+sig;
  sig = AllpassN.ar(sig,1/4,1/4,3)+sig+LFNoise2.ar(14000,mul:env**20);
  sig = LeakDC.ar(sig);
  sig = RLPF.ar(sig,50+LFNoise2.kr(1/8!4).range(0,4000),LFNoise2.kr(1/4!4).range(0.01,0.5))+sig;
  sig = CompanderD.ar(sig.distort,3/4,1/4,1/2).tanh;
  Splay.ar(sig,0.525,0.95,SinOsc.ar(2.01));
};
~one.play;
);
~one.stop(4);
~one.clear;
~one.pause;
~one.resume;
