

~tempo={125.5/120};


// dat synth ///////////////////////////////////////

(
~dat.ar(2);
~dat.clock = p.clock;
~dat.quant=4;
~dat.fadeTime=4;
~dat={
  var sig = VarSaw.ar([50,~tempo/[1,2,3]/4,~tempo/16/4]).range(0,2pi) ** LFDNoise1.kr(~tempo/64) * 4;
  //sig = CombL.ar(sig * Pulse.ar(~tempo/[1,2,3]),1/50,2/50,LFDNoise1.kr(~tempo/32!3)*2);
  sig = Perlin3.ar(sig[0],sig[1],sig[2]);
  //sig = LPF.ar(sig,5800);
  Splay.ar(sig,0.95,0.5);
};
~dat.play;
~dat[10] = \filter -> {|sig| DWGReverbC1C3.ar(sig,3000,1/2,10,0.05)};
);
~dat.stop(4);
~dat.clear;
~dat.pause;
~dat.resume;
