// put it into your SCClassLibrary/DefaultLibrary and recompile the class library (Ctr+Shift+L)

// Ja_Mixer SC object, in progress..

JMix {
	var server;
	var numCh;
	var <synG, mixG, ch_group;
	var master_ab, ch_ab;
	var ch_cb_amp, ch_cb_mute;
	var master_Synth, ch_Synth;

	var answ;

	*new{arg xCh;
		^super.new.init(xCh);
	}

	init{arg initCh;
		server = Server.default;
		numCh = initCh;
		synG = Group.new;

		ch_Synth = List.new(numCh);
		ch_ab = List.new(numCh);
		ch_cb_amp = List.new(numCh);
		ch_cb_mute = List.new(numCh);
		ch_group = List.new(numCh);

		master_ab = Bus.audio(server, 2);
		// master_Synth = Synth(\Limiter,[\bus, master_ab],mixG);

		numCh.do { |i|
			ch_group.add(Group.new(synG, \addAfter));
			ch_ab.add(Bus.audio(server, 2));
			ch_cb_amp.add(Bus.control(server, 1));
			ch_cb_mute.add(Bus.control(server, 1));
			/*
			~ch_Synth.add(
			Synth(\Fader, [
			\in, ~ch_ab[i],
			\out, ~master,
			\amp, ~ch_cb_amp[i].asMap,
			\mute, ~ch_cb_mute[i].asMap,
			], ~ch_group[i],\addToTail)
			);
			*/
		};

		mixG = Group.new(addAction:\addToTail);



	}

	kill{
		master_Synth.free;
		master_ab.free;

		numCh.do { |i|
			ch_group[i].free;
		};
		synG.free;
		mixG.free;
	}

	calc{arg x;
		^answ = numCh + x;
	}

	// *initClass Class Methods are called when the library compiles = you can initialize things here
	// that are classvars
	*initClass {



	}


}


