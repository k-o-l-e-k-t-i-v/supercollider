


(
  p=ProxySpace.push(s.boot);
  p.makeTempoClock;
);

(
  p.clock.tempo_(8/3);
  ~offset = (0..7)/8;

  ~tick.quant = 1;
  ~tick = {Mix(Impulse.kr( ~tempo.kr / 2 , ~offset.kr ))};

  ~counter = {PulseCount.kr(~tick.kr)};
  ~time = {LFSaw.kr(~tempo.kr/4).range(0,1)};
)

// kick synth ///////////////////////////////////////

(
  ~kick.quant=2;
  ~kick.fadeTime=0.2;
  ~kick={
    //         |       |       |       |       |  
    var pat = [1,0,0,0,1,0,0,0,1,0,0,0,1,1,1,1];
    var imp = PulseDivider.kr(~tick.kr,2,~counter.kr);
    var hit = Select.kr(PulseCount.kr(imp)%pat.size,pat);
    var env = EnvGen.ar(Env([0.001,1,0.001],[0.002,1.25],[3,-3],curve:'exp'),imp * hit);
    var sig = SinOsc.ar(44 + (env**4*[40,80]));
    sig = sig * env;
    Splay.ar(sig.flat,0.75,0.5);
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
    var pat = [0,0,1,0,0,0,1,0,0,0,1,0,1,1,1,1];
    var imp = PulseDivider.kr(~tick.kr,(1..8),~counter.kr);
    var hit = Select.kr(PulseCount.kr(imp)%pat.size,pat);
    var env = EnvGen.ar(Env([0.001,1,0.001],[0.002,0.025*fib(8)],[3,-3],curve:'exp'),imp * hit);
    var sig = WhiteNoise.ar(1!2);
    sig = HPF.ar(sig,800*fib(8));
    sig = Resonz.ar(sig,LFNoise2.kr(1!8).range(1000,16000)+SinOsc.kr(11/fib(8)).range(-500,1000));
    sig = sig * env;
    Splay.ar(sig.flat,0.75,0.25);
  };
  ~hh.play;
);
~hh.stop(7);
~hh.clear;


// tone synth ///////////////////////////////////////

(
  ~tone.quant=2;
  ~tone.fadeTime=0.2;
  ~tone={
    //         |       |       |       |       |  
    var pat = [1,0,0,0,1,0,0,0,1,0,0,0,1,0,0,0];
    var imp = PulseDivider.kr(~tick.kr,(1..8)*8,~counter.kr);
    var hit = Select.kr(PulseCount.kr(imp)%pat.size,pat);
    var env = EnvGen.ar(Env([0.001,1,0.001],[1.002,1.5*(1..8)],[3,-3],curve:'exp'),imp * hit);
    var sig = SinOsc.ar([60,64,67,57,53,50,43,40].midicps*8/([1,2,4,8]*pi),mul:LFNoise2.kr(1/4/~tempo!8));
    sig = Vibrato.ar(sig,(2..10),0.2);
    sig = sig * env;
    Splay.ar(sig.flat,0.75,0.5);
  };
  ~tone.play;
);
~tone.stop(7);
~tone.clear;



// filter filter ///////////////////////////////////////

(
  ~filter.quant=1;
  ~filter.fadeTime=1;
  ~filter={
    var high,mid,low;
    var sig = ~hh+~kick+~tone;

    sig = GVerb.ar(LPF.ar(sig,5000)+HPF.ar(sig,500),40,[3,4,5,6],spread:[20,90])/4 + sig;
    low = CompanderD.ar(LPF.ar(sig,600),3/4,1/2,1/2);
    mid = CompanderD.ar(BPF.ar(sig,800,2),3/4,1/2,1/2);
    high = CompanderD.ar(HPF.ar(sig,900),3/4,1/2,1/2);
    sig = CompanderD.ar((high+mid+low).flat,3/4,1/1.1,1/1.1);
    Splay.ar(sig,0.75,0.25);
  };
  ~filter.play;
);
~filter.stop(7);
~filter.clear;
