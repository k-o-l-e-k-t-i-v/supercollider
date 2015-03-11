(
var w, collButt, collValue;
var colBack, colFront, colActive, colTime;
var buttNode;
var rout;

SynthDef(\help_sinegrain,
	{ arg out=0, freq=440, sustain=0.35;
		var env;
		env = EnvGen.kr(Env.perc(0.01, sustain, 0.2), doneAction:2);
		Out.ar(out, SinOsc.ar(freq, 0, env)!2)
}).add;

colBack = Color.new255(30,30,30);
colFront = Color.new255(255,255,255);
colActive = Color.new255(200,50,50);
colTime = Color.new255(75,65,45);

w = Window.new("pattern", Rect(200,200,600,300), false);
w.front;
w.background = colBack;
w.alwaysOnTop = true;

collButt = List.new;
collValue = List.newClear(16);

16.do{|x|
	collValue[x] = 0;
	buttNode = Button(w, Rect(x*30+10, 10, 30, 30))
	.alpha_(0.5)
	.states_([
		["||",colFront,colBack],
		[">",colFront,colActive]
	])
	.action_({ |butt|
		if(butt.value == 1) { collValue[x] = 800; };
		if(butt.value == 0) { collValue[x] = 0; };
	})
	;
	collButt.add(buttNode);
};

x = Pseq(collValue,inf);
q = x.asStream;
rout = Routine({
	var cnt = 0;
	var isActive;
	x.do({|i|
		// i.postln;
		// cnt.postln;
		Synth(\help_sinegrain, [\freq, i]);
		if(collButt[cnt].value == 1){isActive = true}{isActive = false};

		collButt[cnt].states_([
			["||",colFront,colTime],
			[">",colFront,colTime]
		]);

		0.125.wait;

		if(isActive) {
			collButt[cnt].states_([
				["||",colFront,colBack],
				[">",colFront,colActive]
			])
			.value_(1);
		}{
			collButt[cnt].states_([
				["||",colFront,colBack],
				[">",colFront,colActive]
			]);
		};

		cnt = cnt + 1;
		if(cnt == 16){cnt = 0;};

	})
});
AppClock.play(rout);

)

