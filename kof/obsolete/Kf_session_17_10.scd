

(
Ndef(\r).fadeTime = 0.1;
Ndef(\r).quant = 2.0;

Ndef(\r,{
	var s;
	Splay.ar(
	s = Select.kr(Stepper.kr(Impulse.kr(1/4)),[2,1.5,1/2,1/4,2,1.5,1,1,1]);
	FreeVerb.ar(
		LPF.ar(
			(LFSaw.ar([77,77.01]/s,SinOsc.ar(0.11).range(-pi,pi),mul:0.3) * LFPulse.ar(4/[1,2,4,8],mul:[1,1,1/2,1/4])) +

			OnePole.ar(WhiteNoise.ar(0.05!4) * LFPulse.ar(4/[1,2]),SinOsc.ar(8/[2,4,8,16]).range(-0.9,0.9))
			,LFSaw.ar(1.01/8/[1,2,4,8]).exprange(44.1,22000))
		,0.13633,1)
)}).play;

)

Ndef(\r).stop(1)

s.freeAll;


(
Ndef(\z).quant = 2.0;
Ndef(\z).fadeTime = 1.0;
Ndef(\z,{Splay.ar(

	FreeVerb.ar(
		AllpassC.ar(
			LPF.ar(
				OnePole.ar(
					LFSaw.ar([1,2,4,8],mul:0.5) * LFSaw.ar([55,55.1,55.2,55.3]),SinOsc.ar(0.1).range(-0.9,0.9)
				)
				,SinOsc.kr(0.01).range(110,1760))
			,0.133,0.133,1)
		,0.133,1)
)}).play;
)

Ndef(\z).stop(1)

(
Ndef(\d,{Splay.ar(

			AudioIn.ar([0,1],1)

)}).play;
)

(
Ndef(\neu).quant = 2.0;
Ndef(\neu,{

	var s;
	s = Select.kr(Stepper.kr(Impulse.kr(1/16)),[1,1.5,1.25,1.125,1,1,1,1]);
	Splay.ar(
		AllpassC.ar(
			LPF.ar(
				OnePole.ar(VarSaw.ar(67.midicps/[1,2,4,8,1/2]*s,SinOsc.kr(0.01).range(-8pi,8pi),SinOsc.kr(0.1).range(0.01,0.99),mul:0.1) * LFPulse.ar(4/[1,2]),SinOsc.kr([0.1,0.11]).range(-0.5,0.5))
				,880)
			,0.033,0.033,4)
	)
}).play;
)

Ndef(\neu).stop(1)

Ndef(\t,Splay.ar(


))

Ndef(\neu).stop(1);

Ndef(\r).stop(2);