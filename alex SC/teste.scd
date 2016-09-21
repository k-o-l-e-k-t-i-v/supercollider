[48,49,50,51,44,45,46,47] first 8

[40,41,42,43,36,37,38,39] next 8





///////////
MIDIClient.init;
MIDIIn.connectAll;
MIDIIn.disconnect;


(
h=MIDIdef.noteOn(\on,
	{arg vel, num, chan, src;
		[vel, num, chan, src].postln;
});
)



(
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
					env=EnvGen.kr(Env.perc(0.1,i/20), doneAction:2);
					sig=sig*env;
				}.play;
				"note".postln;
				},
				{"no note".postln;});

			0.15.wait;

		})
	}.loop;
});

);



g.start;
g.stop;


