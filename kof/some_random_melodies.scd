s.reboot;

(


    Ndef(\abs).fadeTime = 4.0;
    Ndef(\abs).quant = 2.0;
    Ndef(\abs,{
               ~freq = Select.kr(Stepper.kr(Impulse.kr(1/16),max:7),43.2*2*[1,0.75,1.5,1,1,1,1]);
               ~mod = Select.kr(Stepper.kr(Impulse.kr(1/8),max:3),[1,1.25,1.5,0.5]);
               ~mmod = Select.kr(Stepper.kr(Impulse.kr(1/4)),[0.5,1,1.5,1,1,1,1,1,1]);
               ~tempo = 1/8/fib(8);

               Splay.ar(
                   GVerb.ar(
                   CombN.ar(
                       RLPF.ar(
                           Vibrato.ar(
                               SinOsc.ar([~freq,~freq*~mmod]*(~mod.lag(0.5)*0.5pi)*(1.001**(1..10)*(1..10)),SinOsc.ar(4/(1..10)).range(-2pi,2pi),mul:1/(1..10)),
                               [4,5,6,7,8],0.2)
                           ,LFSaw.ar(~tempo).squared.range(22,3660))

                       ,(0.09/(1..10)),1,4)
                   ,roomsize:50)
                   ,0.5,1,0.5)}).play;

)

