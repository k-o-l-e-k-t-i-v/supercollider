
p.push();

// one synth ///////////////////////////////////////

(
~one.ar(2);
~one.quant=4;
~one.fadeTime=2;
~one={|vol=1|
  var harm = 2**([1,5,1,8]/12+1);
  var sig = SinOsc.ar(60*harm) * LFSaw.ar((1..4));
  Splay.ar(sig,0,vol);
};
~one.play;
~one.vol(0.2);
);
~one.stop(4);
~one.clear;
~one.pause;
~one.resume;



~one[1] = {Splay.ar(LFPulse.ar((1..8)),0,1/4)};
~one[1].stop;
