
s.boot;
(
  Ndef(\a).quant = 1;
  Ndef(\a,{
    ~a = Duty.ar(4,0,Dseq([0,4,7,0],inf));
    ~b = Duty.ar(8,0,Dseq([0,12,24,36]-60,inf)).lag(1/32);

    ~mm = Duty.ar(1,0,Dseq([0.5,8,1,1,1,1,1,1],inf));

    ~f = (80+~a+~b).midicps;
    ~lfo = SinOsc.ar(1/4/(1..8)).range(0.01,1);
    Splay.ar(

      FreeVerb.ar(
        Resonz.ar(
          CompanderD.ar(
            VarSaw.ar(~f*(1.0001**(1..8)),0,~lfo,mul:0.5) +
            (VarSaw.ar(~f*3,0,1-~lfo,mul:0.4) * LFSaw.ar(1/4).squared)
            * Decay.ar(Impulse.ar(4/[1,2,4]),[1,0.5,0.25]) +
            LFPar.ar(432*(1.001**(1..8))*~mm,SinOsc.ar(1*(1.001**(1..16))).range(-8pi,8pi),mul:0.5/(1..16))
            ,0.75,1,1/5,0.002,0.02) + LFPulse.ar(~f.lag(0.2)/51,mul:0.03).lag(0.1) 
          ,SinOsc.ar(1/4/(12..22)).exprange(22.01,17200*SinOsc.ar(1/4.32).range(0.1,1)),0.5) * 2
        ,0.45,10,0.0025)
      ,0.5,1,0.5)}).play;

)
