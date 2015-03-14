s.scope;

(
var numStep, numDegree;
var w, collButt, collValue;
var colBack, colFront, colActive, colTime;
var rout;
var posX = 0;

s.boot;
numStep = 32;
numDegree = 12;

SynthDef(\help_sinegrain, { arg freq=440, sustain=1.25;
	var env, tone;
	env = EnvGen.kr(Env.perc(0.01, sustain, 1), doneAction:2);
	tone = SinOsc.ar(freq, 0, env)*SinOsc.ar(freq/2, 0, env);
	tone = FreeVerb.ar(tone,0.8,0.9,0.1, 1,tone);
	Out.ar(0, tone!2);
}).add;

colBack = Color.new255(255,255,255);

w = Window.new("pattern", Rect(50,200,1650,650), false);
w.front;
w.background = colBack;
w.alwaysOnTop = true;

collButt = List.new;

numStep.do{|x|

	numDegree.do{|y|
		var butt = TuuButton(x,y,w);
		collButt.add(butt);
	};
	// if(x % 4 == 0){"jsem".postln; posX = posX + 45;}{posX = posX + 30;};
};

rout = Routine({
	var cnt = 0;
	loop {
		collButt.size.do{|j|
			if(collButt[j].isActive)
			{
				if(collButt[j].isTime(cnt))
				{ Synth(\help_sinegrain,[\freq, collButt[j].frequency]); };

			};
			collButt[j].update(cnt);
		};

		cnt = cnt + 1;
		if(cnt == numStep){cnt = 0;};
		0.125.wait;
	}
}).play;


)

