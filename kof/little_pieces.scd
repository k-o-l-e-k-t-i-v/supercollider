
/*
-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-
|  Mon Jan  4 03:03:07 CET 2016 |
-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-
*/

(
  p.clock.tempo_(60/60);
  ~offset = (0..7)/8;
  ~tick.quant = 1;
  ~tick = {Mix(Impulse.kr( ~tempo / 2 , ~offset ))};
  ~counter = {PulseCount.kr(~tick.kr)};
);



// combinee synth ///////////////////////////////////////

(
  ~combinee.ar(2);
  ~combinee.quant=2;
  ~combinee.fadeTime=5.2;
  ~combinee={
    //         |       |       |       |       |  
    var mod = Duty.kr([4,3,2,1],0,Dseq([1,2,1.5,1.25],inf));
    var pat = [1,1,1,1,1,0,0,0,1,0,1,0,1,0,0,0].rotate(1);
    var imp = PulseDivider.kr(~tick.kr,[1,2,3,4],~counter.kr);
    var hit = Select.kr(PulseCount.kr(imp)%pat.size,pat);
    var env = EnvGen.ar(Env([0.001,1,0.0001],[0.002*[10,100,1,2000],0.15],[3,-3],curve:'exp'),imp * hit);
    var sig = [
      SinOsc.ar(50!2),
      SinOsc.ar(5000!2/mod,mul:0.1),
      SinOsc.ar(50!2*mod),
      LFNoise2.ar(400),
      SinOsc.ar(5000!2/mod/2,mul:0.1),
      SinOsc.ar(50!2),
      SinOsc.ar(5000!2*mod,mul:0.1),
      Dust.ar(12000),
      SinOsc.ar(50!2*2/mod),
      SinOsc.ar(5000!2/mod/4,mul:0.1),
      SinOsc.ar(50!2),
    ];
    sig = PitchShift.ar(sig,0.1,1/(mod*(1..8)))+sig/2;
    sig = Select.ar(PulseCount.kr(imp*hit)%sig.size,sig);
    sig = Normalizer.ar(sig)*3/4;
    sig = sig * env;
    sig = CombN.ar(sig,1/4,LFSaw.ar(1/[4,1,40,400]).range(1/4,1/80),16)/16+sig/2;
    sig = GVerb.ar(sig,20,4)/2+sig;
    Splay.ar(sig,0.75,0.25,SinOsc.kr([1,2,3,4]));
  };
  ~combinee.play;
);
~combinee.stop(4);
~combinee.clear;
~combinee.pause;
~combinee.resume;
