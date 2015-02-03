s.scope(2);
s.plotTree;


////// mixer setup ///////////////////////////////////////////////////////////

(
s = Server.local;

Routine.run({

	// MixerSynth ////////////////////

	SynthDef(\Limiter, { |bus|
		Out.ar(0, Limiter.ar(In.ar(bus,2),0.95));
	}).add;

	SynthDef(\Fader, { |out, in, amp = 0.0, mute = 1 |
		Out.ar(out, In.ar(in, 2) * amp * mute)
	}).add;

	SynthDef(\newVal, { | bus val time |
		ReplaceOut.kr(bus, EnvGen.kr(Env([In.kr(bus), val], [time], \sin), doneAction: 2))
	}).add;

	s.sync;

	// Busses & Nodes ////////////////////

	~synG = Group.new;
	~efxG = Group.new(~synG, \addAfter);
	~mixG = Group.new(~efxG, \addAfter);

	~master = Bus.audio(s, 2);
	~limit = Synth(\Limiter,[\bus, ~master],~mixG);
	~numCh = 8;

	~numCh.do { |i|

		("ch" ++ i).asSymbol.envirPut( Bus.audio(s, 2) );
		("chAmp" ++ i).asSymbol.envirPut( Bus.control(s, 1) );
		("chMute" ++ i).asSymbol.envirPut( Bus.control(s, 1) );
		("FaderAmp" ++ i).asSymbol.envirPut( Synth(\Fader, [
			\in, ("ch" ++ i).asSymbol.envirGet,
			\out, ~master,
			\amp, ("chAmp" ++ i).asSymbol.envirGet.asMap,
			\mute, ("chMute" ++ i).asSymbol.envirGet.asMap,
		], ~mixG));
	};

	s.sync;

	// EfxSynth ////////////////////

	SynthDef(\efxFreeVerb, { |bus, room = 0.0 |
		var tone = In.ar(bus, 2);
		var efx = FreeVerb.ar(tone, 0.9, room, 0.5, 1, tone);
		ReplaceOut.ar(bus, efx)
	}).add;

	s.sync;
});
)


////// windows setup ///////////////////////////////////////////////////////////

