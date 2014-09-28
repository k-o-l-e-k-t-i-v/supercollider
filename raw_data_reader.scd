s.boot;

(
f = File("/tmp/last.dat", "rb") ;
t = [] ; a = f.getInt8 ; while {a.notNil}{t = t.add(a); a = f.getInt8} ;
b = Buffer.loadCollection(s, t, 1, {f.close }) ;

Ndef(\a).fadeTime = 2.0;
Ndef(\a).quant = 2.0;

Ndef(\a,{Splay.ar(
	~s = Select.kr(Stepper.kr(Impulse.kr(1/4/[1,2,4,8,16,32])),[1,1,2,0.5,1.5,4,1,2,4,8]/2);
	FreeVerb.ar(
	RLPF.ar(
	PlayBuf.ar(1, b,loop:-1,rate:~s) * Decay.ar(Impulse.ar(8/[1,1,2,3,5,11,21]),0.1)
		,SinOsc.kr(1/[1,2,4,8]).range(44,11000))
	,0.133,1)
)}).play;
)
