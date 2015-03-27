
s.plotTree;
s.scope(2);

////phase_1///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//______hiPisk
(
~q1 = Pdef(\phase1).play;
~q1.player.xplay(fadeTime:10,quant:2);
~q1.source = {|freq,amp|
	var osc = SinOsc.ar([SinOsc.kr(1/64,0,600,freq),LFSaw.kr(2,0.5,8260,freq)],0, Saw.kr([1/2,1/8],0.05,0.1));
	Out.ar(0,osc*amp);
};
~q1.pattern = Pbind(\amp, 0.85, \legato, 3.2, \dur, Pstutter([8,1,32,4], Pseq([0.125, 4], inf)), \freq, Pseq([12000,8000], inf));
)
~q1.player.xstop(20);
////phase_1 -> phase_2////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//______lowLongTone (max \amp,0.5)
(
~q2 = Pdef(\phase2).play;
~q2.player.xplay(fadeTime:2,quant:4);
~q2.source = {|freq,amp|
	var osc = LFCub.ar([freq, freq+5],0,Saw.kr(1/8,0,0.3,0.7));
	Out.ar(40,osc*amp);
};
~q2.pattern = { Pbind(\amp, 0.25, \legato, 2.4, \dur, Pstutter([8,1,32,4], Pseq([1.25, 0.25, 4, 1], inf)),
	\octave, Pseq([Pn(3,8), 4], inf), \degree,
	Pseq([3,3,3,3,3,3,7], inf));
};
Ndef(\efx2, { Out.ar(0,AllpassC.ar(In.ar(40,2),0.25,1.25,2.5,0.3)); }).play;
)
~q2.player.xstop(4);

////phase_2 -> phase_3////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//______chaosLongLow,
(
~q3 = Pdef(\phase3).play;
~q3.player.xplay(fadeTime:2,quant:4);
~q3.source = SynthDef(\bb, {|out,gate = 1,freq,sustain,amp|
	var aEnv = EnvGen.ar(Env.adsr(0.5*sustain, 0.1*sustain,0.4, 0.4*sustain),gate, doneAction:2);
	var osc1 = SinOsc.ar([freq/2,freq/3],0,0.5) * VarSaw.ar(120,0.1,0.9);
	var osc2 = LFCub.ar(BrownNoise.ar(0.2*freq,0.8*freq)!2,0.1,0.5);
	var tone = Mix.new([osc1, osc2]);
	Out.ar(out,  tone * aEnv * amp);
}).add;
~q3.pattern = {
	Pbind(\instrument, \bb, \out, 32, \amp, 0.55,
		\dur, Pseq([0.25,0.25,3,Prand([0.5,1.5,3.5], inf)], inf),
		// \legato, Pseq([1.4,1.8,1.3,1.9,0.8], inf),
		\legato, 0.8,
		\octave, Pstutter([24,4,6,2], Pseq([7,3b,4,Prand([5,6], inf)], inf)),
		\degree, Pswitch([
			Pseq([3,3,3,7]),
			Pseq([5,5,3,3]),
			Pseq([3,4,3,Prand([1,2,7], inf)]),
			Rest(4)
		], Pseq([0,1,0,3,0,2,3], inf))
	);
};
Ndef(\efx3, { var freq = 8600; Out.ar(0, LPF.ar(In.ar(32,2), SinOsc.kr(1/16,0,freq,freq+400))); }).play;
)
~q3.player.stop;
~q3.player.xstop(10);
////phase_2 -> phase_3////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//______lowShortSaw - stupid tone - rest
(
~q4 = Pdef(\phase4).play;
~q4.player.xplay(fadeTime:2,quant:4);
~q4.source = {|freq,amp|
	var osc = LFSaw.ar([freq, freq+5],0,Saw.kr(4,0,0.6,0.3),0.1);
	Out.ar(40,osc*amp);
};
~q4.pattern = { Pbind(
	\amp, 0.3,
	\legato, 2.1,
	\dur, Pstutter([8,1,32,4], Pseq([0.5, 0.25, 0.5, Rest(2)], inf)),
	\octave, Pseq([Pn(5,8), 2], inf),
	\degree, Pseq([3,3,3,3,3,3,7], inf));
};
Ndef(\efx2, { Out.ar(0,AllpassC.ar(In.ar(40,2),0.25,1.25,2.5,0.3)); }).play;
)
~q4.player.xstop(4);

////phase_5 -> phase_6////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//______lowDrum - zrychlovat s promuvem, (az \dur, 0.25, \amp, 0.7)

