(
~o.play;
~o.fadeTime=1;
~o.quant=1;
~o.clock=TempoClock(60/60).permanent_(true);
~o[0]={
	var sig, sig2, env, benv,fenv;

	benv=EnvGen.kr(Env([0,1,0],[0.01,2],\welch),\btrig.tr);
	env=EnvGen.ar(Env([0,1,0],[0.01,2],[\step,\welch,\welch]),\trig.tr);
	fenv=EnvGen.kr(Env([\freq.kr,\freq.kr*4,\freq.kr],[0.01,0.01],\welch),\trig.tr);

	sig=SinOsc.ar(fenv!2,[7,5,3,1,2].reciprocal,0.5);
	sig2=LFSaw.ar([\f2.kr,Lag.kr(\f2.kr,0.4),Lag.kr(\f2.kr,0.1),Lag.kr(\f2.kr,1)],
		[1,2,3,5,8,13,21,34,55,89].reciprocal,[1,0.5,0.125,0.3,0.6].reciprocal).distort;
	sig2=LFPulse.ar([0.5,0.25]).lag(0.02)*sig2;

	Balance2.ar(sig*env*0.5, sig2*0.4,SinOsc.kr([5]))*benv;



};
~o[1]=\set-> Pbind(\args, [\trig], \dur, 6, \trig, 1);
~o[2]=\set-> Pbind(\args, [\freq], \dur, 0.3, \freq, 70);
~o[3]=\set-> Pbind(\args, [\f2], \dur, 0.3, \f2, 3);
~o[4]=\set-> Pbind(\args, [\btrig], \dur, 6, \btrig, 1);



~o[30]=\filter-> {arg in; in+(Decay2.kr(Impulse.kr([0.25,0.5,0.75]),decayTime:0.2)*WhiteNoise.ar(0.1))};
~o[31]=\filter->{arg in; GVerb.ar(in,SinOsc.kr(0.5).range(20,220),add:in,mul:0.5).clip(-1,1)}
)
