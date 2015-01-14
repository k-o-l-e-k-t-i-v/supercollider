s.scope(2);
s.plotTree();

(
SynthDef(\SawA, { |out, gate = 1, amp, freq, sustain, lpf|
	var aEnv, num, osc, tone;
	aEnv = EnvGen.ar(Env([0, 0.65, 0.25, 1, 0.85, 0.8, 0.3, 0.6, 0.1, 0.3, 0],
		[0.25*sustain, 0.05*sustain, 0.10*sustain, 0.15*sustain, 0.025*sustain, 0.1*sustain, 0.025*sustain, 0.1*sustain, 0.2*sustain],
		\welch), gate);
	num = 8;
	osc = Mix.fill(num, {|i| LFSaw.ar([freq, freq*110],0.15*i, 1/num * LFSaw.ar([4,5],0,0.7,0.3)); });
	tone = osc * aEnv * amp;
	tone = FreeVerb.ar(tone, 0.8, 1.5, 0.8, 1, tone);
	DetectSilence.ar(tone,  doneAction:2);
	Out.ar(out, tone);
}).add;

SynthDef(\DrumA5, { |out, gate = 1, freq, pan, amp, sustain, lpf|
	var fMod, aEnv, fEnv, osc, tone;
	fMod = 0.025*sustain;
	aEnv = EnvGen.kr(Env([0.0,1.0,0.4,0.0],[0.05*sustain,0.3*sustain,0.65*sustain]), gate);
	fEnv = EnvGen.kr(Env([Rand(1700,2100),freq,freq*0.5],[0.12*sustain,0.88*sustain]*fMod,\exp));
	osc = SinOsc.ar([fEnv,fEnv+10],0,SinOsc.kr(55,0,0.85,0.15));
	tone = osc * aEnv * amp;
	tone = LPF.ar(tone, fEnv + lpf);
	tone = FreeVerb.ar(tone, 0.9, 1.8, 0.1, 1, tone);
	DetectSilence.ar(tone, doneAction:2);
	Out.ar(out,Pan2.ar(tone,pan));
}).add;

SynthDef(\DrumA4, { |out, t_trig, freq, pan, amp, sustain, lpf|
	var fMod = 0.005;
	var aEnv = EnvGen.kr(Env([0.0,1.0,0.4,0.0],[0.05*sustain,0.3*sustain,0.65*sustain]),gate:t_trig);
	var fEnv = EnvGen.kr(Env([Rand(700,1100),freq,freq*0.5],[0.1*sustain,0.9*sustain],\exp));
	// - here (in fEnv) is mistake. For correct working is missing ",gate:t_trig", but without that it sound better
	var osc = Pulse.ar(fEnv,fMod*4,SinOsc.kr(55,0,0.85,0.15));
	var tone = osc * aEnv * amp;
	tone = LPF.ar(tone,fEnv + lpf);
	tone = FreeVerb.ar(tone, 0.9, 0.3, 0.1, 1, tone);
	Out.ar(out,Pan2.ar(tone,pan));
}).add;

SynthDef(\Hat, {|out, freq, t_trig, pan, amp|
	var aEnv = EnvGen.kr(Env([0.0,1.0,0.0],[0.0,0.01]),gate:t_trig);
	var osc = HPF.ar(WhiteNoise.ar(1),freq);
	var tone = osc * aEnv * amp;
	Out.ar(out,Pan2.ar(tone,pan));
}).add;

SynthDef(\Saw1, { |bus = 0, gate = 1, amp, freq, sustain, lpf|
	var aEnv1, aEnv2, osc1, osc2, osc3, tone;
	aEnv1 = EnvGen.kr(Env.adsr(0.15*sustain, 0.35*sustain, 0.45, 0.5*sustain,curve:4),gate, doneAction:2);
	osc1 = LFSaw.ar([freq,freq], 0, SinOsc.kr(8,0,0.15,0.165));
	osc1 = FreeVerb.ar(osc1,0.8,2.7,0.9,1,osc1);
	aEnv2 = EnvGen.kr(Env.adsr(0.15*sustain, 0.35*sustain, 0.65, 0.45*sustain,curve:-2));
	osc2 = LFSaw.ar([freq-0.01,freq+0.01], 0.5*pi, SinOsc.kr(8,0,0.15,0.165));
	osc2 = FreeVerb.ar(osc2,0.8,5.7,0.5,1,osc2);
	osc3 = Saw.ar([4.01,64], SinOsc.kr(16,0,0.15,0.165));
	tone = (osc1+(osc2*aEnv2)+osc3) * aEnv1 * amp;
	tone = OnePole.ar(tone,SinOsc.ar(0.25,0,0.65,0.3));
	tone = LPF.ar(tone,lpf);
	Out.ar(bus, tone);
}).add;

SynthDef(\Saw4, { |bus = 0, freq = 55, amp = 0.5, gate = 1, sustain = 1, lpf = 110|
	var aEnv, osc, tone, num;
	aEnv = EnvGen.ar(Env.asr(0.3*sustain, 1, 0.7*sustain, -2), gate, doneAction:2);
	num = 4;
	osc =  Mix.fill(num, {|i| LFSaw.ar((freq + (0.1*i))!2,0.0001*i,1/num) * LFSaw.ar(2**i)});
	tone = osc * aEnv * amp;
	tone = OnePole.ar(tone,SinOsc.ar(sustain,0,0.9));
	tone = LPF.ar(tone,lpf);
	tone = AllpassC.ar(tone,0.133,0.133,1,1,tone);
	tone = FreeVerb.ar(tone,0.133,1,0.5,1,tone);
	Out.ar(bus, tone);
}).add;

SynthDef(\RndOsc4b, {|out, freq, t_trig, pan, amp, dt, xSel, m, n|
	var fMod = SinOsc.kr(freq/60,0,freq/60);
	var aEnv = EnvGen.kr(Env([0.0,1.0,0.0],[0.0,dt]), gate:t_trig);
	var osc1 = SinOsc.ar([freq, freq + 220] + fMod, 0, [m,0.03]).mean.tanh;
	var osc2 = SinOsc.ar(30,0,1);
	var osc3 = HPF.ar(WhiteNoise.ar(1),8000);
	var osc4 = LPF.ar(LFSaw.ar(freq,0,SinOsc.kr(32,0,2)),freq+10);
	var tone = Select.ar(xSel, [osc1,osc2,osc3,osc4] * aEnv).fold(-1,1);
	tone = (0.5 * tone) + SinOsc.ar(55,0,0.5);
	tone = tone * ( 1 + HPF.ar( WhiteNoise.ar( 0.02 * n ), 8000 ));
	Out.ar(out, Pan2.ar(tone, pan, amp));
}).add;
)


