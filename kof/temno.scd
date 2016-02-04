




(
  p.clock.tempo_(240/60);
  
  ~offset = (0..7)/8;
  
  ~tick.quant = 1;
  ~tick = {Mix(Impulse.kr( ~tempo / 2 , ~offset ))};
  
  ~counter = {PulseCount.kr(~tick.kr)};
);



// deep synth ///////////////////////////////////////

(
~deep.ar(2);
~deep.quant=2;
~deep.fadeTime=2.2;
~deep={
  var mod = Duty.kr(1/4,0,Dseq([1,2,1,1.5,1,4],inf));
  //         |       |       |       |       |  
  var pat = [
    1,0,1,0,1,0,0,0,1,0,0,0,1,0,0,0,
    1,0,0,0,1,0,1,0,1,0,0,0,1,0,0,0,
    1,0,0,0,1,0,0,0,1,0,1,0,1,0,0,0,
    1,0,0,0,1,0,0,0,1,0,0,0,1,1,1,1
  ].rotate(1);
  var imp = PulseDivider.kr(~tick.kr,[1,2,3,4],~counter.kr);
  var hit = Select.kr(PulseCount.kr(imp)%pat.size,pat);
  var env = EnvGen.ar(Env([0.001,1,0.0001],[0.002,1.5*[1,mod,1.1,2.2]],[30,-30],curve:'exp'),imp * hit);
  var sig = SinOsc.ar(60 + (env**[40,80,200,150]*10000),SinOsc.kr(60/[1,2,3,4]/mod)*2pi);
  sig = LPF.ar(sig,2800) ;
  sig = sig + (sig* Pulse.ar(1/16) / 4.0);
  sig = sig * env;
  sig = GVerb.ar(sig,100,40)/8+sig;
  Splay.ar(sig,0.005,0.85);
};
~deep.play;
);
~deep.stop(4);
~deep.clear;
~deep.pause;
~deep.resume;
