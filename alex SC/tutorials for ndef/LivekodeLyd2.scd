//workshop, Livekode lyd - notam, 17-21feb 2014


//--troubleshooting s.boot

//  If you have issues with booting the server, check these things...

//  scserver will sometimes complain about wrong sampling rate.
//  Other applications might have changed it (to 48KHz) and sc
//  can not change it back by it self. So open audiomidi setup
//  from utilities folder and make sure the samplerate is 44.1
//  for both built-in input and built-in output.

//  The other issue is that you might have zombie scservers.
//  These are scservers that has not quit properly because of
//  sclang crashing or your computer going to sleep or something
//  like that. Fix it but forcing it/them to quit..

Server.killAll
s.boot


//--warmup

s.boot

Ndef(\sines).play
Ndef(\sines, {Splay.ar(SinOsc.ar([300, 400, 500, 600]))})
Ndef(\sines).fadeTime= 5

Ndef(\sines, {Splay.ar(SinOsc.ar([300, 500, 133, 440, 150, 660.6]))})

Ndef(\sines, {Splay.ar(SinOsc.ar([99, 202, 303, 404, 505.5, 606, 707, 808, 909]))})
Ndef(\sines, {Splay.ar(SinOsc.ar([50, 60, 70, 80, 99]*3))})
Ndef(\sines, {Splay.ar(SinOsc.ar([50, 60, 70, 80, 99]*3.33333))})
Ndef(\sines, {Splay.ar(SinOsc.ar([50, 60, 70, 80, 99]*4))})
Ndef(\sines).stop(8)

Ndef(\saws).play
Ndef(\saws, {Splay.ar(Saw.ar([400, 404, 505], 0.4))})
Ndef(\saws, {Splay.ar(Saw.ar([400, 404, 505, 606], 0.4))})
Ndef(\saws, {Splay.ar(Saw.ar([400, 404, 505, 810], 0.4))})
Ndef(\saws).fadeTime= 1
Ndef(\saws, {Splay.ar(Saw.ar([XLine.ar(900, 400, 5), 404, 505, 810], 0.4))})
Ndef(\saws, {Splay.ar(Saw.ar([XLine.ar(900, 400, 5), XLine.ar(1000.rand, 404, 10), XLine.ar(1000.rand, 505, 8), XLine.ar(1000.rand, 810, 12)], 0.4))})

(
Ndef(\saws, {Splay.ar(
	Saw.ar([
		XLine.ar(900, 400, 5),
		XLine.ar(1000.rand, 404, 10),
		XLine.ar(1000.rand, 505, 8),
		XLine.ar(1000.rand, 810, 12),
		XLine.ar(1000.rand, 810, 12)
	], 0.4)
)});
)

//  Also try with Line instead of XLine
//  (Line is linear ramping, XLine exponential)
//  or rrand(500.0, 1000.0) for range random.

//  Lots of saws starting out at random frequencies but always
//  end at the same place. Run many times.
(
Ndef(\saws, {Splay.ar(
	Saw.ar(
		[400, 404, 505, 810, 1000, 2000].collect{|v| XLine.ar(1000.rand+50, v, 5.rrand(15.0))},
		0.4
	)
)});
)

Ndef(\saws).stop

//  A technique for turning an array of frequencies into an array
//  of sine oscillator ugens.
[400, 500, 600].collect{|x| SinOsc.ar(x)}


//--new example

Ndef(\abc).play
Ndef(\abc, {Splay.ar(PinkNoise.ar*Decay.ar(Dust.ar(1), 0.2))})
Ndef(\abc, {Splay.ar(PinkNoise.ar*Decay.ar(Dust.ar([1, 1]), 0.2))})
Ndef(\abc, {Splay.ar(PinkNoise.ar*Decay.ar(Dust.ar([1, 1, 1]), 0.2))})

Ndef(\abc, {Splay.ar(PinkNoise.ar*Decay.ar(Dust.ar([1, 1, 1, 1, 1, 1, 1, 1]), 0.2))})


{Decay.ar(Dust.ar(1), 0.2)}.plot(1) //rougly one trigger per second
{Decay.ar(Dust.ar(10), 0.2)}.plot(1) //roughly ten triggers per second

