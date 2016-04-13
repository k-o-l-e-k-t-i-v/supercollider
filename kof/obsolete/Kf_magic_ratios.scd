

(
Tdef(\aa,{

	Ndef(\a).fadeTime = 4.0;
	Ndef(\a).quant = 2.0;

	loop{
		Ndef(\a,{
			var base1,base2,r,s,len,mod;
			base1 = 432/8pi * (1.0 + {(1/1.rrand(8).round(2))}!3);
			base2 = 432/4pi * (1.0 + {(1/1.rrand(8).round(2))}!3);

			r = [1,9/8,6/5,4/3,3/2,8/5,7/4];
			s = []++r[0]++r[1]++r[6];

			len = Select.kr(Stepper.kr(Impulse.kr(1/4/[1,2,4,8])),[1,2,1,0.5,1.5,2,4,0.5,1.5].scramble/2).lag(1/2);

			mod = 2;


			Splay.ar(
				Limiter.ar(
					SinOsc.ar(base1 + {base1.rrand(base1*10).round(base1*mod)}!3 * s.at({0.rrand(2)}!3) ,mul:0.133).tanh +
					SinOsc.ar(base2 + {base2.rrand(base2*10).round(base2*mod)}!3 * s.at({0.rrand(2)}!3) ,mul:0.133) * LFSaw.ar(1/4/[1,2,4,8].scramble).squared
					,1)
				,0.5,1,SinOsc.ar([1,2,4,8]))}).play;

		16.wait;
	}
}).play;

)

s.scope;