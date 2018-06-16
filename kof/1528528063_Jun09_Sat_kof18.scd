



p.push();


// one synth ///////////////////////////////////////

(
~one.ar(2);
~one.clock = p.clock;
~one.quant=4;
~one.fadeTime=7;
~one={
    var t = SinOsc.ar([1/160,1/1600,110.01*[1,1.005,1.00001]]).range(0,2pi) + SinOsc.ar(4+(40..44).reciprocal,mul:1/10).range(0,1);
    var perl = Perlin3.ar(t.sin,t.cos,t);
  var sig = VarSaw.ar(110/[1,2,3,4]+(33..38).reciprocal,0,perl**LFTri.ar(1/16).exprange(0.01,2));
  sig = LPF.ar(sig,3500) * LFTri.ar(4/[1,2,3,4]) + HPF.ar(sig,14000) * SinOsc.ar(440/[4,3,2,1],perl);
  sig = LeakDC.ar(sig);
  sig = CompanderD.ar(sig,3/4,1/1.5,1);
  //sig = sig * Decay.kr(Impulse.kr(1/4/[1,2,3,4]),4);
  sig = CombL.ar(sig,1/2,1/55,2);
  Splay.ar(sig,0.25,0.15);
};
~one.play;
);
~one.stop(4);
~one.clear;
~one.pause;
~one.resume;


(
  s.latency=2/3;
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
