//workshop, Livekode lyd - notam, 17-21feb 2014



s.boot
StageLimiter.activate//optional but recommended


Ndef(\ett).play

(
Ndef(\ett, {Splay.ar(
	SinOsc.ar(
		0,
		SinOsc.ar([123, 234, 345, 456, 567], 0, 2pi),
		LFSaw.ar([0.1, 0.2, 0.3, 0.4, 0.5]).clip(0, 1)
	)
)});
)
Ndef(\ett).fadeTime= 4


(
Ndef(\ett, {Splay.ar(
	SinOsc.ar(
		LFSaw.ar([1, 2, 3, 4, 5]),
		SinOsc.ar([123, 234, 345, 456, 567], 0, 2pi),
		LFSaw.ar([0.1, 0.2, 0.3, 0.4, 0.5]).clip(0, 1)
	)
)});
)



//  Using mousex and mousey to explore.
//  Note the use of poll and lables
(
Ndef(\ett, {Splay.ar(
	SinOsc.ar(
		LFSaw.ar([1, 2, 3, 4, 5])*MouseX.kr(0, 100).poll(label:\mx),
		SinOsc.ar([123, 234, 345, 456, 567], 0, MouseY.kr(0, 2pi).poll(label:\my)),
		LFSaw.ar([0.1, 0.2, 0.3, 0.4, 0.5]).clip(0, 1)
	)
)});
)


Ndef(\ett).stop


Ndef(\too).play
Ndef(\too).fadeTime= 4
Ndef(\too, {GVerb.ar(Ndef.ar(\ett), 90, 0.5)}) //reverb
Ndef(\too, {CombN.ar(Ndef.ar(\ett), 0.4, 0.4, 4)}) //echo
Ndef(\too, {Ndef.ar(\ett)*SinOsc.ar(400)}) //ringmodulation
Ndef(\too, {(Ndef.ar(\ett)*5).tanh*0.5}) //distortion
Ndef(\too, {BLowPass4.ar(Ndef.ar(\ett), 400, 0.1, 2)}) //filter

Ndef(\too).stop


Ndef(\tre).play
Ndef(\tre).fadeTime= 3
Ndef(\tre, {XFade2.ar(Ndef.ar(\ett), Ndef.ar(\too), MouseX.kr(-1, 1))}) //crossfade with mousex
Ndef(\tre, {XFade2.ar(Ndef.ar(\ett), Ndef.ar(\too), MouseX.kr(-1, 1), MouseY.kr(1, 0))}) //crossfade with mousex and volume control with mousey


Ndef(\tre, {|pan= 0, amp= 0| XFade2.ar(Ndef.ar(\ett), Ndef.ar(\too), pan, amp)})
NdefMixer(s) //and click 'ed' on \tre



Ndef(\tre).play



//  Now feeding back the output (\tre) into the source (\ett).

(
Ndef(\ett, {Splay.ar(
	SinOsc.ar(
		LFSaw.ar([1, 2, 3, 4, 5]),
		SinOsc.ar([123, 234, 345, 456, 567], 0, 2pi),
		LFSaw.ar([0.1, 0.2, 0.3, 0.4, 0.5]).clip(0, 1)+DelayN.ar(Ndef.ar(\tre), 0.1, 0.1)
	)
)});
)
Ndef(\tre, {|pan= 0, amp= 0| Limiter.ar(XFade2.ar(Ndef.ar(\ett), Ndef.ar(\too), pan, amp))})

//  Use the gui sliders to control the feedback

Ndef(\tre).gui

Ndef(\tre).stop



//--

Ndef(\monster).play
(
Ndef(\monster, {
	var n= 10;
	Splay.ar(
		SinOsc.ar(
			SinOsc.ar(
				SinOsc.ar(0, SinOsc.ar({100.0.rand}!n))*({10.0}!n),
				0,
				LFSaw.ar({10.0.rand}!n).clip(0, 1)
			),
			SinOsc.ar(0, SinOsc.ar({100.0.rand}!n))*({10.0}!n),
			LFSaw.ar({1.0.rand}!n).clip(0, 1)
		)
	)
}//try with .draw here on this line if you have rd_dot installed
)
)




