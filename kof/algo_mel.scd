


(
  p=ProxySpace.push(s.boot);
  p.makeTempoClock;
);


(
  p.clock.tempo_(240/60/2);

  ~offset = (0..7)/8;

  ~tick.quant = 1;
  ~tick = {Mix(Impulse.kr( ~tempo / 2 , ~offset ))};

  ~counter = {PulseCount.kr(~tick.kr)};
);


// sss synth ///////////////////////////////////////

(
  ~sss.quant=2;
  ~sss.fadeTime=4.2;
  ~sss={
    //         |       |       |       |       |  
    var pat = [1,0,0,0,1,0,0,0,1,0,0,0,1,0,0,0].rotate(3);
    var imp = PulseDivider.kr(~tick.kr,[1,2,4,8]*16,~counter.kr);
    var hit = Select.kr(PulseCount.kr(imp)%pat.size,pat);
    var mod = Select.kr(PulseCount.kr(hit)/4%4,[0.25,0.5,0.75,1.5]/0.5);
    var env = EnvGen.ar(Env([0.001,1,0.001],[0.992*2,0.5],[3,-3],curve:'exp'),imp * hit);
    var sig = LFSaw.ar(432*(mod*pi)/(1+[1,2,3,4].reciprocal)+SinOsc.ar(1/[1,2,3,4]).range(-4,4),(1..8)/16*env) ;
    sig = LPF.ar(sig,800);
    sig = sig * env;
    Splay.ar(sig,0.75,0.5);
  };
  ~sss.play;
);
~sss.stop(7);
~sss.clear;



// sss synth ///////////////////////////////////////

(
  ~sss2.ar(2);
  ~sss2.quant=2;
  ~sss2.fadeTime=4.2;
  ~sss2={
    //         |       |       |       |       |  
    var pat = [1,0,0,0,1,0,0,0,1,0,0,0,1,0,0,0].rotate(3);
    var imp = PulseDivider.kr(~tick.kr,[1,2,4,8]*2,~counter.kr);
    var hit = Select.kr(PulseCount.kr(imp)%pat.size,pat);
    var mod = Select.kr(PulseCount.kr(hit)/4%4,[0.25,0.5,0.75,1.5]/0.125);
    var env = EnvGen.ar(Env([0.001,1,0.001],[0.002,1.5],[3,-3],curve:'exp'),imp * hit);
    var sig = LFSaw.ar(432*(mod*pi)/(1+[1,2,3,4].reciprocal)+SinOsc.ar(1/[1,2,3,4]).range(-4,4),(1..8)/16*env);
    sig = LPF.ar(sig,800);
    sig = sig * env;
    Splay.ar(sig,0.75,0.25);
  };
  ~sss2.play;
);
~sss2.stop(3);
~sss2.clear;



b = Buffer.read(s,Platform.resourceDir ++ "/sounds/violin.wav");

// player synth ///////////////////////////////////////

(
  ~ss.ar(2);
  ~ss.quant=2;
  ~ss.fadeTime=2.02;
  ~ss={
    var mod = [1,-0.5,0.25,0.5];//[-1,0.25,-0.25,8,1/16];
    var spread = 0.0;
    var pos = [0,0.5,0.25,0.75]+LFSaw.kr(1/10/[1,2,3,4]).range(0,0.25);
    //         |       |       |       |       |  
    var pat = [1,0,0,0,1,0,0,0,1,0,0,0,1,0,0,0].rotate(1);
    var imp = PulseDivider.kr(~tick.kr,[1,2,3,4],~counter.kr);
    var hit = Select.kr(PulseCount.kr(imp)%pat.size,pat);
    var env = EnvGen.ar(Env([0.001,1,0.001],[0.0052,0.5],[3,-3],curve:'exp'),imp * hit);
    var sig = PlayBuf.ar(b.numChannels,b.bufnum,BufRateScale.kr(b.bufnum)*mod+(env*0.01),imp, (pos + BrownNoise.ar(1!8).range(spread * -1,spread)) * BufFrames.kr(b.bufnum),1);

    sig = sig * env;
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


// ff filter ///////////////////////////////////////

(
  ~ff.quant=1;
  ~ff.fadeTime=1;
  ~ff={
    var high,mid,low;
    var sig = ~ss + ~sss + ~sss2 + ~hiss + ~kick;

    sig = GVerb.ar(LPF.ar(sig,5000)+HPF.ar(sig,500),40,[3,4,5,6],spread:[40,90])/8 + sig;
    low = CompanderD.ar(LPF.ar(sig,400),3/4,1/2,1/2);
    mid = CompanderD.ar(BPF.ar(sig,600,2),3/4,1/2,1/2);
    high = CompanderD.ar(HPF.ar(sig,900),3/4,1/2,1/2);
    sig = CompanderD.ar((high+mid+low).flat,3/4,1/1.1,1/1.1);
    Splay.ar(sig,0.75,0.25);
  };
  ~ff.play;
);
~ff.stop(7);
~ff.clear;
