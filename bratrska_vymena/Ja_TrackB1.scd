
(
SynthDef(\DrumA2, { |bus, gate = 1, amp = 1, freq = 50, sustain = 0.9|
	var tone, osc, aEnv, fEnv;
	aEnv = EnvGen.kr(Env.adsr(0.05*sustain,0.25*sustain, 0.15, 0.7*sustain,curve:-4),gate);
	fEnv = EnvGen.kr(Env([Rand(700,900),freq],[sustain*0.04],\exp));
	osc = SinOsc.ar([fEnv+0.1,fEnv-0.1],0,0.5)*LFPulse.ar([fEnv-0.5,fEnv+0.5],sustain*0.1,0.3,0.4,1.6);
	tone = osc * aEnv * amp;
	tone = LPF.ar(tone,fEnv + 10);
	tone = BPF.ar(tone,fEnv/2,50,1);
	tone = FreeVerb.ar(tone,0.2,0.7,0.5, 1,tone);
	DetectSilence.ar(tone, doneAction:2);
	Out.ar(bus, tone);
}).add;

SynthDef(\SawPulse, { |bus, gate = 1, freq = 200, amp = 1, sustain = 1|
	var aEnv, fEnv, tone;
	aEnv = EnvGen.ar(Env.asr(0.15*sustain, 0.9, 0.85*sustain),gate);
	fEnv = EnvGen.ar(Env([Rand(4000, 8000),freq], [0.1*sustain],\exp));
	tone = Pulse.ar([freq, freq], LFSaw.ar(6000,0.2,0.5,0.5), 1);
	tone = tone * aEnv * amp;
	tone = FreeVerb.ar(tone*0.5,sustain,0.7,0.5, 1,tone*0.5);
	tone = HPF.ar(tone, fEnv);
	DetectSilence.ar(tone,doneAction:2);
	Out.ar(bus, tone);
}).add;

SynthDef(\Saw1, { |bus, gate = 1, amp, freq, sustain|
	var aEnv1, aEnv2, osc1, osc2, osc3, tone;
	aEnv1 = EnvGen.kr(Env.adsr(0.15*sustain, 0.35*sustain, 0.45, 0.5*sustain,curve:4),gate, doneAction:2);
	osc1 = LFSaw.ar([freq,freq], 0, SinOsc.kr(2,0,0.15,0.165));
	osc1 = FreeVerb.ar(osc1,0.8,2.7,0.9,1,osc1);
	aEnv2 = EnvGen.kr(Env.adsr(0.15*sustain, 0.35*sustain, 0.65, 0.45*sustain,curve:-2));
	osc2 = LFSaw.ar([freq-0.01,freq+0.01], 0.5*pi, SinOsc.kr(8,0,0.15,0.165));
	osc2 = FreeVerb.ar(osc2,0.8,5.7,0.5,1,osc2);
	osc3 = Saw.ar([64.01,64], SinOsc.kr(16,0,0.15,0.165));
	tone = (osc1+(osc2*aEnv2)+osc3) * aEnv1 * amp;
	Out.ar(bus, tone);
}).add;

SynthDef(\SinB, { |bus, gate = 1, freq = 130, amp = 1, sustain = 1|
	var osc, aEnv, num;
	aEnv = EnvGen.kr(Env([0,1,0.3,0.5,0.2,0.4,0],[0.5*sustain,0.01*sustain,0.19*sustain,0.01*sustain,0.29*sustain],\welch),gate,amp,doneAction:2);
	num = 21;
	osc = Mix.fill(num, {|i| SinOsc.ar([freq+(0.005*i),freq-(0.005*i)],0.0001*i,1/num*VarSaw.kr([63,64],0.0001*i,0.1,0.7,0.3))});
	osc = LPF.ar(osc,freq+800,osc);
	osc = AllpassC.ar(osc,0.2,0.2,1,1,osc)*aEnv;
	Out.ar(bus, osc);
}).add;

SynthDef(\lpf, { |bus, freq|
	var eff, in;
	in = In.ar(bus, 2);
	eff = LPF.ar(in, freq, 1, in);
	ReplaceOut.ar(bus,eff);
}).add;

SynthDef(\pan, { |bus, pos, level|
	var eff, in;
	in = In.ar(bus, 2);
	eff = Pan2.ar(in, pos, level);
	ReplaceOut.ar(bus,eff);
}).add;

SynthDef(\glitch, { | bus, mute = 1, amp = 1 |
	ReplaceOut.ar(bus, In.ar(bus, 2) * mute * amp);
}).add;
)

