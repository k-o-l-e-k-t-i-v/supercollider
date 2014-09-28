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
	~s = Select.kr(Stepper.kr(Impulse.kr(1/2/~pattern)),[1,1,2,0.5,1.5,4,1,2,4,8]/~long);

	FreeVerb.ar(
		RLPF.ar(
			PlayBuf.ar(1, b,loop:-1,rate:~s) * Decay.ar(Impulse.ar(4/[1,1,2,3,5,11,21]),0.1)
			,SinOsc.kr(1/16/[1,1,2,3,5,11,21]).range(44,22000))
		,0.133,1)
)}).play;
)
