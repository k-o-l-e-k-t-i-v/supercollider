



p.push();


// a synth ///////////////////////////////////////

(
~a.ar(2);
~a.clock = p.clock;
~a.quant=4;
~a.fadeTime=4;
~a={
    var pulse = Pulse.ar(2/[1,2,3,4]);
  var sig = SinOsc.ar(150!2,pulse*2pi);
  sig = CombN.ar(sig,1,1/4,1);
  sig = LeakDC.ar(sig);
  Splay.ar(sig,1,0.25);
};
~a.play;
);
~a.stop(4);
~a.clear;
~a.pause;
~a.resume;
