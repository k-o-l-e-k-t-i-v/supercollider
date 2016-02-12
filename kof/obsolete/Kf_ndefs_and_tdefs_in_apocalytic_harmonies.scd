
s.scope;

(
(
Tdef(\at,{
	loop{


		Ndef(\a).fadeTime = 1.0;
		Ndef(\a,{
			var fa;
			fa = [1,2,4,8].at(0.rrand(3)) * pi;

			Splay.ar(
				Vibrato.ar(
					SinOsc.ar([432,432.1] / (fa) + SinOsc.kr({ExpRand()*2}!4).range(-2,2)  ,mul:0.233) * LFSaw.ar(1/2/[1,2,4,8],{ExpRand()*pi}!4).squared
					,[5,6,7,8],0.2)

		)}).play;

		Ndef(\a)[1] = \filter -> {|in| GVerb.ar(in,{ExpRand()*100}.round(1)+3,mul:0.8,add:in)};

		4.wait;
	}
}).play(quant:2);
);

(
Tdef(\bt,{
	loop{

		Ndef(\b).fadeTime = 3.0;
		Ndef(\b,{

			var fb;
			fb = [1.5,1.25,1.125,3].at(0.rrand(3)) * pi;

			Splay.ar(
				Vibrato.ar(
					SinOsc.ar([432,432.1] / (fb) + SinOsc.kr({ExpRand()*2}!4).range(-2,2) ,mul:0.233) * LFSaw.ar(1/2/[1,2,4,8],{ExpRand()*pi}!4).squared
					,[4,5,6,7],0.1)

		)}).play;

		Ndef(\b)[1] = \filter -> {|in| GVerb.ar(in,{ExpRand()*100}.round(1)+3,mul:0.8,add:in)};

		8.wait;
	}
}).play(quant:2);
);
)

(
Tdef(\hisst,{

	loop{
		var tempo;
		tempo = ({ExpRand()*16}.round(2))+1;

		Ndef(\hissa).fadeTime = 0.5;
		Ndef(\hissa,{Splay.ar(

			HPF.ar(
				WhiteNoise.ar(1!4) * Decay.ar(Impulse.ar(tempo/[1,2,3,5,8]),1/tempo)
				,LFNoise0.ar(tempo!4).range(44,10000),0.5)
		)}).play;
		Ndef(\hissa)[1] = \filter -> {|in| GVerb.ar(in,{ExpRand()*100}.round(1)+3,mul:0.8,add:in)};

		0.5.wait;
	}

}).play;

)

