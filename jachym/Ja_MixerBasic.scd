s.plotTree;

////// mixer setup ///////////////////////////////////////////////////////////

(
~synG = Group.new;
~mixG = Group.new(~synG, \addAfter);
~numCh = 4;

SynthDef(\ampFader, { |bus, amp = 0.0 |
	Out.ar(0, In.ar(bus, 2) * amp)
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

~collAmpValues = List.new(~numCh);
~collAmpSlider = List.new(~numCh);

~numCh.do { |i|
	StaticText.new(w,Rect(20+(40*i),5,80+(30*i),15)).string_("Chnl_"++i).stringColor_(~colFront);
	~collAmpValues.add(NumberBox(w, Rect(20+(40*i), 25, 30, 20)));
	~collAmpSlider.add(Slider(w, Rect(30+(40*i), 50, 10, 150)));
	~collAmpSlider[i].action_({
		~collAmpValues[i].value_(~collAmpSlider[i].value);
		("chAmp" ++ i).asSymbol.envirGet.value = ~collAmpSlider[i].value;
	});
	~collAmpSlider[i].action.value;
};
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

////// close faderObjects ///////////////////////////////////////////////////////////

(
~numCh.do { |i|
	("chAmpFader" ++ i).asSymbol.envirGet.free;
};
)