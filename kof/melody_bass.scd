
s.boot;

(
  Ndef(\a).fadeTime = 4;
  Ndef(\a).quant = 2;

  Ndef(\a,{
    ~octave = Duty.kr(32,0,Dseq([0,2,1]*12,inf));
    ~tune = Duty.kr(16,0,Dseq([1,2,1.5,1.25,0.75],inf));
    ~base = Duty.kr(4,0,Dseq(([39,34,42,35]+~octave).midicps/(~tune*pi),inf));
    ~d1 = Duty.kr(1/4,0,Dseq([1,2,1,4,1,2,1,1.5],inf));
    ~d2 = Duty.kr(4,0,Dseq([1,2,1,4,1,2,1,1.5],inf));
    ~f = ~base * (~d1*2) * ~d2;

    ~sig = LFSaw.ar(~f,mul:0.15) * Decay.ar(Impulse.ar(4/fib(8)),(1..8)/6);
    ~sig = Resonz.ar(~sig,LFTri.ar(1/44/fib(8)).range(~f*4,~f/4));
    ~sig = AllpassN.ar(~sig.distort!4,0.25,0.25,32);
    ~sig = CompanderD.ar(~sig,0.5,1,1/6,0.002,0.02);
    ~sig = FreeVerb.ar(~sig,0.133,2);

    Splay.ar(
      ~sig.distort.softclip
    )}).play;
)
