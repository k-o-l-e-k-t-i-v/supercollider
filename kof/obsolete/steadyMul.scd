

(
~noname.quant=2;
~noname.fadeTime=2;
~noname={
  var sig = LFSaw.ar(50!2*((1..8)/80+1)) ++ SinOsc.ar(50*[1,2,4,8]);
  sig = Resonz.ar(sig,LFSaw.ar(4/fib(16)).exprange(400.01,44));
  Splay.ar(sig.flat,0.25,0.35);
};
~noname.play;
);
~noname.stop(7);



(
~pragma.quant=2;
~pragma.fadeTime=2;
~pragma={
  var mod = Duty.kr(4,0,Dseq([1,2,1.5,1,4,1.25,1,2,4],inf));

  var sig = VarSaw.ar(4320/fib(8) / (mod*pi));
  sig = LPF.ar(sig,LFSaw.ar(4/fib(8)).range(4000,43.2));
  Splay.ar(sig.flat,0.25,0.12);
};
~pragma.play;
);
~pragma.stop(7);


(
~pragma2.quant=2;
~pragma2.fadeTime=2;
~pragma2={
  var sig = RHPF.ar(WhiteNoise.ar(0.3!2),18000/fib(8));
  sig = sig * LFTri.ar(1/4/fib(8)).exprange(0.0001,1);
  Splay.ar(sig.flat,0.25,0.25);
};
~pragma2.play;
);
~pragma2.stop(7);


(
~deep.quant=2;
~deep.fadeTime=2;
~deep={
  var sig = VarSaw.ar(43.2 * [1,1.5,1.25,2,4,8] * 2pi);
  sig = sig * LFTri.ar(1/8/fib(8)).exprange(0.0001,1);
  Splay.ar(sig.flat,0.25,0.25);
};
~deep.play;
);
~deep.stop(7);

