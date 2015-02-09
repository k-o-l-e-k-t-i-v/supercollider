s.boot;
StageLimiter.activate;

(
  Ndef(\crackles).quant = 2.0;
  Ndef(\crackles).fadeTime = 2.0;

  Ndef(\crackles,{

    ~mod1a = Select.kr(Stepper.kr(Impulse.kr(1/8)),[1,1,1.5,1.25,2,4,0.5,0.75,1,1,1]);
    ~mod1b = Select.kr(Stepper.kr(Impulse.kr(1/16)),[1,1,1.5,1.25,2,4,0.5,0.75,1,1,1]);
    ~mod2 = Select.kr(Stepper.kr(Impulse.kr(1/16)),11*[1,1,1.5,1.5,2,4,0.5,0.5,1,1,1]);

    Splay.ar(
      //GVerb.ar(
      LPF.ar(
      CombN.ar(
        CombN.ar(
          0
          + Pulse.ar([4,2]/fib(21),mul:1/fib(21)) * Pulse.ar(~mod2*[~mod1a,~mod1b]*(2**(1..8)))
          + (Pulse.ar([4,2]*2/fib(21),mul:1/fib(21)) * WhiteNoise.ar(0.15!2))
          +  (Pulse.ar(2,mul:1/fib(21)) * SinOsc.ar(~mod2*Pulse.ar(2).squared.range(8,WhiteNoise.ar(1!4)),mul:0.4))

          ,0.0133,4,32)
        ,0.013301,4,8)
        ,[22,23]+(1600*LFSaw.ar(1/4/fib(21)).range(0,1)))
      //,1.0025)
      ,0.5,1,0.5)
  }).play;
)

s.scope;
