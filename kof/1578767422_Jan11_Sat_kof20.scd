
p.push();
p.bpm(121.35);

// one synth ///////////////////////////////////////

(
~one.ar(2);
~one.quant=8;
~one.fadeTime=2;
~one={
    var detune = SinOsc.kr(1/6000/[4,5,6])*1000;
   //var env = Pulse.ar([MouseX.kr(1/2,16),MouseY.kr(16,1/2)]);
  var sig = SinOsc.ar(18000!2/[1,1/16,1/4,1/2]+detune);
  //sig = sig * env;
  Splay.ar(sig,1,0.75,LFPulse.ar([3,4,5,9]).range(-1,1));
};
~one.play;
);
~one.stop(4);
~one.clear;
~one.pause;
~one.resume;
