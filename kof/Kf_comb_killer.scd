(
Ndef(\a).fadeTime = 2.0;
Ndef(\a).quant = 2.0;
Ndef(\a,{


	~ss = Select.kr(Stepper.kr(Impulse.kr(1/4/[1,2,2,4,8,16,32,64])),[1,1,1.5,1.25,2,1.125,0.5,0.75,1,2,8]);
	~s = Select.kr(Stepper.kr(Impulse.kr(1/8/[1,2,2,4,8,16,32,64])),[1,1,2,4,8,1,2,4,8,1,0.5,1]);

	Splay.ar(
	AllpassC.ar(
			SinOsc.ar([22,22.01]*[2,1.5]*(~ss*pi)/(1+(1/~s))+{ExpRand()/100}!8,Ndef(\a).ar.lag(1e-8),mul:0.08).tanh * Pulse.ar(4/[1,2,2,4],mul:0.25)
			,8, {TExpRand.ar(0.001,0.2,Impulse.ar(1/[1,2,4,8,16,32,64])).lag(1/8)} ,8).clip(-1,1)
,0.5,1).softclip}).play;
)


// ^^ quite heavy computations, and it sounds bad )) ^^

s.scope