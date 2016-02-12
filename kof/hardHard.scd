

(
  p.clock.tempo_(240/60);
  
  ~offset = (0..7)/8;
  
  ~tick.quant = 1;
  ~tick = {Mix(Impulse.kr( ~tempo / 2 , ~offset ))};
  
  ~counter = {PulseCount.kr(~tick.kr)};
);


// one synth ///////////////////////////////////////

(
~onea.ar(2);
~onea.quant=2;
~onea.fadeTime=0.2;
~onea={
  //         |       |       |       |       |  
  var pat = [
    1,0,0,0,1,0,0,0,1,0,0,0,1,0,0,0,
    1,0,0,0,1,0,0,0,1,0,0,0,1,0,0,0,
    1,0,0,0,1,0,0,0,1,0,0,0,1,0,0,0,
    1,0,0,0,1,0,0,0,1,0,1,0,1,1,0,0,
  ].rotate(1);
  var imp = PulseDivider.kr(~tick.kr,1,~counter.kr);
  var imp2 = PulseDivider.kr(~tick.kr,[4,8,16,3],~counter.kr);
  var hit = Select.kr(PulseCount.kr(imp)%pat.size,pat);
  var hit2 = Select.kr(PulseCount.kr(imp2)%pat.size,pat);
  var env = EnvGen.ar(Env([0.001,1,0.0001],[0.002,2.5],[3,-3],curve:'exp'),imp * hit);
  var env2 = EnvGen.ar(Env([0.001,1,0.0001],[0.002,3.5],[3,-3],curve:'exp'),imp2 * hit2);
  var sig = SinOsc.ar(50!2 + (env**50*500));
  
  sig = LFSaw.ar(49+(env2**4*150))/2+sig;
  sig = LPF.ar(sig,900);
  
  sig = sig * env;
  
  sig = GVerb.ar(HPF.ar(sig,900),10,3)/4+sig;
  sig = GVerb.ar(LPF.ar(sig,900),100,10)/4+sig;
  sig = CompanderD.ar(sig,1/2,1/2,1/2);
  Splay.ar(sig,0.75,0.065);
};
~onea.play;
);
~onea.stop(4);
~onea.clear;
~onea.pause;
~onea.resume;
