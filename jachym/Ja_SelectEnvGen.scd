p = ProxySpace.push(p);

(
ProxySynthDef(\noise, {|t_gate = 1, freq, amp, sustain, aSel, fSel|
	var aEnv1 = EnvGen.kr(Env([0,1,0], [0.15,0.85]), t_gate, amp, 0, sustain, 2);
	var aEnv2 = EnvGen.kr(Env([0,1,0.2,0.8,0], [0.65,0.05,0.25,0.05]), t_gate, amp, 0, sustain, 2);
	var aEnv3 = EnvGen.kr(Env([0,0.7,0.25,1,0], [0.25,0.45,0.25,0.05],\step), t_gate, amp, 0, sustain, 2);
	var aEnv = Select.kr(aSel, [aEnv1,aEnv2,aEnv3]);
	var fEnv1 = EnvGen.kr(Env([freq,18000,freq*1.5,freq], [0.05,0.15,0.8]),t_gate,1,0,sustain);
	var fEnv2 = EnvGen.kr(Env([freq,freq*0.8,6000,freq], [0.8,0.15,0.05]),t_gate,1,0,sustain);
	var fEnv = Select.kr(fSel, [freq, fEnv1, fEnv2]);
	Splay.ar(LFSaw.ar(fEnv!2) * BrownNoise.ar(0.2,0.8) * aEnv);
}).add;
)

~tone.play.fadeTime_(4);
~tone[0] = { Pan2.ar(SinOsc.ar(60,[0,0.5], SinOsc.kr(1/8, 0, 0.03, 0.12)), LFSaw.kr([0.5,0.51])); }
~tone.free(20);

~q.play.quant_(2).fadeTime_(0.5);
(
~q[0] = Pbind(
	\instrument, \noise, \amp, 0.45,
	\octave, 2, \degree, Pseq([3,3,3,7], inf),
	\dur, 2, \legato, 1.25,
	\aSel, Pseq([0,0,0,1,0,0,0,2], inf),
	\fSel, Pstutter(Pseq([7,1,7,1,15,1], inf), Pseq([0,2,0,1,0,2], inf))
);
)
~q[30] = \filter -> {|in| Balance2.ar(in[0], in[1], SinOsc.kr(1,0,0.6,0.4)) };
~q[32] = \filter -> {|in| LPF.ar(in, Saw.kr(1/[4,8,16],3400,4600)) };
~q.removeAt(30);
~q.free(4);

