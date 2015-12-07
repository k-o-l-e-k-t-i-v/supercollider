

(
  p=ProxySpace.push(s.reboot);
  p.makeTempoClock;
);

(
  p.clock.tempo_(120/60/2*1.5);

  ~offset = (0..7)/8;

  ~tick.quant = 1;
  ~tick = {Mix(Impulse.kr( ~tempo / 2 , ~offset ))};

  ~counter = {PulseCount.kr(~tick.kr)};
);


// aaa synth ///////////////////////////////////////

(
  ~aaa.ar(2);
  ~aaa.quant=2;
  ~aaa.fadeTime=0.2;
  ~aaa={
    //         |       |       |       |       |  
    var pat = [1,0,0,0,1,0,0,0,1,0,0,0,1,0,0,1].rotate(1);
    var imp = PulseDivider.kr(~tick.kr,4,~counter.kr);
    var hit = Select.kr(PulseCount.kr(imp)/fib(8)%pat.size,pat);
    var env = EnvGen.ar(Env([0.001,1,0.001],[0.02,1.5],[3,-3],curve:'exp'),imp * hit);
    var sig = SinOsc.ar(50+(env**50*([]++5000!3++500))) + LFNoise2.ar(1+(env**[1,2,3,4]*150*[1,2,8,4]),mul:0.2);
    sig = sig;
    sig = sig * env;
    Splay.ar(sig,0.75,0.95);
  };
  ~aaa.play;
);
~aaa.stop(4);
~aaa.clear;
~aaa.pause;
~aaa.resume;



// open synth ///////////////////////////////////////

(
  ~open.ar(2);
  ~open.quant=2;
  ~open.fadeTime=0.2;
  ~open={
    //         |       |       |       |       |  
    var pat = [1,0,1,0,1,0,1,0,1,0,1,0,1,1,1,1].rotate(3);
    var imp = PulseDivider.kr(~tick.kr,1,~counter.kr);
    var hit = Select.kr(PulseCount.kr(imp)/[1,2,3,4]%pat.size,pat);
    var env = EnvGen.ar(Env([0.001,1,0.001],[0.002,0.15],[3,-3],curve:'exp'),imp * hit);
    var sig = LFNoise2.ar({1000.rand(16000)}!4);
    sig = sig * env;
    Splay.ar(sig,0.75,0.5);
  };
  ~open.play;
);
~open.stop(4);
~open.clear;
~open.pause;
~open.resume;


// monster synth ///////////////////////////////////////

(
  ~monster.ar(2);
  ~monster.quant=2;
  ~monster.fadeTime=0.02;
  ~monster={
    var mod = Duty.kr(4,0,Dseq([1,2,1.5,1.25],inf));
    //         |       |       |       |       |  
    var pat = [1,0,0,1].rotate(3);
    var imp = PulseDivider.kr(~tick.kr,1,~counter.kr);
    var hit = Select.kr(PulseCount.kr(imp)/[1,2,3,4].scramble%pat.size,pat);
    var env = EnvGen.ar(Env([0.001,1,0.00001],[0.002,{0.rrand(100)/1000.0}!16],[3,-3],curve:'exp'),imp * hit);
    var sig = [
      SinOsc.ar(5000!2),
      SinOsc.ar(150!2),
      SinOsc.ar(5000!2),
      SinOsc.ar(15000*1.125!2),
      SinOsc.ar(1500/1.5!2),
      SinOsc.ar(5000/1.25!2) + LFNoise2.ar(16000),
      SinOsc.ar(500/1.5!2),
      SinOsc.ar(500/1.5!2),
      SinOsc.ar(15000/1.3333!2),
      SinOsc.ar(50/1.5!2),
      SinOsc.ar(15000/1.5!2),
      SinOsc.ar(5000*1.25!2) + LFNoise1.ar(400),
      SinOsc.ar(15000/1.25!2),
      SinOsc.ar(50/1.5!2),
      SinOsc.ar(50/1.334!2) + Pulse.ar(4),
      SinOsc.ar(500/1.5!2),
    ];
    sig = Select.ar(PulseCount.kr(imp*hit)%sig.size,sig);
    sig = sig * env;
    sig = sig * Pulse.ar(fib(16));
    sig = sig * ToggleFF.ar(LFPulse.ar(4/fib(8)));
    sig = sig + CombN.ar(sig,1/4,1/40/mod*[1,1.5,2,4],0.5);

    Splay.ar(sig,0.75,0.5);
  };
  ~monster.play;
);
~monster.stop(4);
~monster.clear;
~monster.pause;
~monster.resume;


// aa synth ///////////////////////////////////////

(
  ~aa.ar(2);
  ~aa.quant=2;
  ~aa.fadeTime=4;
  ~aa={
    var sig = SinOsc.ar(50!2*Duty.kr(4,0,Dseq([1,2,1.5,1.25],inf)).lag(1));
    Splay.ar(sig,0.5,0.25);
  };
  ~aa.play;
);
~aa.stop(4);
~aa.clear;
~aa.pause;
~aa.resume;


// bass synth ///////////////////////////////////////

(
  ~bass.ar(2);
  ~bass.quant=2;
  ~bass.fadeTime=4.2;
  ~bass={
    //         |       |       |       |       |  
    var pat = [1,0,0,0,1,0,0,0,1,0,0,0,1,0,0,0].rotate(3);
    var imp = PulseDivider.kr(~tick.kr,1,~counter.kr);
    var hit = Select.kr(PulseCount.kr(imp)/[1,2,3,4]%pat.size,pat);
    var env = EnvGen.ar(Env([0.001,1,0.001],[0.005,0.15],[3,-3],curve:'exp'),imp * hit);
    var sig = LFSaw.ar(1500/[1,1.5,1.33333,2]);
    sig = LPF.ar(sig,800)*2;
    sig = sig * env;
    Splay.ar(sig,0.75,0.25);
  };
  ~bass.play;
);
~bass.stop(4);
~bass.clear;
~bass.pause;
~bass.resume;
