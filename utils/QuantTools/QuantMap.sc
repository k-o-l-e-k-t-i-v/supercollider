QuantMap {
	classvar version = 0.10;
	classvar map;
	classvar <currentProxy, currentChOff, <currentSlot;



	*initClass{
		Class.initClassTree(AbstractPlayControl);

		AbstractPlayControl.proxyControlClasses.put(\map, SynthDefControl);
		AbstractPlayControl.buildMethods.put(\map,
			#{ arg func, proxy, channelOffset=0, index;
				var oldNode, newNode;

				QuantMap.new(proxy, channelOffset, index);

				func.value(); // function call QuantNode.new() /////////////
				// newNode = func.value(); // function call QuantNode.new() /////////////
				// oldNode = newNode.prewNode;
				// oldNode.notNil.if({ oldNode.node.release(fadeTime:(oldNode.fadeTime*2)); });


				// newNode.print;
				// oldNode.notNil.if({ oldNode.print; });

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

	*new {|proxy, channelOffset = 0, slot|
		^super.new.init(proxy, channelOffset, slot);
	}

	init {|proxy, channelOffset, slot|
		"\nQuantMap init".postln;

		map.isNil.if(
			{ map = MultiLevelIdentityDictionary.new; },
			{
				"\nQuantMap map exist".postln;
				super.class.print;
			}
		);

		currentProxy = proxy;
		currentChOff = channelOffset;
		currentSlot = slot;

		"currentProxyCall %[%]\n".format(currentProxy.envirKey, currentSlot).postln;
	}

	*add {|stage, phase, qObject|
		"\nQuantMap add [stage: %]".format(stage).postln;
		// UPRAVIT MAPU NA -> STAGE / QUANTNODE
		//                          / GROUP

		map.at(stage).isNil.if(
			{ map.put(stage, QuantNode(currentProxy, currentSlot, phase, qObject)); },
			{
				var qNode = map.at(stage);
				var qObject = qNode.qObjects.at([qNode, currentSlot, \current]);
				qObject.isNil.if(
					{
						// "QuantMap add [map.at(%): %]".format(stage, map.at(stage)).postln;
						"QuantMap add map.at(%).nodeName : %".format(stage, map.at(stage).nodeName).postln;
						map.at(stage).addObject(currentSlot, phase, qObject);
					},
					{
						this.edit(stage, phase, qObject);
					}
				)
			}
		)
	}

	*edit {|stage, phase, qObject|
		map.at(stage).isNil.if(
			{
				"map stage not found this path [%/%]".format(stage, phase).postln;
				this.add(stage, phase, qObject);
			},
			{
				var qNode, qObject;
				qNode = map.at(stage);
				"QuantMap edit qNode.nodeName : %".format(qNode.nodeName).postln;
				qObject = qNode.qObjects.at([qNode, currentSlot, phase]);
				qObject.notNil.if(
					{
						"QuantMap edit qObject.key %".format(qObject.key).postln;
						// qObject.
					},
					{
						"QuantMap edit qObject not exist".postln;
						map.put(stage, QuantNode(currentProxy, currentSlot, phase, qObject));
					}
				);
				// "map exist at path [%/%]".format(stage, phase).postln;

			}
		);
	}

	*print {
		"\nQuantMap print".postln;
		map.sortedTreeDo(
			{|stage| stage.notEmpty.if({"\nstage ~%".format(stage).postln;}); },
			{|stage, qNode|
				// var proxy = path[0];
				// var slot = path[1];
				// stage.postln;
				// qNode.postln;
				qNode.print;
				// "\t[%] item : % (%)".format(slot, item, item.key).postln;
				// "\t[%] item : % (%)".format(slot, item, item.key).postln;
			},
			{},
			{|node| node.notEmpty.if({"-----------".postln;})},
			{}
		);
	}

	// *add {|qNode| map.put(currentProxy.envirKey.asSymbol, currentIndex, qNode);	}
	/*
	*findProxy {|qNode|
	var proxy, index;
	map.notNil.if(
	{
	proxy = block {|break|
	map.leafDo ({|path, item|
	var tempProxy = path[0];
	var index = path[1];
	(qNode == item).if({ break.value(tempProxy) });
	});
	break.value(nil);
	};
	// "MAP.findProxy: %".format(proxy).postln;
	},
	{ "MAP isNil %".format(proxy).postln; }
	);
	^proxy;
	}

	*getNode {|proxy, index| ^map.at(proxy.envirKey.asSymbol, index)}

	*currentNode { ^map.at(currentProxy.envirKey.asSymbol, currentIndex)}


	*/
}