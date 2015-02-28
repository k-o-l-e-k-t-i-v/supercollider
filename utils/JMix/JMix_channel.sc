JMix_channel{
	classvar version = 0.14;
	classvar server;

	var <mixParent;

	var chnlG, id;
	var channel_aBus;
	var <faderSynth;
	var cb_fader_amp, cb_fader_mute;

	var coll_Efx;

	var name, txtAmp, fqv;
	var valAmp, sliderAmp, buttMute;

	var chnlFrame, originX, originY;

	var colBack, colFront, colActive;
	var fontBig, fontSmall;
	var lastObjY;

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
		cb_fader_mute = Bus.control(server, 1).value_(0);

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


	initGui{
		colBack = mixParent.colBack;
		colFront = mixParent.colFront;
		colActive = mixParent.colActive;
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
		fqv.inBus_(channel_aBus);
		fqv.freqMode_(1);
		fqv.background_(Color.black);

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
			// ("pred lastObjY :" ++ lastObjY).postln;
			this.efx(i).initGui(lastObjY);
			lastObjY = lastObjY + this.efx(i).dimension;
			// ("this.efx(i).dimension :" ++ this.efx(i).dimension).postln;
		};
		this.refreshGuiEfx;
	}

	refreshGuiEfx{
		lastObjY = chnlFrame.bounds.height + 5;
		coll_Efx.size.do{|i|

			this.efx(i).refreshGui(lastObjY);
			lastObjY = lastObjY + this.efx(i).dimension;
			// ("this.efx(i).dimension :" ++ this.efx(i).dimension).postln;
			// ("po refresh lastObjY :" ++ lastObjY).postln;
		};
	}

	freeFqv{
		fqv.kill // !!! nutne bez ";"
	}

	audioBus { ^channel_aBus; }

	effects{ ^coll_Efx; }

	efx{ |num| ^coll_Efx[num]; }
	addEfx{ |num| coll_Efx[num].add; }
	freeEfx{ |num| coll_Efx[num].free; }

	frame { ^chnlFrame; }
}