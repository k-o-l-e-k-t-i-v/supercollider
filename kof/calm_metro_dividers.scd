



// one synth ///////////////////////////////////////

(
~one.ar(2);
~one.quant=2;
~one.fadeTime=4;
~one={
    var sig = SinOsc.ar(16000/16*(1..16)+LFTri.ar((16..1)/4).range(-400,400)) * LFPulse.ar(1/(1..16)) ;
  Splay.ar(sig,0.5,0.0001);
};
~one.play;
);
~one.stop(4);
~one.clear;
~one.pause;
~one.resume;


// two synth ///////////////////////////////////////

(
~two.quant=1;
~two.fadeTime=1.02;
~two={
  var imp = PulseDivider.kr(~tick.kr,[4,8,16]*2);
  var env = EnvGen.ar(Env([0.001,1,0.001],[0.002,1.5],[3,-3]),imp);
  var sig = SinOsc.ar(env**[80,120,400]*800+80);
  sig = sig * env;
  Splay.ar(sig,0.25,~n2);
};
~two.play;
);
~two.stop(7);
~two.clear;


// bb synth ///////////////////////////////////////

(
~bb.quant=1;
~bb.fadeTime=4.02;
~bb={
  var imp = PulseDivider.kr(~tick.kr,16);
  var env = EnvGen.ar(Env([0.001,1,0.001],[2.502,0.5],[5,-5]),imp);
  var sig = SinOsc.ar(env**[0.1,0.5,0.08]*10+Select.kr(LFNoise0.kr(1/3!3).range(0,8),[36,64,55,58,65,72,67].midicps)*2);
  sig = sig * env;
  sig = CombN.ar(sig,0.3,0.3,3) + sig;
  Splay.ar(sig,0.25,0.25);
};
e.addMix(~bb,postVol:true);
~bb.play;
);
~bb.stop(7);
~bb.clear;


// three synth ///////////////////////////////////////

(
~three.quant=1;
~three.fadeTime=0.02;
~three={
  var imp = PulseDivider.kr(~tick.kr,[4,16]);
  var env = EnvGen.ar(Env([0.001,1,0.001],[0.002,[0.15,2]],[3,-3]),imp);
  var sig = WhiteNoise.ar(0.5!2);
  sig = HPF.ar(sig,LFNoise2.kr(1/16!4).range(1000,16000));
  sig = sig * env;
  sig = sig + (CombC.ar(sig,1/32,1/33,1) * LFPulse.ar(1));
  Splay.ar(sig,0.25,~n3);
};
~three.play;
);
~three.stop(7);
~three.clear;


// four synth ///////////////////////////////////////

(
~four.quant=1;
~four.fadeTime=0.02;
~four={
  var imp = PulseDivider.kr(~tick.kr,32);
  var env = EnvGen.ar(Env([0.001,1,0.001],[0.002,4.5],[3,-3]),imp);
  var sig = SinOsc.ar(5000 + SinOsc.kr(11).range(-10,10),mul:0.02);
  sig = sig * env;
  Splay.ar(sig,0.25,~n4);
};
~four.play;
);
~four.stop(7);
~four.clear;

