

(
Ndef(\pulsar).quant = 2.0;
Ndef(\pulsar).fadeTime = 2.0;
Ndef(\pulsar,{
	var z,s1;
	z = SinOsc.ar((1..100)*0.013,LFTri.ar([45,45]),0.75);
	s1 = Select.kr(Stepper.kr(Impulse.kr(1/[4,2])),[1,2,4,2,1.5,2].scramble).lag({ExpRand()/16}!4);

	s = Select.kr(Stepper.kr(Impulse.kr(8/[4,2,1])),[1,2,1,2,1,2,1,1.5]).lag({ExpRand()/4}!4);
	z = z + SinOsc.ar(SinOsc.ar({ExpRand()*100}!12).range(-4,4) + 4320*[1,2,4,8]/(s*[8pi,4pi,1.5pi])/s1*pi,mul:0.1);


	Splay.ar(

		Compander.ar(
		z,z,0.5,1,0.01
		) * LFPulse.ar(1/[1,2,4,8])
	).clip(-1,1)
}).play;

)