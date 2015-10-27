QuantNode {
	var instance;
	var <>key, <>quant, <>fadeTime;
	var >levels, >times, >curves;
	var <node, <prewNode;
	var group, bus;

	*new {|key, quant, fadeTime| ^super.new.init(key, quant, fadeTime);	}

	init{|key, quant, fadeTime|

		// "init QuantNode - new".postln;
		instance = this;
		this.key = key;
		this.quant = quant;
		this.fadeTime = fadeTime;

		prewNode = QuantMap.currentNode;
		prewNode.isNil.if(
			{ node = NodeProxy.control(Server.local, 1); },
			{
				var proxy = currentEnvironment.at(QuantMap.findProxy(this).asSymbol);

				node = NodeProxy.control(Server.local, 1);
				// prewNode.node.fadeTime = 0.05;
				node.copyState(prewNode.node);
				node.fadeTime = 0.05;
				proxy.set(key.asSymbol, node);

				// node[0] =
				// prewNode.node.source.def.sourceCode.postln;
				// node = prewNode.copy;
				// node.nodeMap = prewNode.nodeMap.copy;

				"init PrewNode copyState %".format(prewNode.node[0].def.code).postln;
				"init QuantNode copyState %".format(node[0].def.code).postln;
				this.print;
			}
		);

		QuantMap.add(instance);


		^instance;
	}

	print{
		"init QuantNode %".format(QuantMap.findProxy(this)).postln;
		"\t - key : %".format(key).postln;
		"\t - quant : %".format(quant).postln;
		"\t - fadeTime : %".format(node.fadeTime).postln;
		"\t - levels : %".format(levels).postln;
		"\t - times : %".format(times).postln;
		"\t - curves : %".format(curves).postln;
		"\t - bus : %".format(node.bus).postln;

		^nil;
	}

	env { |levels = #[0,1,0], times = #[0.05,0.95], curves = #[5,-5]|

		var proxy = currentEnvironment.at(QuantMap.findProxy(this).asSymbol);
		// "init QuantEnv".postln;

		levels = levels.add(levels[levels.size-1]);
		times = times.add(quant - times.sum);
		times = times.add(0);

		this.levels = levels;
		this.times = times;

		node.group = proxy.group;
		node.quant = quant;
		node.fadeTime = fadeTime;

		node[0] = {
			DemandEnvGen.kr(
				Dseq(levels, inf),
				Dseq(times, inf),
				1, 5, 1, 1,
				doneAction:0
			)
		};


		/*
		node[0] = {
		EnvGen.kr(
		Env(levels,times),
		gate:\trigEnv.tr,
		timeScale: (1/currentEnvironment.clock.tempo)
		);
		};
		node[1] = \set -> Pbind(\type, \set, \args, [\trigEnv], \trigEnv, 1, \dur, times.sum);
		// .play(currentEnvironment.clock,quant:times.sum);
		*/
		TempoClock.default.sched(this.time2quant(quant), { proxy.set(key.asSymbol, node); nil;});

		// "\t - node.CODE %".format(node.asCode).postln;
	}

	time2quant{|quant|
		if(currentEnvironment === topEnvironment)
		{ ^TempoClock.default.timeToNextBeat(quant); }
		{ ^currentEnvironment.at(\tempo).clock.timeToNextBeat(quant); };
	}

}
