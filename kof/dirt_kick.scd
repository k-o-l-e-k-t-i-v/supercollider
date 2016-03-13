


(
  p.clock.tempo_(120/60*2);

  ~offset = (0..7)/8;

  ~tick.quant = 1;
  ~tick = {Mix(Impulse.kr( ~tempo / 2 , ~offset ))};

  ~counter = {PulseCount.kr(~tick.kr)};
);


// kick synth ///////////////////////////////////////

(
  ~kick.ar(2);
  ~kick.quant=2;
  ~kick.fadeTime=4.2;
  ~kick={
    //         |       |       |       |       |  
    var pat = [
      1,0,0,0,1,0,0,0,1,0,0,0,1,0,1,0,
      1,0,0,0,1,0,0,0,1,0,0,0,1,0,0,0,
      1,0,0,0,1,0,0,0,1,0,0,0,1,1,0,0,
      1,0,0,0,1,0,0,0,1,0,0,0,1,0,0,0,
    ].rotate(1);
    var imp = PulseDivider.kr(~tick.kr,[1,2,3,4],~counter.kr);
    var hit = Select.kr(PulseCount.kr(imp)%pat.size,pat);
    var env = EnvGen.ar(Env([0.001,1,0.0001],[0.002,0.75*[1,2,3,4]],[3,-3],curve:'exp'),imp * hit);
    var sig = SinOsc.ar(50+(env**4*200),env**2*12pi*LFSaw.kr(4.1/[1,2,3,4]));
    sig = sig * SinOsc.ar(50.1/[1,2,3,4]) + LPF.ar(LFNoise2.ar(16000*(env**0.7)+50,mul:env**2),1000*[1,2,3,4]);
    sig = sig * env;
    sig = CompanderD.ar(sig,3/4,1/2,1/2);
    sig = NumChannels.ar(sig,2);
    sig = FreeVerb2.ar(sig[0],sig[1],0.45,0.5,0.5)+sig;
    Splay.ar(sig,0.5,0.85,SinOsc.kr(4));
  };
  ~kick.play;
);
~kick.stop(4);
~kick.clear;
~kick.pause;
~kick.resume;

FreeVerb2.help
