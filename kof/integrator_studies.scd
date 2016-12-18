
p = p.push();
p.bpm(240);
p.restartClock;

TempoClock.default = p.clock;

// one synth ///////////////////////////////////////

(
~one.ar(2);
~one.clock = p.clock;
~one.quant=2;
~one.fadeTime=4;
~one={
    var len = 1;
  var ran = 1/50;
  var f = TWChoose.kr(Impulse.kr(~tempo!3),[60,64,69,72,48].midicps * [1,2,1/2,5/4,4/3],[1,1,1,1/2,0.1],0);
  var phase = SinOsc.ar(~tempo).range(0.1,0.5);
  var width = LFSaw.ar(1/160*~tempo).range(0.1,0.5);
  var sig = Integrator.ar( LFPulse.ar(f,phase,width), LFSaw.ar(f.lag(0.001)).range(0.001,0.999) ) * ran;
  sig = Perlin3.ar(sig[0],sig[1],sig[2]);
  sig = LeakDC.ar(sig);
  sig = sig * Decay.ar(Impulse.ar(~tempo/[1,2,3,4]),sig.range(0.01,len)*~tempo);
  sig = Limiter.ar(sig,0.9,0.002);
  sig = CompanderD.ar(sig,3/4,1/1.5,1,0.002,~tempo/4).softclip/10;
  //sig = Clip.ar(sig,0.99);
  Splay.ar(sig,0.2,0.25);
};
~one.play;
);
~one.stop(4);
~one.clear;
~one.pause;
~one.resume;


LFPulse.help
Integrator.help
