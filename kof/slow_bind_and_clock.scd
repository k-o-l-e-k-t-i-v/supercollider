
s.reboot();
s.freeAll();

(

  Ndef(\tones).quant = 2.0;
  Ndef(\tones).fadeTime = 8.0;
  Ndef(\tones,{|m1,m2,m3,m4|
               Splay.ar(
                 SinOsc.ar(432/([m1,m2,m3,m4]*4pi)*(2**(1..4)) * ([m1,m2,m3,m4]) * (1.00001**(1..12)),mul:0.2).distort +
                 LFSaw.ar(432/([m1,m2,m3,m4]*2pi)*(1.5**(1..4)) * ([m1,m2,m3,m4]) * (1.000001**(1..12)),mul:0.1).distort *
                 LFSaw.ar(1/4/[1,2,4,8]).squared
                 ,0.2,1)});

  Ndef(\tones)[1] = \set -> Ppar([
    Pbind(
      \dur,4,
      \m1, Pseq([1,1.5,1.25,2,0.75,0.5,2],inf)
    ),
    Pbind(
      \dur,8,
      \m2, Pseq([1,1.5,1.25,2,0.75,0.5,2],inf)
    ),
    Pbind(
      \dur,16,
      \m3, Pseq([1,1.5,1.25,2,0.75,0.5,2],inf)
    ),
    Pbind(
      \dur,32,
      \m4, Pseq([1,1.5,1.25,2,0.75,0.5,2],inf)
    )
  ]);

  Ndef(\s).quant = 2;
  Ndef(\s).fadeTime = 2;
  Ndef(\s,{

    ~d = Decay.ar(Impulse.ar(4/fib(8)),{ExpRand(0.2,0.4)}!8);

    Splay.ar(
      LFSaw.ar(43.2*(1.00001**(1..8))+(~d.cubed*8000),mul:0.2) * ~d +
      Ndef(\tones).ar;

      ,0.2,1)}).play;

  Ndef(\s)[1] = \filter -> {|in|
                            FreeVerb.ar(
                              CompanderD.ar(
                                  in
                                ,0.5,1,0.5)
                              ,0.13,100)
                           };
)


///this produces no sound on my comp. is this a song for dogs?
// sonds ok on mine >> any errors? ..it should play
