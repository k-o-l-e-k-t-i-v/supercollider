p = ProxySpace.push(s);

(
f = { |env|
	var bundles;
	var bufNum;
	bundles = s.bind {
		var duration = env.duration;
		var buffer = Buffer.alloc(s, (44100/s.options.blockSize) * duration, 1);
		SynthDef("recEnv", {
			var envgen = EnvGen.kr(env, doneAction:2);
			var rec = RecordBuf.kr(envgen, buffer, loop: 0, doneAction: 2);
		}).send(s);
		"\nBuffer[%] - dur % ".format(buffer.bufnum, duration).postln;
		s.sync; // wait until synthdef is loaded
		x = Synth.new("recEnv");
		nil;
	};

	bundles.do{|oneMsg| "\t%".format(oneMsg).postln};
	nil;
};
)
f.value(Env([0,1,0], [0.25, 3.75], [5,-5]))
f.value(Env([0,1,0], [2.85, 1.15], [5,-5]))

s.cachedBufferAt(0).plot;
s.cachedBufferAt(0).duration * s.options.blockSize
s.cachedBufferAt(1).plot;
s.cachedBuffersDo({ |buf| buf.postln });

s.bind(

(
g = {|index|
	// arg out = 0;
	var buff = b;
	var playbuf = PlayBuf.kr(1,1, loop:0, doneAction:2);
	index.postln;
	Out.ar(0, SinOsc.ar(120!2) * playbuf);
}.play(s, 0, [\index, 0, \freq, 150])
)

p = ProxySpace.push(s)
(
g = {|index|
	/*
	var buffer = s.cachedBufferAt(index);
	var bufArr;
	buffer.loadToFloatArray(index,action: { arg array;
	// {array.plot;}.defer;
	array.postln;
	~b = NodeProxy.control(s, 1);
	~b.setn(sources = array;

	~a = NodeProxy.audio(s, 2);
	~a.play;
	~a[0] = {|amp = 0| SinOsc.ar(120!2, mul:amp)};
	~a.setn(\amp, array);
	});
	// bufArr.postln;
	*/
	// /*
	SynthDef(\help_PlayBuf, {| out = 0, bufnum = 0 |
		       var playbuf = PlayBuf.kr(1,bufnum, loop:0, doneAction:2);
		    Out.ar(out, SinOsc.ar(120!2) * playbuf);
	    	}).add;
	// */
	// var synth = buffer.play();
	// "\nBuffer[%] - dur % ".format(index, buffer.duration * s.options.blockSize).postln;
	Synth(\help_PlayBuf);
	// buffer.plot;
	// SinOsc.ar(120!2) * buffer.play;
	/*
	~a = NodeProxy.audio(s, 2);
	~a.play;
	~a[0] = {|amp = 0| SinOsc.ar(120!2, mul:amp)};

	~a.map(\amp, ~b);

	~b = NodeProxy.control(s, 1);
	~b[0] = \help_PlayBuf;
	*/
}.value(0);
)


(
SynthDef(\testPlay, {|selIndex = 0|
	var buffers = [
		PlayBuf.kr(numChannels:1, bufnum:0, loop:0, doneAction:2),
		PlayBuf.kr(numChannels:1, bufnum:1, loop:0, doneAction:2)
	];
	var select = Select.kr(buffers, selIndex);
	var sig = SinOsc.ar(120!2, mul:select);
	Out.ar(0, sig);
}).add;
)
Pbind(\instrument, \testPlay, \selIndex, Pseq([1,2], inf), \dur, Pseq([4,4,4,4], 1)).play;



~test = NodeProxy.audio(s, 2);
~test.play;
(
~test[0] = {
	var buffers = [
		PlayBuf.kr(numChannels:1, bufnum:15, loop:1, doneAction:0),
		PlayBuf.kr(numChannels:1, bufnum:16, loop:1, doneAction:0)
	];

	Select.kr(SinOsc.ar(120!2, mul:buffers),\selIndex.kr(0))

};
)
~test[1] = Pbind(\type, \set, \args, [\selIndex], \selIndex, Pseq([0,1], inf), \dur, 4).trace;