(
// wait for buffers to load
// s.sync;

SynthDef(\fader, { | out, in, mute = 1, amp = 1 |
	Out.ar(out, In.ar(in, 2) * mute * amp)
}).add;

SynthDef(\sinenv, { | bus target time |
	ReplaceOut.kr(bus, EnvGen.kr(Env([In.kr(bus), target], [time], \sin), doneAction: 2))
}).add;


// Buses /////////////////////////

~numChannels = 6;

~synthGroup = Group.new;
~fxGroup = Group.new(~synthGroup, \addAfter);
~mixGroup = Group.new(~fxGroup, \addAfter);

~master = Bus.audio(s, 2);
~masterAmp = Bus.control(s, 1);
~masterFader = Synth(\fader, [\out, 0, \in, ~master], ~mixGroup);
~masterFader.map(\amp, ~masterAmp);

~numChannels.do { |i|
	("ch" ++ i).asSymbol.envirPut( Bus.audio(s, 2) );
	("chAmp" ++ i).asSymbol.envirPut( Bus.control(s, 1) );
	("fader" ++ i).asSymbol.envirPut( Synth(\fader,
		[\out, ~master, \in, ("ch" ++ i).asSymbol.envirGet], ~mixGroup) );
	("fader" ++ i).asSymbol.envirGet.map(\amp, ("chAmp" ++ i).asSymbol.envirGet);
};
)

