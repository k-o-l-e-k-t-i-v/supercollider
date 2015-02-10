s.reboot;
StageLimiter.activate;

(
    Ndef(\crackles).quant = 2.0;
    Ndef(\crackles).fadeTime = 2.0;

    Ndef(\crackles,{

        ~mod1a = Select.kr(Stepper.kr(Impulse.kr(1/[4,2 ])),[1,1,1.5,1.25,2,4,0.5,0.75,1,1,1]);
        ~mod1b = Select.kr(Stepper.kr(Impulse.kr(4)),[1,1,1.5,1.25,2,4,0.5,0.75,1,1,1]);
        ~mod2 = Select.kr(Stepper.kr(Impulse.kr(1/16)),11/2*[1,1,1.5,1.5,2,4,0.5,0.5,1,1,1]);

        Splay.ar(
            FreeVerb.ar(
                LPF.ar(
                    0
                    + Pulse.ar([4,2]/fib(21),mul:1/fib(21)) * Pulse.ar((1.0001**(1..8))*~mod2*[~mod1a,~mod1b]*(2.0005**(1..8)))
                    + (Pulse.ar([4,2]/2/fib(21),mul:1/fib(21)) * WhiteNoise.ar(0.15!2))
                    + (LFPulse.ar(8/fib(12),mul:1/fib(21)) * SinOsc.ar((~mod2*2)*Pulse.ar(1/fib(12)).range(8*[~mod1b,~mod1b],WhiteNoise.ar(1!4)),mul:0.4))
                    ,[22,23]+(16000*LFSaw.ar(1/4/fib(21)).range(0,1)))
                ,0.1)
            ,0.5,1,0.5)
    }).play;
)

Ndef(\crackles).stop(8)

(
    Ndef(\crackles2).quant = 2.0;
    Ndef(\crackles2).fadeTime = 2.0;

    Ndef(\crackles2,{

        ~mod1a = Select.kr(Stepper.kr(Impulse.kr(1/4)),[1,1,1.5,1.25,2,4,0.5,0.75,1,1,1]);
        ~mod1b = Select.kr(Stepper.kr(Impulse.kr(1/8)),[1,1,1.5,1.25,2,4,0.5,0.75,1,1,1]);
        ~mod2 = Select.kr(Stepper.kr(Impulse.kr(1/32)),11*[1,1,1.5,1.5,2,4,0.5,0.5,1,1,1]);

        Splay.ar(
            LPF.ar(
                0
                + Pulse.ar([4,2]/fib(21),mul:1/fib(21)).lag(0.01) * Pulse.ar((1.0001**(1..8))*~mod2*[~mod1a,~mod1b]*(2.0005**(1..8)))
                ,[22,23]+(16000*LFSaw.ar(1/4/fib(21)).range(0,1)))

            ,0.5,1,0.5)
    }).play;
)

Ndef(\crackles2).stop


s.scope;
