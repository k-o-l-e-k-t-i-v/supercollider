//workshop, Livekode lyd - notam, 17-21feb 2014



s.boot
StageLimiter.activate//optional but recommended


//--warmup

Ndef(\tor).play
Ndef(\tor).fadeTime= 5
Ndef(\tor, {Splay.ar(LFPulse.ar(400)*0.3)})

Ndef(\tor, {Splay.ar(LFPulse.ar([400, 404])*0.3)})

Ndef(\tor, {Splay.ar(LFPulse.ar([400, 404]+LFPulse.ar(14, 0, 0.3, 100))*0.3)})

Ndef(\tor, {Splay.ar(LFPulse.ar([400, 404, 500, 505]+LFPulse.ar([13, 14], 0, 0.3, 100))*0.3)})

Ndef(\tor, {Splay.ar(LFPulse.ar([400, 404, 500, 505]*[0.5, 1, 1.3333]+LFPulse.ar([13, 14, 15], 0, 0.3, 100))*0.3)})

Ndef(\tor, {Splay.ar(LFPulse.ar([400, 404, 500, 505]*[0.5, 1, 1.3333]+LFPulse.ar([13, 14, 15], 0, 0.3, 100)*LFPulse.ar([1, 2, 3], 0, 0.6, 0.2, 1))*0.3)})

Ndef(\tor).stop

Ndef(\efx).play
Ndef(\efx, {BLowPass.ar(Ndef.ar(\tor), MouseX.kr(400, 4000, 1), MouseY.kr(0.01, 2))})
Ndef(\tor, {Splay.ar(LFPulse.ar([400, 404, 500, 505]*[0.5, 1, 1.3333]+LFPulse.ar([13, 14, 15], 0, 0.3, 100)*LFPulse.ar([1, 2, 3], 0, 0.6, 0.2, 1)*LFPulse.ar(0.25, 0, 0.5, 0.1, 1))*0.3)})

Ndef(\efx).stop(5)




//--more about Low-Frequency oscillators

Ndef(\tri).play
Ndef(\tri, {Splay.ar(LFTri.ar(400))})
Ndef(\tri).fadeTime= 5
Ndef(\tri, {Splay.ar(LFTri.ar(LFTri.ar(1)*400+500))})
Ndef(\tri, {Splay.ar(LFTri.ar(LFTri.ar([1, 1.01])*400+[500, 600, 700, 800]))})

Ndef(\tri, {Splay.ar(LFTri.ar(LFTri.ar([1, 1.01, 1.02, 1.03])*LFTri.ar(0.5, 0, 400, 600)+[500, 600, 700, 800]))})

Ndef(\tri, {Splay.ar(LFTri.ar(LFTri.ar([1, 1.01, 1.02, 1.03]*LFTri.ar(0.1))*LFTri.ar(0.5, 0, 400, 600)+[500, 600, 700, 800]))})

a= LFSaw;
Ndef(\tri, {Splay.ar(a.ar(a.ar([1, 1.01, 1.02, 1.03]*a.ar(0.1))*a.ar(0.5, 0, 400, 600)+[500, 600, 700, 800]))})

a= LFPulse;
Ndef(\tri, {Splay.ar(a.ar(a.ar([1, 1.01, 1.02, 1.03]*a.ar(0.1))*a.ar(0.5, 0, 400, 600)+[500, 600, 700, 800]))})

a= SinOsc;
Ndef(\tri, {LeakDC.ar(Splay.ar(a.ar(a.ar([1, 1.01, 1.02, 1.03]*a.ar(0.1))*a.ar(0.5, 0, 400, 600)+[500, 600, 700, 800])))})

a= Blip;
Ndef(\tri).rebuild
a= LFPar;
Ndef(\tri).rebuild
a= LFCub;
Ndef(\tri).rebuild
a= Formant;
Ndef(\tri).rebuild
a= Saw;
Ndef(\tri).rebuild
a= Gendy2;
Ndef(\tri).rebuild
a= PinkNoise;
Ndef(\tri).rebuild
s.scope
Ndef(\tri).stop

//  See Tour of UGens helpfile for ideas.



//--math methods

