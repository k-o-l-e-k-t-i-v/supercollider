
s.boot;
(
  Ndef(\a).quant = 1;
  Ndef(\a,{
    ~a = Duty.ar(1/100,0,Dseq([0,4,7,0,3,7],inf));
    ~b = Duty.ar(8,0,Dseq([0,12,24,36]-60,inf)).lag(1/4);

    ~f = (80+~a+~b).midicps;
    ~lfo = SinOsc.ar(1/4/(1..8)).range(0.01,1);
    Splay.ar(


      VarSaw.ar(~f*(1.0001**(1..8)),0,~lfo,mul:0.5) +
      (VarSaw.ar(~f*3,0,1-~lfo,mul:0.4) * LFSaw.ar(1/4).squared)
      * Decay.ar(Impulse.ar(4/[1,2,4]),[1,0.5,0.25])
      ,0.5,1,0.5)}).play;

)
