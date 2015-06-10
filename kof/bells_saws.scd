

// lament synth ///////////////////////////////////////

(
~lament.quant=2;
~lament.fadeTime=2;
~lament={
  var sig = LFSaw.ar(50+((1..6)/10)) ++ HPF.ar(WhiteNoise.ar(0.2!2),14000) ++ SinOsc.ar(2200*[1.5,1.25,1,4],mul:0.2);
  sig = sig.scramble;
  sig = SelectX.ar(LFSaw.ar(1/8).exprange(0.001,sig.size+0.1),sig)!2;
  sig = CombN.ar(sig,1/40,LFDNoise1.ar(1!8).exprange(0.02,0.08).round(0.01),4);
  sig= sig * Pulse.ar(4/fib(8)).clip(-1,1);
  sig = (LFPulse.ar(1/fib(8)) * GVerb.ar(sig,[10,11],mul:0.5))+sig;

  sig= CompanderD.ar(sig,4/3,1/2,1/2);
  Splay.ar(sig.flat,0.25,0.195);
};
m.addMix(~lament,postVol:true);
~lament.play;
);
~lament.stop(7);
