AutoIDE.run;
p=ProxySpace.push(s);




(
ProxySynthDef(\long, {
	arg sustain, amp, freq, gate=1, f2;
	var sig, env, fenv, nenv, penv, fuenv;

	env=EnvGen.kr(Env([0,1,0],[0.05,0.095],\welch),gate, timeScale:sustain,doneAction:2);
	fenv=EnvGen.kr(Env([freq,freq*4], [sustain*0.004], \welch),gate,timeScale:sustain);
	fuenv=EnvGen.kr(Env([f2,f2,f2*10], [sustain*0.9, sustain*0.1], \welch),gate,timeScale:sustain);

	nenv=EnvGen.kr(Env([0,0.5,0,1], [0.2,0.2,0.6], [\lin, \lin, \step]),gate,timeScale:sustain);
	// penv=EnvGen.kr(Env([-1,1,0], [0.02,0.2], [\lin, \welch]),gate,timeScale:sustain);

	sig=SinOsc.ar(fenv)+(GrayNoise.ar(nenv)*LFSaw.kr(fuenv));
	sig*env*amp}).add;

ProxySynthDef(\longn, {
	arg sustain, amp, freq, gate=1, f2;
	var sig, env, fenv, nenv, penv, fuenv;

	env=EnvGen.kr(Env([0,1,0],[0.1,0.09],\welch),gate, timeScale:sustain,doneAction:2);
	fenv=EnvGen.kr(Env([freq,freq*4], [sustain*0.004], \welch),gate,timeScale:sustain);
	fuenv=EnvGen.kr(Env([f2,f2*10], [sustain*0.9, sustain*0.1],[ \welch, \step]),gate,timeScale:sustain);

	nenv=EnvGen.kr(Env([0,0.5,0,1], [0.2,0.2,0.6], [\lin, \lin, \step]),gate,timeScale:sustain);
	// penv=EnvGen.kr(Env([-1,1,0], [0.02,0.2], [\lin, \welch]),gate,timeScale:sustain);

	sig=GrayNoise.ar(nenv)*SinOsc.kr(fuenv);
	sig*env*amp}).add;

ProxySynthDef(\ss, {
	arg sustain, amp, freq, gate=1, f2;
	var sig, env, fenv, nenv, penv, fuenv;

	env=EnvGen.kr(Env([0,1,0],[0.05,0.095],\welch),gate, timeScale:sustain,doneAction:2);
	fenv=EnvGen.kr(Env([freq,freq*4], [sustain*0.004], \welch),gate,timeScale:sustain);
	fuenv=EnvGen.kr(Env([f2,f2,f2*10], [sustain*0.9, sustain*0.1], \welch),gate,timeScale:sustain);

	nenv=EnvGen.kr(Env([0,0.5,0,1], [0.2,0.2,0.6], [\lin, \lin, \step]),gate,timeScale:sustain);
	// penv=EnvGen.kr(Env([-1,1,0], [0.02,0.2], [\lin, \welch]),gate,timeScale:sustain);

	sig=SinOsc.ar(fenv)+(GrayNoise.ar(1)*LFSaw.kr(fuenv));
	sig*env*amp}).add;


ProxySynthDef(\noise, {
	arg sustain, amp, freq, gate=1, f2, hpf;
	var sig, env, fenv, nenv, penv, fuenv;

	env=EnvGen.kr(Env([0,1,0],[0.05,0.095],\welch),gate, timeScale:sustain,doneAction:2);
	fenv=EnvGen.kr(Env([freq,freq*4], [sustain*0.004], \welch),gate,timeScale:sustain);
	fuenv=EnvGen.kr(Env([f2,f2,f2*10], [sustain*0.9, sustain*0.1], \welch),gate,timeScale:sustain);

	nenv=EnvGen.kr(Env([0,0.5,0,1], [0.2,0.2,0.6], [\lin, \lin, \step]),gate,timeScale:sustain);

	sig=HPF.ar(GrayNoise.ar(nenv),hpf).clip(0.2,1)*LFSaw.kr(fuenv);
	sig*env*amp}).add;


ProxySynthDef(\grains, {
	arg sustain, amp, freq, gate=1, lpf, lag, n;
	var sig, env, fenv, nenv, penv, noise;

	env=EnvGen.kr(Env([0,1,0],[0.1,0.9],\welch),gate, timeScale:sustain,doneAction:2);
	sig=LPF.ar(LeakDC.ar(
		Lag.ar(CombC.ar(GrayNoise.ar(amp)*env,Lag.kr(freq.reciprocal,0.2),Lag.kr(freq.reciprocal,0.3),12),lag)),lpf);
	sig=Pan2.ar(sig,0)*amp;


}).add;


////////////////////////

ProxySynthDef(\glitch, {
	arg sustain, freq, n, gate=1, amp, pos;
	var sig, env, glitch, fenv;
	glitch=SelectX.ar(n,[
		HPF.ar(GrayNoise.ar(1)*Decay2.kr(Impulse.kr(15),decayTime:0.5),9000),
		LFSaw.ar(LFNoise0.kr(100).range(3,0.5)),
		LFPulse.ar(freq/15,add:Dust.ar(700)),
		WhiteNoise.ar(Decay.kr(Impulse.kr(5)).exprange(0.8,0.01))

	]);
	env=EnvGen.kr(Env([0,1,0], [0.1,0.9]),gate:gate,timeScale:sustain,doneAction:2);
	fenv=EnvGen.kr(Env([freq*4, freq], [sustain*0.04]),gate:gate);
	sig=Pan2.ar(Limiter.ar(Mix.fill(20,{SinOsc.ar(fenv)}),1)+glitch,pos);
	sig*env*amp;}).add;

ProxySynthDef(\onion, {
	arg sustain, gate=1, amp, freq, f2, fsaw;
	var sig, env, fenv, penv, nenv;

	env=EnvGen.kr(Env([0,1,0.2,1,0],[0.1,0.2,0.6,0.1],\welch),gate,timeScale:sustain,doneAction:2);
	fenv=EnvGen.kr(Env([freq*4, freq],[sustain*0.04],\welch),gate);
	penv=EnvGen.kr(Env([0,-1,1,0,-1,1],[0.2,0.05,0.5,0.2,0.05]),gate,timeScale:sustain);
	nenv=EnvGen.kr(Env([0,0,1,0,0,1,0],[0.2,0.05,0.05,0.6,0.05,0.05]),gate,timeScale:sustain);

	sig=Mix.fill(15, {arg i;
		SinOsc.ar(SinOsc.kr(LFNoise0.kr(f2).range(fenv,fenv+i)).range(fenv,fenv+i),[0,i,pi],add:GrayNoise.ar(nenv))})*SinOsc.ar(fsaw);
	sig=Pan2.ar(Limiter.ar(sig+WhiteNoise.ar(0.1),1)*amp,penv);}).add;

)