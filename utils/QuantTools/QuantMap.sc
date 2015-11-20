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
				QuantMap.lastCodeExecution(proxy, channelOffset, index);

				"func: %".format(func.def.sourceCode).postln;
				// func.value(); // function call QuantNode.new() /////////////
				newNode = func.value(); // function call QuantNode.new() /////////////
				oldNode = newNode.prewNode;
				oldNode.notNil.if({ oldNode.node.release(fadeTime:(oldNode.fadeTime*2)); });


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
					super.class.currentStage_(\default);
				},
				{
					"\nQuantMap map exist".postln;
					super.class.print;
				}
			);
		});
	}

	cmdPeriod{
		// "QuantMap cmdPeriod".postln;
		Task({
			Server.local.sync;
			map.at(\stage).do({|stage| stage.put(\group, Group.new(nil, \addToHead)) });
			Server.local.sync;
		}).play;
	}

	*lastCodeExecution { |proxy, channelOffset = 0, slot|
		currentProxy = proxy;
		currentChOff = channelOffset;
		currentSlot = slot;

		"\nlastCodeExecution: %[%]".format(currentProxy.envirKey, currentSlot).postln;
	}

	//STAGES///////////////////////////////////////////

	*addStage {|stage|
		// var group = Group.new(RootNode(Server.local).nodeID, \addToHead);
		Server.local.serverRunning.if(
			{
				var group = map.at(\stage, stage.asSymbol, \group);
				group.isNil.if({ group = Group.new(nil, \addToHead); });

				map.put(\stage, stage.asSymbol, \nodeCurr, \nil);
				map.put(\stage, stage.asSymbol, \nodePrew, \nil);
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
		map.at(\stage).asAssociations.do({|associations|
			associations.do{|oneAssoc| stages.add(oneAssoc.key) }
		});
		^stages.asArray;
	}

	*stageExist {|stage|
		^block{|break|
			map.at(\stage).asAssociations.do({|associations|
				associations.do{|oneAssoc|
					(oneAssoc.key.asSymbol == stage.asSymbol).if({break.value(true)})
				}
			});
			break.value(false);
		};
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

	//NODES///////////////////////////////////////////

	*addNode {|stage, name|

	}

	*copyNode {|stage, name|

	}

	*releaseNode{|stage, name|

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

	*print {
		map.notNil.if(
			{ "\nQuantMap".postln; this.textMap.postln },
			{ this.prWarnings(\notInitMap, thisMethod).warn }
		)

	}

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