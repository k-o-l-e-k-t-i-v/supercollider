
(
  p.clock.tempo_(140/60);

  ~offset = (0..7)/8;

  ~tick.quant = 1;
  ~tick = {Mix(Impulse.kr( ~tempo / 2 , ~offset ))};

  ~counter = {PulseCount.kr(~tick.kr)};
);

// laylay synth ///////////////////////////////////////

(
  ~laylay.ar(2);
  ~laylay.quant=2;
  ~laylay.fadeTime=0.2;
  ~laylay={
    //         |       |       |       |       |  
    var pat = [1,0,0,0,1,0,0,0,1,0,0,0,1,0,0,0].rotate(1);
    var imp = PulseDivider.kr(~tick.kr,1,~counter.kr);
    var hit = Select.kr(PulseCount.kr(imp)/(1..4)%pat.size,pat);
    var env = EnvGen.ar(Env([0.001,1,0.001],[0.002,0.75],[3,-3],curve:'exp'),imp * hit);
    var sig = SinOsc.ar(SinOsc.ar(1/16/[1,2,3,4]).range(43.2,43.2*20).round(43.2*2),mul:LFSaw.ar(1/16/[1,2,3,4]).range(0.001,0.5));
    //sig = PitchShift.ar(sig,0.025,1/[1,2,1.5,1.25]);
    sig = sig * env;
    sig = CombN.ar(sig,1/2,1/2+BrownNoise.ar(0.0002!4),4)/2+sig;
    sig = Resonz.ar(sig,43.2*4*(1..16));
    Splay.ar(sig,0.15,~n2);
  };
  ~laylay.play;
);
~laylay.stop(4);
~laylay.clear;
~laylay.pause;
~laylay.resume;


// low synth ///////////////////////////////////////

(
  ~low.ar(2);
  ~low.quant=2;
  ~low.fadeTime=0.2;
  ~low={
    //         |       |       |       |       |  
    var pat = [1,0,0,0,1,0,0,0,1,0,0,0,1,0,0,0].rotate(1);
    var imp = PulseDivider.kr(~tick.kr,8,~counter.kr);
    var hit = Select.kr(PulseCount.kr(imp)/[1,2,3,4]%pat.size,pat);
    var env = EnvGen.ar(Env([0.001,1,0.001],[2.002,2.5],[3,-3],curve:'exp'),imp * hit);
    var sig = SinOsc.ar(43.2+[0,0.1],SinOsc.ar(43.21+[0.2,0]).range(-8pi,8pi));
    sig = sig * env;
    Splay.ar(sig,0.75,~n1);
  };
  ~low.play;
);
~low.stop(4);
~low.clear;
~low.pause;
~low.resume;


// ff filter ///////////////////////////////////////

(
  ~ff.quant=1;
  ~ff.fadeTime=1;
  ~ff={
    var high,mid,low;
    var sig = ~laylay.ar + ~oscill.ar + ~high.ar;
    var x,y;

    sig = GVerb.ar(LPF.ar(sig,15000)+HPF.ar(sig,50),90,[5,6],spread:[91,90])/16 + sig;
    low = CompanderD.ar(LPF.ar(sig,800),3/4,1/(~n5*4+1),1/2);
    mid = CompanderD.ar(BPF.ar(sig,1500,2),3/4,1/(~n6*4+1),1/2);
    high = CompanderD.ar(HPF.ar(sig,6000),3/4,1/(~n7*4+1),1/2);
    sig = CompanderD.ar((high+mid+low).flat,3/4,1/1.1,1/1.1);
    #x,y = sig;
    #x,y = Rotate2.ar(x,y,SinOsc.ar((1..4)).range(-0.75,0.75));
    Splay.ar(sig,0.95,~n8);
  };
  ~ff.play;
);
~ff.stop(7);
~ff.clear;


// oscill synth ///////////////////////////////////////

(
  ~oscill.ar(2);
  ~oscill.quant=2;
  ~oscill.fadeTime=0.2;
  ~oscill={
    //         |       |       |       |       |  
    var pat = [1,0,0,0,1,0,0,0,1,0,0,0,1,0,0,0].rotate(1);
    var imp = PulseDivider.kr(~tick.kr,16,~counter.kr);
    var hit = Select.kr(PulseCount.kr(imp)%pat.size,pat);
    var env = EnvGen.ar(Env([0.001,1,0.001],[1.002,4.5],[3,-3],curve:'exp'),imp * hit);
    var sig = SinOsc.ar([4320,4321]+SinOsc.ar([80,81]).range(-2000,200),mul:0.1) * Pulse.ar([43,44]);
    sig = sig * env;
    Splay.ar(sig,0.75,~n3);
  };
  ~oscill.play;
);
~oscill.stop(4);
~oscill.clear;
~oscill.pause;
~oscill.resume;


// high synth ///////////////////////////////////////

(
  ~high.ar(2);
  ~high.quant=2;
  ~high.fadeTime=0.2;
  ~high={
    //         |       |       |       |       |  
    var pat = [1,0,0,0,1,0,0,0,1,0,0,0,1,0,0,0].rotate(1);
    var imp = PulseDivider.kr(~tick.kr,fib(16,4,5),~counter.kr);
    var hit = Select.kr(PulseCount.kr(imp)%pat.size,pat);
    var env = EnvGen.ar(Env([0.0001,1,0.0001],[0.5,4.5],[3,-3],curve:'exp'),imp * hit);
    var sig = SinOsc.ar([10000,10001]+LFTri.ar([50,51]/(1..16)*env).range(-50,5000)-(10000/(1..16)),mul:0.1);
    sig = sig * env;
    Splay.ar(sig,0.75,~n4);
  };
  ~high.play;
);
~high.stop(4);
~high.clear;
~high.pause;
~high.resume;
