



(
  p.clock.tempo_(240/60*2);
  
  ~offset = (0..7)/8;
  
  ~tick.quant = 1;
  ~tick = {Mix(Impulse.kr( ~tempo / 2 , ~offset ))};
  
  ~counter = {PulseCount.kr(~tick.kr)};
);




// aggressive synth ///////////////////////////////////////

(
~aggressive.ar(2);
~aggressive.quant=2;
~aggressive.fadeTime=0.2;
~aggressive={
  //         |       |       |       |       |  
  var pat = [
    1,0,0,0,1,0,0,0,1,0,0,0,1,0,0,0,
    1,0,0,0,1,0,0,0,1,0,0,0,1,0,0,0,
    1,0,0,0,1,0,0,0,1,0,0,0,1,0,0,0,
    1,0,0,0,1,0,0,0,1,0,0,0,1,0,1,0,
    1,0,0,0,1,0,0,0,1,0,0,0,1,0,0,0,
    1,0,0,0,1,0,0,0,1,0,0,0,1,0,0,0,
    1,0,0,0,1,0,0,0,1,0,0,0,1,0,0,0,
    1,0,1,0,1,0,1,0,1,0,1,0,1,0,1,1,
  ].rotate(1);
  var mmm = Duty.kr(16*~tempo.kr,0,Dseq([1,2,1.5,1.33333]*2,inf));
  var base = Duty.kr(8*~tempo.kr,0,Dseq(43.2*[1,2,4,8]/(mmm),inf));
  var mod2 = Duty.kr(3*~tempo.kr,0,Dseq([1,4,2,1.5,2,1.33333],inf));
  var mod = Duty.kr(4*~tempo.kr,0,Dseq([1,4,2,1.5,8,1.33333]/mod2,inf));
  var imp = PulseDivider.kr(~tick.kr,fib(8),~counter.kr);
  var hit = Select.kr(PulseCount.kr(imp)%pat.size,pat);
  var env = EnvGen.ar(Env([0.001,1,0.0001],[0.0002,0.05*fib(8)*mod],[3,-3],curve:'exp'),imp * hit);
  var sig = SinOsc.ar(base/[1,2,4,8,1/2,1/4,1/8,1/16]/mod+SinOsc.kr(1/4/(1..8),mul:2pi),env**(LFNoise2.kr(1/16!8).range(5,10/mod)*(1..8))*8pi) + LFSaw.ar(base/mod,mul:0.1);
  sig = sig * env;
  //sig = CombN.ar(sig,1/50,1/50/mod,1/5) + (Resonz.ar(sig.distort/1.4**80,5000/[1,1.3333,2,4],0.02));
  //sig = sig ** 1.6;
  sig = CompanderD.ar(sig,0.6,1/4,1/120);

  Splay.ar(sig,0.5,0.5,SinOsc.ar(base/mod/16));
};
~aggressive.play;
);
~aggressive.stop(4);
~aggressive.clear;
~aggressive.pause;
~aggressive.resume;
