

(
  p=ProxySpace.push(s.reboot);
  p.makeTempoClock;
);

(
  p.clock.tempo_(240/60);

  ~offset = (0..7)/8;

  ~tick.quant = 1;
  ~tick = {Mix(Impulse.kr( ~tempo / 2 , ~offset ))};

  ~counter = {PulseCount.kr(~tick.kr)};
  ~time = {LFSaw.kr(~tempo/4).range(0,1)};
  b = Buffer.read(s,Platform.resourceDir ++ "\/sounds\/douce.wav");
)


// player synth ///////////////////////////////////////


(
  ~test.quant=1;
  ~test.fadeTime=2.02;
  ~test={
    var mod = [1,0.5,25];
    var spread = 0.001;
    var pos = [0.25,0.5,0.75];
    //         |       |       |       |       |  
    var pat = [0,0,0,0,0,0,0,0,0,0,0,0,1,1,1,1];
    var imp = PulseDivider.kr(~tick.kr,[1,2,4],~counter.kr);
    var hit = Select.kr(PulseCount.kr(imp)%pat.size,pat);
    var env = EnvGen.ar(Env([0.001,1,0.001],[0.002,0.15],[3,-3],curve:'exp'),imp * hit);
    var sig = PlayBuf.ar(b.numChannels,b.bufnum,BufRateScale.kr(b.bufnum)*mod+(env*0.01),imp, (pos + BrownNoise.ar(1!8).range(spread * -1,spread)) * BufFrames.kr(b.bufnum),1);

    sig = sig * env;
    Splay.ar(sig.flat,0.5,0.5);
  };
  ~test.play;
);
~test.stop(7);
~test.clear;


// tests filter ///////////////////////////////////////

(
~tests.quant=1;
~tests.fadeTime=1;
~tests={
  var high,mid,low;
  var sig = ~test;
  
  sig = GVerb.ar(LPF.ar(sig,5000)+HPF.ar(sig,500),40,[3,4,5,6],spread:[40,90])/8 + sig;
  low = CompanderD.ar(LPF.ar(sig,600),3/4,1/2,1/2);
  mid = CompanderD.ar(BPF.ar(sig,800,2),3/4,1/2,1/2);
  high = CompanderD.ar(HPF.ar(sig,900),3/4,1/2,1/2);
  sig = CompanderD.ar((high+mid+low).flat,3/4,1/1.1,1/1.1);
  Splay.ar(sig,0.75,0.25);
};
~tests.play;
);
~tests.stop(7);
~tests.clear;