(
Tdef(\phaseIntro,	{

	~masterAmp.value = 0.9;
	~chAmp0.value = 0.0; //Drum1
	~chAmp1.value = 0.0; //Drum2
	~chAmp2.value = 0.0; //SawPulse1
	~chAmp3.value = 0.0; //Saw1
	~chAmp4.value = 0.0; //Sin1
	~chAmp5.value = 0.0; //

	Pdef(\seqDrumA2_bass, Pbind(\instrument, \DrumA2, \bus, ~ch0, \group, ~synthGroup.nodeID, \amp, 1));
	Pdef(\seqDrumA2_kik, Pbind(\instrument, \DrumA2, \bus, ~ch1, \group, ~synthGroup.nodeID, \amp, 1));
	Pdef(\seqSawPulse, Pbind( \instrument, \SawPulse, \bus, ~ch2, \group, ~synthGroup.nodeID, \amp, 1));

	~tc.sched(0, {
		Synth(\sinenv,[\bus, ~chAmp2, \target, 0.6, \time, 30], ~mixGroup);
		Pdef(\seqSawPulse).play;
		Pbindef(\seqSawPulse,
			\dur, Pseq([Rest(0.25),0.75], inf),
			\legato, Pseg(Pseq([1.6,1.2,0.6,0.6,1.6], inf), Pseq([10,20,15,15], inf),\sin, inf),
			\octave, 2
		);
	});
	~tc.sched(20, {
		Synth(\sinenv,[\bus, ~chAmp1, \target, 0.3, \time, 10], ~mixGroup);
		Pbindef(\seqDrumA2_kik,
			\dur, Pseq([Rest(0.5),0.5], inf),
			\legato, Pseg(Pseq([0.01,0.2,0.2], inf), Pseq([20,20], inf),\sin, inf),
			\octave, 5
		);
		Pdef(\seqDrumA2_kik).play;
	});
	~tc.sched(30, { Synth(\sinenv,[\bus, ~chAmp2, \target, 0.4, \time, 30], ~mixGroup); });
	~tc.sched(40, {
		Synth(\sinenv,[\bus, ~chAmp0, \target, 0.2, \time, 15], ~mixGroup);
		Pbindef(\seqDrumA2_bass,
			\dur, Pseq([0.5,Rest(0.5)], inf),
			\legato, 2.0,
			\octave, 2,
			\degree, Pseq([3,\], inf),
			\amp, Pseq([1,\], inf)
		);
		Pdef(\seqDrumA2_bass).play;
	});
	~tc.sched(60, {
		Pdef(\seqDrumA2_kik).pause;
		Synth(\sinenv,[\bus, ~chAmp2, \target, 0.0, \time, 1.5], ~mixGroup);
		Synth(\sinenv,[\bus, ~chAmp1, \target, 0.5, \time, 1], ~mixGroup);
		Synth(\sinenv,[\bus, ~chAmp0, \target, 1.0, \time, 2], ~mixGroup);
		Pbindef(\seqDrumA2_bass, \dur, Pseq([Pn(0.75,1), Rest(0.25),Pn(0.5,2)]), \amp, Pseq([0.3,\,0.5,0.8,1]));
	});
	~tc.sched(62, {
		Pdef(\seqSawPulse).stop;
		Pdef(\seqDrumA2_bass).stop;
		Pdef(\seqDrumA2_kik).stop;
	});
});

Tdef(\phasePhase1,	{
	~masterAmp.value = 0.9;
	~chAmp0.value = 1.0; //Drum1
	~chAmp1.value = 0.5; //Drum2
	~chAmp2.value = 0.0; //SawPulse1
	~chAmp3.value = 0.0; //Saw1
	~chAmp4.value = 0.0; //Sin1
	~chAmp5.value = 0.0; //

	Pdef(\seqDrumA2_bass, Pbind(\instrument, \DrumA2, \bus, ~ch0, \group, ~synthGroup.nodeID, \amp, 1));
	Pdef(\seqDrumA2_kik, Pbind(\instrument, \DrumA2, \bus, ~ch1, \group, ~synthGroup.nodeID, \amp, 1));
	Pdef(\seqSawPulse, Pbind( \instrument, \SawPulse, \bus, ~ch2, \group, ~synthGroup.nodeID, \amp, 1));
	Pdef(\seqSin2, Pbind( \instrument, \SinB, \bus, ~ch4, \group, ~synthGroup.nodeID, \amp, 1));

	~tc.sched(0, {
		Synth(\sinenv,[\bus, ~chAmp0, \target, 0.7, \time, 10], ~mixGroup);
		Synth(\sinenv,[\bus, ~chAmp2, \target, 0.2, \time, 2], ~mixGroup);
		Synth(\sinenv,[\bus, ~chAmp4, \target, 0.4, \time, 1], ~mixGroup);

		Pbindef(\seqDrumA2_bass,
			\dur, Pseq([0.25,0.25,Rest(0.5)], inf),
			\legato, 2.0,
			\octave, 2,
			\degree, Pseq([3,1,\], inf),
			\amp, Pseq([1,\], inf)
		);
		Pbindef(\seqDrumA2_kik,
			\dur, Pseq([Rest(0.5),0.5], inf),
			\legato, 0.2,
			\octave, 6
		);
		Pbindef(\seqSawPulse,
			\dur, Pseq([Rest(0.25),0.75], inf),
			\legato, Pseg(Pseq([0.6,0.8,0.6], inf), Pseq([20,20], inf),\sin, inf),
			\octave, 2
		);
		Pbindef(\seqSin2,
			\dur, Pseq([3,Rest(1)], inf),
			\sustain, 4.8,
			\octave, 4,
			\degree, Pseq([4,\,4,\,4,\,7,\,4,\,4,\,7,\,9,\], inf)
		);

		Pdef(\seqSawPulse).play;
		Pdef(\seqDrumA2_bass).play;
		Pdef(\seqDrumA2_kik).play;
		Pdef(\seqSin2).play;
	});
	~tc.sched(40, {
		Pdef(\seqSawPulse).stop;
		Pdef(\seqDrumA2_bass).stop;
		Pdef(\seqDrumA2_kik).stop;
		Pdef(\seqSin2).stop;
	});
});

Tdef(\phasePhase2,	{
	~masterAmp.value = 0.9;
	~chAmp0.value = 0.7; //Drum1
	~chAmp1.value = 0.5; //Drum2
	~chAmp2.value = 0.2; //SawPulse1
	~chAmp3.value = 0.0; //Saw1
	~chAmp4.value = 0.4; //Sin1
	~chAmp5.value = 0.0; //

	Pdef(\seqDrumA2_bass, Pbind(\instrument, \DrumA2, \bus, ~ch0, \group, ~synthGroup.nodeID, \amp, 1));
	Pdef(\seqDrumA2_kik, Pbind(\instrument, \DrumA2, \bus, ~ch1, \group, ~synthGroup.nodeID, \amp, 1));
	Pdef(\seqSawPulse, Pbind( \instrument, \SawPulse, \bus, ~ch2, \group, ~synthGroup.nodeID, \amp, 1));
	Pdef(\seqSaw2,	Pbind( \instrument, \Saw1, \bus, ~ch3, \group, ~synthGroup.nodeID, \amp, 1));
	Pdef(\seqSin2, Pbind( \instrument, \SinB, \bus, ~ch4, \group, ~synthGroup.nodeID, \amp, 1));

	Pdef(\lpf_Saw2, Pmono( \lpf, \bus, ~ch3, \group, ~fxGroup.nodeID, \dur, 0.0625,
		\freq, Pseg(Pseq([10,100,16000], inf),Pseq([20,20], inf), \sin, inf))
	);

	~tc.sched(0, {
		Synth(\sinenv,[\bus, ~chAmp1, \target, 0.0, \time, 20], ~mixGroup);
		Synth(\sinenv,[\bus, ~chAmp2, \target, 0.7, \time, 35], ~mixGroup);
		Synth(\sinenv,[\bus, ~chAmp3, \target, 0.5, \time, 40], ~mixGroup);

		Pbindef(\seqDrumA2_bass,
			\dur, Pseq([0.25,0.25,Rest(0.5)], inf),
			\legato, 2.0,
			\octave, 2,
			\degree, Pseq([3,1,\], inf),
			\amp, Pseq([1,\], inf)
		);
		Pbindef(\seqDrumA2_kik,
			\dur, Pseq([Pseq([Rest(0.5),0.5],16), Rest(0.5), Pn(0.25,2)], inf),
			\legato, 0.2,
			\octave, 6
		);
		Pbindef(\seqSawPulse,
			\dur, Pseq([Rest(0.25),0.75], inf),
			\legato, Pseg(Pseq([0.6,0.2,0.6], inf), Pseq([35,5], inf),\sin, inf),
			\octave, 2
		);
		Pbindef(\seqSaw2,
			\dur, Pseq([8,Rest(2)], inf),
			\legato, 1,
			\octave, 3,
			\degree, Pseq([4,\,4,\,5,\,4,\,4,\,4,\,7,\,5,\], inf),
		);
		Pbindef(\seqSin2,
			\dur, Pseq([3,Rest(1)], inf),
			\sustain, Pseg(Pseq([4.8,2.4], inf), Pseq([40], inf),\sin, inf),
			\octave, 4,
			\degree, Pseq([4,\,4,\,4,\,7,\,4,\,4,\,7,\,9,\], inf)
		);

		Pdef(\seqDrumA2_bass).play;
		Pdef(\seqDrumA2_kik).play;
		Pdef(\seqSawPulse).play;
		Pdef(\seqSaw2).play;
		Pdef(\seqSin2).play;
		Pdef(\lpf_Saw2).play;

	});
	~tc.sched(35, {
		Synth(\sinenv,[\bus, ~chAmp2, \target, 0.1, \time, 5], ~mixGroup);
		Pdef(\seqDrumA2_kik).stop;
		Pbindef(\seqSin2, \octave, Pseg(Pseq([4,3], inf), Pseq([20], inf),\sin, inf));
	});

	~tc.sched(40, {
		Pdef(\seqDrumA2_bass).stop;

		Pdef(\seqSawPulse).stop;
		Pdef(\seqSaw2).stop;
		Pdef(\seqSin2).stop;

		Pdef(\lpf_Saw2).stop;
	});
});

Tdef(\phasePhase3,	{
	~masterAmp.value = 0.9;
	~chAmp0.value = 0.6; //Drum1
	~chAmp1.value = 0.0; //Drum2
	~chAmp2.value = 0.1; //SawPulse1
	~chAmp3.value = 0.5; //Saw1
	~chAmp4.value = 0.7; //Sin1
	~chAmp5.value = 0.0; //

	Pdef(\seqDrumA2_bass, Pbind(\instrument, \DrumA2, \bus, ~ch0, \group, ~synthGroup.nodeID, \amp, 1));
	Pdef(\seqSawPulse, Pbind( \instrument, \SawPulse, \bus, ~ch2, \group, ~synthGroup.nodeID, \amp, 1));
	Pdef(\seqSaw2,	Pbind( \instrument, \Saw1, \bus, ~ch3, \group, ~synthGroup.nodeID, \amp, 1));
	Pdef(\seqSin2, Pbind( \instrument, \SinB, \bus, ~ch4, \group, ~synthGroup.nodeID, \amp, 1));

	~tc.sched(0, {

		Pbindef(\seqDrumA2_bass,
			\dur, Pseq([Pseq([0.25,0.25,Rest(0.5)], 9), Pn(0.25,4)], inf),
			\legato, 2.0,
			\octave, 2,
			\degree, Pseq([3,1,\], inf),
			\amp, Pseq([1,\], inf)
		);
		Pbindef(\seqSawPulse,
			\dur, Pseq([Rest(0.25),0.75], inf),
			\legato, 0.6,
			\octave, 4
		);
		Pbindef(\seqSaw2,
			\dur, Pseq([8,Rest(2)], inf),
			\legato, 1,
			\octave, 3,
			\degree, Pseq([4,\,4,\,5,\,4,\,4,\,4,\,7,\,5,\], inf),
		);
		Pbindef(\seqSin2,
			\dur, Pseq([8,Rest(2)], inf),
			\sustain, 2.4,
			\octave, 3,
			\degree, Pseq([4,\,4,\,4,\,7,\,4,\,4,\,7,\,9,\], inf)
		);

		Pdef(\seqDrumA2_bass).play;
		Pdef(\seqSawPulse).play;
		Pdef(\seqSaw2).play;
		Pdef(\seqSin2).play;

	});
	~tc.sched(75, {
		Synth(\sinenv,[\bus, ~masterAmp, \target, 0.0, \time, 5], ~mixGroup);
	});
	~tc.sched(80, {
		Pdef(\seqDrumA2_bass).stop;
		Pdef(\seqSawPulse).stop;
		Pdef(\seqSaw2).stop;
		Pdef(\seqSin2).stop;
	});
});
)

(
~tc = TempoClock.default;
p = Task({
	Tdef(\phaseIntro).embed; "intro".postln; 62.wait;
	Tdef(\phasePhase1).embed; "1.phase".postln;  40.wait;
	Tdef(\phasePhase2).embed; "2.phase".postln;  40.wait;
	Tdef(\phasePhase3).embed; "3.phase".postln;
}).play(quant:1);
)
p.stop;


s.plotTree;
s.scope(2);
FreqScope();
