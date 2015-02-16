JMix_v011 {
	classvar version = 0.11;
	classvar server;

	classvar mixSDef, efxSDef;

	var <coll_Channels;
	var numCh;
	var <synG, mixG;
	var master_Synth, master_ab;


	*new { |numChannels|
		^super.new.init(numChannels);
	}

	init { |xCh|

		server = Server.default;
		mixSDef = this.storeSynth(this.folderMix); // Mix_Fader = 0; Mix_Limiter = 1
		// efxSynth = this.storeSynth(this.folderEfx);

		server.waitForBoot{
			numCh = xCh;

			synG = Group.new;
			mixG = Group.new(addAction:\addToTail);

			master_ab = Bus.audio(server, 2);
			master_Synth = Synth(this.mixSynthDef(1),[\bus, master_ab],mixG);

			coll_Channels = List.new(numCh);
			numCh.do { |i|
				coll_Channels.add(JMix_channel(this, i));
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
				dict[key] = thisProcess.interpreter.compileFile("%\/%.scd".format(this.folderMix, key)).value;
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

	mixSynthDef {|num| ^mixSDef[num];}
	chBus{ |num| ^coll_Channels[num].audioBus; }

	folderRoot{ ^Platform.systemExtensionDir ++ "\/JMix"; }
	folderMix{ ^this.folderRoot ++ "\/Mix"; }
	folderEfx{ ^this.folderRoot ++ "\/Efx"; }

}

JMix_channel{
	classvar server, master;
	classvar chID;
	classvar chnlG;

	classvar faderSynth;
	var aBus;
	classvar cb_amp, cb_mute;

	var master_Synth, ch_Synth;
	*new{ |mix, id|
		^super.new.init(mix, id);
	}

	init { |mix, id|
		server = Server.default;
		master = mix;
		chID = id;
		chnlG = Group.new(master.synG, \addAfter);

		aBus = Bus.audio(server, 2);
		cb_amp = Bus.control(server, 1).value_(0.33);
		cb_mute = Bus.control(server, 1).value_(1);

		faderSynth = Synth(master.mixSynthDef(0), [
			\in, aBus,
			\out, master.audioBus,
			\amp, cb_amp.asMap,
			\mute, cb_mute.asMap,
		], chnlG,\addToTail);

	}
	audioBus {^aBus;}
	/*
	at {|i|
	("Index "++i).postln;
	^this;
	}
	*/
}