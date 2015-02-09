s.reboot;
StageLimiter.activate;

(
  Ndef(\low).quant =2.0;
  Ndef(\low).fadeTime = 8.0;

  Ndef(\low,{Splay.ar(
    RLPF.ar(
      Pulse.ar(50*(1.000001**(1..16)),mul:0.5) * Pulse.ar(8/fib(8))
      ,VarSaw.ar(8/fib(8)).range(1600,44)) 
    ,0.5,0.25,0.5)}).play;
)

Ndef(\low).stop(8)

(
  Ndef(\puls).quant =2.0;
  Ndef(\puls).fadeTime = 8.0;
  Ndef(\puls,{
    GVerb.ar(
    CombN.ar(
      //CompanderD.ar(
      CombN.ar(
        Pulse.ar(4/[4,2],SinOsc.ar(1/[3,4]).range(0.14,0.96))
        ,0.25,1.02+SinOsc.ar(1/[4,8]),32)
      ,0.0224,1.04+SinOsc.ar(1/[8,16]),32)
    //,0.85,1,0.5)
    ,100)
  }).play;
)

Ndef(\puls).stop(8)



s.scope
Ndef(\low).stop(8)

(
  Ndef(\high).quant =2.0;
  Ndef(\high).fadeTime = 8.0;

  Ndef(\high,{

    ~mod = Select.kr(Stepper.kr(Impulse.kr(1/4),max:3),[0.75,1.25,1.5,0.5]);
    Splay.ar(
      GVerb.ar(
        RHPF.ar(
          SinOsc.ar(43.20*2*~mod.lag(0.5)*(1.001**(1..16)),mul:0.15)
          ,VarSaw.ar(4/[1,2,4,8]).range(1600,22)) 
      )
      ,0.5,1,0.5)}).play;

)

Ndef(\high).stop;


(
  Ndef(\mel).quant =2.0;
  Ndef(\mel).fadeTime = 8.0;

  Ndef(\mel,{

    ~mod2 =Select.kr(Stepper.kr(Impulse.kr(16),max:1),[1,2]);

    Splay.ar(
      GVerb.ar(
        RLPF.ar(
          LFSaw.ar(432*(~mod*pi)*(~mod2+0.00001**((1..8)*(1..8))),mul:0.5/(1..8))
          ,VarSaw.ar(1/8/[1,2,4,8]).range(160,44)) 
        ,roomsize:100)
      ,0.5,0.25,0.5)}).play;

)

