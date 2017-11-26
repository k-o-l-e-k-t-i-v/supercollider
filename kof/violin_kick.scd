
p.bpm(90)

b = Buffer.read(s,Platform.resourceDir ++ "/sounds/violin.wav");

// player synth ///////////////////////////////////////

(
  ~ss.ar(2);
  ~ss.quant=16;
  ~ss.fadeTime=2.02;
  ~ss={
      var mod2 = Duty.kr(8/~tempo*[1,2,3,4],0,Dseq([1,2,1,1.5],inf));
    var mod = ([1,-1,0.5,-0.5])*mod2;//[-1,0.25,-0.25,8,1/16];
    var spread = 0.01;
    var pos = [0,0.07,0.05,0.06] + LFSaw.kr(~tempo/16/[1,2,3,4]).exprange(0.001,0.9);
    //         |       |       |       |       |  
    var pat = [1,1,1,1].rotate(1);
    var imp = PulseDivider.kr(~tick.kr,[1,2,3,4]);
    var hit = Select.kr(PulseCount.kr(imp)%pat.size,pat);
    var env = EnvGen.ar(Env([0.001,1,0.001],[0.02,1*[1,2,3,4]],[3,-3],curve:'exp'),imp * hit);
    var sig = PlayBuf.ar(b.numChannels,b.bufnum,BufRateScale.kr(b.bufnum)*mod+(env*0.01),imp, (pos + BrownNoise.ar(1!8).range(spread * -1,spread)) * BufFrames.kr(b.bufnum),1);

    sig = sig * env * SinOsc.kr(~tempo/16/[1,2,3,4]);
    Splay.ar(sig.flat,0.5,0.5);
  };
  ~ss.play;
);
~ss.stop(7);
~ss.clear;

// kick synth ///////////////////////////////////////

(
  ~kick.quant=2;
  ~kick.fadeTime=0.2;
  ~kick={
    //         |       |       |       |       |  
    var pat = [1,0,0,0,1,1,0,0,1,0,0,0,1,0,1,0].rotate(1);
    var imp = PulseDivider.kr(~tick.kr,1,~counter.kr);
    var hit = Select.kr(PulseCount.kr(imp)%pat.size,pat);
    var env = EnvGen.ar(Env([0.001,1,0.001],[0.002,0.5],[3,-3],curve:'exp'),imp * hit);
    var sig = SinOsc.ar(43.2*1.25+(env**10*100));
    sig = sig * env;
    Splay.ar(sig,0.75,0.5);
  };
  ~kick.play;
);
~kick.stop(7);
~kick.clear;


// hiss synth ///////////////////////////////////////

(
  ~hiss.quant=2;
  ~hiss.fadeTime=0.2;
  ~hiss={
    //         |       |       |       |       |  
    var pat = [1,0,0,0,1,0,0,0,1,0,0,0,1,1,1,1].rotate(3);
    var imp = PulseDivider.kr(~tick.kr,[1,2,3,4],~counter.kr);
    var hit = Select.kr(PulseCount.kr(imp)%pat.size,pat);
    var env = EnvGen.ar(Env([0.001,1,0.001],[0.002,0.25],[3,-3],curve:'exp'),imp * hit);
    var sig = Crackle.ar([0.2,0.4,0.7,0.9]+(env**2));
    sig = sig * env;
    Splay.ar(sig,0.75,0.5);
  };
  ~hiss.play;
);
~hiss.stop(7);
~hiss.clear;


