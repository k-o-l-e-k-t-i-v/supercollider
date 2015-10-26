QuantMap {
	classvar objects;
	classvar currentProxy, currentChOff, currentIndex;

	*initClass{
		Class.initClassTree(AbstractPlayControl);

		AbstractPlayControl.proxyControlClasses.put(\map, SynthDefControl);
		AbstractPlayControl.buildMethods.put(\map,
			#{ arg func, proxy, channelOffset=0, index;
				var qNode;
				// var ok, ugen;
				"proxy ID %".format(proxy.asNodeID).postln;
				// "proxy CODE %".format(proxy.asCode).postln;
				"proxy Target %".format(proxy.asTarget).postln;
				// "server nextID %".format(Server.local.nextNodeID).postln;
				/*
				if(proxy.isNeutral) {
				ugen = func.value(Silent.ar);
				ok = proxy.initBus(ugen.rate, ugen.numChannels + channelOffset);
				if(ok.not) { Error("NodeProxy input: wrong rate/numChannels").throw }
				};
				*/
				// QuantNode.new(func, proxy, channelOffset, index);

				QuantMap.new(proxy, channelOffset, index);
				qNode = func.value(); // function call QuantNode.new() /////////////
				"initClass - qNode %".format(qNode).postln;

				// QuantMap.add(proxy, channelOffset, index, qNode);
				QuantMap.findProxy(qNode);
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

		objects.isNil.if(
			{
				objects = MultiLevelIdentityDictionary.new;
				// "initControl - sources.isNil -> true".postln;
				// "initControl - proxy.envirKey: %".format(proxy.envirKey).postln;
			},
			{
				// "initControl - sources.isNil -> false".postln;
			}
		);
		currentProxy = proxy;
		currentChOff = channelOffset;
		currentIndex = index;
	}

	*add {|qNode|
		var oldNode = objects.at(currentProxy.envirKey.asSymbol, currentIndex);
		objects.put(currentProxy.envirKey.asSymbol, currentIndex, qNode);
		^oldNode;
	}

	*findProxy {|qNode|
		var proxy, index;
		objects.notNil.if({
			proxy = block {|break|
				objects.leafDo ({|path, item|
					var tempProxy = path[0];
					var index = path[1];
					(qNode == item).if({ break.value(tempProxy) });
				});
				break.value(nil);
			};
			"MAP.findProxy: %".format(proxy).postln;
		},
		{
			"MAP.objects isNil %".format(proxy).postln;
		}
		);
		^proxy;
	}

	*print {
		objects.sortedTreeDo(
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