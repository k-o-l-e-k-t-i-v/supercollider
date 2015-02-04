s.scope(2);
s.plotTree;


////// mixer setup ///////////////////////////////////////////////////////////

(
s = Server.local;

Routine.run({
	s.waitForBoot;

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
		("FaderAmp" ++ i).asSymbol.envirPut(
			Synth(\Fader, [
				\in, ("ch" ++ i).asSymbol.envirGet,
				\out, ~master,
				\amp, ("chAmp" ++ i).asSymbol.envirGet.asMap,
				\mute, ("chMute" ++ i).asSymbol.envirGet.asMap,
		], ~mixG));
	};

	s.sync;
});
)

(
~numEfx = 1;

Routine.run({

	// EfxSynth ////////////////////

	~cb_FreeVerb_room = Bus.control(s,1);

	SynthDef(\efxFreeVerb, { |bus, room = 0.0 , amp|
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

~sizeXChnl = 65;
~sizeYChnl = 400;

w = Window.new("ja_Mixer", Rect(1000,200,565,410));
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

	originX = 5+((~sizeXChnl+5)*i);
	originY = 5;

	uv = UserView(w,Rect(originX, originY, ~sizeXChnl, ~sizeYChnl));
	uv.background_(~colBack);

	// fqv_frame = Rect(5,45, uv.bounds.width-10,80);

	uv.drawFunc = {
		Pen.strokeColor = ~colFront;
		Pen.addRect(Rect(0,0, uv.bounds.width,uv.bounds.height));

		Pen.addRect(fqv_frame); // fqv frame

		Pen.moveTo(5@135);
		Pen.lineTo(uv.bounds.width-5@135);
		Pen.stroke;
	};

	name = StaticText.new(uv,Rect(5, 7, ~sizeXChnl-10, 10));
	name.string_("ch"++i);
	name.stringColor_(~colFront);
	name.font_(~fontBig);
	// name.align_(\center);

	txtAmp = StaticText.new(uv,Rect(5, 22, 20, 15));
	txtAmp.string_("amp:");
	txtAmp.stringColor_(~colFront);
	txtAmp.font_(~fontSmall);

	fqv = FreqScopeView(uv, Rect(5,45, uv.bounds.width-22,80));
	fqv.active_(true);
	fqv.inBus = ("ch" ++ i).asSymbol.envirGet;
	fqv.freqMode_(1);
	fqv.background_(Color.black);
	~collFreqViews.add(fqv);

	valAmp = NumberBox(uv, Rect(27, 23, 20, 15));
	valAmp.normalColor_(~colFront);
	valAmp.background_(~colBack);
	valAmp.align_(\center);
	valAmp.font_(~fontSmall);
	~collAmpValues.add(valAmp);

	sliderAmp = Slider(uv, Rect(uv.bounds.width-13, 5, 8, 120));
	sliderAmp.background_(~colBack);
	sliderAmp.knobColor_(~colActive);
	sliderAmp.action_({
		~collAmpValues[i].value_(~collAmpSlider[i].value);
		("chAmp" ++ i).asSymbol.envirGet.value = ~collAmpSlider[i].value;
	});
	~collAmpSlider.add(sliderAmp);
	~collAmpSlider[i].action.value;

	~collMuteButtons.add(Button(uv, Rect(27, 5, 20, 15))
		.states_([
			["||",~colFront,~colBack],
			[">",~colFront,~colActive]
		])
		.font_(~fontSmall)
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
				\room, ~cb_FreeVerb_room.asMap;
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
	var osc = SinOsc.ar([freq, freq+10],0,0.4,0.6)*Saw.ar([freq/2, (freq+10)/4],0.2,0.8);
	var tone = osc * aEnv * amp;
	Out.ar(out, tone);
}).add;

Pdef(\test,
	Ppar([
		Pbind(\instrument, \testSin, \out, ~ch0, \group, ~synG,
			\amp, 1,
			\dur, 0.5, \legato, 0.3,
			\octave, 2,
			\degree, Pstutter(Pseq([8,2,8,4],inf),Pseq([3,2,3,6],inf))
		),
		Pbind(\instrument, \testSin, \out, ~ch1, \group, ~synG,
			\amp, 1,
			\dur, Pseq([Pn(0.0625,28), Rest(0.25)], inf), \legato, 0.05,
			\octave, 4,
			\degree, Pstutter(Pseq([32,2,16,4],inf),Pseq([3,2,3,1],inf))
		),
		Pbind(\instrument, \testSin, \out, ~ch2, \group, ~synG,
			\amp, 1,
			\dur, Pseq([0.5, Rest(3.5)], inf), \legato, 2.02,
			\octave, 4,
			\degree, Pstutter(Pseq([2,2,1,4],inf),Pseq([3,2,3,4],inf))
		),
		Pbind(\instrument, \testSin, \out, ~ch3, \group, ~synG,
			\amp, 1,
			\dur, Pseq([Pn(0.125,16), Rest(2)], inf), \legato, Pseq([Pn(0.09,15),Pn(1.09,2)],inf),
			\octave, Pseq([Pn(3,15),Pn(2,2),Pn(4,17),Pn(2,15),Pn(3,2)], inf),
			\degree, Pstutter(Pseq([8,2,8,4],inf),Pseq([3,2,3,3b],inf))
		)
	],inf)
).play(quant:1);
)
Pdef(\test).stop;

