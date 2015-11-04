QuantNode {

	var <>key;
	var >levels, >times, >curves;
	var <node, <prewNode;
	var group, bus;
	var clock;

	*new {|key, quant, fadeTime| ^super.new.init(key, quant, fadeTime);	}

	init{|key, quant, fadeTime|
		var instance;
		this.key = key;

		instance = QuantMap.currentNode;
		"instance: %".format(instance).postln;
		instance.isNil.if(
			{
				var defValue = QuantMap.currentProxy.getDefaultVal(key.asSymbol);
				"% defValue: %".format(QuantMap.currentProxy.envirKey, defValue).postln;

				instance = this;
				node = NodeProxy.control(Server.local, 1);
				node.set(key.asSymbol, defValue); // ?? jak udelat fade z tyhle hodnoty

				clock = TempoClock.new();
				clock.permanent = true;
			},
			{
				node = instance.node;
			}
		);

		node.fadeTime = fadeTime;
		node.quant = quant;

		QuantMap.add(instance);
		^instance;
	}

	print{
		"init QuantNode %".format(QuantMap.findProxy(this)).postln;
		"\t - key : %".format(key).postln;
		"\t - quant : %".format(node.quant).postln;
		"\t - fadeTime : %".format(node.fadeTime).postln;
		"\t - levels : %".format(levels).postln;
		"\t - times : %".format(times).postln;
		"\t - curves : %".format(curves).postln;
		"\t - bus : %".format(node.bus).postln;

		^nil;
	}

	stop { "clock STOP".warn; clock.clear; }

	env3 { |env|
		var proxy = currentEnvironment.at(QuantMap.findProxy(this).asSymbol);

		var synthDef, synth;
		// var time2quant = TempoClock.default.timeToNextBeat(node.quant);
		// var node = NodeProxy.new(s, \control, 1);
		// var node = NodeProxy.control(s, 1);
		// var node = NodeProxy.for(c);

		node.group = proxy.group;
		// node.fadeTime = 16;
		// c = node.bus;
		// c.postln;
		// proxy.bus.postln;
		synthDef = SynthDef(
			"qNode [ %, q%, c% ]".format(key, node.quant, node.index),
			{
				Out.kr(node.index, EnvGen.kr(env, doneAction:2))
			}
		).add;
		/*
		node.source = { EnvGen.kr(env, doneAction:2) };
		synthDef = node.nameDef("quantFnc [ % ]".format(key.asSymbol), 0);
		*/

		clock.clear;// DOPLNIT STOP
		"time2quant [%]".format(this.time2quant(node.quant)).postln;

		// t = TempoClock.default.sched(time2quant, {
		clock.sched(this.time2quant(node.quant), {

			// node.send;

			// synth = synthDef.play(node.nodeID, addAction:\addToTail);
			// synth.group = node.group;
			node.source = synthDef;
			// "objects[index].synthDef.func: %".format(node.objects[0].synthDef.func).postln;
			// "\ntick quant [%]".format(node.quant).postln;
			// "\t-cBusIndex [%]".format(node.index).postln;
			// "\t-nodeNameDef [%]".format(synthDef.name).postln;
			// "\t-cBusChannels [%]".format(node.numChannels).postln;
			// "\t-nodeID [%]".format(node.nodeID).postln;
			// "\t-envDuration [%]".format(env.duration).postln;
			/*
			{
				node.scope;
				// synth.scope;
				// { w = env.plot(); },

			}.defer();
*/
			proxy.set(key.asSymbol, node);
			// s.queryAllNodes(true);
			node.quant;
		});

	}

	time2quant{|quant|
		if(currentEnvironment === topEnvironment)
		{ ^TempoClock.default.timeToNextBeat(quant); }
		{ ^currentEnvironment.at(\tempo).clock.timeToNextBeat(quant); };
	}

/*
	env { |levels = #[0,1,0], times = #[0.05,0.95], curves = #[5,-5]|

		var proxy = currentEnvironment.at(QuantMap.findProxy(this).asSymbol);

		levels = levels.add(levels[levels.size-1]);
		times = times.add(node.quant - times.sum);
		times = times.add(0);

		this.levels = levels;
		this.times = times;

		node.group = proxy.group;

		node[0] = {
			DemandEnvGen.kr(
				Dseq(levels, inf),
				Dseq(times, inf),
				1, 5, 1, 1,
				doneAction:0
			)
		};


		TempoClock.default.sched(this.time2quant(node.quant), { proxy.set(key.asSymbol, node); nil;});

		// "\t - node.CODE %".format(node.asCode).postln;
	}

	env2 { |levels = #[0,1,0], times = #[0.05,0.95], curves = #[5,-5]|

		var proxy = currentEnvironment.at(QuantMap.findProxy(this).asSymbol);
		var bind;
		levels = levels.add(levels[levels.size-1]);
		times = times.add(node.quant - times.sum);
		bind = Pbind(\type, \set, \args, [\trigEnv], \trigEnv, 1, \dur, times.sum);
		bind.play(quant: node.quant);

		this.levels = levels;
		this.times = times;

		node.group = proxy.group;

		TempoClock.default.sched(this.time2quant(node.quant), {
			node[0] = {
				EnvGen.kr(
					Env(levels,times,curves),
					gate:\trigEnv.tr,
					timeScale: (1/currentEnvironment.clock.tempo)
				);
			};
			node[1] = \set -> bind;
			// .play(currentEnvironment.clock,quant:times.sum);

			proxy.set(key.asSymbol, node);
			nil;
		});

	}
*/


}
