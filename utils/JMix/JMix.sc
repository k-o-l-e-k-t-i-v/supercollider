JMix {
	classvar version = 0.12;
	classvar server;

	classvar mixSDef, efxSDef;

	var <coll_Channels;
	var numCh, <numEfx;
	var <synG, mixG;
	var master_Synth, master_aBus;

	*new { |numChannels|
		^super.new.init(numChannels);
	}

	init { |xCh|

		server = Server.default;
		mixSDef = this.storeSynth(this.folderMix); // Mix_Fader = 0; Mix_Limiter = 1
		efxSDef = this.storeSynth(this.folderEfx);
		numEfx = efxSDef.size;

		server.waitForBoot{
			numCh = xCh;

			synG = Group.new;
			mixG = Group.new(addAction:\addToTail);

			master_aBus = Bus.audio(server, 2);
			master_Synth = Synth(this.mixSynthDef(1),[\bus, master_aBus],mixG);

			coll_Channels = List.newClear(numCh);
			numCh.do { |i|
				this.buildChannel(i);
			};
		}
	}

	buildChannel{|num|
		var chnl = JMix_channel(this);
		chnl.id = num;
		coll_Channels.put(num, chnl);
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
		("list of prepared synth: " ++ list).postln;
		^list;
	}

	gui {
		var win;
		var sizeXChnl, sizeYChnl;
		var colBack, colFront, colActive;
		var fontBig, fontSmall;

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
			var uv, originX, originY;

			originX = 5+((sizeXChnl+5)*i);
			originY = 5;

			uv = UserView(win, Rect(originX, originY, sizeXChnl, sizeYChnl))
			.background_(colBack)
			.drawFunc = {
				Pen.strokeColor = colFront;
				Pen.addRect(Rect(0,0, uv.bounds.width,uv.bounds.height));

				Pen.addRect(Rect(5,45, uv.bounds.width-22,80)); // fqv frame

				Pen.moveTo(5@133);
				Pen.lineTo(uv.bounds.width-5@133);
				Pen.moveTo(5@160);
				Pen.lineTo(uv.bounds.width-5@160);
				Pen.stroke;
			};

			this.channel(i).gui(uv, originX, originY, colBack, colFront, colActive, fontBig, fontSmall);

		};

		win.onClose_({
			numCh.do { |i|
				this.channel(i).free;
			};
			win.close;
			"JMix closed".postln;
		});

	}

	mixSynthDef {|num| ^mixSDef[num];}
	efxSynthDef {|num| ^efxSDef[num];}
	ch{ |num| ^coll_Channels[num].audioBus; }
	channel{ |num| ^coll_Channels[num]; }
	audioBus { ^master_aBus; }

	folderRoot{ ^Platform.systemExtensionDir ++ "\/JMix"; }
	folderMix{ ^this.folderRoot ++ "\/Mix"; }
	folderEfx{ ^this.folderRoot ++ "\/Efx"; }

}




