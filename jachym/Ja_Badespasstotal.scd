AutoIDE_WIP.run;
p = ProxySpace.push(s);

Ndef(\sin).fadeTime = 8;
Ndef(\sin, { SinOsc.ar([90,130,150], 0, LFSaw.kr(1/[4,20,18],0,SinOsc.kr(1/[2,14],0,0.8),0.2)) }).play;
Ndef(\sin).stop(18);
Ndef(\sin).vol = 1.7;

(
~saw[0] = {
	var aEnv = EnvGen.ar( Env( [0,1,0.2,0], [0.25,4.75, 12]), \aTrig.tr);
	var osc = LFSaw.ar(\freq.kr([12000,8000,10000],0.125));
	Pan2.ar( osc * aEnv, \pan.kr(0,0.25) );
};
)
~saw[10] = \filter -> {|in| LPF.ar(in, \freq_lpf.kr(600, 18)) };
~saw[11] = \filter -> {|in| GVerb.ar(in, 12, 12)};

~saw[30] = \set -> Pbind(\args, [\aTrig], \aTrig, 1, \dur, 14);
~saw[31] = \set -> Pbind(\pan, Pseq([0.8,-0.8], inf), \dur, Pseq([0.5,0.125], inf));

~saw.play(vol:0.9, fadeTime:12).quant_(2);
~saw.set(\freq_lpf, 180);
~saw.set(\pan, 0);
~saw.stop(100);
~saw.scope;

(
~drum[0] = {
	var f = [160,182,184,100];
	var aEnv = EnvGen.kr(Env([0, 1, 0.45, 0],[[0.01,0.05],[0.29,0.27], [2.5, 0.29, 0.35, 1.57]], \welch), \aTrig.tr);
	var fEnv = EnvGen.kr(Env([f, 18000, f*1.4, f], [0.003, 0.011, 0.15], \exp), \fTrig.tr);
	var num = 2;
	var osc = Mix.fill(num, {|i| SinOsc.ar(fEnv,0.03*i) * BrownNoise.ar(0.3, SinOsc.kr([16, 16.01], 0, 0.7))});
	Splay.ar( osc * aEnv, 0);
});

~drum[10] = \filter -> {|in| LPF.ar(in, EnvGen.kr(Env([1250, \lpfFreq.kr(4000,6), 800, 350],[0.03, 0.37, 1.2], \exp), \aTrig.tr))};
~drum[11] = \filter -> {|in| AllpassC.ar(in,0.06,0.001,4.75) };
~drum[12] = \filter -> {|in| FreeVerb.ar(in,0.12,0.47,0.95) };
~drum[30] = \set -> Pbind(\aTrig, 1, \fTrig, 0, \dur, 2);
// ~drum[30] = \set -> Pbind(\aTrig, 1, \fTrig, Pseq([1,0,0], inf), \dur, Pseq([Pn(0.125,4), 1.75], inf));

~drum.set(\lpfFreq, 5050);
~drum.play(vol:1.9, fadeTime:8).quant_(1);
~drum.stop(20);
~drum.free;
~drum.scope;


~tone.play(vol:0.8);
~tone.quant = 8;
~tone.mold(6);
// ~tone.fadeTime = 2;
~tone.monitor.fadeTime = 8;
(
~tone[0] = {
	var aEnv = EnvGen.kr(Env.perc(2.75,1.25), \mytrig.tr);
	var osc = Saw.kr([440,880, 1660, 3200, 6400], LFSaw.kr(SinOsc.kr(40, 0,10,35),0,0.4), 0.2) * BrownNoise.ar(0.25, 0.75);
	Pan2.ar(aEnv * osc,0);
};
~tone[1] = \set -> Pbind(\mytrig, 1, \dur, 8);// Pseq([8,8,4,2,2], inf));
~tone[10] = \filter -> {|in| LPF.ar(in, 2600)};
~tone[11] = \filter -> {|in| CombC.ar(in,0.5,0.25, 0.5)};
// ~tone[12] = \filter -> {|in| GVerb.ar(in,18, 0.23)};
~tone[13] = \filter -> {|in| Limiter.ar(in,0.95)};
);
~tone.stop(8);
~tone.scope;

~tone2.play(vol:0.5).quant_(1);
~tone2.fadeTime = 8;
~tone2.monitor.fadeTime = 4;
(
~tone2[0] = {
	var selEnv = Select.kr(\tone_selEnv.kr(0),
		[
			EnvGen.ar(Env([0.2,0.65,0.65,0.2],[1.0,0.5,0.25,0.25], \sin), \selTrig.tr),
			EnvGen.ar(Env([0.2,0.65,0.65,0.2],[0.25,0.75,3], \sin), \selTrig.tr)
		]
	);

	var osc = LinSelectX.ar(selEnv,
		[
			Saw.ar(10002,SinOsc.kr(1/8, 0, 0.13, 0.58), 0.25),
			VarSaw.ar(SinOsc.kr([1600,1600.1], 0.01, 50, 250),0,0.5, 0.1, SinOsc.kr([8,4], 0, 0.15, 0.59), 0.4),
		]
	);
	Pan2.ar(osc * BrownNoise.ar(0.05,0.95), \panTone.kr(0));
};
~tone2[30] = \filter -> {|in| BPF.ar(in, 800, Saw.kr(1/2, 14, 15)) };
~tone2[31] = \filter -> {|in| FreeVerb.ar(in,0.12,0.47,0.95) };
)

(
Pdef(\tone2, Pbind(\type, \set, \args, [\tone_selEnv, \selTrig, \toneTrig],
	\dur, 2,
	\toneTrig, 1,
	\selTrig, Pseq([1,1,0], inf)
)).play;
)
Pdef(\tone2).stop;

~tone2.stop(18);
~tone2.free;

~tone3.play(vol:0.1);
~tone3.monitor.fadeTime = 6;
(
~tone3[0] = { Pan2.ar(SinOsc.ar(6000, Saw.kr(4, 0.5, 0.5)), \panTone2.kr(0, 2)) };
~tone3[1] = \set -> Pbind(\panTone2, Pseq([0.9,-0.9], inf), \dur, 2);
~tone3[31] = \filter -> {|in| FreeVerb.ar(in,0.12,0.47,0.95) };
)
~tone3.stop(8);

(
~node4[0] = {
	var aEnv = EnvGen.ar( Env( [0,1,0], [0.25,10.75]), \aTrig.tr);
	var osc = SinOsc.ar(\freq.kr(1600,0.125))* BrownNoise.ar(0.3);
	Pan2.ar( osc * aEnv, \pan.kr(0,0.25) );
};
);
~node4[3] = \filter -> {|in| LPF.ar(in, \freq_lpf.kr(600, 8)) };
~node4[10] = \set -> Pbind(\aTrig, 1, \dur, Pseq([0.5, Rest(7.5)], inf));

~node4.set(\freq_lpf, 4000);

~node4.play(vol:2.9, fadeTime:4).quant_(2);
~node4.stop(8);
~node4.set(\freq, 160);
~node4.set(\pan, 0);

