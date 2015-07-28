p=ProxySpace.push(s);
AutoIDE.run;

~fut.play(vol:1,fadeTime:1).quant_(1);
(
~fut[0]={
	var b, sig, env, fenv;

	b=1;
	fenv=EnvGen.ar(Env([\freq.kr,2000,\freq.kr, 500,\freq.kr], [0.005,0.005,0.02],\exp), \trig.tr);
	env=EnvGen.ar( Env([0,1,0],[0.5,0.021]), \trig.tr);

	sig=LFPulse.ar([fenv, Lag.ar(fenv,0.2),Lag.ar(fenv+2)],Array.fill(4,{arg i; i+2.reciprocal}),
		Array.fill(4,{LFNoise2.kr(b/2).range(0.5,0.6)})).exprange(-1,1).lag(0.0001);
	sig=sig+GrayNoise.ar(\noise.kr);
	sig=sig*env;
};
~fut[1]=\set->Pbind(\args, [\trig], \dur, 0.15, \trig,1);
~fut[2]=\set->Pbind(\args, [\freq], \dur, 6,\freq, Pseq([50,65,75,85,35],inf));
~fut[3]=\set->Pbind(\args, [\noise], \dur, 6,\freq, Pseq([1,2,0.5],inf));


~fut[30]=\filter-> {arg in; LPF.ar(in,\lpf.kr)};  //play with wrap parameners
~fut[31]=\filter->{arg in; Clip.ar(GVerb.ar(in,20,0.5,0.1,maxroomsize:30,mul:0.1).distort+in,-1,1)};

)
~fut.set(\lpf, 8800);