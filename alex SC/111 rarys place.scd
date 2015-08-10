p=ProxySpace.push(s);

~t.clear;
~t.play(vol:0.2, fadeTime:1).quant_(1);
(

~t.clock=TempoClock(60/60).permanent_(true);
~t[0]={
	var sig, env,nenv, fenv;

	env=EnvGen.kr(Env([0,1,0],[0.01,0.19],[\welch,\lin]),\trig.tr);
	fenv=EnvGen.kr(Env([\freq.kr,\freq.kr*[10,4,2],\freq.kr],[0.01,0.19],[\welch, \lin]),\trig.tr);
	nenv=EnvGen.kr(Env([0,1,0],[0.19,0.1],[\welch,\lin]),\trig.tr);


	sig=SinOsc.ar(fenv,[1,2,3,5,8].reciprocal)+GrayNoise.ar(nenv);
	sig*env;

};

~t[1]=\set->Pbind(\args, [\trig], \dur, 2, \trig, 1);
~t[2]=\set->Pbind(\args, [\freq], \dur, 1, \freq, 80);
~t[30]=\filter->{arg in; GVerb.ar(in, Duty.kr(10,0,Dseq([10,2,80],inf)),2,maxroomsize:90)};
~t[31]=\filter-> {arg in; CombN.ar(in,2,Duty.kr(12,0, Dseq([0.5,0.25,1],inf)),2)};
~t[32]=\filter-> {arg in; FreeVerb.ar(in,room:2,add:in)};
)
~t[31]=nil;
~t[40]=\set->Pbind(\args, [\del], \dur, Pseq([5,10,2],inf), \del, Pseq([0.5,1,0.25],inf));






~z.play(vol:0.4, fadeTime:8).quant_(8);

(
~z.clock=TempoClock(60/60).permanent_(true);
~z[0]={
	var sig, env;

	env=EnvGen.kr(Env([0,1,0],[0.1,6], [\welch,\welch]),\trig1.tr);
	sig=CombL.ar(GrayNoise.ar(0.5),1/\freq.kr,1/(\freq.kr-10),2)*env;
};
~z[1]=\set->Pbind(\args, [\trig1], \dur, 8, \trig1, 1);
~z[2]=\set->Pbind(\args, [\freq], \dur, 8, \freq, Pseq([90,94,45,80,95],inf));

~z[30]=\filter-> {arg in; OnePole.ar(in)+FreeVerb.ar(in,room:1)};
~z[31]=\filter->{arg in; Limiter.ar(CompanderD.ar(in),0.5)};
~z[32]=\filter-> {arg in; GVerb.ar(in,Duty.kr(8,0,Dseq([100,20,80],inf)))};
~z[33]=\filter-> {arg in; LPF.ar(in,\lpf.kr)};

)

~z.set(\lpf, 1800);




~q.play(vol:0.4,fadeTime:4).quant_(1);

(

~q.clock=TempoClock(180/60).permanent_(true);
~q[0]={
	var sig, env, noise;

	noise=SelectX.ar(\noise.kr, [
		WhiteNoise.ar(1),
		GrayNoise.ar(1),
		PinkNoise.ar(1)]);

	env=EnvGen.kr(Env([0,1,0],[0.01,0.09],[\step,\welch]),\trig.tr);
	sig=LPF.ar(noise*env, \lpf.kr)
};

~q[1]=\set-> Pbind(\args, [\trig], \dur, 1, \trig, 1);
~q[2]=\set->Pbind(\args, [\lpf], \dur, 1, \lpf, Pseq([2000,8000,400,4000,200],inf));
~q[3]=\set-> Pbind(\args, [\noise], \dur, 10, \noise,Pseq([0,1,2],inf));


~q[30]=\filter-> {arg in; GVerb.ar(in,roomsize:80)};
~q[31]=\filter-> {arg in; CombN.ar(in,2,\del.kr,2)};
~q[32]=\set-> Pbind(\args, [\del], \dur, 10, \del, Pseq([1,0.33],inf));
)






~h.play(vol:0.8, fadeTime:1).quant_(2);
~h.mold(2);

