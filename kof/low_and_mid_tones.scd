

s.reboot;
(
    Ndef(\a,{

        ~oct = Duty.kr(16,0,Dseq([0,1,2]*7,inf));
        ~f = Duty.kr(4,0,Dseq(([60,64,67,63]-24+~oct).midicps,inf)).lag(1/4);


        ~oct2 = Duty.kr(4,0,Dseq([1,0,2,-2,-1,-3]*12,inf));
        ~f2 = Duty.kr(1/4,0,Dseq(([60,64,69]+~oct).midicps,inf));

        ~sig = Blip.ar(~f,40*LFSaw.ar(1/4/[1,2,4,8]).exprange(0.0001,1)+1,mul:0.2);
        ~sig = Resonz.ar(~sig,SinOsc.ar(1/4/[1,2]).exprange(~f*8,~f));
        ~sig = Vibrato.ar(Mix.ar(~sig).softclip!2,[4,5],0.2);
        ~sig = Pan2.ar(~sig,SinOsc.ar(11).range(-0.3,0.3));
        ~sig = FreeVerb2.ar(~sig[0],~sig[1],0.23,40) * 1.5;
        ~sig = Compander.ar(~sig,0.75,1,1/10);

        ~sig2 = Blip.ar(~f2,400*LFSaw.ar(1/4/[1,2,4,8]).exprange(0.0001,1)+1,mul:0.2);
        ~sig2 = Resonz.ar(~sig2,SinOsc.ar(1/4/[1,2]).exprange(~f2*8,~f2));
        ~sig2 = Vibrato.ar(Mix.ar(~sig2).softclip!2,[5,6],0.2);
        ~sig2 = Pan2.ar(~sig2,SinOsc.ar(11.1).range(-0.3,0.3));
        ~sig2 = CombN.ar(~sig2,4,[4.02,4.03],32); 
        ~sig2 = FreeVerb2.ar(~sig2[0],~sig2[1],0.23,40);
        ~sig2 = Compander.ar(~sig2,0.25,1,1/10);



        Splay.ar(
          ~sig + ~sig2
        )
    }).play;
)

Ndef(\a).clear;
