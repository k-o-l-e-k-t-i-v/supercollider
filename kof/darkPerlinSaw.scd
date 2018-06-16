



p.push();


// one synth ///////////////////////////////////////

(
~one.ar(2);
~one.clock = p.clock;
~one.quant=4;
~one.fadeTime=2;
~one={
    var t = SinOsc.ar([1/160,1/1600,110.01*[1,1.005,1.00001]]).range(0,2pi) + SinOsc.ar(4+(40..44).reciprocal,mul:1/10).range(0,1);
    var perl = Perlin3.ar(t.sin,t.cos,t);
  var sig = VarSaw.ar(110/[1,2,3,4]+(33..38).reciprocal,0,perl**LFTri.ar(1/16).exprange(0.01,2));
  sig = LPF.ar(sig,3500) * LFTri.ar(4/[1,2,3,4]) + HPF.ar(sig,14000) * SinOsc.ar(440/[4,3,2,1],perl);
  sig = LeakDC.ar(sig);
  //sig = sig * Decay.kr(Impulse.kr(1/4/[1,2,3,4]),4);
  sig = BPF.ar(sig * LFTri.ar(1/(1..12)),110*.x[1,2,4,8,16]*(2**((1..12)/12)),0.2);
  sig = CompanderD.ar(sig,3/4,1/1.5,1);
  sig = CombL.ar(sig,1/2,1/55,2);
  Splay.ar(sig,0.25,0.5);
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
  ~master = {|wet=0.15,lp=3500,hp=250,len=10,rev = 3|
  var sig = In.ar([0,1]);
  var orig = sig;
  var fx;
  //fx = Limiter.ar(sig,0.95);
  sig = CompanderD.ar(sig,3/4,1/1.333,1);
  fx = LPF.ar(sig,lp);
  fx = HPF.ar(fx,hp);
  fx = DWGReverbC1C3.ar(NumChannels.ar(fx,2),[5000,5010],1/len)/rev;
  sig = SelectX.ar(wet,[orig,fx]);
  sig = NumChannels.ar(sig,2);
  ReplaceOut.ar(0,sig);
  };
);
p.moveNodeToTail(\master);

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
