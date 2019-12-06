
p.push();


// glasses synth ///////////////////////////////////////

(
~glasses.ar(2);
~glasses.quant=2;
~glasses.fadeTime=1;
~glasses={
  var sig = SinOsc.ar([6000,60.001],[0,LFSaw.ar(1/3)]);
  Splay.ar(sig,1,1);
};
~glasses.play;
);
~glasses.stop(4);
~glasses.clear;
~glasses.pause;
~glasses.resume;
