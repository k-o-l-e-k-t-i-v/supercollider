s.boot;

q = ();

(
q.bufferLength = 20 * s.sampleRate;
q.buffer = Buffer.alloc(s, q.bufferLength);

SynthDef(\recorder, {
	var in = Ndef(\input).ar;

	// overwrite recording, if longer than maxtime
	RecordBuf.ar(in, q.buffer, loop:1);
}).add;

Ndef(\looper, {arg t_reset = 1, rate=1, inter=2, dur = 1, play = 1;
	BufRd.ar(
		1, q.buffer.bufnum,
		Phasor.ar(t_reset,
			BufRateScale.kr(b.bufnum) * rate * play,
			0,
			dur * s.sampleRate
	), 1, inter);
});
)



(
q.startRec = {
	// keep startingtime
	q.startRecTime = Process.elapsedTime;

	// stop the looper sound
	q.stopLoop;

	// record
	q.recSynth = Synth(\recorder);
};

q.stopRec = {
	var stopTime = Process.elapsedTime;

	q.recSynth.free;
	q.loopDur = stopTime - q.startRecTime;
};

q.playLoop = {
	Ndef(\looper).set(
		\dur, q.loopDur,
		\play, 1,
		\t_reset, 1
	);
};

q.stopLoop = {
	Ndef(\looper).set(\play, 0);
};

q.stopRecAndPlay = {
	q.stopRec;
	q.playLoop;
};
)



q.startRec; // start recording
q.stopRec;  // stop recording
q.playLoop; // loop
q.stopLoop; // stop playing


q.startRec; // start recording
q.stopRecAndPlay; // stop rec and play


NodeProxy