p=ProxySpace.push(s);

(
~sin.play;
~sin.fadeTime=1;
~sin.quant=4;
~sin.clock=TempoClock(60/60).permanent_(true);
~sin[0]={
	var sig, sig2, env, mod;

	mod=SelectX.ar(\n.kr, [
		LFPulse.ar([1,2,4].reciprocal),
		LFPulse.ar([4,3,1].reciprocal),
		LFSaw.ar([40,80,1].reciprocal) ]);


	env=EnvGen.ar( Env( [0,1,0.7,0], [0.5,0.5,2]), \trig.tr );
	sig=SinOsc.ar([\f2.kr,\f2.kr+[5,7,9].reciprocal],mul:0.3)*mod
	+FreeVerb.ar(Dust.ar(LFNoise0.kr(1).range(\noise.kr,40)),room:1).distort;
	sig2=OnePole.ar(LFPulse.ar(\freq.kr,mul:0.3));



	sig=Balance2.ar(sig*env, sig2*env,SinOsc.kr(0.5).range(-1,1))};
~sin[1]=\set-> Pbind(\args, [\trig], \dur, 4, \trig,1);
~sin[2]=\set-> Pbind(\args, [\freq, \f2, \noise, \n], \dur, 4, \noise, 500,
	\freq, Pseq([Pn(80,4), Pn(60,2),Pn(80,2),Pn(40,2)],inf),
	\f2, Pseq([Pn(200,4),Pn(400,2),Pn(800,4)],inf));
~sin[3]=\set->Pbind(\args, [\n],\dur, 16, \n, Pseq([0,1,2],inf));

~sin[30]=\filter->{arg in; GVerb.ar(in,80,1,damping:0,maxroomsize:98,add:in).clip(-0.2,0.3)};
~sin[31]=\filter->{arg in; GVerb.ar(in,90,3, add:in).distort};


)
~sin.set(\f2,160);


({LPF.ar(
GVerb.ar(
Normalizer.ar( Wrap.ar(SinOsc.ar([20,40]),LFNoise2.ar(1).range(-0.9,0.9),LFNoise2.ar(1).range(-0.9,0.9))).clip(-0.7,0.5)
		,100,maxroomsize:130,mul:0.2),800)}.play;
)


(
~pop.play;
~pop.quant=1;
~pop.fadeTime=1;
~pop[0]={
	var sig, env, sig2, sig3, out;

	env=EnvGen.ar( Env( [0,1,0.7,0], [0.15,0.85,1]), \trig1.tr);

	sig=GrainFM.ar(1,SinOsc.ar([2,0.5]),12,LFNoise0.ar(5).range(100,140).round(40),
		modfreq:LFPulse.ar([40,60],add:LFNoise0.kr(4).range(20,40).round(4)));
	sig=FreeVerb.ar(sig,room:1);
	sig2=SinOsc.ar([\freq.kr*[2,3,5,8,13].choose])+FreeVerb.ar(DelayN.ar(Dust.ar(120)),room:2)*LFSaw.ar([0.125,0.25]);
	sig3=LFSaw.ar([4/3,6/3,8/3].reciprocal);

	out=Balance2.ar(sig,sig2*sig3,SinOsc.kr(0.25))*0.2;};
// ~pop[
)