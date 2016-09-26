SynthDef(\vinyl_noise, { | out=0, amp= 0.5, rel=0, dur=1, power=1, fade = 0, cracks=8, bpfvalue=600|
var sig;
var adsr = EnvGen.ar(Env.linen(dur,rel,0),doneAction:2);
sig = BPF.ar(Dust2.ar(cracks,0.8)+Dust2.ar(cracks,0.4)+VarSaw.ar(17,0.4,0.5, power)+Dust2.ar(cracks/4,0.1)+Dust2.ar(10,0.05), bpfvalue)!2;
sig = FreeVerb.ar(sig * amp, 0.2, 0.8, 0.5, 2);
Out.ar(out, XFade2.ar(sig * adsr, LPF.ar(sig * adsr, bpfvalue), fade, 1));
sig = sig.tanh;
}).add;