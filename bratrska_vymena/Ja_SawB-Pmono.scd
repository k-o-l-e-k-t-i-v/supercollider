(
SynthDef(\SawB, { |out, freq = 150, ffreq = 4, amp = 0.2, lpf = 400, shift = 0.001|
	var tone, env, num, vol;
	num = 4;
	vol = LFSaw.kr(ffreq,0,0.65,0.3);
	tone = Mix.fill(num, { |i| VarSaw.ar(Rand(freq-20,freq+20), shift*i ,1, vol/num*amp,0)});
	tone = LPF.ar(tone, lpf);
	Out.ar(0, Pan2.ar(tone,SinOsc.kr(1,0,0.7)));
}).add;

SynthDef(\echo, { |chnl = 0, maxdeltime = 0.2, deltime = 0.2, dectime = 2|
	var eff, in;
	in = In.ar(chnl, 2);
	eff = CombL.ar(in, maxdeltime, deltime, dectime,1, in);
	Out.ar(0,eff);
}).add;
)

(
Pdef(\seqSawB, {
	var seq, eff;
	seq = Pmono(\SawB, \out, 50, \freq, 32, \ffreq, 2,
		\dur, Pseq([Pn(1,3),3],inf),
		\amp, Pseq([Pseries(0.35,0.005,20),Pseries(0.45,-0.005,20)],inf),
		\lpf, Prand([2500,1500,1000,500],inf),
		\shift, Pseq([Pn(0,10),Pseries(0.001,0.0001,10)],inf),
		).trace;
	eff = Pfx(seq, \echo, \chnl, 50, \maxdeltime, 6, \deltime, 0.2, \dectime, 30)
}).play(quant:1);
)
Pdef(\seqSawB).stop;