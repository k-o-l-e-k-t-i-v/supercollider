s.scope(2);

// explain of t_trig on web:
// http://danielnouri.org/docs/SuperColliderHelp/ServerArchitecture/SynthDef.html

// inspired from: http://www.kimri.org/blog/?tag=alva-noto

(
SynthDef(\RndOsc4, {|out, freq, t_trig, pan, amp, dt, xSel, m, n|
	var fMod = SinOsc.kr(freq/60,0,freq/60);
	var aEnv = EnvGen.kr(Env.asr(0.01,1,dt,-4), gate:t_trig);
	var osc1 = SinOsc.ar([freq, freq + 600] + fMod, 0, [m,0.005]).mean.tanh;
	var osc2 = HPF.ar(WhiteNoise.ar(1),8000);
	var osc3 = SinOsc.ar(30,0,1);
	var osc4 = VarSaw.ar(freq/40,mul:dt*10000);
	var tone = Select.ar(xSel, [osc1,osc2,osc3,osc4] * aEnv).fold(-1,1);
	tone = (0.7 * tone) + SinOsc.ar(40,0,0.3);
	tone = tone * ( 1 + HPF.ar( WhiteNoise.ar( 0.02 * n ), 8000 ));
	Out.ar(out, Pan2.ar(tone, pan ,amp));
}).add;

SynthDef(\hat, {|out, freq, t_trig, pan, amp|
	var aEnv = EnvGen.ar(Env([0.0,1.0,0.0],[0.0,0.01]),gate:t_trig);
	var osc = HPF.ar(WhiteNoise.ar(1),freq);
	var tone = osc * aEnv * amp;
	Out.ar(out,Pan2.ar(tone,pan));
}).add;
)

(
Pdef(\OscSeq).fadeTime = 2;
Pdef(\OscSeq,
	Pmono(\RndOsc4, \amp, 0.9, \trig, 1,
		\dur, Pxrand((1/8!8)++(1/4!8)++Pseq([1/16,1/16],Prand([1,2],1)),inf),
		\freq,Pwrand([35,40,3000,18000],[0.30,0.65,0.03,0.02],inf),
		\dt,Pwhite(0.1,0.5, inf),
		\xSel,Pwrand([0,1,2,3],[0.946,0.03,0.02,0.004],inf),
		\m,Pwrand([1,10],[0.98,0.02],inf),
		\n,Pwrand([1,2,3,30],[0.8,0.1,0.05,0.05], inf),
		\pan, Pwhite(-1,1, inf)
	)
).play(quant:1);
)
Pdef(\OscSeq).stop;

(
Pdef(\HatSeq,
	Pmono(\hat, \amp, 0.2, \trig, 1,
		\dur,Pxrand((1/8!8)++(1/4!8)++Pseq([1/32,1/32,1/32,1/32],Prand([1,2],1)),inf),
		\freq, 6000,
		\pan, Pwhite(-1,1,inf)
	)
).play(quant:1);
)
Pdef(\HatSeq).stop;