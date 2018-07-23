p.push

// larpa synth ///////////////////////////////////////

(
~larpa.ar(2);
~larpa.clock = p.clock;
~larpa.quant=2;
~larpa.fadeTime=4;
~larpa={
  var sig = SinOsc.ar(SinOsc.ar(1/4+((1..80)/10000)).range(50,5000),Pulse.ar(4)*8pi,mul:LFTri.kr(4+((1..80)/10000)));
  Splay.ar(sig,0.5,0.25);
};
~larpa.play;
);
~larpa.stop(4);
~larpa.clear;
~larpa.pause;
~larpa.resume;
