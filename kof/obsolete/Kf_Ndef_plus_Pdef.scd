s.boot;

//////////////////////

(
t = Tuning.harmonic;
Ndef(\bass).quant = 2.0;
Ndef(\bass).fadeTime = 2.0;

Ndef(\bass,{|f=1,v=1,d=1,dd=1,room=1,vol=1,fd = -1|
	var f;
	Splay.ar(
		f = t.cents.at([1,2,7,11]) / (pi * f);
		FreeVerb.ar(
			MoogFF.ar(
				XFade2.ar(
				LFSaw.ar(f),
					SinOsc.ar(f),
					fd.lag(dd*2))
				,SinOsc.ar(f/(v.lag(dd)*16+0.1)).range(f/(d),f*(d))
		) * Decay.ar(Impulse.ar((dd*4)/[1,2,4,8]),2/dd)
			,0.33,room.lag(dd)).softclip
	)
}).play;
)

//////// animate params /////////////

(
Ndef(\bass)[1] = \set -> Pbind(
	\dur, Pseq(  [1,1,1,1,2],inf),
	\amp, Pxrand([1,1/2,1,1/4*3]*0.9,inf),
	\f, Pseq(    [4,2,1,4,1,2,8,1.5,3,6],inf),
	\v, Pseq(    [1,1,4,8,16,32,1,1,1,2]*32,inf),
	\d, Pseq(    [1,1,1,2],inf),
	\dd, Pseq(   [1,1,1,1/2,1,2,1],inf),
	\room, Pseq( [1,1,1,2,4,1,1],inf),
	\fd, Pxrand([-1,1,0,0.5,-0.5],inf)
);
)