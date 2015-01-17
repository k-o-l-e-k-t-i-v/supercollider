(
SynthDef("surf1", { arg freq = 100, dur = 1, vol =0.2;
	var tone, env, noise;
	tone = SinOsc.ar([freq, freq + 2],[0, 0.1pi, 0.2pi],0.2);
	env = EnvGen.ar(Env([0,vol, vol*0.8,0], [0.05 *dur, 0.2*dur, 0.35*dur, 0.4*dur]), doneAction: 2);
	//noise = (LFSaw.kr(400,380).range(0.5,0.9) * SinOsc.kr(0.002, 0, 0.15, 0.4)).range(0.4,0.6);
	noise = (LFSaw.ar([30,32],0.9,0.4,0.5)) * EnvGen.ar(Env([0,1,0], [0.05 *dur, 0.15*dur, 0.1*dur]), doneAction: 2);
	Out.ar(0, ([tone* noise, tone* noise] * env ));
}).add;
SynthDef("beat1", { arg freq = 665, dur = 0.2, vol = 0.2;
	var tone, env, noise;
	tone = SinOsc.ar([freq, freq + 2],[0, 0.1pi, 0.2pi],0.2);
	env = EnvGen.ar(Env([0,vol,0], [0.1 *dur, 0.5*dur, 0.4*dur]), doneAction: 2);
	//noise = ((LFSaw.kr(100)/5) * SinOsc.kr(0.002, 0, 0.15, 0.5)).range(0.7,1.2);

	Out.ar(0, [tone, tone+2] * env);
}).add;
)

Synth("surf1", [\freq, 400, \dur, 5]);

(
var seq1, seq2, seq3;

seq1 = Pseq([800, 800, 800, 825],2);
seq2 = Pseq([825, 820, 815, 810]);
seq3 = Pseq([310, 285, 240, 210]);

Pdefn(\seq_surf1).quant = 6.0;
Pdefn(\seq_surf1, Pswitch([seq1, seq2, seq3], Pseq([0,1],inf)));
)

(
var seqSurf1 = Pdefn(\seq_surf1).asStream;

Tdef(\mainLoop).quant = 6.0;
Tdef(\mainLoop, {
	var mult = 0.85;
	var duration = 6;
	loop {
		var val_seqSurf1 = seqSurf1.next;
		Synth("surf1", [\freq, val_seqSurf1, \dur, duration , \vol, mult/3]);
		0.15.wait;
		Synth("surf1", [\freq, val_seqSurf1*0.9, \dur, duration, \vol, mult/3]);
		0.25.wait;
		Synth("surf1", [\freq, val_seqSurf1*0.095, \dur, duration, \vol, mult/3]);
		val_seqSurf1.postln;
		0.5.wait;
	}
}).play;
)
Tdef(\mainLoop).stop(6);

(
var seq1, seq2, seq3;

seq1 = Pseq([1,2,3,4,5]);
seq2 = Pseq([0.25, 0.25],6);
seq3 = Pseq([2,0.25,0.25,0.25]);

Pdefn(\seq_Beat1_time).quant = 6.0;
Pdefn(\seq_Beat1_time, Pswitch([seq1, seq2, seq3], Pseq([2,1,1,1,0],inf)));
)

(
var seqBeat1 = Pdefn(\seq_Beat1_time).asStream;

Tdef(\loopBeat).quant = 6.0;
Tdef(\loopBeat, {


	loop {
		var val_beatTime = seqBeat1.next;

		Synth("beat1", [\ferq ,120, \vol, 0.1, \dur, val_beatTime*1.9]);
		val_beatTime.postln;
		val_beatTime.wait;
		Synth("beat1", [\freq, 65, \vol, 0.1, \dur, val_beatTime*0.9]);
		0.5.wait
	}
}).play;
)

Tdef(\loopBeat).stop(6);

