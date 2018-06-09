

s.reboot;
p.push();
p.bpm(120*4);

// one synth ///////////////////////////////////////

(
~one.ar(2);
~one.clock = p.clock;
~one.quant=4;
~one.fadeTime=2;
~one={
  var sig = VarSaw.ar(50,0,Pulse.ar(1/4)) * Pulse.ar(4);
  //sig = sig * VarSaw.ar(600/2/[1,1.5,1.3333334,2],mul:LFTri.ar(4/[1,2,3,4]));
  Splay.ar(sig,0.15,0.25);
};
~one.play;
);
~one.stop(7);
~one.clear(8);
~one.pause;
~one.resume;

// oneone synth ///////////////////////////////////////

(
~oneone.ar(2);
~oneone.quant=4;
~oneone.fadeTime=0.2;
~oneone={
  //         |       |       |       |       |  
  var pat = [
      1,0,0,0,1,0,0,0,1,0,0,0,1,0,0,0,
      1,0,0,0,1,0,0,0,1,0,0,0,1,0,0,0,
      1,0,0,0,1,0,0,0,1,0,0,0,1,0,0,0,
      1,0,0,0,1,0,0,0,1,0,0,0,1,0,0,0,
  ].rotate(1);
  var imp = PulseDivider.kr(~tick.kr,[1,2,3,4],~counter.kr % pat.size);
  var hit = Select.kr(PulseCount.kr(imp)%pat.size,pat);
  var env = {EnvGen.ar(Env([0.001,1,0.0001],[0.002,1.45]*MouseX.kr(0,4),[3,-3],curve:'exp'),imp * hit)};
  var sig = [
  SinOsc.ar(50!2,Pulse.ar(4)),
  PinkNoise.ar(0.4!3),
  SinOsc.ar(5000,Pulse.ar(4),mul:0.1),
  WhiteNoise.ar(0.4)
  ];
  sig = [
    HPF.ar(sig,8000/[1,2,3,4]),
    LPF.ar(sig,5000),
    BPF.ar(sig,600),
    sig
  ].scramble;
  sig = Select.ar(PulseCount.kr(imp*hit)%sig.size,sig);
  sig = sig * env;
  Splay.ar(sig,0.75,0.25);
};
~oneone.play;
);
~oneone.stop(4);
~oneone.clear;
~oneone.pause;
~oneone.resume;

// hiss synth ///////////////////////////////////////

(
~hiss.ar(2);
~hiss.clock = p.clock;
~hiss.quant=[16,0];
~hiss.fadeTime=0.02;
~hiss={
  //  |       |       |       |       |  
  var pat = [
    1,0,0,0, 1,0,0,0, 1,0,0,0, 0,0,0,0,
    1,0,0,0, 0,0,0,0, 0,0,0,0, 0,0,0,0,
    1,0,0,0, 1,0,0,0, 1,0,0,0, 0,0,0,0,
    1,0,0,0, 0,0,0,0, 0,0,0,0, 1,1,1,1,
  ].rotate(3);
  var imp = PulseDivider.kr(~tick.kr,[1,2,3,4],~counter.kr%pat.size);
  var hit = Select.kr(PulseCount.kr(imp)%pat.size,pat);
  var env = {EnvGen.ar(Env([0.001,1,0.0001],[0.002,0.25]*MouseX.kr(0,8),[3,-3]),imp * hit)};
  var sig = WhiteNoise.ar(0.002!4);
  sig = RHPF.ar(sig,LFSaw.ar(4/[1,2,3,4]).range(500,15000),LFTri.ar(1/2/[1,2,3,4])**2);
  sig = sig * env;
  Splay.ar(sig,0.75,0.15);
};
~hiss.play;
);
~hiss.stop(4);
~hiss.clear;
~hiss.pause;
~hiss.resume;


(
//////////////////////////  FADE -> OUT ///////////////////////////////////////////////////////
{
  p.arProxyNames.do({|synth| if(synth.asSymbol!=\master){p[synth.asSymbol].clear(20);};});
}.fork;  
)


// one synth ///////////////////////////////////////

