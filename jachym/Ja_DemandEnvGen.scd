p = ProxySpace.push(p);

(
~a.play.quant_(1);
~a[0] = { SinOsc.ar([60,68,50,52], 0, DemandEnvGen.kr( Dseq([0,0,0.2], inf), Dseq([4,1,1], inf))) };
~a[1] = { LFSaw.ar(120!2) * BrownNoise.ar(0.2,SinOsc.kr(2,0,0.4,0.4)) * DemandEnvGen.kr( Dseq([0.1,0.0,0.3], inf), Dseq([1.5,0.25,0.25], inf)) };
~a[2] = { SinOsc.ar( DemandEnvGen.kr( Dseq([8000,12000,12300], inf), Dseq([1.5,0.25,0.25], inf))!2,0,0.25,0.3) };
~a[30] = \filter -> {|in| LPF.ar(in, DemandEnvGen.kr( Dseq([400,800,3200], inf), Dseq([8,4,2], inf))) };
~a[32] = \filter -> {|in| GVerb.ar(in, 440,1) };
)
~a.free(10);



