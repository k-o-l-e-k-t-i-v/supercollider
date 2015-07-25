



//Fri Jul 24 20:00:07 CEST 2015



// alal synth ///////////////////////////////////////

(
~alal.quant=1;
~alal.fadeTime=0.02;
~alal={
  var env = EnvGen.ar(Env([0,1,0],[0.002,4.75],[3,-3]),Impulse.ar(1/16,(0..3)/4));
    var sig = SinOsc.ar(12000/[0.5,1,0.75,0.25]*pi + SinOsc.ar(11).range(-40,40)) ;
  sig = sig * env;
  Mix.ar(sig) * 0.5;
};
e.addMix(~alal,postVol:true);
~alal.play;
);
~alal.stop(7);
~alal.clear;<<F3>
