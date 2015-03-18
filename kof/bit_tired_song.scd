(
~a.play;
~melod.quant=2;
~a.quant=2;
~melod={Duty.kr(8,0,Dseq([1,1.5,2,1.5,1,2],inf)).lag(1)};
)

(
~a={
  var sig;

  sig = SinOsc.ar(43.2*~melod*(1.0001*(1..8)),mul:0.5);
  sig = sig * Decay.ar(Impulse.ar(4/fib(8)),4);
  sig = sig + ( HPF.ar(WhiteNoise.ar(0.06!4),TRand.ar(1200,12000,Impulse.ar(8!4))) * Pulse.ar(8/fib(4)));
  sig = sig + PitchShift.ar((LFSaw.ar(4320*(~melod.lag(2)*1.5)*(1.0001**(1..8)),mul:LFTri.ar(1/fib(8)).exprange(0.2,0.001))),SinOsc.ar(1/8).range(0.001,0.2));
  sig = CompanderD.ar(sig,0.5,1/1.5,1/6,0.01,0.01);
  sig = DelayL.ar(sig,0.1,SinOsc.ar(4/(1..8)).range(0.00001,0.01));
  sig = AllpassL.ar(sig,0.1,SinOsc.ar(1/8/(1..8)).range(0.00001,0.01));
  sig = FreeVerb.ar(sig,0.1,10);

  
  Splay.ar(sig);
};
)
