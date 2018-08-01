


p.push();


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

// loopy synth ///////////////////////////////////////

(
b = Buffer.alloc(s, 48000*4, 2);
~loopy.ar(2);
~loopy.clock = p.clock;
~loopy.quant=4;
~loopy.fadeTime=4;
~loopy={
    var f = 1/320;
    var rr = LFNoise2.kr(1/30!2).exprange(1.00000001,1.001);

  var sig = PlayBuf.ar(2,b.bufnum,rate:rr,loop:1);
  sig = SinOsc.ar(f, sig*2pi,mul:0.1);
  //sig = PitchShift.ar(sig,1/100,1/rr);
  //sig = DWGReverbC1C3.ar(sig,[5000,5010],1/10);
  //sig = LPF.ar(sig,500);
  sig = Normalizer.ar(LeakDC.ar(sig))/2;
  sig = LPF.ar(sig,5000);
  RecordBuf.ar(sig,b.bufnum,loop:1,recLevel:0.19,preLevel: 0.5);
  Splay.ar(sig);
};
~loopy.play;
);
~loopy.stop(4);
~loopy.clear;
~loopy.pause;
~loopy.resume;

(
  ~master.quant=2;
  ~master.play;
  ~master.fadeTime = 0.01;
  ~master = {|wet=0.15,lp=3500,hp=250,len=10,rev = 3|
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
