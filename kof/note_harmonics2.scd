
(
Ndef(\harm).quant = 2.0;
Ndef(\harm).fadeTime = 4.0;

Ndef(\harm,{
	~mod = Select.kr(Stepper.kr(Impulse.kr(2/[1,2,4,8,16]),max:5),[1,2,4,1/2,8,1/4]).lag(0.0002);
	~set = [50,55,68];
	~n =  ~set.scramble.midicps/~mod;
	Splay.ar(
	AllpassC.ar(
			Pluck.ar(LFCub.ar((LFNoise0.kr(4.8!4).range(-10,10).lag(1) + ~set.midicps)/24),Impulse.ar([1,2,4]),mul:0.31) +
			Pluck.ar(SinOsc.ar(LFNoise0.kr(4.8!4).range(-10,10).lag(1) + ~n) * SinOsc.ar(~n),Impulse.ar(16/[1,2,4,8].scramble),mul:0.4,decaytime:1.25,delaytime:0.25),decaytime:1.25,delaytime:0.25,mul:SinOsc.kr((_*0.01!8)+0.01).range(0.3,0.7))
)}).play;
)