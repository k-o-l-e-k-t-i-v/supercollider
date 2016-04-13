


(
Tdef(\t,{
	loop{
		(
			Ndef(\a).quant = 1;
			Ndef(\a).fadeTime = 2.0;
			Ndef(\a,{
				var d1,d2;
				d1 = Decay.ar(Impulse.ar([1,1/8,1/2,1/16]*8,[0,0.25,0.5,0.75]),{ExpRand()*2}!4);

				d2 = Decay.ar(Impulse.ar([1,2,1/2,4].scramble*1,[0,0.1125,0.25,0.75]),{ExpRand()/2}!4);

				Splay.ar(
					FreeVerb.ar(
						Vibrato.ar(
							LPF.ar(
								(SinOsc.ar([77,7777*LFNoise0.ar(1/4),88,777*LFNoise0.ar(1/4)]*d1.cubed) * d1)
								,7777) +
							RHPF.ar(
								(WhiteNoise.ar({ExpRand()*2}!4) * d2)
								,22000*{ExpRand()}!4)
							,[4,5,6,7],0.2)
						,0.33,[1,2,4,8])
			)});


			(
				var num,speed,sharpness,slope;
				num = 3.rrand(24);
				speed = rrand(1/4,16)/[12,18,22,99,0.1].scramble;
				sharpness = 0.1.rrand(0.5);
				slope = 48;

				Ndef(\filtr).quant = 1;
				Ndef(\filtr).fadeTime = 2.0;
				Ndef(\filtr,{
					Splay.ar(
						BPF.ar(
							Ndef(\a).ar
							,(1..num-1)*(22000/num-1),sharpness,SinOsc.ar({ExpRand()*speed}!16).exprange(0.001,slope)
						)
						,0.17,1)}).play;
			);
		);
		8.wait;
	}

}).play;
)






