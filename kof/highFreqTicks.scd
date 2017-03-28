



p.push();
// one synth ///////////////////////////////////////

(
~one.ar(2);
~one.clock = p.clock;
~one.quant=16;
~one.fadeTime=4;
~one={
  var sig = Pulse.ar(4/[1,2,3,4]) * SinOsc.ar(20000!2,Pulse.ar([2,1,1/2,1/4]/16) * pi);
  Splay.ar(sig,0.5,0.95);
};
~one.play;
);
~one.stop(32);
~one.clear;
~one.pause;
~one.resume;


// two synth ///////////////////////////////////////

(
~two.ar(2);
~two.clock = p.clock;
~two.quant=16;
~two.fadeTime=32;
~two={
  var sig = SinOsc.ar(20000/[1,2,3,4]) * SinOsc.ar([1,2,3,4]/4);
  Splay.ar(sig,0.5,0.005);
};
~two.play;
);
~two.stop(32);
~two.clear;
~two.pause;
~two.resume;
