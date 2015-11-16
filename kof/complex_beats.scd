

(
  p.clock.tempo_(120/60);

  ~offset = (0..7)/8;

  ~tick.quant = 1;
  ~tick = {Mix(Impulse.kr( ~tempo / 2 , ~offset ))};

  ~counter = {PulseCount.kr(~tick.kr)};
);


// ss synth ///////////////////////////////////////

(
  ~ss.ar(2);
  ~ss.quant=2;
  ~ss.fadeTime=2.2;
  ~ss={
    //         |       |       |       |       |  
    var pat = [1,0,0,0,1,0,0,0,1,0,0,0,1,0,0,0,1,0,0,0,1,0,0,0,1,0,0,0,1,1,1,1].rotate(3);
    var imp = PulseDivider.kr(~tick.kr,fib(16,2,4),~counter.kr);
    var hit = Select.kr(PulseCount.kr(imp)%pat.size,pat);
    var env = EnvGen.ar(Env([0.001,1,0.00001],[0.02,0.175*[1,4,8,2]],[4,-3],curve:'exp'),imp * hit);
    var sig = SinOsc.ar(50+(env**50+Pulse.ar(500/(1..16).reciprocal*(env**50+1))*5000));
    sig = CombN.ar(sig,1/4,1/4/fib(16),8);
    sig = Normalizer.ar(sig,1,0.04);
    sig = sig * env;
    Splay.ar(sig,0.75,0.25);
  };
  ~ss.play;
);
~ss.stop(4);
~ss.clear;
~ss.pause;
~ss.resume;

b = Buffer.read(s,Platform.resourceDir ++ "/sounds/beat2.wav");

// player synth ///////////////////////////////////////

(
  ~ssmp.ar(2);
  ~ssmp.quant=2;
  ~ssmp.fadeTime=2.02;
  ~ssmp={
    var mod = [1,-1];//[-1,0.25,-0.25,1/8,1/16];
    var spread = 0.0;
    var pos = 1/(1..4)/MouseX.kr(1,16);
    //         |       |       |       |       |  
    var pat = [1,0,0,0,1,0,0,0,1,0,0,0,1,0,0,0].rotate(3);
    var imp = PulseDivider.kr(~tick.kr,(16..1),~counter.kr);
    var hit = Select.kr(PulseCount.kr(imp)%pat.size,pat);
    var env = EnvGen.ar(Env([0.001,1,0.001],[0.002,1.5/(1..16)],[3,-3],curve:'exp'),imp * hit);
    var sig = PlayBuf.ar(b.numChannels,b.bufnum,BufRateScale.kr(b.bufnum)*mod+(env*0.01),imp, (pos + BrownNoise.ar(1!8).range(spread * -1,spread)) * BufFrames.kr(b.bufnum),1);

    sig = sig * env;
    Splay.ar(sig.flat,0.5,0.25);
  };
  ~ssmp.play;
);
~ssmp.stop(7);
~ssmp.clear;

// kick synth ///////////////////////////////////////

(
  ~kick.ar(2);
  ~kick.quant=2;
  ~kick.fadeTime=0.2;
  ~kick={
    //         |       |       |       |       |  
    var pat = [1,0,0,0,1,0,0,0,1,0,0,0,1,0,0,0,1,0,0,0,1,0,0,0,1,0,0,0,1,1,1,1].rotate(1);
    var imp = PulseDivider.kr(~tick.kr,[4,4,2,1],~counter.kr);
    var hit = Select.kr(PulseCount.kr(imp)%pat.size,pat);
    var env = EnvGen.ar(Env([0.001,1,0.001],[0.002,0.5],[3,-3],curve:'exp'),imp * hit);
    var sig = SinOsc.ar(50+(env**50*500));
    sig = sig * env;
    Splay.ar(sig,0.75,0.5);
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
    var pat = [1,0,0,0,1,0,0,0,1,0,0,0,1,0,1,0].rotate(3);
    var imp = PulseDivider.kr(~tick.kr,(1..16),~counter.kr);
    var hit = Select.kr(PulseCount.kr(imp)%pat.size,pat);
    var env = EnvGen.ar(Env([0.001,1,0.001],[0.002,0.15*(1..16)],[3,-3],curve:'exp'),imp * hit);
    var sig = LFNoise2.ar(16000/fib(16));

    sig = sig * env;
    sig = CombN.ar(sig,1/4,1/fib(16),8);
    sig = Normalizer.ar(sig,1,0.04);
    sig = sig * env;
    Splay.ar(sig,0.75,0.45);
  };
  ~hh.play;
);
~hh.stop(4);
~hh.clear;
~hh.pause;
~hh.resume;


// ff filter ///////////////////////////////////////

(
  ~ff.quant=1;
  ~ff.fadeTime=1;
  ~ff={
    var high,mid,low;
      var sig = Resonz.ar( ~ssmp.ar + ~hh.ar + ~kick.ar + ~ss.ar,MouseX.kr(100,10000,(1..16)),MouseY.kr(0.01,1,(1..4)/16))/4;
    sig = CompanderD.ar(sig,1/2,1/2,1/2);
    sig = Limiter.ar(sig.tanh,0.25);
    sig = CombN.ar(sig,4,4,16)+sig;
    //sig = CombN.ar(sig,1/4,1/LFNoise0.kr(4!16).range(1,800).round(2pi),8)/16+sig;
    sig = GVerb.ar(LPF.ar(sig,7000)+HPF.ar(sig,300),200,[3,4],spread:[10,11])/8 + sig;
    low = CompanderD.ar(LPF.ar(sig,400),3/4,1/2,1/2);
    mid = CompanderD.ar(BPF.ar(sig,600,2),3/4,1/2,1/2);
    high = CompanderD.ar(HPF.ar(sig,900),3/4,1/2,1/2);
    sig = CompanderD.ar((high+mid+low).flat,3/4,1/1.1,1/1.1);
    Splay.ar(sig,0.25,0.075);
  };
  ~ff.play;
);
~ff.stop(7);
~ff.clear;
