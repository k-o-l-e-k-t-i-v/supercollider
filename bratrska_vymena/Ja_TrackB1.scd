



// koncept -- part01 ////////////////////////////
(
Pdef(\seqDrumA2, Pbind(\instrument, \DrumA2, \octave, 2, \dur, 0.5, \legato, 1.2, \amp, 0.8)).play(quant:1);

Pdef(\seqNPulse, Pbind(\instrument, \SawPulse, \octave, 4, \dur, Pseq([Rest(0.25),0.75], inf), \legato, 0.6, \amp, 0.2)).play(quant:1);

Pdef(\seqSaw2,	Pbind( \instrument, \Saw1, \bus, 0, \amp, 0.5, \octave, 3, \degree, Pseq([4,\,4,\,4,\,5,\,4,\,4,\,4,\,3,\,4,\,4,\,7,\,5,\], inf),
	\dur, Pseq([8,Rest(2)], inf), \legato, 1)
).play(quant:1);
)

// koncept -- part02 ////////////////////////////
(
Pdef(\seqDrumA2, Pbind(\instrument, \DrumA2, \octave, 2, \legato, 2.0, \amp, 0.6,
	\degree, Pseq([3,1,\], inf), \dur, Pseq([0.25,0.25,Rest(0.5)], inf))
).play(quant:1);

Pdef(\seqNPulse, Pbind(\instrument, \SawPulse, \octave, 4, \dur, Pseq([Rest(0.25),0.75], inf), \legato, 0.6, \amp, 0.1)).play(quant:1);

Pdef(\seqSaw2,	Pbind( \instrument, \Saw1, \bus, 0, \amp, 0.5, \octave, 3, \degree, Pseq([4,\,4,\,5,\,4,\,4,\,4,\,7,\,5,\], inf),
	\dur, Pseq([8,Rest(2)], inf), \legato, 1)
).play(quant:1);

Pdef(\seqSin2,	Pbind( \instrument, \SinB, \bus, 0, \amp, 0.7, \octave, 3, \degree, Pseq([4,\,4,\,7,\,4,\,4,\,5,\,9,\,7,\], inf),
	\dur, Pseq([8,Rest(2)], inf), \sustain, 2.4)
).play(quant:1);
)

// koncept -- part03 ////////////////////////////
(
Pdef(\seqDrumA2p, Pbind(\instrument, \DrumA2, \octave, 6, \dur, Pseq([Rest(0.5),0.5], inf), \legato, 0.2, \amp, 0.20)).play(quant:1);
Pdef(\seqDrumA2, Pbind(\instrument, \DrumA2, \octave, 2, \legato, 2.0, \amp, 0.6,
	\degree, Pseq([3,1,\], inf), \dur, Pseq([0.25,0.25,Rest(0.5)], inf))
).play(quant:1);

Pdef(\seqNPulse, Pbind(\instrument, \SawPulse, \octave, 2, \dur, Pseq([Rest(0.25),0.75], inf),
	\legato, Pseg(Pseq([0.6,0.6,1.6,0.6], inf), Pseq([10,20,20], inf),\sin, inf), \amp, 0.2)
).play(quant:1);

Pdef(\seqSin2,	Pbind( \instrument, \SinB, \bus, 0, \amp, 0.7, \octave, 4, \degree, Pseq([4,\,4,\,4,\,7,\,4,\,4,\,5,\,9,\], inf),
	\dur, Pseq([3,Rest(1)], inf), \sustain, 4.8)
).play(quant:1);
)

s.plotTree;
s.scope(2);
FreqScope();

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
)

(

// Buses /////////////////////////

~numChannels = 6;

~synthGroup = Group.new;
~fxGroup = Group.new(~synthGroup, \addAfter);
~mixGroup = Group.new(~fxGroup, \addAfter);

SynthDef(\fader, { | out, in, mute = 1, amp = 1 |
	Out.ar(out, In.ar(in, 2) * mute * amp)
}).add;

SynthDef(\sinenv, { | bus target time |
	ReplaceOut.kr(bus, EnvGen.kr(Env([In.kr(bus), target], [time], \sin), doneAction: 2))
}).add;

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

// Patterns  -- intro /////////////////////////
(
Pdef(\seqSawPulse_intro,
	Pbind( \instrument, \SawPulse, \bus, ~ch2, \group, ~synthGroup.nodeID, \amp, 1,
		\octave, 2, \dur, Pseq([Rest(0.25),0.75], inf),
		\legato, Pseg(Pseq([1.6,1.2,0.6,0.6,1.6], inf), Pseq([10,20,20,5], inf),\sin, inf),
));
Pdef(\seqDrumA2b_intro, Pbind(\instrument, \DrumA2, \bus, ~ch1, \group, ~synthGroup.nodeID, \amp, 1, \octave, 5,
	\dur, Pseq([Rest(0.5),0.5], inf),	\legato, Pseg(Pseq([0.01,0.2], inf), Pseq([20], inf),\sin, inf)
));
)

(
~masterAmp.value = 0.9;
~chAmp0.value = 0.0; //Drum1
~chAmp1.value = 0.0; //Drum2
~chAmp2.value = 0.0; //SawPulse1
~chAmp3.value = 0.0; //Saw1
~chAmp4.value = 0.0; //Sin1
~chAmp5.value = 0.0; //

~tc = TempoClock.default;
Tdef(\phaseIntro,	{
	// ~beat = 0; ~tc.schedAbs(~tc.beats.ceil, { ~beat = ~beat + 1; ~beat.postln; 1 });
	loop{
		~tc.sched(0, {
			Synth(\sinenv,[\bus, ~chAmp2, \target, 0.3, \time, 10], ~mixGroup);
			Pdef(\seqSawPulse_intro).play;
			// Pdef(\seqSaw1).play;
		});
		~tc.sched(20, {
			Synth(\sinenv,[\bus, ~chAmp1, \target, 0.3, \time, 10], ~mixGroup);
			Pdef(\seqDrumA2b_intro).play;
		});
		~tc.sched(39, {
			Synth(\sinenv,[\bus, ~chAmp2, \target, 0.0, \time, 1], ~mixGroup);
			Synth(\sinenv,[\bus, ~chAmp1, \target, 0.0, \time, 1], ~mixGroup);
		});
		~tc.sched(40, {
			Pdef(\seqSawPulse_intro).stop;
			Pdef(\seqDrumA2b_intro).stop;
		});
		40.wait;
	}
}).play(quant:1);
)

Tdef(\master).stop;

Tdef(\master).stop; s.freeAll;