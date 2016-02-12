

(
Tdef(\sweet,{
	loop{
		(
			var mod;
			mod = 2.rrand([8,8,8]).squared.round([8,8,8])/4;
			mod.postln;

			Ndef(\b).quant = 2.0;
			Ndef(\b).fadeTime = 1.0;
			Ndef(\b,{|mod = #[1,1,1]|
				var s;
				s = CombN.ar(
					LFSaw.ar(mod/2/[1,2,2,4]).squared *
					// Pulse.ar(4/[1,2,2,4]) *
					SinOsc.ar(43.2/8*([1,2,4,8]*(mod*[1pi,0.5pi])),mul:0.5)
					,1,0.25,4);

				s = Vibrato.ar(s,[4,5,6,7],0.2);
				s = SinOsc.ar(1/4/[1,2,4]) * s;

				Splay.ar(
					Compander.ar(s,s,0.85,1,0.25,0.01,0.01).softclip
			).clip(-1,1)}).play;

			Ndef(\b).lag(\mod,0.015);
			Ndef(\b).set(\mod,mod);
		);


		(
			mod = 2.rrand([8,8,8]).squared.round([8,8,8])/4;
			mod.postln;

			Ndef(\c).quant = 2.0;
			Ndef(\c).fadeTime = 1.0;
			Ndef(\c,{|mod = #[1,1,1]|
				var s;
				s = CombN.ar(
					LFSaw.ar(mod/2/[1,2,2,4]).squared *
					// Pulse.ar(4/[1,2,2,4]) *
					LFSaw.ar(43.2/32*([1,2,4,8]*(mod*[1pi,0.5pi])),mul:0.5)
					,1,0.25,4).lag(0.01);

				s = Vibrato.ar(s,[4,5,6,7],0.2);
				s = SinOsc.ar(1/4/[1,2,4]) * s;

				Splay.ar(
					Compander.ar(s,s,0.85,1,0.25,0.01,0.01).softclip
			).clip(-1,1)}).play;

			Ndef(\c).lag(\mod,0.01);
			Ndef(\c).set(\mod,mod);
		);

		4.wait;
	}
}).play;

)