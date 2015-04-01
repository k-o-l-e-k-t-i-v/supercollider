p = ProxySpace.push(s);

(
~q.play.quant_(4).fadeTime_(8);

~q[0] = { |freq = 220, amp| SinOsc.ar((freq/2)!2,0,SinOsc.kr(1/2,0,0.4), 0.6) * BrownNoise.ar(0.15,0.85) * amp/2; };
~q[1] = { |freq = 220, amp| LFSaw.ar(freq!2,0,Saw.kr(1/4,0.2), 0.8) * amp/2; };
~q[10] = \xset -> Pbind(
	\amp, 0.5,
	\dur, Pseq([Pn(4,4),2,4,2], inf),
	\octave, Pstutter([8,4,2],Pseq([5,7,4], inf)),
	\degree, Pswitch([
		Pseq([3,3b,3,7], inf),
		Pseq([3,7,6,3b], inf),
	], Pseq([0,1], inf))
);
~q[30] = \filter -> {|in| LPF.ar(in, SinOsc.kr(1/16,0,1000,1200)); };
~q[31] = \filter -> {|in| GVerb.ar(in, 220, 0.5, 0.7); };
)
~q.stop(4);
