(

(
Ndef(\melody,{


	~mod2 = Select.kr(Stepper.kr(Impulse.kr(1/[1,2,4,8]),max:3),[1,2,4,8]);
	~mod = Select.kr(Stepper.kr(Impulse.kr([1,2,4,8]),max:3),[1,2,4,8] + ~mod2) ;

	~base = (48).midicps.squared / ~mod;
	~shift = ~base / (LFNoise0.ar(8!8).range(1,3).round(2).squared);
	~shift = ~shift;
	Splay.ar(
		FreeVerb.ar(
			LPF.ar(
				SinOsc.ar(~shift + SinOsc.ar([4,5,6,7] + {ExpRand()}!4,mul:2),0,0.133)
			,800)
		,0.133,10)
)}).play;
);

)