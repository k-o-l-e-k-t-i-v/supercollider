


// bm synth ///////////////////////////////////////

(
~bm.quant=2;
~bm.fadeTime=3;
~bm={
  var dut = Duty.kr(16,0,Dseq([0,1,2,3],inf));
  var note = Select.kr(dut,[[0,3,0,5,24],[0,5,12,3,24],[0,3,24,12,-12]]);
  var sig = SinOsc.ar(1213/[1,2,4,1.5,1.25]);
  sig = sig * Pulse.ar(4/fib(4));
  sig = sig * LFSaw.ar([2,4,1.1,1.2,1.3,1.4]).exprange(0.001,1);
  sig = LPF.ar(sig,800) * LFSaw.ar(1/4/fib(8)).exprange(0.001,1);
  sig = sig + (WhiteNoise.ar(0.001!2) * Pulse.ar(1/fib(4)));
  sig = sig + (SinOsc.ar((36+note).midicps+[0,1.1],mul:0.25) * EnvGen.ar(Env([0,1,0],[0.002,4],[3,-3]),Impulse.ar(1/4/[2,1.25,1,4],(0..3)++[0.5,2.25]/4)));
  sig = AllpassC.ar(sig,0.1*(1..8),0.1/(1..8),8) * LFSaw.ar(1/3/fib(8)).exprange(0.001,1) + sig;
  Splay.ar(sig,0.25,0.75);
};
e.addMix(~bm,postVol:true);
~bm.play;
);
~bm.stop(7);
