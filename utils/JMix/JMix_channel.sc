JMix_channel{
	classvar version = 0.16;
	classvar server;

	var <mixParent;

	var chnlG, id;
	var channel_aBus, channel_efx_aBus;
	var <faderSynth, <flatSynth;
	var cb_fader_amp, cb_fader_mute;

	var coll_Efx;

	var name, txtAmp, fqv;
	var valAmp, sliderAmp, buttMute;

	var chnlFrame, originX, originY;

	var colBack, colFront, colActive, colChange;
	var fontBig, fontSmall;
	var lastObjY;

	*new{ |mix|
		^super.new.init(mix);
	}

	init { |mix|
		server = Server.default;
		mixParent = mix;
		id = nil;
		chnlG = Group.new(mixParent.masterG, \addBefore);

		channel_aBus = Bus.audio(server, 16);
		channel_efx_aBus = Bus.audio(server, 2);
		cb_fader_amp = Bus.control(server, 1).value_(0);
		cb_fader_mute = Bus.control(server, 1).value_(0);

		flatSynth = Synth(\Mix_Flatten2Chnl, [
			\in, channel_aBus,
			\out, channel_efx_aBus
		], chnlG, \addToHead);

		faderSynth = Synth(\Mix_Fader, [
			\in, channel_efx_aBus,
			\out, mixParent.audioBus,
			\amp, cb_fader_amp.asMap,
			\mute, cb_fader_mute.asMap
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


	initGui{
		colBack = mixParent.colBack;
		colFront = mixParent.colFront;
		colActive = mixParent.colActive;
		colChange = mixParent.colChange;
		fontBig = mixParent.fontBig;
		fontSmall = mixParent.fontSmall;
		lastObjY = 0;

		chnlFrame = UserView(mixParent.frame, Rect( 5+((mixParent.sizeXChnl+5)*id), 5 ,
			mixParent.sizeXChnl,
			140
		))
		.background_(colBack)
		.drawFunc = {
			Pen.strokeColor = colFront;
			Pen.addRect(Rect(0,0, chnlFrame.bounds.width,chnlFrame.bounds.height));

			Pen.addRect(Rect(5,45, chnlFrame.bounds.width-22,80)); // fqv frame

			Pen.moveTo(5@133);
			Pen.lineTo(chnlFrame.bounds.width-5@133);
			Pen.stroke;
		};

		name = StaticText.new(chnlFrame,Rect(5, 5, chnlFrame.bounds.width-5, 12))
		.string_("ch["++id++"]")
		.stringColor_(colFront)
		.font_(fontBig);

		txtAmp = StaticText.new(chnlFrame,Rect(5, 22, 20, 15))
		.string_("amp:")
		.stringColor_(colFront)
		.font_(fontSmall);

		fqv = FreqScopeView(chnlFrame, Rect(5,45, chnlFrame.bounds.width-22,80));
		fqv.active_(true);
		fqv.inBus_(channel_efx_aBus);
		fqv.freqMode_(1);
		fqv.background_(Color.black);
		fqv.synth.moveBefore(faderSynth);
		// ("fqv id : " ++ fqv.synth.nodeID).postln;

		valAmp = NumberBox(chnlFrame, Rect(27, 23, 20, 15))
		.normalColor_(colFront)
		.background_(colBack)
		.align_(\center)
		.font_(fontSmall);

		sliderAmp = Slider(chnlFrame, Rect(chnlFrame.bounds.width-13, 5, 8, 120))
		.background_(colBack)
		.knobColor_(colActive);

		buttMute = Button(chnlFrame, Rect(27, 5, 20, 15))
		.font_(fontSmall)
		.states_([
			["||",colFront,colBack],
			[">",colFront,colActive]
		]);

		this.refreshGui;
	}

	refreshGui{

		// valAmp.value

		sliderAmp.action_({
			valAmp.value = sliderAmp.value;
			cb_fader_amp.value = sliderAmp.value;
		});

		buttMute.action_({ |butt|
			if(butt.value == 1) { cb_fader_mute.value = 1; };
			if(butt.value == 0) { cb_fader_mute.value = 0; };
		});

		lastObjY = chnlFrame.bounds.height + 5;
	}

	initGuiEfx{
		lastObjY = chnlFrame.bounds.height + 5;
		coll_Efx.size.do{|i|
			this.efx(i).initGui(lastObjY);
			lastObjY = lastObjY + this.efx(i).dimension;
		};
		this.refreshGuiEfx;
	}

	refreshGuiEfx{
		lastObjY = chnlFrame.bounds.height + 5;
		coll_Efx.size.do{|i|
			this.efx(i).refreshGui(lastObjY);
			lastObjY = lastObjY + this.efx(i).dimension;
		};
	}

	unmute {
		if(buttMute.value==0) {
			cb_fader_mute.value = 1;
			buttMute.value = 1;
		};
		^("JMix channel " ++ id ++ " unmute");
	}
	mute {
		if(buttMute.value==1) {
			cb_fader_mute.value = 0;
			buttMute.value = 0;

		};
		^("JMix channel " ++ id ++ " mute");
	}

	fade{|val, time|
		var nwSynth;
		var tempStep;
		var rout;

		nwSynth = Synth(\Mix_NewVal, [
			\bus, cb_fader_amp,
			\val, val,
			\time, time],
			faderSynth,\addBefore);

		rout = Routine.new({
			chnlFrame.background_(colChange);

			(4*time).do({ arg t;
				var newVal = cb_fader_amp.getnSynchronous;
				// newVal.postln;
				valAmp.value = newVal[0];
				sliderAmp.value = newVal[0];
				0.25.wait;
			});

			chnlFrame.background_(colBack);
			valAmp.value = cb_fader_amp.getnSynchronous[0];
			sliderAmp.value = cb_fader_amp.getnSynchronous[0];

			"fadeAmpDone".postln;

		});
		AppClock.play(rout);

		this.refreshMixWindow; // chyba, pokud neni okono aktivni
	}

	refreshMixWindow {	mixParent.refresh;	}

	freeFqv{
		fqv.kill // !!! nutne bez ";"
	}

	free{
		faderSynth.free;
		chnlG.free;
	}

	audioBus { ^channel_aBus; }
	audioEfxBus { ^channel_efx_aBus; }

	effects{ ^coll_Efx; }

	efx{ |num| ^coll_Efx[num]; }
	addEfx{ |num| coll_Efx[num].add; }
	freeEfx{ |num| coll_Efx[num].free; }

	frame { ^chnlFrame; }
}