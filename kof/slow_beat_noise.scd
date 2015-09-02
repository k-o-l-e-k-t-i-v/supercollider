

(
  p=ProxySpace.push(s.boot);
  p.makeTempoClock;
);


(
  p.clock.tempo_(60/60);

  ~offset = (0..7)/8;

  ~tick.quant = 1;
  ~tick = {Mix(Impulse.kr( ~tempo / 2 , ~offset ))};

  ~counter = {PulseCount.kr(~tick.kr)};
  ~time = {LFSaw.kr(~tempo/4).range(0,1)};
)

// inpo synth ///////////////////////////////////////

(
  ~inpo.quant=2;
  ~inpo.fadeTime=3.2;
  ~inpo={
    //         |       |       |       |       |  
    var pat = [1,0,0,0,1,0,0,0,1,0,0,0,1,0,0,0].rotate(1);
    var imp = PulseDivider.kr(~tick.kr,2*fib(8),~counter.kr);
    var hit = Select.kr(PulseCount.kr(imp)%pat.size,pat);
    var env = EnvGen.ar(Env([0.001,1,0.001],[4.002,0.75],[3,-3],curve:'exp'),imp * hit);
    var sig = Dust.ar(LFNoise2.kr(0.1!8).range(1.0001,1000.9));
    // sig = sig + SinOsc.ar(sig.range(50,1800)+(env**8+50));
    sig = Normalizer.ar(sig);
    sig = sig * env;
    sig = Formlet.ar(sig,[60,67,64,60].midicps*fib(8),0.001,0.002);
    sig = BBandPass.ar(sig,12000/16*(1..16),mul:LFNoise2.kr(1!16));
    sig = LPF.ar(sig,1000*(1..8))*2;
    sig = HPF.ar(sig,50);
    sig = GVerb.ar(sig,60,[3,4,5],spread:[40,60])/2+sig;
    sig = CompanderD.ar(sig,3/4,1/2,1/2);

    Splay.ar(sig.flat,0.75,0.5);
  };
  ~inpo.play;
);
~inpo.stop(7);
~inpo.clear;


// low synth ///////////////////////////////////////

(
  ~low.quant=2;
  ~low.fadeTime=0.2;
  ~low={
    //         |       |       |       |       |  
    var pat = [1,0,0,0,1,0,0,0,1,0,0,0,1,0,0,0].rotate(1);
    var imp = PulseDivider.kr(~tick.kr,8*fib(8),~counter.kr);
    var hit = Select.kr(PulseCount.kr(imp)%pat.size,pat);
    var env = EnvGen.ar(Env([0.001,1,0.001],[4.002,0.5],[3,-3],curve:'exp'),imp * hit);
    var sig = Pulse.ar(50) + SinOsc.ar(50+(env**5*50));
    sig = sig * env;
    sig = GVerb.ar(sig,60,[3,4,5],spread:[40,60])/2+sig;
    Splay.ar(sig.flat,0.75,0.5);
  };
  ~low.play;
);
~low.stop(7);
~low.clear;


// kick synth ///////////////////////////////////////

(
  ~kick.quant=2;
  ~kick.fadeTime=0.2;
  ~kick={
    //         |       |       |       |       |  
    var pat = [1,0,0,0,1,0,0,0,1,0,0,0,1,0,0,0].rotate(1);
    var imp = PulseDivider.kr(~tick.kr,4,~counter.kr);
    var hit = Select.kr(PulseCount.kr(imp)%pat.size,pat);
    var env = EnvGen.ar(Env([0.001,1,0.001],[0.002,4.5],[3,-3],curve:'exp'),imp * hit);
    var sig = SinOsc.ar(50 + (env**20*200));

    sig = sig * env;
    sig = CombN.ar(sig,1/4,~tempo/(env**8+1.1*10),1.5) + sig;
    sig = CompanderD.ar(sig,3/4,1/2,1/2);

    Splay.ar(sig,0.75,0.5);
  };
  ~kick.play;
);
~kick.stop(7);
~kick.clear;