(
Pdef(\testSeq).fadeTime = 4;
Pdef(\testSeq,
	Pbind(\instrumnt, \SawA, \out, 0, \amp, 1.1,
		\dur, 0.0625, //Pseq([3,0.25,0.5,0.25], inf), \legato, Pseq([1.2,1.8,0.9,1.2,0.9], inf),
		\octave, Pseq([Pn(1,3),2], inf),
		\degree, Pseq([4,4,4b,7,4,4,6], inf),
		\lpf, Pseq([300,800,500,2000,100], inf)
	)
).play(quant:1);
)
Pdef(\testSeq).stop;

(
Pdef(\HatSeq,
	Pmono(\Hat, \amp, 0.3, // Pxrand([Pseq([0.1,0.2,0.5]), Pseq([0.9,0.08,0.02]),inf]), \trig, 1,
		// \dur, Pxrand([Pseq([Pn(0.125,7),Pn(0.25,8),Pn(0.03125,4)]),Prand([Rest(1),Rest(2)])],inf),
		\dur, Pseq([Pn(0.5,16), Pxrand([Pseq([Pn(0.125,7),Pn(0.25,8),Pn(0.03125,4)]),Prand([Rest(1),Rest(2)])])],inf),
		\legato, 0.1,
		\freq, Pwhite(200,2000, inf),
		\pan, Pwhite(-1,1,inf)
	)
).play(quant:1);
)
Pdef(\HatSeq).stop;

