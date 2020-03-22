

p.push();


p.bpm(121.35)

(
  //s.latency=0.2;
  //p.clock.tempo_(120/60);
  p.arProxyNames.do({|synth| if(synth.asSymbol!=\master){p[synth.asSymbol].rebuild;};});
  ~tick.kr(1);
  ~tick.quant = 24;
  ~counter.quant = 24;
  ~counter = {PulseCount.kr(~tick.kr);};
  ~tick = { Impulse.kr( ~tempo * 4 ); };
);


// switcher_one synth ///////////////////////////////////////

(
~switcher_one.ar(2);
~switcher_one.quant=24;
~switcher_one.fadeTime=0.2;
~switcher_one={
  //         |       |       |       |       |  
  var pat = [1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0].rotate(1);
  var imp = PulseDivider.kr(~tick.kr,[1,2,3,4],~counter.kr % pat.size);
  var hit = Select.kr(PulseCount.kr(imp)%pat.size,pat);
  var env = EnvGen.ar(Env([0.001,1,0.0001],[0.002,2.5],[3,-3],curve:'exp'),imp * hit);
  var sig = [
  SinOsc.ar(50!2),
  LFSaw.ar(500!2,mul:0.4),
  LFTri.ar(1500!2,mul:0.5),
  LFPulse.ar(50!2),
  BrownNoise.ar(0.1!2),
  LFSaw.ar(5000,mul:0.3)
 ];
  sig = Select.ar(PulseCount.kr(imp*hit)%sig.size,sig);
  //sig = sig * env;
  sig = sig * (LFTri.ar(~tempo/4/[1,2,3,4])**2);
  Splay.ar(sig,0.95,0.15);
};
~switcher_one.play;
);
~switcher_one.stop(4);
~switcher_one.clear;
~switcher_one.pause;
~switcher_one.resume;

// hiss synth ///////////////////////////////////////

(
~hiss.ar(2);
~hiss.quant=[24,0];
~hiss.fadeTime=0.02;
~hiss={
  //  |       |       |       |       |  
  var pat = [
    1,0,0,0, 1,0,0,0, 1,0,0,0, 1,0,0,0, 1,0,0,0, 0,0,0,0,
    1,0,0,0, 1,0,0,0, 1,0,0,0, 1,0,0,0, 1,0,0,1, 0,1,1,1,
    1,0,0,0, 1,0,0,0, 1,0,0,0, 1,0,0,0, 1,0,0,0, 0,0,0,0,
    1,0,0,0, 1,0,0,0, 1,0,0,0, 1,0,0,0, 1,1,1,1, 0,0,0,0
  ].rotate(3);
  var imp = PulseDivider.kr(~tick.kr,[1,2,3,4],~counter.kr%pat.size);
  var hit = Select.kr(PulseCount.kr(imp)%pat.size,pat);
  var env = EnvGen.ar(Env([0.001,1,0.0001],[0.002,0.25],[3,-3]),imp * hit);
  var sig = WhiteNoise.ar(0.9!2);
  sig = sig * env;
  sig = HPF.ar(sig,5000);
  Splay.ar(sig,0.45,0.25);
};
~hiss.play;
);
~hiss.stop(4);
~hiss.clear;
~hiss.pause;
~hiss.resume;

// kick synth ///////////////////////////////////////

(
~kick.ar(2);
~kick.quant=[24,0];
~kick.fadeTime=0.02;
~kick={
  //  |       |       |       |       |  
  var pat = [
    1,0,0,0, 1,0,0,0, 1,0,0,0, 1,0,0,0, 1,0,0,0 ,1,0,1,0
  ].rotate(1);
  var imp = PulseDivider.kr(~tick.kr,1,~counter.kr%pat.size);
  var hit = Select.kr(PulseCount.kr(imp)%pat.size,pat);
  var env = EnvGen.ar(Env([0.001,1,0.0001],[0.002,1.5],[3,-3]),imp * hit);
  var sig = SinOsc.ar(50 + (env**50*150),env**40*2pi);
  sig = sig * env;
  Splay.ar(sig,0.0,0.25);
};
~kick.play;
);
~kick.stop(4);
~kick.clear;
~kick.pause;
~kick.resume;

b=Buffer.alloc(s,48000,2);
d=0.337;
(
  ~master.quant=24;
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
  sig = BufDelayN.ar(b,sig,d);
  ReplaceOut.ar(0,sig);
  };
);
p.moveNodeToTail(\master);