//  To .draw you need graphviz + rd_dot quark.
Quarks.checkoutAll
Quarks.install("rd_dot")

//  http://www.graphviz.org/Download_macos.php
//  version 2.36 works

Platform.userExtensionDir



s.plotTree





//--


Ndef(\blip).play
Ndef(\blip, {Splay.ar(SinOsc.ar(0, Decay2.ar(Impulse.ar([1, 1.1, 1.2]), 0.01, 0.2, 8pi)))})
s.scope
Ndef(\blip).fadeTime= 1
Ndef(\blip, {Splay.ar(SinOsc.ar(0, Decay2.ar(Impulse.ar([1, 1.5, 0.25]), 0.01, 0.2, [8pi, 9pi, 10pi])))})
Ndef(\blip, {Splay.ar(SinOsc.ar(0, Decay2.ar(Impulse.ar([1/3, 1.5, 0.25, 2/3]), 0.01, 0.2, [8pi, 9pi, 10pi, 200, 300])))})

Ndef(\blip, {Splay.ar(SinOsc.ar(Decay2.ar(Impulse.ar(1/3), 0.1, 0.1, 300), Decay2.ar(Impulse.ar([1/3, 1.5, 0.125, 2/3]*(114/60)), 0.01, 0.2, [8pi, 9pi, 10pi, 200, 300, 999])))})


//TRand.ar(40, 4000, Impulse.ar(1))

Ndef(\blip).stop



//--Demand:
//  * Duty
//  * Demand
//  * Dseq, Dwhite, Drand, Dseries, Dshuf etc.


Ndef(\dem).play
Ndef(\dem, {SinOsc.ar(Duty.ar(0.125, 0, Dseq([400, 500, 600, 700, 800, 900], inf)))!2});
Ndef(\dem).fadeTime= 4
Ndef(\dem, {SinOsc.ar(Duty.ar(0.125, 0, Dseq([400, 500, 600, 700, 800, 900, 1200, 50000], inf)))!2});

Ndef(\dem, {SinOsc.ar(Duty.ar(MouseX.kr(0, 1), 0, Dseq([MouseY.kr(10, 1000), 500, 600, 700, 800, 900, 1200, 50000], inf)))!2});



Ndef(\dem, {SinOsc.ar(Duty.ar(MouseX.kr(0, 0.5), 0, Dseq((Scale.major.degrees+60).midicps, inf)))!2});

Ndef(\dem, {SinOsc.ar(Duty.ar(MouseX.kr(0, 0.5), 0, Drand((Scale.major.degrees+60).midicps, inf)))!2});

Ndef(\dem, {SinOsc.ar(Duty.ar(MouseX.kr(0, 0.5), 0, Dshuf((Scale.major.degrees+60).midicps, inf)))!2});

Ndef(\dem).stop


Ndef(\ampdem).play
Ndef(\ampdem, {Splay.ar(SinOsc.ar(400, 0, Duty.ar(0.1, 0, Dseq([0, 0, 0.5, 0.4, 0.2, 0.1, 0, 0, 0, 0.5], inf))))})
Ndef(\ampdem).stop



//  Note difference .ar vs .kr

{SinOsc.kr(100)}.plot
{SinOsc.ar(100)}.plot

//  .kr is ControlRate and downsamples + interpolated 44100/64



//--

Ndef(\seq).play

(
Ndef(\seq, {
	var freq= Duty.ar(0.25, 0, Dseq([400, 800, 555, 700, 200, 200], inf));
	var amp= Duty.ar(0.35, 0, Dseq([1, 0, 0, 0, 1, 0.5, 0.25, 0], inf));
	Splay.ar(
		SinOsc.ar(freq, 0, amp)
	);
});
)

//  With added lag / protamento...
(
Ndef(\seq, {
	var freq= Duty.ar(0.25, 0, Dseq([400, 800, 555, 700, 200, 200], inf));
	var amp= Duty.ar(0.35, 0, Dseq([1, 0, 0, 0, 1, 0.5, 0.25, 0], inf));
	Splay.ar(
		SinOsc.ar(freq.lag(0.1), 0, amp.lag(0.05))
	);
});
)