Ndef(\tri).clear
Ndef(\tri).play
Ndef(\tri, {Splay.ar(LFTri.ar(400, 0, 0.4))})
s.scope //open scope and make it big
Ndef(\tri, {Splay.ar(LFTri.ar(400, 0, 2pi).sin)})
Ndef(\tri, {Splay.ar(LFTri.ar(400, 0, 2pi).cos)})
Ndef(\tri, {Splay.ar(LFTri.ar(400, 0, 2pi).tanh)})
Ndef(\tri, {Splay.ar(LFTri.ar(400, 0, 1).round(0.1))})
Ndef(\tri, {Splay.ar(LFTri.ar(400, 0, 1).round(0.5))})
Ndef(\tri, {Splay.ar(LFTri.ar(400, 0, 1).round(1))})
Ndef(\tri, {Splay.ar(LFTri.ar(400, 0, 1).lag(0.003))})
Ndef(\tri, {Splay.ar(LFTri.ar(400, 0, 1).lag3(0.001))})
Ndef(\tri, {Splay.ar(LFTri.ar(400, 0, 1).lagud(0, 0.01))})

Ndef(\tri, {Splay.ar(LFTri.ar(400, 0, 1).round(MouseX.kr(0, 1)))})

Ndef(\tri, {Splay.ar(LFTri.ar(400, 0, 1).lagud(MouseX.kr(0, 0.01), MouseY.kr(0, 0.01)))})

Ndef(\tri, {Splay.ar(LFTri.ar(400, 0, 1).floor)})
Ndef(\tri, {Splay.ar(LFTri.ar(400, 0, 1).abs)})
Ndef(\tri, {Splay.ar(LFTri.ar(400, 0, 1).fold(-0.5, 0.5))})
Ndef(\tri, {Splay.ar(LFTri.ar(400, 0, 1).wrap(-0.5, 0.5))})
Ndef(\tri, {Splay.ar(LFTri.ar(400, 0, 1)%0.5)})

Ndef(\tri, {Splay.ar(LFTri.ar(400, 0, 1)|LFTri.ar(100, 0, 2.1))})

Ndef(\tri, {Splay.ar(LFTri.ar(400, 0, 10)&LFTri.ar(101, 0, 3))})

Ndef(\tri, {Splay.ar(LFTri.ar(400, 0, 10)&LFTri.ar(10.1, 0, 3))})

Ndef(\tri, {Splay.ar(LFTri.ar(400, 0, 10)|LFTri.ar(1.1, 0, 3))})

Ndef(\tri, {Splay.ar(LFTri.ar(400, 0, 10).bitXor(LFTri.ar(2.1, 0, MouseX.kr(1, 10))))})

Ndef(\tri, {Splay.ar(LFTri.ar(400, 0, MouseY.kr(1, 10)).bitXor(LFTri.ar(2.1, 0, MouseX.kr(1, 10))))})

Ndef(\tri, {Splay.ar(LFTri.ar(40, 0, MouseY.kr(1, 10))%LFTri.ar(50.1, 0, MouseX.kr(1, 10)))})

Ndef(\tri, {Splay.ar(LFTri.ar(400, 0, 2pi).min(LFTri.ar(50.1, 0, MouseX.kr(1, 3))))})

Ndef(\tri, {Splay.ar(LFTri.ar(400, 0, 2pi)<LFTri.ar(50.1, 0, MouseX.kr(0.1, 3)))})

Ndef(\tri).stop

//  See SimpleNumber helpfile for ideas.



//--PseudoUGens  see source code for PMOsc

Ndef(\pwm).play
(
Ndef(\pwm, {
	var freq= MouseY.kr(1, 1000, 1);
	var ramp= LFSaw.ar(freq);
	var width= MouseX.kr(-1, 1);//threshold
	ramp>width;
});
)
s.scope
Ndef(\pwm).stop


//  Below is our sc class code. Copy and paste into
//  a new document, call it Pwm.sc and save it in
//  your extensions folder. Then recompile.

//  from here -->
Pwm {
	*ar {|freq= 100, width= 0.5|
		^LFSaw.ar(freq)>(width* -2+1);
	}
	*kr {|freq= 100, width= 0.5|
		^LFSaw.kr(freq)>(width* -2+1);
	}
}

//  <-- to here

//  Recompile
s.boot
s.scope
Ndef(\ourPwm).play
Ndef(\ourPwm, {Pwm.ar(MouseY.kr(100, 1000, 1), MouseX.kr(0, 1))})
Ndef(\ourPwm).stop




//--recursion

