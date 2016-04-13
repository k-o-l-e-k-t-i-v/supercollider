(

(
Ndef(\melody).fadeTime = 8.0;
Ndef(\melody).quant = 2.0;
Ndef(\melody,{
	var mod,mod2,base,shift;

	mod2 = Select.kr(Stepper.kr(Impulse.kr(1/4/[1,2,4,8]),max:4),[1,2,4,8,16]);
	mod = Select.kr(Stepper.kr(Impulse.kr([1,2,4,8]),max:7),([1,2,4,8,4,2,1,16] + mod2) / pi) ;

	base = (48-12).midicps.squared / mod;
	shift = base / (LFNoise0.ar(8!8).range(1,4).round(2).squared);
	shift = shift;
	Splay.ar(
		FreeVerb.ar(
			BPF.ar(
				CombN.ar(
					SinOsc.ar(shift + SinOsc.ar([4,5,6,7] + {ExpRand()}!4,mul:2),0,0.233)
					,1,[1,2,4,8],8)
				,SinOsc.ar(1/4/[1,2,4,8]).range(44,16000))
			,0.133,10)
		,1,1)}).play;
);

)