JMix_efx
{
	classvar version = 0.12;
	classvar server;
	var parentCh;
	var id;
	var synthDef;
	var efxSynth;
	var num_cBus;
	var coll_cName, coll_cBus;

	var isActive;
	var activeSizeY;
	var <gapY_active, gapY_off, gapY_cBus;

	*new{ |parent, def|
		^super.new.init(parent, def);
	}

	init{ |parent, def|
		server = Server.default;
		parentCh = parent;
		synthDef = def;
		this.buildControls;

		isActive = false;
		gapY_cBus = 15;
	}

	id_{|num| id = num;}

	buildControls{
		var controlsNames_sd = SynthDescLib.at(synthDef).controlNames;

		num_cBus = 0;
		controlsNames_sd.do{|name|
			if((name.asSymbol != \bus) and: (name.asSymbol != \out),
				{
					num_cBus = num_cBus + 1;
				}
			)
		};
		coll_cBus = List.new(num_cBus);
		coll_cName = List.new(num_cBus);
		controlsNames_sd.do{|name|
			if((name.asSymbol != \bus) and: (name.asSymbol != \out),
				{
					coll_cBus.add(Bus.control(server, 1));
					coll_cName.add(name);
				}
			)
		};

		gapY_active = num_cBus * gapY_cBus;
	}

	add{
		efxSynth = Synth(synthDef, [
			\bus, parentCh.audioBus,
			\out, parentCh.audioBus
		],parentCh.faderSynth, \addBefore);

		num_cBus.do{|i|
			efxSynth.set(coll_cName[i],coll_cBus[i].asMap);
			// ("name " ++ coll_cName[i]).postln;
			// ("bus " ++ coll_cBus[i]).postln;
		};
		isActive = true;
	}

	free{
		efxSynth.free;
		isActive = false;
	}

	gui{|uv, colBack, colFront, colActive, fontSmall, originY|
		var efxFrame, fxButt, name_Efx_cBus, val_Efx_cBus;

		if(isActive,
			{
				efxFrame = Rect(5, originY, uv.bounds.width - 10, gapY_active);
			},{
				efxFrame = Rect(5, originY, uv.bounds.width - 10, gapY_cBus);
			}
		);

		fxButt = Button(uv, Rect(5, 150+(80*id), uv.bounds.width-10, 15))
		.font_(fontSmall)
		.states_([
			[synthDef,colFront,colBack],
			[synthDef,colFront,colActive]
		])
		.action_({ |butt|
			if(butt.value == 1) {
				this.add;
			};
			if(butt.value == 0) {
				this.free;
			};
		});

		num_cBus.do{|i|

			name_Efx_cBus = StaticText.new(uv,Rect(5, 180+(80*id)+(20*i), 35, 20))
			.string_(coll_cName[i])
			.stringColor_(colFront)
			.font_(fontSmall);

			val_Efx_cBus = NumberBox(uv, Rect(uv.bounds.width-30, 180+(80*id)+(20*i), 25, 15))
			.normalColor_(colFront)
			.background_(colBack)
			.align_(\center)
			.font_(fontSmall)
			.value_(100)
			.clipLo_(0)
			.scroll_step_(10)
			.action_({
				coll_cBus[i].value = val_Efx_cBus.value;
			});
		}


	}
}