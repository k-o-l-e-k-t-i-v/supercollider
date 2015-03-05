

ProxySpace.push(s)

///////////////////////////
// global variables
///////////////////////////

(
~rythm.quant = 2;
~rythm.fadeTime = 0.1;
~rythm = {Duty.ar(Dseq([1,3],inf),0,Dseq([2,4]*2,inf))};
~saw.quant = 2;
~saw = {Mix.ar(LFSaw.ar(2).exprange(2200.01,22))};
)
///////////////////////

(
  Ndef(\a).fadeTime = 2;
  Ndef(\a).quant =2;
  Ndef(\a,{
    var sig = SinOsc.ar(~saw+(~saw*Pulse.ar(~rythm)));
    sig = sig + Resonz.ar(WhiteNoise.ar(1!2),~saw*10,0.1,4);
    sig = sig * Decay.ar(Impulse.ar(~rythm),0.35);
    sig = RLPF.ar(sig,~saw*10);
    sig = FreeVerb.ar(sig,0.13,10);

    Splay.ar(
       sig
    )
  }).play;
)

