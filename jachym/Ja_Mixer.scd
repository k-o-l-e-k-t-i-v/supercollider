s.scope(2);
s.plotTree;

////// mixer setup ///////////////////////////////////////////////////////////

(
~synG = Group.new;
~efxG = Group.new(~synG, \addAfter);
~mixG = Group.new(~efxG, \addAfter);
~numCh = 4;

SynthDef(\ampFader, { |bus, amp = 0.0 |
	Out.ar(0, In.ar(bus, 2) * amp)
}).add;
SynthDef(\fShift, { | bus target dur |
	ReplaceOut.kr(bus, EnvGen.kr(Env([In.kr(bus), target], [dur], \sin), doneAction: 2))
}).add;

~numCh.do { |i|
	("ch" ++ i).asSymbol.envirPut( Bus.audio(s, 2) );
	("chAmp" ++ i).asSymbol.envirPut( Bus.control(s, 1) );
	("chAmpFader" ++ i).asSymbol.envirPut( Synth(\ampFader, [
		\bus, ("ch" ++ i).asSymbol.envirGet,
		\amp, ("chAmp" ++ i).asSymbol.envirGet.asMap
		], ~mixG)
	);
};
)

////// windows setup ///////////////////////////////////////////////////////////

(
w = Window.new("ja_Mixer", Rect(1000,200,255,400));
w.background_(Color.new255(30,30,30)).front;
~colFront = Color.new255(255,255,255);

~collC = List.new(~numCh);
~collA = List.new(~numCh);

~numCh.do { |i|
	StaticText.new(w,Rect(20+(40*i),5,80+(30*i),15)).string_("Chnl_"++i).stringColor_(~colFront);
	~collC.add(NumberBox(w, Rect(20+(40*i), 25, 30, 20)));
	~collA.add(Slider(w, Rect(30+(40*i), 50, 10, 150)));
	~collA[i].action_({
		~collC[i].value_(~collA[i].value);

		~collA[i].value.postln;
		("chAmp" ++ i).asSymbol.envirGet.value = ~collA[i].value;
	});
	~collA[i].action.value;
};

// StaticText.new(w,Rect(20,250,380,260)).string_("Last Chnl_0 works").stringColor_(~colFront);

w.front;

)

////// synths - play it ///////////////////////////////////////////////////////////

(
SynthDef(\testSin, {|out, gate = 1, freq, amp, sustain|
	var aEnv = EnvGen.ar(Env.asr(0.1*sustain, 1,0.9*sustain),gate, doneAction:2);
	var osc = SinOsc.ar([freq, freq+10],0,1);
	var tone = osc * aEnv * amp;
	Out.ar(out, tone);
}).add;

Pdef(\test,
	Ppar([
		Pbind(\instrument, \testSin, \out, ~ch0, \group, ~synG,
			\amp, 1,
			\dur, 8, \legato, 1.2,
			\octave, 2,
			\degree, Pstutter(Pseq([8,2,8,4],inf),Pseq([3,2,3,3b],inf))
		),
		Pbind(\instrument, \testSin, \out, ~ch1, \group, ~synG,
			\amp, 1,
			\dur, 0.125, \legato, 0.1,
			\octave, 4,
			\degree, Pstutter(Pseq([8,2,8,4],inf),Pseq([3,2,3,3b],inf))
		),
		Pbind(\instrument, \testSin, \out, ~ch2, \group, ~synG,
			\amp, 1,
			\dur, 2, \legato, 0.02,
			\octave, 6,
			\degree, Pstutter(Pseq([8,2,8,4],inf),Pseq([3,2,3,3b],inf))
		),
		Pbind(\instrument, \testSin, \out, ~ch3, \group, ~synG,
			\amp, 1,
			\dur, Pseq([Pn(0.125,16), Rest(4)], inf), \legato, 0.1,
			\octave, 3,
			\degree, Pstutter(Pseq([8,2,8,4],inf),Pseq([3,2,3,3b],inf))
		)
	],inf)
).play;
)
Pdef(\test).stop;

////////////////////////////////////////////////////////////////////////////////

~chAmpFader.free;

/*
Synth(\fShift,[\bus,~chAmp1, \target, 0.5, \dur, 8],~mixG);
~chAmp1.set(0.0);
~chAmp1.set(0.3);
Synth(\fShift,[\bus,~chAmp1, \target, 0.0, \dur, 5],~mixG);

(
Pbind(\instrument, \fShift, \group, ~mixG,	\bus, ~chAmp1,
#[\target,\dur], Pseq([[0.5,2],[0.3,5],[0.0,2]])
).play;
)
*/
