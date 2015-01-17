s.scope(2);
s.plotTree;
FreqScope();

(
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

SynthDef(\Hat, {|out, freq, t_trig, pan, amp|
	var aEnv = EnvGen.kr(Env([0.0,1.0,0.0],[0.0,0.01]),gate:t_trig);
	var osc = HPF.ar(WhiteNoise.ar(1),freq);
	var tone = osc * aEnv * amp;
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

SynthDef(\LongSinC, { |out, t_trig, freq, amp, sustain, pan|
	var echoTime = 4;
	var num = 4;
	var aEnv = EnvGen.kr(Env([0,1,0.3,0.5,0.2,0.4,0],[0.5*sustain,0.01*sustain,0.19*sustain,0.01*sustain,(0.29*sustain)+echoTime+0.1],\welch), gate:t_trig ,doneAction:2);
	var osc = Mix.fill(num, {|i| SinOsc.ar([freq+(0.005*i),freq-(0.005*i)],0.0001*i,1/num);});
	var tone = osc * aEnv * amp;
	tone = tone * SinOsc.kr([4,5],0,0.9,0.1);
	tone = LPF.ar(tone,freq+1800,tone);
	tone = CombC.ar(tone,1,0.25,3.5,1,tone);
	Out.ar(out,Pan2.ar(tone,pan));
}).add;

SynthDef(\fader, { | out, in, mute, amp | Out.ar(out, In.ar(in, 2) * mute * amp); }).add;
)


(
Pdef(\MetalWire).fadeTime = 4;
Pdef(\MetalWire,
	Pmono(\DrumA4, \amp, 0.5, \sustain, Pseq([0.1,0.1,1.2,2.7,0.3,0.1],inf),
		\octave, Pseq([Pn(6,16),Pn(4,8)], inf),
		\degree, Pwrand([4, 7, 11], [0.85,0.1,0.05], inf),
		\dur, Pseq([Prand([1,2,4]), Pn(0.25,6)], inf),
		\pan, Pwhite(-1,1, inf),
		\lpf, Pseg(Pseq([200,1200,200]),Pseq([20,5]),\sin,inf)
	)
).play(quant:1);
)
Pdef(\MetalWire).stop;

(
Pdef(\SeqSin,
	Ppar([
		Pbind(\instrument, \LongSinC, \amp, 0.3, \out, 30,
			\dur, Pseq([2,2,2,4,4],inf),
			\legato, Pseq([1.3,1.3,1.3,3,1.3],inf),
			\octave, Pseq([Pn(6,10),Pn(5,5)], inf),
			\degree, Pseq([5,5,5,7,7], inf),
			\pan, Pseg(Pseq([-1,1,-1]),Pseq([10,10]),\sin,inf)
		),
		Pbind(\instrument, \LongSinC, \amp, 0.2, \out, 0,
			\dur, Pseq([2,4,2,2,Pn(1,4)],inf),
			\legato, Pseq([3,3,3,8,1],inf),
			\octave, Pseq([Pn(3,5),Pn(4,10)], inf),
			\degree, Pseq([6,6,7,7,5], inf),
			\pan, Pseg(Pseq([1,-1,1]),Pseq([10,10]),\sin,inf)
	)], inf);
).play(quant:1);
Pdef(\Fader30_Seq,
	Pmono(
		\fader, \out, 0, \in, 30, \dur, 0.03125,
		\mute, Pseg(Pseq([0,1], inf),Pseq([0.0625], inf), \step, inf),
		\amp, Pseg(Pseq([0.5,0.9,0.2], inf),Pseq([0.75,0.25], inf),\sin, inf)
	)
).play(quant:1);
)
Pdef(\SeqSin).stop; Pdef(\Fader30_Seq).stop;

(
Pdef(\HatSeq,
	Pmono(\Hat, \amp, 0.4, \trig, 1,
		\dur, Pxrand([Pseq([Pn(0.125,7),Pn(0.25,8),Pn(0.03125,4)]),Prand([Rest(1),Rest(2)])],inf),
		\freq, 12000,
		\pan, Pwhite(-1,1,inf)
	)
).play(quant:1);
)
Pdef(\HatSeq).stop;

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

