(

Tdef(\t1,{

	loop{


		Ndef(\1).fadeTime = 8.0;
		Ndef(\1,{
			var basenote,s,base,tone;

			basenote = 60-12;

			s = Select.kr(Stepper.kr(Impulse.kr(1/4)),[1,1.5,2,1.25,1,4,2,1,4].scramble / 8);

			base = Select.kr(Stepper.kr(Impulse.kr(8)),[1,2,4,1/2,1/4,1,1.5,2,1].scramble * basenote.midicps / s);


			tone =
			SinOsc.ar(base + 0.1 * 1pi / {(1..12).normalize.windex.round(2).squared}!8,mul:1/8).tanh +
			SinOsc.ar(base + 0.2 * 2pi / {(1..16).normalize.windex.round(2).squared}!8,mul:1/12).tanh +
			LFCub.ar(base + 0.3 * 4pi / {(1..24).normalize.windex.round(2).squared}!8,mul:1/24).tanh * 8.0;

			Splay.ar(
				FreeVerb.ar(
					AllpassC.ar(
						Vibrato.ar(
							CompanderD.ar(LPF.ar(tone * TExpRand.ar(1e-7,1,Impulse.ar(1/[1,2,4,8])).lag(1) ,440),0.5,1,0.5,0.2,0.2)  +
							CompanderD.ar(BPF.ar(tone * TExpRand.ar(1e-7,1,Impulse.ar(1/2/[1,2,4,8])).lag(1) ,880),0.5,1,0.5,0.15,0.15) +
							CompanderD.ar(HPF.ar(tone * TExpRand.ar(1e-7,1,Impulse.ar(1/4/[1,2,4,8])).lag(1) ,1660),0.5,1,0.5,0.01,0.01)
							,[4,5,6,7],0.2)
						,1,{ExpRand(0.001,0.2)}!32,2).softclip
					,0.33,2)
				,0.55,1)}).play;

		16.wait;
	}
}).play;
)

s.scope;
