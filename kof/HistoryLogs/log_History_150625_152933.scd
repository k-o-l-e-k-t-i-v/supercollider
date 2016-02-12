// History, as it was on Thu Jun 25 15:29:33 2015.

[
[ 0, 'me', "(
ProxySynthDef(\\bum, {
	arg sustain, freq, amp, voln, top;
	var sig, env, fenv;

	env=EnvGen.kr(Env.adsr(),\\gate.kr(1),timeScale:sustain,doneAction:2);
	fenv=EnvGen.kr(Env([freq*top, freq],[ sustain*0.04], [\\welch]));
	sig= SinOsc.ar(fenv!2,add:LPF.ar(Dust.ar(voln).lag(0.0002),2000));
	sig*env*amp;

}).add;

ProxySynthDef(\\bumblow, {
	arg sustain, freq, amp;
	var sig, env, fenv;

	env=EnvGen.kr(Env.adsr(),\\gate.kr(1),timeScale:sustain,doneAction:2);
	fenv=EnvGen.kr(Env([freq*4, freq],[ sustain*0.04], [\\welch]));
	sig= SinOsc.ar(fenv!2,mul:0.5)+StkBlowHole.ar(\\f2.kr!2,noisegain:60,register:12,mul:SinOsc.kr(\\f2.kr/100,mul:0.2));
	sig*env*amp;

}).add;

ProxySynthDef(\\tic, {
	arg sustain, freq, amp, b;
	var sig, env, fenv, mul;

	mul=SelectX.ar(b, [
		Decay.ar(Impulse.ar([10,15]),0.5),
		LFSaw.ar([5,4]),
		LFPulse.ar([40,22]).lag(0.02)]);

	env=EnvGen.kr(Env.adsr(),\\gate.kr(1),timeScale:sustain,doneAction:2);
	fenv=EnvGen.kr(Env([freq*5, freq],[ sustain*0.04], [\\welch]));
	sig= SinOsc.ar(fenv!2)*(mul+WhiteNoise.ar(0.02));
	sig*env*amp;

}).add;


ProxySynthDef(\\sin, {
	arg sustain, freq, amp, voln;
	var sig, env, fenv;

	env=EnvGen.kr(Env.adsr(),\\gate.kr(1),timeScale:sustain,doneAction:2);
	sig=Mix.fill(20, {arg i; SinOsc.ar(freq*[1,2,3,5,8].reciprocal,add:GrayNoise.ar(voln))});
	Limiter.ar(sig,0.5)*env*amp;


}).add;

ProxySynthDef(\\ts, {
	arg sustain, amp, freq;
	var sig, env, fenv;

	env=EnvGen.kr(Env.adsr(),\\gate.kr(1),timeScale:sustain,doneAction:2);
	fenv=EnvGen.kr(Env([freq*2, freq, freq*4], [0.2, 0.4]*sustain));
	sig=(Dust.ar(fenv!4)+GrayNoise.ar(0.5!4).clip(0.2,0.6))*LFSaw.kr(fenv).lag(0.02);
	sig*env*amp;}).add;


ProxySynthDef(\\blow, {
	arg sustain, amp,noise, freq;
	var env, sig;
	env=EnvGen.kr(Env.adsr(),\\gate.kr(1),timeScale:sustain,doneAction:2);
	sig=StkBlowHole.ar(freq,noisegain:noise);
	sig=Pan2.ar(sig,SinOsc.kr(\\f2.kr))*env*amp;

}).add;

ProxySynthDef(\\saw, {
	arg sustain, amp, freq, voln;
	var env, sig;
	env=EnvGen.kr(Env.adsr(),\\gate.kr(1),timeScale:sustain,doneAction:2);
	sig=LFSaw.ar(freq,[0,2,pi,2pi],add:WhiteNoise.ar(SinOsc.kr(\\f2.kr).range(0.1,0.5))*voln).clip(-0.5,0.5).lag(0.0002)*env*amp;


},makeFadeEnv:true).add;

)" ],
[ 1.350091997, 'me', "(
ProxySynthDef(\\bum, {
	arg sustain, freq, amp, voln, top;
	var sig, env, fenv;

	env=EnvGen.kr(Env.adsr(),\\gate.kr(1),timeScale:sustain,doneAction:2);
	fenv=EnvGen.kr(Env([freq*top, freq],[ sustain*0.04], [\\welch]));
	sig= SinOsc.ar(fenv!2,add:LPF.ar(Dust.ar(voln).lag(0.0002),2000));
	sig*env*amp;

}).add;

ProxySynthDef(\\bumblow, {
	arg sustain, freq, amp;
	var sig, env, fenv;

	env=EnvGen.kr(Env.adsr(),\\gate.kr(1),timeScale:sustain,doneAction:2);
	fenv=EnvGen.kr(Env([freq*4, freq],[ sustain*0.04], [\\welch]));
	sig= SinOsc.ar(fenv!2,mul:0.5)+StkBlowHole.ar(\\f2.kr!2,noisegain:60,register:12,mul:SinOsc.kr(\\f2.kr/100,mul:0.2));
	sig*env*amp;

}).add;

ProxySynthDef(\\tic, {
	arg sustain, freq, amp, b;
	var sig, env, fenv, mul;

	mul=SelectX.ar(b, [
		Decay.ar(Impulse.ar([10,15]),0.5),
		LFSaw.ar([5,4]),
		LFPulse.ar([40,22]).lag(0.02)]);

	env=EnvGen.kr(Env.adsr(),\\gate.kr(1),timeScale:sustain,doneAction:2);
	fenv=EnvGen.kr(Env([freq*5, freq],[ sustain*0.04], [\\welch]));
	sig= SinOsc.ar(fenv!2)*(mul+WhiteNoise.ar(0.02));
	sig*env*amp;

}).add;


ProxySynthDef(\\sin, {
	arg sustain, freq, amp, voln;
	var sig, env, fenv;

	env=EnvGen.kr(Env.adsr(),\\gate.kr(1),timeScale:sustain,doneAction:2);
	sig=Mix.fill(20, {arg i; SinOsc.ar(freq*[1,2,3,5,8].reciprocal,add:GrayNoise.ar(voln))});
	Limiter.ar(sig,0.5)*env*amp;


}).add;

ProxySynthDef(\\ts, {
	arg sustain, amp, freq;
	var sig, env, fenv;

	env=EnvGen.kr(Env.adsr(),\\gate.kr(1),timeScale:sustain,doneAction:2);
	fenv=EnvGen.kr(Env([freq*2, freq, freq*4], [0.2, 0.4]*sustain));
	sig=(Dust.ar(fenv!4)+GrayNoise.ar(0.5!4).clip(0.2,0.6))*LFSaw.kr(fenv).lag(0.02);
	sig*env*amp;}).add;


ProxySynthDef(\\blow, {
	arg sustain, amp,noise, freq;
	var env, sig;
	env=EnvGen.kr(Env.adsr(),\\gate.kr(1),timeScale:sustain,doneActi