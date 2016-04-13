
(
  p=ProxySpace.push(s.boot);
  p.makeTempoClock;
);

(
  p.clock.tempo_(98/60);

  ~offset = (0..7)/8;

  ~tick.quant = 1;
  ~tick = {Mix(Impulse.kr( ~tempo / 2 , ~offset ))};

  ~counter = {PulseCount.kr(~tick.kr)};
);



// kick synth ///////////////////////////////////////

(
  ~kick.ar(2);
  ~kick.quant=2;
  ~kick.fadeTime=0.2;
  ~kick={
    //         |       |       |       |       |  
    var pat = [1,0,0,0,0,0,0,0,1,0,1,0,0,0,0,0].rotate(1);
    var imp = PulseDivider.kr(~tick.kr,1,~counter.kr);
    var hit = Select.kr(PulseCount.kr(imp)%pat.size,pat);
    var env = EnvGen.ar(Env([0.001,1,0.0001],[0.002,2.5],[3,-3],curve:'exp'),imp * hit);
    var sig = SinOsc.ar(50!2+(env**20*100),SinOsc.kr(env.linexp(0,1,25,50)*pi));
    sig = sig * env;
    Splay.ar(sig,0.75,0.95);
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
    var pat = [0,0,0,0,1,0,0,0,0,0,0,0,1,0,1,0].rotate(1);
    var imp = PulseDivider.kr(~tick.kr,1,~counter.kr);
    var hit = Select.kr(PulseCount.kr(imp)%pat.size,pat);
    var env = EnvGen.ar(Env([0.001,1,0.0001],[0.002,2.15],[3,-3],curve:'exp'),imp * hit);
    var sig = WhiteNoise.ar(2!2);
    sig = sig * env * Pulse.ar(env.linexp(0,1,400,1));
    sig = Resonz.ar(sig,env.linexp(0,1,100,10000));
    sig = CompanderD.ar(sig,3/4,1/2,1/2);
    Splay.ar(sig,0.95,0.95,SinOsc.ar(4.1));
  };
  ~hh.play;
);
~hh.stop(4);
~hh.clear;
~hh.pause;
~hh.resume;


// voice synth ///////////////////////////////////////

(
  ~voice.ar(2);
  ~voice.quant=2;
  ~voice.fadeTime=4;
  ~voice={
    var sig = SinOsc.ar(432.0/[1,1.5,1.25,1.125],SinOsc.ar(43.201)*8pi,mul:SinOsc.ar(1/~tempo.kr/[1,2,3,4]).exprange(0.001,1));
    sig = sig * LFSaw.ar(432.01/[1,1.5,1.25,1.125]);
    sig = Resonz.ar(sig,SinOsc.ar(4/[1,2,3,4]).range(200,2000));
    sig = CompanderD.ar(sig,3/4,1/2,1/2);
    Splay.ar(sig,0.125,0.65);
  };
  ~voice.play;
);
~voice.stop(4);
~voice.clear;
~voice.pause;
~voice.resume;
