// Ja_WOW

// I can't play this - the server keeps crashing :(

(
Tdef(\automata,{
	loop{
		(
			Ndef(\2).quant = 2.0;
			Ndef(\2).fadeTime = 16.0;

			Ndef(\2,{


				~mod2 = Select.kr(Stepper.kr(Impulse.kr(1/16/[1,2,4,8]),max:6),[1,2,1,4,1,4,8].scramble * 4).lag(0.4);
				~mod = Select.kr(Stepper.kr(Impulse.kr(1/8/[1,2,4,8]),max:6),[1,2,1,1.5,0.5,4,8].scramble);
				~n = Select.kr(Stepper.kr(Impulse.kr(1/4/[1,2,4,8]),max:4),[1,12,1,2,4].scramble).lag(0.008);
				~f = (~n).midicps * (32pi * [1,1.5] / 256 * 16 / ~mod2 * ~mod) ;


				~signal = CombN.ar(
					LFSaw.ar([22000,22000.1]/([1,2,4,8]*(~f*2)) + {ExpRand()}!8,{ExpRand()*8pi},mul:0.5) +
					SinOsc.ar([2200,2200.1]/([1,2,4,8]*~f),mul:0.5)
					,0.5*16pi/(~f),16pi/(~f),8).clip(-1,1) ;

				~signal = RLPF.ar(CompanderD.ar(~signal,0.5,1,0.5,[0.001,0.01,0.1],[0.001,0.01,0.1]),[55,110,220,440,880,8800]);

				Splay.ar(
					FreeVerb.ar(
						RLPF.ar(
							~signal * Decay.ar(Impulse.ar(8/[1,2,3,5,8]),{ExpRand()*1.5}!8)
							,55*(1..12),SinOsc.ar((1..12)/1000.0,{ExpRand()*2pi}!8).range(0.001,0.5))
						,0.133,20).softclip
					,0.5,0.5)

			}).play;

		);
		16.wait;
	}
}).play;
)

Ndef(\2).stop(20)

s.scope