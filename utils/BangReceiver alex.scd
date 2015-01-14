
thisProcess.openUDPPort(7777); // attempt to open 1121

(
o.free;

~cntr = 0;

o = OSCFunc({ arg msg, time, addr, recvPort; //[msg, time, addr, recvPort].postln; //argyments
	(

		~cntr.postln;
		~cntr = ~cntr + 1;

		//bang just every fourth
		if(~cntr% 3 ==  0){


			(
				Ndef(\alex).fadeTime=3;
				Ndef(\alex).quant=3;
				Ndef(\alex, {

					~freq=LFNoise0.kr(Impulse.kr(0.25)).range(400,700).round(100);

					~sig=SinOsc.ar([~freq, ~freq+1.025])*EnvGen.kr(Env.asr(0.1,0.1,0.2));
					Poll.kr(Impulse.kr(0.25),~freq, "frequency");
					~sig=FreeVerb.ar(~sig,room:2);
				}).play;

			)


		}
		//function


	)

}, '/bang');

)
