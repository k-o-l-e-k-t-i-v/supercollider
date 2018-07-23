

s.reboot;
p.push();
p.bpm(60)

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

16**((1..16)/16)

// exp synth ///////////////////////////////////////

(
~exp.ar(2);
~exp.clock = p.clock;
~exp.quant=2;
~exp.fadeTime=1;
~exp={
    var n = 6;
    var mod = 2 + SinOsc.kr(1/16/[1,2,3],mul:0.1);
    var f = 432.337 * 2 / (n*mod**((1..n)/n)) * [1,1.5,2] + SinOsc.ar([4,5,6]*10,mul:pi);
  var sig = BrownNoise.ar(LFNoise1.kr(1/4!6));
  sig = DFM1.ar(sig,f,LFDNoise1.kr(1/16!n).range(0.02,0.4)) * LFTri.kr(1/4/(1..6));
  sig = CombN.ar(sig,2/f,mod/f.lag(0.001),2);
  sig = MoogFF.ar(sig,f.lag(0.001),3.0);
  sig = LeakDC.ar(sig);
  sig = AllpassN.ar(sig,1/4,1/f.lag(0.0001),1);
  Splay.ar(sig,0.5,0.35);
};
~exp.play;
);
~exp.stop(4);
~exp.clear;
~exp.pause;
~exp.resume;

// exp synth ///////////////////////////////////////

(
~exp2.ar(2);
~exp2.clock = p.clock;
~exp2.quant=2;
~exp2.fadeTime=1;
~exp2={
    var n = 6;
    var mod = 4 + SinOsc.kr(1/16/[1,2,3],mul:0.1);
    var f = 432.337 * 4 / (n*mod**((1..n)/n)) * [1,1.5,2] + SinOsc.ar([4,5,6]*10,mul:pi);
  var sig = BrownNoise.ar(LFNoise1.kr(1/4!6));
  sig = DFM1.ar(sig,f,LFDNoise1.kr(1/16!n).range(0.02,0.4)) * LFTri.kr(1/4/(1..6));
  sig = CombN.ar(sig,2/f,mod/f.lag(0.001),2);
  sig = MoogFF.ar(sig,f.lag(0.001),3.0);
  sig = LeakDC.ar(sig);
  sig = AllpassN.ar(sig,1/4,1/f.lag(0.0001),1);
  Splay.ar(sig,0.5,0.35);
};
~exp2.play;
);
~exp2.stop(4);
~exp2.clear;
~exp2.pause;
~exp.resume;

(
//////////////////////////  FADE -> OUT ///////////////////////////////////////////////////////
{
  p.arProxyNames.do({|synth| if(synth.asSymbol!=\master){p[synth.asSymbol].clear(20);};});
}.fork;  
)

(
  ~master.quant=2;
  ~master.play;
  ~master.fadeTime = 0.01;
  ~master = {|wet=0.35,lp=3500,hp=250,len=10,rev = 3|
  var sig = In.ar([0,1]);
  var orig = sig;
  var fx;
  //fx = Limiter.ar(sig,0.95);
  sig = CompanderD.ar(sig,3/4,1/1.1,3);
  fx = LPF.ar(sig,lp);
  fx = HPF.ar(fx,hp);
  fx = DWGReverbC1C3.ar(NumChannels.ar(fx,2),[5000,5010],1/len)/rev;
  sig = SelectX.ar(wet,[orig,fx]);
  sig = NumChannels.ar(sig,2);
  ReplaceOut.ar(0,sig);
  };
);
p.moveNodeToTail(\master);
