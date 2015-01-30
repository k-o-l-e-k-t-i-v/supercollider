// ja_track
s.plotTree();
s.scope(2);

(
// SynthDefs //////////////////////

SynthDef(\BaseSin, { |out, gate = 1, freq, amp, sustain = 1, xSel = 1|
	var aEnv1 = EnvGen.ar(Env([0.01,1,0.01],[0.3, 0.7]*sustain,[\sin, \welch]),gate, doneAction:2);
	var aEnv2 = EnvGen.ar(Env([0.01,1,0.3,1,0.01],[0.3, 0.025, 0.025, 0.65]*sustain,[\sin, \step, \exp, \welch]),gate, doneAction:2);
	var osc1 = SinOsc.ar([freq,freq+5]);
	var osc2 = SinOsc.ar([freq,freq+5]) * Saw.ar([15,17],0.2,0.8);
	var osc3 = SinOsc.ar([freq,freq+5]) * Saw.ar([30,34],0.3,0.7);
	var oscSel = Select.ar(xSel,[(aEnv1 * osc1),(aEnv2 * osc2),(osc3*aEnv1)]);
	var tone = oscSel * amp;
	Out.ar(out, tone);
}).add;

SynthDef(\Hat, {|out, gate = 1, freq, amp, sustain|
	var aEnv = EnvGen.kr(Env.adsr(0.01,0.19,0.8,0.8),gate, doneAction:2);
	var osc = HPF.ar(WhiteNoise.ar(SinOsc.kr([4,5],0,SinOsc.kr(16,0,0.3))),freq);
	var tone = osc * aEnv * amp;
	Out.ar(out,tone);
}).add;

SynthDef(\DrumA5, { |out, gate = 1, freq, pan, amp, sustain, lpf|
	var fMod, aEnv, fEnv, osc, tone;
	fMod = 0.025*sustain;
	aEnv = EnvGen.kr(Env([0.0,1.0,0.4,0.0],[0.05*sustain,0.3*sustain,0.65*sustain]), gate);
	fEnv = EnvGen.kr(Env([Rand(1700,2100),freq,freq*0.5],[0.12*sustain,0.78*sustain]*fMod,\exp));
	osc = SinOsc.ar([fEnv,fEnv+10],0,SinOsc.kr(55,0,0.85,0.15));
	tone = osc * aEnv * amp;
	tone = LPF.ar(tone, fEnv + lpf);
	tone = FreeVerb.ar(tone, 0.3, 0.8, 0.1, 1, tone);
	DetectSilence.ar(tone, doneAction:2);
	Out.ar(out,Pan2.ar(tone,pan));
}).add;

SynthDef(\pan, { |bus, freq|
	ReplaceOut.ar(bus,Pan2.ar(In.ar(bus, 1), SinOsc.kr(freq)));
}).add;

SynthDef(\blur, { |bus, room|
	ReplaceOut.ar(bus,OnePole.ar(FreeVerb.ar(In.ar(bus, 2),0.5, room)));
}).add;

SynthDef(\Limiter, { |bus|
	var tone = In.ar(bus,2);
	tone = Limiter.ar(tone,1);
	Out.ar(0,tone);
}).add;

SynthDef(\Fader, { |out, in, amp = 0.0, mute = 1 |
	Out.ar(out, In.ar(in, 2) * amp * mute)
}).add;

SynthDef(\newVal, { | bus val time |
	ReplaceOut.kr(bus, EnvGen.kr(Env([In.kr(bus), val], [time], \sin), doneAction: 2))
}).add;
)

// Busses & Nodes ////////////////////
(
~synG = Group.new;
~efxG = Group.new(~synG, \addAfter);
~mixG = Group.new(~efxG, \addAfter);

~master = Bus.audio(s, 2);
~numCh = 4;

~limit = Synth(\Limiter,[\bus, ~master],~mixG);

~numCh.do { |i|

	("ch" ++ i).asSymbol.envirPut( Bus.audio(s, 2) );
	("chAmp" ++ i).asSymbol.envirPut( Bus.control(s, 1) );
	// ("chMute" ++ i).asSymbol.envirPut( Bus.control(s, 1) );
	("FaderAmp" ++ i).asSymbol.envirPut( Synth(\Fader, [
		\in, ("ch" ++ i).asSymbol.envirGet,
		\out, ~master,
		\amp, ("chAmp" ++ i).asSymbol.envirGet.asMap,
		// \mute, ("chMute" ++ i).asSymbol.envirGet.asMap,
	], ~mixG));
};

~fxPan1 = Synth(\pan,[\bus, ~ch0, \freq, 4],~efxG);
~fxPan2 = Synth(\pan,[\bus, ~ch1, \freq, 1],~efxG);
~fxPan3 = Synth(\pan,[\bus, ~ch2, \freq, 0.25],~efxG);

~fxBlur1 = Synth(\blur,[\bus, ~ch0, \room, 8],~efxG);
~fxBlur2 = Synth(\blur,[\bus, ~ch1, \room, 2],~efxG);
~fxBlur3 = Synth(\blur,[\bus, ~ch3, \room, 4],~efxG);
)

