p.push;

// one synth ///////////////////////////////////////

(
~one.ar(2);
~one.quant=2;
~one.fadeTime=0;
~one={
  var sig = LFPulse.ar([1,2]);
  //Splay.ar(sig,0.5,0.25);
  sig;
};
~one.play;
);
~one.stop(4);
~one.clear;
~one.pause;
~one.resume;