//  With lag controlled by demand...
(
Ndef(\seq, {
	var freq= Duty.ar(0.25, 0, Dseq([400, 800, 555, 700, 200, 200], inf));
	var amp= Duty.ar(0.35, 0, Dseq([1, 0, 0, 0, 1, 0.5, 0.25, 0], inf));
	var lag= Duty.ar(0.45, 0, Dseq([0, 0.01, 0.02, 0.03, 0.06, 0.2]), inf);
	Splay.ar(
		SinOsc.ar(freq.lag(lag), 0, amp.lag(0.05))
	);
});
)

//  Killer feature...
(
Ndef(\seq, {
	var freq= Duty.ar([0.25, 0.2, 0.1, 0.05], 0, Dseq([400, 800, 555, 700, 200, 200], inf));
	var amp= Duty.ar(0.35, 0, Dseq([1, 0, 0, 0, 1, 0.5, 0.25, 0], inf));
	var lag= Duty.ar(0.45, 0, Dseq([0, 0.01, 0.02, 0.03, 0.06, 0.2]), inf);
	Splay.ar(
		SinOsc.ar(freq.lag(lag), 0, amp.lag(0.05))
	);
});
)
Ndef(\seq).stop


//  Creating arrays...
(1..9)
(200, 310.. 5000)


//--

Ndef(\ktest).play
Ndef(\ktest, {Splay.ar(SinOsc.ar(Duty.ar((1..9)/9, 0, Dseq((400, 500..900), inf))))})
Ndef(\ktest).fadeTime= 5
Ndef(\ktest, {Splay.ar(SinOsc.ar(Duty.ar((1..9)/9, 0, Dseq((400, 500..1200), inf))))})
Ndef(\ktest, {Splay.ar(SinOsc.ar(Duty.ar((1..9)/9, 0, Dseq((200, 500..1200), inf))))})
Ndef(\ktest, {Splay.ar(SinOsc.ar(Duty.ar((1..9)/9, 0, Dseq((200, 350..1200), inf))))})
Ndef(\ktest, {Splay.ar(Saw.ar(Duty.ar((1..9)/9, 0, Dseq((200, 500..1200), inf))))})
Ndef(\ktest, {Splay.ar(SinOsc.ar(Duty.ar((1..9)/9, 0, Dseq((200, 500..1200), inf))))})
Ndef(\ktest, {Splay.ar(SinOsc.ar(Duty.ar((1..9)/9, 0, Dseq((200, 599..1200), inf))))})

//  Filter sweep...
Ndef(\ktest).fadeTime= 0.1
Ndef(\ktest, {Splay.ar(BLowPass4.ar(Pulse.ar(Duty.ar((1..9)/9, 0, Dseq((200, 599..1200), inf))), Duty.ar(0.05, 0, Dseries(100, 10, 300)).poll))})

//  Filter sweep + resonance...
Ndef(\ktest, {Splay.ar(BLowPass4.ar(Pulse.ar(Duty.ar((1..9)/9, 0, Dseq((200, 599..1200), inf))), Duty.ar(0.05, 0, Dseries(100, 10, 300)).poll, Duty.ar(0.25, 0, Dseries(1, -0.01, 50)).poll))})

//  Back and forth...
Ndef(\ktest, {Splay.ar(BLowPass4.ar(Pulse.ar(Duty.ar((1..9)/9, 0, Dseq((200, 599..1200), inf))), Duty.ar(0.05, 0, Dseq([Dseries(100, 10, 300), Dseries(3100, -10, 300)], inf)).poll, Duty.ar(0.25, 0, Dseq([Dseries(1, -0.01, 50), Dseries(0.5, 0.01, 50)], inf)).poll))})


Ndef(\ktest).stop


//  Killer feature no2...
//  Dseq, Drand, Dseries, etc can be nested!

Ndef(\nest).play
(
Ndef(\nest, {
	var freq= Duty.ar(0.1, 0, Dseq([400, 500, 600, 700], inf));
	Splay.ar(SinOsc.ar(freq, 0, 0.4));
});
)


