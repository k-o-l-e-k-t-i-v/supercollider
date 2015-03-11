(
var numStep, numDegree;
var w, collButt, collValue;
var colBack, colFront, colActive, colTime;
var buttNode;
var rout;

numStep = 16;
numDegree = 12;

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

numStep.do{|x|
	numDegree.do{|y|
		var butt = TuuButton(x,y,w);
		collButt.add();
	};
};

rout = Routine({
	numStep.do{|cnt|
		collButt.size.do{|j|
			if(collButt[y+(12*cnt)].value == 1){
				Synth(\help_sinegrain, [\freq,400]); // collValue[y+(12*cnt)]
				(y+(12*cnt)).postln;
			};
			collButt[y+(12*cnt)].states_([
				[collValue[y+(12*cnt)],colFront,colTime],
				[">",colFront,colTime]
			]);
		};

		0.125.wait;

		12.do{|y|
			if(collButt[y+(12*cnt)].value == 1){
				collButt[y+(12*cnt)].states_([
					[y+(12*cnt),colFront,colBack],
					[">",colFront,colActive]
				])
				.value_(1);
			}{
				collButt[y+(12*cnt)].states_([
					[y+(12*cnt),colFront,colBack],
					[">",colFront,colActive]
				]);
			};
		};

		cnt = cnt + 1;
		if(cnt == numStep){cnt = 0;};
	};


});
AppClock.play(rout);

)