//  With a filter,
Ndef(\abc, {Splay.ar(BLowPass4.ar(PinkNoise.ar*Decay.ar(Dust.ar([1, 1, 1, 1, 1, 1, 1, 1]), 0.2), [100, 200, 300, 400, 500, 600, 700, 800], 0.2))})

//  Same but written more compact,
Ndef(\abc, {Splay.ar(BLowPass4.ar(PinkNoise.ar*Decay.ar(Dust.ar(1!8), 0.2), (1..8)*100, 0.2))})

//  Now with 15 instead of 8 channels.
Ndef(\abc, {Splay.ar(BLowPass4.ar(PinkNoise.ar*Decay.ar(Dust.ar(1!15), 0.2), (1..15)*500, 0.2))})

// Note how multichannel expansion can trick you.
Dust.ar(1)!15 //15 copies of the same dust object
Dust.ar(1!15) //15 unique dust objects

//  Change over 10 seconds.
Ndef(\abc, {Splay.ar(BLowPass4.ar(PinkNoise.ar*Decay.ar(Dust.ar(1!15), 0.2), XLine.ar((1..15)*100, (1..15)*1000, 10), 0.2))})

Ndef(\abc, {Splay.ar(BLowPass4.ar(WhiteNoise.ar*Decay2.ar(Dust.ar(1!15), 0.5, 1), XLine.ar((1..15)*100, (1..15)*1000, 10), 0.08))})

Ndef(\abc, {Splay.ar(Ringz.ar(WhiteNoise.ar*Decay2.ar(Dust.ar(1!15), 0.5, 1), XLine.ar((1..15)*100, (1..15)*1000, 10), 0.08))})

Ndef(\abc, {Splay.ar(Ringz.ar(WhiteNoise.ar*Decay2.ar(Impulse.ar((1..15)*0.05), 0.5, 1), XLine.ar((1..15)*100, (1..15)*1000, 10), 0.08))})

//  Play with Line as a controller for Dust density.
Ndef(\abc, {Splay.ar(BLowPass4.ar(PinkNoise.ar*Decay.ar(Dust.ar(Line.ar(0.01, 10, 20)!8), 0.2), (1..8)*100, 0.2))})

//  Or a sine that controls all dust densities.
Ndef(\abc, {Splay.ar(BLowPass4.ar(PinkNoise.ar*Decay.ar(Dust.ar(SinOsc.ar(0.1).range(0.01, 20)!8), 0.2), (1..8)*100, 0.2))})

//  Exponential instead of linear
Ndef(\abc, {Splay.ar(BLowPass4.ar(PinkNoise.ar*Decay.ar(Dust.ar(SinOsc.ar(0.1).exprange(0.01, 20)!8), 0.2), (1..8)*100, 0.2))})

Ndef(\abc).stop


//--safety when experimenting with code

//  It is recommended to install and activate the StageLimiter class.

Quarks.checkoutAll
Quarks.install("BatLib")
StageLimiter.activate

//  Note: needs to be activated after each reboot.


//--new example

Ndef(\xyz).play
Ndef(\xyz, {Splay.ar(PinkNoise.ar*Decay.ar(Dust.ar(1!8), 0.2))})

Ndef(\xyz, {Splay.ar(PinkNoise.ar*Decay.ar(Impulse.ar(1!8), 0.2))})

Ndef(\xyz, {Splay.ar(PinkNoise.ar*Decay.ar(Impulse.ar(1!8, [0.1, 0.2, 0.3, 0.4, 0.5, 0.6, 0.7, 0.8]), 0.2))})

Ndef(\xyz, {Splay.ar(PinkNoise.ar*Decay.ar(Impulse.ar(1!8, {1.0.rand}!8), 0.2))})

Ndef(\xyz).fadeTime= 5

//--same but different
Ndef(\xyz, {Splay.ar(PinkNoise.ar*Decay.ar(Ndef.ar(\triggers), 0.2))})
Ndef(\triggers, {Impulse.ar([1, 1.1])})
Ndef(\triggers).fadeTime= 8
Ndef(\triggers, {Dust.ar([1, 1])})
Ndef(\triggers, {Dust.ar([1, 2, 3, 4, 5])})

//  Adding a resonating filter.
Ndef(\xyz, {Splay.ar(Ringz.ar(PinkNoise.ar*Decay.ar(Dust.ar((1..8)*1.01), 0.2), (1..8)*100+300, 0.3))})