(
Ndef(\nest, {
	var freq= Duty.ar(0.1, 0, Dseq([400, 500, Dseq([900, 800, 700, 600], 2), 700], inf));
	Splay.ar(SinOsc.ar(freq, 0, 0.4));
});
)

(
Ndef(\nest, {
	var freq= Duty.ar(0.1, 0, Dseq([400, 500, Dseq([900, Dseq([100, 200, 50], 4), 700, 600], 2), 700], inf));
	Splay.ar(SinOsc.ar(freq, 0, 0.4));
});
)

(
Ndef(\nest, {
	var freq= Duty.ar(0.1, 0, Dseq([Dseq([400, 500, 600, 700, 800], 2), Dseq([500, 600, 2], 2)], inf));
	Splay.ar(SinOsc.ar(freq, 0, 0.4));
});
)

(
Ndef(\nest, {
	var freq= Duty.ar(0.1, 0, Dwrand([400, 500, 600], [0.9, 0.05, 0.05], inf));
	Splay.ar(SinOsc.ar(freq, 0, 0.4));
});
)

(
Ndef(\nest, {
	var freq= Duty.ar(0.1, 0, Dseq([Dseries(400, 50, 10)], inf));
	Splay.ar(SinOsc.ar(freq, 0, 0.4));
});
)

(
Ndef(\nest, {
	var freq= Duty.ar(Dseq([0.1, 0.2, 0.3], inf), 0, Dseq([Dgeom(400, 1.5, 8)], inf));
	Splay.ar(SinOsc.ar(freq, 0, 0.4));
});
)


(
Ndef(\nest, {
	var freq= Duty.ar(0.1, 0, Dseq([Dgeom(Dseq([800, 600, 400, 200, 100], inf), 1.25, 8)], inf)).poll;
	Splay.ar(SinOsc.ar(freq, 0, 0.4));
});
)

Ndef(\nest).stop



//--Demand instead of Duty

Ndef(\ooo).play;
(
Ndef(\ooo, {
	var freq= Dseq([400, 500, 600, 700, 800], inf);
	var trg= Dust.ar(2);
	Splay.ar(SinOsc.ar(Demand.ar(trg, 0, freq).lag(0.1), 0, 0.5));
});
)

//  Regular triggers...
(
Ndef(\ooo, {
	var freq= Dseq([400, 500, 600, 700, 800], inf);
	var trg= Impulse.ar(2);
	Splay.ar(SinOsc.ar(Demand.ar(trg, 0, freq).lag(0.1), 0, 0.5));
});
)

//  Oscillators as triggers...
(
Ndef(\ooo, {
	var freq= Dseq([400, 500, 600, 700, 800], inf);
	var trg= SinOsc.ar(SinOsc.ar(0.1)*10)>0.9;
	Splay.ar(SinOsc.ar(Demand.ar(trg, 0, freq).lag(0.1), 0, 0.5));
});
)

//  Sound input as triggers (tap mic)...
(
Ndef(\ooo, {
	var freq= Dseq([400, 500, 600, 700, 800], inf);
	var trg= Amplitude.ar(SoundIn.ar)>0.15;
	Splay.ar(SinOsc.ar(Demand.ar(trg, 0, freq).lag(0.1), 0, 0.5));
});
)

//  oor sound input as reset...
(
Ndef(\ooo, {
	var freq= Dseries(400, 100, 14);
	var trg= Impulse.ar(10);
	var reset= Amplitude.ar(SoundIn.ar)>0.15;
	Splay.ar(SinOsc.ar(Demand.ar(trg, reset, freq).lag(0.1), 0, 0.5));
});
)

Ndef(\ooo).stop

//  Also see Duty helpfile under resetting.


//  And with Dbufrd and Dbufwr you can implement single sample feedback.
//  Again see Duty helpfile.





//--Pdef

s.boot


(
SynthDef(\sine, {|freq= 400, amp= 0.1, gate= 1|
	var env= EnvGen.ar(Env.asr(0.01, 1, 0.4), gate, doneAction:2);
	var src= SinOsc.ar(freq, 0, amp);
	Out.ar(0, src*env!2);
}).add;
)

