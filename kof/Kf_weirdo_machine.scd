
// weird melodies

(

Tdef(\tt,
	{
		Ndef(\a).quant = 2.0;
		Ndef(\a).fadeTime = 2.0;

		loop{
			Ndef(\a,{

				~p = [4,8]/[1,2,3,5,8,13,21];

				~mod = Select.kr(Stepper.kr(Impulse.kr(~p/4)),[1,1.5,1.25,2,1.5,4,1,8]);

				Splay.ar(
					CompanderD.ar(
						CombN.ar(
							BBandPass.ar(

								8 * SinOsc.ar({ExpRand()/2}!8 + [440,880,880,880*2,880*4,880*8,880*16] / (~mod*pi),{ExpRand()*3pi}!8) *
								Decay.ar(Impulse.ar(~p),{ExpRand()*2}!8)

								,LFDNoise1.ar(~p/2).range(35,1600.rrand(3200)),0.3.rrand(0.7))
							,1,1,10)
						,0.75,1,0.25)
					,1,0.75).clip(-1,1)}).play;

			32.wait;
		}
}).play;

)