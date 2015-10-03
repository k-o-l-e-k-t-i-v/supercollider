QuantBind {
	classvar <version = 0.065;
	classvar >stage = \dafault;

	var <>key, <>quant;
	var cycles, event;
	var currentCycle, currentStage;

	*new {|key = \amp, quant = 1, dur = nil, levels = #[0,1,0], repeats = 1|
		dur.isNil.if(
			{^super.newCopyArgs(key, quant).init },
			{^super.newCopyArgs(key, quant).init.phase(dur, levels, repeats); }
		);
	}

	*setStage { |name| stage = name.asSymbol;  }

	init {
		"Init".warn;
		cycles = IdentityDictionary.new;
		event = ();
		currentCycle = 0;
	}

	stage {|name|
		currentStage = name.asSymbol;

		// cycles = Dictionary.new;
		// event = ();
		// event = event.next((currentStage.asSymbol : nil));
		currentCycle = 0;
	}

	phase { |dur, levels = #[0,1,0], repeats = 1 |

		var phaseEvent = ();
		currentStage.isNil.if({ currentStage = \default; });

		("currentStage : %".format(currentStage)).warn;

		phaseEvent = (currentStage.asSymbol : Pbind(key.asSymbol, Pseq([levels.asArray]), \dur, 0.5));
		"phaseEvent : ".postln;
		phaseEvent.postcs;

		repeats.do({
			var currentCycleEvent;
			var nextEvent;
			cycles.at(currentCycle.asSymbol).isNil.if({
				currentCycleEvent = ();
				("currentCycle : %".format(currentCycle)).warn;
				"eventReset".postln;
				cycles.add(currentCycle.asSymbol -> currentCycleEvent);
			},{

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
		/*
		// ("index : %".format(index)).warn;
		// currentCycle = index;
		repeats.do({
		// var tempEvent;
		("levels : %".format(levels.postcs));
		("cycles.at(currentCycle.asSymbol) : %".format(cycles.at(currentCycle.asSymbol))).warn;
		cycles.at(currentCycle.asSymbol).isNil.if(
		{ event = (); "eventReset".postln; },
		{
		event.at(currentStage.asSymbol).postln;
		// event.at(currentStage.asSymbol).notNil.if({
		// var temp;
		// temp = event;
		// event = ();
		// event = temp;

		// "eventNew".postln; });
		}

		);
		// ("event : %".format(event)).warn;
		// event = event.next((currentStage.asSymbol : "fff"));
		// event = event.next((currentStage.asSymbol : Pbind(\type, \set, \args, [key.asSymbol], key.asSymbol, Pseq([levels.asArray]), \dur, 0.5)));

		// event = cycles.at(currentCycle.asSymbol).next((currentStage.asSymbol : Pbind(key.asSymbol, Pseq([levels.asArray]), \dur, 0.5)));
		event = event.next((currentStage.asSymbol : Pbind(key.asSymbol, Pseq([levels.asArray]), \dur, 0.5)));
		cycles.add(currentCycle.asSymbol -> event);
		("cycles.at(currentCycle.asSymbol) : %".format(cycles.at(currentCycle.asSymbol))).warn;
		currentCycle = currentCycle + 1;
		cycles.postcs;
		});
		*/
		/*(
		var event = (z:2);
		var symbol = \aaa;
		var value = 10;
		event.next((symbol.asSymbol : value));
		)*/

		// event.next((currentStage.asSymbol : [1, Pbind(\type, \set, \args, [key.asSymbol], key.asSymbol, Pseq([levels.asArray]), \dur, 0.5) ].asArray));
		// event.next((currentStage.asSymbol : (Pbind(\type, \set, \args, [key.asSymbol], key.asSymbol, Pseq([levels.asArray]), \dur, 0.5)).asStream));
		// event = event.next((currentStage.asSymbol : "fff"));

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

	play {|which = #[0], repeats = inf|
		var pbind;
		var signalStream = Pn(stage.asSymbol,inf).asStream;
		var listEvent = Pseq([signalStream,]);
		// listEvent.add(signalStream);

		cycles.asSortedArray.do({ |oneCycle|
			"oneCycle : %".format(oneCycle.postcs);
			// slots.do({|oneSlot|
			// ("oneSlot : %".format(oneSlot)).warn;
			// oneSlot.postcs;
			// });
		});

		/*
		slots.asSortedArray.do({ |oneSlot|
		("oneSlot : %".format(oneSlot)).warn;
		// txt = txt + "\n %".format(oneSlot[0]);
		oneSlot[1].asSortedArray.do({|oneCycle|
		"oneCycle : %".format(oneCycle[1].postcs);
		list.add(oneCycle[1]);
		// oneCycle[1].postcs;
		// txt = txt + "\n\t - %".format(oneCycle[1]);
		});
		});
		*/


		pbind = Pdfsm(
			[
				Pn(stage.asSymbol,inf),
				/*
				stage.asStream,
				(
				\index : 0,
				\stageA : [ 1, Pbind(\type, \set, \args, [\amp], \amp, Pseq([0,1,0.2]), \dur, 0.5) ],
				\stageB : [ 1, Pbind(\type, \set, \args, [\amp], \amp, Pseq([0,1,0.2,0.5,0.3,0.4,0]), \dur, 0.125) ],
				),
				(
				\index : 1,
				\default : [ 0, Pbind(\type, \set, \args, [\amp], \amp, Pseq([0,1,0.2]), \dur, 2) ],
				),
				*/
			]
			,0,1,
		).trace;

		// "(
		"%:[%, %],)".format("stageA", "nextIndex", "pbind")

		^pbind;
	}




	pattern2array{|pattern|
		var arr;
		pattern.do({|i|	arr.add(i);	})
		^arr;
	}



}
