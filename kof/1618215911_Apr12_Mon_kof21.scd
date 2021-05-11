~tempo={2}

// test synth ///////////////////////////////////////

(
~test.ar(2);
~test.quant=24;
~test.fadeTime=5;
~test={
  var sig = SinOsc.ar(4320/4*(1+(1/(1..24)))) * Decay.kr(Impulse.kr(~tempo/24, (1,1..24).normalize*2pi),0.02);
  sig = CombN.ar(sig,1/~tempo*(0.025,1..24),1/~tempo*(0.0025,1..24),2);
  Splay.ar(sig,0.95,0.32);
};
~test.play;
);
~test.stop(4);
~test.clear;
~test.pause;
~test.resume;
(:13..) select: _.isPrime nextN:10;
(0.1,3..12)
((_+_)(1,2,3))
(:1,3..11).postln
5.div(1/2)
