s.scope(2);

(
SynthDef("tone1", { arg freq = 200, dur = 0.5, vol = 0.2;
	var tone, env;
	tone = SinOsc.ar(freq,0,1);
	env = EnvGen.ar(Env([0,vol*0.95,0],[0.1*dur, 0.9*dur]),doneAction:2);
	Out.ar(0,[tone, tone] * env);
	}
).add;
SynthDef("beat1", { arg freq = 65, dur = 0.2, vol = 0.2;
	var tone, env;

	tone = SinOsc.ar(SinOsc.kr([10,25,50],0,0.3,0.5)*freq ,[0,1/8pi,1/4pi],[0.3,0.3,0.3]);
	env = EnvGen.ar( Env([0,vol,0.8*vol,0],[dur * 0.1,dur * 0.35,dur * 0.55]), doneAction: 2);

	Out.ar(0,Decay2.ar([tone, tone] * env,0.00005,0.0003));

}).add;
)

)

Synth("tone1");
Synth("beat1");


(
var t = Tuning.harmonic;
var seq1, seq2, seq3;

seq1 = Pseq(t.cents.at([1,1,1,2,2,1]));
seq2 = Pseq(t.cents.at([3,2,2,3,2,2]));
seq3 = Pseq(t.cents.at([2,3,3,2,1,1]));

Pdefn(\seq).quant = 2.0;
Pdefn(\seq, Pswitch([seq1, seq2, seq3], Pseq([0,0,0,0,1,0,2], inf)));
)

(
var seq1 = Pseq([0.5,0.7,0.9,1]);

Pdefn(\seqDur).quant = 2.0;
Pdefn(\seqDur, Pswitch([seq1], Pseq([0], inf)));
)

(
Tdef(\tone).quant = 6.0;
Tdef(\tone, {
	var seqFreq, seqT, seqDur;
	var cnt = 0;

	seqFreq = Pdefn(\seq).asStream;
	seqT = Pdefn(\seqT).asStream;
	seqDur = Pdefn(\seqDur).asStream;

	loop  {
		var valFreq = seqFreq.next;
		var valT = seqT.next;
		var valDur = seqDur.next;

		Synth("tone1", [freq:valFreq/4pi, \dur, valDur, \vol, 0.2]);
		0.25.wait;

		if (cnt != 6,
			{
				Synth("tone1", [freq:valFreq/2pi,\dur,valDur, \vol, 0.1]);
			}, {
				Synth("tone1", [freq:valFreq/3pi,\dur,valDur*5, \vol, 0.2]);
				cnt = 0;
		});

		cnt = cnt + 1;
		0.25.wait;
		("CNT:" + cnt + "T:"+ valT + "dur:" + valDur + "freq:" + valFreq ).postln;
	}
	}
).play;
)

Tdef(\tone).stop(2);


(
var seq1 = Pseq([0.5],6);
var seq2 = Pseq([0.25],2);

Pdefn(\seqT).quant = 2.0;
Pdefn(\seqT, Pswitch([seq1, seq2], Pseq([0,0,0,0,1], inf)));
)

(
Tdef(\bum).quant = 6.0;
Tdef(\bum, {
	var seqT = Pdefn(\seqT).asStream;
	var cnt = 0;

	loop  {
		var valT = seqT.next;
		Synth("beat1", [\freq,155,\dur,0.15,\vol,0.4]);

		if (cnt != 12,
			{
				0.15.wait;
				Synth("beat1", [\freq,205,\dur,0.05,\vol,0.3]);
			},{
				Synth("beat1", [\freq,405,\dur,0.1,\vol,0.1]);
				0.15.wait;

				Synth("beat1", [\freq,405,\dur,0.175,\vol,0.1]);

				cnt = 0;
			}
		);

		(valT-0.15).wait;
		cnt = cnt + 1;
	}
	}
).play;
)
Tdef(\bum).stop;