(
ProxySynthDef(\ju, {
	arg sustain, amp, f2;
	var sig, fenv,fenv2, env;

	env=EnvGen.kr(Env(),timeScale:sustain,doneAction:2);
	fenv= EnvGen.kr(Env([\freq.kr, \freq.kr*4],[sustain*0.5]),timeScale:sustain);
	fenv2= EnvGen.kr(Env([f2*2, f2],[sustain*0.7]),timeScale:sustain);

	sig=BPF.ar(WhiteNoise.ar(amp)+BrownNoise.ar(amp),fenv,rq:SinOsc.kr(fenv2).range(0.001,1));
	sig=FreeVerb.ar(sig,room:2,damp:0.1,add:sig);
	sig=Pan2.ar(sig*env,SinOsc.kr(fenv));
	sig=FreeVerb.ar(sig,room:2);

	sig=sig*env*amp;

}).add;


ProxySynthDef(\zit, {
	arg  sustain,  amp, pan, hpf, noise;
	var sig, env, fenv;

	env=EnvGen.kr(Env([0,1,0],[0.1,0.3]),timeScale:sustain,doneAction:2);
	sig=LFSaw.ar(\freq.kr+fib(10).reciprocal)+GrayNoise.ar(noise);
	sig=Clip.ar(Splay.ar(sig),0.5,1);
	sig=Pan2.ar(HPF.ar(sig,hpf), pan);
	sig=sig*env*amp;

}).add;


ProxySynthDef(\noiserand, {
	arg  sustain,  amp, pan, hpf, noise;
	var sig, env, fenv;

	env=EnvGen.kr(Env([0,1,0],[3,0.01],[\lin, \exp]),timeScale:sustain,doneAction:2);

	sig=(WhiteNoise.ar(LFNoise0.kr(3).range(0.1,0.6))*LFSaw.kr(LFNoise0.kr(20).range(0.5,4)))+GrayNoise.ar(LFNoise0.kr(5).range(0.1,0.8));
	sig=sig+BPF.ar(GrayNoise.ar(1!2),\freq.kr,LFNoise0.kr(0.5).range(0.2,2));
	sig=FreeVerb.ar(sig,LFNoise0.kr(20).range(0.3,1),LFNoise0.kr(3).range(0.5,2),LFNoise0.kr(3).range(0.2,1),0.2,add:sig);
	sig=Clip.ar(Splay.ar(sig),-1,1);
	sig=Pan2.ar(sig, SinOsc.kr(0.25));
	sig=sig*env*amp;

}).add;




ProxySynthDef(\rrr2, {
	arg  sustain,  amp, pan, lag;
	var sig, env, lenv, fenv;

	lenv=EnvGen.kr(Env([lag, lag+0.02, lag+0.05],[0.01,4]),timeScale:sustain);
	env=EnvGen.kr(Env([0,1,0],[0.5,2]),timeScale:sustain,doneAction:2);
	fenv=EnvGen.kr(Env([4,6,2,3]/5*\freq.kr,[4,[0.2,5,1],1].convertRhythm),timeScale:sustain,doneAction:2);

	sig=LFSaw.ar([fenv, fenv+[1,2,3,5,8].reciprocal]).lag([0.01,0.02]);
	sig=CompanderD.ar(Pan2.ar(sig,SinOsc.ar(0.25/2)));
	sig=Limiter.ar(sig,0.5);
	sig=sig*env*amp;

}).add;


ProxySynthDef(\scr, {
	arg  sustain,  amp, pan, hpf,den;
	var sig, env, fenv;

	env=EnvGen.kr(Env([0,1,0.7,1,0],[0.01,0.1,0.05,0.2]),timeScale:sustain,doneAction:2);
	sig=Impulse.ar(den).lag(0.02);
	sig=AllpassL.ar(sig,0.02,0.2);
	sig=Pan2.ar(sig,SinOsc.kr(0.1));
	sig=sig*env*amp;

}).add;

ProxySynthDef(\ottto, {
	arg  sustain,  amp, dist=1200,lpfmul=0.5;
	var sig, env, env2;

	env=EnvGen.kr(Env([0,1,0],[4,0.02]),timeScale:sustain,doneAction:2);
	env2= EnvGen.kr( Env([0,1,0],[0.05,1]),timeScale: sustain/2, doneAction: 2 );
	sig = RLPF.ar( LFSaw.ar( \freq.kr, mul: env2), LFSaw.kr(0.015,mul: 36,add: 55).midicps, 0.2 ).lag(0.02);
	sig = AllpassN.ar(sig, [0.05, 0.05, 0.08], [0.05.rand, 0.05.rand], 4);
	sig = LPF.ar(sig, [200, 400, 600, 100], lpfmul);
	sig = tanh(sig * dist);
	sig=sig*env*amp;

}).add;





ProxySynthDef(\noiselong, {
	arg  sustain,  amp, pan;
	var sig, env;

	env=EnvGen.kr(Env([0,1,0],[1,0.01]),timeScale:sustain,doneAction:2);
	sig=DFM1.ar(WhiteNoise.ar(0.7),\freq.kr,fib(10),type:0);
	sig=Pan2.ar(sig,SinOsc.kr(pan));
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




ProxySynthDef(\kick,{
	arg  sustain,  amp, pan=0;
	var sig, env, fenv;

	env = EnvGen.ar(Env([0.001,1,0.0001],[0.002,2.5],[3,-3],curve:'exp'),timeScale:sustain, doneAction:2);
	sig = SinOsc.ar(\freq.kr,env**20*8pi);
	sig = Pan2.ar(sig * env*amp,pan);
	Splay.ar(sig,0.75,0.25);
}).add;



ProxySynthDef(\aural, {
	arg  sustain,  amp;
	var sig, env, fenv;

	env=EnvGen.kr(Env([0,1,0],[1,6]),timeScale:sustain,doneAction:2);
	sig=SinOsc.ar(\freq.kr+LFNoise0.ar([100,160]).range(2,40).round(2));
	sig=sig+BPF.ar(PinkNoise.ar([0.4,0.6]),\freq.kr,0.1);
	sig=sig*env*amp;

}).add;

//LFPulse.ar(fenv,0,0.5,add:-0.5)+

ProxySynthDef(\tum, {
	arg  sustain,  amp, pan, rq;
	var sig, env, fenv;

	env=EnvGen.kr(Env([0.5,1,0.5,0],[0.001,0.06,0.26],[-4,-2,-4]),timeScale:sustain,doneAction:2);
	fenv= EnvGen.kr(Env([\freq.kr,\freq.kr*\top.kr(6), \freq.kr],[0.005,0.026]));

	//env=EnvGen.ar(Env([0.5,1,0.5,0],[0.005,0.06,0.26],[-4,-2,-4]),dooneAction:2);
	//fenv=EnvGen.ar(Env([110, 59, 29], [0.005, 0.29], [-4,-5]));

	sig=SinOsc.ar(fenv,env**20*8pi);
	sig=sig+BPF.ar(GrayNoise.ar(1!2,add:-0.5),fenv,rq);

	sig=Pan2.ar(Splay.ar(sig)*env*amp, pan);

}).add;

ProxySynthDef(\bum, {
	arg  sustain,  amp, noise;
	var sig, env, fenv;

	env=EnvGen.kr(Env([0,1,0],[0.01,1]),timeScale:sustain,doneAction:2);
	fenv= EnvGen.kr(Env([\freq.kr,\freq.kr*4, \freq.kr],[0.001,0.05]));
	sig=SinOsc.ar(fenv!2+fib(10).reciprocal)+HPF.ar(GrayNoise.ar(noise!2),800);
	sig=FreeVerb.ar(sig,mix:0.3,room:1,damp:1);
	sig=Splay.ar(sig)*env*amp;

}).add;

ProxySynthDef(\drum, {
	arg  sustain,  amp, rq;
	var sig, env,  fenv;

	env=EnvGen.kr(Env.perc(0.01,0.2),timeScale:sustain,doneAction:2);
	fenv= EnvGen.kr(Env([\freq.kr,\freq.kr*5, \freq.kr],[0.01,0.5]));
	sig=BPF.ar(GrayNoise.ar(0.8)+BrownNoise.ar(1),fenv+fib(5).reciprocal,rq)*20;
	sig=Clip.ar(sig*env*amp,-0.5,0.6);

}).add;



ProxySynthDef(\voice, {
	arg  sustain, amp;
	var sig,env;

	env=EnvGen.kr(Env.perc(2,4),timeScale:sustain,doneAction:2);
	sig=Gendy4.ar(1,1,1,1,\freq.kr,\freq.kr+100,0.01,0.05,10);
	sig=Pan2.ar(sig,SinOsc.kr(0.125));
	sig=sig*env*amp;

}).add;



ProxySynthDef(\dribble, {
	arg  sustain,  amp,lag,f2;
	var sig, env;

	env=EnvGen.kr(Env(),timeScale:sustain,doneAction:2);
	sig=BPF.ar(BrownNoise.ar(amp),\freq.kr+SinOsc.kr(\freq.kr*2).range(80,20),
		rq:SinOsc.kr(f2).range(0.001,0.1));
	sig=sig+Mix.fill(4,{LFSaw.ar(\freq.kr!4,mul:0.5).lag(lag).clip(-1,0.2)});
	sig=Limiter.ar(Splay.ar(sig),0.7);
	sig=FreeVerb.ar(sig,room:1.5,damp:SinOsc.kr(f2),add:sig);

	sig=sig*env*amp;
}).add;




ProxySynthDef(\zzz, {
	arg sustain, amp;
	var sig, env;
	env=EnvGen.kr(Env([0,1,0],[0.1,6], [\welch,\welch]),timeScale:sustain,doneAction:2);
	sig=CombL.ar(GrayNoise.ar(0.5),1/\freq.kr,1/(\freq.kr-10),4);
	sig=OnePole.ar(sig,0.2)+FreeVerb.ar(sig,room:0.2);
	sig=Limiter.ar(CompanderD.ar(Lag.ar([sig, DelayL.ar(sig,0.4,0.02)],0.002)),0.5);
	sig=sig*env*amp;
}).add;

)