(
~q6 = Pdef(\phase6).play;
~q6.quant(1);
~q6.player.xplay(fadeTime:4,quant:2);
~q6.source = SynthDef(\aa, {|out, gate=1, freq, sustain, amp|
	var aEnv, fEnv, osc, tone;
	aEnv = EnvGen.kr(Env.adsr(0.01*sustain,0.24*sustain,0.1,0.75*sustain),gate, doneAction:2);
	fEnv = Mix.fill(20, {|i| LFSaw.kr(2,pi/20*i,Rand(0,50));});
	osc = LFTri.ar([freq+fEnv,freq+fEnv+10],0,0.5,Saw.kr([4,10],0.1,0.2));
	tone = Limiter.ar(osc * aEnv * amp,0.95);
	Out.ar(out, tone);
}).add;
~q6.pattern = { Pbind( \instrument, \aa,
	\out, 30,
	\amp, 0.2,
	\dur, 1,
	\dur, Pseq([3.5,0.5,1.5,0.5], inf),
	\legato, Pseq([0.1,0.3,0.5,0.7,0.4,1.9], inf),
	\octave, Pseq([Pn(7,7),9], inf),
	\degree, Pswitch([
		Pseq([4,4,5,4]),
		Pseq([4,7,5,4]),
		Pseq([4,2,5,4])
	], Pseq([0,0,1,0,2], inf))
)};
Ndef(\efx6a, { Out.ar(0,LPF.ar(In.ar(30,2), 600)); }).play;
Ndef(\efx6b, { Out.ar(0,AllpassC.ar(In.ar(30,2)/3,0.5,0.25,4.5,1,In.ar(30,2)/3)); }).play;
)
~q6.player.xstop(20);

////phase_6 -> phase_7////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//______Saw rythm - zrychlovat s promuvem, (az \dur, 0.25, \amp, 0.7)
(
SynthDef(\SawB, { |out, freq = 150, ffreq = 4, amp = 0.2, lpf = 400, shift = 0.001|
	var tone, num, vol;
	num = 16;
	vol = LFSaw.kr([ffreq,ffreq+0.002],0,0.8,0.2);
	tone = Mix.fill(num, { |i| VarSaw.ar(Rand(freq-20,freq+20), shift+(i*0.1) ,i, vol/num,0)});
	tone = LPF.ar(tone, lpf,amp);
	Out.ar(out, Pan2.ar(tone,SinOsc.kr(1,0,0.7)));
}).add;

Pdef(\seqSawB,
	Pmono(\SawB,
		\dur, Pseq([Pn(0.5,0.5,0.25,0.75,3),5],inf),
		\octave, Pstutter([8,7], Pseq([2,4], inf)),
		\degree, Pseq([3,5], inf),
		\ffreq, Prand([0.5,1,2], inf),
		\amp, Pseq([Pseries(0.55,0.005,40),Pseries(0.75,-0.005,20)],inf),
		\lpf, Prand([8500,2500,1500,1000,500],inf),
		\shift, Pseq([Pn(0,10),Pseries(0.001,0.0001,10)],inf),
	);
).play(quant:1);
)
Pdef(\seqSawB).stop;

////phase_9 -> phase_10////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

(
// boure, zpev, bzukot

SynthDef(\zpev, { |out, freq = 150, ffreq = 4, amp = 0.2, lpf = 400, shift = 0.001|
	var tone, num, vol;
	num = 12;
	vol = LFSaw.kr([ffreq,ffreq+0.002],0,0.8,0.2);
	tone = Mix.fill(num, { |i| VarSaw.ar(Rand(freq-20,freq+20), shift+(i*0.001) ,i, vol/num,0)});
	tone = LPF.ar(tone, lpf,amp);
	Out.ar(out, Pan2.ar(tone,SinOsc.kr(1,0,0.7)));
}).add;
Pdef(\stage10, Pmono(\zpev,
	\dur, Pseq([Pn(8,2),4],inf),
	\octave, Pstutter([8,4], Pseq([4,6], inf)),
	\degree, Pseq([3,5], inf),
	\ffreq, Prand([0.5,1,2], inf),
	\amp, Pseq([Pseries(0.75,0.005,40),Pseries(0.95,-0.005,20)],inf),
	\lpf, Prand([3500,2500,1500,1000,500],inf),
	\shift, Pseq([Pn(0,10),Pseries(0.001,0.0001,10)],inf),
)).play;
)
Pdef(\stage10).stop;


