

p.push();
p.bpm(121.3);


// one synth ///////////////////////////////////////

(
~one.ar(2);
~one.quant=0;
~one.fadeTime=0.4;
~one={
  var sig = SinOsc.ar([MouseX.kr(1500,15000),MouseY.kr(1500,15000)],LFTri.kr(~tempo/4/[1.02,1.01]).range(0,2pi) );
  sig = sig * Pulse.ar(~tempo*4);
  Splay.ar(sig,1,0.15);
};
~one.play;
);
~one.stop(4);
~one.clear;
~one.pause;
~one.resume;
