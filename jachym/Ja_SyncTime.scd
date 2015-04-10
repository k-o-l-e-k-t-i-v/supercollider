SynthDef(\signal, { |freq, gate = 1| Out.ar(0, SinOsc.ar(freq!2,mul:0.1)*Line.ar(1,0,0.05, doneAction:2)); }).add;

~t = TempoClock.new(1,0);
~t.beats;
~a = Pdef(\aaa, Pbind(\instrument, \signal, \dur, 2, \legato, 0.15, \octave, 8)).play(~t, quant:1);
~b = Pdef(\bbb, Pbind(\instrument, \signal, \dur, 2, \legato, 0.15, \octave, 6));

(
~f = {|parentTime|
	var syncTime, newTime;

	syncTime = parentTime.beats%1;
	postf("\nCurrent parent time is %\nINT --- next (int)parentTime is %\n", parentTime.beats, parentTime.beats.ceil) ;
	postf("PING --- time to sync is %\n\n", syncTime);

	parentTime.sched(1-syncTime, {
		newTime = TempoClock.new(1,0);
		~b.play(newTime);
		postf("ParentTime : %\nNewTime : %\n", parentTime.beats, newTime.beats);
	});

	parentTime.sched(3-syncTime, {
		postf("\n2ndTry\nParentTime : %\nNewTime : %\n", parentTime.beats, newTime.beats);
	};);
};
~f.value(~t);
)
