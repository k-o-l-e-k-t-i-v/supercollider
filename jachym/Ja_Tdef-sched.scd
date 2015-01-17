s.scope(2);
s.plotTree;
FreqScope();

(
SynthDef(\DrumA, { |out = 0, gate = 1, amp = 1, freq = 50, sustain = 0.9|
	var tone, osc, aEnv, fEnv;
	aEnv = EnvGen.kr(Env.adsr(0.15*sustain, 0.35*sustain, 0.6, 0.5*sustain),gate);
	fEnv = EnvGen.kr(Env([Rand(600,700),freq,0.01],[0.03*sustain, 0.97*sustain],\exp));
	osc = SinOsc.ar([fEnv,fEnv],0,amp);
	tone = osc * aEnv;
	tone = LPF.ar(tone,fEnv + 700);
	tone = FreeVerb.ar(tone*0.5,0.8,0.5,0.5, 1,tone*0.5);
	DetectSilence.ar(tone,doneAction:2);
	Out.ar(out, tone);
}).add;

SynthDef(\DrumC, { |out = 0, gate = 1, amp = 1, freq = 90, sustain = 0.5|
	var tone, osc, aEnv, fEnv;
	aEnv = EnvGen.kr(Env.adsr(0.03*sustain, 0.45*sustain, 0.5, 0.52*sustain),gate);
	fEnv = EnvGen.kr(Env([Rand(1700,1900),freq,0.01],[0.05*sustain, 0.95*sustain],\exp));
	osc = SinOsc.ar([fEnv-10,fEnv+10],0,amp)*Pulse.ar([fEnv+10,fEnv-10],0.9,1);
	tone = osc * aEnv;
	tone = LPF.ar(tone,fEnv + 100);
	tone = FreeVerb.ar(tone*0.5,2,0.5,0.5, 1, tone*0.5);
	DetectSilence.ar(tone,doneAction:2);
	Out.ar(out, tone);
}).add;

SynthDef(\SawB, { |out = 0, gate = 1, sustain = 1, freq = 150, amp = 0.2|
	var osc, tone, num, fEnv, aEnv;
	num = 2;
	aEnv = EnvGen.kr(Env.asr(0.35*sustain, amp, 0.65*sustain,4),gate, doneAction:2);
	fEnv = LFSaw.kr([Rand(freq*2-0.8,freq*2+0.2),Rand(freq*2-0.2,freq*2+0.8)],0,0.8,0.2);
	osc = Mix.fill(num, { |i| LFSaw.ar(fEnv,0.1*i, SinOsc.kr(freq,0,SinOsc.kr(freq/2,0,0.8/num),0.2/num))*LFPulse.ar(freq*1.5,0.01*i,0.8,0.7/num,0.3/num)});
	tone = osc * aEnv;
	tone = LPF.ar(tone, fEnv+1800);
	Out.ar(out, Pan2.ar(tone,SinOsc.kr(2,0,0.7)));
}).add;
)


(
Pdef(\seqSawB, {
	Pbind(\instrument, \SawB, \amp, 0.3,
		\dur, Pseq([3.25,0.75,2,4], inf),
		\octave, 3,
		\degree, Pswitch([
			Pseq([7,3,7,5]),
			Pseq([7,11,10,8]),
			Pseq([\,\,\,\])
		],Pseq([0,0,2,0,1,1,0], inf)),
		\legato, 1.3)
});
// Pdef(\seqSawB).fadeTime = 1;

Pdef(\seqDrum1, {
	Pbind(
		\instrument, \DrumA,
		\amp, 0.9,
		\octave, Pstutter(Pseq([2,6],inf),Pseq([3,2], inf)),
		\degree, Pseq([Pn(5,8),Pn(4,8)], inf),
		\legato, Pseq([0.6,0.8], inf),
		\dur, Pswitch([
			Pseq([0.4,0.1,Rest(0.5)]),
			Pseq([0.4,0.3,Rest(0.3)])
		], Pseq([0,0,0,1], inf))
	);
});
Pdef(\seqDrum1).fadeTime = 4.0;

Pdef(\seqDrum2, {
	Pbind(
		\instrument, \DrumC, \amp, 0.7, \octave, 2,
		\degree, Pseq([Pn(7,8),Pn(6,8)], inf),
		\legato, Pseq([0.9,1.0,0.7,1.1,0.9], inf),
		\dur, Pseq([Pn(0.5,8), Rest(1),Pn(0.5,8), Rest(2),Pn(0.5,8), Rest(2)], inf)
	)
});
Pdef(\seqDrum2).fadeTime = 4.0;

Pdef(\amp_Fader30,	Pmono(\fader, \out, 0, \in, 30, \dur, 0.0625, \amp, Pseq([0.5], inf)));
Pdef(\amp_Fader30).fadeTime = 8.0;
)

(
~tc = TempoClock.default;
// ~tc.sched(2, { ~tc.tempo = 120 / 60 });
Tdef(\master,{
	// ~amp30 = Synth(\sinenv, [\bus, 30, \target, 0.5, \time, 0.5]);

	// loop{
	~tc.sched(0, { Pdef(\seqDrum1).play; });
	~tc.sched(4.5, { Pdef(\seqSawB).play; });
	~tc.sched(14.5, { Pdef(\seqSawB).stop; });
	~tc.sched(20.5, { Pdef(\seqSawB).play; });
	~tc.sched(48.5, { Pdef(\seqDrum2).play; });
	~tc.sched(90.5, { Pdef(\seqSawB).stop; });
	~tc.sched(94, { Pdef(\seqDrum1).stop; });
	~tc.sched(102, { Pdef(\seqDrum2).stop; });
	// Pbindef(\amp_Fader30, \amp, Pseq([0.5],inf));
	// Pbindef(\seqDrum1, \amp, 0.5);
	// 70.wait;
	// }
}).play(quant:1);
)
Tdef(\master).stop;
