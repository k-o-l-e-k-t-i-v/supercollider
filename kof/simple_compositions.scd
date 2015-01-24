
s.boot;
/////////////////////////////////////////////
/////// BEAT  -> kick + hiss   //////////////
  /////////////////////////////////////////////
  (
    SynthDef(\kick,{|dur,amp,freq|
                    var env,fenv,sig;
                    env = EnvGen.ar(Env([0,amp,0],[0.015,dur],[1,3]),doneAction:2);
                    fenv = EnvGen.ar(Env([freq,55,44],[0.01,dur],[-3,3]));
                    sig = SinOsc.ar(fenv*(1.001**(1..24)),mul:1) + LFSaw.ar(fenv*1.5,mul:0.2*env) * env;

                    Out.ar(0,Splay.ar(sig,0.2,0.5));
                   }).add;

    SynthDef(\hiss,{|dur,amp,freq|
                    var env,fenv,sig;
                    env = EnvGen.ar(Env([0,amp,0],[0.02,{ExpRand(0.01,0.1)}!8],[-3,3]),doneAction:2);
                    sig = HPF.ar(WhiteNoise.ar(1*(1.001**(1..8))),{ExpRand(freq/2,freq)}!2) * env;

                    Out.ar(0,Splay.ar(sig,0.2,0.4));
                   }).add;

    Pdef(\beat,{
      Ppar([
        Pbind(
          \instrument, \kick,
          \dur, Pseq([Pn(1/8,8),Pn(1/2,4),Rest(1/2)],inf),
          \amp, Pwhite(0.75,1,inf),
          \freq, Pkey(\dur).linexp(1/8,1,12000,1200)   //what are this?
        ),
        Pbind(
          \instrument, \hiss,
          \dur, Pxrand([Pn(1/8,2),Pn(1/4,2),Pn(1/16,8),Rest(1/2)],inf),
          \amp, Pwhite(0.5,0.6,inf),
          \freq, Pkey(\dur).linexp(0.0001,1,444.01,12000)
        ),
      ])
    }).play(quant:2);

  )
/////////////////////////////////////////////
/////// MELODIES  ///////////////////////////
/////////////////////////////////////////////

(
  Ndef(\melod).fadeTime = 2.0;
  Ndef(\melod).quant = 2.0;
  Ndef(\melod,{|note = 60, mod=1|
               Splay.ar(
                 LFCub.ar(note.midicps*4pi*mod+SinOsc.ar(2/(1..8)).range(-2,2),mul:0.6/(1..8)) *
                 LFSaw.ar(1/4).squared
               )
              }).play;

  Ndef(\melod)[1] = \set -> Ppar([
    Pbind(\dur,4,\mod,Pseq([1,1.5,1.25,0.5,0.75],inf)),
    Pbind(\dur,1/4,\note,Pseq([60,60-12]-24,inf))
  ]);
)

(

  Ndef(\melod1).fadeTime = 2.0;
  Ndef(\melod1).quant = 2.0;
  Ndef(\melod1,{|note = 60, mod=1|
               Splay.ar(
                 LFSaw.ar(note.midicps*0.5pi*mod+SinOsc.ar(1/(1..8)).range(-2,2),mul:0.7/(1..8)) *
                 LFSaw.ar(1/8).squared
               )
              }).play;

  Ndef(\melod1)[1] = \set -> Ppar([
    Pbind(\dur,8,\mod,Pxrand([1,1.5,1.25,0.5,0.75],inf)),
    Pbind(\dur,8,\note,Pseq([36,60],inf))
  ]);
)


//////a_<3 <3 <3