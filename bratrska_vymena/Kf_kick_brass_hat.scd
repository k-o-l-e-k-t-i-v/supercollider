s.scope;

/////////


(
Tdef(\tt,{
	loop{
		~mod = [1,2,1.5,1.25,1,1.125].at(0.rrand(5));

		Ndef(\brass).quant = 2.0;
		Ndef(\brass).fadeTime = 0.25;
		Ndef(\brass,{
			~f = [77,78] * [1,2,1.5,1.25,1,1.125].at(0.rrand(5));


			Splay.ar(
				Pluck.ar(SinOsc.ar([~f,~f*~mod]+({ExpRand()*3}!12)),Impulse.ar(4/[1,2]),0.02,0.0002*~f,4,mul:0.15)
		)}).play;


		Ndef(\hat).quant = 2.0;
		Ndef(\hat).fadeTime = 2.0;

		Ndef(\hat,{
			~r = 2.rrand(8).round(2)/[1,2,4,8];
			Splay.ar(
				CombN.ar(
					Vibrato.ar(BPF.ar(WhiteNoise.ar(1!2),LFNoise1.ar(1!4).range(2000,12000).round(1000).lag(0.1)),[5,6,7,8],0.1) * Decay.ar(Impulse.ar(~r),1/~r)
					,1,0.25+LFNoise1.ar(1!4).range(0.25,1).round(0.125),1)
				,1,0.5)}).play;


		~l = 4;
		Ndef(\a).quant = 0.5;
		Ndef(\a).fadeTime = ~l;
		Ndef(\a,{

			~a = [1,2,4,8,1.5,1.25,0.5].at(0.rrand(6));
			~b = [1,2,4,8,1.5,1.25,0.5].at(0.rrand(6));

			Splay.ar(
				Vibrato.ar(
					XFade2.ar(
						SinOsc.ar( 4320 / 1 / ([~a,~b]*~mod*pi) + LFNoise1.ar({ExpRand()*16}!16).range(-8,8).lag(0.1),mul:0.25).lag(0.001),
						LFSaw.ar( 4320 / 2 / ([~a,~b]*~mod*pi) + LFNoise1.ar({ExpRand()*16}!16).range(-8,8).lag(0.1),mul:0.25).lag(0.001),
						SinOsc.kr(1/~l/~l).range(-0.5,0.5)

					)
					,{ExpRand()*4}!4,0.15)
		)}).play;



		4.wait;
	}
}).play;

)

///////////


(
Ndef(\kick).quant = 2.0;
Ndef(\kick,{
	~tempo = 4;
	~fk = [7777,7777];
	~fb = [54.1,54];
	~df = Decay.ar(Impulse.ar(~tempo/[1,2]),0.0002+SinOsc.ar(1/16).range(0.00001,0.0002));
	~da = Decay.ar(Impulse.ar(~tempo/[1,2]),0.75);

	Splay.ar(
		SinOsc.ar([~fk,~fk]*~df+(~fb * ~da.linlin(0,1,0.35,1))) * ~da
)}).play;

)
