JMix {
	classvar version = 0.16;
	classvar server;

	classvar efxSDef;
	var numCh, <numEfx;
	var jmixG, <masterG, synG;
	var coll_Channels;

	var masterSynth, master_aBus;

	var <win, mixFrame;

	var <sizeXChnl, <sizeYChnl;
	var <colBack, <colFront, <colActive, <colChange;
	var <fontBig, <fontSmall;

	*new { |numChannels|
		^super.new.init(numChannels);
	}

	init { |xCh|

		server = Server.default;
		efxSDef = this.storeSynth(this.folderEfx);
		numCh = xCh;
		numEfx = efxSDef.size;

		SynthDef(\Mix_Limiter, { | bus |
			Out.ar(0, Limiter.ar(In.ar(bus,2),0.95));
		}).add;

		SynthDef(\Mix_Fader, { | in, out, amp, mute |
			var numCh, tone;
			tone = In.ar(in, 2);
			Out.ar(out, tone * amp * mute);
		}).add;

		SynthDef(\Mix_NewVal, { | bus, val, time |
			ReplaceOut.kr(bus, EnvGen.kr(Env([In.kr(bus), val], [time], \sin), doneAction: 2))
		}).add;

		SynthDef(\Mix_Flatten2Chnl, { | in out |
			var numCh, tone, busStereo;
			numCh = in.numChannels;
			tone = Splay.ar(In.ar(in, numCh),0);
			Out.ar(out, tone);
		}).add;

		server.waitForBoot{
			jmixG = Group.new(addAction:\addToTail);
			masterG = Group.new(jmixG, \addToTail);

			synG = this.inGroup; // add if Ndef kill this group

			master_aBus = Bus.audio(server, 2);
			masterSynth = Synth(\Mix_Limiter,[\bus, master_aBus],masterG);

			coll_Channels = List.new(numCh);
			numCh.do { |i|
				coll_Channels.add(this.addChannel(i));
			};

			"\nJMix init done".postln;
			this.print;
		};
	}

	inGroup{
		// this works too, smaller glitch
		synG = Group.basicNew(server, 999); // Create without sending
		server.sendBundle(nil, synG.newMsg(jmixG, \addToHead););

		// best option, check if exist nodeID by try, how???
		/*
		try {
		if(synG.notNil) {
		("synG nodeID :" ++ synG.nodeID).postln;
		};
		// } {|error| \caught.postln; error.dump }
		}{|error|
		("new synG").postln;
		synG = Group.new(jmixG, \addToHead);
		}
		);
		*/
		^synG;
	}

	storeSynth {|dir, libname=\global, completionMsg, keepDef = true|
		var dict, list;
		dict = IdentityDictionary.new;
		(dir ++ "\/*.scd").pathMatch.do{ |path|
			dict.put(path.basename.splitext[0].asSymbol, 0);
		};

		dict.keysDo{|key|
			if(dict[key]==0){
				dict[key] = thisProcess.interpreter.compileFile("%\/%.scd".format(dir, key)).value;
			};
		};

		dict.do{|def|
			def.add(libname, completionMsg, keepDef);
		};

		list = dict.keys(Array);
		list.sort;
		^list;
	}

	print{
		"\nlist of prepared efx and controls: \n".postln;
		efxSDef.size.do{|i|
			( i.asString ++ " : " ++ efxSDef[i].asString).postln;
			this.channel(0).efx(i).controlNames.size.do{|j|
				( "    " ++ j.asString ++ " : " ++ this.channel(0).efx(i).controlNames[j].asString).postln;
			};
		};
		"\ntree of nodes:\n".postln;
		server.queryAllNodes;
		^"";
	}

	addChannel{|num|
		var chnl;
		chnl = JMix_channel(this);
		chnl.id = num;
		chnl.buildEfx(efxSDef);
		^chnl;
	}

	addEfx{|numChnl, numEfx|
		this.channel(numChnl).efx(numEfx).add;
		^("efx synth " ++ efxSDef[numEfx] ++ " added to JMix channel " ++ numChnl);
	}
	freeEfx{|numChnl, numEfx|
		this.channel(numChnl).efx(numEfx).free;
		^("efx synth " ++ efxSDef[numEfx] ++ " removed from JMix channel " ++ numChnl);
	}

	gui {
		sizeXChnl = 65;
		sizeYChnl = 500;

		colBack = Color.new255(30,30,30);
		colFront = Color.new255(255,255,255);
		colActive = Color.new255(200,50,50);
		colChange = Color.new255(75,65,45);
		fontBig = Font("Segoe UI", 7,true, isPointSize:true);
		fontSmall = Font("Segoe UI", 6, isPointSize:true);

		win = Window.new("JMix v"++version, Rect(900,sizeYChnl-50,15+((sizeXChnl+5)*numCh),sizeYChnl+10))
		.alpha_(0.95)
		.alwaysOnTop_(true)
		.background_(colBack)
		.front
		.onClose_({ this.close; });

		mixFrame = UserView(win, Rect(5, 5, win.bounds.width-10, win.bounds.height-10))
		.background_(colBack)
		.drawFunc = {
			Pen.strokeColor = colFront;
			Pen.addRect(Rect(0,0, mixFrame.bounds.width, mixFrame.bounds.height));
			Pen.stroke;
		};

		numCh.do { |i|
			this.channel(i).initGui;
			this.channel(i).initGuiEfx;
		};
		^"init gui done"
	}

	refresh {
		win.refresh;
		mixFrame.refresh;

		numCh.do { |i|
			this.channel(i).refreshGui;
			this.channel(i).refreshGuiEfx;
		};
	}

	efxSynthDef {|num| ^efxSDef[num];}
	channel{ |num| ^coll_Channels[num]; }

	audioBus { ^master_aBus; }
	ch{ |num|	^coll_Channels[num].audioBus;	}

	folderRoot{ ^Platform.systemExtensionDir ++ "\/JMix"; }
	folderEfx{ ^this.folderRoot ++ "\/Efx"; }

	frame { ^mixFrame; }

	close{
		numCh.do { |i|
			this.channel(i).freeFqv;
		};
		win.close;
		"JMix closed".postln;
	}
	free{
		this.close;
		numCh.do { |i|
			this.channel(i).free;
		};
		masterSynth.free;
		synG.free;
		masterG.free;
		jmixG.free;
	}

	/*
	// protection againg force crtl+. stop
	cmdPeriod{
	// CmdPeriod.add(function)
	this.init(numCh);
	}
	*/
}




