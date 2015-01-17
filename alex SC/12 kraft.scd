(
SynthDef(\poly, { arg out, gate=1, freq;
	var aEnv,fEnv,osc1, osc2,flt;
	aEnv=EnvGen.kr(Env.asr(0.2,1,0.1), gate, doneAction:2);
	fEnv=EnvGen.kr(Env.asr(7,1,0.2), levelScale:12000);
	osc1=Pulse.ar(freq*[1,1007], LFCub.kr(2,0,0.3,0.5));
	osc2= Pulse.ar(freq/2,0.3);
	flt=RLPF.ar(osc1+osc2, fEnv,0.9, aEnv);
	Out.ar(out, flt);
}).play;
)

~poly=Pbind(
	\instrument, \poly,
	\scale, [0,1,2,3,4,5,6,7,8],
	\degree, Pseq([[8,12,15],[5,9,12]],4),
	\dur, 4,
	\legato, 0.5,
).play;
