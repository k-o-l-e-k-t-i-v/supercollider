QuantMap {
	classvar version = 0.11;
	classvar map;
	classvar <currentProxy, currentChOff, <currentSlot;

	*initClass{
		Class.initClassTree(AbstractPlayControl);

		AbstractPlayControl.proxyControlClasses.put(\map, SynthDefControl);
		AbstractPlayControl.buildMethods.put(\map,
			#{ arg func, proxy, channelOffset=0, index;
				var oldNode, newNode;

				QuantMap.new();
				QuantMap.currentCall(proxy, channelOffset, index);

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

	*new { ^super.new.init(); }

	init {
		Server.local.waitForBoot({
			"\nQuantMap init".postln;
			map.isNil.if(
				{
					CmdPeriod.add(this);
					map = MultiLevelIdentityDictionary.new;
					super.class.addStage(\default);
				},
				{
					"\nQuantMap map exist".postln;
					super.class.print;
				}
			);
		});

		/*
		currentProxy = proxy;
		currentChOff = channelOffset;
		currentSlot = slot;

		"currentProxyCall %[%]\n".format(currentProxy.envirKey, currentSlot).postln;
		*/
	}

	cmdPeriod{
		// "QuantMap cmdPeriod".postln;
		Task({
			Server.local.sync;
			map.at(\stage).do({|stage| stage.put(\group, Group.new(nil, \addToHead)) });
			Server.local.sync;
		}).play;
	}

	*currentCall { |proxy, channelOffset = 0, slot|
		currentProxy = proxy;
		currentChOff = channelOffset;
		currentSlot = slot;

		"currentProxyCall %[%]\n".format(currentProxy.envirKey, currentSlot).postln;
	}

	*addStage {|stageName|
		// var group = Group.new(RootNode(Server.local).nodeID, \addToHead);
		Server.local.serverRunning.if(
			{
				var group = map.at(\stage, stageName.asSymbol, \group);
				group.isNil.if({ group = Group.new(nil, \addToHead); });

				map.put(\stage, stageName.asSymbol, \nodeCurr, \nil);
				map.put(\stage, stageName.asSymbol, \nodePrew, \nil);
				map.put(\stage, stageName.asSymbol, \group, group);
			},
			{ "QuantMap method [*addStage]: server not running ...".warn; }
		)
	}

	*removeStage{|stageName|
		var nodeCurr = map.at(\stage, stageName.asSymbol, \nodeCurr).free;
		var nodePrew = map.at(\stage, stageName.asSymbol, \nodePrew).free;
		var group = map.at(\stage, stageName.asSymbol, \group).free;
		map.removeEmptyAt(\stage, stageName.asSymbol);
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

	*print { "\nQuantMap".postln; this.textMap.postln; }

	*textMap {

		var txt = "";
		var tabs = "";

		map.sortedTreeDo(
			{|root, stageName, aaa|
				root.notEmpty.if(
					{
						var numTabs = root.size - 1;
						var slot = root.last;
						numTabs.do({tabs = tabs ++ "\t";});
						txt.notEmpty.if(
							{ txt = txt ++ "\n" ++  tabs  ++ "| " ++ slot ++ " |"; },
							{ txt = txt ++ tabs ++ "| " ++ slot ++ " |"; }
						);
						tabs = "";
					},
					{}
				);
			},
			{|stage, qNode|
				var numTabs = stage.size - 1;
				var slot = stage.last;

				numTabs.do({tabs = tabs ++ "\t";});
				txt = txt ++ "\n" ++ tabs ++ "- " ++ slot ++ " : " ++ qNode;
				tabs = "";
			},
			{},
			{|root, aaa|
				var numTabs = root.size - 1;
				numTabs.do({tabs = tabs ++ "\t";});
				root.notEmpty.if({ txt = txt ++ "\n" ++ tabs ++ "- - -"; });
				tabs = "";
			},
			{}
		);
		^txt;
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