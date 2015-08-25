

(
  p=ProxySpace.push(s.reboot);
  p.makeTempoClock;
);

(
  p.clock.tempo_(60/60);

  ~offset = (0..7)/8;

  ~tick.quant = 1;
  ~tick = {Mix(Impulse.kr( ~tempo / 2 , ~offset ))};

  ~counter = {PulseCount.kr(~tick.kr)};
  ~time = {LFSaw.kr(~tempo/4).range(0,1)};
  b = Buffer.read(s,Platform.resourceDir ++ "/sounds/beat.wav");
)


// player synth ///////////////////////////////////////

(
  ~test.quant=1;
  ~test.fadeTime=2.02;
  ~test={
    var mod = 1;//[-1,0.25,-0.25,1/8,1/16];
    var spread = 0.0;
    var pos = [0,0.5];
    //         |       |       |       |       |  
    var pat = [1,0,0,0,1,0,0,0,1,0,0,0,1,0,0,0];
    var imp = PulseDivider.kr(~tick.kr,1,~counter.kr);
    var hit = Select.kr(PulseCount.kr(imp)%pat.size,pat);
    var env = EnvGen.ar(Env([0.001,1,0.001],[0.002,0.5],[3,-3],curve:'exp'),imp * hit);
    var sig = PlayBuf.ar(b.numChannels,b.bufnum,BufRateScale.kr(b.bufnum)*mod+(env*0.01),imp, (pos + BrownNoise.ar(1!8).range(spread * -1,spread)) * BufFrames.kr(b.bufnum),1);

    sig = sig * env;
    Splay.ar(sig.flat,0.5,0.5);
  };
  ~test.play;
);
~test.stop(7);
~test.clear;
