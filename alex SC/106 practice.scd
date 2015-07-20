p=ProxySpace.push(s);

(

ProxySynthDef(\pitch, {
	arg sustain, gate=1, amp, freq, pitch;
	var sig, env,fenv;

	env=EnvGen.kr(Env([0,1,0],[[0.5,0.5],[0.1,0.9],[0.8,0.2]],[\welch,\sin,\lin]),gate,timeScale:sustain,doneAction:2);

	sig=LFSaw.ar(freq!2).lag([0.01,0.2,0.002,0.05,0.02,0.03]);
	sig=PitchShift.ar(sig,
		windowSize:0.1,  // don't fuck with this guy
		pitchRatio:[0.5,0.8,1.2]);
	sig=Pan2.ar(sig,0)*env*amp;}).add;



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


ProxySynthDef(\rotate, {
	arg sustain, amp, gate=1, freq, lpf, hpf, b;
	var sig, sig1,sig2, env, fenv, nenv;

	env=EnvGen.kr(Env([0,1,0], [0.01,0.99]),gate:gate,timeScale:sustain,doneAction:2);
	fenv=EnvGen.kr(Env([freq*1.2, freq, freq*1.2, freq], [sustain*0.04, sustain*0.2, sustain*0.02]),gate:gate);

	sig1=LPF.ar(LFSaw.ar([fenv,fenv+2, Lag.kr(fenv,0.2), Lag.kr(fenv,0.4), Lag.kr(fenv,0.02), Lag.kr(fenv+10,0.8)]), lpf)
	*Decay.kr(Impulse.kr([b, b*1.5,b/2]),0.5);
	sig2=HPF.ar(WhiteNoise.ar(LFNoise0.ar(20).range(0.01,0.9))*Decay2.kr(Impulse.kr([b,b*1.5,b]),decayTime:0.2),hpf);

	sig=Rotate2.ar(sig1,sig2,SinOsc.kr([0.125,0.25]))*env*amp;}).add;


)
(

~rotate1.play;
~rotate1.fadeTime=4;
~rotate1.quant=1;
~rotate1.clock=TempoClock(60/60).permanent_(true);
~rotate1[0]=Pbind(\instrument, \rotate,
	\dur,8, //Pseq([Pn(20,0.2),Pn(5,0.1),Pn(2,0.2)],inf),
	\octave, Pseq([[3,4],4,[2,3],4],inf),
	\degree, [4,2],
	\lpf, 400,
	\hpf, 9000,
	\amp, 0.4,
	\b,4
);
~rotae1[28]=\filter-> {arg in; Compander.ar(in)};
~rotae1[29]=\filter-> {arg in; CombN.ar(in,1,1,5)};
~rotate1[30]=\filter-> {arg in; GVerb.ar(in,roomsize:LFSaw.kr([0.5,0.25]).range(80,10),revtime:2,maxroomsize:85,add:in)};
~rotate1[31]=\filter-> {arg in; in+(GrayNoise.ar(LFNoise0.kr(0.125).range(0.01,0.5)*SinOsc.kr(10))*Decay.kr(Impulse.kr([0.125,0.3]),4))};
~rotate1[32]=\filter->{arg in; FreeVerb.ar(in,room:0.2,damp:1)};
~rotare1[33]=\filter-> {arg in; LPF.ar(in,6000)};
)

	