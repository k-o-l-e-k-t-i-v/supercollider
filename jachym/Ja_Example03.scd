s.reboot;
s.scope(2);

(
SynthDef("drum1",{ arg freq = 50, dur = 0.5, out = 0;
	var tone, env;
	tone = SinOsc.ar(freq);
	env = EnvGen.ar(Env([0,0.5,0],[0.2*dur, 0.8*dur]), doneAction: 2);
	Out.ar(out,tone * env);
}).add;
)

(
var seq1, seq2, seq3;

seq1 = Pseq([0.5,0.25,0.25],4);
seq2 = Pseq([0.25],4);
seq3 = Pseq([0.05,0.45],5);

Pdefn(\seqDrum).quant = 2.0;
Pdefn(\seqDrum, Pswitch([seq1,seq2,seq3], Pseq([0,1,0,2,0,2], inf)));
//Pdefn(\seqDrum, Pswitch([seq1,seq2,seq3,1], Pseq([0,1,0,2,3], inf)));
)

(
Tdef(\drumLoop).quant = 2.0;
Tdef(\drumLoop,{ arg phase = 0;
	var dirSpeaker = 0;
	var time = Pdefn(\seqDrum).asStream;

	loop {
		//	switch
		var t = time.next;

		Synth("drum1",[\freq, 65, \dur, t/2, \out, dirSpeaker]);
		if(dirSpeaker == 0 ,{dirSpeaker = 1;},{dirSpeaker = 0;});

		t.postln;

		t.wait;
	};

}).play;
)

Tdef(\drumLoop).stop;
