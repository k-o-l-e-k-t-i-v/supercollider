QuantNode{
	var <>key, <>quant;

	*new {|quant = 1, fadeTime = 1, levels = #[0,1,0], times = #[0.05,0.95], curves = #[2,-2]|
		var node, env;
		var parentKey = currentEnvironment.valueEnvir.postln;
		// var parentKey = thisFunction.envirKey.postln;

		// currentEnvironment.valueEnvir.envir.postln;
		// currentEnvironment.findKeyForValue(\amp).postln;

		node = NodeProxy.control(Server.local, 1);
		node.quant = quant;
		node.fadeTime = fadeTime;
		node.group_(Server.local.defaultGroup, addAction:\addToHead);

		// node[1] = \set -> Pbind(\args, [\trig], \trig, 1, \dur, Pseq([Pn(4,4),1,3], inf));
		// node[1] = \set -> Pbind(\args, [\trig], \trig, 1, \dur, Pseq([4], inf));
		// node.set(\trig, Pbind(\type, \set, \args, [\trig], \trig, 1, \dur, quant ));
		TempoClock.default.sched(0, {
			// node.resume;
			// node.release(times.sum);

			node[0] = { DemandEnvGen.kr(
				Dseq([0,1,0], 4),
				Dseq([0.05,3.95], 4),
				7, // cubic interpolation
				doneAction:0
			);

			};
			/*
			node[0] = {
			EnvGen.kr(
			Env.new(
			[0,1,0],
			[0.05,0.95],
			[2,-2]
			)
			// \trig.tr,
			// timeScale: 1/currentEnvironment[\tempo].clock.tempo,
			// doneAction:2

			)
			};
			// (\trig : 1);
			*/
			"tick".postln;
			node.quant});
		// TempoClock.default.sched(times.sum, {node.pause; node.quant;});

		TempoClock.default.sched(40, { TempoClock.default.clear; "stop".postln; nil;});
		// Pn(Penv(super.copy.syncBeat_levels, super.copy.syncBeat_times, super.copy.syncBeat_curves), inf)

		// proxy.xmap(key.asSymbol, node);
		^node;
	}

	// phase{ | index = 0, levels = #[0,1,0], times = #[0.05,0.95], curves = #[2,-2], offset = 0, repeats = 1 |

	// }

}