

s.reboot;
(
  Ndef(\a,{

      ~f = Duty.kr(4,0,Dseq([60,64,67,63]-24,inf));
      ~sig = Blip.ar(~f,40*LFSaw.ar(1/4/[1,2,4,8]).exprange(0.0001,1)+1,mul:0.2);

      ~sig = Resonz.ar(~sig,60+SinOsc.ar(4/[1,2]).exprange(~f*8,~f));
    ~sig = Mix.ar(~sig).softclip!2;


    Splay.ar(
      Compander.ar(
        FreeVerb2.ar(
          ~sig[0],~sig[1]
            ,0.23,40)
        ,0.5,1,1/10)
    )
  }).play;
)

Ndef(\a).clear;
