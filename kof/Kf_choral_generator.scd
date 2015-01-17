



(
Tdef(\worker,{
	loop{
		~l = 2.rrand(4);
		Ndef(\a).fadeTime = ~l;
		Ndef(\a,{

			~a = [1,2,4,8,1.5,1.25,1.125].at(0.rrand(6));
			~b = [1,2,4,8,1.5,1.25,1.125].at(0.rrand(6));

			Splay.ar(
				Vibrato.ar(
					XFade2.ar(
						SinOsc.ar( 4320 / 1 / ([~a,~b]*0.5pi) + LFNoise1.ar({ExpRand()*16}!16).range(-8,8).lag(0.1),mul:0.25).lag(0.001),
						LFSaw.ar( 4320 / 2 / ([~a,~b]*2pi) + LFNoise1.ar({ExpRand()*16}!16).range(-8,8).lag(0.1),mul:0.25).lag(0.001),
						SinOsc.kr(1/~l/~l).range(-0.5,0.5)

					)
					,{ExpRand()*4}!4,0.15)
		)}).play;


		~l.wait;

		////////////////////

		~l = 1.rrand(4);

		Ndef(\b).fadeTime = ~l;
		Ndef(\b,{

			~c = [1,2,4,8,1.5,1.25,16].at(0.rrand(6));
			~d = [1,2,4,8,1.5,1.25,16].at(0.rrand(6));

			Splay.ar(

				Vibrato.ar(
					XFade2.ar(
						LFPar.ar( 4321 / 1 / ([~c,~d]*1.5pi) + LFNoise1.ar({ExpRand()*16}!16).range(-8,8).lag(0.1),mul:0.25).lag(0.0001),
						LFSaw.ar( 4322 / 2 / ([~c,~d]*1.0pi) + LFNoise1.ar({ExpRand()*16}!16).range(-8,8).lag(0.1),mul:0.25).lag(0.001),
						SinOsc.kr(1/~l/~l).range(-0.5,0.5)

					)

					,{ExpRand()*4}!4,0.15)
		)}).play;


		~l.wait;


		~l = 1.rrand(4);

		Ndef(\c).fadeTime = ~l;
		Ndef(\c,{

			~e = [1,2,4,8,1.5,1.25,4].at(0.rrand(6));
			~f = [1,2,4,8,1.5,1.25,4].at(0.rrand(6));

			Splay.ar(

				Vibrato.ar(
					XFade2.ar(
						LFPar.ar( 43.21 * 1.5 * ([~e,~f]) + LFNoise1.ar({ExpRand()*16}!16).range(-8,8).lag(0.1),mul:0.25).lag(0.0001),
						LFSaw.ar( 43.22 * ([~e,~f]) + LFNoise1.ar({ExpRand()*16}!16).range(-8,8).lag(0.1),mul:0.25).lag(0.001),
						SinOsc.kr(1/~l/~l).range(-0.5,0.5)

					)

					,{ExpRand()*4}!4,0.15)
		)}).play;


		~l.wait;
	}
}).play;
)


//jesus mary on a stick! <3