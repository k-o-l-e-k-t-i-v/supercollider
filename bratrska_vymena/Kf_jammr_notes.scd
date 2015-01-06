// Ja_WOW

(
Ndef(\2).quant = 2.0;
Ndef(\2).fadeTime = 4.02;

Ndef(\2,{

	~mod = Select.kr(Stepper.kr(Impulse.kr(1/16/[1,2,4,8]),max:4),[1,2,1,1.5,0.5,4,8].scramble);
	~n = Select.kr(Stepper.kr(Impulse.kr(1/4/[1,2,4,8]),max:4),[1,12,1,2,4].scramble).lag(0.02);
	~f = (~n).midicps * (32pi * [1,1.5] / 256 * 16 / 2 * ~mod) ;


	Splay.ar(
		CombN.ar(
			LFSaw.ar([22000,22000.1]*1.5/([1,2,4,8]*(~f+~f)) + {ExpRand()}!8,{ExpRand()*8pi},mul:0.125) +
			SinOsc.ar([2200,2200.1]/([1,2,4,8]*~f),mul:0.125)
			,0.5*16pi/(~f),16pi/(~f),8).clip(-1,1)
		,0.5,0.75)

}).play;

)

Ndef(\2).stop(20)

s.scope