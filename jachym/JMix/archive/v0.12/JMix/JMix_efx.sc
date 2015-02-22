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
			// ("name " ++ coll_cName[i]).postln;
			// ("bus " ++ coll_cBus[i]).postln;
			// ("spec " ++ coll_cSpec[i]).postln;
		};
		isActive = true;
	}

	free{
		efxSynth.free;
		isActive = false;
	}

	getMetaData{|name|
		var desc = SynthDescLib.at(synthDef);

		if(desc.metadata.notNil) //have metadata
		{
			// ("SynthD : " ++ synthDef ++ " has metadata").postln;

			if(desc.metadata[\specs].notNil) //have specs
			{
				// ("Collected metadata specs : " ++ name ++ " --- " ++ desc.metadata[\specs][name.asSymbol]).postln;
				^desc.metadata[\specs][name.asSymbol];
			}
			{
				("
					SynthDef " ++ synthDef ++ " does`t contain line: \n
					SynthDef(name,{ |nameArg| code... }, metadata: ( specs: ( nameArg: ControlSpec(minVal, maxVal, \lin, stepSize, defaultVal))))
				").postln;
				^nil;
			} //neexistuje definice spec

		}
		{
			("
				SynthDef " ++ synthDef ++ " doesn`t have metadata \n
				SynthDef(name,{ |nameArg| code... }, metadata: ( specs: ( nameArg: ControlSpec(minVal, maxVal, \lin, stepSize, defaultVal))))
			").postln;
			^nil;
		};

	}

	gui{|originY|
		var uv = parentCh.mixParent.uv;
		var colBack = parentCh.mixParent.colBack;
		var colFront = parentCh.mixParent.colFront;
		var colActive = parentCh.mixParent.colActive;
		var fontSmall = parentCh.mixParent.fontSmall;

		var efxFrame, fxButt, name_Efx_cBus, val_Efx_cBus, ez_Efx_cBus;
		var sizeY = 0;

		fxButt = Button(uv, Rect(5, originY + sizeY, uv.bounds.width-10, 15))
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
		sizeY = sizeY + 20;

		if(isActive, {
			num_cBus.do{|i|
				if(coll_cSpec[i] != nil){coll_cBus[i].value = coll_cSpec[i].default;};

				ez_Efx_cBus = EZNumber(uv,        // parent
					Rect(5, originY + sizeY, uv.bounds.width-10, 15),   // bounds
					coll_cName[i], // label
					coll_cSpec[i].asSpec,    // controlSpec
					{ coll_cBus[i].value = ez_Efx_cBus.value; }, // action
					nil,
					labelWidth:30,numberWidth:30,unitWidth:0
				);
				ez_Efx_cBus.setColors(
					stringBackground: colBack,
					stringColor: colFront,
					numBackground: colBack,
					numStringColor: colFront,
					numNormalColor: colFront,
					numTypingColor: colActive
				);
				ez_Efx_cBus.font_(fontSmall);

				sizeY = sizeY + 20;
			};
		});

		sizeY = sizeY + 5;
		^sizeY;
	}

}