// Patterns //////////////////////
(

Pdef(\xSin,
	Pbind(\instrument, \BaseSin, \out, ~ch0, \group, ~synG,
		\dur, Pseq([2],inf), \legato, 1.9,
		\octave, 1, \degree, Pstutter(Pseq([6,2], inf), Pseq([3,6], inf)),
		\xSel, Pwrand([0,1,2],[0.8,0.15,0.05],inf)
	)
);

Pdef(\Hat,
	Pbind(\instrument, \Hat, \out, ~ch1, \group, ~synG,
		\dur, Pseq([Pn(0.25,16), Pxrand([Pseq([Pn(0.125,8),Pn(0.25,8),Pn(0.03125,4)]),Prand([Rest(1),Rest(2)])])],inf),
		\legato, Pseq([0.1,0.8,1.1,1.8,1.4,0.9], inf),
		\freq, Pwhite(6000,12000, inf)
	)
);

Pdef(\Drum1,
	Pbind(\instrument, \DrumA5, \out, ~ch2, \group, ~synG,
		\dur, Pseq([Pn(0.125, 8), Rest(3), Pn(0.125, 8), Prand([Rest(3), Rest(7), Rest(11)])], inf),
		\legato, Pseq([Pn(0.2,6), 0.6, Pwhite(0.7,1.3)], inf),
		\octave, Pstutter(Pseq([8,9,8,4],inf),Pseq([8,7,8,9], inf)),
		\degree, Pseq([5,5,5,6b], inf),
		\lpf, Pseq([250,50,100,200,2800], inf)
	)
);

Pdef(\Drum2,
	Pbind(\instrument, \DrumA5, \out, ~ch3, \group, ~synG,
		\dur, Pseq([0.5,0.25,0.25,Rest(1)], inf),
		\legato, 0.05,
		\octave, 3,
		\degree, Pseq([5,5,5,6b], inf),
		\lpf, Pseq([250,50,100,200,2800], inf)
	)
);

~seqAmp = { |bus, t, v| 	Pbind( \instrument, \newVal, \group, ~mixG, \bus, bus,	\time, Pseq([t]), \val, Pseq([v])) };

Pdef(\timeLine,
	~chAmp0.value = 1.7;
	~chAmp1.value = 0.3;
	~chAmp2.value = 0.3;
	~chAmp3.value = 0.8;

	~intro1 = Ptpar([
		0,~seqAmp.set(~chAmp0,0,0.0),
		0,Pfindur(30,Pdef(\xSin)),
		1,~seqAmp.set(~chAmp0,20,1.7),
	]);
	~intro2 = Ptpar([
		0,Pfindur(30,Pdef(\xSin)),
		0,Pfindur(30,Pdef(\Hat)),
		0,~seqAmp.set(~chAmp1,0,0.0),
		1,~seqAmp.set(~chAmp1,8,0.3),
	]);
	~intro3 = Ptpar([
		0,Pfindur(30,Pdef(\xSin)),
		0,Pfindur(30,Pdef(\Hat)),
		0,Pfindur(30,Pdef(\Drum1)),
	]);
	~phase1 = Ptpar([
		0,Pfindur(60,Pdef(\xSin)),
		0,Pfindur(60,Pdef(\Hat)),
		0,Pfindur(20,Pdef(\Drum1)),
		40,Pfindur(20,Pdef(\Drum1)),
		0,Pfindur(60,Pdef(\Drum2)),
	]);
	~outro = Ptpar([
		0,~seqAmp.set(~chAmp0,10,0.0),
		0,Pfindur(10,Pdef(\xSin)),
		0,Pfindur(15,Pdef(\Hat)),
		0,Pfindur(25,Pdef(\Drum2)),
		10,~seqAmp.set(~chAmp3,15,0.0),
	]);

	// just // to skip phase
	~tLine = Pseq([
		~intro1,
		~intro2,
		~intro3,
		~phase1,
		~outro,
	]);
).play;
)

s.freeAll;
s.plotTree();
s.scope(2);