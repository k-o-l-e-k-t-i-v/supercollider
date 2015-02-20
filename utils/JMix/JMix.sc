JMix {
	classvar version = 0.12;
	classvar server;

	classvar mixSDef, efxSDef;
	var numCh, <numEfx;
	var <synG, mixG;
	var coll_Channels;

	var masterSynth, master_aBus;

	var win, <>uv;
	var sizeXChnl, sizeYChnl;
	var <colBack, <colFront, <colActive;
	var <fontBig, <fontSmall;

	*new { |numChannels|
		^super.new.init(numChannels);
	}

	init { |xCh|
		server = Server.default;
		mixSDef = this.storeSynth(this.folderMix); // Mix_Fader = 0; Mix_Limiter = 1
		efxSDef = this.storeSynth(this.folderEfx);
		numCh = xCh;
		numEfx = efxSDef.size;

		server.waitForBoot{
			synG = Group.new;
			mixG = Group.new(addAction:\addToTail);

			master_aBus = Bus.audio(server, 2);
			masterSynth = Synth(this.mixSynthDef(1),[\bus, master_aBus],mixG);

			coll_Channels = List.new(numCh);
			numCh.do { |i|
				coll_Channels.add(this.addChannel(i));
			};
		}
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

	printMix{^("list of prepared efx synth: " ++ mixSDef);}
	printEfx{^("list of prepared efx synth: " ++ efxSDef);}

	addChannel{|num|
		var chnl;
		chnl = JMix_channel(this);
		chnl.id = num;
		chnl.buildEfx(efxSDef);
		^chnl;
	}

	addEfx{|numChnl, numEfx|
		this.channel(numChnl).effect(numEfx).add;
		^("efx synth " ++ efxSDef[numEfx] ++ " added to JMix channel " ++ numChnl);
	}
	freeEfx{|numChnl, numEfx|
		this.channel(numChnl).effect(numEfx).free;
		^("efx synth " ++ efxSDef[numEfx] ++ " removed from JMix channel " ++ numChnl);
	}

	gui {
		sizeXChnl = 65;
		sizeYChnl = 400;
		colBack = Color.new255(30,30,30);
		colFront = Color.new255(255,255,255);
		colActive = Color.new255(200,50,50);
		fontBig = Font("Segoe UI", 7,true, isPointSize:true);
		fontSmall = Font("Segoe UI", 6, isPointSize:true);

		win = Window.new("ja_Mixer v"++version, Rect(900,600,5+((sizeXChnl+5)*numCh),410))
		.alpha_(0.95)
		.alwaysOnTop_(true)
		.background_(colBack)
		.front;

		numCh.do { |i|
			var originX, originY;

			originX = 5+((sizeXChnl+5)*i);
			originY = 5;

			uv = UserView(win, Rect(originX, originY, sizeXChnl, sizeYChnl))
			.background_(colBack)
			// .clearOnRefresh_(false)
			.drawFunc = {
				Pen.strokeColor = colFront;
				Pen.addRect(Rect(0,0, uv.bounds.width,uv.bounds.height));

				Pen.addRect(Rect(5,45, uv.bounds.width-22,80)); // fqv frame

				Pen.moveTo(5@133);
				Pen.lineTo(uv.bounds.width-5@133);
				Pen.stroke;
			};

			this.channel(i).guiChannel;
			this.channel(i).guiEfx;
			// win.refresh;
		};

		win.onClose_({
			this.close;
		});

	}

	mixSynthDef {|num| ^mixSDef[num];}
	efxSynthDef {|num| ^efxSDef[num];}

	channel{ |num| ^coll_Channels[num]; }

	audioBus { ^master_aBus; }
	ch{ |num| ^coll_Channels[num].audioBus; }

	folderRoot{ ^Platform.systemExtensionDir ++ "\/JMix"; }
	folderMix{ ^this.folderRoot ++ "\/Mix"; }
	folderEfx{ ^this.folderRoot ++ "\/Efx"; }

	close{
		numCh.do { |i|
			this.channel(i).freeFqv;
		};
		win.close;
		"JMix closed".postln;
	}
	free{
		// JMix all clean
	}

}




