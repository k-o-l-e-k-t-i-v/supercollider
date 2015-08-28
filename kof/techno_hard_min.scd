
(
  p=ProxySpace.push(s.boot);
  p.makeTempoClock;
);


(
  p.clock.tempo_(110/60);

  ~offset = (0..7)/8;

  ~tick.quant = 1;
  ~tick = {Mix(Impulse.kr( ~tempo / 2 , ~offset ))};

  ~counter = {PulseCount.kr(~tick.kr)};
  ~time = {LFSaw.kr(~tempo/4).range(0,1)};
)


// aaa synth ///////////////////////////////////////

(
  ~aaa.quant=4;
  ~aaa.fadeTime=0.2;
  ~aaa={
    //         |       |       |       |       |  
    var pat = [1,0,0,0,1,0,0,0,1,0,0,0,1,0,0,0].rotate(1);
    var imp = PulseDivider.kr(~tick.kr,16*[1,2,3,4],~counter.kr);
    var hit = Select.kr(PulseCount.kr(imp)%pat.size,pat);
    var env = EnvGen.ar(Env([0.001,1,0.001],[4.002,4.5],[3,-3],curve:'exp'),imp * hit);
    var sig = LFSaw.ar(90*[1,2,4,8] + SinOsc.ar(DelayN.ar(env,1/(1..8)*~tempo)*45/2).range(-4,4)) + Crackle.ar(1.5);
    sig = RLPF.ar(sig,env*1200+50);
    sig = sig * env;
    Splay.ar(sig,0.75,0.5);
  };
  ~aaa.play;
);
~aaa.stop(7);
~aaa.clear;

// noise synth ///////////////////////////////////////

(
  ~noise.quant=4;
  ~noise.fadeTime=0.2;
  ~noise={
    //         |       |       |       |       |  
    var pat = [1,0,0,0,1,0,0,0,1,0,0,0,1,0,0,0].rotate(3);
    var imp = PulseDivider.kr(~tick.kr,16*[1,2,3,4],~counter.kr);
    var hit = Select.kr(PulseCount.kr(imp)%pat.size,pat);
    var env = EnvGen.ar(Env([0.001,1,0.001],[2.002,0.05],[3,-3],curve:'exp'),imp * hit);
    var sig = PinkNoise.ar(1!4);
    sig = RLPF.ar(sig,env**4*400+1000);
    sig = sig * env;
    Splay.ar(sig,0.75,0.95);
  };
  ~noise.play;
);
~noise.stop(7);
~noise.clear;


// kick synth ///////////////////////////////////////

(
  ~kick.quant=2;
  ~kick.fadeTime=0.2;
  ~kick={
    //         |       |       |       |       |  
    var pat = (
      [1,0,0,0,1,0,0,0,0,0,0,0,1,1,1,1]++
      [1,0,0,0,1,0,0,0,1,0,0,0,1,0,0,0]++
      [1,0,0,0,1,1,0,0,1,0,0,0,1,1,0,0]++
      [1,0,0,0,1,0,0,0,1,0,0,0,1,0,0,0]
    ).rotate(1);
    var imp = PulseDivider.kr(~tick.kr,1,~counter.kr);
    var hit = Select.kr(PulseCount.kr(imp)%pat.size,pat);
    var env = EnvGen.ar(Env([0.001,1,0.001],[0.002,1.5],[3,-3],curve:'exp'),imp * hit);
    var sig = SinOsc.ar(50+(env**4*40)) + LFSaw.ar(50+(env**10*800),mul:0.2) + BrownNoise.ar(env**3);
    sig = LPF.ar(sig,800);
    sig = sig * env;
    Splay.ar(sig,0.75,0.5);
  };
  ~kick.play;
);
~kick.stop(7);
~kick.clear;


// hh synth ///////////////////////////////////////

(
  ~hh.quant=2;
  ~hh.fadeTime=0.2;
  ~hh={
    //         |       |       |       |       |  
    var pat = [1,0,0,0,1,0,0,0,1,0,0,0,1,1,1,1].rotate(3);
    var imp = PulseDivider.kr(~tick.kr,2*fib(4),~counter.kr);
    var hit = Select.kr(PulseCount.kr(imp)%pat.size,pat);
    var env = EnvGen.ar(Env([0.001,1,0.001],[0.002+[0,0,1,2],0.09+[0,0,0,1]],[3,-3],curve:'exp'),imp * hit);
    var sig = WhiteNoise.ar(1);
    sig = Resonz.ar(sig,[8000,9000,10000,15000],LFNoise2.kr(~tempo/4!4).range(0.4,0.9));
    sig = LPF.ar(sig,[1000,10000,9000,8000]);
    sig = sig * env;
    Splay.ar(sig.flat,0.75,0.15);
  };
  ~hh.play;
);
~hh.stop(7);
~hh.clear;

// filt filter ///////////////////////////////////////

(
  ~filt.quant=1;
  ~filt.fadeTime=1;
  ~filt={
    var high,mid,low;
    var sig = ~aaa.ar + ~noise.ar + ~kick.ar + ~hh;

    sig = Limiter.ar(sig);
    sig = GVerb.ar(LPF.ar(sig,3500)+HPF.ar(sig,200),40,[3,4,5,6],spread:[40,90])/8 + sig;
    low = CompanderD.ar(LPF.ar(sig,600),3/4,1/2,1/2);
    mid = CompanderD.ar(BPF.ar(sig,800,2),3/4,1/2,1/2);
    high = CompanderD.ar(HPF.ar(sig,900),3/4,1/2,1/2);
    sig = CompanderD.ar((high+mid+low).flat,3/4,1/1.1,1/1.1);
    Splay.ar(sig,0.75,0.35);
  };
  ~filt.play;
);
~filt.stop(7);
~filt.clear;
