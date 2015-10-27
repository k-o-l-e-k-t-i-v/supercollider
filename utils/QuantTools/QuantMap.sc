QuantMap {
	classvar map;
	classvar currentProxy, currentChOff, currentIndex;

	*initClass{
		Class.initClassTree(AbstractPlayControl);

		AbstractPlayControl.proxyControlClasses.put(\map, SynthDefControl);
		AbstractPlayControl.buildMethods.put(\map,
			#{ arg func, proxy, channelOffset=0, index;
				var oldNode, newNode;
				/*
				// var ok, ugen;
				if(proxy.isNeutral) {
				ugen = func.value(Silent.ar);
				ok = proxy.initBus(ugen.rate, ugen.numChannels + channelOffset);
				if(ok.not) { Error("NodeProxy input: wrong rate/numChannels").throw }
				};
				*/

				QuantMap.new(proxy, channelOffset, index);

				newNode = func.value(); // function call QuantNode.new() /////////////
				oldNode = newNode.prewNode;
				oldNode.notNil.if({ oldNode.node.release(fadeTime:4); });

				newNode.print;
				oldNode.notNil.if({ oldNode.print; });

				{ | out |
					// "out : %".format(out).postln;
					// var e = EnvGate.new * Control.names(["wet"++(index ? 0)]).kr(1.0);
					// if(proxy.rate === 'audio') {
					// XOut.ar(out, e, SynthDef.wrap(func, nil, [In.ar(out, proxy.numChannels)]))
					// } {
					// XOut.kr(out, e, SynthDef.wrap(func, nil, [In.kr(out, proxy.numChannels)]))};
				}.buildForProxy( proxy, channelOffset, index );
		});
	}

	*new {|proxy, channelOffset = 0, index|
		^super.new.init(proxy, channelOffset, index);
	}

	init {|proxy, channelOffset, index|

		map.isNil.if({ map = MultiLevelIdentityDictionary.new; });

		currentProxy = proxy;
		currentChOff = channelOffset;
		currentIndex = index;

		"\ncurrentProxy %[%]\n".format(currentProxy.envirKey, currentIndex).postln;
	}

	*add {|qNode| map.put(currentProxy.envirKey.asSymbol, currentIndex, qNode);	}

	*findProxy {|qNode|
		var proxy, index;
		map.notNil.if({
			proxy = block {|break|
				map.leafDo ({|path, item|
					var tempProxy = path[0];
					var index = path[1];
					(qNode == item).if({ break.value(tempProxy) });
				});
				break.value(nil);
			};
			"MAP.findProxy: %".format(proxy).postln;
		},
		{ "MAP isNil %".format(proxy).postln; }
		);
		^proxy;
	}

	*getNode {|proxy, index| ^map.at(proxy.envirKey.asSymbol, index)}

	*currentNode { ^map.at(currentProxy.envirKey.asSymbol, currentIndex)}

	*print {
		map.sortedTreeDo(
			{|node| node.notEmpty.if({"\nproxy ~%".format(node[0]).postln;});	},
			{|path, item|
				var node = path[0];
				var index = path[1];
				"\t[%] item : % (%)".format(index,item, item.key).postln;
			},
			{},
			{|node| node.notEmpty.if({"-----------".postln;})},
			{}
		);
	}

}