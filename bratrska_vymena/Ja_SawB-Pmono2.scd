(
SynthDef(\SawB, { |out, freq = 150, ffreq = 4, amp = 0.2, lpf = 400, shift = 0.001|
	var tone, num, vol;
	num = 4;
	vol = LFSaw.kr([ffreq,ffreq+0.002],0,0.8,0.2);
	tone = Mix.fill(num, { |i| VarSaw.ar(Rand(freq-20,freq+20), shift+(i*0.001) ,i, vol/num,0)});
	tone = LPF.ar(tone, lpf,amp);
	Out.ar(out, Pan2.ar(tone,SinOsc.kr(1,0,0.7)));
}).add;
)

(
Pdef(\seqSawB,
	Pmono(\SawB, \out, 0,
		\freq, Pseq([800,640],inf),
		\ffreq, 2,
		\dur, Pseq([Pn(1,3),3],inf),
		\amp, Pseq([Pseries(0.65,0.005,40),Pseries(0.85,-0.005,20)],inf),
		\lpf, Prand([3500,2500,1500,1000,500],inf),
		\shift, Pseq([Pn(0,10),Pseries(0.001,0.0001,10)],inf),
	)
).play(quant:1);
)
Pdef(\seqSawB).stop;