Ndef(\freqs).clear
Ndef(\freqs, (1..8)*100+300) //note without {} here
Ndef(\freqs).numChannels //should say eight
Ndef(\xyz, {Splay.ar(Ringz.ar(PinkNoise.ar*Decay.ar(Dust.ar((1..8)*1.01), 0.2), Ndef.ar(\freqs), 0.3))})
Ndef(\freqs).fadeTime= 5
Ndef(\freqs, (1..8)*100+400) //raise everything 100Hz

//  Back to simplicity.
Ndef(\xyz, {Splay.ar(Ringz.ar(Impulse.ar([1, 1.1, 1.2]), [500, 505, 550], [0.1, 0.05, 0.01]))})

Ndef(\xyz).stop(4)



//--throw away gui

Ndef(\ttest).play
Ndef(\ttest, {SinOsc.ar([400, 404])})
Ndef(\ttest).gui

//  Note that there are no sliders in the main area - only the default volume at the top.
//  Open the meter window (cmd+m) and try the number box - it sets the output bus.
//  Try the paus/resume button.

//  The send button reevaluates the Ndef.
//  This button is useful if your Ndef contains randomness. To try it first run this...
Ndef(\ttest, {SinOsc.ar([400, 404]+Rand(40))})
//and then press 'send'. the Ndef generates a random value each time

//  Now run this line - it only adds two arguments to the ndef.
Ndef(\ttest, {|freq= 400, detune= 4, amp= 1| SinOsc.ar([freq, freq+detune], 0, amp)})
//note how two sliders popped up in the main area of the gui.

//  And after this line you should have four sliders...
Ndef(\ttest, {|freq= 400, detune= 4, amp= 1, pmod= 0| SinOsc.ar([freq, freq+detune], SinOsc.ar(pmod), amp)});

//  And now five...
Ndef(\ttest, {|freq= 400, detune= 4, amp= 0.3, pmod= 0, pamp= 3| SinOsc.ar([freq, freq+detune], SinOsc.ar(pmod, 0, pamp), amp)});
Ndef(\ttest).gui
//  But the gui window is too small to see all five at the same time,
//  So let us create a new one with lots of slots...
Ndef(\ttest).gui(15)//15 possible argument slots



//Another gui is the NdefMixer. See it as a master mixer or overview for all your Ndefs.

NdefMixer(s)
//click the edit button to access the argument controller sliders for each Ndef.



//Spec is used to set range and curvature for sliders.
//Here we set pamp to go between -40 and 40 with a linear curve.
Spec.add(\pamp, [-40, 40, \lin]);
//Now open a new mixer and click edit to see the result.
NdefMixer(s)





//--new example

s.boot

Ndef(\ggg).play
Ndef(\ggg, {Splay.ar(SinOsc.ar(0, SinOsc.ar(400, 0, 2pi)))})
Ndef(\ggg).gui

Ndef(\ggg, {|freq= 400, freq2= 0, aamp= 2pi| Splay.ar(SinOsc.ar(freq2, SinOsc.ar(freq, 0, aamp)))})
Ndef(\ggg).gui

(
Ndef(\ggg, {|freq= 400, freq2= 0, aamp= 2pi|
	var detune= [0.99, 1, 1.01];
	Splay.ar(SinOsc.ar(freq2*detune, SinOsc.ar(freq*detune, 0, aamp)));
});
)
Ndef(\ggg).gui


(
Ndef(\ggg, {|freq= 400, freq2= 0, aamp= 2pi|
	var detune= [0.99, 1, 1.01]+LFNoise0.ar(0.2).range(0.5, 2);
	Splay.ar(SinOsc.ar(freq2*detune, SinOsc.ar(freq*detune, 0, aamp)));
});
)

Spec.specs

//  Post all currently available specs.
Spec.specs.keysValuesDo{|k, v| [k, v].postln}; ""


Ndef(\ggg).stop



//--one more level

Ndef(\hhh).play
(
Ndef(\hhh, {|freq= 400, amp= 0.5, aamp= 2pi, bamp= 3pi, freqa= 0, freqb= 0|
	Splay.ar(
		SinOsc.ar(
			freqb,
			SinOsc.ar(freqa,
				SinOsc.ar(freq, 0, aamp),
				bamp),
			amp
		)
	)
});
)

