


p.push();
p.bpm(130);
TempoClock.default = p.clock;
(
  ~master.quant=2;
  ~master.play;
  ~master.fadeTime = 0.01;
  ~master = {|wet=0.45,lp=3500,hp=250,len=10,rev = 3|
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

// kick synth ///////////////////////////////////////

(
~kick.ar(2);
~kick.clock = p.clock;
~kick.quant=[16,0];
~kick.fadeTime=0.02;
~kick={
  //  |       |       |       |       |  
  var pat = [
    1,0,0,0, 1,0,0,0, 1,0,0,0, 1,0,0,0,
    1,0,0,0, 1,0,0,0, 1,0,0,0, 1,0,0,0,
    1,0,0,0, 1,0,0,0, 1,0,0,0, 1,0,0,0,
    1,0,0,0, 1,0,0,0, 1,0,0,0, 1,0,1,0,
  ].rotate(1);
  var imp = PulseDivider.kr(~tick.kr,1,~counter.kr%pat.size);
  var hit = Select.kr(PulseCount.kr(imp)%pat.size,pat);
  var env = EnvGen.ar(Env([0.001,1,0.0001],[0.002,1.5],[3,-3]),imp * hit);
  var sig = SinOsc.ar(50!2,env**20*8pi);
  sig = sig * env;
  Splay.ar(sig,0.75,0.65);
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
    1,0,0,0, 1,0,1,0, 1,0,1,0, 1,0,1,0,
  ].rotate(1);
  var imp = PulseDivider.kr(~tick.kr,[1,2,3,4],~counter.kr%pat.size);
  var hit = Select.kr(PulseCount.kr(imp)%pat.size,pat);
  var env = EnvGen.ar(Env([0.001,1,0.0001],[0.002,0.05],[3,-3]),imp * hit);
  var sig = WhiteNoise.ar(1!2);
  sig = sig * env;
  Splay.ar(sig,0.75,0.5);
};
~hiss.play;
);
~hiss.stop(4);
~hiss.clear;
~hiss.pause;
~hiss.resume;

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

// one synth ///////////////////////////////////////

(
~one.ar(2);
~one.clock = p.clock;
~one.quant=16;
~one.fadeTime=4;
~one={
  var mod = Duty.kr(16*[1,2,3,4]/~tempo,0,Dseq([1,2,1.5,1.33333,4,2,1],inf)) * 2;
  var f = [60,64,72,36].midicps/mod;
  var sig = Integrator.ar(SinOsc.ar(f,Pulse.ar(~tempo/[1,2,3,4])),LFTri.ar(~tempo/4/[1,2,3,4])**5.2,LFTri.ar(f+0.0012)**2.2);
  sig = sig;
  sig = LeakDC.ar(sig);
  Splay.ar(sig,0.5,0.25);
};
~one.play;
);

// one synth ///////////////////////////////////////

(
~one2.ar(2);
~one2.clock = p.clock;
~one2.quant=16;
~one2.fadeTime=4;
~one2={
  var mod = Duty.kr(32*[1,2,3,4]/~tempo,0,Dseq([1,2,1.5,1.33333,4,2,1],inf));
  var f = [60,64,72,36].midicps/mod;
  var sig = Integrator.ar(SinOsc.ar(f,Pulse.ar(~tempo/[1,2,3,4])),LFTri.ar(~tempo/4/[1,2,3,4])**5.2,LFTri.ar(f+0.01)**2.2);
  sig = sig.tanh.sqrt;
  sig = LeakDC.ar(sig);
  Splay.ar(sig,0.5,0.15);
};
~one2.play;
);

// one synth ///////////////////////////////////////

(
~one3.ar(2);
~one3.clock = p.clock;
~one3.quant=16;
~one3.fadeTime=4;
~one3={
  var mod = Duty.kr(64*[1,2,3,4]/~tempo,0,Dseq([1,2,1.5,1.33333,4,2,1],inf)) / 1.5;
  var f = [60,64,72,36].midicps/mod;
  var sig = Integrator.ar(SinOsc.ar(f,Pulse.ar(~tempo/[1,2,3,4])),LFTri.ar(~tempo/4/[1,2,3,4])**5.2,LFTri.ar(f+0.1)**2.2);
  sig = sig.sqrt;
  sig = LeakDC.ar(sig);
  Splay.ar(sig,0.5,0.095);
};
~one3.play;
);
)

~one3.stop(4);
~one3.clear;
~one3.pause;
~one3.resume;
