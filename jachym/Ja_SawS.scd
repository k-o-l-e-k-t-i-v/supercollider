
// use Ja_Mixer for play

(
SynthDef(\SawA, { |out = 0, gate = 1, amp = 1, freq = 90, sustain = 0.5|
	var tone, osc, aEnv, fEnv;
	aEnv = EnvGen.kr(Env.asr(0.95*sustain, 1, 0.05*sustain),gate, doneAction:2);
	fEnv = EnvGen.kr(Env([freq,freq,Rand(freq*7,freq*9),1],[0.7*sustain, 0.15*sustain,0.10*sustain],\welch));
	osc = LFSaw.ar([fEnv+1,fEnv-1],0,amp)*LFPulse.ar([fEnv+1,fEnv-1],0,0.9,amp);
	tone = osc * aEnv;
	Out.ar(out, tone);
}).add;
SynthDef(\SawB, { |out, gate = 1, sustain, freq, amp|
	var osc, tone, num, fEnv, aEnv;
	num = 2;
	aEnv = EnvGen.kr(Env.adsr(0.15*sustain,0.15*sustain, 0.6, 0.7*sustain,[-4,4]),gate, doneAction:2);
	fEnv = LFSaw.kr([Rand(freq*2-0.8,freq*2+0.2),Rand(freq*2-0.2,freq*2+0.8)],0,0.8,0.2);
	osc = Mix.fill(num, { |i|
		LFSaw.ar(fEnv,0.01*i, 1)*LFPulse.ar(freq*1.5,0.01*i,[0.3,0.7],1)*GrayNoise.ar(0.7,0.3);
	});
	tone = osc * aEnv * amp;
	Out.ar(out, tone);
}).add;
SynthDef(\SawC, { |out, gate = 1, amp, freq, sustain|
	var tone, osc, aEnv, fEnv;
	aEnv = EnvGen.kr(Env.asr(0.95*sustain, 1, 0.05*sustain),gate);
	fEnv = EnvGen.kr(Env([freq,freq*2,Rand(freq*2,freq*3),1],[0.7*sustain, 0.15*sustain,0.15*sustain],\welch));
	osc = LFSaw.ar([fEnv+1,fEnv-1],0,1)*LFPulse.ar(Saw.ar(0.5,100,200),0,0.9,1)*PinkNoise.ar(SinOsc.kr([8,9],0,0.5),0.5);
	tone = osc * aEnv * amp;
	DetectSilence.ar(tone,time:sustain*0.1,doneAction:2);
	Out.ar(out, tone);
}).add;
)

(
Pdef(\SawA,
	Pbind(\instrument, \SawC, \amp, 1, \out, ~ch[0], \group, ~synG,
		\legato, Pswitch([
			Pseq([Pn(0.3,4)]),
			Pseq([0.1,0.3,0.7,1]),
			Pseq([0.1,0.1,0.3,1]),
		], Pseq([0,1,0,2],inf)),
		\dur, Pseq([0.75,Rest(0.25), 0.125,0.125,Rest(0.5),0.25, Rest(2)], inf),
		\octave, Pstutter(Pseq([16,8],inf),Pseq([2,3],inf)),
		\degree, Pseq([Pn(4,16),Pn(3,16)],inf),
	)
).play(quant:8);
)
Pdef(\SawA).stop;
(
Pdef(\SawB,
	Pbind(\instrument, \SawB, \amp, 1, \out, ~ch[1], \group, ~synG,
		\legato, 0.7,
		\dur, Pseq([Rest(1),0.875,0.125,2], inf),
		\octave, Pstutter(Pseq([16,4],inf),Pseq([3,4],inf)),
		\degree, Pseq([Pn(4,16),Pn(7,8)],inf),
	)
).play(quant:8);
)
Pdef(\SawC).stop;
(
Pdef(\SawC,
	Pbind(\instrument, \SawA, \amp, 1, \out, ~ch[2], \group, ~synG,
		\legato, 0.2,
		\dur, Pseq([Pn(0.0625,16), Rest(7)], inf),
		\octave, Pstutter(Pseq([32,14,2],inf),Pseq([7,6,8],inf)),
		\degree, Pseq([Pn(4,16),Pn(7,8)],inf),
	)
).play(quant:8);
)
Pdef(\SawB).stop;
