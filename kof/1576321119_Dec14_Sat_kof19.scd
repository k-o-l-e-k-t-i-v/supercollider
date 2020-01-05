
p.push()

b = Buffer.alloc(s,16,48000);

// one synth ///////////////////////////////////////

(
~one.ar(2);
~one.quant=2;
~one.fadeTime=0.4;
~one={
  var sig = SinOsc.ar(1,SinOsc.ar(1/15));
  sig = BufDelayL.ar(b.bufnum,sig,SinOsc.ar(250/(2**(2..17).log2)).range(0,1));
  Splay.ar(sig,0.5,0.25);
};
~one.play;
);
~one.stop(4);
~one.clear;
~one.pause;
~one.resume;
