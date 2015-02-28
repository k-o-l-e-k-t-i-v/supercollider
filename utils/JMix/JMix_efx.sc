JMix_efx
{
	classvar version = 0.14;
	classvar server;
	var parentCh;
	var id;
	var synthDef;
	var efxSynth;
	var num_cBus;
	var coll_NumBox, coll_cName, coll_cBus, coll_cSpec;

	var isActive;
	var sizeY;

	var efxButt;

	var efxFrame, originX, originY;

	var colBack, colFront, colActive;
	var fontSmall;

	*new{ |parent, def|
		^super.new.init(parent, def);
	}

	init{ |parent, def|
		server = Server.default;
		parentCh = parent;
		synthDef = def;
		isActive = false;

		this.buildControls;
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
		coll_NumBox = List.new(num_cBus);

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

	getMetaData{|name|
		var desc = SynthDescLib.at(synthDef);

		if(desc.metadata.notNil) //have metadata
		{
			// ("SynthD : " ++ synthDef ++ " has metadata").postln;
			if(desc.metadata[\specs].notNil) //have specs
			{
				// ("Collected metadata specs : " ++ name ++ " --- " ++ desc.metadata[\specs][name.asSymbol]).postln;
				^desc.metadata[\specs][name.asSymbol];
			}{
				("
					SynthDef " ++ synthDef ++ " does`t contain line: \n
					SynthDef(name,{ |nameArg| code... }, metadata:
					( specs: ( nameArg: ControlSpec(minVal, maxVal, \lin, stepSize, defaultVal))))
				").postln;
				^nil;
			} //neexistuje definice spec
		}{
			("
				SynthDef " ++ synthDef ++ " doesn`t have metadata \n
				SynthDef(name,{ |nameArg| code... }, metadata:
				( specs: ( nameArg: ControlSpec(minVal, maxVal, \lin, stepSize, defaultVal))))
			").postln;
			^nil;
		};
	}

	refreshMixWindow {	parentCh.mixParent.refresh;	}

	initGui{|originY|
		var tempSizeY;
		sizeY = 0;

		colBack = parentCh.mixParent.colBack;
		colFront = parentCh.mixParent.colFront;
		colActive = parentCh.mixParent.colActive;
		fontSmall = parentCh.mixParent.fontSmall;

		efxFrame = UserView(parentCh.mixParent.frame,
			Rect(
				parentCh.frame.bounds.left,
				originY + 10,
				parentCh.frame.bounds.width,
				25
			)
		)
		.background_(colBack)
		.drawFunc = {
			Pen.strokeColor = colFront;
			Pen.addRect(Rect(0,0, efxFrame.bounds.width, efxFrame.bounds.height));
			Pen.stroke;
		};


		efxButt = Button(efxFrame, Rect(5, 5, efxFrame.bounds.width-10, 15))
		.font_(fontSmall)
		.states_([
			[synthDef,colFront,colBack],
			[synthDef,colFront,colActive]
		])
		.action_({ |butt|
			if(butt.value == 1) { this.add; };
			if(butt.value == 0) { this.free; };
		});
		sizeY = sizeY + 20;


		tempSizeY = sizeY+5;
		num_cBus.do{|i|
			var oneNumBox;

			if(coll_cSpec[i] != nil){coll_cBus[i].value = coll_cSpec[i].default;};

			oneNumBox = EZNumber.new(
				efxFrame, // parent
				Rect(5, tempSizeY, efxFrame.bounds.width-10, 15),	// bounds
				coll_cName[i], // label
				coll_cSpec[i].asSpec,    // controlSpec
				{ coll_cBus[i].value = oneNumBox.value; }, // action
				nil,
				labelWidth:30,numberWidth:30,unitWidth:0
			)
			.setColors(
				stringBackground: colBack,
				stringColor: colFront,
				numBackground: colBack,
				numStringColor: colFront,
				numNormalColor: colFront,
				numTypingColor: colActive
			)
			.font_(fontSmall);

			coll_NumBox.add(oneNumBox);
			tempSizeY = tempSizeY + 20;
		};
	}

	refreshGui{|originY|

		efxFrame.moveTo(parentCh.frame.bounds.left, originY + 10);
		efxFrame.resizeTo(efxFrame.bounds.width, sizeY + 5);

		efxButt.bounds_(Rect(5, 5, efxFrame.bounds.width-10, 15));
	}

	add{
		if(isActive == false){
			efxSynth = Synth(synthDef, [
				\bus, parentCh.audioBus,
				\out, parentCh.audioBus ],
				parentCh.faderSynth, \addBefore);
			num_cBus.do{|i|
				efxSynth.set(coll_cName[i],coll_cBus[i].asMap);
				sizeY = sizeY + 20;
			};
			efxButt.value_(1);
			isActive = true;
		};

		this.refreshMixWindow;
	}

	free{
		if(isActive == true){
			efxSynth.free;
			num_cBus.do{|i|
				sizeY = sizeY - 20;
			};
			efxButt.value_(0);
			isActive = false;
		};

		this.refreshMixWindow;
	}

	changeValue{|target, val|
		// coll_NumBox
		// coll_cName
		coll_cBus[target].value = val;
		coll_NumBox[target].value = val;
		// coll_cBus[i].value
		this.refreshMixWindow; // chyba, pokud neni okono aktivni
	}

	dimension { ^sizeY + 5; }
	frame { ^efxFrame; }
	controlNames { ^coll_cName; }
}