//reading bytebeat files tested unix only


s.boot;

(

~path = "/tmp/last.dat";

f = File(~path, "rb") ;
t = [] ; a = f.getInt8 ; while {a.notNil}{t = t.add(a); a = f.getInt8} ;
b = Buffer.loadCollection(s, t, 1, {f.close}) ;

Ndef(\a).fadeTime = 2.0;
Ndef(\a).quant = 2.0;

Ndef(\a,{Splay.ar(
	~pattern = [1,1,2,3,5,11,21];
	~long = Select.kr(Stepper.kr(Impulse.kr(1/8/~pattern)),[1,1,2,0.5,1,4,1,2,4,8]);
	~s = Select.kr(Stepper.kr(Impulse.kr(1/~pattern)),[1,1,2,0.5,1.5,4,1,2,4,8]/~long);

	FreeVerb.ar(
		BPF.ar(
			PlayBuf.ar(1, b,loop:-1,rate:~s).softclip * Decay.ar(Impulse.ar(8/[1,1,2,3,5,11,21]),0.25)
			,SinOsc.kr((_*0.1!4)+0.1).range(44,16000))
		,0.05133,0.1) + ((SinOsc.ar([66,77,88,99],mul:0.5) * Decay.ar(Impulse.ar(4/[1,1,2,3,5,11,21]),0.5)))
)}).play;
)
