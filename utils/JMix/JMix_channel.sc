JMix_channel{
	classvar version = 0.12;
	classvar server, mixParent;

	var chnlG, id;
	var channel_aBus;
	var cb_fader_amp, cb_fader_mute;
	var <faderSynth;

	var coll_Efx;

	var uv;
	var name, txtAmp, fqv;
	var valAmp, sliderAmp, buttMute;

	*new{ |mix|
		^super.new.init(mix);
	}

	init { |mix|
		server = Server.default;
		mixParent = mix;
		id = nil;
		chnlG = Group.new(mixParent.synG, \addAfter);

		channel_aBus = Bus.audio(server, 2);
		cb_fader_amp = Bus.control(server, 1).value_(0);
		cb_fader_mute = Bus.control(server, 1).value_(1);

		faderSynth = Synth(mixParent.mixSynthDef(0), [
			\in, channel_aBus,
			\out, mixParent.audioBus,
			\amp, cb_fader_amp.asMap,
			\mute, cb_fader_mute.asMap,
		], chnlG,\addToTail);

	}

	buildEfx{|efxSynthDef|
		var num_Efx = 0;
		coll_Efx = List.new(mixParent.numEfx);
		efxSynthDef.do{|def|
			var efx;
			efx = JMix_efx(this, def);
			efx.id_(num_Efx);
			coll_Efx.add(efx);
			num_Efx = num_Efx + 1;
		}
	}

	id_{|num| id = num;}

	guiEfx{
		coll_Efx.size.do{|i|
			this.effect(i).gui(mixParent.uv, mixParent.colBack, mixParent.colFront, mixParent.colActive, mixParent.fontBig, mixParent.fontSmall);
		};
	}

	gui{ |uv, originX, originY, colBack, colFront, colActive, fontBig, fontSmall|

		name = StaticText.new(uv,Rect(5, 5, uv.bounds.width-5, 12))
		.string_("ch["++id++"]")
		.stringColor_(colFront)
		.font_(fontBig);

		txtAmp = StaticText.new(uv,Rect(5, 22, 20, 15))
		.string_("amp:")
		.stringColor_(colFront)
		.font_(fontSmall);

		fqv = FreqScopeView(uv, Rect(5,45, uv.bounds.width-22,80));
		fqv.active_(true);
		fqv.inBus_(channel_aBus);
		fqv.freqMode_(1);
		fqv.background_(Color.black);

		valAmp = NumberBox(uv, Rect(27, 23, 20, 15))
		.normalColor_(colFront)
		.background_(colBack)
		.align_(\center)
		.font_(fontSmall);

		sliderAmp = Slider(uv, Rect(uv.bounds.width-13, 5, 8, 120))
		.background_(colBack)
		.knobColor_(colActive)
		.action_({
			valAmp.value = sliderAmp.value;
			cb_fader_amp.value = sliderAmp.value;
		});

		buttMute = Button(uv, Rect(27, 5, 20, 15))
		.font_(fontSmall)
		// .valueAction_(cb_mute.value)
		.states_([
			["||",colFront,colBack],
			[">",colFront,colActive]
		])
		.action_({ |butt|
			if(butt.value == 1) { cb_fader_mute.value = 1; };
			if(butt.value == 0) { cb_fader_mute.value = 0; };
		});

		/// efx ////////////////////


		/*
		mixParent.numEfx.do{|i|
		var efx_cBus, val_Efx_cBus, name_Efx_cBus;
		var sd, controls_sd, controlsNames_sd, controlsDic_sd;

		////////////////// SynthDesc helpfile
		sd = SynthDescLib.at(mixParent.efxSynthDef(i));
		controls_sd = sd.controls;
		// ("controls_sd :" ++ controls_sd).postln;

		efx_cBus = SynthDescLib.at(mixParent.efxSynthDef(i)).controlNames.size;
		// ("numEfx_cBus : " ++ numEfx_cBus).postln;

		controlsNames_sd = SynthDescLib.at(mixParent.efxSynthDef(i)).controlNames;
		// ("controlsNames_sd : " ++ controlsNames_sd).postln;

		controlsDic_sd = SynthDescLib.at(mixParent.efxSynthDef(i)).controlDict;
		// ("controlsDic_sd : " ++ controlsDic_sd).postln;

		fxButt = Button(uv, Rect(5, 150+(80*i), uv.bounds.width-10, 15))
		.font_(fontSmall)
		.states_([
		[mixParent.efxSynthDef(i),colFront,colBack],
		[mixParent.efxSynthDef(i),colFront,colActive]
		])
		.action_({ |butt|
		if(butt.value == 1) {

		// coll_Efx_Synth.put(i,Synth(mixParent.efxSynthDef(i), [\bus, aBus], target:faderSynth, addAction: \addBefore););
		// coll_Efx_Synth[i].release;
		};
		if(butt.value == 0) {
		// coll_Efx_Synth[i].free;
		};
		});


		efx_cBus.do{|j|
		if((controlsNames_sd[j] != \bus) and: (controlsNames_sd[j] != \out),
		{
		name_Efx_cBus = StaticText.new(uv,Rect(5, 180+(80*i)+(20*j), 35, 20))
		.string_(controlsNames_sd[j])
		.stringColor_(colFront)
		.font_(fontBig);

		val_Efx_cBus = NumberBox(uv, Rect(uv.bounds.width-30, 180+(80*i)+(20*j), 25, 15))
		.normalColor_(colFront)
		.background_(colBack)
		.align_(\center)
		.font_(fontSmall)
		.value_(100)
		.clipLo_(0)
		.scroll_step_(10)
		.action_({
		controlsNames_sd[j].postln;
		// coll_Efx_Synth[i].set(controlsNames_sd[j].asSymbol,val_Efx_cBus.value);
		("controlsDic_sd : " ++ SynthDescLib.at(mixParent.efxSynthDef(i)).controlDict).postln;
		});
		}
		);
		};
		};
		*/
	}

	free{
		fqv.kill // !!! nutne bez ";"
	}

	audioBus { ^channel_aBus; }
	effect{ |num| ^coll_Efx[num]; }


}