
(
  p=ProxySpace.push(s.boot);
  p.makeTempoClock;
);


Tdef(\mel).quant=2;
Tdef(\mel,{loop{~atmo.rebuild;16.wait;}}).play;
Tdef(\mel).stop;

(
~atmo.ar(2);
~atmo.quant=2;
~atmo.fadeTime=13.2;
~atmo={
  var sig = LFSaw.ar(440*{[1,1.25,1.3333,1.5,0.5,0.25,8].choose}!3*(1..4).reciprocal)**4;
  sig = LPF.ar(sig,LFSaw.ar(1/16/[1,2,3,4]).range(16000,600));
  sig = Convolution.ar(sig,LFNoise1.ar(14320/[1,1.5,4,16]+SinOsc.kr(1/4/[1,2,3,4])),2048*4);
  sig = Normalizer.ar(sig);
  sig = CompanderD.ar(sig,3/4,1/3,1/2);
  sig = Vibrato.ar(sig,[4,5,6,7],0.12);
  sig = DWGReverb.ar(sig,LFNoise2.kr(1/32!2).exprange(1000.1,8000),mix:LFNoise2.kr(1/4!2).range(0.25,0.75));
  sig = LPF.ar(sig,3900)+sig;
  Splay.ar(sig,0.75,0.25);
};
~atmo.play;
);
~atmo.stop(4);
~atmo.clear;
~atmo.pause;
~atmo.resume;

