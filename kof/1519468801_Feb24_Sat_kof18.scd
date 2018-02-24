

p.push()
p.bpm(120)


// testing_git synth ///////////////////////////////////////

(
~testing_git.ar(2);
~testing_git.clock = p.clock;
~testing_git.quant=2;
~testing_git.fadeTime=4;
~testing_git={
  var sig = SinOsc.ar(50!2);
  Splay.ar(sig,0.5,0.25);
};
~testing_git.play;
);
~testing_git.stop(4);
~testing_git.clear;
~testing_git.pause;
~testing_git.resume;