a= Synth(\sine)
a.set(\freq, 500)
a.set(\gate, 0)



Pdef(\ett).play
Pdef(\ett, Pbind(\instrument, \sine))
Pdef(\ett, Pbind(\instrument, \sine, \freq, 800, \amp, 0.05))
Pdef(\ett, Pbind(\instrument, \sine, \freq, Pseq([400, 500, 600, 700, 800], inf), \amp, 0.05))
Pdef(\ett, Pbind(\instrument, \sine, \freq, Pseq([400, 500, 600, 700, 800], inf), \amp, 0.05, \dur, 0.125/4))
Pdef(\ett, Pbind(\instrument, \sine, \freq, Pseq([400, 500, 600, 700, 800], inf), \amp, Pseq([0.01, 0.02, 0, 0, 0.1, 0.2], inf), \dur, Pseq([0.1, 0.2, 0.05], inf)*0.1))

(
SynthDef(\sine, {|freq= 400, amp= 0.1, gate= 1|
	var env= EnvGen.ar(Env.asr(0.01, 1, 0.4), gate, doneAction:2);
	var src= Saw.ar(freq, amp);
	Out.ar(0, src*env!2);
}).add;
)

s.plotTree

Pdef(\ett, Pbind(\instrument, \sine, \strum, 0.1, \scale, Scale.lydian, \degree, Pseq([0, 1, 2, 3, 4], inf)*[1, 1.3333, 1.5, 2], \amp, Pseq([0.01, 0.02, 0, 0, 0.1, 0.2], inf), \dur, Pseq([0.1, 0.2, 0.05], inf)*0.5))

Pdef(\ett, Pbind(\instrument, \sine, \strum, 0.1, \scale, Scale.lydian, \degree, Pseq([0, 1, 2, 3, 4], inf)*[1, 1.3333, 1.5, 2], \amp, Pseq([0.01, 0.02, 0, 0, 0.1, 0.2], inf), \dur, Pseq([0.1, 0.2, 0.05], inf)*0.15))

Pdef(\ett).stop




//--

(
SynthDef(\fm, {|freq= 400, amp= 0.1, fmod= 10, gate= 1, atk= 0.01, rel= 0.2|
	var env= EnvGen.ar(Env.asr(atk, 1, rel), gate, doneAction:2);
	var src= SinOsc.ar(0, SinOsc.ar(freq, env*2pi, fmod*env), amp);
	Out.ar(0, Pan2.ar(src)*env);
}).add;
)

Pdef(\test, Pbind(\instrument, \fm, \dur, 0.25, \degree, Pseq([0, 5, 4, 3, 2, 3, 2, 1], inf), \fmod, Pseq([10, 2000, 300], inf), \rel, Pseq([0.01, 0.1, 1], inf))).play


Pdef(\test, Pbind(\instrument, \fm, \dur, 0.25, \degree, Pseq([0, 5, 4, 3, 12, 3, 2, 1], inf), \fmod, Pseq([10, 2000, 300], inf))).play

Pdef(\test2, Pbind(\instrument, \fm, \dur, 0.125, \degree, Pseq([0, 5, 4, 3, 12, 3, 2, 1], inf)/2, \fmod, Pseq([10, 2000, 300], inf))).play

Pdef(\test, Pbind(\instrument, \fm, \dur, Pseq([0.25, 2/3], inf), \degree, Pseq([0, 5, 4, 3, 12, 3, 2, 3, 1], inf), \fmod, Pseq([10, 2000, 300], inf))).play

Pdef(\test).stop
Pdef(\test2).stop


//  Compare...
Pdef(\test, Pmono(\sine, \freq, Pseq([400, 500, 600], inf), \dur, 0.1)).play
Pdef(\test, Pbind(\instrument, \sine, \freq, Pseq([400, 500, 600], inf), \dur, 0.1)).play
Pdef(\test).stop

//  See supercollider example folder under pieces.
//  Read Understanding Streams, Patterns and Events - Part 1 - 7
