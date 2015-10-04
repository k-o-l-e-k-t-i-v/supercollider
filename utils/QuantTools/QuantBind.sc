QuantBind {
	classvar <version = 0.065;
	classvar <>stage = \dafault;

	var <>key, <>quant;
	var >instance;
	var cycles;
	var currentCycle, currentStage;

	*new {|key = \amp, quant = 1, dur = nil, levels = #[0,1,0], repeats = 1|
		// superc.copy.cycles.postln;
		dur.isNil.if(
			{^super.newCopyArgs(key, quant).init },
			{^super.newCopyArgs(key, quant).init.phase(0, dur, levels, repeats); }
		);
	}

	*setStage { |name|
		stage = name.asSymbol;
		// super.copy.instance.play;
		// super.new.init.
	}

	init {
		instance = this;
		cycles = IdentityDictionary.new;
		currentCycle = 0;
	}

	stage {|name|
		currentStage = name.asSymbol;
		currentCycle = 0;
	}

	phase { |nextCycle, dur = #[0.5], levels = #[0,1,0], repeats = 1 |

		var phaseEvent = ();
		currentStage.isNil.if({ currentStage = \default; });

		("currentStage : %".format(currentStage)).warn;

		repeats.do({
			var currentCycleEvent;
			var nextEvent;

			phaseEvent = (currentStage.asSymbol : [nextCycle, Pbind(key.asSymbol, levels, \dur, dur)]);
			"phaseEvent : ".postln;
			phaseEvent.postcs;

			("currentCycle : %".format(currentCycle)).warn;
			cycles.at(currentCycle.asSymbol).isNil.if({
				currentCycleEvent = ();
				"eventReset".postln;
				cycles.add(currentCycle.asSymbol -> currentCycleEvent);
			});
			currentCycleEvent = cycles.at(currentCycle.asSymbol);
			("currentCycleEvent : %".format(currentCycleEvent)).warn;
			nextEvent = currentCycleEvent.next(phaseEvent);
			("nextEvent : %".format(nextEvent)).warn;
			cycles.add(currentCycle.asSymbol -> nextEvent);

			("FIN cycles.at(%) : %".format(currentCycle.asSymbol, cycles.at(currentCycle.asSymbol))).warn;
			currentCycle = currentCycle + 1;
		});
		"\n".postln;
	}

	play2{|stage|
		var	r;
		r = Routine { |inval|
			    loop {
				var currentCycleEvent;
				("currentStage : %".format(currentStage)).warn;

				currentCycle = currentCycle + 1;
				// ("currentCycle : %".format(currentCycle)).postln;

				currentCycleEvent = cycles.at(currentCycle.asSymbol);
				// ("currentCycleEvent : %".format(currentCycleEvent)).postln;

				        postf("beats: % seconds: % time: % \n",
					            thisThread.beats, thisThread.seconds, Main.elapsedTime
				        );
				        quant.yield;
			    }
		}.play;
		^r;
	}


	play {|which = #[0], repeats = inf|
		var pbind;
		var signalStream = Pn(stage.asSymbol,inf);
		var listEvent = List.newClear;

		currentCycle = 0;
		listEvent.add(Pseq(stage.asArray,inf));
		// listEvent.add(Pseq([\aaa], inf));
		cycles.asSortedArray.do({ |oneCycle|
			"oneCycle : %".format(oneCycle.postcs);
			listEvent.add(cycles.at(currentCycle.asSymbol));
			currentCycle = currentCycle + 1;
		});
		listEvent.do({|e|
			e.postcs;
		});

		pbind = Pdfsm(listEvent, 0,1).trace.play;

		^pbind;
	}


	print{

		var txt = "\nQntBind | % | %q | - (ver%)".format(super.copy.key, super.copy.quant, version);
		/*
		slots.asSortedArray.do({ |oneSlot|
		("oneSlot : %".format(oneSlot)).warn;
		txt = txt + "\n %".format(oneSlot[0]);
		oneSlot[1].asSortedArray.do({|oneCycle|
		("oneCycle : %".format(oneCycle[1])).warn;
		txt = txt + "\n\t - %".format(oneCycle[1]);
		});
		});
		*/
		txt.postln;
	}



	pattern2array{|pattern|
		var arr;
		pattern.do({|i|	arr.add(i);	})
		^arr;
	}



}
