(
SynthDef(\SinC, { |out = 0, freq = 150, amp = 0.2|
	var tone, num, vol;
	num = 16;
	vol = LFSaw.kr(freq/2,0,0.2,0.8);
	tone = Mix.fill(num, { |i|
		SinOsc.ar(freq+Rand(-15.0,15.0),SinOsc.kr(i*0.001),vol/num*amp)
	});
	Out.ar(out, Pan2.ar(tone));
}).add;
)

(
Pdef(\seqSinC, {
	Pmono(\SinC,
		\amp, Pseq([Pseq([0.6,0.45],6),0.35,0.25,0.40],inf),
		\dur, Pseq([Pn(5,3),2.5],inf),
		\midinote,Pseq([57,Prand([55,59]),54,Prand([60,58,56])], inf)
	).trace;
}).play(quant:5);
)
Pdef(\seqSinC).stop;