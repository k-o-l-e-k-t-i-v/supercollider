







p.push();
b = Buffer.alloc(s,2048,1,{arg buf; buf.chebyMsg((0..10)/10.0,false)});
b.plot;

// shaper synth ///////////////////////////////////////

(
~shaper.ar(2);
~shaper.clock = p.clock;
~shaper.quant=2;
~shaper.fadeTime=4;
~shaper={
  var pos = SinOsc.ar(50);
  var sig = Shaper.ar(b,pos * (LFTri.ar(1/16)**8+0.01));
  Splay.ar(sig,0.5,0.25);
};
~shaper.play;
);
~shaper.stop(4);
~shaper.clear;
~shaper.pause;
~shaper.resume;
