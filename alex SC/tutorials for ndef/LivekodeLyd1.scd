//workshop, Livekode lyd - notam, 17-21feb 2014


//--plan first day:
//* discuss some stuff
//    * two fundamental things
//    * 1. sc is really three programs
//        * scide
//        * sclang
//        * scserver
//    * 2. there are multiple ways
//        * {}.play
//        * SynthDef
//        * node messaging
//        * Ndef
//        * other
//* comparison
//    * {}.play vs synthdef vs ndef
//    * Ndef in practice
//    * nesting Ndef
//    * more Ndef examples
//* settings and preferences
//    * tools and channels
//    * startup file
//* making noise with Ndef
//    * a pad
//    * refactoring the pad - indentation
//    * refactoring the pad - modularization


//------------------------------------------------------------------
//--    discuss some stuff
//------------------------------------------------------------------

//--two fundamental things

//* SuperCollider not a single program.
//  It is a system of many programs that all do specific things
//  (sclang, scserver, scide).
//  You can choose to use all or only some of the three programs
//  (eg. only use scserver and control it from processing).
//  And you can exchange programs with other programs
//  (eg. using haskell instead of sclang, or sublime instead of scide).
//  The programs can run locally or distributed on different computers
//  in a network and one sclang can control many scserver programs.
//  But the typical situation is that you run the programs scide,
//  sclang and scserver all together on one laptop (SuperCollider.app).

//* There are many ways to do the same thing within SuperCollider.
//  Code in sc can look very different but still do exactly the same thing
//  (eg. Ndef, {}.play, SynthDef, node message style)
//  There are many systems written within the system by users,
//  often to help or solve some specific task.
//  Depending on preference, habit or optimization, you may choose one way
//  of working over another.
//  All systems have their pros and cons.
//  Typically users pick one or two ways and specialize in using these.

//----------------------------

//--1. sc is really three programs

//  As mentioned the most common practice is to run these programs:
//  * scide
//  * sclang
//  * scserver
//  and they are what you get when you download and install the official
//  SuperCollider application (and these three we will use this week).

//  We use scide to type and run the following code...
s.boot; //start scserver
a= {SinOsc.ar([400, 404])}.play; //sclang code defines a synth and plays it
a.free;


//--scide

//* the "text editor"
//  The integrated development environment we are currently using.
//  Used for code formatting, help files, documents etc.
//  There are lots of alternatives: scwim, gedit plugin, emacs, sublime,
//  textmate, commandline are a few.

//### demo command line ###

//  Open Terminal and type...
cd /Applications/SuperCollider/SuperCollider.app/Contents/Resources/
./sclang
s.boot
0.exit

//  Note the path above might be different on your machine.

//### demo sublime ###
//### demo textmate ###


//--sclang

//* the "language"
//  Functions, network, midi, patterns, timing, clocks and other type of
//  control code including graphics and gui.
//  Used as sort of the score or control of the musicsystem you are creating.
//  Code written in sclang is normally run directly (live coded),
//  or loaded via .scd files or as .sc class files (also quarks)
//  There are a lot of alternative languages you can use instead of sclang.
//  (e.g. overtone, scala collider, haskell, scheme, javascript)


//--scserver

//* the "server"
//  It run synths that consist of unit generators like oscillators,
//  filters, math operations etc and also have functionality like
//  busses, buffers, plugins, groups.
//  Code is written as synthdefs (in sclang above) or as plugins (in c).
//  The server is controlled via a well defined osc protocol.
//  Very stable and hardly ever changes. If all the above is in flux
//  (which code editor/language used, how the language code is written,
//  which extras you have installed etc), this server is what is most
//  commonly running in all supercollider setups.
//  Although even here some are using variations and partial implementations
//  of scserver (eg. coffeecollider).


//----------------------------

//--2. there are multiple ways

//  In SuperCollider there are many ways to do the same or similar things.
//  In the standard sclang there at least three common ways how to code and
//  start a synth (SynthDef/Synth, {}.play, Ndef) and lots of ways how to set
//  up a sequencer (schedule on a clock, Routine, Pbind, Tdef etc)

//  On top of the (roughly) four 'sub-languages' that are inside sclang
//  Itself, users make their own systems and distribute them as extras
//  (Crucial lib, Ctk, IXIlang etc). So there are very many styles and
//  systems out there - and the code/syntax often look very different.
//  It is hard to pick a style or system to start using and it really depends
//  on personal preference and what you want to do.
//  Sometimes it is a problem when helpfiles and examples are written in one
//  style and you want to work in another.
//  So of course it is good to know many styles of coding so that you can
//  translate between examples. But lots of styles is also confusing for
//  beginners and mixing styles (as is common when you cannot separate them)
//  often lead to big problems.


