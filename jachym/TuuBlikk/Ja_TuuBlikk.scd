(
var numStep, numDegree;
var w, collButt, collValue;
var colBack, colFront, colActive, colTime;
var rout;

s.boot;
numStep = 32;
numDegree = 12;

SynthDef(\help_sinegrain,
	{ arg out=0, freq=440, sustain=0.55;
		var env;
		env = EnvGen.kr(Env.perc(0.01, sustain, 0.2), doneAction:2);
		Out.ar(out, SinOsc.ar(freq, 0, env)!2)
}).add;

colBack = Color.new255(30,30,30);
colFront = Color.new255(255,255,255);
colActive = Color.new255(200,50,50);
colTime = Color.new255(75,65,45);

w = Window.new("pattern", Rect(50,200,1100,500), false);
w.front;
w.background = colBack;
w.alwaysOnTop = true;

collButt = List.new;

numStep.do{|x|
	numDegree.do{|y|
		var butt = TuuButton(x,y,w);
		collButt.add(butt);
	};
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

