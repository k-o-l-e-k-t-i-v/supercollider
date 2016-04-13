
// hlasi mi to tunu chybovych hlasek, napr:
// exception in GrafDef_Load: exceeded number of interconnect buffers.
// FAILURE IN SERVER /s_new SynthDef not found
// FAILURE IN SERVER /n_set Node 1064 not found
// Nerozumim?

(


Tdef(\master,{
	loop{
		(
			(
				Ndef(\enveloper).quant = 1.0;
				Ndef(\enveloper).fadeTime = 4.0;

				Ndef(\enveloper,{
					Splay.ar(
						// GVerb.ar(
							Ndef(\filtr).ar  //* //Decay.ar(Impulse.ar(8/[1,2,4,8]),{ExpRand()}!10)
						// ,20,5,add:Ndef(\gen).ar/32).softclip
						,0.5,0.5)
				}).play;
			);

			2.wait;


			//////////////////////////////// VV

			(
				Ndef(\gen).quant = 1.0;

				Ndef(\gen).fadeTime = 4.0;
				Ndef(\gen,{|f=48|
					f = rrand(1,8).round(2).squared;
					Splay.ar(
						(PinkNoise.ar(0.4!8) * Decay.ar(Impulse.ar(4/[1,2,4,8]),{ExpRand()}!10)) +
						SinOsc.ar(4320/[0.5,0.25,1,2,4,8,16,64] / (f * pi)+SinOsc.ar({ExpRand()/100}!10).range(4)).softclip
				)});
			);


			2.wait;

			Ndef(\gen).lag(\f,1);
			Ndef(\gen).set(\f,rrand(1,8).round(2).squared);

			// Ndef(\gen).set(\f,48)
			// Ndef(\gen).set(\f,8)
			// Ndef(\gen).set(\f,4)



			//////////////////////////////// VV

			(
				var num,speed,sharpness;
				num = 3.rrand(48);
				speed = 1.rrand(44)/[1,2,8,120,12,18,22,99,0.1];
				sharpness = 0.015.rrand(1);



				Ndef(\filtr).quant = 1.0;
				Ndef(\filtr).fadeTime = 4.0;
				Ndef(\filtr,{
					Splay.ar(
						BPF.ar(
							Ndef(\gen).ar + LFSaw.ar((1..10)/100.1,mul:0.133)
							,(1..num)*(22000/num)+SinOsc.ar({ExpRand()}!48).range(-40,40),sharpness,SinOsc.ar({ExpRand()*speed}!48).exprange(0.001,8.1)
						).softclip
						,0.17,1)});
			);
		);
		2.wait;
	}

}).play;

)