//--{}.play

{SinOsc.ar}.play
{Saw.ar(500)}.play

//  A very common way to quickly prototype or test something.
//  Fun for playing around, trying and learning about things.
//  Not so suitable for more advanced/stable programs.
//  see Function helpfile under audio.


//--SynthDef

SynthDef(\abc, {Out.ar(0, SinOsc.ar(600))}).add;
Synth(\abc)

//  The official and possibly most common way to code synths.
//  Fixed and reusable code.
//  See SynthDef helpfile


//--node messaging

s.sendMsg("/s_new", "default", 1234)
s.sendMsg("/n_free", 1234)

//  Low level and seldom used, but very fast.
//  Good for granular synthesis or backend code
//  (eg. mixers and router modules).
//  See Node Messaging helpfile.


//--Ndef (jitlib)

Ndef(\key, {SinOsc.ar(700)}).play

//  Best for livecoding but also for prototyping as well as stable programs.
//  See Ndef helpfile


//--other styles

//  * Ctk quark
//  * Instr and Patch from crucial lib
//  * ddw quark
//  * IXIlang
//  * Unit lib
//  * sctweets
//  * proxyspace from jitlib
//  etc.


//------------------------------------------------------------------
//--    comparison
//------------------------------------------------------------------

s.boot

//--{}.play vs synthdef vs ndef

//  Note that this code shows a problem.
a= {|freq= 400| SinOsc.ar(freq, 0, 0.1)}.play
{SinOsc.ar(700, 0, 0.1)}.play
a.set(\freq, 300)
a.free

//  cmd+. to stop

//* {}.play pros:
//  Quick and short.
//* {}.play cons:
//  Have to stop the sound and create new to change anything.
//  Can not create more of the same (compare synthdef).
//  Have to store in a variable to access and control later.


(
SynthDef(\test, {|freq= 400|
	Out.ar(0, SinOsc.ar(freq, 0, 0.1));
}).add;
)
a= Synth(\test)
a.set(\freq, 300)
a.free
b= Synth(\test)
Synth(\test, [\freq, 800])
Synth(\test, [\freq, 700])
Synth(\test, [\freq, 600])
Synth(\test, [\freq, 500])
Synth(\test, [\freq, 100])

//  cmd+. to stop

//* synthdef pros:
//  Great for creating many of the same synth objects.
//* synthdef cons:
//  Have to stop the sound and create new to change anything.
//  More to type.
//  Have to store in a variable to access and control later.


Ndef(\first, {SinOsc.ar(400)})
Ndef(\first).play
Ndef(\first).stop
Ndef(\first, {|freq= 400| SinOsc.ar(freq)})
Ndef(\first).play
Ndef(\first).set(\freq, 300)

Ndef(\first).play
Ndef(\first, {SinOsc.ar(60.1)})

//  cmd+. to stop

//* ndef pros:
//  Easy to change everything and no need to stop in between.
//  Control and access later by referring to ndef by name.
//  Can embed or nest into each other - seamless patching.
//  Perfect for improvisation with sounding code.
//* ndef cons:
//  Adds some overhead.
//  Easy to loose track and repeat - see History below.


//--Ndef in practice

//  So Ndef has a few killer features...
//  * Swap code while running
//  * And swap with a crossfade (fadeTime)

//  Note there are two different fadeTime for Ndef...
Ndef(\first).play(fadeTime: 5) //start playing 5sec fadein
Ndef(\first).fadeTime= 3 //set crossfade time
Ndef(\first, {Saw.ar(400, 0.2)})
Ndef(\first, {WhiteNoise.ar(0.15)})
Ndef(\first).stop(fadeTime: 5) //stop playing 5sec fadeout

//  The fadeTime for play and stop are not the same as the
//  crossfade time set with fadeTime= ...

Ndef(\second, {SinOsc.ar(500, 0, 0.5)})
Ndef(\second).play
Ndef(\second).stop
Ndef(\second, {Pulse.ar(600, 0.5, 0.5)})
Ndef(\second).play
Ndef(\second).stop

Ndef(\third, {LPF.ar(Ndef.ar(\second))})
Ndef(\third).play
Ndef(\third, {BPF.ar(Ndef.ar(\second), 500, 0.1)})
Ndef(\third).stop


//--nesting Ndef
Ndef(\brus, {WhiteNoise.ar(0.5)})
Ndef(\filter, {LPF.ar(Ndef.ar(\brus), 600)})
Ndef(\filter).play
Ndef(\filter).fadeTime= 5
Ndef(\filter, {LPF.ar(Ndef.ar(\brus), 300)})
Ndef(\filter).stop