Ndef(\rev).play
Ndef(\rev).fadeTime= 4


Ndef(\rev, {Splay.ar(SinOsc.ar(1, Ndef.ar(\rev).lag(0.01)*2pi))})

Ndef(\rev, {Splay.ar(SinOsc.ar(1, Ndef.ar(\rev).lagud(0.01, 0.1)*8pi))})

//  blocksize 64 samples feedback

Ndef(\rev, {Splay.ar(SinOsc.ar(100, DelayN.ar(Ndef.ar(\rev), 1, 1).lag3(0.0001)*pi)).tanh})

Ndef(\rev, {Splay.ar(SinOsc.ar(DelayN.ar(Ndef.ar(\rev), 1, 1).lag3(0.0001)*1000).tanh)})

Ndef(\rev, {Splay.ar(SinOsc.ar(DelayN.ar(Ndef.ar(\rev), 1, 1).round(0.1)*1000).tanh)})

Ndef(\rev, {Splay.ar(SinOsc.ar(1, DelayN.ar(Ndef.ar(\rev), 0.1, 0.1).round(0.01)*2pi).tanh)})

//  .rotate and Amplitude...
Ndef(\rev, {Splay.ar(SinOsc.ar([400, 404, 806, 60+LFPulse.ar(0.1, 0, 0.5, 10)], Amplitude.ar(Ndef.ar(\rev).rotate(1)*2pi)*(Ndef.ar(\rev)), SinOsc.ar([1, 1.1])))})

//  or Balance2...
Ndef(\rev, {Splay.ar(SinOsc.ar([400, 404, 806, 60+LFPulse.ar(0.5, 0, 0.5, 10)], Amplitude.ar(Balance2.ar(Ndef.ar(\rev)[0], Ndef.ar(\rev)[1], LFTri.ar(10))*pi)*(Ndef.ar(\rev)), SinOsc.ar([1, 1.1])))})

//  or XFade2...
Ndef(\rev, {Splay.ar(SinOsc.ar([400, 404, 806, 201, 300], XFade2.ar(Ndef.ar(\rev), DelayN.ar(Ndef.ar(\rev).rotate(1)), LFTri.ar(LFTri.ar(0.1)*1000+1000))))})

Ndef(\rev, {Splay.ar(SinOsc.ar([400, 404, 806, 201, 300]/2, XFade2.ar(Ndef.ar(\rev), DelayN.ar(Ndef.ar(\rev).rotate(1)), LFTri.ar(LFTri.ar(0.1)*1000+1000))))})

Ndef(\rev, {Splay.ar(SinOsc.ar([400, 404, 806, 201, 300]/2, XFade2.ar(Ndef.ar(\rev), DelayN.ar(Ndef.ar(\rev).rotate(1)), SinOsc.ar(Ndef.ar(\rev)*1000+1000))))})

Ndef(\rev, {Splay.ar(SinOsc.ar([400, 404, 806, 201, 300]/2, XFade2.ar(Ndef.ar(\rev), DelayN.ar(Ndef.ar(\rev).rotate(1)), LFSaw.ar(Ndef.ar(\rev))))).tanh})

Ndef(\rev).stop(10)





//--Tdef - task definition

Tdef(\robot).play
Ndef(\rev).play
Ndef(\rev, {Splay.ar(SinOsc.ar(Rand(400, 4000)))})
Tdef(\robot, {loop{1000.postln; 1.wait}})
Tdef(\robot, {loop{Ndef(\rev).rebuild; 3.wait}})

Ndef(\rev, {|freq= 500| Splay.ar(SinOsc.ar(freq))})
Tdef(\robot, {loop{1000.postln; 1.wait}})
Tdef(\robot, {loop{Ndef(\rev).set(\freq, 500.rrand(5000)); 0.1.wait}})
Tdef(\robot2).play
Tdef(\robot2, {loop{Ndef(\rev).set(\freq, 200); 0.12.wait}});

Tdef(\robot).stop
Tdef(\robot2).stop
Ndef(\rev).stop



//--Tdef with patterns / streams

Tdef(\melody).play
(
Tdef(\melody, {
	var pat= Pseq([0, 5, 2, 3, 2, 1], inf).asStream;
	loop{
		pat.next.postln;
		0.2.wait;
	};
});
)

