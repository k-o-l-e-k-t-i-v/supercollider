s.scope(8);


(
Ndef(\l, {

	~s=HPF.ar(WhiteNoise.ar(1),10000);
	~s=~s*Decay2.kr(Impulse.kr([0.5,0.25]),decayTime:0.051);
	~s=FreeVerb.ar(~s,mix:0.5,room:2,damp:0,mul:2);

})
)


(

SynthDef(\sin, {
	arg gate=1, sustain=1, freq=440, amp=1;
	var sig, env;

	env=EnvGen.kr(Env.adsr(sustain*0.3,sustain*0.2,0.7,sustain*0.5),gate,doneAction:2);
	sig=SinOsc.ar(freq*(1..8))*env*amp;

	Out.ar(0,sig);
}).add;


SynthDef(\ripple, {
	arg gate=1, sustain=1, freq=40,f2, amp=1;
	var sig, env, fenv;

	env=EnvGen.kr(Env.adsr(sustain*0.1,sustain*0.1,0.5,sustain*0.8),gate,doneAction:2);
	fenv=EnvGen.kr(Env([freq*5,freq], [sustain*0.05],\welch),gate);

	sig=BPF.ar(GrayNoise.ar(amp),fenv,SinOsc.kr(f2).range(0.001,1))*env;
	sig=Limiter.ar(Pan2.ar(sig,SinOsc.kr(f2)),0.7)*env*amp;
	sig=FreeVerb.ar(sig,mix:0.5,room:0.5,damp:1);

	Out.ar(0,sig);
}).add;


SynthDef(\bum, {
	arg gate=1, sustain=1, freq=40, amp=1;
	var sig, env, fenv;

	env=EnvGen.kr(Env.adsr(sustain*0.1,sustain*0.1,0.5,sustain*0.8),gate,doneAction:2);
	fenv=EnvGen.kr(Env([freq*3,freq], [sustain*0.05],\welch),gate);
	sig=Mix.fill(5, {SinOsc.ar(fenv*(1..10))});
	sig=FreeVerb.ar(sig,mix:0.5,room:2,damp:1);
	sig=Limiter.ar(sig,0.7)*env*amp;

	Out.ar(0,sig);
}).add;

SynthDef(\dribble, {
	arg gate=1, sustain=1, freq=40, amp=1,lag,f2;
	var sig, env;

	env=EnvGen.kr(Env.adsr(sustain*0.1,sustain*0.1,0.5,sustain*0.8),gate,doneAction:2);
	sig=BPF.ar(BrownNoise.ar(amp),freq:freq+SinOsc.kr(freq*2).range(40,20),
		rq:SinOsc.kr(freq).range(0.01,0.1));
	sig=sig+Mix.fill(4,{LFSaw.ar(freq!4,mul:0.5).lag(lag).clip(-1,0.2)});
	sig=Limiter.ar(sig,0.1);
	sig=FreeVerb.ar(sig,room:1.5,damp:SinOsc.kr(f2),add:sig);

	sig=DelayN.ar(sig,0.4,delaytime:0.2);
	Out.ar(0, sig*amp*env);
}).add;


SynthDef(\woosh, {
	arg gate=1, sustain=0.2, freq=3000, amp=1,f2;
	var sig, env,fenv;


	env=EnvGen.kr(Env.adsr(sustain*0.1,sustain*0.1,0.5,sustain*0.8),gate);
	fenv=EnvGen.kr(Env([freq*2,freq], [sustain],\welch),gate);

	sig=BPF.ar(WhiteNoise.ar(amp),fenv,0.5,mul:SinOsc.kr(f2).range(0.2,0.8));
	sig=HPF.ar(sig,16000).clip(-0.3,1);
	sig=FreeVerb.ar(sig,room:2,damp:0.1,add:sig);
	sig=Pan2.ar(sig*env,SinOsc.kr(f2));
	sig=FreeVerb.ar(sig,room:2);

	DetectSilence.ar(sig,0.01,doneAction:2);

	Out.ar(0,sig*amp);
}).add;


SynthDef(\tictum, {
	arg gate=1, sustain=0.2, freq=1000, amp=1;
	var sig, env,fenv;


	env=EnvGen.kr(Env.adsr(sustain*0.1,sustain*0.1,0.5,sustain*0.8),gate,doneAction:2);
	fenv=EnvGen.kr(Env([freq*10,freq], [sustain*0.8],\welch),gate);

	sig=BPF.ar(LFSaw.ar(20).lag(0.002),fenv,0.5,mul:SinOsc.kr(50).range(0.2,0.8));
	sig=HPF.ar(CombN.ar(sig,maxdelaytime:0.1,delaytime:0.1,decaytime:sustain*0.5),800);
	sig=FreeVerb.ar(sig,room:2,damp:0.8,add:sig);
	sig=Pan2.ar(sig,SinOsc.kr(0.5));


	Out.ar(0,sig*amp);
}).add;


SynthDef(\dfm, {
	arg gate=1, sustain=2, freq=100, amp=1, lag=0.0002,res;
	var sig, env;

	env=EnvGen.kr(Env.adsr(sustain*0.3,sustain*0.1,0.7,sustain*0.6),gate,doneAction:2);
	sig=LFSaw.ar([freq, freq+2, freq+4], [0,pi,2*pi]);
	sig=Fold.ar(sig,0,0.6).lag(lag);
	sig=DFM1.ar(sig,SinOsc.kr(0.25).range(freq,freq+10),res:res,
		noiselevel:SinOsc.kr(0.125).range(0.0041,0.00008))-0.5;
	sig=sig*env*amp;

	Out.ar(0, sig);

}).add;

SynthDef(\ting, {
	arg gate=1, sustain=0.1, freq=18000, amp=1,pan;
	var sig, env;

	env=EnvGen.kr(Env.adsr(sustain*0.2,sustain*0.2,0.5,sustain*0.6),gate);
	sig=SinOsc.ar(freq)*env;
	sig=Pan2.ar(sig,pos:pan);
	DetectSilence.ar(sig*amp,amp:0.01,doneAction:2);
	Out.ar(0,sig);
}).add;

SynthDef(\zum, {
	arg gate=1, sustain=1, freq=300, amp=1, lag=0.2;
	var sig, env;

	env=EnvGen.kr(Env.adsr(sustain*0.05,sustain*0.1,0.5,sustain*0.85),gate,doneAction:2);

	sig=LFSaw.ar([freq,freq+10,freq.lag(lag+0.02),freq.lag(0.2),freq+5]).lag(lag);
	sig=CombN.ar(sig,0.5,0.5,sustain);
	sig=sig*env*amp;
	// sig=FreeVerb.ar(sig,room:2);

	// DetectSilence.ar(sig,doneAction:2);

	Out.ar(0,sig);
}).add;



SynthDef(\piano1, { |out=0, freq=440, gate=1,sustain=1, amp=1|
	var sig = MdaPiano.ar(freq, gate,decay:sustain*0.5,release:sustain*0.4, release: 0.9, stereo: 0.3, sustain: 0);
	DetectSilence.ar(sig, 0.01, doneAction:2);
	Out.ar(out, sig * 0.1);
}).add;


)









