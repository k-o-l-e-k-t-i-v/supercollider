
/////////
(
Ndef(\y).fadeTime = 5.0;
Ndef(\y).quant = 2.0;

Ndef(\y,{Splay.ar(
	~f1 = Decay.ar(Impulse.ar(8/[1,2,3,5,8]),{ExpRand()*1}!5);
	~f2 = Decay.ar(Impulse.ar(1/2/[1,2,3,5,8]),{ExpRand()/4.0}!5);
	AllpassC.ar(
	LPF.ar(
	Vibrato.ar(
				LFSaw.ar(~f2.range(432/8,43200/2)+SinOsc.ar((1..5)),mul:1.5) * ~f1;
		,[4,5,6,7],0.2)
		,432/8+~f2.range(0,4320/2))
		,(1..10)/10.0,(1..10)/1000.0,1,0.5)

)}).play;
)

///////

(
Ndef(\x).fadeTime = 5.0;
Ndef(\x).quant = 2.0;

Ndef(\x,{Splay.ar(
	~f1 = Decay.ar(Impulse.ar(8/[1,2,3,5,8]),{ExpRand()/2.0}!5);
	~f2 = Decay.ar(Impulse.ar(4/[1,2,3,5,8]),{ExpRand()/2.0}!5);
	AllpassC.ar(
	LPF.ar(
	Vibrato.ar(
				WhiteNoise.ar(0.33!5) * ~f1;
		,[4,5,6,7],0.2)
		,432/8+~f2.range(4320*4,0))
		,(1..10)/10.0,(1..10)/1000.0,4,0.5)

)}).play;
)


/////////

(
Ndef(\z).fadeTime = 5.0;
Ndef(\z).quant = 2.0;

Ndef(\z,{Splay.ar(
	~f1 = Decay.ar(Impulse.ar(8/[1,2,3,5,8]),0.5);
	~f2 = Decay.ar(Impulse.ar(1/2/[1,2,3,5,8]),1);
	AllpassC.ar(
	LPF.ar(
	Vibrato.ar(
		SinOsc.ar([432,432.01*1.5,432/2,432/2*3]/8.0+LFNoise1.ar((1..16)).range(-1,1).lag((1..16))-~f2.range(0,-432/4),0,0.75).lag(~f2/1000.0) * ~f1;
		,[4,5,6,7],0.2)
		,432/8+~f2.range(4320*2,0))
		,(1..10)/100.0,(1..10)/1000.0,1,0.5)

)}).play;
)

/////////


(
Ndef(\a).fadeTime = 15.0;
Ndef(\a,{Splay.ar(
	~f=  Select.kr(Stepper.kr(Impulse.kr(1/16/[1,2,3,5,8,13,21,34,55])),[1,2,1.5,1.25,1,1.125,0.5,0.25,0.125] / 0.5pi);
	Vibrato.ar(

			LFSaw.ar(1/16/[1,2,3,5,8,13,21,34,55]).squared * LFSaw.ar([432,432.01,432/1.5,432/2,432/4,432/8] / ~f +({ExpRand()/3.0}!16)+LFNoise1.ar((1..16)).range(-5,5).lag(4),SinOsc.ar((1..16)/640).range(-pi,pi),0.133)
		,(1..16),0.2)

	)}).play;
)


/////////

(
Ndef(\b).fadeTime = 15.0;
Ndef(\b,{Splay.ar(
	~f=  Select.kr(Stepper.kr(Impulse.kr(1/16/[1,2,3,5,8,13,21,34,55])),[1,2,1.5,1.25,1,1.125,0.5,0.25,0.125]/1.5pi);
	Vibrato.ar(

			LFSaw.ar(1/16/[1,2,3,5,8,13,21,34,55]).squared * SinOsc.ar([432,432.01,432/1.5,432/2,432/4,432/8] / ~f +({ExpRand()/3.0}!16)+LFNoise1.ar((1..16)).range(-5,5).lag(4),SinOsc.ar((1..16)/640).range(-pi,pi),0.133)
		,(1..16),0.2)

	)}).play;
)


/////////

(
Ndef(\c).fadeTime = 15.0;
Ndef(\c,{Splay.ar(
	~f=  Select.kr(Stepper.kr(Impulse.kr(1/16/[1,2,3,5,8,13,21,34,55])),[1,2,1.5,1.25,1,1.125,0.5,0.25,0.125]/0.25pi);
	Vibrato.ar(

			LFSaw.ar(1/16/[1,2,3,5,8,13,21,34,55]).squared * SinOsc.ar([432,432.01,432/1.5,432/2,432/4,432/8] / ~f +({ExpRand()/3.0}!16)+LFNoise1.ar((1..16)).range(-5,5).lag(4),SinOsc.ar((1..16)/640).range(-pi,pi),0.133)
		,(1..16),0.2)

	)}).play;
)


/////////



/////////

Ndef(\z).stop(60);
Ndef(\c).clear;
