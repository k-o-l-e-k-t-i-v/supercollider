p.push();

// test synth ///////////////////////////////////////

(
~test.ar(2);
~test.quant=0;
~test.fadeTime=0.2;
~test={
  var sig = SinOsc.ar(300);
  Splay.ar(sig,0,0.05,0);
};
~test.play;
);
~test.stop(4);
~test.clear;
~test.pause;
~test.resume;
