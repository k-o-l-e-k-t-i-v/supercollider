

(
  p=ProxySpace.push(s.reboot,clock:TempoClock.default);
);

(
  ~tempo = 4;
  ~tempo.quant = 1;
  ~offset = (0..7)/8;
  
  ~tick.quant = 1;
  ~tick = {Mix(Impulse.kr( ~tempo / 2 , ~offset ))};
  
  ~counter = {PulseCount.kr(~tick.kr)};
  ~time = {LFSaw.kr(~tempo/4).range(0,1)};
)




// lll synth ///////////////////////////////////////

(
~lll.quant=1;
~lll.fadeTime=3.02;
~lll={
  //         |       |       |       |       |  
  var pat = [1,0,0,0,1,0,0,0,1,0,0,0,1,0,0,0];
    var imp = PulseDivider.kr(~tick.kr,fib(8)*4,~counter.kr);
  var hit = Select.kr(PulseCount.kr(imp)%pat.size,pat);
  var env = EnvGen.ar(Env([0.001,1,0.001],[3.002,0.25],[3,-3]),imp * hit);
    var sig = SinOsc.ar([60,64,67].midicps/1.5+ SinOsc.ar(11).range(-4,4));
  sig = sig * env;
    sig = CompanderD.ar(sig,3/4,1/3,1/2);
  Splay.ar(sig,0.75,0.75);
};
~lll.play;
    ~lll[20] = \filter -> {|i| GVerb.ar(i,40)/16+i};
);
~lll.stop(7);
~lll.clear;


// hh synth ///////////////////////////////////////

(
~hh.quant=1;
~hh.fadeTime=2.02;
~hh={
  //         |       |       |       |       |  
  var pat = [0,0,1,0,0,1,0,0,0,0,1,0,1,1,1,0];
  var imp = PulseDivider.kr(~tick.kr,fib(16),~counter.kr);
  var hit = Select.kr(PulseCount.kr(imp)%pat.size,pat);
  var env = EnvGen.ar(Env([0.001,1,0.001],[0.00402,0.025*(1..8)],[3,-6]),imp * hit);
  var sig = BPF.ar(WhiteNoise.ar(1),[200,400,1800,1200]+(env*10000));
  sig = sig * env;
  Splay.ar(sig,0.75,0.5);
};
~hh.play;
    ~lll[20] = \filter -> {|i| GVerb.ar(i,50)/16+i};
);
~hh.stop(7);
~hh.clear;

// kick synth ///////////////////////////////////////

(
~kick.quant=1;
~kick.fadeTime=0.02;
~kick={
  //         |       |       |       |       |  
  var pat = [1,0,0,0,1,0,0,0,1,0,0,0,1,1,1,0];
  var imp = PulseDivider.kr(~tick.kr,fib(4,1,2)*16,~counter.kr);
  var hit = Select.kr(PulseCount.kr(imp)%pat.size,pat);
    var env = EnvGen.ar(Env([0.001,1,0.001],[0.02,2.25*(1..4)],[3,-3]),imp * hit);
  var sig = SinOsc.ar(80+(env**80*[800,1600,3200,6000]));
  sig = sig * env;
  Splay.ar(sig,0.15,0.95);
};
~kick.play;
);
~kick.stop(7);
~kick.clear;
