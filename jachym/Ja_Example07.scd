(
SynthDef("checkTone", { arg freq = 440, dur = 0.1, vol = 0.2;
	var env = EnvGen.ar(Env([0,vol,0],[0.1*dur, 0.9*dur]),doneAction:2);
	var toneL = SinOsc.ar(freq+SinOsc.kr(1,0,0.5,0.5).range(-60,0),0,env);
	var toneR = SinOsc.ar(freq+SinOsc.kr(1,3pi,0.5,0.5).range(0,60),0,env);
	Out.ar(0, [toneL,toneR]);
}).add;

SynthDef("beat1", { arg freq = 665, dur = 0.2, vol = 0.2;
	var tone, env, noise;
	env = EnvGen.ar(Env([0,vol,0], [0.1 *dur, 0.9*dur]), doneAction: 2);
	noise = ((LFSaw.kr(freq/4)) * SinOsc.kr(freq/4, 0, 0.35, 0.6)).range(0.6,1.1);

	tone = SinOsc.ar([freq, freq + 2],[0, 0.1pi, 0.2pi],env*noise);

	Out.ar(0, [tone, tone]);
}).add;

SynthDef("baseSin", { arg freq = 100, dur = 6, vol = 0.02;
	var tone, env;
	env = EnvGen.ar(Env([0,vol, vol*0.4, vol*0.8, 0],[0.1*dur, 0.3*dur, 0.1*dur, 0.5*dur]),doneAction:2);
	tone = SinOsc.ar(freq, 0, env);

	Out.ar(0, [tone,tone]);
}).add;
)
(
~busFreq = Bus.control(s);
b = Bus.audio(s,0);

x = Synth.new("baseSin", [\inBus, ~busFreq]);
//y = Synth.after(x,"SawSin", [\eBus, b, \freq, 5]);
)

Synth("baseSin",[\freq, 300]);

(
Tdef(\mainLoop).quant = 6.0;
Tdef(\mainLoop, {
	~startT = thisThread.seconds;

	loop {
		Tdef(\toneLoop).fork;
		Tdef(\drumLoop).fork;
		2.wait;

		Tdef(\drumLoop).fork;
		2.wait;

		Tdef(\drumLoop).fork;
		2.wait;

		Tdef(\drumLoop).fork;
		Synth("checkTone",[\freq, 600,\dur, 0.8, \vol, 0.01]);
		2.wait;

		//Tdef(\drumLoop).fork;
		2.wait;

		Tdef(\drumLoop).fork;
		2.wait;

		~busFreq.free;
		/// new loop signal
		Synth("checkTone",[\freq, 600,\dur,0.1, \vol, 0.02]);
		postf("seconds: % , delay: % \n", (thisThread.seconds - ~startT) ,((thisThread.seconds - ~startT)%6.0));

	}
}).play;
)

(
Tdef(\mainLoop).stop;
~busFreq.free;
)


(
var seq1, seq2, seq3;

seq1 = Pseq([400, 415, 400, 375]);
seq2 = Pseq([400, 415, 390, 435]);
seq3 = Pseq([410, 405, 380, 500]);

Pdefn(\tone_Freq).quant = 6.0;
Pdefn(\tone_Freq, Pswitch([seq1, seq2, seq3],Pseq([0,1,0,2],inf)));

)

(
var seqFreq = Pdefn(\tone_Freq).asStream;

Tdef(\toneLoop).quant = 6.0;
Tdef(\toneLoop, {
	var tone1, tone2;
	var t = Tuning.harmonic;

	var valFreq = seqFreq.next;

	~busFreq = Bus.control(s);
	tone2 = Synth("baseSin",[\vol, 0.25,\dur,2]);
	tone1 = Synth("baseSin",[\vol, 0.21, \dur, 14]);
	tone1.map(\freq, ~busFreq);


	valFreq.postln;
	~busFreq.set(valFreq);
	valFreq = seqFreq.next;
	5.wait;

	valFreq.postln;
	~busFreq.set(valFreq);
	valFreq = seqFreq.next;
	1.wait;
	tone2 = Synth("baseSin",[\vol, 0.05,\dur,8]);

	valFreq.postln;
	~busFreq.set(valFreq);
	valFreq = seqFreq.next;
	3.wait;

	valFreq.postln;
	~busFreq.set(valFreq);
	//valFreq = seqFreq.next;
	1.wait;


});
)

(
//var seq1, seq2;
Pdefn(\drum_T).quant = 6.0;
Pdefn(\drum_T, Pseq([0.25, 0.25, 0.25, 0.35, 0.35, 0.25]));

)
(
Pdefn(\drum_Vol).quant = 6.0;
Pdefn(\drum_Vol, Pseq([0.02, 0.02, 0.04, 0.15, 0.08, 0.05]));

Pdefn(\drum_Dur).quant = 6.0;
Pdefn(\drum_Dur, Pseq([0.75, 0.65, 0.45, 1.25, 1.2, 0.9]));
)

~drumVol = 0.1;//SinOsc.kr(5,0,0.1,0.1);
(

Tdef(\drumLoop).quant = 6.0;
Tdef(\drumLoop, {
	var seqVol = Pdefn(\drum_Vol).asStream;
	var seqDur = Pdefn(\drum_Dur).asStream;

	Pdefn(\drum_T).do { arg i;

		("Dur: " + i).postln;
		Synth("beat1",[\freq, 65, \dur,seqDur.next, \vol,seqVol.next+~drumVol]);
		i.wait;
	};

});
)