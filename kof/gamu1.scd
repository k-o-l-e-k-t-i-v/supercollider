




p.push()


p.diconnect;
p.connect(\kof);

p.bpm(120);

(
  ~master.quant=2;
  ~master.play;
  ~master.fadeTime = 0.01;
  ~master = {|wet=0.65,lp=3500,hp=250,len=10,rev = 3|
  var sig = In.ar([0,1]);
  var orig = sig;
  var fx;
  //fx = Limiter.ar(sig,0.95);
  sig = Compander.ar(sig,3/4,1/1.1,1/3);
  fx = LPF.ar(sig,lp);
  fx = HPF.ar(fx,hp);
  fx = DWGReverb.ar(NumChannels.ar(fx,2),[5000,5010],1/len)/rev;
  sig = SelectX.ar(wet,[orig,fx]);
  sig = NumChannels.ar(sig,2);
  ReplaceOut.ar(0,sig);
  };
);
p.moveNodeToTail(\master);

(
  //s.latency=0.2;
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

// one synth ///////////////////////////////////////

(
~one.ar(2);
~one.clock = p.clock;
~one.quant=16;
~one.fadeTime=0.04;
~one={
  var sig = SinOsc.ar(60!2,Pulse.ar(4)) * Pulse.ar(1/16);
  Splay.ar(sig,0.5,0.5);
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
~kick.clock = p.clock;
~kick.quant=[16,0];
~kick.fadeTime=4.02;
~kick={
  //  |       |       |       |       |  
  var pat = [
    1,0,0,0, 1,0,0,0, 1,0,0,0, 1,0,0,0,
    1,0,0,0, 1,0,0,0, 1,0,0,0, 1,0,0,0,
    1,0,0,0, 1,0,0,0, 1,0,0,0, 1,0,0,0,
    1,0,0,0, 1,0,0,0, 1,0,0,0, 1,0,1,0,
  ].rotate(1);
  var mod = LFNoise2.kr(1/4!2).range(60,90);
  var imp = PulseDivider.kr(~tick.kr,1);
  var hit = Select.kr(PulseCount.kr(imp)%pat.size,pat);
  var env = {EnvGen.ar(Env([0.001,1,0.0001],[0.002,0.5] * LFNoise2.kr(1/64!2).range(1,4),[10,-3]),imp * hit)};
  var sig = SinOsc.ar([50,50.1]+(env**20*400),env*mod*8pi) + VarSaw.ar([50,50.1,100],0,env**[8,7]*0.5);
  sig = sig * env;
  Splay.ar(sig,0.05,0.25);
};
~kick.play;
);
~kick.stop(4);
~kick.clear;
~kick.pause;
~kick.resume;

// hiss synth ///////////////////////////////////////

(
~hiss.ar(2);
~hiss.clock = p.clock;
~hiss.quant=[16,0];
~hiss.fadeTime=0.02;
~hiss={
  //  |       |       |       |       |  
  var pat = [
    1,0,1,0, 1,0,1,0, 1,0,1,0, 1,1,1,1,
    1,0,1,0, 1,0,1,0, 1,0,1,0, 1,1,1,1,
    1,0,1,0, 1,0,1,0, 1,0,1,0, 1,1,1,1,
    1,0,1,0, 1,1,1,1, 1,0,1,0, 1,1,1,1,
  ].rotate(3);
  var imp = PulseDivider.kr(~tick.kr,[1,2,3,4]);
  var hit = Select.kr(PulseCount.kr(imp)%pat.size,pat);
  var env = {EnvGen.ar(Env([0.001,1,0.0001],[0.002,0.0155]*LFNoise2.kr(1/4!4).range(1,8),[3,-3]),imp * hit)};
  var sig = WhiteNoise.ar(0.7!4);
  sig = Resonz.ar(sig,LFNoise0.kr(1/16!4).range(50,15000),LFNoise2.kr(1/4!4).range(0.1,0.5));
  sig = sig * env;
  Splay.ar(sig,0.75,0.5);
};
~hiss.play;
);
~hiss.stop(4);
~hiss.clear;
~hiss.pause;
~hiss.resume;

// one synth ///////////////////////////////////////

(
~one.ar(2);
~one.clock = p.clock;
~one.quant=16;
~one.fadeTime=0.04;
~one={
  //var sig = VarSaw.ar(50*[8,4,1,1.5],0,Pulse.ar(1/4/[1,2,3,4]),mul:0.1) *;
  //var sig = Pulse.ar(1/4/[1,2,3,4,5,6,7,8]) + ;
  var sig = (Pulse.ar(4/[1,2,3,4],mul:0.72) * SinOsc.ar(50,Pulse.ar(1/4/[1,2,3,4])));
  sig = VarSaw.ar(20000/[8,4,1,1.5]/1.33335,0,Pulse.ar(2/[1,2,3,4]),mul:0.04) * DelayN.ar(Pulse.ar(4/[1,2,3,4]),1/8) + sig;
  sig = CompanderD.ar(sig,3/4,1/2,1/2);
  Splay.ar(sig,0.05,0.95);
};
~one.play;
);
~one.stop(16);
~one.clear;
~one.pause;
~one.resume;


// tar synth ///////////////////////////////////////

(
~tar.ar(2);
~tar.clock = p.clock;
~tar.quant=16;
~tar.fadeTime=16;
~tar={
  var mod = Duty.kr(32,0,Dseq([1,2,1.5,1.33333],inf))  ;
  var sig = VarSaw.ar([50,75,100]*mod,0,SinOsc.ar([[50,75.01,5],4.01]) + Pulse.ar(4/[1,2,3,4])) ** LFNoise0.kr(1/4!4).range(0.05,8.5);
  Splay.ar(sig,0.5,0.15);
};
~tar.play;
);
~tar.stop(4);
~tar.clear;
~tar.pause;
~tar.resume;

(
//////////////////////////  FADE -> OUT ///////////////////////////////////////////////////////
{
  p.arProxyNames.do({|synth| if(synth.asSymbol!=\master){p[synth.asSymbol].clear(20);};});
}.fork;  
)


(
  //s.latency=0.2;
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
