

(
  p.clock.tempo_(120/60);
  
  ~offset = (0..7)/8;
  
  ~tick.quant = 1;
  ~tick = {Mix(Impulse.kr( ~tempo / 2 , ~offset ))};
  
  ~counter = {PulseCount.kr(~tick.kr)};
);


// three synth ///////////////////////////////////////

(
~three.ar(2);
~three.quant=2;
~three.fadeTime=0.2;
~three={
  //         |       |       |       |       |  
  var pat = [1,0,0,0,1,0,1,0,1,0,0,0,1,0,1,0].rotate(3);
    var imp = PulseDivider.kr(~tick.kr,[2,3,4,5]/2,~counter.kr);
  var hit = Select.kr(PulseCount.kr(imp)%pat.size,pat);
  var env = EnvGen.ar(Env([0.001,1,0.0001],[0.002,0.5],[3,-3],curve:'exp'),imp * hit);
  var sig = [
  SinOsc.ar(1500!2),
  SinOsc.ar(500!2),
  SinOsc.ar(50!2),
  SinOsc.ar(15000!2,mul:0.2),
  ];:
  sig = Select.ar(PulseCount.kr(imp*hit)%sig.size,sig);
  sig = sig * env;
  Splay.ar(sig,0.75,~n3);
};
~three.play;
);
~three.stop(4);
~three.clear;
~three.pause;
~three.resume;
