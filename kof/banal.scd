



(
  ~master.quant=2;
  ~master.play;
  ~master.fadeTime = 0.01;
  ~master = {|wet=0.25,lp=3500,hp=250,len=10,rev = 1.5|
  var sig = In.ar([0,1]);
  var orig = sig;
  var fx;
  //fx = Limiter.ar(sig,0.95);
  sig = Compander.ar(sig,3/4,1/2,1/3);
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
  p=ProxySpace.push(s.boot);
  p.makeTempoClock;
);

(
  s.latency=0;
  p.clock.tempo_(130/60);
  p.arProxyNames.do(p[_.asSymbol].rebuild);
  ~tick.kr(1);
  ~tick.clock = p.clock;
  ~tick.quant=4;
  ~counter.clock = p.clock;
  ~counter.quant = 4;
  ~counter = {PulseCount.kr(~tick.kr);};
  ~tick = { Impulse.kr(~tempo*4); };
);

(
  ~tick.kr(1);
  ~tick.clock = p.clock;
  ~tick.quant=1;
  ~tick = { Impulse.kr(~tempo * 4); };
  ~counter = {PulseCount.kr(~tick.kr);};
);    




// one synth ///////////////////////////////////////

(
~one.ar(2);
~one.clock = p.clock;
~one.quant=[2,1/2];
~one.fadeTime=4;
~one={
  var sig = SinOsc.ar(60!2,Pulse.ar(1/2/[1,2,3,4]*~tempo)) * Pulse.ar(2/[1,2,3,4] * ~tempo);
  Splay.ar(sig.softclip.clip(-0.9,0.9),0.95,0.15);
};
~one.play;
);
~one.stop(4);
~one.clear;
~one.pause;
~one.resume;

// two synth ///////////////////////////////////////

(
~two.ar(2);
~two.clock = p.clock;
~two.quant=[2];
~two.fadeTime=0.2;
~two={
  //         |       |       |       |       |  
  var pat = [1,1,1,1];
  var imp = PulseDivider.kr(~tick.kr,[1,2,3,4],~counter.kr%pat.size);
  var hit = Select.kr(PulseCount.kr(imp)%pat.size,pat);
  var env = EnvGen.ar(Env([0.001,1,0.0001],[0.002,[0.005,0.2,0.7,0.9]*4],[-3,[-1,-2,-4,-8]]),imp * hit);
  var dist = LFDNoise1.kr(1/32!4*~tempo).range(0.1,4);
  var am = LFDNoise1.kr(1/32!4*~tempo).range(0.1,0.9);
  var freq = Duty.kr(16/~tempo*[1,2,3,4],0,Dseq([60,64,60,67,60,71,65,60,63]-12,inf)).midicps * [1,1,2,4];
  var mod = Duty.kr(1/~tempo/[1,2,3,4],0,Dseq([1,2,1.5,1.333],inf));
  var sig = VarSaw.ar(freq/mod,env**2,env**dist*am,mul:0.2);
  
  sig = sig * env;
  sig = MoogFF.ar(sig,freq/mod,1.1+(env**0.2))+sig;
  Splay.ar(sig,0.75,0.5);
};
~two.play;
);
~two.stop(4);
~two.clear;
~two.pause;
~two.resume;


