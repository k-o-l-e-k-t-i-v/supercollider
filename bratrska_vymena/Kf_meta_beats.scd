s.scope;

(
Tdef(\worker,{
	loop{


		Ndef(\meta).fadeTime = 0.1;
		Ndef(\meta,{
			~base1 = [432,432.1]/2;
			~base2 = [432,432.1]*2;

			~notes1 = [1,2,0.5,1,1.5].at(0.rrand(4)) * ~base1 / ([1,2,4,8].at(0.rrand(3)));
			~notes2 = [1.5,1.25,1.125,1,1.5].at(0.rrand(4)) * ~base2 / ([1,2,4,8].at(0.rrand(3)) * pi);

			~f1 = (~notes1);
			~f2 = (~notes2);


			Splay.ar(
				SinOsc.ar(~f1 + SinOsc.ar({ExpRand()/10.0}!12,{ExpRand()}!12).range(-4,4),mul:0.5) *
				SinOsc.ar(~f2 + SinOsc.ar({ExpRand()/10.0}!12,{ExpRand()}!12).range(-4,4),mul:0.5)

		)});

		Ndef(\hissa,{
			Splay.ar(
				BPF.ar(WhiteNoise.ar(0.1!2),{ExpRand()*22000}!4) * LFSaw.ar([1,2,4,8,16].at(0.rrand(4))/[1,2,3,5]).squared;
			)
		});


		2.wait;
	};
}).play;

// postproduction
Ndef(\cycler,{

	~signal = CombN.ar(
		Vibrato.ar(
			Ndef(\meta).ar
			,[4,5,6,7],0.2)
		,8,0.432/2,8) *
	Decay.ar(Impulse.ar(4/[1,2]),1) + Ndef(\hissa).ar;


	Splay.ar(
		GVerb.ar(~signal,mul:0.33,add:~signal)
		,0.5,0.25)
}).play;

)