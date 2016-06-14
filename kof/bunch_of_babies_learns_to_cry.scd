


// variace synth ///////////////////////////////////////

(
~variace.ar(2);
~variace.quant=2;
~variace.fadeTime=4;
~variace={
  var p = LFNoise1.kr(1/4/(1..8)).exprange(0.0001,0.17);
  var sig = Gendy1.ar([1],p[0],p[2],p[3],60,[1800,1430,1800,654],p[4],p[5]);
  sig = Formlet.ar(sig,6000/16*(1..16),0.001,0.12) * (LFNoise1.ar(1/4/(1..16))**1.7);
  sig = CompanderD.ar(sig,3/4,1/3,1/2);
  sig = PitchShift.ar(sig,0.01,0.95);
  sig = MoogFF.ar(sig,4632/TChoose.kr(Dust.kr(1!4),[1,1.5,8,16,1.3333,2,4]).lag(1),LFNoise2.ar(4/[1,2,3,4],mul:2.7));
  sig = GVerb.ar(sig,80,2)/8+sig;
  Splay.ar(sig,0.5,0.15);
};
~variace.play;
);
~variace.stop(4);
~variace.clear;
~variace.pause;
~variace.resume;
