Kolektiv.free;
Kolektiv(\kof)
Kolektiv.players;
Kolektiv.historyRestart;

(
  ~offset = (0..7)/8;

  ~tick.quant = 1;
  ~tick = {Mix(Impulse.kr( ~tempo / 2 , ~offset ))};

  ~counter = {PulseCount.kr(~tick.kr)};
);

// swine synth ///////////////////////////////////////

(
  ~swine.ar(2);
  ~swine.quant=2;
  ~swine.fadeTime=4.2;
  ~swine={
    //         |       |       |       |       |  
    var pat = [1,0,0,0,1,0,0,0,1,0,0,0,1,0,0,0].rotate(3);
    var imp = PulseDivider.kr(~tick.kr,1,~counter.kr);
    var hit = Select.kr(PulseCount.kr(imp)/[1,2,3,4]%pat.size,pat);
    var env = EnvGen.ar(Env([0.0001,0.1,1,0.0001],[0.002,0.05,0.0002],[3,3,-3],curve:'exp'),imp * hit);
    var sig = [
      LFPulse.ar(50),
      Pulse.ar(50) * Pulse.ar(8),
      LFSaw.ar(500) * Pulse.ar(2),
      SinOsc.ar(5000) * Pulse.ar(1),
      SinOsc.ar(5000/1.5),
      LFSaw.ar(15000/4) * Pulse.ar(1),
      LFPar.ar(5000/4),
    ];
    sig = PitchShift.ar(sig,0.02+SinOsc.ar(4/fib(16)).range(0.001,0.2),[0.25,0.5,0.75,1.25]/2)+sig;
    sig = Select.ar(PulseCount.kr(imp*hit)%sig.size,sig);
    sig = sig * env;
    Splay.ar(sig,0.25,0.05);
  };
  ~swine.play;
);
~swine.stop(4);
~swine.clear;
~swine.pause;
~swine.resume;

b = Buffer.read(s,Platform.resourceDir ++ "/sounds/piano.wav");

// player synth ///////////////////////////////////////

(
  ~ss.ar(2);
  ~ss.quant=2;
  ~ss.fadeTime=2.02;
  ~ss={
    var mod = [-1,0.25,-0.25,4];
    var spread = 0.0;
    var pos = [0,0.5,0.25,0.1] + LFSaw.ar(1/40);
    //         |       |       |       |       |  
    var pat = [1,0,0,0,1,0,0,0,1,0,0,0,1,0,0,0].rotate(3);
    var imp = PulseDivider.kr(~tick.kr,1,~counter.kr);
    var hit = Select.kr(PulseCount.kr(imp)/[1,2,3,4]%pat.size,pat);
    var env = EnvGen.ar(Env([0.001,1,0.001],[0.202,0.75],[3,-3],curve:'exp'),imp * hit);
    var sig = PlayBuf.ar(b.numChannels,b.bufnum,BufRateScale.kr(b.bufnum)*mod+(env*0.01),imp, (pos + BrownNoise.ar(1!8).range(spread * -1,spread)) * BufFrames.kr(b.bufnum),1);

    sig = sig * env;
    Splay.ar(sig.flat,0.15,0.25);
  };
  ~ss.play;
);
~ss.stop(7);
~ss.clear;


// kick synth ///////////////////////////////////////

(
  ~kick.ar(2);
  ~kick.quant=2;
  ~kick.fadeTime=3.2;
  ~kick={
    //         |       |       |       |       |  
    var pat = [1,0,0,0,1,1,0,0,1,0,0,0,1,1,0,0].rotate(1);
    var imp = PulseDivider.kr(~tick.kr,1,~counter.kr);
    var hit = Select.kr(PulseCount.kr(imp)%pat.size,pat);
    var env = EnvGen.ar(Env([0.001,1,0.001],[0.002,1.5],[3,-3],curve:'exp'),imp * hit);
    var sig = SinOsc.ar(50+(env**100*100),SinOsc.ar(50/1.5)) ;
    sig = sig * env;
    Splay.ar(sig,0.75,0.95);
  };
  ~kick.play;
);
~kick.stop(4);
~kick.clear;
~kick.pause;
~kick.resume;


~x = {RandSeed.ar(Impulse.ar(~tempo.ar*8),LFSaw.ar(1/16).range(1,10))};

// hh synth ///////////////////////////////////////

(
  ~hh.ar(2);
  ~hh.quant=2;
  ~hh.fadeTime=0.2;
  ~hh={
    //         |       |       |       |       |  
    var pat = [1,0,0,0,1,0,0,0,1,0,0,0,1,0,0,0].rotate(3);
    var imp = PulseDivider.kr(~tick.kr,2,~counter.kr);
    var hit = Select.kr(PulseCount.kr(imp)/[1,2,3,4]%pat.size,pat);
    var env = EnvGen.ar(Env([0.001,0.1,1,0.001],[0.002,0.05,0.02],[3,1,-3],curve:'exp'),imp * hit);
    var sig = LFNoise1.ar(16000/[1,1.25,1.5,2]);
    sig = sig * env;
    Splay.ar(sig,0.25,0.25);
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
    var sig = ~swine.ar + ~kick.ar + ~hh.ar + ~ss.ar;

    sig = GVerb.ar(LPF.ar(sig,5000)+HPF.ar(sig,100),100,[3,4,5,6],spread:[40,90])/16 + sig;
    low = CompanderD.ar(LPF.ar(sig,400),3/4,1/LFNoise2.kr(1/4!2).range(1,3),1/2);
    mid = CompanderD.ar(BPF.ar(sig,600,2),3/4,1/LFNoise2.kr(1/4!2).range(1,3),1/2);
    high = CompanderD.ar(HPF.ar(sig,900),3/4,1/LFNoise2.kr(1/4!2).range(1,3),1/2);
    sig = CompanderD.ar((high+mid+low).flat,3/4,1/1.1,1/1.1);
    Splay.ar(sig,0.75,0.15);
  };
  ~ff.play;
);
~ff.stop(7);
~ff.clear;
