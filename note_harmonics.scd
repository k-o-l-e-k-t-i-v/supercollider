

s.reboot;

(
Ndef(\a).fadeTime = 2.0;
Ndef(\a).quant = 2.0;

Ndef(\a,{
	~scale1 = [38,48,72,55,48,57,70,67,67,74,70,72,65,70,67];
	~scale2 = [63,65,57,72,70,67,75,74,89,60,55,48,70,70,63];

	~mul1 = Select.kr(Stepper.kr(Impulse.kr(8/[1,2,4,8]),max:6),[1,1,0.5,1,0.5,1,0.5].scramble).lag((_*0.0011!16));
	~mul2 = Select.kr(Stepper.kr(Impulse.kr(2/[1,2,4,8]),max:1),[1,0.5,2,0.5,0.5,1,2]).lag((_*0.001!16));
	~mul3 = Select.kr(Stepper.kr(Impulse.kr(4/[1,2,4,8]),max:3),[1,0.5,2,1,0.5,1,1]).lag((_*0.001!16));

	~note1 = Select.kr(Stepper.kr(Impulse.kr(1/[1,2,4,8,16,32].scramble),max:~scale1.size),~scale1.scramble.midicps * (~mul1 * ~mul2)).lag((_*0.001!16));
	~note2 = Select.kr(Stepper.kr(Impulse.kr(1/2/[1,2,4,8,16,32].scramble),max:~scale2.size),~scale2.scramble.midicps * (~mul1 * ~mul3)).lag((_*0.001!16));

	Splay.ar(
		Limiter.ar(
			(0.5 * Pluck.ar(SinOsc.ar((_*0.1!16)+~note1,{ExpRand()*10.0}!16), Impulse.ar(2*[1,2,4,8]),decaytime:0.8, delaytime:0.3 )) +
			(0.25 * Pluck.ar(LFCub.ar((_*0.1!16)+(~note2*~mul1),{ExpRand()*10.0}!16), Impulse.ar([1,2,4,8]),decaytime:2, delaytime:0.31 )) +
			(0.15 * Pluck.ar(VarSaw.ar((_*0.1!16)+(~note1*~mul1*~mul2*~mul3),{ExpRand()*10.0}!16), Impulse.ar([1,2,4,8]),decaytime:2, delaytime:0.32 ))
		)
)}).play;
)

Ndef(\a).stop(1);