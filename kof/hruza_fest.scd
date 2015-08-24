


(
  p=ProxySpace.push(s.reboot,clock:TempoClock.default);
);


(
  ~tempo = 2/3;
  ~tempo.quant = 1;
  ~offset = (0..7)/8;

  ~tick.quant = 1;
  ~tick = {Mix(Impulse.kr( ~tempo / 2 , ~offset ))};

  ~counter = {PulseCount.kr(~tick.kr)};
  ~time = {LFSaw.kr(~tempo/4).range(0,1)};
)


// kick synth ///////////////////////////////////////

(
  ~kick.quant=4;
  ~kick.fadeTime=3.02;
  ~kick={
    //         |       |       |       |       |  
    var pat = [1,0,0,0,1,0,0,0,1,0,0,0,1,0,0,0];
    var imp = PulseDivider.kr(~tick.kr,(1..8),~counter.kr);
    var hit = Select.kr(PulseCount.kr(imp)%pat.size,pat);
    var env = EnvGen.ar(Env([0.001,1,0.001],[[1.002,1.5],[0.5,1.5]],[3,-3]),imp * hit);
    var sig = SinOsc.ar(([55,[59,65,69].choose,62]).midicps*[2,0.5,0.5]*2/((_*2!8).reciprocal*4pi) + SinOsc.kr(1111/fib(8)).range(env* -40,env*40));
    sig = sig * env * LFNoise2.kr(1/4!8);
    sig = MoogFF.ar(sig,SinOsc.ar(1/8/fib(8)).range(100,10000),3.5);
    Splay.ar(sig.flat,0.75,0.95);
  };
  ~kick.play;
);
~kick.stop(7);
~kick.clear;

// hh synth ///////////////////////////////////////

(
  ~hh.quant=4;
  ~hh.fadeTime=0.02;
  ~hh={
    //         |       |       |       |       |  
    var pat = [1,0,1,0,0,0,1,0,0,0,1,0,0,0,1,0];
    var imp = PulseDivider.kr(~tick.kr,(1..8),~counter.kr);
    var hit = Select.kr(PulseCount.kr(imp)%pat.size,pat);
    var env = EnvGen.ar(Env([0.001,1,0.001],[0.002,0.05],[3,-3]),imp * hit);
    var sig = HPF.ar(WhiteNoise.ar(0.8),[4000,8000,1600,12000]);
    sig = sig * env;
    Splay.ar(sig,0.75,0.5);
  };
  ~hh.play;
);
~hh.stop(7);
~hh.clear;


// kickie synth ///////////////////////////////////////

(
  ~kickie.quant=4;
  ~kickie.fadeTime=0.02;
  ~kickie={
    //         |       |       |       |       |  
    var pat = [1,0,1,0,1,0,0,0,1,0,0,0,1,0,1,0];
    var imp = PulseDivider.kr(~tick.kr,[1,4],~counter.kr);
    var hit = Select.kr(PulseCount.kr(imp)%pat.size,pat);
    var env = EnvGen.ar(Env([0.001,1,0.001],[0.002,1.25],[3,-3]),imp * hit);
    var sig = SinOsc.ar(50!2+(env**40*400));
    sig = sig * env;
    Splay.ar(sig,0.75,0.5);
  };
  ~kickie.play;
);
~kickie.stop(7);
~kickie.clear;
