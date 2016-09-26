











(
n = ProxyMixer(p,32);
n.parent.alwaysOnTop_(true);
)



(
  p.clock.tempo_(120/60);
  
  ~offset = {(0..7)/8};
  
  ~tick.quant = 1;
  ~tick = {Mix(Impulse.kr( ~tempo / 2 , ~offset ))};
  
  ~counter = {PulseCount.kr(~tick.kr)};
);




// one synth ///////////////////////////////////////

(
~one2.ar(2);
~one2.quant=2;
~one2.fadeTime=0.2;
~one2={
  var pat = [
  //         |       |       |       |       |  
             1,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,
             1,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,
  ].rotate(1);
  var imp = PulseDivider.kr(~tick.kr,1,~counter.kr%pat.size);
  var hit = Select.kr(PulseCount.kr(imp)%pat.size,pat);
  var env = EnvGen.ar(Env([0.001,1,0.0001],[0.002,1.75],[3,-3],curve:'exp'),imp * hit);
  var sig = Mix.fill(10,{|i| SinOsc.ar(50+i+(env**10*500),env**40*8pi)});
  sig = sig + (env**20*PinkNoise.ar(1!2));
  sig = sig + (env**20.5*SinOsc.ar([500,500.001]));
  sig = sig * env;
  sig = CompanderD.ar(sig,3/4,1,1/4);
  Splay.ar(sig,0.75,0.35);
};
~one2.play;
);
~one2.stop(4);
~one2.clear;
~one2.pause;
~one2.resume;

// two synth ///////////////////////////////////////

(
~two2.ar(2);
~two2.quant=2;
~two2.fadeTime=0.2;
~two2={
  //         |       |       |       |       |  
  var pat = [
             0,0,0,0,1,0,0,0,0,0,0,0,1,0,0,0,
             0,0,0,0,1,0,0,0,0,0,0,0,1,0,1,0
  ].rotate(1);
  var imp = PulseDivider.kr(~tick.kr,1,~counter.kr%pat.size);
  var hit = Select.kr(PulseCount.kr(imp)%pat.size,pat);
  var env = EnvGen.ar(Env([0.001,1,0.0001],[0.002,1.5],[3,-3],curve:'exp'),imp * hit);
  var sig = Mix.fill(10,{|i|SinOsc.ar(50+i,env**(40-i)*8pi)}) + Resonz.ar(WhiteNoise.ar(env**20),env**2*14000+40);
  sig = sig * env;
  sig = CompanderD.ar(sig,3/4,1,1/4);
  Splay.ar(sig,0.75,0.5);
};
~two2.play;
);
~two2.stop(4);
~two2.clear;
~two2.pause;
~two2.resume;

b = Buffer.read(s,Platform.resourceDir ++ "/sounds/beat.wav");

// player synth ///////////////////////////////////////

(
    ~hiss2.ar(2);
    ~hiss2.quant=2;
    ~hiss2.fadeTime=2.02;
    ~hiss2={
        var mod = [-1,1,2,1/2];
        var spread = 0.0;
        var pos = [0,0.5,0.25,0.75]+LFSaw.kr(1/400/[1,2,3,4]);
        //         |       |       |       |       |  
        var pat = [1,0,0,0,1,0,0,0,1,0,0,0,1,0,0,0].rotate(3);
        var imp = PulseDivider.kr(~tick.kr,[1,2],~counter.kr);
        var hit = Select.kr(PulseCount.kr(imp)%pat.size,pat);
  var env = EnvGen.ar(Env([0.001,1,0.001],[0.45,0.05],[3,-3],curve:'exp'),imp * hit);
        var sig = PlayBuf.ar(b.numChannels,b.bufnum,BufRateScale.kr(b.bufnum)*mod+(env*0.01),imp, (pos + BrownNoise.ar(1!8).range(spread * -1,spread)) * BufFrames.kr(b.bufnum),1);
  sig = sig * env;
        sig = CombN.ar(sig,1/50,1/50*[1,2,4,8],1/3);
        sig = Resonz.ar(sig,env**0.1*8000+100,0.4);
        Splay.ar(sig.flat,0.75,0.65);
    };
    ~hiss2.play;
);
~hiss2.stop(7);
~hiss2.clear;


(
n = ProxyMixer(p,32);
n.parent.alwaysOnTop_(true);
)

// one synth ///////////////////////////////////////

(
  ~one21.ar(2);
  ~one21.quant=2;
  ~one21.fadeTime=0.2;
  ~one21={
    var mini = Duty.kr(4,0,Dseq([15,5,0,25],inf));
    //         |       |       |       |       |  
    var pat = [
      1,0,0,0,1,0,0,0,1,0,0,0,1,0,0,0,
      1,0,0,0,1,0,0,0,1,0,0,0,1,0,0,0,
      1,0,0,0,1,0,0,0,1,0,0,0,1,0,0,0,
      1,0,0,0,1,1,0,0,1,0,0,0,1,0,1,0,
    ].pyramid.rotate(1);
    var imp = PulseDivider.kr(~tick.kr,4,~counter.kr % pat.size);
    var hit = Select.kr(PulseCount.kr(imp)%pat.size,pat);
    var env = EnvGen.ar(Env([0.001,1,0.0001],[0.002,0.5*[1,2,3,4]],[3,-7]),imp * hit);
    var sig = Mix.fill(20,{|i| SinOsc.ar(50+(i*0.1) + mini, (env**(40+(i*2))*8pi))});
    sig = sig * env;
    Splay.ar(sig,0.25,0.5);
  };
  ~one21.play;
);
~one.stop(4);
~one.clear;
~one.pause;
~one.resume;

// two synth ///////////////////////////////////////

(
  ~two.ar(2);
  ~two.quant=2;
  ~two.fadeTime=0.2;
  ~two={
    var mini = Duty.kr([4,2,1,1/4],0,Dseq([1,-1,2,-2],inf));
    //         |       |       |       |       |  
    var pat = [
      1,0,1,0,1,0,0,0,1,0,0,0,1,0,0,0,
      1,0,0,0,1,0,0,0,1,1,0,0,1,0,0,0,
      1,0,1,0,1,0,0,0,1,0,0,0,1,0,0,0,
      1,0,0,0,1,0,0,0,1,1,0,0,1,0,1,0,
    ].pyramid.rotate(3);
    var imp = PulseDivider.kr(~tick.kr,1,~counter.kr % pat.size);
    var hit = Select.kr(PulseCount.kr(imp)%pat.size,pat);
    var env = EnvGen.ar(Env([0.001,1,0.0001],[0.002,0.05*[1,2,3,4]],[3,-7]*mini),imp * hit);
    var sig = LFNoise2.ar(16000/[1,2,4,8]);
    sig = sig * env;
    sig = CompanderD.ar(LPF.ar(sig,13800),3/4,1,1/2,0.002,0.13);
    Splay.ar(sig,0.35,0.25);
  };
  ~two.play;
);
~two.stop(4);
~two.clear;
~two.pause;
~two.resume;


