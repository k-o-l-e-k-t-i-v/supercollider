p = ProxySpace.push(s);

(
~q.play;
~q.fadeTime_(4);
~q.quant = 1;

~q[0] = {|freq, sustain, amp, t_trig|
	var osc, aEnv;
	osc = LFSaw.ar(freq!2);
	aEnv = EnvGen.kr(Env.adsr(0.05*sustain,0.25*sustain,0.6,0.7*sustain),t_trig);
	osc = osc * aEnv * amp;
};
~q[1] = \set -> Pbind( \amp, 0.3, \t_trig, 1,
	\dur, 0.25,
	\legato, 2.2,
	\octave, 3, \degree, Pseq([3,3,3,7], inf)
);

~q[30] = \filter -> {|in| LPF.ar(in, 900);};
~q[32] = \filter->{|in| FreeVerb.ar(in,0.6,0.9,0.5,1,in)};
)
~q.stop(10);