Ndef(\hhh).gui(10)

(
Ndef(\hhh, {|freq= 400, amp= 0.5, aamp= 2pi, bamp= 3pi, freqa= 0, freqb= 0|
	var detune= [0.99, 1, 1.01];
	Splay.ar(
		SinOsc.ar(
			freqb*detune,
			SinOsc.ar(freqa*detune,
				SinOsc.ar(freq*detune, 0, aamp),
				bamp),
			amp
		)
	)
});
)

Ndef(\hhh).set(\freq, 700)
Ndef(\hhh).set(\freq, 500)


(
Ndef(\hhh, {|freq= 400, amp= 0.5, aamp= 2pi, bamp= 3pi, freqa= 0, freqb= 0|
	var detune= [0.99, 1, 1.01]+SinOsc.ar(100, 0, 0.1);
	Splay.ar(
		SinOsc.ar(
			freqb*detune,
			SinOsc.ar(freqa*detune,
				SinOsc.ar(freq*detune, 0, aamp),
				bamp),
			amp
		)
	)
});
)

Ndef(\hhh).set(\freq, 400, \amp, 0.5, \aamp, 0.4, \bamp, 0.3, \freqa, 0.01, \freqb, 0.22)


Ndef(\fff, {SinOsc.ar(1).range(400, 500)})
Ndef(\hhh).map(\freq, Ndef(\fff))

Ndef(\hhh).gui(10)

Ndef(\hhh).stop



//--last examples

Ndef(\iii).play
(
Ndef(\iii, {|freq= 400, amp= 0.5, freq2= 0, freq3= 0|
	Splay.ar(SinOsc.ar(0, SinOsc.ar(freq, LFSaw.ar(freq2).lag(0.01), LFSaw.ar(freq3*10)), amp));
});
)
Ndef(\iii).set(\freq2, 100, \freq3, 0.2)

Ndef(\iii).set(\freq, 300)
Ndef(\iii).fadeTime= 4
Ndef(\iii).xset(\freq, 400)
Ndef(\iii).xset(\freq, 1200)
Ndef(\iii).xset(\freq, 800)
Ndef(\iii).stop


Ndef(\jjj).play
(
Ndef(\jjj, {|freq= 400, amp= 0.5, freq2= 500, freq3= 0.25|
	Splay.ar(SinOsc.ar(0, SinOsc.ar(freq, LFSaw.ar(freq2).lag(0.01), LFSaw.ar(freq3*10)), amp));
});
)

Ndef(\jjj)[1]= \set -> Pbind(\degree, Pseq([0, 5, 4, 3, 1, 2, 1], inf), \amp, 0.5, \scale, Scale.minor, \dur, 1)

Ndef(\jjj)[1]= \set -> Pbind(\degree, Pseq([0, 5, 4, 3, 1, 2, 1], inf)+12, \amp, Pseq([0.5, 0.01], inf), \scale, Scale.minor, \dur, Pseq([0.5, 0.25, 0.125], inf)*1.01)
Ndef(\jjj)[2]= \set -> Pbind(\degree, Pseq([0, 5, 4, 3, 1, 2, 1], inf)-12, \amp, Pseq([0.5, 0.01], inf), \scale, Scale.minor, \dur, Pseq([0.5, 0.25, 0.125], inf)*1.01)
Ndef(\jjj)[3]= \set -> Pbind(\degree, Pseq([0, 5, 4, 3, 1, 2, 1], inf), \freq2, Pseq([10, 20, 30, 40, 50], inf), \amp, Pseq([0.5, 0.01], inf), \scale, Scale.minor, \dur, Pseq([0.5, 0.25, 0.125], inf)*1.01)

Ndef(\jjj).stop(3)


Ndef(\blend).play

(
Ndef(\blend, {
	Splay.ar(SinOsc.ar(
		SelectXFocus.ar(MouseX.kr(0, 2), ([
			Scale.chromatic.degrees,
			Scale.major.degrees,
			Scale.minor.degrees
		]+60).midicps
		)
	))
})
)
//  Use the mouse to cross fade between chromatic, major and minor clusters.


/*
Jem Finer
http://longplayer.org
(sc2)
*/