(
~one.ar(2);
~one.clock = p.clock;
~one.quant=4;
~one.fadeTime=4;
~one={
  var sig = SinOsc.ar(50!2,Pulse.ar(8));
  Splay.ar(sig,0.5,0.25);
};
~one.play;
);
~one.stop(4);
~one.clear;
~one.pause;
~one.resume;


// lala synth ///////////////////////////////////////

(
~lala.ar(2);
~lala.clock = p.clock;
~lala.quant=4;
~lala.fadeTime=4;
~lala={
    var mod = Duty.kr(16/~tempo,0,Dseq([1,2,1.5,1.33333],inf));
  var sig = SinOsc.ar([1/16,1/[4,5,6],50/[2,1.5,4/3]]).range(0,2pi);
  sig = Perlin3.ar(sig[0],sig[1],sig.sin)/4 * Pulse.ar(2/[1,2,3]);
  sig = CombL.ar(sig,mod/50,mod/500,1);
  sig = LeakDC.ar(sig);
  Splay.ar(sig,0.5,0.25);
};
~lala.play;
);
~lala.stop(4);
~lala.clear;
~lala.pause;
~lala.resume;

// noisy synth ///////////////////////////////////////

(
~noisy.ar(2);
~noisy.clock = p.clock;
~noisy.quant=4;
~noisy.fadeTime=4;
~noisy={
  var sig = BrownNoise.ar(0.2!4) + SinOsc.ar(100/[1,2,3,4]);
  sig = Resonz.ar(sig,10000*2/[1,1.5,1.33333,1.5]/2,0.02+LFSaw.ar(16).range(0.00001,0.74));
  Splay.ar(sig,0.15,0.25);
};
~noisy.play;
);
~noisy.stop(4);
~noisy.clear;
~noisy.pause;
~noisy.resume;

// two synth ///////////////////////////////////////

(
~two.ar(2);
~two.clock = p.clock;
~two.quant=4;
~two.fadeTime=4;
~two={
    var f = 50;
  var sig = LFSaw.ar(480/2/(1..16)) * SinOsc.ar(50) * LFTri.ar(1/4/[1,2,3,4]) * 2pi;
  sig = Wrap.ar(sig.sin ** sig.cos + sig) * Decay.kr(Impulse.kr(4/(1..16),1/4)) / 4;
  sig = CombN.ar(sig,f,f,2);
  Splay.ar(sig,0.15,0.05,SinOsc.ar(1/4/[1,3,7,13,4,12]));
};
~two.play;
);
~two.stop(4);
~two.clear;
~two.pause;
~two.resume;

// ssw synth ///////////////////////////////////////

(
~ssw.ar(2);
~ssw.quant=16;
~ssw.fadeTime=0.2;
~ssw={
    var mod = Duty.kr(1/8/~tempo,0,Dseq([1,2,1.5,1.33333],inf)).lag(1/600);
  //         |       |       |       |       |  
  var pat = [
      1,0,0,0,1,0,0,0,1,0,0,0,1,0,0,0,
      1,0,0,0,1,0,0,0,1,0,0,0,1,0,0,0,
      1,0,0,0,1,0,0,0,1,0,0,0,1,0,0,0,
      1,0,0,0,1,0,0,0,1,0,0,0,1,0,0,0,
  ].rotate(1);
  var imp = PulseDivider.kr(~tick.kr,[1,16],~counter.kr % pat.size);
  var hit = Select.kr(PulseCount.kr(imp)%pat.size,pat);
  var env = {EnvGen.ar(Env([0.001,1,0.0001],[0.002,2.015]*LFNoise2.kr(~tempo/16),[3,-3],curve:'exp'),imp * hit)};
  var sig = [
  SinOsc.ar(60!2,env**LFSaw.ar(2/4).range(20,120)*8pi),
  WhiteNoise.ar(0.4!2),
  SinOsc.ar(60!2,env**LFSaw.ar(1/8).range(20,60)*2pi),
  PinkNoise.ar(0.2!4)
  ];
  sig = Select.ar(PulseCount.kr(imp*hit)%sig.size,sig);
  sig = CombL.ar(sig,mod*2/50,mod/500,LFSaw.ar(~tempo));
  sig = RLPF.ar(sig,1800*[1,2,4,8],0.2);
  sig = sig * env;
  Splay.ar(sig,0.0005,SinOsc.ar(32/[8.7,5]).range(0,0.015));
};
~ssw.play;
);
~ssw.stop(4);
~ssw.clear;
~ssw.pause;
~ssw.resume;

