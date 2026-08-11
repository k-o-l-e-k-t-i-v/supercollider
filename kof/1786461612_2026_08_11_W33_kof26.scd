p.push();



// one synth ///////////////////////////////////////

(
~one.ar(2);
~one.quant=4;
~one.fadeTime=2;
~one={
  var base = 440;
  var freq1 = Duty.kr([1,5,8]/~tempo,0,Dseq(2**((1..12).scramble/12),inf));
  var freq2 = Duty.kr([1,5,8]/~tempo,0,Dseq(2**((1..12).scramble/12),inf));
  var freq = freq1 * freq2 * base;
  var sig = SinOsc.ar(freq,mul:0.2) * Decay.ar(Impulse.ar(1/2*[1,2,3,4]),0.5);
  Splay.ar(sig,0.0,0.25);
};
~one.play;
);
~one.stop(4);
~one.clear;
~one.pause;
~one.resume;
