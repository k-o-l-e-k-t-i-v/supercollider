s.reboot;
(
    Ndef(\abc,{
        ~oct = Duty.kr([4,8,16]*4,0,Dseq(([0,-12,0,-24,12,-36]),inf));
        ~m = Duty.kr(4,0,Dseq(([60,65,67,64]+~oct).midicps,inf));
        ~lfo = LFSaw.ar(2/[1,2,3,4]);
        ~lfo2 = ~lfo.exprange(0.0001,1.0001);
        ~lfo = ~lfo.exprange(250,44.01);

        ~sig = CompanderD.ar(
            RLPF.ar(
                SinOsc.ar(~lfo!4,mul:0.9) * LFSaw.ar(2/[1,2,3,4]).range(0,1) * Decay.ar(Impulse.ar(4/[1,2,3,4],0.6))
                ,1200*(SinOsc.ar(1/4/(1..32)).range(1.01,10))/(~lfo2*10000.0+1)+44,SinOsc.ar(1.00001**(1..8)).range(0.01,1)) +
            (LFPulse.ar(~m*(1.00001**(1..32)),mul:0.02) * (Decay.ar(Impulse.ar(8/[1,2,3,4]),1/8*[1,2,3,4])))
            ,0.15,1,1/10,0.02,0.05);

        ~sig = Vibrato.ar(~sig,[2,3,4,5,6,7],0.2);

        Splay.ar(
            CombN.ar(
                FreeVerb.ar(~sig.distort,0.12,100)
                ,1,(1..16),32).softclip
            ,0.12,1,0.5)

    }).play;
)

s.freeAll
