s.scope(2);
s.plotTree;

////// mixer setup ///////////////////////////////////////////////////////////

(
~synG = Group.new;
~efxG = Group.new(~synG, \addAfter);
~mixG = Group.new(~efxG, \addAfter);
~numCh = 8;

SynthDef(\ampFader, { |bus, amp = 0.0, mute = 1 |
	Out.ar(0, In.ar(bus, 2) * amp * mute)
}).add;

SynthDef(\fShift, { | bus target dur |
	ReplaceOut.kr(bus, EnvGen.kr(Env([In.kr(bus), target], [dur], \sin), doneAction: 2))
}).add;

~numCh.do { |i|
	("ch" ++ i).asSymbol.envirPut( Bus.audio(s, 2) );
	("chAmp" ++ i).asSymbol.envirPut( Bus.control(s, 1) );
	("chMute" ++ i).asSymbol.envirPut( Bus.control(s, 1) );
	("chAmpFader" ++ i).asSymbol.envirPut( Synth(\ampFader, [
		\bus, ("ch" ++ i).asSymbol.envirGet,
		\amp, ("chAmp" ++ i).asSymbol.envirGet.asMap,
		\mute, ("chMute" ++ i).asSymbol.envirGet.asMap
		], ~mixG)
	);
};
)

////// efx setup ///////////////////////////////////////////////////////////

(
SynthDef(\efxFreeVerb, { |bus, room = 0.0 |
	var tone = In.ar(bus, 2);
	var efx = FreeVerb.ar(tone, 0.9, room, 0.5, 1, tone);
	ReplaceOut.ar(bus, efx)
}).add;
)

////// windows setup ///////////////////////////////////////////////////////////

(
~colBack = Color.new255(30,30,30);
~colFront = Color.new255(255,255,255);
~colActive = Color.new255(200,50,50);
w = Window.new("ja_Mixer", Rect(1000,200,400,300));
w.alpha_(0.95);
w.alwaysOnTop_(true);
w.background_(~colBack).front;

~collAmpValues = List.new(~numCh);
~collAmpSlider = List.new(~numCh);
~collMuteButtons = List.new(~numCh);
~collfxFVerbButtons = List.new(~numCh);

~numCh.do { |i|
	StaticText.new(w,Rect(20+(40*i),5,80+(30*i),15)).string_("Chnl_"++i).stringColor_(~colFront);

	~collAmpValues.add(NumberBox(w, Rect(20+(40*i), 25, 30, 20))
		.normalColor_(~colFront)
		.background_(~colBack)
		.align = \center;
	);

	~collAmpSlider.add(Slider(w, Rect(30+(40*i), 52, 10, 150))
		.background_(~colBack)
		.knobColor_(~colActive)
		.action_({
			~collAmpValues[i].value_(~collAmpSlider[i].value);
			("chAmp" ++ i).asSymbol.envirGet.value = ~collAmpSlider[i].value;
		});
	);
	~collAmpSlider[i].action.value;

	~collMuteButtons.add(Button(w, Rect(25+(40*i), 210, 20, 20))
		.states_([
			["||",~colFront,~colBack],
			[">",~colFront,~colActive]
		])
		.action_({ arg butt;
			if(butt.value == 1) { ("chMute" ++ i).asSymbol.envirGet.value = 1; };
			if(butt.value == 0) { ("chMute" ++ i).asSymbol.envirGet.value = 0; };
		})
	);

	~collfxFVerbButtons.add(Button(w, Rect(25+(40*i), 240, 20, 20))
		.states_([
			["fx",~colFront,~colBack],
			["fx",~colFront,~colActive]
		])
		.action_({ arg butt;
			if(butt.value == 1) {
				~collfxFVerbButtons[i] = Synth(\efxFreeVerb, [
					\bus, ("ch" ++ i).asSymbol.envirGet,
					\room, 5
			], ~efxG)};
			if(butt.value == 0) {
				~collfxFVerbButtons[i].free;
			};
		})
	);
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
			\dur, 8, \legato, 0.9,
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
			\dur, Pseq([Pn(0.125,16), Rest(4)], inf), \legato, 0.09,
			\octave, 8,
			\degree, Pstutter(Pseq([8,2,8,4],inf),Pseq([3,2,3,3b],inf))
		)
	],inf)
).play;
)
Pdef(\test).stop;

////// close Mixer ///////////////////////////////////////////////////////////

(
Pdef(\test).stop;
~numCh.do { |i|
	("chAmpFader" ++ i).asSymbol.envirGet.free;
	~collfxFVerbButtons[i].free;
};
w.close;
~synG.free;
~efxG.free;
~mixG.free;
)