Ndef(\sin).play
Ndef(\sin, {|freq= 500| Splay.ar(SinOsc.ar(freq, 0, 0.4))})
(
Tdef(\melody, {
	var pat= Pseq([0, 5, 2, 3, 2, 1], inf).asStream;
	loop{
		Ndef(\sin).set(\freq, (pat.next+60).midicps);
		0.2.wait;
	};
});
)

Tdef(\melody2).play
(
Tdef(\melody2, {
	var pat= Pseq([5, 5, 6, 7, 6], inf).asStream;
	loop{
		Ndef(\sin).set(\freq, (pat.next+81).midicps);
		(1/3).wait;
	};
});
)

//  Note the fighting.

Tdef(\melody).stop
Tdef(\melody2).stop
Tdef(\melody).play(quant:4)
Tdef(\melody2).play(quant:4)

TempoClock.default.tempo= 1.5
TempoClock.default.tempo= 1.8
TempoClock.default.tempo= 2

Tdef(\melody).stop
Tdef(\melody2).stop
Ndef(\sin).stop


Ndef(\sin).quant= 4
Ndef(\sin).play//start at the next bar (try many times)
Ndef(\sin).stop//stop right away

c= TempoClock(0.3)
Ndef(\sin).quant= 1
Ndef(\sin).clock= c
Ndef(\sin).play
Ndef(\sin).stop


//  Waltz...
c= TempoClock(1.8)
c.sched(1, {c.beatsPerBar= 3; nil})
Pdef(\takt).play(c, quant:3)
Pdef(\takt).quant= 3

Pdef(\takt, Pbind(\freq, Pseq([400, 700, 700], inf)))

(
c.schedAbs(c.nextBar.postln, {
	c.beats.postln;
	"now!".postln;//should happen on the 1st beat of a 3/4 bar
	nil;
};
)
)

Pdef(\takt).stop


//--select between oscillators

Ndef(\sel).play
Ndef(\sel).fadeTime= 12

Ndef(\sel, {Splay.ar(Select.ar(Duty.kr(0.1, 0, Dseq([0, 1], inf)), [SinOsc.ar(2000), Saw.ar(300)]))*0.5})

Ndef(\sel, {Splay.ar(Select.ar(Duty.kr(0.05, 0, Dseq([0, 1, 1, 1, 2, 0, 1], inf)), [SinOsc.ar(2000), Saw.ar(3000), WhiteNoise.ar(0.4)]))*0.5})

Ndef(\sel, {Splay.ar(SelectX.ar(Duty.kr(0.05, 0, Dseq([0, 1, 1, 1, 2, 0, 1], inf)).lag(0.1), [SinOsc.ar(2000), Saw.ar(3000), WhiteNoise.ar(0.4)]))*0.5})

Ndef(\sel, {Splay.ar(SelectX.ar(SinOsc.ar(MouseX.kr(0.5, 500, 1))*3, [SinOsc.ar(2000), Saw.ar(3000), WhiteNoise.ar(0.4)]))*0.5})

Ndef(\sel).stop


//  Do not forget the gui...
NdefMixer(s)


//--effect chain per ndef
Ndef(\test).play
Ndef(\test, {Splay.ar(WhiteNoise.ar(0.2))})
Ndef(\test).filter(1, {|in| in*LFSaw.ar(4).max(0)})
Ndef(\test).filter(2, {|in| in+CombN.ar(in, 0.1, [0.1, 0.08])})
Ndef(\test).filter(3, {|in| CombN.ar(in, 1/400, 1/[400, 500])})
Ndef(\test).filter(4, {|in| in+SinOsc.ar([200, 202])})
Ndef(\test).filter(5, {|in| XFade2.ar(in, in.round(0.1), LFTri.ar(222))})
Ndef(\test).filter(6, {|in| in+AllpassC.ar(in, 0.5, LFTri.ar([0.1, 0.11], 0, 0.1, 0.3))})

Ndef(\test).stop(20)



//--networking pdef and ndef
n= Server(\nnn, NetAddr("192.168.0.60", 57110))//edit ip to match an ip of a computer running sc on the same network

a= Pdef(\test, Pbind(\dur, 0.5, \freq, 900, \server, n)).play
a.stop

Ndef(\net).server= n
Ndef(\net).play
Ndef(\net, {WhiteNoise.ar(0.1)})
Ndef(\net).stop


DUGen.allSubclasses.do{|x| x.postln};

