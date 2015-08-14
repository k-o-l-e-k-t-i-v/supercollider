p=ProxySpace.push(s);

~o.play(vol:0.8, fadeTime:8).quant_(2);
~o.clock=TempoClock(60/60).permanent_(true);
(
~o[0]={
	var sig, env, fenv;
	fenv=EnvGen.kr(Env([\freq.kr,\freq.kr+400, \freq.kr], [0.01,0.04],  \welch), \trig.tr);
	env=EnvGen.kr(Env([0,1,0], [0.1,0.2], [\step, \welch]), \trig.tr);
	sig=LFPulse.ar(fenv+[1,2,3,5,8].reciprocal).lag(0.002)*env;
};
)
~o[1]=\set-> Pbind(\args, [\trig], \dur, 2, \trig, 1);
~o[2]=\set-> Pbind(\args, [\freq], \dur, 8, \freq, Pseq([60,45,50,45,55],inf));
~o[30]=\filter-> {arg in; CombN.ar(in,2,Duty.kr(Dseq([12,4,2],inf),0, Dseq([0.5,[0.25,0.5],0.5,[1,0.5]],inf)),4)};
~o[31]=\filter-> {arg in; GVerb.ar(in,\room.kr(40),\time.kr(2))};
~o[32]=\filter-> {arg in; LPF.ar(in,\lpf.kr(400))};
~o[33]=\filter-> {arg in; Limiter.ar(in,0.8)};


~o.set(\lpf, 2400);
~o.unmap(\lpf);


~ts.play(vol:6, fadeTime:6).quant_(2);
(~ts[0]={
	var sig, env;
	env=EnvGen.kr(Env([0,1,0], [0.05,\long.kr(0.05)], [\step, \welch]), \trig.tr);
	sig=HPF.ar(WhiteNoise.ar(1!4)*env,\hpf.kr(14000,2));
};
)
~ts[1]=\set-> Pbind(\args, [\trig], \dur, 1, \trig, 1);
~ts[2]=\set-> Pbind(\args, [\hpf], \dur, 8, \freq, Pseq([16000,14500,15000],inf));
~ts[3]=\set-> Pbind(\args, [\long], \dur, 4, \long, 0.05);

~ts[30]=\filter-> {arg in; DelayN.ar(CombN.ar(in,1,0.25,2),1,0.5)};
~ts[31]=\filter-> {arg in; FreeVerb.ar(in+(LFSaw.ar([2,3]))*0.3,room:1)};

~ts[32]=\filter-> { arg in; LPF.ar(in,14000)};