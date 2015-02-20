JMix_efx
{
	classvar version = 0.12;
	classvar server;
	var parentCh;
	var id;
	var synthDef;
	var efxSynth;
	var num_cBus;
	var coll_cName, coll_cBus, coll_cSpec;

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

		isActive = true;
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
		coll_cSpec = List.new(num_cBus);
		controlsNames_sd.do{|name|
			var metaD;
			if((name.asSymbol != \bus) and: (name.asSymbol != \out),
				{
					("\n").postln;
					("controlsNames_sd " ++ name).postln;
					coll_cBus.add(Bus.control(server, 1));
					coll_cName.add(name);
					coll_cSpec.add(this.getMetaData(name));
				}
			)
		};
	}

	add{
		efxSynth = Synth(synthDef, [
			\bus, parentCh.audioBus,
			\out, parentCh.audioBus
		],parentCh.faderSynth, \addBefore);

		num_cBus.do{|i|
			efxSynth.set(coll_cName[i],coll_cBus[i].asMap);
			("name " ++ coll_cName[i]).postln;
			("bus " ++ coll_cBus[i]).postln;
			("spec " ++ coll_cSpec[i]).postln;
		};
		isActive = true;
	}

	free{
		efxSynth.free;
		isActive = false;
	}

	getMetaData{|name|
		var desc = SynthDescLib.at(synthDef);

		if(desc.metadata.notNil) //ma metadata
		{
			("SynthD : " ++ synthDef ++ " ANO metadata").postln;

			if(desc.metadata[\specs].notNil) //ma specs
			{
				("collect specs : " ++ name ++ " like " ++ desc.metadata[\specs][name.asSymbol]).postln;
				^desc.metadata[\specs][name.asSymbol];
			}
			{ ("SynthD : " ++ synthDef ++ " ne specs:").postln; ^nil; } //neexistuje definice spec

		}
		{ ("SynthD : " ++ synthDef ++ " nema metadata").postln;	^nil; }; //nejsou metadata

	}

	gui{|originY|
		var uv = parentCh.mixParent.uv;
		var colBack = parentCh.mixParent.colBack;
		var colFront = parentCh.mixParent.colFront;
		var colActive = parentCh.mixParent.colActive;
		var fontSmall = parentCh.mixParent.fontSmall;

		var efxFrame, fxButt, name_Efx_cBus, val_Efx_cBus, ez_Efx_cBus;
		var sizeY = 0;

		// ("coll_cName : " ++ coll_cName.size).postln;
		// ("coll_cBus : " ++ coll_cBus.size).postln;
		// ("coll_cSpec : " ++ coll_cSpec.size).postln;

		fxButt = Button(uv, Rect(5, originY + sizeY, uv.bounds.width-10, 15))
		.font_(fontSmall)
		.states_([
			[synthDef,colFront,colBack],
			[synthDef,colFront,colActive]
		])
		.action_({ |butt|
			if(butt.value == 1) {
				this.add;
				// uv.refresh;
			};
			if(butt.value == 0) {
				this.free;
				// uv.refresh;
			};
		});
		sizeY = sizeY + 20;

		if(isActive, {
			num_cBus.do{|i|

				ez_Efx_cBus = EZNumber(uv,        // parent
					Rect(5, originY + sizeY, uv.bounds.width-5, 15),   // bounds
					coll_cName[i], // label
					coll_cSpec[i].asSpec,    // controlSpec
					{ coll_cBus[i].value = ez_Efx_cBus.value; }, // action
					nil,
					labelWidth:25,numberWidth:30,unitWidth:5
				);
				ez_Efx_cBus.setColors(Color.grey,Color.white);
				ez_Efx_cBus.font_(fontSmall);


				/*
				name_Efx_cBus = StaticText.new(uv,Rect(5, originY + sizeY, 35, 20))
				.string_(coll_cName[i])
				.stringColor_(colFront)
				.font_(fontSmall);

				val_Efx_cBus = NumberBox(uv, Rect(uv.bounds.width-30, originY + sizeY, 25, 15))
				.normalColor_(colFront)
				.background_(colBack)
				.align_(\center)
				.font_(fontSmall)
				.buttonsVisible_(isActive)
				.value_(coll_cSpec[i].unmap)
				// .clipLo_(0)
				// .scroll_step_(10)
				// .asSpec_(coll_cSpec[i].asSpec)
				.action_({
				coll_cBus[i].value = val_Efx_cBus.value;
				})
				.focus;
				*/
				sizeY = sizeY + 20;
			};
		});

		sizeY = sizeY + 10;
		// sizeY.postln;
		^sizeY;
	}

}