Ndef(\fm, {SinOsc.ar(Ndef.ar(\ctrl)*400, 0, 0.1)})
Ndef(\fm).play
Ndef(\ctrl, {SinOsc.ar(2)})
Ndef(\ctrl).fadeTime= 5

//  exercice:
//  AM with replaceable \ctrl and fadeTime set to 10.

Ndef(\am, {SinOsc.ar(500, 0, Ndef.ar(\ctrl))})
Ndef(\am).play
Ndef(\ctrl, {SinOsc.ar(5)})
Ndef(\ctrl).fadeTime= 10
Ndef(\ctrl, {SinOsc.ar(2)})
Ndef(\ctrl, 0)
Ndef(\ctrl, {SoundIn.ar}) //uses mic input as amp control
Ndef(\kaos, {LFNoise0.ar(4)})
Ndef(\ctrl, {Ndef.ar(\kaos)})

Ndef(\am).stop


//--more Ndef examples

Ndef(\vvv, {PinkNoise.ar(MouseX.kr(0, 1))})
Ndef(\vvv).play
Ndef(\vvv, {PinkNoise.ar(SinOsc.ar(MouseX.kr(0, 4)))})
Ndef(\vvv).stop

History.start
History.makeWin
//History.end


//  exercice:
\xxx //reads mouseX
\yyy //pulsating pink noise depending on mousex

Ndef(\xxx, {MouseX.kr(0, 4)})
Ndef(\yyy, {PinkNoise.ar(SinOsc.ar(Ndef.ar(\xxx)))})
Ndef(\yyy).play

Ndef(\xxx).rate
Ndef(\yyy).rate

//  Discuss pros and cons, hidden features (gui),
//  and hidden traps (fadetime, numChannels)


//------------------------------------------------------------------
//--    settings and preferences
//------------------------------------------------------------------

//--tools and channels

s //by default this variable points to the local server
s.boot //cmd+b
s.meter //cmd+m
s.scope

Ndef(\k).play(0, 3)
Ndef(\k, {SinOsc.ar([400, 500, 600])})
Ndef(\k).numChannels
Ndef.clear

Ndef(\k).play
Ndef(\k, {SinOsc.ar([400, 500, 600])})
Ndef(\k).numChannels
Ndef.clear


Ndef(\h).play //Observe: creates a stereo ndef
Ndef(\h, {Splay.ar(SinOsc.ar(400))})
Ndef(\h, {SinOsc.ar(400)})

//  Look at scope window

{Splay.ar(SinOsc.ar([300, 400, 500, 600,700]))}.play//mono
{SinOsc.ar(MouseX.kr(40, 4000, 1)).dup(2)}.play//stereo
{SinOsc.ar(MouseX.kr(40, 4000, 1)).dup(8)}.play//8-channels


//--startup file

//  See File/OpenStartupFile

//  Example setup (modify and copy to startup file, save, restart):
Server.local.options.device= "Fireface 400 (30D)";
Server.local.options.numInputBusChannels= 18;
Server.local.options.numOutputBusChannels= 18;
Server.local.options.sampleRate= 96000;
Server.local.latency= 0.05;
Server.local.options.memSize= 65536;


//------------------------------------------------------------------
//--    making noise with ndef
//------------------------------------------------------------------

Ndef(\one).play //create and start playing a stereo ndef

Ndef(\one, {BrownNoise.ar(SinOsc.ar(1))}) //define what this ndef should do

Ndef(\one, {WhiteNoise.ar(0.1)}) //redefine that this ndef should do

Ndef(\one).release(2) //fade out and stop




//--a pad
Ndef(\pad).play

Ndef(\pad, {Splay.ar( Saw.ar([400, 500, 404, 660], [0.2, 0.2, 0.2, 0.1] ))})
Ndef(\pad).fadeTime= 3
Ndef(\pad, {Splay.ar( Saw.ar([1430.40, 520, 404, 640.4], [0.2, 0.2, 0.2, 0.1] ))})
Ndef(\pad, {Splay.ar( BLowPass4.ar( Saw.ar([404, 505, 606, 707], [0.4, 0.3, 0.2, 0.5]), 2000, 0.8))})

//  All detuned by same noise oscillator.
Ndef(\pad, {Splay.ar( BLowPass4.ar( Saw.ar([404, 505, 606, 707]+LFNoise2.ar(0.1, 10), [0.4, 0.3, 0.2, 0.5]), 2000, 0.8))})

