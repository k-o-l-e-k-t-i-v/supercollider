

p.push();
s.latency = 0.2;
~tempo={1};
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
~one.quant=2;
~one.fadeTime=4;
~one={
    var detune = LFNoise1.kr(~tempo/16!10)**2;
    var mod = SinOsc.kr(~tempo/16/[1,2,3]).range(-0.15*detune,0.15*detune)+1;
  var sig = Formant.ar(50*[1,1.5,2]/mod,[200,250,150]+SinOsc.kr(~tempo/16/(1..10)).range(-100,100),[500,1500,5000]*LFTri.kr(~tempo/4/(1..10)).range(0.025,1) ) * LFTri.kr(~tempo/[3,5,7]/16) + 1;
  sig = SinOsc.ar(~tempo/8/[1,2,3],sig*pi,mul:0.95);
  sig = LeakDC.ar(sig);
  sig = AllpassC.ar(sig,4,(1..10)/5000,4);
  sig = LPF.ar(sig,7500);
  sig = sig + WhiteNoise.ar(0.001);
  Splay.ar(sig,0.5,0.25);
};
~one.play;
);
~one.stop(4);
~one.clear;
~one.pause;
~one.resume;

(
  ~master.quant=2;
  ~master.play;
  ~master.fadeTime = 0.01;
  ~master = {|wet=0.05,lp=3500,hp=250,len=10,rev = 3|
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
