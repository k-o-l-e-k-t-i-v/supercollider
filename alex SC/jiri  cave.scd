AutoIDE.run;
AutoIDE.print;
{SinOsc.ar(65)}.play;
p=ProxySpace.push(s);

~t1.play(vol:0.5, fadeTime:0.6).quant_(2);
(~t1[0]={
	var sig, env, fenv, sig2;
	env=EnvGen.kr(Env([0,1,1,0],[0.01,0.2,0.01],\welch),\aTrig.tr);
	fenv = EnvGen.ar(Env([\freq.kr,14000,\freq.kr], [0.03,0.14], \exp), \aTrig.tr);

	sig=SinOsc.ar(fenv)*env;
}
)

~t1[1]=\set->Pbind(\args, [\aTrig], \dur,8 , \aTrig, 1);
~t1[2]=\set->Pbind(\args, [\freq], \dur, 4, \freq, Pseq([65, 86, 45, 86, 45],inf));

~t1[30]=\filter->{arg in; GVerb.ar(in,roomsize:80)};
~t1[30]=nil;
~t1[31]=\filter->{arg in; LPF.ar(in, \lpf.kr)};
~t1[32]=\set->Pbind(\args, [\lpf], \dur, 4,  \lpf, Pseq([200,400,600,200],inf))
~t1[36]=\filter-> {arg in; Limiter.ar(in,0.9)}
~t1.stop;


~t2.stop;
~t2.play(vol:0.1, fadeTime:0.6).quant_(2);
(~t2[0]={
	var sig, env, fenv, sig2;
	env=EnvGen.kr(Env([0,1,1,0],[0.01,0.4,0.01],\welch),\aTrig.tr);
	fenv = EnvGen.ar(Env([\freq.kr(60,1),14000,\freq.kr(60,1)], [0.03,0.14], \exp), \aTrig.tr);

	sig=LFSaw.ar(\freq.kr+fib(10).reciprocal).lag([0.01,0.02])*LFSaw.ar([4,2]);
}
)

~t2[1]=\set->Pbind(\args, [\aTrig], \dur, 4, \aTrig, 1);
~t2[2]=\set->Pbind(\args, [\freq], \dur, 8, \freq, Pseq([460,660,880,240,1240],inf));

~t2[30]=\filter->{arg in; GVerb.ar(in,roomsize:40)};
~t2[31]=\filter->{arg in; LPF.ar(in, 400)};
~t2[36]=\filter-> {arg in; Limiter.ar(in,0.9)}

~t3.scope;
~t3.stop(fadeTime:2);
~t3.play(vol:0.9, fadeTime:0.6).quant_(2);
(~t3[0]={
	var sig, env, fenv, sig2;
	env=EnvGen.kr(Env([0,1,1,0],[0.01,0.1,0.01],\welch),\aTrig.tr);
	sig=WhiteNoise.ar([0.1,0.3,0.5])*env;
	sig=Splay.ar(sig);
}
)

~t3[1]=\set->Pbind(\args, [\aTrig], \dur, 4, \aTrig, 1);

// ~t3[30]=\filter->{arg in; GVerb.ar(in,roomsize:40)};
~t3[31]=\filter->{arg in; LPF.ar(in, \freq.kr)};
~t3[32]=\set->Pbind(\args, [\freq], \dur, 8, \freq, Pseq([800,1240],inf));

~t3[34]=\filter->{arg in; CombN.ar(in,\del.kr(2),[0.25])};
~t3[35]=\filter->{arg in; GVerb.ar(in,40)};
~t3[36]=\filter-> {arg in; Limiter.ar(in,0.9)}


~t4.stop;
~t4.play(vol:0.1, fadeTime:0.6).quant_(2);
(~t4[0]={
	var sig, env, fenv, sig2;
	env=EnvGen.kr(Env([0,1,0],[0.01,0.6],\welch),\aTrig.tr);
	sig=VarSaw.ar([\ffreq.kr,\ffreq.kr+fib(4)])*LFSaw.ar([8,2]);
	sig2=WhiteNoise.ar([0.1,0.05])*LFSaw.ar([4/8,2/16]);
	sig=(sig+sig2)*env;
}
)

~t4[1]=\set->Pbind(\args, [\aTrig], \dur, 2, \aTrig, 1);
~t4[2]=\set->Pbind(\args, [\ffreq], \dur, 6,\ffreq, Pseq([320,424,120,440,660],inf));


// ~t3[30]=\filter->{arg in; GVerb.ar(in,roomsize:40)};
~t4[31]=\filter->{arg in; LPF.ar(in, \freq.kr)};
~t4[32]=\set->Pbind(\args, [\freq], \dur, 8, \freq, Pseq([800,1240],inf));

~t4[34]=\filter->{arg in; CombN.ar(in,\del.kr(4),[0.25,0.5,1,0.75,4],2)};
~t4[35]=\filter->{arg in; GVerb.ar(in,40)};
~t4[36]=\filter-> {arg in; Limiter.ar(in,0.9)}


~t5.stop;
~t5.play(vol:0.1, fadeTime:0.6).quant_(2);
(~t5[0]={
	var sig, env, fenv, sig2;
	env=EnvGen.kr(Env([0,1,0],[0.8,1],\welch),\aTrig.tr);
	sig=BPF.ar(WhiteNoise.ar([0.5,0.8]),
		freq:LFNoise0.ar(10).range(165,170),
		rq:LFNoise0.ar(2).range(0.5,0.7));
	sig=sig*LFSaw.ar(LFNoise0.kr(2).range(200,20));
	sig=sig*env;
}
)

~t5[1]=\set->Pbind(\args, [\aTrig], \dur, 2, \aTrig, 1);
// ~t5[2]=\set->Pbind(\args, [\ffreq], \dur, 6,\ffreq, Pseq([320,424,120,440,660],inf));


// ~t3[30]=\filter->{arg in; GVerb.ar(in,roomsize:40)};
// ~t5[31]=\filter->{arg in; LPF.ar(in, \freq.kr)};
// ~t5[32]=\set->Pbind(\args, [\freq], \dur, 8, \freq, Pseq([800,1240],inf));

~t5[34]=\filter->{arg in; CombN.ar(in,\del.kr(4),[0.25,0.5,1,0.75,4],2)};
~t5[35]=\filter->{arg in; GVerb.ar(in,2,10)};
~t5[36]=\filter-> {arg in; Limiter.ar(in,0.9)}


