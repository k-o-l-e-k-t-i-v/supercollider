p=ProxySpace.push(s).makeTempoClock;
p.clock.tempo_(420/60);

(
~o.play;
~o.fadeTime=1;
~o.quant=1;
// ~o.clock=TempoClock(60/60).permanent_(true);
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
~o[31]=\filter->{arg in; GVerb.ar(in,SinOsc.kr(0.5).range(20,220),add:in,mul:0.2).clip(-1,1)}
)
~o.clock=TempoClock(120/60).permanent_(true);


p=ProxySpace.push(s);

(
~y.play;
~y.quant=2;
~y.mold(2);
~y.fadeTime=2;
~y[0]={
	var sig, env;

	env=EnvGen.kr(Env([0,1,0.2,0],[0.01,0.198,0.01],\welch),\trig.tr);
	sig=LFSaw.ar(\freq.kr+[1,2,3,5,8,13].reciprocal).lag(0.001)*env;
};
~y[1]=\set-> Pbind(\args, [\trig], \dur, 0.4, \trig, 1);
~y[2]=\set-> Pbind(\args, [\freq], \dur, 0.2,\freq,
	Pswitch([Pseq([45,65,700,78,45,45,85],1),
		Pseq([65,65,600,780,45,45,85],1)],Pseq([0,0,1,0,0,1,1],inf)));

~y[30]=\filter-> {arg in; CombN.ar(in,2,2,4)};
~y[31]=\filter->{arg in; GVerb.ar(in,SinOsc.kr(1/0.4).range(40,200),1,add:in,mul:0.5)+(GrayNoise.ar(0.2)*Decay.ar(Impulse.ar([1/0.4,1/4]),0.2))};
~y[32]=\filter->{arg in; LPF.ar(in,\lpf.kr)};
~y[33]=\set-> Pbind(\args, [\lpf], \dur, Pseq([10,10,40],inf), \lpf, Pseq([85,200,1000],inf));
~y[34]=\filter-> {arg in; Limiter.ar(Compander.ar(in),0.7).clip(-0.7,0.7)}
)