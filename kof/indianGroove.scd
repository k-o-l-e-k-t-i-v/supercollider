

// groove synth ///////////////////////////////////////

(
  ~groove.quant=2;
  ~groove.fadeTime=5;
  ~groove={
    var sig = VarSaw.ar(432/4!2,mul:0.4) ++ SinOsc.ar(43.2*2) ++ WhiteNoise.ar(0.1);
    sig = sig * LFSaw.ar(1/fib(8)).exprange(0.001,1);
    sig = Resonz.ar(sig*8,SinOsc.ar(1/4/fib(8)).exprange(50.001,4000),SinOsc.ar(2/fib(8)).range(0.02,2)) + GVerb.ar(LPF.ar(sig/2,LFSaw.ar(1/4).exprange(80.001,18000)),10);
    sig = CompanderD.ar(sig,4/3,1/2,1/2);
    sig = sig + (sig*Pulse.ar(2)/8);
    sig = GVerb.ar(sig,11)/4+sig + (LFSaw.ar(14000/(1..8),mul:0.1)*LFSaw.ar(1/4/fib(4)).exprange(0.001,1));
    sig = CompanderD.ar(sig,4/3,1/1.25,1/1.25);
    Splay.ar(sig.flat,0.25,0.25);
  };
  ~groove.play;
);
~groove.stop(7);
