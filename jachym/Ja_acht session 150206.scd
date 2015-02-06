s.scope(2);
s.plotTree;

// to play use Ja_Mixer

(
SynthDef(\SawNoise1, { |bus, gate = 1, freq, sustain, amp|
	var n, osc, aEnv, tone;
	n = 7;
	aEnv = EnvGen.kr(Env([0,1,0.7,0], [0.3,0.2,1.2]*sustain,[\welch,\sin,\exp]),gate,doneAction:2);
	osc = Mix.fill(n,{ |i|
		LFSaw.ar([freq, freq+2], i*0.01, 1/n)*Pulse.ar([freq,freq], i*0.1, 1, 1-PinkNoise.kr(0.15,0.1));
	});
	tone = osc * aEnv * amp;
	Out.ar(bus, tone);
}).add;
SynthDef(\SinNoise1, { |bus, gate = 1, freq, sustain, amp|
	var n, osc, aEnv, tone;
	n = 12;
	aEnv = EnvGen.kr(Env([0,1,0.7,0], [0.3,0.2,0.7]*sustain,[\welch,\sin,\exp]),gate,doneAction:2);
	osc = Mix.fill(n,{ |i|
		SinOsc.ar([freq, freq+2], i*0.01, 1/n)*SinOsc.ar([75,80], 0,1, 1-PinkNoise.kr(0.45,0.2));
	});
	tone = osc * aEnv * amp;
	Out.ar(bus, tone);
}).add;
SynthDef(\DrumA5, { |out, gate = 1, freq, pan, amp, sustain, lpf|
	var fMod, aEnv, fEnv, osc, tone;
	fMod = 0.025*sustain;
	aEnv = EnvGen.kr(Env([0.0,1.0,0.4,0.0],[0.05*sustain,0.3*sustain,0.65*sustain]), gate);
	fEnv = EnvGen.kr(Env([Rand(1700,2100),freq,freq*0.5],[0.12*sustain,0.78*sustain]*fMod,\exp));
	osc = SinOsc.ar([fEnv,fEnv+10],0,SinOsc.kr(55,0,0.85,0.15));
	tone = osc * aEnv * amp;
	tone = LPF.ar(tone, fEnv + lpf);
	// tone = FreeVerb.ar(tone, 0.3, 0.8, 0.1, 1, tone);
	DetectSilence.ar(tone, doneAction:2);
	Out.ar(out,Pan2.ar(tone,pan));
}).add;
SynthDef(\Hat, {|out, gate = 1, freq, amp, sustain|
	var aEnv = EnvGen.kr(Env.adsr(0.01,0.19,0.8,0.8),gate, doneAction:2);
	var osc = HPF.ar(WhiteNoise.ar(Saw.kr([4,5],SinOsc.kr(16,0,0.3))),freq)*LFSaw.ar(40,[0,0.01,0.02,0.05],0.2,0.8);
	var tone = osc * aEnv * amp;
	Out.ar(out,tone);
}).add;
)

(
Pdef(\test2,
	Pbind(\instrument, \SawNoise1,
		\bus, ~ch[0], \amp, 1,
		\dur, 0.0625,
		\legato, 2.5,
		\octave, 2,
		\degree, Pswitch([
			Pseq([2,2,2,2b, 2,3,2,3]),
			Pseq([2,2,2,2b, 2,3,2,5]),
			Pseq([2,2,2,2b, 2,3,2,7]),
			Pseq([2,2,2,2b, 2,3,2,4])
		], Pseq([Pn(0,4),Pn(3,16),Pn(1,2),Pn(2,16), Pn(3,4)], inf))
	)
).play(quant:1);
)
Pdef(\test2).stop;
(
Pdef(\test3).fadeTime_(4);
Pdef(\test3,
	Pbind(\instrument, \SinNoise1,
		\bus, ~ch[1], \amp, 1,
		\dur, 8,
		\legato, 1.8,
		\octave, 3,
		\degree, Pseq([2,4,3,2b, 2,3,2,3], inf)
	)
).play(quant:1);
)
Pdef(\test3).stop;
(
Pdef(\DrumSeq1,
	Pbind(\instrument, \DrumA5, \out, ~ch[2], \group, ~synG, \amp, 1,
		\dur, Pseq([0.125,0.125,Rest(0.5),0.25], inf),
		\legato, Pseq([0.7,1.5,0.4,0.3], inf),
		\octave, Pstutter(Pseq([32,8],inf),Pseq([5,4], inf)),
		\degree, Pseq([5,5,5,6b], inf),
)).play(quant:2);
)
Pdef(\DrumSeq1).stop;

(
Pdef(\HatSeq,
	Pbind(\instrument, \Hat, \out, ~ch[3], \group, ~synG, \amp, 1,
		\dur, Pseq([Pn(0.125,2), Rest(0.75),Pn(0.25,4), Rest(1)],inf),
		\legato, Pseq([0.1,0.8,0.1,0.8,0.4,0.2], inf),
		\freq, Pwhite(100,180, inf)
	)
).play(quant:1);
)
Pdef(\HatSeq).stop;
