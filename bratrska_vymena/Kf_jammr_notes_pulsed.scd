// Ja_WOW

(
Tdef(\automata,{
	loop{
		(
			Ndef(\2).quant = 2.0;
			Ndef(\2).fadeTime = 2.0;

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
					// FreeVerb.ar(
					// CombN.ar(
					// RLPF.ar(
								~signal * Decay.ar(Impulse.ar(8/[1,2,3,5,8]),{ExpRand()*1.5}!8)
					// ,440,SinOsc.ar((1..8)/100.0,{ExpRand()*2pi}!8).range(0.001,0.5))
					// ,1,{ExpRand()/100.0}!32+0.133,0.5) + RHPF.ar(~signal,440,SinOsc.ar((1..8)/100.0).range(0.001,0.5)) * Decay.ar(Impulse.ar(8/[1,2,3,5,8]),{ExpRand()*1.5}!8)
					// ,0.133,2).softclip
					,0.5,0.7)

			}).play;

		);
		16.wait;
	}
}).play;
)

// ^^ very unpredictable, too heavy to compute..

Ndef(\2).stop(20)

s.scope