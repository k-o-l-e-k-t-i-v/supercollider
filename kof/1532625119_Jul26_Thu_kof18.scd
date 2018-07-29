p.push()


// one synth ///////////////////////////////////////

(
~one.ar(2);
~one.clock = p.clock;
~one.quant=2;
~one.fadeTime=4;
~one={
  var sig = SinOsc.ar(12500!2);
  Splay.ar(sig,0.5,0.25);
};
//~one.play;
);
~one.stop(4);
~one.clear;
~one.pause;
~one.resume;



// two synth ///////////////////////////////////////

(
~two.ar(2);
~two.quant=2;
~two.fadeTime=0.2;
~two={
  //         |       |       |       |       |  
  var pat = [1,1,1,1].rotate(1);
  var imp = PulseDivider.kr(~tick.kr,1,~counter.kr % pat.size);
  var hit = Select.kr(PulseCount.kr(imp)%pat.size,pat);
  var env = EnvGen.ar(Env([0.001,1,0.0001],[0.002,1.5],[3,-3],curve:'exp'),imp * hit);
  var sig = [
  SinOsc.ar(50!2),
  Pulse.ar(4),
  WhiteNoise.ar(0.2),
  LFPulse.ar(500)
  ];
  sig = Select.ar(PulseCount.kr(imp*hit)%sig.size,sig);
  //sig = sig * env;
  Splay.ar(sig,0.75,0.5);
};
//~two.play;
);
~two.stop(4);
~two.clear;
~two.pause;
~two.resume;

// four synth ///////////////////////////////////////

(
~four.ar(2);
~four.clock = p.clock;
~four.quant=2;
~four.fadeTime=4;
~four={
  var sig = SinOsc.ar(50!2,Pulse.ar(4));
  Splay.ar(sig,0.5,0.25);
};
//~four.play;
);
~four.stop(4);
~four.clear;
~four.pause;
~four.resume;


// three synth ///////////////////////////////////////

(
~three.ar(2);
~three.clock = p.clock;
~three.quant=2;
~three.fadeTime=4;
~three={
  var sig = ~one.ar * ~two.ar + ~four.ar;
  Splay.ar(sig,0.5,0.95);
};
~three.play;
);
~three.stop(4);
~three.clear;
~three.pause;
~three.resume;