(
~h[0]={
	var sig, env, nenv, fenv, penv;

	env=EnvGen.kr(Env([0,1,0,0.5,0],[0.1,2,0.2,1], [\step, \welch, \lin, \welch]),\trig.tr);
	nenv=EnvGen.kr(Env([0,2,0,0.5,0],[0.01,0.2,1.8,0.2], [\welch, \lin,\welch, \lin]), \trig.tr);
	fenv=EnvGen.kr(Env([\freq.kr*4, \freq.kr],[0.04,4]),\trig.tr);
	penv=EnvGen.kr(Env([-1,1,-1],[0.04,0.5]),\trig.tr);

	sig=LFPulse.ar(fenv,mul:3).lag(0.01)+(((GrayNoise.ar(nenv)+WhiteNoise.ar(nenv-0.7))*LFSaw.ar(\f2.kr)));

	Pan2.ar(sig.clip(-0.5,0.5)*env,penv);
};
~h[1]=\set-> Pbind(\args, [\trig], \dur,4, \trig, 1);
~h[2]=\set-> Pbind(\args, [\freq], \dur,8, \freq, Pseq([30,32,37,32,37,30],inf));
~h[3]=\set-> Pbind(\args, [\f2], \dur,8, \f2, Pseq([15,5,2],inf));



~h[30]=\filter-> {arg in; GVerb.ar(Compander.ar(in,thresh:0.7),40)};
// ~h[31]=\filter-> {arg in; LPF.ar(in,9500)};
)


~v.play(vol:0.5, fadeTime:2).quant_(2);
~v.mold(2);
(
~v.clock=TempoClock(120/60).permanent_(true);
~v[0]={
	var sig, env;

	env=EnvGen.kr(Env([0,1,0], [0.1,0.5]),\trig.tr);
	sig=LFPulse.ar(\freq.kr+[0.5,0.25,1].reciprocal,[1,2,3,5].reciprocal,add:Dust.ar(SinOsc.kr(0.125).range(12,1500))).lag(0.001);


	(sig-0.5)*env;
	};
~v[1]=\set->Pbind(\args, [\trig], \dur, 1 ,\trig, 1);
~v[2]=\set-> Pbind(\asrg, [\freq], \dur, 8, \freq, Pseq([40,50,45,50],inf));

~v[30]=\filter-> {arg in; GVerb.ar(in,Duty.kr(10,Dseq([40,10,100,20],inf)),revtime:1,add:in)};
~v[31]=\filter-> { arg in; Limiter.ar(in,2).clip(-1,1)};
)




~f.play(vol:0.4, fadeTime:0.2).quant_(1);

(
~f.mold(2);
~f[0]={
	var sig, env;

	env=EnvGen.kr(Env([0,1,0],[0.5,6],[\lin, \welch]),\trig.tr);
	sig=LFSaw.ar(\freq.kr+[2,6,8].reciprocal).lag(0.01)*env;
};
~f[1]=\set->Pbind(\args, [\trig], \dur, 1, \trig, 1);
~f[2]=\set-> Pbind(\args, [\freq], \dur, 12, \freq, Pseq([110,120,140],inf));

~f[30]=\filter-> {arg in; in+FreeVerb.ar(Dust.ar(LFNoise1.kr(0.25).range(50,1000)),SinOsc.kr(0.25),2)};
~f[31]=\filter-> {arg in; in+(~v.ar*0.8)};
)

~f[31]=nil;


~d.play(vol:0.5, fadeTime:1).quant_(1);
(
~d[0]={
	var sig, env;

	env=EnvGen.ar(Env([0,1,0],[0.01,0.05],\step),\trig.tr);
	sig=SinOsc.ar(\freq.kr!2)*env;
};
~d[1]=\set->Pbind(\args, [\trig], \dur, 0.1,
	\trig,
	  Pseq([
		Pn(1,4),
		Pn(0,2),
		Pn(1,2),
		Prand([ 1,0],2),
		Pn(1,4)],inf));
~d[2]=\set-> Pbind(\args, [\freq], \dur, 1, \freq, Pseq([12000,14000,Pn(10000,4), Pn(12000,2)],inf));

~d[30]=\filter-> {arg in; CombN.ar(in, 2,0.5,1)};
)


~d.set(\freq, 57);
~d.unmap(\freq);