// kick synth ///////////////////////////////////////

(
~kick.ar(2);
~kick.clock = p.clock;
~kick.quant=[16,0];
~kick.fadeTime=0.02;
~kick={
  //  |       |       |       |       |  
  var pat = [
    1,0,0,0, 0,0,0,0, 0,0,0,0, 0,0,0,0,
    0,0,0,0, 0,0,0,0, 0,0,0,0, 0,0,0,0,
    0,0,0,0, 0,0,0,0, 0,0,0,0, 0,0,0,0,
    0,0,0,0, 0,0,0,0, 0,0,0,0, 1,1,1,1,
    
    1,0,0,0, 0,0,0,0, 0,0,0,0, 0,0,0,0,
    0,0,0,0, 0,0,0,0, 0,0,0,0, 0,0,0,0,
    0,0,0,0, 0,0,0,0, 0,0,0,0, 0,0,0,0,
    0,0,0,0, 0,0,0,0, 1,0,0,0, 1,1,1,1,
    
    1,0,0,0, 0,0,0,0, 0,0,0,0, 0,0,0,0,
    1,0,0,0, 0,0,0,0, 0,0,0,0, 0,0,0,0,
    0,0,0,0, 0,0,0,0, 0,0,0,0, 0,0,0,0,
    0,0,0,0, 0,0,0,0, 0,0,0,0, 1,1,1,1,
    
    1,0,0,0, 0,0,0,0, 0,0,0,0, 0,0,0,0,
    0,0,0,0, 0,0,0,0, 0,0,0,0, 0,0,0,0,
    0,0,0,0, 0,0,0,0, 0,0,0,0, 0,0,0,0,
    0,0,0,0, 0,0,0,0, 1,0,0,0, 0,1,1,1
].rotate(1);

  var imp = PulseDivider.kr(~tick.kr,1,~counter.kr%pat.size);
  var hit = Select.kr(PulseCount.kr(imp)%pat.size,pat);
  var env = EnvGen.ar(Env([0.001,1,0.0001],[0.002,0.15],[3,-3]),imp * hit);
  var sig = SinOsc.ar(60!2+[0.0004,0],env**[63,60]*8pi) + VarSaw.ar(60,env**4,mul:0.75);
  sig = sig * env;
  Splay.ar(sig,0.75,0.5);
};
~kick.play;
);
~kick.stop(4);
~kick.clear;
~kick.pause;
~kick.resume;

(
  ~master.quant=2;
  ~master.play;
  ~master.fadeTime = 0.01;
  ~master = {|wet=0.15,lp=3500,hp=250,len=10,rev = 3|
  var sig = In.ar([0,1]);
  var orig = sig;
  var fx;
  //fx = Limiter.ar(sig,0.95);
  sig = CompanderD.ar(sig,3/4,1/1.1,1/3);
  fx = LPF.ar(sig,lp);
  fx = HPF.ar(fx,hp);
  fx = DWGReverbC1C3.ar(NumChannels.ar(fx,2),[5000,5010],1/len)/rev;
  sig = SelectX.ar(wet,[orig,fx]);
  sig = NumChannels.ar(sig,2);
  ReplaceOut.ar(0,sig);
  };
);
p.moveNodeToTail(\master);

(
  s.latency=0.2;
  //p.clock.tempo_(120/60);
  p.arProxyNames.do({|synth| if(synth.asSymbol!=\master){p[synth.asSymbol].rebuild;};});
  ~tick.kr(1);
  ~tick.clock = p.clock;
  ~tick.quant = 16;
  ~counter.clock = p.clock;
  ~counter.quant = 16;
  ~counter = {PulseCount.kr(~tick.kr);};
  ~tick = { Impulse.kr( ~tempo * 4 ); };
);
