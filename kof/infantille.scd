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
  ~one.fadeTime=0.2;
  ~one={
    var mod2 = Duty.kr(1/50/~tempo*2,0,Dseq([1,2,1.5,1.25],inf)).lag(0.0025);
    var mod = Duty.kr(4/~tempo*2,0,Dseq([1,2,1.5,1.25,1,2,1.5,1.333333],inf));
    //         |       |       |       |       |  
    var pat = [1,0,0,0].rotate(3);
    var imp = PulseDivider.kr(~tick.kr,[1,2,3,4],~counter.kr);
    var hit = Select.kr(PulseCount.kr(imp)%pat.size,pat);
    var env = EnvGen.ar(Env([0.001,1,0.0001],[0.002,0.15*[1,2,4,8]],[3,-3],curve:'exp'),imp * hit);
    var sig = [
      Dust.ar(50!2),
      SinOsc.ar(1500/mod!2),
      SinOsc.ar(50!2*mod+(env**50*500)),
      LFSaw.ar(1500/mod!2),
      Pulse.ar(50!2*mod),
      LFNoise1.ar(15000/mod),
      Pulse.ar(4!2),
      SinOsc.ar(1500/1.5*mod),
      DC.ar(0),
      LFPulse.ar(250/mod)
    ];
    sig = Select.ar(PulseCount.kr(imp*hit)/[1,2,3,4]%sig.size,sig);
    sig = sig * env;
    sig = CombN.ar(sig,1/40,1/[20,1000,50,250]*mod2,4)/64+sig;
    sig = LPF.ar(sig,[8000,800,2000,200]) + sig;
    sig = CompanderD.ar(sig,3/4,1/2,1/2)/2;
    Splay.ar(sig,0.5,0.5,SinOsc.ar(1/4));
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
    var pat = [1,0,0,0,1,0,0,0,1,0,1,0,1,1,0,0].rotate(1);
    var imp = PulseDivider.kr(~tick.kr,[1,4],~counter.kr);
    var hit = Select.kr(PulseCount.kr(imp)%pat.size,pat);
    var env = EnvGen.ar(Env([0.001,1,0.0001],[0.002,1.5],[3,-3],curve:'exp'),imp * hit);
    var sig = SinOsc.ar(50!2+(env**[100,20]*1000));
    sig = sig * env;
    Splay.ar(sig,0.15,0.95);
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
    var pat = [1,0,0,0,1,0,0,0,1,0,0,0,1,1,0,0].rotate(3);
    var imp = PulseDivider.kr(~tick.kr,[2,8,16],~counter.kr);
    var hit = Select.kr(PulseCount.kr(imp)%pat.size,pat);
    var env = EnvGen.ar(Env([0.001,1,0.0001],[[0.002,1/2,1],0.15],[3,-3],curve:'exp'),imp * hit);
    var sig = [] ++ WhiteNoise.ar(1) ++ BrownNoise.ar(1) ++ LFNoise2.ar(4000);
    sig = sig * env;
    Splay.ar(sig,0.5,0.25,SinOsc.ar(1/4));
  };
  ~hh.play;
);
~hh.stop(4);
~hh.clear;
~hh.pause;
~hh.resume;
