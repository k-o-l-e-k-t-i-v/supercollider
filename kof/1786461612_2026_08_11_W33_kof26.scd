p.push();


// one synth ///////////////////////////////////////

(
~one.ar(2);
~one.quant=4;
~one.fadeTime=2;
~one={
  var base = 220;
  var freq = Duty.kr( 4/~tempo,0,Dseq(2**((1..12).scramble.pyramid/12),inf)) * base;
  var sig = SinOsc.ar(freq,mul:0.2) * Decay.ar(Impulse.ar(1/2*[1,2,3,4]),0.5);
  Splay.ar(sig,0.0,0.5);
};
~one.play;
);
~one.stop(4);
~one.clear;
~one.pause;
~one.resume;
