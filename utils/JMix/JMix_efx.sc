JMix_efx
{
	classvar version = 0.12;
	classvar server;
	var parentCh;
	var synthDef;
	var efxSynth;
	var num_cBus;
	var coll_cName, coll_cBus;

	*new{ |parent, def|
		^super.new.init(parent, def);
	}

	init{ |parent, def|
		server = Server.default;
		parentCh = parent;
		synthDef = def;

		this.buildControls;
	}

	buildControls{
		var controlsNames_sd = SynthDescLib.at(synthDef).controlNames;
		// ("controlsNames_sd : " ++ controlsNames_sd).postln;
		num_cBus = -1;
		controlsNames_sd.do{|name|
			if((name.asSymbol != \bus) and: (name.asSymbol != \out),
				{
					num_cBus = num_cBus + 1;
					num_cBus.postln;
				}
			)
		};
		// ("numEfx_cBus : " ++ num_cBus).postln;
		coll_cBus = List.new(num_cBus);
		coll_cName = List.new(num_cBus);
		controlsNames_sd.do{|name|
			if((name.asSymbol != \bus) and: (name.asSymbol != \out),
				{
					// var cbus = Bus.control(server, 1);
					coll_cBus.add(Bus.control(server, 1));
					coll_cName.add(name.asSymbol);
					// name.asSymbol.postln;
				}
			)
		}
	}

	add{
		efxSynth = Synth(synthDef, [
			\bus, parentCh.audioBus,
			\out, parentCh.audioBus
		],parentCh.faderSynth, \addBefore);

		coll_cBus.do{|i|
			// ("name " ++ coll_cName[i]).postln;
			("bus " ++ coll_cBus[i]).postln;

			// efxSynth.set(coll_cName[i],coll_cBus[i]);
		}
	}
	free{
		efxSynth.free;
	}
}