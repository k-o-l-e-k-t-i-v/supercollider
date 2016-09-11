Loop{

	*ar{

		var d = Dictionary.new;
		(44..51).do({
			arg i;
			d.put(i, 0);
		});

		MIDIdef.noteOn(\ping,{
			arg vel, num, chan, src;
			if (d[num] == 1,
				{
					d.put(num, 0);
				},
				{
					d.put(num, 1);
				}
			);

			d.postln;
			num.postln;
		},(44..51));

		d.postln;

		g=Task({
			{
				(44..51).do({

					arg i;
					i.postln;

					if (d[i] == 1,
						{{
							var sig, env;
							sig=SinOsc.ar(i*10)!2;
							env=EnvGen.kr(Env.perc(0.1,i/80), doneAction:2);
							sig=sig*env;
						}.play;
						"note".postln;
						},
						{"no note".postln;});

					0.15.wait;

				})
			}.loop;
		});

		;

		g.start;

	}
}