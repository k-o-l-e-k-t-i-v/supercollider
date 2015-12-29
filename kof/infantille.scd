(
  p.clock.tempo_(135/60);

  ~offset = (0..7)/8;

  ~tick.quant = 1;
  ~tick = {Mix(Impulse.kr( ~tempo / 2 , ~offset ))};

  ~counter = {PulseCount.kr(~tick.kr)};
);




// one synth ///////////////////////////////////////

(
  ~one.ar(2);
  ~one.quant=2;
  ~one.fadeTime=1.2;
  ~one={
    var mod3 = Duty.kr(3/~tempo*4,0,Dseq([1,2,4,1.5]/2,inf));
    var mod2 = Duty.kr(6/~tempo*4,0,Dseq([1,2,4,1],inf)).lag(2);
    var mod = Duty.kr(4/~tempo*4,0,Dseq([1,2,1.5,1.25]*mod2*mod3,inf));
    //         |       |       |       |       |  
    var pat = [1,1,1,0].rotate(1);
    var imp = PulseDivider.kr(~tick.kr,[1,2,3,4],~counter.kr);
    var hit = Select.kr(PulseCount.kr(imp)%pat.size,pat);
    var env = EnvGen.ar(Env([0.001,1,0.0001],[0.002,0.25*[1,2,4,8]],[3,-3],curve:'exp'),imp * hit);
    var sig = [
      Dust.ar(500!2),
      SinOsc.ar(1500/mod!2),
      SinOsc.ar(500!2/mod),
      LFSaw.ar(1500/mod!2),
      Pulse.ar(50!2/mod),
      LFNoise1.ar(15000/mod),
      Pulse.ar(4!2),
      SinOsc.ar(1500/1.5/mod),
      LFPulse.ar(250/mod)
    ];
    sig = Select.ar(PulseCount.kr(imp*hit)/[1,2,3,4]%sig.size,sig);
    sig = sig * env * LFNoise2.kr(~tempo!4);
    sig = CombN.ar(sig.distort,1/4,1/[20,1000,50,250]*mod,2)/8+sig;
    sig = LPF.ar(sig,[8000,800,2000,200]) + sig;
    sig = CompanderD.ar(sig,3/4,1/2,1/2);
    Splay.ar(sig.flat,0.25,0.5,SinOsc.ar(1/4));
  };
  ~one.play;
);
~one.stop(4);
~one.clear;
~one.pause;
~one.resume;


// kick synth ///////////////////////////////////////

(
  ~kick.ar(2);
  ~kick.quant=2;
  ~kick.fadeTime=0.2;
  ~kick={
    //         |       |       |       |       |  
    var pat = [1,0,0,0,1,0,0,0,1,0,1,0,1,1,0,0].rotate(1);
    var imp = PulseDivider.kr(~tick.kr,[2,8],~counter.kr);
    var hit = Select.kr(PulseCount.kr(imp)%pat.size,pat);
    var env = EnvGen.ar(Env([0.001,1,0.0001],[0.002,3.5],[3,-3],curve:'exp'),imp * hit);
    var sig = SinOsc.ar(50!2+(env**[100,20]*1000));
    sig = sig * env;
    Splay.ar(sig,0.15,0.95);
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
    var pat = [1,0,1,0,1,1,0,0,1,0,1,0,1,1,0,0].rotate(3);
    var imp = PulseDivider.kr(~tick.kr,[2,8,16],~counter.kr);
    var hit = Select.kr(PulseCount.kr(imp)%pat.size,pat);
    var env = EnvGen.ar(Env([0.001,1,0.0001],[[0.002,1/2,1],0.15],[3,-3],curve:'exp'),imp * hit);
    var sig = [] ++ WhiteNoise.ar(1) ++ BrownNoise.ar(1) ++ LFNoise2.ar(4000);
    sig = sig * env;
    Splay.ar(sig,0.5,0.25,SinOsc.ar(1/4));
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
  var sig = ~one.ar+~kick.ar+~hh.ar;

  sig = Resonz.ar(sig,MouseX.kr(100,10000,(1..8)),MouseY.kr(0.1,1,(1..4)/16))/4;
  sig = CompanderD.ar(sig,3/4,1/2,1/2);
  sig = CombN.ar(sig,4,[4,8,16],32)+sig;
  sig = GVerb.ar(LPF.ar(sig,7000)+HPF.ar(sig,300),100,[3,4],spread:[95,96])/4 + sig;
  low = CompanderD.ar(LPF.ar(sig,LFNoise2.kr(1/2!2).range(100,800)),3/4,1/2,1/2);
  mid = CompanderD.ar(BPF.ar(sig,LFNoise2.kr(1/2!2).range(700,1500),2),3/4,1/2,1/2);
  high = CompanderD.ar(HPF.ar(sig,LFNoise2.kr(1/2!2).range(1000,10000)),3/4,1/2,1/2);
  sig = CompanderD.ar((high+mid+low).flat,3/4,1/1.1,1/1.1);
  Splay.ar(sig,0.75,0.1,SinOsc.ar(1/4));
};
~ff.play;
);
~ff.stop(7);
~ff.clear;
