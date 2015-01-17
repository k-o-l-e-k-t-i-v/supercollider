// naucit lepsi ovladani casovani v loop (str215 - 6.5)

// Tdef.emded, Tdef.fork  (Fig 7.13 str236)

// naucit bus.audio -> modulace

// Pseq str201, Pdefn str238

// if == 0 , case, switch ?
s.scope;

(
SynthDef ("test1" ,{arg freq = 300, out = 0;
	var tone, env;

	tone = SinOsc.ar(freq ,0,0.05);
	env = EnvGen.ar ( Env([0,1,0.4,0.8,0],[0.2,0.2,0.2,4.6] ) , doneAction: 2);
	//env = EnvGen.ar ( Env([0,1,0],[0.9,0.1] ) , doneAction: 2);
	Out.ar(out,tone * env);
}).add;

SynthDef ("drum1", { arg freq = 50, dur = 0.5, vol = 0.2;
	var tone, env;

	tone = SinOsc.ar(SinOsc.kr([10,25,50],0,0.5,0.5)*[freq,freq+5,freq+10] ,[0,1/8pi,1/4pi], vol);
	env = EnvGen.ar( Env([0,1,0.8,0],[dur * 0.1,dur * 0.35,dur * 0.55]), doneAction: 2);

	Out.ar(0,Decay2.ar([tone, tone] * env,0.00005,0.0003));

}).add;
)

Synth("test1",[\freq , 1000]);
x = Synth("drum1",[\freq, 25, \dur, 5.5, \vol, 0.3]);

(
t = Tuning.harmonic;

Pdefn(\myNotes2).quant = 2.0;
Pdefn(\myNotes2, Pseq(t.cents.at([1,2,7,11]) / 2pi , inf));
//Pdefn(\myNotes2, Pseq([600,330,220,90, 550,290,200,120],inf));

Pdefn(\myTime).quant = 2.0;
Pdefn(\myTime, Pseq([1.0,3.0, 0.25,0.25, 1, 1, 0.25, 0.75],inf));
)

(
~cnt = 0;

Tdef(\myLoop1).quant = 2.0;

Tdef(\myLoop1, {
	var stream = Pdefn(\myNotes2).asStream;
	var time = Pdefn(\myTime).asStream;

	loop {
		var val = stream.next;
		var t = time.next;

		Synth("test1",[\freq, val, \out, 0]);
		t.wait;

		Synth("test1",[\freq, val, \out, 1]);
		t.wait;
		~cnt = ~cnt + 1;

		if(~cnt % 2 == 0, {
			"-----".postln;
			2.do {
				Synth("drum1",[\freq, 25, \dur, 0.5, \vol, 0.25]);

				0.5.wait;
			};
			Synth("drum1",[\freq, 90, \dur, 3, \vol, 0.08]);
			val = stream.next;
		});

		if(~cnt == 16, {~cnt  = 0;});

		("freq :" + val + "||| CNT :" + ~cnt + "||| T :" + t).postln;
	}
}).play;
)

Tdef(\myLoop1).stop(0.5);