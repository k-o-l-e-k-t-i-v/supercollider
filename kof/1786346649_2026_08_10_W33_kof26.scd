

p=ProxySpace.push(s);
~tempo={1/0.432};

// formant synth ///////////////////////////////////////

(
~formant.ar(2);
~formant.quant=4;
~formant.fadeTime=2;
~formant={
  var notes = 2**(Duty.kr([4,16,64]/~tempo,0,Dseq([1,5,1,8],inf))/12+1);
  var base = [36,55,60].midicps * notes;
  var sig = Formant.ar(base,base/2,base*2) * 0.4;
  var env = EnvGen.ar(Env([0.001,1,0.001],[0.002,0.5],[3,-3]),Impulse.ar(~tempo*2));
  sig = sig * env;
  Splay.ar(sig,0.5,0.25);
};
~formant.play;
);
~formant.stop(4);
~formant.clear;
~formant.pause;
~formant.resume;
