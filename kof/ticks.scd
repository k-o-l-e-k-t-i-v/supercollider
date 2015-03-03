
(
    Ndef(\tick).quant = 2.0;
    Ndef(\tick,{

        ~oct = Duty.kr([16,8,4],0,Dseq([0,-12,-24,0,12,24,-36],inf));
        ~mid = Duty.kr([1,1/2,1/4],0,Dseq([65,64,72],inf));
        ~base = Duty.kr(4,0,Dseq([1,2,4,1,2,1.5,1,2,1.25],inf));
        ~base = ~base * ([60,~mid,67]-~oct).midicps;

        ~a = Impulse.ar(1/2,(1..16).scramble/16);
        ~env = Decay.ar(~a,(1..16)/SinOsc.ar(0.1/(1..8)).range(4,16));
        ~tone = SinOsc.ar(~base*(2**(1..8))/16pi,mul:0.2);
        ~tone = ~tone + (LFSaw.ar((~base/16.1pi)*(2**(1..8)),mul:0.2) * LFSaw.ar(1/4/(1..8)).range(0,1));
        
        ~tone = CombN.ar(~tone,1,(1..16),32);
        ~tone = ~tone * ~env.exprange(0.0001,1);
        ~tone = CompanderD.ar(~tone,0.5,1,1/10,0.02,0.2);
        ~tone = FreeVerb2.ar(~tone.distort,~tone.distort,0.133,2);

        Splay.ar(~tone,0.1,0.95,0.5);


    }).play;
)
