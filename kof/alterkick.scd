s = Server.default;
p = NetProxy.push();
r.restartClock();


p.bpm(127)


(
  s.latency=1;
  //p.clock.tempo_(120/60);
  p.arProxyNames.do({|synth| if(synth.asSymbol!=\master){p[synth.asSymbol].rebuild;};});
  ~tick.kr(1);
  ~tick.clock = p.clock;
  ~tick.quant=16;
  ~counter.clock = p.clock;
  ~counter.quant = 16;
  ~counter = {PulseCount.kr(~tick.kr);};
  ~tick = { Impulse.kr(~tempo * 4); };
);

(
  ~master.quant=2;
  ~master.play;
  ~master.fadeTime = 0.01;
  ~master = {|wet=0.25,lp=3500,hp=250,len=10,rev = 3|
  var sig = In.ar([0,1]);
  var orig = sig;
  var fx;
  //fx = Limiter.ar(sig,0.95);
  fx = LPF.ar(sig,lp);
  fx = LPF.ar(sig,lp);
  fx = HPF.ar(fx,hp);
  fx = HPF.ar(fx,hp);
  fx = DWGReverb.ar(NumChannels.ar(fx,2),[5000,5010],1/len)/rev;
  sig = SelectX.ar(wet,[orig,fx]);
  sig = NumChannels.ar(sig,2);
  ReplaceOut.ar(0,sig);
  };
);
p.moveNodeToTail(\master);

// hiss synth ///////////////////////////////////////

(
~hiss.ar(2);
~hiss.clock = p.clock;
~hiss.quant=[16,0];
~hiss.fadeTime=0.02;
~hiss={
  //  |       |       |       |       |  
  var pat = [
    [1,1,1,0, 1,0,1,0, 1,0,1,0, 1,1,1,1],
    [1,0,1,0, 1,0,1,0, 1,1,0, 1,1,1,1],
    [1,0,0,0, 1,0,0,0, 1],
    [1,1,1,1, 1],
  ];
  var imp = PulseDivider.kr(~tick.kr,[1,2,7,9]);
  var hit = Select.kr(PulseCount.kr(imp)%pat.size,pat);
  var env = {EnvGen.ar(Env.asr(0.001,0.4,LFNoise2.kr(1!4).exprange(0.02,0.5),-3),imp * hit)};
  var sig = WhiteNoise.ar(0.2!4);
  sig = BPF.ar(sig,LFNoise1.kr(~tempo!4).range(500,[1500,1500/2,12000,150]),LFNoise2.kr(1!4).range(0.1,0.9));
  sig = sig * env;
  Splay.ar(sig,0.25,0.35);
};
~hiss.play;
);
~hiss.stop(4);
~hiss.clear;
~hiss.pause;
~hiss.resume;


// boring_kick synth ///////////////////////////////////////

(
~boring_kick.ar(2);
~boring_kick.clock = p.clock;
~boring_kick.quant=[16,0];
~boring_kick.fadeTime=0.02;
~boring_kick={
  //  |       |       |       |       |  
  var pat = [
    [1,0,0,0, 1,0,0,0, 1,0,0,0, 1,0,0,0,0,0,0],
    [1,0,0,0, 1,0,0,0, 1,0,0,0,0,0],
    [1,0,0,0, 1,0,0,0,0],
    [1,0,0,0]
  ];
  var curve = LFNoise2.kr(~tempo/32).range(-0.1,-4.5);
  var len = LFNoise2.kr(~tempo/4).range(0.5,0.25);
   var imp = PulseDivider.kr(~tick.kr,1);
  var hit = Select.kr(PulseCount.kr(imp)%pat.size,pat);
  var env = {EnvGen.ar(Env.asr(0.05,len/2,len,1,curve),imp * hit)};
  var sig = SinOsc.ar(50!2,env**80*8pi);
  sig = sig * env;
  Splay.ar(sig,0.05,0.75);
};
~boring_kick.play;
);
~boring_kick.stop(4);
~boring_kick.clear;
~boring_kick.pause;
~boring_kick.resume;

// kick synth ///////////////////////////////////////

(
~kick.ar(2);
~kick.clock = p.clock;
~kick.quant=[16,0];
~kick.fadeTime=0.02;
~kick={
  //  |       |       |       |       |  
  var pat = [
    [1,0,1,0, 1,0,1,0, 1,0,1,0, 1,0,1],
    [1,0,1,1, 1,0,1,0, 1,0,1,0, 1,0],
    [1,0,1,0, 1,0,1,0, 1,1,1,0],
    [1,0,1,0, 1,0,1,0, 1,0,1],
  ];
  var mel = Duty.kr(8/~tempo,0,Dseq([1,2,1.5,1.33333],inf));
  var curve = LFNoise2.kr(~tempo/32).range(-0.1,-8.5);
  var len = LFNoise2.kr(~tempo/4).range(0.21,0.5);
  var imp = PulseDivider.kr(~tick.kr,[1,2,3,4]);
  var hit = Select.kr(PulseCount.kr(imp)%pat.size,pat);
  var env = {EnvGen.ar(Env.asr(0.002,len*[1,1.2,1.1,1.3],len*[1,1.2,1.3,1.4],curve),imp * hit)};
  var sig = SinOsc.ar(50,env**(curve)*8pi);
  sig = sig * env;
  Splay.ar(sig,0.05,0.15);
};
~kick.play;
);
~kick.stop(4);
~kick.clear;
~kick.pause;
~kick.resume;

(
  ~master.quant=4;
  ~master.play;
  ~master.fadeTime = 0.01;
  ~master = {|wet=0.15,lp=3500,hp=250,len=10,rev = 3|
  var sig = In.ar([0,1]);
  var orig = sig;
  var fx;
  sig = Compander.ar(sig,~kick.ar,3/4,1,1/2);
  sig = Limiter.ar(sig,0.95);
  fx = LPF.ar(sig,lp);
  fx = HPF.ar(fx,hp);
  fx = DWGReverb.ar(NumChannels.ar(fx,2),[5000,5010],1/len)/rev;
  sig = SelectX.ar(wet,[orig,fx]);
  sig = NumChannels.ar(sig,2);
  ReplaceOut.ar(0,sig);
  };
p.moveNodeToTail(\master);
);
