QuantMap {
	classvar objects;

	*initClass{
		Class.initClassTree(AbstractPlayControl);

		AbstractPlayControl.proxyControlClasses.put(\qmap, SynthDefControl);
		AbstractPlayControl.buildMethods.put(\qmap,
			#{ arg func, proxy, channelOffset=0, index;
				var qNode = func.value();
				// var ok, ugen;
				"initClass - qNode %".format(qNode).postln;

				/*
				if(proxy.isNeutral) {
				ugen = func.value(Silent.ar);
				ok = proxy.initBus(ugen.rate, ugen.numChannels + channelOffset);
				if(ok.not) { Error("NodeProxy input: wrong rate/numChannels").throw }
				};
				*/
				// QuantNode.new(func, proxy, channelOffset, index);
				QuantMap.new(proxy, channelOffset, index);
				QuantMap.add(proxy, channelOffset, index, qNode);
				QuantMap.find(qNode);
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
		"initControl - jsem tu".postln;
		objects.isNil.if(
			{
				objects = MultiLevelIdentityDictionary.new;
				"initControl - sources.isNil -> true".postln;
				"initControl - proxy.envirKey: %".format(proxy.envirKey).postln;
			},
			{
				"initControl - sources.isNil -> false".postln;
			}
		)
	}

	*add {|proxy, channelOffset, index, qNode|
		objects.put(proxy.envirKey.asSymbol, index, qNode);
	}

	*find {|qNode|
		var kde;
		objects.notNil.if({
			kde = block {|break|
				objects.leafDo ({|path, item|
					var proxy = path[0];
					var index = path[1];
					(qNode == item).if({ break.value(path) });
				});
			};
			"MAP.path %".format(kde.value).postln;
		},
		{
			"MAP isNil %".format(kde.value).postln;
		}
		);
	}

	*print {
		objects.sortedTreeDo(
			{|node| node.notEmpty.if({"\nproxy ~%".format(node[0]).postln;});	},
			{|path, item|
				var node = path[0];
				var index = path[1];
				"\t[%] item : %".format(index,item).postln;
			},
			{},
			{|node| node.notEmpty.if({"-----------".postln;})},
			{}
		);
	}

}