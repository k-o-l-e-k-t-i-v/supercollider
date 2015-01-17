s.plotTree;
s.scope(2);

// TrackA1 --- 3:10min test /////////////////////////
(

// Synths /////////////////////////
SynthDef(\DrumB, { |out = 0, gate = 1, amp = 1, freq = 50, sustain = 0.9|
	var tone, osc, aEnv, fEnv;
	aEnv = EnvGen.kr(Env.adsr(0.4*sustain, 0.2*sustain, 0.35, 0.4*sustain),gate);
	fEnv = EnvGen.kr(Env([Rand(1800,2000),freq,0.01],[0.03*sustain, 0.97*sustain],\exp));
	osc = SinOsc.ar([fEnv*1.01,fEnv*(-1.01)],0,amp)*LFPulse.ar([fEnv+10,fEnv-10],0,0.5,1);
	tone = osc * aEnv;
	tone = FreeVerb.ar(tone*0.5,0.45,0.25,0.5, 1, tone*0.5);
	tone = LPF.ar(tone,fEnv + 100);
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

SynthDef(\SignalA, { |bus, gate = 1, freq = 800, amp = 0.2, sustain = 0.2, at = 0.05, rt = 0.125|
	var osc, aEnv, tone;
	osc = SinOsc.ar([freq-0.5,freq+0.5]);
	aEnv = EnvGen.ar(Env.asr(0.05*sustain,1, 0.95*sustain, 3),gate);
	tone = osc * aEnv * amp;
	tone = FreeVerb.ar(tone, 0.6,5);
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

SynthDef(\echo, { |bus, maxdeltime = 0.2, deltime = 0.2, dectime = 2|
	var eff, in;
	in = In.ar(bus, 2);
	eff = CombL.ar(in, maxdeltime, deltime, dectime,1, in);
	ReplaceOut.ar(bus,eff);
}).add;

SynthDef(\lpf, { |bus, freq|
	var eff, in;
	in = In.ar(bus, 2);
	eff = LPF.ar(in, freq, 1, in);
	ReplaceOut.ar(bus,eff);
}).add;

SynthDef(\fader, { | out, in, mute = 1, amp = 1 |
	Out.ar(out, In.ar(in, 2) * mute * amp)
}).add;

SynthDef(\sinenv, { | bus target time |
	ReplaceOut.kr(bus, EnvGen.kr(Env([In.kr(bus), target], [time], \sin), doneAction: 2))
}).add;
)

(

// Buses /////////////////////////

~numChannels = 6;

~mixGroup = Group.new;
~fxGroup = Group.new;
~synthGroup = Group.new;

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

// Patterns /////////////////////////

Pdef(\seqDrum1a,
	Pbind(	\instrument, \DrumC, \bus, ~ch4, \group, ~synthGroup.nodeID, \amp, 1,
		\octave, 5,	\degree, 4,
		\dur, Pseq([0.125,0.125, Rest(0.25)], inf), \legato, Pseq([0.2,0.5], inf)
));

Pdef(\seqDrum1b,
	Pbind(	\instrument, \DrumB, \bus, ~ch0, \group, ~synthGroup.nodeID,  \amp, 1,
		\octave, 4,	\degree, Pseq([Pn(5,2),Pn(4,4)], inf),
		\dur, Pseq([1, Rest(1),0.5,0.5, Rest(1)], inf),
		\legato, Pseq([1.2,1.7,1.2,1.4], inf)
));

Pdef(\seqSig,
	Pbind( \instrument, \SignalA, \bus, ~ch1, \group, ~synthGroup.nodeID, \amp, 1,
		\dur, Pseq([Pn(0.25,3),1.25,Rest(7)],inf),
		\legato, Pseq([Pn(0.55,3), 0.1,\], inf),
		\octave, 5, \degree, Pseq([Pn(4,15),Pn(4b,5),Pn(7b,5),Pn(7,5)], inf)
));

Pdef(\seqEcho0,
	Pmono( \echo, \dur, 0.0625, \bus, ~ch1, \group, ~fxGroup.nodeID, \maxdeltime, 4, \deltime, 0.5, \dectime, 4
));

Pdef(\seqSaw1,
	Pbind( \instrument, \Saw1, \bus, ~ch2, \group, ~synthGroup.nodeID, \amp, 1, \octave, 2, \degree, Pseq([4,4,4,4b], inf),
		\dur, Pseq([2,2,6], inf), \legato, 1
));

Pdef(\seqSaw2,
	Pbind( \instrument, \Saw1, \bus, ~ch3, \group, ~synthGroup.nodeID, \amp, 1, \octave, 4, \degree, Pseq([4,4,5,4b], inf),
		\dur, Pseq([2,Rest(8)], inf), \legato, 1
));

Pdef(\seqLPFch2_a,
	Pmono( \lpf, \dur, 0.0625, \bus, ~ch2, \group, ~fxGroup.nodeID,
		\freq, Pseg(Pseq([100,200,400,800,1600,100],inf),Pseq([20,20,20,40,20], inf),\sin, inf)
));

Pdef(\seqEcho2,
	Pmono( \echo, \dur, 0.0625, \bus, ~ch3, \group, ~fxGroup.nodeID, \maxdeltime, 2, \deltime, 2, \dectime, 10
));


// master /////////////////////////

~masterAmp.value = 0.9;
~chAmp0.value = 0.0; //beat
~chAmp1.value = 0.0; //signal
~chAmp2.value = 0.0; //saw1
~chAmp3.value = 0.0; //saw2
~chAmp4.value = 0.0; //beat2
~chAmp5.value = 0.0;

~tc = TempoClock.default;
Tdef(\master,	{
	// ~beat = 0; ~tc.schedAbs(~tc.beats.ceil, { ~beat = ~beat + 1; ~beat.postln; 1 });
	// loop{
	~tc.sched(0, {
		Synth(\sinenv,[\bus, ~chAmp2, \target, 0.3, \time, 10], ~mixGroup);
		Pdef(\seqLPFch2_a).play;
		Pdef(\seqSaw1).play;
	});
	~tc.sched(15, {
		Synth(\sinenv,[\bus, ~chAmp2, \target, 0.5, \time, 10], ~mixGroup);
		Synth(\sinenv,[\bus, ~chAmp0, \target, 0.7, \time, 5], ~mixGroup);
		Pdef(\seqDrum1b).play;
		Pbindef(\seqDrum1b, \dur, Pseq([1, Rest(1),0.5,0.5, Rest(1)], inf));
		Pbindef(\seqDrum1b, \octave, 3);
	});
	~tc.sched(20, {
		Synth(\sinenv,[\bus, ~chAmp1, \target, 0.3, \time, 25], ~mixGroup);
		Pdef(\seqEcho0).play;
		Pdef(\seqSig).play;
	});
	~tc.sched(58, {
		Synth(\sinenv,[\bus, ~chAmp1, \target, 0.0, \time, 20], ~mixGroup);
	});
	~tc.sched(60, {
		Synth(\sinenv,[\bus, ~chAmp3, \target, 0.2, \time, 10], ~mixGroup);
		Pdef(\seqEcho2).play;
		Pdef(\seqSaw2).play;
		Synth(\sinenv,[\bus, ~chAmp4, \target, 0.7, \time, 1], ~mixGroup);
		Pdef(\seqDrum1a).play;
		Pbindef(\seqDrum1b, \dur, Pseq([0.5], inf));
		Pbindef(\seqDrum1b, \octave, 4);
		Pbindef(\seqDrum1a,	\dur, Pseq([0.125,0.125, Rest(0.25)], inf));
		Pbindef(\seqDrum1a,	\legato, Pseq([0.2,0.5], inf));
	});
	~tc.sched(120, {
		Synth(\sinenv,[\bus, ~chAmp2, \target, 0.0, \time, 30], ~mixGroup);
		Synth(\sinenv,[\bus, ~chAmp1, \target, 0.4, \time, 5], ~mixGroup);
	});
	~tc.sched(135, {
		Synth(\sinenv,[\bus, ~chAmp0, \target, 0.0, \time, 15], ~mixGroup);
		Pbindef(\seqDrum1a,	\dur, Pseq([0.5, Rest(0.5)], inf));
		Pbindef(\seqDrum1a,	\legato, Pseq([0.35,0.5], inf));
	});
	~tc.sched(150, {
		Synth(\sinenv,[\bus, ~chAmp3, \target, 0.0, \time, 30], ~mixGroup);
		Synth(\sinenv,[\bus, ~chAmp1, \target, 0.0, \time, 25], ~mixGroup);
		Synth(\sinenv,[\bus, ~chAmp4, \target, 0.0, \time, 20], ~mixGroup);
		Pdef(\seqLPFch2_a).stop;
		Pdef(\seqSaw1).stop;
		Pdef(\seqDrum1b).stop;
	});
	~tc.sched(170, {
		Synth(\sinenv,[\bus, ~chAmp1, \target, 0.0, \time, 10], ~mixGroup);
		Pdef(\seqEcho2).stop;
		Pdef(\seqDrum1a).stop;
	});
	~tc.sched(180, {
		Pdef(\seqSaw2).stop;
		Pdef(\seqEcho0).stop;
		Pdef(\seqSig).stop;
	});
	// 180.wait;
	// }
}).play(quant:1);
)
Tdef(\master).stop;
