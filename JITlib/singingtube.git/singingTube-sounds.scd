/***
first setup for the singing Tube
programmed by Till Bovermann, Jan. 2015
*/

/// either fake input (pre-recorded)

s.options.memSize = 8192 * 8;
s.reboot

(
// adapt path to your locally available file, mono!

var path = "/localvol/3DMin/projects/singingtube/01-150113_1708-cut.wav".standardizePath;

b = Buffer.read(s, path, action: {

	Ndef(\input, {

		PlayBuf.ar(
			b.numChannels,
			b.bufnum,
			BufRateScale.kr(b.bufnum),
			loop: 1
		);
	});
	"loading done".postln;

});
)

// or life input:

(
Ndef(\input, {
	SoundIn.ar(0); // first channel of the soundcard, change for others.

});
)




// more efx? add them to the mix
(
Ndef(\preEfx, {
	Mix([
		Ndef(\input).ar,
		Ndef(\looper).ar,
	]);
});



// Efx


(
Ndef(\pitcher).addSpec(\windowSize, [0.02, 0.5]);
Ndef(\pitcher).addSpec(\pitchRatio, [0, 4]);
Ndef(\pitcher).addSpec(\pitchDispersion, [0, 1]);
Ndef(\pitcher).addSpec(\timeDispersion, [0, 1]);
Ndef(\pitcher).addSpec(\lagTime, [0, 1]);

Ndef(\pitcher, {
	arg
		windowSize = 0.2,
		pitchRatio = 1,
		pitchDispersion = 0,
		timeDispersion = 0,
		lagTime = 0.01;

	var in = Ndef(\preEfx);
	var shift;


	shift = PitchShift.ar(in,
		windowSize:      windowSize.lag(lagTime),
		pitchRatio:      pitchRatio.lag(lagTime),
		pitchDispersion: pitchDispersion.lag(lagTime),
		timeDispersion:  windowSize * timeDispersion.lag(lagTime),
	);

});
);



(
Ndef(\delay).addSpec(\damp, [0, 1]);
Ndef(\delay).addSpec(\diff, [0, 1]);
Ndef(\delay).addSpec(\highband, [1000, 10000, \exp]);
Ndef(\delay).addSpec(\highx, [0, 1]);
Ndef(\delay).addSpec(\lowband, [100, 6000, \exp]);
Ndef(\delay).addSpec(\lowx, [0, 1]);
Ndef(\delay).addSpec(\modDepth, [0, 50]);
Ndef(\delay).addSpec(\modFreq, [0, 10]);
Ndef(\delay).addSpec(\midx, [0, 1]);
Ndef(\delay).addSpec(\size, [0.5, 3]);
Ndef(\delay).addSpec(\t60, [0.1, 60, \exp]);
Ndef(\delay).addSpec(\wet, [0, 1]);
Ndef(\delay).addSpec(\shelfslope, [1, 10]);
Ndef(\delay).addSpec(\shelfFreq, \freq);
Ndef(\delay).addSpec(\fb, [0, 1]);
Ndef(\delay).addSpec(\dtime, [0, 2]);
Ndef(\delay).addSpec(\lagTime, [0, 1]);

Ndef(\delay, {
	arg
		delayTime = 2,
		damp = 0,
		size = 1,
		diff = 0.707,
		feedback = 0.9,
		lagTime = 0.01;

	var in = Ndef(\preEfx);

	Greyhole.ar(in,
		delayTime: delayTime.lag(lagTime),
		damp:      damp.lag(lagTime),
		size:      size.lag(lagTime),
		diff:      diff.lag(lagTime),
		feedback:  feedback.lag(lagTime),
	);
});
);
)


Ndef(\preEfx).play;
Ndef(\delay).play;
Ndef(\pitcher).play;


NdefMixer(s)