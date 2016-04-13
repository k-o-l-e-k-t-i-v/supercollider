


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
    //         |       |       |       |       |  
    var pat = [1,0,1,0].rotate(3);
    var mod = Duty.kr(4,0,Dseq([1,2,1.5,1.25,4,1.5,1.125,1.33333],inf));
    var imp = PulseDivider.kr(~tick.kr,1,~counter.kr);
    var hit = Select.kr(PulseCount.kr(imp)%pat.size,pat);
    var env = EnvGen.ar(Env([0.001,1,0.0001],[0.002,1.5],[3,-3],curve:'exp'),imp * hit);
    var sig = [
      SinOsc.ar(50!2),
      SinOsc.ar(500!2),
      SinOsc.ar(50!2),
      DC.ar(0),
      LFNoise2.ar(1500),
      Blip.ar(50!2),
      DC.ar(0),
      LFNoise1.ar(1500),
      LFSaw.ar(50*1.5!2),
      DC.ar(0),
      DC.ar(0),
      DC.ar(0),
      Dust.ar(1500),
      Pulse.ar(50!2),
    ]/4;
    sig = PitchShift.ar(sig,0.25/[1,2,1.5,4],mod*[1,1.5,1.25,2]);
    sig = CombN.ar(sig,1/4,1/4+LFNoise2.kr(1!16).exprange(1/20,1/40),4);
    sig = Select.ar(PulseCount.kr(imp*hit)%sig.size,sig);
     sig = sig * env;
    Splay.ar(sig,0.75,0.75);
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
  ~kick.fadeTime=0.2;
  ~kick={
    //         |       |       |       |       |  
    var pat = [1,0,1,0,1,0,1,0,1,0,1,0,1,0,1,1].rotate(1);
    var imp = PulseDivider.kr(~tick.kr,4,~counter.kr);
    var hit = Select.kr(PulseCount.kr(imp)%pat.size,pat);
    var env = EnvGen.ar(Env([0.001,1,0.0001],[0.002,1.5],[3,-3],curve:'exp'),imp * hit);
    var sig = SinOsc.ar(50+(env**10*100));
    sig = sig * env;
    Splay.ar(sig,0.75,0.45);
  };
  ~kick.play;
);
~kick.stop(4);
~kick.clear;
~kick.pause;
~kick.resume;


// hh synth ///////////////////////////////////////

(
  ~hh.ar(2);
  ~hh.quant=2;
  ~hh.fadeTime=0.2;
  ~hh={
    //         |       |       |       |       |  
    var pat = [1,0,0,0,1,0,0,0,1,0,0,0,1,0,0,0].rotate(3);
    var imp = PulseDivider.kr(~tick.kr,2,~counter.kr);
    var hit = Select.kr(PulseCount.kr(imp)%pat.size,pat);
    var env = EnvGen.ar(Env([0.001,1,0.0001],[0.002,0.15],[3,-3],curve:'exp'),imp * hit);
    var sig = Dust.ar(16000/[1,2,8,16]);
    sig = sig * env;
    Splay.ar(sig,0.75,0.5);
  };
  ~hh.play;
);
~hh.stop(4);
~hh.clear;
~hh.pause;
~hh.resume;
