






p.disconnect()
p.push();
s.latency = 0.4;


p.bpm;

(
  ~master.quant=2;
  ~master.play;
  ~master.fadeTime = 0.01;
  ~master = {|wet=0.15,lp=3500,hp=250,len=10,rev = 3|
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

// one synth ///////////////////////////////////////

(
~one.ar(2);
~one.clock = p.clock;
~one.quant=16;
~one.fadeTime=8;
~one={
  var sig = SinOsc.ar(50,Pulse.ar(2)) * Pulse.ar(4);
  Splay.ar(sig,0.05,0.25);
};
~one.play;
);
~one.stop(4);
~one.clear;
~one.pause;
~one.resume;

// hiss synth ///////////////////////////////////////

(
~hiss.ar(2);
~hiss.clock = p.clock;
~hiss.quant=[16,0];
~hiss.fadeTime=0.02;
~hiss={
  //  |       |       |       |       |  
  var pat = [
    1,1,1,1,
  ].rotate(1);
  var len = LFNoise2.kr(1/16!8).range(0.01,0.24);
  var mod = LFNoise2.kr(1/16!8).range(-1,-8);
  var imp = PulseDivider.kr(~tick.kr,(1..8));
  var hit = Select.kr(PulseCount.kr(imp)%pat.size,pat);
  var env = {EnvGen.ar(Env([0.001,1,0.0001],[0.02,len],[mod,-1 * mod]),imp * hit)};
  var sig = WhiteNoise.ar(env);
  sig = Resonz.ar(sig,16000/8*(1..8),LFNoise2.kr(1/4!8).range(0.1,0.9),mul:LFNoise2.kr(1/8!8));
  sig = LPF.ar(sig,16000/8*(1..8),LFNoise2.kr(1/4!8).range(0.1,0.9),mul:LFNoise2.kr(1/8!8));
  sig = Mix(sig) * env;
  sig = Compander.ar(sig,~one.ar,0.1,1,0.1);
  Splay.ar(sig,0.05,0.85);
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



~saw.clear(10)
