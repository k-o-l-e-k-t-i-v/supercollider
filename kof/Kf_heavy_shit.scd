

(

Ndef(\arw).fadeTime = 5.0;
Ndef(\arw).quant = 2.0;
Ndef(\arw,{
	var f,lfo,sig,a,b,fade,f1,f2;
	f = ([[44,44.44]*1pi,[45,45.44]]*1.5pi) / 1.5pi;
	lfo = LFSaw.ar(1/8/[1,2,4,8,16]).squared;

	sig = LFSaw.ar(f+LFNoise0.kr((_*1!8)).range(-8,8).lag(2),mul:0.25).lag(SinOsc.kr([0.01,0.02]).range(0.00001,0.01)) + WhiteNoise.ar(0.005!2);

	a = RLPF.ar(sig,44*1.5pi,add:sig);
	b = RHPF.ar(sig,44*pi,add:sig) ;

	fade = XFade2.ar(b,a,lfo) * lfo;
	f1 =
		AllpassC.ar(fade,0.0002,SinOsc.kr([0.1,0.11]).range(0.01,0.2),2,add:fade)+ (SinOsc.kr(f)*LFSaw.ar(4/[1,2],mul:0.1)) + (Ringz.ar(Impulse.ar(1/4/[1,2,4,8,16,32]),f*[8,4,2,1.5,16*1.25,32*1.5]+LFNoise0.kr((_*1!8)).range(-8,8).lag(2),4,0.1));
	f2 = FreeVerb.ar(f1,SinOsc.kr(0.01345).range(0.001,0.9),SinOsc.kr(0.01134).range(0.2,1.7),0.5,1,f1);
	Splay.ar(
		f2
)}).play;
)

Ndef(\arw).stop(60)