(
Pdef(\DrumSeq1,
	Pbind(\instrument, \DrumA5, \amp, 0.9,
		\dur, 0.25, //Pseq([Pn(0.5,7), 0.25,0.25]), //Pseq([Pn(0.125,7), Rest(0.25), Pn(0.125,8), Prand([Rest(0.25),Rest(0.5),Rest(1)])], inf),
		\legato, Pseq([0.6,0.6,0.3,0.3,0.7,0.5,0.1], inf),
		\octave, Pseq([Pn(3,6),Pn(4,2)], inf),
		\degree, Pseq([3,4,5,7,6b], inf),
		\lpf, Pseq([250,50,8000,200,800], inf),
		\pan, Pwhite(-1,1,inf)
)).play(quant:1);
)
Pdef(\DrumSeq1).stop;

(
Pdef(\DrumSeq1,
	Pbind(\instrument, \DrumA5, \amp, Pseq([0.8, 0.9, 1.2], inf),
		\dur, 0.125, //Pseq([Pn(0.125, 8), Rest(4)], inf), //Pseq([Pn(0.5,7), Rest(0.25), Pn(0.125,8), Prand([Rest(0.25),Rest(0.5),Rest(1)])], inf),
		\legato, Pseq([Pn(0.2,6), 0.6, Pwhite(0.7,1.3)], inf), //Pseq([0.6,0.6,0.3,0.3,1.7,0.5,0.1], inf),
		\octave, Pseq([3,2,3,1], inf), \degree, Pseq([5,5,5,6b], inf),
		\lpf, Pseq([250,50,100,200,2800], inf)
)).play(quant:1);
)
Pdef(\DrumSeq1).stop;

(
Pdef(\MetalWire).fadeTime = 4;
Pdef(\MetalWire,
	Pmono(\DrumA4, \amp, 1.5, \trig, 1, \sustain, Pseq([0.1,0.1,1.2,2.7,0.3,0.1],inf),
		\dur, Pseq([Prand([0.125,0.25,1]), Pn(0.25,6)], inf),
		\octave, Pseq([Pn(3,16),Pn(1,8)], inf),
		\degree, Pwrand([4, 7, 11], [0.85,0.1,0.05], inf),
		\pan, Pwhite(-1,1, inf),
		\lpf, Pseg(Pseq([200,1200,200]),Pseq([20,5]),\sin,inf)
	)
).play(quant:1);
)
Pdef(\MetalWire).stop;

(
Pdef(\seqSaw1).fadeTime = 4;
Pdef(\seqSaw1,
	Pbind( \instrument, \Saw1, \amp, 0.2,
		\dur, Pseq([0.75,0.25,3], inf), \legato, 1.4,
		\octave, Pseq([Pn(4,28), Pn(6,4)], inf), \degree, Pseq([4,4,4,4b], inf),
		\lpf, Pn(Pseries(3200,-25,40),inf)
	)
).play(quant:1);
)
Pdef(\seqSaw1).stop;
(
Pdef(\testSaw4,                                                  //this one, dayum <3
	Pbind( \instrument, \Saw4, \amp, Pseq([0.6,0.3], inf),
		\dur, 4, \legato, 2.6,
		\octave, 3, //Pseq([6,4,7], inf), \degree, Pseq([5,5,2,Pxrand([4,5b,6])], inf),
		\lpf, Pn(Pseries(200,25,20),inf),
	);
).play(quant:1);
)
Pdef(\testSaw4).stop;

(
Pdef(\OscSeq).fadeTime = 2;
Pdef(\OscSeq,
	Pmono(\RndOsc4b, \amp, 0.7, \trig, 1,
		\dur, Pxrand([Pseq([Pn(0.125,7),Pn(0.0625,2),Pn(0.25,8)]),Pn(0.25,32),Prand([1,2])],inf),
		\xSel,Pwrand([0,1,2,3],[0.86,0.1,0.02,0.02],inf),
		\freq,Pwrand([35,40],[0.35,0.65],inf),
		\dt,Pwhite(0.1,0.5, inf),
		\m,Pwrand([1,10],[0.98,0.02],inf),
		\n,Pwrand([1,2,3,30],[0.8,0.1,0.05,0.05], inf),
		\pan, Pwhite(-1,1, inf)
	)
).play(quant:1);
)
Pdef(\OscSeq).stop;


