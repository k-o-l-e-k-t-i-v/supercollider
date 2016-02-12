

StageLimiter.activate;

(
Ndef(\a).quant = 2.0;
Ndef(\a).fadeTime = 8.0;
Ndef(\a,{
	var f;
	f = ((fib(14)).normalize*(48+[0,12,24,36,48]).midicps / 1.5pi) + SinOsc.ar(1/4/fib(5)).squared.range(-4,4);

	Splay.ar(
		AllpassN.ar(
			Vibrato.ar(
				SinOsc.ar(f,SinOsc.ar(f/8pi).range(0,2pi),mul:0.7) * LFSaw.ar(8/fib(14)).squared;
				,[4,5,6,7],0.16)
			,0.133,{ExpRand(0.01,0.13)}!32,4)
		,0.2,1)});
)


(
Ndef(\b).fadeTime = 8.0;
Ndef(\b).quant = 2.0;

Ndef(\b,{
	var step,step2,src,l,m,h;
	step2 = Select.kr(Stepper.kr(Impulse.kr(1/8/fib(12))),[0,0,12,24,36,12,24,36].scramble);

	step = Select.kr(Stepper.kr(Impulse.kr(1/4/fib(12))),[1,2,1.25,1.5,1,2,4,1,2]);
	src = Ndef(\a).ar + SinOsc.ar((48+step2).midicps*step/fib(24),mul:1);

	l = CompanderD.ar(RLPF.ar(src,432/fib(4)),0.5,1,0.5,0.2,0.2) * LFSaw.ar(1/fib(12)).squared;
	m = CompanderD.ar(BPF.ar(src,432/fib(3)),0.5,1,0.5,0.02,0.02) * LFSaw.ar(1/2/fib(12)).squared;
	h = CompanderD.ar(HPF.ar(src,432/fib(6)),0.5,1,0.5,0.01,0.01) * LFSaw.ar(1/4/fib(12)).squared;

	Splay.ar(
		CompanderD.ar(
			FreeVerb.ar(
				l + m
				,0.17,10) + h
			,0.75,1,0.5,0.01,0.01)
		,0.2,1)
}).play;
)

s.scope