(
var w, buttons, data, synths, dims = [16,16], resolution = 4;
w = Window("rand-n-step", Rect(50,250,dims[0]*22 + 10,dims[1]*22+10));

synths = Array.fill(dims[1], { |i|
	SynthDef('rstp'++i, {
		var sig = Pan2.ar(
			PMOsc.ar(80.exprand(10000), 1.exprand(200), 1.exprand(20)),
			-1.0.rand2,
			EnvGen.kr(Env(Array.rand(4, 0, 0.1.rrand(0.5)).add(0), Array.rand(3, 0.1, 0.3).add(0.1), -5.rrand(5)), doneAction: 2)
		);
		Out.ar(0, sig);
	}).add.name;
});

data = Array2D(dims[1],dims[0]);
buttons = Array.fill(dims[1], { |l|
	Array.fill(dims[0], { |i|
		Button( w, Rect( 5 + (22*i), 5 + (22*l), 20, 20) ).states_([ ['-'], ['+'], ['%'] ]).action_({ |b| data[l,i] = b.value });
	})
});

AppClock.play({
	inf.do({|i|
		dims[1].do({ |l|
			(buttons[l] @@ i).font_(Font("sans", 20));
			(buttons[l] @@ (i-1)).font_(Font("sans", 14));
			switch( data[l,i.mod(dims[0])],
				1, { Synth(synths[l]) },
				2, { 0.5.coin.if({ Synth(synths[l]) }) }
			);
		});
		(TempoClock.default.tempo.reciprocal / resolution).yield;
	});
}.asRoutine);
w.front;
)