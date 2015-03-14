s.scope(4);
s.plotTree; // it looks like Ndef (system_link_audio), just with pattern

p = ProxySpace.push(s);
(
~q.play;
~q.fadeTime_(4);
~q.quant = 4;

~q[0] = {|freq, sustain, amp, t_trig|
	var osc, aEnv, fEnv;
	aEnv = EnvGen.kr(Env.adsr(0.05*sustain,0.25*sustain,0.7,0.7*sustain),t_trig);
	osc = LFSaw.ar(freq!2,0.1,1,BrownNoise.kr(0.8))*LFSaw.ar([35,40,65,66],0,0.2,0.8)*LFPulse.ar([4,5], 0, 0.1);
	osc = osc + Saw.ar([35,40],SinOsc.kr(0.1,0,0.2,0.3),0.5);
	osc = osc * aEnv * amp;
	osc = Limiter.ar(osc,0.95);
};
~q[10] = \set -> Pbind( \amp, 0.8, \t_trig, 1,
	\dur, Pstutter(Pseq([64, 8], inf),Pseq([0.25,0.125], inf)),
	\legato, Pn(Pseries(0.1,0.01,20), inf),
	\octave, Pseq([Pn(2,32),Pn(4,15),Prand([7,8])], inf),
	\degree, Pswitch([
		Pseq([3,3,3,7]),
		Pseq([5,5,3,3]),
		Pseq([3,4,3,2]),
		Pseq([3,\,4,\]),
		Rest(1)
	], Pseq([3,0,1,0,3,0,2,4], inf))
).trace;

~q[30] = \filter -> {|in| LPF.ar(in, SinOsc.kr(0.1,0,800,2000));};
~q[32] = \filter -> {|in| FreeVerb.ar(in,0.1,SinOsc.kr(2,0,0.8,0.8),0.9,1)};
~q[34] = \filter -> {|in| CombC.ar(in,0.75,0.0625,4,1,in)};
~q[36] = \filter -> {|in| [Pan2.ar(in[0],Saw.kr(0.1)),Pan2.ar(in[1],Saw.kr(0.5))]};
)
~q.stop(10);
~q.clean;
