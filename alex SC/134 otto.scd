ProxySpace.push(s);
(ProxySynthDef(\otto, {
	arg out=0, amp=0.5, freq=440, dist=120, sustain=4,lpfmul=0.1 ;
	var env, sig;
	sig = RLPF.ar( LFSaw.ar( freq, mul: EnvGen.kr( Env([0,1,0],[0.05,0.3]),timeScale:sustain, levelScale: 0.3, doneAction: 2 ) ), LFNoise1.kr(2, 36, 55).midicps, 0.2 );
	sig = AllpassN.ar(sig, [0.05, 0.05, 0.08], [0.05.rand, 0.05.rand], 4);
	sig = LPF.ar(sig, [5,8,13,21]*110,mul:lpfmul);
	sig = tanh(sig * dist);
	env = EnvGen.kr(Env([0,0.5,1,0],[0.1, 0.05, 2],curve:-3),timeScale:sustain, doneAction:2);
	sig = (sig * env).lag(0.002) * amp;
	Out.ar(out, sig);
}).add;)
(
~q[0]=Pbind(
	\instrument, \otto,
	\dur,4,
	\legato,1.5,
	\freq,[85,65,45],
	\dist, Prand([20,2000,1200,800],inf),);
~q.play;
)
~q[3]=\filter->{arg in; GVerb.ar(in,[40,60],SinOsc.kr(0.125).range(4,12),mul:0.4,add:in)};
~q[4]=\filter->{arg in; Limiter.ar(in,1)};

