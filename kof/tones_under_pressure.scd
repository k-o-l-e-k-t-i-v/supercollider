s.boot;


(
  Ndef(\a).fadeTime = 2.0;
  Ndef(\a,{
    ~s = Select.kr(Stepper.kr(Impulse.kr(1/[8,16,32,64])),[1,2,1.5,1.25,1,2,4,0.5,0.25]*22);
    ~freq = {LFSaw.ar(~s/fib(8)).range(2,12000).round(432/8)};
    Splay.ar(
      CompanderD.ar(
        FreeVerb.ar(
          LPF.ar(
            CombN.ar(
              BBandPass.ar(
                LFSaw.ar(4320*(1.0001**(1..16))/~s,mul:0.5) +
                SinOsc.ar(4320*(1.001**(1..16))/~s.lag(0.5),mul:0.1) +
                SinOsc.ar(~freq * (~s.lag(0.1)/22) * (1.000125**(1..32)),mul:1/(1..32))
                ,LFSaw.ar(1/4/(2.01**(1..8))).range(1100*(1.00075**(1..32)),22))
              ,0.02,2,4)
            ,800)* LFSaw.ar(4/fib(21)).squared
          ,0.8,0.02*(2.01**(1..32)))
        ,0.25,1,0.025).softclip * 3 
      ,0.5,1,0.25)}).play;

)
s.scope;
