
(
Ndef(\rythm).fadeTime = 4;
Ndef(\rythm).quant = 2;

Ndef(\rythm).mold(16);
Ndef(\rythm,{
	LFSaw.ar(1/4/(1..4),0.01*(1.9**(1..16))).squared * Decay.ar(Impulse.ar(4/[1,2,4,8]),(8/fib(16))) + LPF.ar(WhiteNoise.ar(0.025!16),440)
});
)


~pos1 = {( SinOsc.ar(432e-3/fib(23) ).range(1,2).round(1/2) ** (1..23))};


(
Tdef(\tt,{

	loop{
		(
			Ndef(\magick).quant = 2.0;
			Ndef(\magick).fadeTime = 8.0;
			Ndef(\magick,{
				Splay.ar(
					CompanderD.ar(
						AllpassN.ar(
							LFTri.ar(1/4/[4,5,6,7],mul:0.5) + SinOsc.ar(0.432 / [1,2,0.5].choose * {[1,8,1.5,2,4,1/4,1/8].choose}!4 * ~pos1,mul:2/fib(12)) +
							WhiteNoise.ar(0.015!32) * Ndef(\rythm).ar
							,1,1/(1.01**(1..16)),32/(1.0012**(1..16)),mul:2/fib(12))
						,0.5,1,0.5).softclip
					,0.33,1)}).play;
		);
		8.wait;
	}

}).play;
)