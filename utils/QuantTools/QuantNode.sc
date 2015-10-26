QuantNode {
	var instance;
	// var proxy, index, channelOffset;
	var <>key, <>quant;
	var <>node, bus;

	*new {|key, quant| ^super.new.init(key, quant);	}

	init{|key, quant|
		instance.isNil.if(
			{
				instance = this;
				instance.key = key;
				instance.quant = quant
			},
			{

			}
		);
		this.print;

		^instance;
	}


	print{
		"init QuantNode".postln;
		"\t - key : %".format(instance.key).postln;
		"\t - quant : %".format(instance.quant).postln;



		^nil;
	}


	map2 {|func, proxy, channelOffset, index|
		var key = \amp;
		var busIndex = 30;
		var pnm = ProxyNodeMap.new;
		var node = NodeProxy.control(Server.local, 1);
		var levels = #[0,1,0];
		var times = #[0.05,0.95];

		pnm = proxy.nodeMap;
		node.quant = quant;
		node.group = proxy.group;
		node.bus = proxy.bus;
		// node.fadeTime = fadeTime;
		/*
		node.source_({
		// var Detec
		// Pbind.free;
		// EnvGen.free;
		var sig;
		Pbind(\type, \set, \args, [\trigEnv], \trigEnv, 1, \bus, 0, \dur, 4).play(currentEnvironment.clock,quant:4);
		sig = EnvGen.kr(
		Env(levels,times),
		gate:\trigEnv.tr,
		timeScale: (1/currentEnvironment.clock.tempo)
		);
		});
		*/
		// pnm.put(key, node);
		// proxy.set(\amp, NodeProxy.control(Server.local, 1).source_(func));

		this.print(func, proxy, channelOffset, index);
		^nil;
	}


	map {|proxy, key, source|
		var tildaName;
		var pnm = ProxyNodeMap.new;
		var node = NodeProxy.new(Server.local, \control, 1);
		node.group = proxy.group;
		node.source = source;
		"\n/////////////////////////////////\n".postln;
		pnm = proxy.nodeMap;
		// pnm.put(key, node.source.def.sourceCode);
		pnm.put(key, node);


		// pnm.asCode.postln;
		pnm.controlNames.do({|cntName, bus|
			var source = cntName.defaultValue;
			"cntName: %".format(cntName).postln;
			"\t - name : %".format(cntName.name).postln;
			"\t - index : %".format(cntName.index).postln;
			"\t - defaultValue : %".format(cntName.defaultValue).postln;
			source.isKindOf(NodeProxy).if ({
				"\t\t - nodeBus : %".format(source.bus).postln;
				"\t\t - node isPlaying : %".format(source.isPlaying).postln;
				"\t\t - busPlug busArg : %".format(source.busArg).postln;
				"\t\t - node group : %".format(source.group ).postln;

			});
			"\t - rate : %".format(cntName.rate).postln;
			"\t - numChannels : %".format(cntName.numChannels).postln;
			// var cnt = ControlName(

			// args.postln;

			"nodeBus?: %".format(bus).postln;


		});
		"proxy.envirKey: %".format(proxy.envirKey).postln;

		// pnm.at(key).postln;
		// pnm.settingKeys.postln;
		// pnm.mappingKeys.postln;
		// pnm.parents.postln;

		// pnm.asCode(("~" ++ proxy.envirKey), true).interpret;
		// pnm.asCode(proxy.envirKey, true).postln;
		tildaName = "code: ~%".format(pnm.asCode(proxy.envirKey, true)).postln;
		// pnm.asCode(proxy.envirKey, true).postln;

		nil
	}


	/*
	*new {|proxy, quant = 1, levels = #[0,1,0], times = #[0.05,0.95], curves = #[2,-2], fadeTime = 1, repeats = inf|
	var bus, node, env;
	var pnm = proxy.nodeMap.copyState;
	// pnm.contr
	var busIndex = 30;

	node = NodeProxy.control(Server.local, 2);
	node.quant = quant;
	// node.fadeTime = fadeTime;
	node.source_({
	// var Detec
	// Pbind.free;
	// EnvGen.free;
	var sig;
	Pbind(\type, \set, \args, [\trigEnv], \trigEnv, 1, \bus, busIndex, \dur, 4).play(currentEnvironment.clock,quant:4);
	sig = EnvGen.kr(
	Env(levels,times),
	gate:\trigEnv.tr,
	timeScale: (1/currentEnvironment.clock.tempo)
	);
	/*
	EnvGen.kr(
	Env(levels,times),
	Impulse.kr(1/4*currentEnvironment.clock.tempo),
	timeScale: 1/currentEnvironment.clock.tempo,
	doneAction: 2
	)
	*/
	// ReplaceOut.kr(busIndex, sig);
	});
	currentEnvironment.reduce;


	^node;

	}
	*/
	/*
	*new {|busIndex = 30, quant = 1, fadeTime = 1, repeats = inf, levels = #[0,1,0], times = #[0.05,0.95], curves = #[2,-2]|
	var bus, node, env;
	// var parentKey = currentEnvironment.valueEnvir.postln;
	// var parentKey = thisFunction.envirKey.postln;

	// currentEnvironment.valueEnvir.envir.postln;
	// currentEnvironment.findKeyForValue(\amp).postln;
	// bus = In.kr(busIndex, 1);
	// bus = Bus.new('control', busIndex, 2, Server.local);
	// bus.newFrom(
	// node = NodeProxy.for(bus);
	// node = NodeProxy.new(Server.local, 'control', 1, bus);
	node = NodeProxy.control(Server.local, 2);
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
	};
	^node;
	// Server.local.setSharedControl(busIndex, node);
	// ^ReplaceOut.kr(busIndex, node);
	}
	*/
	/*
	*new {|quant = 1, levels = #[0,1,0], times = #[0.05,0.95], curves = #[7,-7], offset = 0, repeats = inf, fadeTime = 0|
	"thisFunctionDef.sourceCode : %".format(thisFunctionDef.sourceCode).postln;
	^super.newCopyArgs(quant).phase(0, levels, times, curves, offset, repeats, fadeTime);
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
				// node = NodeProxy.control(Server.local,1);
			},
			{
				"copy node & bus".postln;
				// this.node = super.copy.node.copyState;
				// this.bus = super.copy.bus.copyState;

			}
		);

		// ctl = node.controlNames.detect { |x, i| x.postln; i.postln; true;  }; //x.name == key
		// "current proxyName %".format(
		currentEnvironment.arProxyNames({ |px, key|  px.postln; key.do({|aaa| aaa.postln; }); px.isPlaying; });

		// "nodeProxy %".format(super.copy.envirKey).postln;



		// currentEnvironment[nodeProxy.asSymbol].set(\myfreq, currentEnvironment[nodeProxy.asSymbol].source_(levels));
		thisProcess.interpreter.cmdLine.postln;
		// thisProcess.interpreter.getBackTrace.inspect;

		// thisProcess.interpreter.functionCompileContext.def.sourceCode.postln;

		node = NodeProxy.control(Server.local,1);
		// node.bus = \amp;
		// this.node.quant = super.copy.quant;
		// this.node.fadeTime = fadeTime;

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
		};
		// node.play;
		node[0] = {MouseX.kr(0, 1)};
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