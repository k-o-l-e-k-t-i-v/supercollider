


(
  p=ProxySpace.push(s.boot);
  p.makeTempoClock;
);


(
  p.clock.tempo_(240/60);

  ~offset = (0..7)/8;

  ~tick.quant = 1;
  ~tick = {Mix(Impulse.kr( ~tempo / 2 , ~offset ))};

  ~counter = {PulseCount.kr(~tick.kr)};
);





// neuKick synth ///////////////////////////////////////

(
  ~neuKick.quant=4;
  ~neuKick.fadeTime=0.2;
  ~neuKick={
    //         |       |       |       |       |  
    var pat = [1,0,0,0,1,1,0,0,1,0,0,0,1,1,0,0].rotate(1);
    var imp = PulseDivider.kr(~tick.kr,4,~counter.kr);
    var hit = Select.kr(PulseCount.kr(imp)%pat.size,pat);
    var env = EnvGen.ar(Env([0.001,1,0.001],[0.02,1.5],[3,-3],curve:'exp'),imp * hit);
    var sig = Mix.ar(SinOsc.ar(50+(env**40*250),SinOsc.ar(24*(env**(1..8))).range(-2pi,2pi),mul:0.33));
    sig = sig * env;
    Splay.ar(sig,0.75,0.25);
  };
  ~neuKick.play;
);
~neuKick.stop(7);
~neuKick.clear;

// hat synth ///////////////////////////////////////

(
  ~hat.quant=4;
  ~hat.fadeTime=0.2;
  ~hat={
    //         |       |       |       |       |  
    var pat = [1,0,0,0,1,0,0,0,1,0,0,0,1,0,0,0].rotate(3);
    var imp = PulseDivider.kr(~tick.kr,4,~counter.kr);
    var hit = Select.kr(PulseCount.kr(imp)%pat.size,pat);
    var env = EnvGen.ar(Env([0.001,1,0.001],[0.02,0.25],[3,-3],curve:'exp'),imp * hit);
    var sig = Crackle.ar(0.4+env) + WhiteNoise.ar(0.1);
    sig = sig * env;
    Splay.ar(sig,0.75,0.25);
  };
  ~hat.play;
);
~hat.stop(7);
~hat.clear;

// longnoise synth ///////////////////////////////////////

(
  ~longnoise.quant=2;
  ~longnoise.fadeTime=0.2;
  ~longnoise={
    //         |       |       |       |       |  
    var pat = [1,0,0,0,1,0,0,0,1,0,0,0,1,0,0,0].rotate(1);
    var imp = PulseDivider.kr(~tick.kr,32,~counter.kr);
    var hit = Select.kr(PulseCount.kr(imp)%pat.size,pat);
    var env = EnvGen.ar(Env([0.001,1,0.001],[4.002,0.25],[-3,3],curve:'exp'),imp * hit);
    var sig = Crackle.ar(LFNoise2.kr(1/16).range(0.1,0.9)+(env));
    sig = sig * env;
    Splay.ar(sig,0.75,0.155);
  };
  ~longnoise.play;
);
~longnoise.stop(7);
~longnoise.clear;

// mld synth ///////////////////////////////////////

(
  ~mld.quant=2;
  ~mld.fadeTime=0.2;
  ~mld={
    //         |       |       |       |       |  
    var pat = [1,0,0,0,1,0,0,0,1,0,0,0,1,0,0,0].rotate(3);
    var imp = PulseDivider.kr(~tick.kr,[16,32,64]/8,~counter.kr);
    var hit = Select.kr(PulseCount.kr(imp)%pat.size,pat);
    var mod = Select.kr(PulseCount.kr(hit)/2%4,[1,1.5,1.25,2]);
    var mod2 = Select.kr(PulseCount.kr(hit)/8%8,[1,1.5,8,2,4,16,0.5,1]);
    var env = EnvGen.ar(Env([0.001,1,0.001],[0.0052,1.5],[3,-3],curve:'exp'),imp * hit);
    var sig = Mix.ar(LFSaw.ar(432*mod2/mod + SinOsc.ar(1/4/[2,3,4]/(1..8)).range(-2,2),mul:0.5/(1..8)));
    sig = MoogFF.ar(sig,432*[1,1.5,3]/mod,[1,2,2.25]).distort;
    sig = OnePole.ar(sig,0.95*env);
    sig = sig * env;
    Splay.ar(sig,0.75,0.25);
  };
  ~mld.play;
);
~mld.stop(7);
~mld.clear;

// ss filter ///////////////////////////////////////

(
  ~ss.quant=1;
  ~ss.fadeTime=1;
  ~ss={
    var high,mid,low;
    var ghigh,gmid,glow;
    var sig = ~neuKick.ar + ~hat.ar + ~mld.ar + ~longnoise.ar;

    low = CompanderD.ar(LPF.ar(sig,200),3/4,1/2,1/2);
    mid = CompanderD.ar(BPF.ar(sig,400,2),3/4,1/2,1/2);
    high = CompanderD.ar(HPF.ar(sig,900),3/4,1/2,1/2);
    glow = GVerb.ar(low,30,spread:45)/2;
    gmid = GVerb.ar(mid,40,spread:50)/4;
    ghigh = GVerb.ar(high,60,spread:95)/8;
    sig = (glow+gmid+ghigh).flat + sig;
    Splay.ar(sig,0.55,0.5);
  };
  ~ss.play;
);
~ss.stop(7);
~ss.clear;
