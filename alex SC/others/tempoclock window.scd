(
	var w,u,slid, button;

	w = Window("tempo control test", Rect(100,100,200,40));
	slid = Slider(w, Rect(0,0,200,20));

	button = Button(w, Rect(60,20,40,20));
	button.states_([["kill"]]);

	w.front;

	slid.action_({u.tempo_(2*(slid.value)+1)});
	button.action_({u.clear; w.close;});

	u = TempoClock(1);

	u.schedAbs(0.0, { arg beat,sec;
		[beat,sec].postln;
		Synth(\bleep, [\note, rrand(60, 100)]);
		1.0
	});
)

//It's important we use SynthDef and Synth here: notice the doneAction!
(
SynthDef(\bleep,{ arg out=0, note=60, amp=0.5, pan=0.0;
	var freq, env;
	freq = note.midicps;
	env = EnvGen.ar(
					Env([0,1,1,0],[0.01, 0.1, 0.2]),
					levelScale:amp,
					doneAction:2
				);
	Out.ar(out,
		Pan2.ar(Blip.ar(freq) * env, pan)
	)
}).add;
)
