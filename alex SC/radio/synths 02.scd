
(


ProxySynthDef(\bum, {
	arg sustain, gate=1, amp, freq, pitch;
	var sig, env,fenv, rqenv;

	env=EnvGen.kr(Env([0,1,0],[0.1,0.9],[\welch,\welch]),gate, timeScale:sustain,doneAction:2);
	fenv=EnvGen.kr(Env([freq,freq*4], [sustain*0.004], \welch),gate,timeScale:sustain);
	rqenv=EnvGen.kr(Env([0.001,0.1,1], [0.04,0.96]),gate,timeScale:sustain);

	sig=BPF.ar(GrayNoise.ar(1),fenv,rqenv);
	sig=sig*env*amp;}).add;


ProxySynthDef(\pitch, {
	arg sustain, gate=1, amp, freq;
	var sig, env,fenv;

	env=EnvGen.kr(Env([0,1,0],[[0.5,0.5],[0.1,0.9],[0.8,0.2]],[\welch,\sin,\lin]),gate,timeScale:sustain,doneAction:2);

	sig=LFSaw.ar(freq).lag([0.01,0.2,0.002,0.05,0.02,0.03]);
	sig=PitchShift.ar(sig,
		windowSize:0.1,  // don't fuck with this guy
		pitchRatio:[0.5,0.8,1.2]);
	sig=sig*env*amp;}).add;


ProxySynthDef(\voice, {
	arg sustain, amp, freq, gate=1;
	var sig, env, fenv, nenv, penv;

	env=EnvGen.kr(Env([0,1,0],[0.4,0.6],\welch),gate, timeScale:sustain,doneAction:2);
	fenv=EnvGen.kr(Env([freq,freq*4], [sustain*0.004], \welch),gate,timeScale:sustain);
	nenv=EnvGen.kr(Env([20,15,2], [0.2,0.6,0.2]),gate,timeScale:sustain);
	penv=EnvGen.kr(Env([20,1,3], [0.02,0.2], [\lin, \welch]),gate,timeScale:sustain);


	sig=BPF.ar(in:PinkNoise.ar(LFNoise0.kr(20).range(1,2)),
		freq:[fenv,fenv+2,Lag.kr(fenv,0.2),Lag.kr(fenv-20)],rq:LFNoise0.kr(5).range(0.1,0.0001),add:
		Dust.ar(nenv,0.1));
	sig*env*amp}).add;


ProxySynthDef(\sin, {
	arg sustain, amp, freq, gate=1;
	var sig, env, fenv, nenv, penv;

	env=EnvGen.kr(Env([0,1,0],[0.1,0.9],\welch),gate, timeScale:sustain,doneAction:2);
	fenv=EnvGen.kr(Env([freq,freq*8], [sustain*0.0004], \welch),gate,timeScale:sustain);
	nenv=EnvGen.kr(Env([0,1,0,1], [0.4,0.4,0.2], [\welch, \welch, \step]),gate,timeScale:sustain);


	sig=SinOsc.ar(fenv,add:GrayNoise.ar(nenv));
	sig*env*amp}).add;



ProxySynthDef(\sinlong, {
	arg sustain, amp, freq, gate=1;
	var sig, env, fenv, nenv, penv;

	env=EnvGen.kr(Env([0,1,0],[0.1,0.9],\welch),gate, timeScale:sustain,doneAction:2);
	fenv=EnvGen.kr(Env([freq,freq+10,freq], [sustain*0.4,sustain*0.6], \welch),gate,timeScale:sustain);

	sig=SinOsc.ar(fenv,add:BPF.ar(PinkNoise.ar(0.5),fenv,0.001,0.2));
	sig*env*amp}).add;

ProxySynthDef(\saw, {
	arg sustain, amp, freq, gate=1, lag;
	var sig, env, fenv, nenv, penv;

	env=EnvGen.kr(Env([0,1,0],[0.1,0.9],\welch),gate, timeScale:sustain,doneAction:2);
	fenv=EnvGen.kr(Env([freq,freq+2,freq], [sustain*0.4,sustain*0.6], \welch),gate,timeScale:sustain);

	sig=LFSaw.ar(fenv,[0,2,1,4,5],add:BPF.ar(PinkNoise.ar(1),fenv,0.001,0.2)).clip(-0.5,0.6);
	sig=sig.lag;
	sig*env*amp}).add;

)