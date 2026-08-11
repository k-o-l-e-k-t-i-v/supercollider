p.push();


// one synth ///////////////////////////////////////

(
~one.ar(2);
~one.quant=4;
~one.fadeTime=2;
~one={
  var base = 440;
  var freq = 2**([0,386.31,701.96]/1200) * base;
  var sig = SinOsc.ar(freq,mul:0.2) * Decay.ar(Impulse.ar(1/2*[3,4]),0.5);
  Splay.ar(sig,0.0,0.5);
};
~one.play;
);
~one.stop(4);
~one.clear;
~one.pause;
~one.resume;
