



(
  p=ProxySpace.push(s.boot);
  p.makeTempoClock;
);


(
  p.clock.tempo_(60/60*2);

  ~offset = (0..7)/8;

  ~tick.quant = 1;
  ~tick = {Mix(Impulse.kr( ~tempo / 2 , ~offset ))};

  ~counter = {PulseCount.kr(~tick.kr)};
  ~time = {LFSaw.kr(~tempo/4).range(0,1)};
)


// abc synth ///////////////////////////////////////

(
  ~abc.quant=4;
  ~abc.fadeTime=0.2;
  ~abc={
    //         |       |       |       |       |  
    var pat = [1,0,0,0,1,0,0,0,1,0,0,0,1,0,0,0].rotate(1);
    var imp = PulseDivider.kr(~tick.kr,1,~counter.kr);
    var hit = Select.kr(PulseCount.kr(imp)%pat.size,pat);
    var env = EnvGen.ar(Env([0.001,1,0.001],[0.002,1.5],[3,-3],curve:'exp'),imp * hit);
    var sig = SinOsc.ar(50+(env**40*400)) + Pulse.ar(50,(1..8)/LFNoise2.kr(1/4).range(40,400));
    sig = LPF.ar(sig,800+LFNoise2.kr(1/4).range(0,10000));
    sig = sig * env;
    Splay.ar(sig,0.75,0.5);
  };
  ~abc.play;
);
~abc.stop(7);
~abc.clear;

// hh synth ///////////////////////////////////////

(
  ~hh.quant=4;
  ~hh.fadeTime=0.2;
  ~hh={
    //         |       |       |       |       |  
    var pat = [1,0,0,0,1,0,0,0,1,0,0,0,1,1,1,1].rotate(3);
    var imp = PulseDivider.kr(~tick.kr,fib(8),~counter.kr);
    var hit = Select.kr(PulseCount.kr(imp)%pat.size,pat);
    var env = EnvGen.ar(Env([0.001,1,0.001],[0.002+[0,0,0.1,0.5,0.25],0.15],[3,-3],curve:'exp'),imp * hit);
    var sig = WhiteNoise.ar(0.5);
    sig = HPF.ar(sig,18000/8*(1..8));
    sig = sig * env;
    Splay.ar(sig,0.75,0.5);
  };
  ~hh.play;
);
~hh.stop(7);
~hh.clear;



b = Buffer.read(s,Platform.resourceDir ++ "/sounds/violin.wav");

// player synth ///////////////////////////////////////

(
  ~smp.quant=4;
  ~smp.fadeTime=2.02;
  ~smp={
    var mod = [-1,1,-1,1]/Duty.kr(fib(4),0,Dseq([1,2,1.5,1.25],inf));
    var spread = 0.001;
    var pos = [0,0.5,0.25,0.01];
    //         |       |       |       |       |  
    var pat = [1,0,0,0,1,0,0,0,1,0,0,0,1,0,1,0].rotate(3);
    var imp = PulseDivider.kr(~tick.kr,fib(4)*2,~counter.kr);
    var hit = Select.kr(PulseCount.kr(imp)%pat.size,pat);
    var env = EnvGen.ar(Env([0.001,1,0.001],[1.5,0.5],[3,-3],curve:'exp'),imp * hit);
    var sig = PlayBuf.ar(b.numChannels,b.bufnum,BufRateScale.kr(b.bufnum)*mod+(env*0.01),imp, (pos + BrownNoise.ar(1!8).range(spread * -1,spread)) * BufFrames.kr(b.bufnum),1);

    sig = sig * env;
    Splay.ar(sig.flat,0.5,0.5);
  };
  ~smp.play;
);
~smp.stop(7);
~smp.clear;


// filt filter ///////////////////////////////////////

(
  ~filt.quant=1;
  ~filt.fadeTime=1;
  ~filt={
    var high,mid,low;
    var sig = ~smp + ~hh + ~abc;

    sig = GVerb.ar(LPF.ar(sig,500)+HPF.ar(sig,500),40,[3,4,5,6],spread:[40,90])/16 + sig;
    low = CompanderD.ar(LPF.ar(sig,400),3/4,1/2,1/2);
    mid = CompanderD.ar(BPF.ar(sig,500,1.5),3/4,1/2,1/2);
    high = CompanderD.ar(HPF.ar(sig,900),3/4,1/2,1/2);
    sig = CompanderD.ar((high+mid+low).flat,3/4,1/1.1,1/1.1);
    Splay.ar(sig,0.75,0.25);
  };
  ~filt.play;
);
~filt.stop(7);
~filt.clear;
