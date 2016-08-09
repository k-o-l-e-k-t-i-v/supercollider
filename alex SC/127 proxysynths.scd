(
ProxySynthDef(\ju, {
	arg sustain, amp, f2;
	var sig, fenv, env;

	env=EnvGen.kr(Env(),timeScale:sustain,doneAction:2);
	fenv= EnvGen.kr(Env([\freq.kr, \freq.kr*4],[sustain*0.5]),timeScale:sustain);

	sig= BPF.ar(WhiteNoise.ar(amp!2)+BrownNoise.ar(amp!2),fenv,rq:SinOsc.kr(f2).range(0.001,1));
	sig=sig*env*amp;

}).add;

ProxySynthDef(\tss, {
	arg  sustain,  amp, pan;
	var sig, env, fenv;

	env=EnvGen.kr(Env.perc([0,1,0],[0.01,0.5]),timeScale:sustain,doneAction:2);
	sig=HPF.ar(WhiteNoise.ar(0.7)+PinkNoise.ar(0.5),\freq.kr);
	sig=Pan2.ar(Limiter.ar(sig,0.7),pan);
	sig=FreeVerb.ar(sig,mix:0.5,room:2,damp:1)*env*amp;

}).add;

ProxySynthDef(\tus, {
	arg  sustain,  amp, pan;
	var sig, env, fenv;

	env=EnvGen.kr(Env([0,1,0],[0.01,0.3]),timeScale:sustain,doneAction:2);
	sig=Clip.ar(GrayNoise.ar(1),-0.2,1)-0.5;
	sig=Pan2.ar(Limiter.ar(sig,1),pan);
	sig=LPF.ar(sig, \freq.kr);
	sig=sig*env*amp;

}).add;

ProxySynthDef(\blow, {
	arg  sustain,  amp, pan;
	var sig, env, fenv;

	env=EnvGen.kr(Env([0,1,0],[0.1,4]),timeScale:sustain,doneAction:2);
	sig=WhiteNoise.ar(LFNoise1.kr(10).range(0.01,0.1))+PinkNoise.ar(LFNoise2.kr(4).range(0.01,0.1));
	sig=BPF.ar(sig,[\freq.kr.lag(0.2),\freq.kr.lag(0.02),\freq.kr.lag(2)]+fib(10),LFNoise2.kr(200).range(0.001,0.01),5);
	sig=Limiter.ar(sig*env*amp,0.8);

}).add;


ProxySynthDef(\mel, {
	arg  sustain,  amp;
	var sig, env, fenv;

	env=EnvGen.kr(Env([0,1,0],[0.01,0.5]),timeScale:sustain,doneAction:2);
	sig=LFSaw.ar([\freq.kr,\freq.kr.lag(0.2),\freq.kr.lag(0.4)]).lag([0.02,0.04]);
	sig=sig*LFPulse.ar([3,5]);
	sig=LPF.ar(sig,1800);
	sig=sig*env*amp;

}).add;



ProxySynthDef(\strange, {
	arg  sustain,  amp;
	var sig, env, fenv;

	env=EnvGen.kr(Env([0,1,0],[0.01,0.5]),timeScale:sustain,doneAction:2);
	sig=BPF.ar(WhiteNoise.ar(0.7),LFSaw.kr([4,3]).range(\freq.kr,\freq.kr+[200,202]),Saw.kr([5,8]).range(1,0.001));
	sig=sig*env*amp*2;

}).add;


ProxySynthDef(\aural, {
	arg  sustain,  amp;
	var sig, env, fenv;

	env=EnvGen.kr(Env([0,1,0],[1,6]),timeScale:sustain,doneAction:2);
	sig=SinOsc.ar(\freq.kr+LFNoise0.ar([100,160]).range(2,40).round(2));
	sig=sig+BPF.ar(PinkNoise.ar([0.4,0.6]),\freq.kr,0.1);
	sig=sig*env*amp;

}).add;


ProxySynthDef(\tum, {
	arg  sustain,  amp, pan, rq;
	var sig, env, fenv;

	env=EnvGen.kr(Env([0,1,0],[0.01,0.9]),timeScale:sustain,doneAction:2);
	fenv= EnvGen.kr(Env([\freq.kr,\freq.kr*6, \freq.kr],[0.001,0.05]));
	sig=SinOsc.ar(fenv)+BPF.ar(Clip.ar(GrayNoise.ar(1,1),0.9,1), fenv,rq);
	sig=Pan2.ar(Splay.ar(sig)*env*amp, pan);

}).add;

ProxySynthDef(\bum, {
	arg  sustain,  amp;
	var sig, env, fenv;

	env=EnvGen.kr(Env([0,1,0],[0.01,1]),timeScale:sustain,doneAction:2);
	fenv= EnvGen.kr(Env([\freq.kr,\freq.kr*4, \freq.kr],[0.001,0.05]));
	sig=SinOsc.ar(fenv!2+fib(10).reciprocal);
	sig=FreeVerb.ar(sig,mix:0.3,room:1,damp:1);
	sig=Splay.ar(sig)*env*amp;

}).add;

ProxySynthDef(\dribble, {
	arg  sustain,  amp,lag,f2;
	var sig, env;

	env=EnvGen.kr(Env(),timeScale:sustain,doneAction:2);
	sig=BPF.ar(BrownNoise.ar(amp),\freq.kr+SinOsc.kr(\freq.kr*2).range(40,20),
		rq:SinOsc.kr(\freq.kr).range(0.01,0.1));
	sig=sig+Mix.fill(4,{LFSaw.ar(\freq.kr!4,mul:0.5).lag(lag).clip(-1,0.2)});
	sig=Limiter.ar(sig,0.1);
	sig=FreeVerb.ar(sig,room:1.5,damp:SinOsc.kr(f2),add:sig);

	sig=DelayN.ar(sig*env*amp,0.4,delaytime:0.2);
}).add;


ProxySynthDef(\woosh, {
	arg  sustain, amp,f2;
	var sig, env,fenv;


	env=EnvGen.kr(Env(),timeScale:sustain,doneAction:2);
	fenv= EnvGen.kr(Env([\freq.kr*2, \freq.kr],[sustain]),timeScale:sustain);

	sig=BPF.ar(WhiteNoise.ar(amp),fenv,0.5,mul:SinOsc.kr(f2).range(0.2,0.8));
	sig=HPF.ar(sig,16000).clip(-0.3,1);
	sig=FreeVerb.ar(sig,room:2,damp:0.1,add:sig);
	sig=Pan2.ar(sig*env,SinOsc.kr(f2));
	sig=FreeVerb.ar(sig,room:2);

sig*amp*env;

}).add;
)
