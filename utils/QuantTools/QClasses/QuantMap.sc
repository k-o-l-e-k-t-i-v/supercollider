QuantMap {
	classvar map;
	classvar <currentProxy, currentChOff, <currentSlot;

	*initClass{
		Class.initClassTree(AbstractPlayControl);

		AbstractPlayControl.proxyControlClasses.put(\map, SynthDefControl);
		AbstractPlayControl.buildMethods.put(\map,
			#{ arg func, proxy, channelOffset=0, index;
				// var oldNode, newNode;

				QuantMap.new();
				QuantMap.lastCodeExecution(proxy, channelOffset, index);
				QuantMap.addNode(QuantMap.stageCurrent, proxy);

				"func: %".format(func.def.sourceCode).postln;
				// func.value(); // function call QuantNode.new() /////////////

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

	*lastCodeExecution { |proxy, channelOffset = 0, slot|
		currentProxy = proxy;
		currentChOff = channelOffset;
		currentSlot = slot;

		"\nlastCodeExecution: %[%]".format(currentProxy.envirKey, currentSlot).postln;
	}


	*new { ^super.new.init(); }

	init {
		"\nQuantMap init".postln;
		map.isNil.if(
			{
				CmdPeriod.add(this);
				map = MultiLevelIdentityDictionary.new;
				super.class.addStage(\default);
				super.class.stageCurrent_(\default);
			},
			// { "\nQuantMap map exist".postln }
		);
	}

	cmdPeriod{
		// "QuantMap cmdPeriod".postln;
		Task({
			Server.local.sync;
			map.at(\stage).do({|stage| stage.put(\group, Group.new(nil, \addToHead)) });
			Server.local.sync;
		}).play;
	}

	//STAGES///////////////////////////////////////////

	*addStage {|stage|
		// var group = Group.new(RootNode(Server.local).nodeID, \addToHead);
		Server.local.serverRunning.if(
			{
				var group = map.at(\stage, stage.asSymbol, \group);
				group.isNil.if({ group = Group.new(nil, \addToHead); });

				map.put(\stage, stage.asSymbol, \group, group);
			},
			{ this.prWarnings(\notRunServer, thisMethod).warn }
		)
	}

	*removeStage{|stage|
		var nodeCurr = map.at(\stage, stage.asSymbol, \nodeCurr).free;
		var nodePrew = map.at(\stage, stage.asSymbol, \nodePrew).free;
		var group = map.at(\stage, stage.asSymbol, \group).free;
		map.removeEmptyAt(\stage, stage.asSymbol);
	}

	*stages {
		var stages = List.newClear();
		map.at(\stage).notNil.if({
			map.at(\stage).asAssociations.do({|associations|
				associations.do{|oneAssoc| stages.add(oneAssoc.key) }
			});
		})
		^stages.asArray;
	}

	*stageExist {|stage|
		this.stages.notEmpty.if({
			^block{|break|
				map.at(\stage).asAssociations.do({|associations|
					associations.do{|oneAssoc|
						(oneAssoc.key.asSymbol == stage.asSymbol).if({break.value(true)})
					}
				});
				break.value(false);
			};
		},
		{ ^false }
		)
	}

	*stageCurrent_ {|stageName|
		this.stageExist(stageName).if(
			{ map.put(\stageCurrent, stageName.asSymbol) },
			{ this.prWarnings(\notExistStage, thisMethod).warn }
		);
	}

	*stageCurrent {
		map.notNil.if(
			{ ^map.at(\stageCurrent) },
			{ this.prWarnings(\notInitMap, thisMethod).warn }
		);
	}

	*renameStage {|oldName, newName|
		var nodeCurr = map.at(\stage, oldName.asSymbol, \nodeCurr);
		var nodePrew = map.at(\stage, oldName.asSymbol, \nodePrew);
		var group = map.at(\stage, oldName.asSymbol, \group);

		map.put(\stage, newName.asSymbol, \group, group);
		map.removeEmptyAt(\stage, oldName.asSymbol);
		"QuantMap renameStage [%,%]".format(oldName, newName).postln;
		// map.put(\stage, newName.asSymbol, \nodes, nodeCurr.envirKey.asSymbol, \nodePrew, oldNode);
		// map.put(\stage, newName.asSymbol, \nodes, nodePrew.envirKey.asSymbol, \nodeCurr, newNode);
	}

	*stageGroup {|stageName|
		this.stageExist(stageName).if(
			{ ^map.at(\stage, stageName.asSymbol, \group) },
			{
				this.prWarnings(\notExistStage, thisMethod).warn;
				^nil;
			}
		);
	}

	//NODES///////////////////////////////////////////

	*addNode {|stage, node|
		var newNode = QuantNode(node.asSymbol);

		this.nodeExist(stage.asSymbol, node.asSymbol).not.if(
			{
				map.put(\stage, stage.asSymbol, \nodes, node.envirKey.asSymbol, \nodeCurr, newNode);
				map.put(\stage, stage.asSymbol, \nodes, node.envirKey.asSymbol, \nodePrew, \nil);
			},
			{
				var oldNode = map.at(\stage, stage.asSymbol, \nodes, node.envirKey.asSymbol, \nodeCurr);
				map.put(\stage, stage.asSymbol, \nodes, node.envirKey.asSymbol, \nodePrew, oldNode);
				map.put(\stage, stage.asSymbol, \nodes, node.envirKey.asSymbol, \nodeCurr, newNode);
			}
		);
	}

	*copyNode {|stage, name|

	}

	*releaseNode{|stage, name|

	}

	*nodes{|stage|
		var nodes = List.newClear();
		map.at(\stage, stage.asSymbol, \nodes).notNil.if({
			map.at(\stage, stage.asSymbol, \nodes).asAssociations.do({|associations|
				associations.do{|oneAssoc| nodes.add(oneAssoc.key) }
			});
		});
		nodes.postln;
		^nodes.asArray;
	}

	*nodeExist {|stage, node|
		map.at(\stage, stage.asSymbol, \nodes, node.envirKey.asSymbol, \nodeCurr).isNil.if({ ^false }, { ^true });
	}


	////////////////////////////////////////////////

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

	*textMap {
		map.notNil.if(
			{
				var txt = "";
				var tabs = "";

				map.sortedTreeDo(
					{|root, stageName, aaa|
						root.notEmpty.if(
							{
								var numTabs = root.size - 1;
								var slot = root.last;
								numTabs.do({tabs = tabs ++ "     ";});
								txt.notEmpty.if(
									{ txt = txt ++ "\n" ++  tabs  ++ "| " ++ slot ++ " |"; },
									{ txt = txt ++ tabs ++ "| " ++ slot ++ " |"; }
								);
								tabs = "";
							}
						);
					},
					{|stage, qNode|
						var numTabs = stage.size - 1;
						var slot = stage.last;

						numTabs.do({tabs = tabs ++ "     ";});
						txt = txt ++ "\n" ++ tabs ++ "- " ++ slot ++ " : " ++ qNode;
						tabs = "";
					},
					{},
					{|root, aaa|
						var numTabs = root.size - 1;
						numTabs.do({tabs = tabs ++ "     ";});
						root.notEmpty.if({ txt = txt ++ "\n" ++ tabs ++ "- - -"; });
						tabs = "";
					},
					{}
				);
				^txt;
			},
			{ this.prWarnings(\notInitMap, thisMethod).warn }
		)
	}

	*prWarnings { |type, method|
		var answ;
		var msg = case
		{ type == \notRunServer } { "server not running ..." }
		{ type == \notInitMap } { "map doesnt created ..." }
		{ type == \notExistStage } { "stage doesnt exist ..." }

		{ true }{ "msgType [%] doesnt define in prWarnings".format(type) };

		answ = "QuantMap method [*%]: %".format(method.name, msg);
		^answ;
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