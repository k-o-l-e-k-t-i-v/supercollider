

s.reboot;
(
  Ndef(\a,{

      ~oct = Duty.kr(16,0,Dseq([0,1,2]*7,inf));
      ~f = Duty.kr(4,0,Dseq(([60,64,67,63]-36+~oct).midicps,inf)).lag(1/4);
      ~sig = Blip.ar(~f,40*LFSaw.ar(1/4/[1,2,4,8]).exprange(0.0001,1)+1,mul:0.2);

      ~sig = Resonz.ar(~sig,SinOsc.ar(1/4/[1,2]).exprange(~f*8,~f));
      ~sig = Vibrato.ar(Mix.ar(~sig).softclip!2,[4,5],0.2);


    Splay.ar(
      Compander.ar(
        FreeVerb2.ar(
          ~sig[0],~sig[1]
            ,0.23,40) * 2.0
        ,0.5,1,1/10)
    )
  }).play;
)

Ndef(\a).clear;
