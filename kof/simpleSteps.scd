
p.push();

s.latency = 0.2;


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
  sig = Limiter.ar(sig);
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

// simpleOne synth ///////////////////////////////////////

(
~simpleOne.ar(2);
~simpleOne.clock = p.clock;
~simpleOne.quant=16;
~simpleOne.fadeTime=4;
~simpleOne={
  var sig = Pulse.ar([1,1/2,1/3,1/4]/4) * SinOsc.ar(50,Pulse.ar(1/4/[1,2,3,4])*8pi);
  var hiss = Resonz.ar(WhiteNoise.ar(0.05),LFNoise0.kr(1/4!4).range(100,15000)) * DelayN.ar(Pulse.ar(4/[1,2,3,4].nthPrime),1/[8,4,2,1],1/[8,4,2,1]);
  Splay.ar(sig+hiss,0.25,0.15);
};
~simpleOne.play;
);
~simpleOne.stop(16);
~simpleOne.clear;
~simpleOne.pause;
~simpleOne.resume;


// tone synth ///////////////////////////////////////

(
~tone.ar(2);
~tone.clock = p.clock;
~tone.quant=[16,0];
~tone.fadeTime=0.02;
~tone={
  //  |       |       |       |       |  
  var pat = [
    1,0,0,0, 1,0,0,0, 1,0,0,0, 1,0,1,0,
  ].rotate(1);
  var f = Duty.kr([4,16],0,Dseq([60,60,60,60,64,60,67,60,69].midicps/[2,4],inf));
  var imp = PulseDivider.kr(~tick.kr,[4,8],~counter.kr%pat.size);
  var hit = Select.kr(PulseCount.kr(imp)%pat.size,pat);
  var env = {EnvGen.ar(Env([0.001,1,0.0001],[1.002,1.5]*LFNoise2.kr(1/64!4).range(1,4),[3,-3]*LFNoise2.kr(1/64!4).range(-1,10)),imp * hit)};
  var sig = VarSaw.ar(f!2+(env**0.1*4),0,SinOsc.ar(env**LFNoise2.kr(1/4!2).range(1,8)*4)) * SinOsc.ar(f,mul:0.2);
  sig = sig * env;
  sig = Limiter.ar(sig.softclip,0.7);
  Splay.ar(sig,0.25,0.15);
};
~tone.play;
);
~tone.stop(4);
~tone.clear;
~tone.pause;
~tone.resume;
