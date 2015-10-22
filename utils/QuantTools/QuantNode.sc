QuantNode{
	var <>quant;
	var <>node, bus;

	*new {|quant = 1, levels = #[0,1,0], times = #[0.05,0.95], curves = #[7,-7], offset = 0, repeats = inf, fadeTime = 0|
		^super.newCopyArgs(quant).phase(0, levels, times, curves, offset, repeats, fadeTime);
	}
	/*
	*new {|busIndex = 30, quant = 1, fadeTime = 1, repeats = inf, levels = #[0,1,0], times = #[0.05,0.95], curves = #[2,-2]|
	var bus, node, env;
	// var parentKey = currentEnvironment.valueEnvir.postln;
	// var parentKey = thisFunction.envirKey.postln;

	// currentEnvironment.valueEnvir.envir.postln;
	// currentEnvironment.findKeyForValue(\amp).postln;
	bus = Bus.new('control', busIndex, 2, Server.local);
	node = NodeProxy.for(bus);
	// node = NodeProxy.new(Server.local, 'control', 1, bus);
	// node = NodeProxy.control(Server.local, 2);
	node.quant = quant;
	node.fadeTime = fadeTime;
	// node.group_(Server.local.defaultGroup, addAction:\addToHead);

	levels = levels.add(levels[levels.size-1]);
	times = times.add(quant - times.sum);
	times = times.insert(0, 0);
	"levels %".format(levels).postln;
	"times %".format(times).postln;
	node[0] = {
	DemandEnvGen.kr(
	Dseq(levels, repeats),
	Dseq(times, repeats),
	1, curves, 1, 1,
	doneAction:0
	)
	}
	*/
	phase { |index = 0, levels = #[0,1,0], times = #[0.05,0.95], curves = #[7,-7], offset = 0, repeats = inf, fadeTime = 0|
		var nodeProxy;
		var bus,ctl;
		this.node.isNil.if(
			{
				"init new node & bus".postln;
				// bus = Bus.new('control', 30, 2, Server.local);
				// node = NodeProxy.for(bus);
				node = NodeProxy.control(Server.local,1);
			},
			{
				"copy node & bus".postln;
				this.node = super.copy.node.copyState;
				this.bus = super.copy.bus.copyState;

			}
		);
		// ctl = node.controlNames.detect { |x, i| x.postln; i.postln;  }; //x.name == key

		// "current proxyName %".format(
		currentEnvironment.arProxyNames({ |px, key|  px.postln; key.do({|aaa| aaa.postln; }); px.isPlaying; });

		// "nodeProxy %".format(super.copy.envirKey).postln;


		currentEnvironment[nodeProxy.asSymbol].set(\myfreq, currentEnvironment[nodeProxy.asSymbol].source_(levels));
		// thisProcess.interpreter.cmdLine.postln;
		// thisProcess.interpreter.getBackTrace.inspect;

		// thisProcess.interpreter.functionCompileContext.def.sourceCode.postln;
		/*
		this.node.quant = super.copy.quant;
		this.node.fadeTime = fadeTime;

		levels = levels.add(levels[levels.size-1]);
		times = times.add(quant - times.sum);
		times = times.insert(0, 0);
		"levels %".format(levels).postln;
		"times %".format(times).postln;
		node[0] = {
			DemandEnvGen.kr(
				Dseq(levels, repeats),
				Dseq(times, repeats),
				1, curves, 1, 1,
				doneAction:0
			)
		}
		*/
		^node;
	}

	/*
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
	*/


	// phase{ | index = 0, levels = #[0,1,0], times = #[0.05,0.95], curves = #[2,-2], offset = 0, repeats = 1 |

	// }

}