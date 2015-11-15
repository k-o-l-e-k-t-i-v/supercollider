p=ProxySpace.push(s);



(
~t.play(fadeTime:10, vol:0.7).quant_(2);
~t[0]={
	var sig, env;

	env=EnvGen.kr(Env(times:[24,0.01],curve:[\welch, \welch]),\trig.tr);
	sig= LFSaw.ar(\freq.kr(50),mul:0.2)+LFNoise2.ar(SinOsc.kr(0.25).range(80,100),0.1)+SinOsc.ar([40.1,51.0],mul:0.2);
	sig=sig*env;};
)
~t[1]=\set-> Pbind(\args, [\trig], \dur, 12, \trig, 1);
~t[2]=\set-> Pbind(\args, [\freq], \dur, 10, \octave, Pseq([[3,2],[2,4],[5,3],[4,7]],inf), \degree, [2,4,6,8] );

~t[30]=\filter-> {arg in; CombN.ar(in,0.2,LFNoise2.kr(1/12).range(0.001,0.8),4)};
~t[31]=\filter->{arg in; CombN.ar(in,0.5,LFNoise1.kr(1/10).range(0.002,0.4),6)*SinOsc.ar([40.1,41])};
~t[32]=\filter-> {arg in; LPF.ar(Limiter.ar(CompanderD.ar(in),0.5),\lpf.kr(180,10))};
~t[33]=\set-> Pbind(\args, [\lpf], \dur, 24, \lpf, Pseq([1200,800,600,180,100],inf));
~t[34]=\filter-> {arg in; GVerb.ar(in,40)};


~w.play(vol:0.7, fadeTime:12);
(~w[0]={
	var sig, env;

	env=EnvGen.kr(Env([0,1,0],[0.4,2]),\trig.tr);
	sig=LFSaw.ar(\freq.kr+[1,2,3,5,8,13,21].reciprocal,(0..2pi)).lag(0.02,0.01)*env;
};)
~w[1]=\set->Pbind(\args, [\trig], \dur, 12, \trig, 1);
~w[2]=\set->Pbind(\args, [\freq], \dur, 12, \octave, Prand([3,2,3,2,4,2,5],inf), \degree, [2,4,6]);

~w[30]=\filter-> {arg in; CombN.ar(in,4,0.05,12)};
~w[31]=\filter->{arg in; Limiter.ar(LPF.ar(in, \lpf.kr(1400)),0.4)};
~w[32]=\filter-> {arg in; GVerb.ar(in,10)};

