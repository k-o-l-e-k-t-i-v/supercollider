
s.plotTree;
s.scope(2);

////phase_1///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
(
~q1 = Pdef(\phase1).play;
~q1.player.xplay(fadeTime:20,quant:2);
~q1.source = {|freq,amp|
	var osc = SinOsc.ar([SinOsc.kr(1/64,0,600,freq),LFSaw.kr(1/2,0.5,4260,freq)],0, Saw.kr([1/2,1/8],0.05,0.1));
	Out.ar(0,osc*amp);
};
~q1.pattern = Pbind(\amp, 0.2, \legato, 2.2, \dur, Pstutter([8,1,32,4], Pseq([0.125, 4], inf)), \freq, Pseq([12000,8000], inf));
)
~q1.player.xstop(20);
////phase_1 -> phase_2////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
(


)
~q2.player.xstop(20);
////phase_2 -> phase_3////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
(
~q3 = Pdef(\phase3).play;
~q3.player.xplay(fadeTime:10,quant:4);
~q3.source = SynthDef(\bb, {|out,gate = 1,freq,sustain,amp|
	var aEnv = EnvGen.ar(Env.adsr(0.5*sustain, 0.1*sustain,0.4, 0.4*sustain),gate, doneAction:2);
	var osc1 = SinOsc.ar([freq/2,freq/3],0,0.5) * VarSaw.ar(120,0.1,0.9);
	var osc2 = LFCub.ar(BrownNoise.ar(0.2*freq,0.8*freq)!2,0.1,0.5);
	var tone = Mix.new([osc1, osc2]);
	Out.ar(out,  tone * aEnv * amp);
}).add;
~q3.pattern = {
	Pbind(\instrument, \bb, \out, 32, \amp, 0.20,
		\dur, Pseq([0.25,0.25,3,Prand([0.5,1.5,3.5], inf)], inf),
		\legato, Pseq([1.4,1.8,1.3,1.9,0.8], inf),
		// \legato, 0.3,
		\octave, Pstutter([24,4,6,2], Pseq([4,3b,4,Prand([5,6], inf)], inf)),
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

////phase_5 -> phase_6////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

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
	\out, 30, \amp, 0.3,
	\dur, 1, //Pseq([3.5,0.5,1.5,0.5], inf),
	\legato, Pseq([0.1,0.3,0.5,0.7,0.4,1.9], inf),
	\octave, Pseq([Pn(3,7),4], inf),
	\degree, Pswitch([
		Pseq([4,4,5,4]),
		Pseq([4,7,5,4]),
		Pseq([4,2,5,4])
	], Pseq([0,0,1,0,2], inf))
)};
Ndef(\efx6a, { Out.ar(0,LPF.ar(In.ar(30,2), 3800)); }).play;
Ndef(\efx6b, { Out.ar(0,AllpassC.ar(In.ar(30,2)/3,0.5,0.25,4.5,1,In.ar(30,2)/3)); }).play;
)

