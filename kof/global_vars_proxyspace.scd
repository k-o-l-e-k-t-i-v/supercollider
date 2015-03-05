

ProxySpace.push(s)

///////////////////////////
// global variables
///////////////////////////

~rythm.quant = 2;
~rythm.fadeTime = 0.1;
~rythm = {Duty.ar(Dseq([1,2,1],inf),0,Dseq([1,4,8],inf))};
~rythm.mold(2);

///////////////////////

(
  Ndef(\a).quant =2;
  Ndef(\a,{
    Splay.ar(
      SinOsc.ar([44,45]*Pulse.ar(~rythm))) * Decay.ar(Impulse.ar(~rythm),0.25)
  }).play;

  Ndef(\a).mold(2);
)

(
  Ndef(\b).quant = 2;
  Ndef(\b,{
    Splay.ar(
      LFPulse.ar(90 + (45 * Pulse.ar(~rythm)),mul:0.4)) * Decay.ar(Impulse.ar(~rythm),1.5)
  }).play;

  Ndef(\b).mold(2);
)