//  Individually detuned (by 4 noise oscillators).
Ndef(\pad, {Splay.ar( BLowPass4.ar( Saw.ar([404+LFNoise2.ar(0.1, 10), 505+LFNoise2.ar(0.1, 10), 606+LFNoise2.ar(0.1, 10), 707+LFNoise2.ar(0.1, 10)], [0.4, 0.3, 0.2, 0.5]), 2000, 0.8))})

//  Same thing but written with shortcut code (!4).
Ndef(\pad, {Splay.ar( BLowPass4.ar( Saw.ar([404, 505, 606, 707]+LFNoise2.ar(0.1!4, 30), [0.4, 0.3, 0.2, 0.5]), 2000, 0.8))})

//  Adding 4 noise oscillators for amplitude modulation.
Ndef(\pad, {Splay.ar( BLowPass4.ar( Saw.ar([404, 505, 606, 707]+LFNoise2.ar(0.1!4, 30), [0.4, 0.3, 0.2, 0.5]+LFNoise2.ar(0.1!4, 0.1)), 2000, 0.8))})


//--refactoring the pad - indentation
(
Ndef(\pad, {
	Splay.ar(
		BLowPass4.ar(
			Saw.ar(
				[404, 505, 606, 707]+LFNoise2.ar(0.1!4, 30),
				[0.4, 0.3, 0.2, 0.5]+LFNoise2.ar(0.1!4, 0.1)
			),
			2000,//cutoff freq for filter
			0.8//q for filter
		)
	)
})
)

//--refactoring the pad - modularization
(
Ndef(\padFreqs, {[404, 505, 606, 707]+LFNoise2.ar(0.1!4, 30)});
Ndef(\padAmps, {[0.4, 0.3, 0.2, 0.5]+LFNoise2.ar(0.1!4, 0.1)});
Ndef(\pad, {
	Splay.ar(
		BLowPass4.ar(
			Saw.ar(
				Ndef.ar(\padFreqs),
				Ndef.ar(\padAmps)
			),
			2000,//cutoff freq for filter
			0.8//q for filter
		)
	)
});
)

//--improving the pad

//  Adding two more ndefs for the filter parameters.
(
Ndef(\padFreqs, {[404, 505, 606, 707]+LFNoise2.ar(0.1!4, 30)});
Ndef(\padAmps, {[0.4, 0.3, 0.2, 0.5]+LFNoise2.ar(0.1!4, 0.1)});
Ndef(\padCut, 2000);
Ndef(\padQ, 0.8);
Ndef(\pad, {
	Splay.ar(
		BLowPass4.ar(
			Saw.ar(
				Ndef.ar(\padFreqs),
				Ndef.ar(\padAmps)
			),
			Ndef.ar(\padCut),//cutoff freq for filter
			Ndef.ar(\padQ)//q for filter
		)
	)
});
)

Ndef(\padFreqs).fadeTime= 10
Ndef(\padFreqs, 500);
Ndef(\padFreqs, {SinOsc.ar(1)*10+500})
Ndef(\padFreqs, {SinOsc.ar([1, 1.1])*10+500})
Ndef(\padFreqs, {SinOsc.ar([1, 1.1, 1.2])*[10, 20, 30]+500})

Ndef(\padAmps).fadeTime= 2
Ndef(\padAmps, {0.5+LFNoise0.ar(1!4, 0.1)});

Ndef(\padFreqs, {LFSaw.ar([1, 1.1, 1.2])*[10, 20, 30, 44]+500})

Ndef(\padFreqs, {[404, 505, 606, 707, 808, 909, 1100, 3000]+LFNoise2.ar(30!14, 40)});

Ndef(\pad).stop(4)


//--tangents

//  Comparing LFNoise variants
{[LFNoise0.ar(100), LFNoise1.ar(100), LFNoise2.ar(100)]}.plot(0.1)

//  List of ugens used so far...
//  * SinOsc
//  * Saw
//  * Pulse
//  * LFSaw
//  * WhiteNoise
//  * PinkNoise
//  * BrownNoise
//  * LFNoise0
//  * LFNoise1
//  * LFNoise2
//  * BLowPass4
//  * LPF
//  * BPF
//  * Splay
//  * SoundIn

//  .range is a useful helper method.
LFNoise2.ar(0.1).range(400, 600)

//  record soundfiles
s.makeWindow //and press record button

s.record //or start it directly
s.stopRecording


//  StageLimiter
//  Extra safety when playing around with code.
Quarks.install("BatLib")
StageLimiter.activate
{Saw.ar(400, 5)}.play //Warning: very loud without stage limiter
StageLimiter.deactivate