(
~colBack = Color.new255(30,30,30);
~colFront = Color.new255(255,255,255);
~colActive = Color.new255(200,50,50);
~fontBig = Font("Segoe UI", 8,true, isPointSize:true);
~fontSmall = Font("Segoe UI", 6, isPointSize:true);

~sizeXChnl = 50;
~sizeYChnl = 400;

w = Window.new("ja_Mixer", Rect(1000,200,490,500));
w.alpha_(0.95);
w.alwaysOnTop_(true);
w.background_(~colBack);
w.front;

~collAmpValues = List.new(~numCh);
~collAmpSlider = List.new(~numCh);
~collMuteButtons = List.new(~numCh);
~collfxFVerbButtons = List.new(~numCh);
~collFreqViews = List.new(~numCh);

~numCh.do { |i|
	var originX, originY, uv;
	var name, valAmp, txtAmp, fqv, fqv_frame, sliderAmp, valFadeAmp;

	originX = 10+((~sizeXChnl+10)*i);
	originY = 5;

	uv = UserView(w,Rect(originX, originY, ~sizeXChnl, ~sizeYChnl));
	uv.background_(~colBack);

	fqv_frame = Rect(5,45, uv.bounds.width-10,80);

	uv.drawFunc = {
		Pen.strokeColor = ~colFront;
		Pen.addRect(Rect(0,0, uv.bounds.width,uv.bounds.height));

		Pen.addRect(fqv_frame); // fqv frame

		Pen.moveTo(5@130);
		Pen.lineTo(uv.bounds.width-5@130);
		Pen.stroke;
	};

	name = StaticText.new(uv,Rect(5, 5, ~sizeXChnl-10, 10));
	name.string_("ch"++i);
	name.stringColor_(~colFront);
	name.font_(~fontBig);
	// name.align_(\center);

	txtAmp = StaticText.new(uv,Rect(5, 15, 20, 20));
	txtAmp.string_("amp:");
	txtAmp.stringColor_(~colFront);
	txtAmp.font_(~fontSmall);

	fqv = FreqScopeView(uv, fqv_frame);
	fqv.active_(true);
	fqv.inBus = ("ch" ++ i).asSymbol.envirGet;
	fqv.freqMode_(1);
	fqv.background_(Color.black);
	~collFreqViews.add(fqv);

	valAmp = NumberBox(uv, Rect(25, 16, 20, 20));
	valAmp.normalColor_(~colFront);
	valAmp.background_(~colBack);
	valAmp.align_(\center);
	valAmp.font_(~fontSmall);
	~collAmpValues.add(valAmp);

	sliderAmp = Slider(uv, Rect(5, 140, 10, 100));
	sliderAmp.background_(~colBack);
	sliderAmp.knobColor_(~colActive);
	sliderAmp.action_({
		~collAmpValues[i].value_(~collAmpSlider[i].value);
		("chAmp" ++ i).asSymbol.envirGet.value = ~collAmpSlider[i].value;
	});
	~collAmpSlider.add(sliderAmp);
	~collAmpSlider[i].action.value;

	/*
	valFadeAmp = NumberBox(uv, Rect(25, 16, 20, 20));
	valFadeAmp.normalColor_(~colFront);
	valFadeAmp.background_(~colBack);
	valFadeAmp.align_(\center);
	valFadeAmp.font_(~fontSmall);
	// ~collAmpValues.add(valAmp);
	*/
	~collMuteButtons.add(Button(uv, Rect(25, 210, 20, 20))
		.states_([
			["||",~colFront,~colBack],
			[">",~colFront,~colActive]
		])
		.action_({ arg butt;
			if(butt.value == 1) { ("chMute" ++ i).asSymbol.envirGet.value = 1; };
			if(butt.value == 0) { ("chMute" ++ i).asSymbol.envirGet.value = 0; };
		})
	);

	~fxVerbB = Button(uv, Rect(25, 240, 20, 20));
	~fxVerbB.states_([
		["fx",~colFront,~colBack],
		["fx",~colFront,~colActive]
	]);
	~fxVerbB.action_({ arg butt;
		if(butt.value == 1) {
			~collfxFVerbButtons[i] = Synth(\efxFreeVerb, [
				\bus, ("ch" ++ i).asSymbol.envirGet,
				\room, 5
		], ~efxG)};
		if(butt.value == 0) {
			~collfxFVerbButtons[i].free;
		};
	});
	~collfxFVerbButtons.add(~fxVerbB);




};

w.onClose_({

	~numCh.do { |i|
		~collFreqViews[i].kill;
		("chAmpFader" ++ i).asSymbol.envirGet.free;
		~collfxFVerbButtons[i].free;
	};
	~chAmpFader.free;
	w.close;
	~synG.free;
	~efxG.free;
	~mixG.free;
	"closed".postln;
});


)

////// test synths - play it ///////////////////////////////////////////////////////////

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
			\dur, 2, \legato, 0.9,
			\octave, 3,
			\degree, Pstutter(Pseq([8,2,8,4],inf),Pseq([3,2,3,3b],inf))
		),
		Pbind(\instrument, \testSin, \out, ~ch1, \group, ~synG,
			\amp, 1,
			\dur, 1.0, \legato, 0.3,
			\octave, 2,
			\degree, Pstutter(Pseq([8,2,8,4],inf),Pseq([3,2,3,3b],inf))
		),
		Pbind(\instrument, \testSin, \out, ~ch2, \group, ~synG,
			\amp, 1,
			\dur, 1, \legato, 2.02,
			\octave, 3,
			\degree, Pstutter(Pseq([8,2,8,4],inf),Pseq([3,2,3,3b],inf))
		),
		Pbind(\instrument, \testSin, \out, ~ch3, \group, ~synG,
			\amp, 1,
			\dur, Pseq([Pn(0.125,16), Rest(4)], inf), \legato, 0.09,
			\octave, 4,
			\degree, Pstutter(Pseq([8,2,8,4],inf),Pseq([3,2,3,3b],inf))
		)
	],inf)
).play;
)
Pdef(\test).stop;

