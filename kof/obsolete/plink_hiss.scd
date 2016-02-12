

(
  p=ProxySpace.push(s.reboot);
);


// plink synth ///////////////////////////////////////

(
~plink.quant=2;
~plink.fadeTime=5;
~plink={
  var tempo = 1;
  var env = EnvGen.ar(Env([0,1,0],[0.002,0.5],[3,-3]),Impulse.ar(tempo,(0..3)++[0.5,0.25]/4));
  var fenv = EnvGen.ar(Env([70,250,70],[0.001,0.05],[3,-3]),Impulse.ar(tempo,(0..3)++0.5/4));
  var sig = Blip.ar(fenv,LFSaw.ar(1/4/fib(8)).exprange(0.001,1)*100+2,mul:0.2);
  sig = sig * env;
  sig = Resonz.ar(sig,LFSaw.ar(1/3/fib(8)).exprange(10.001,10000)) + LPF.ar(sig,LFSaw.ar(1/4/fib(8)).exprange(10.001,4000));
  sig = GVerb.ar(sig)/4+sig/2;
  sig = CompanderD.ar(sig,4/3,1/2,1/2,1/2);
  Splay.ar(sig.flat,0.25,0.25);
};
~plink.play;
);
~plink.stop(7);



// hiss synth ///////////////////////////////////////

(
~hiss.quant=2;
~hiss.fadeTime=4;
~hiss={
  var tempo = 1/4/[1,2];
  var fenv = EnvGen.ar(Env([20000,100,5000],[0.01,1],[3,-3]),Impulse.ar(tempo,(0..3)/4));
  var env = EnvGen.ar(Env([0,1,0],[0.002,2],[3,-3]),Impulse.ar(tempo,(0..3)+[0.5,2.5,2.75]/4));
  var sig = BPF.ar(WhiteNoise.ar(0.5!2)+PinkNoise.ar(0.4!2),fenv);
  sig = sig * env;
  sig = GVerb.ar(sig)/4+sig/2;
  Splay.ar(sig.flat,0.5,0.5);
};
~hiss.play;
);
~hiss.stop(7);
