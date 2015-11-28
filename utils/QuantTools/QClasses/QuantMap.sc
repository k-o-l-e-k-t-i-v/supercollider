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
		^stages;
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

	*addNode {|stageName, nodeProxy|
		this.nodeExist(stageName.asSymbol, nodeProxy.asSymbol).if(
			{
				var newNode = QuantNode(nodeProxy);
				map.put(\stage, stageName.asSymbol, \nodes, nodeProxy.envirKey.asSymbol, \nodeCurr, newNode);
				map.put(\stage, stageName.asSymbol, \nodes, nodeProxy.envirKey.asSymbol, \nodePrew, \nil);
			},
			{ this.editNode(stageName, nodeProxy) }
		);
	}

	*editNode {|stageName, nodeName, index, function|
		var nodeProxy = map.at(\stage, stageName.asSymbol, \nodes, nodeName.asSymbol, \nodeCurr).proxy;
		this.nodeExist(stageName.asSymbol, nodeProxy.asSymbol).if(
			{
				var oldNode = this.copyNode(stageName.asSymbol, nodeName);
				var newNode = QuantNode(nodeProxy);
				newNode.proxy.playN(group:this.stageGroup(this.stageCurrent));

				newNode.proxy[index] = thisProcess.interpreter.compile(function);

				map.put(\stage, stageName.asSymbol, \nodes, nodeName.asSymbol, \nodePrew, oldNode);
				map.put(\stage, stageName.asSymbol, \nodes, nodeName.asSymbol, \nodeCurr, newNode);
			}
		);
	}

	*copyNode {|stageName, nodeName|
		var nodeProxy = map.at(\stage, stageName.asSymbol, \nodes, nodeName.asSymbol, \nodeCurr).proxy.copy;
		^QuantNode(nodeProxy);
	}

	*releaseNode {|stageName, nodeName|
		var node = map.at(\stage, stageName.asSymbol, \nodes, nodeName.asSymbol, \nodeCurr);
		node.notNil.if({
			map.at(\stage, stageName.asSymbol, \nodes, nodeName.asSymbol, \nodeCurr).proxy.release(2);
			map.removeEmptyAt(\stage, stageName.asSymbol, \nodes, nodeName.asSymbol);
		});
	}

	*renameNode {|stageName, oldName, newName|
		var nodeCurr = map.at(\stage, stageName.asSymbol, \nodes, oldName.asSymbol, \nodeCurr);
		var nodePrew = map.at(\stage, stageName.asSymbol, \nodes, oldName.asSymbol, \nodePrew);

		nodeCurr.nodeName = newName;
		newName.asSymbol.envirPut(nodeCurr.proxy.copy);
		oldName.asSymbol.envirPut(nil);

		map.put(\stage, stageName.asSymbol, \nodes, newName.asSymbol, \nodeCurr, nodeCurr);
		map.removeEmptyAt(\stage, stageName.asSymbol, \nodes, oldName.asSymbol);

		nodePrew.isNil.postln;
		nodePrew.isNil.if(
			{
				nodePrew.nodeName = newName;
				map.put(\stage, stageName.asSymbol, \nodes, newName.asSymbol, \nodePrew, nodePrew);
			},
			{
				map.put(\stage, stageName.asSymbol, \nodes, newName.asSymbol, \nodePrew, \nil);
			}
		);
	}

	*nodes{|stageName|
		var nodes = List.newClear();
		map.at(\stage, stageName.asSymbol, \nodes).notNil.if({
			map.at(\stage, stageName.asSymbol, \nodes).asAssociations.do({|associations|
				associations.do({|oneAssoc| nodes.add(oneAssoc.key) })
			});
		});
		^nodes;
	}

	*nodeExist {|stageName, nodeProxy|
		map.at(\stage, stageName.asSymbol, \nodes, nodeProxy.envirKey.asSymbol, \nodeCurr).isNil.if({ ^true }, { ^false });
	}

	////////////////////////////////////////////////

	*uniqueName {|inArray, rootName|
		var library = List.newClear();
		var newIndex = -1;
		var answ;
		inArray.do({|one| library.add(one) }); // PROBLEM S 4-ITERACI ??????

		library.do({|libName|
			(
				(PathName(libName.asString).noEndNumbers == rootName.asString) or:
				(PathName(libName.asString).noEndNumbers.asString == (rootName ++ "_").asString)
			).if({
				(PathName(libName.asString).endNumber.asInteger >= newIndex).if({
					newIndex = PathName(libName.asString).endNumber + 1;
				});
			});
		});
		(newIndex == -1).if(
			{ answ = rootName	},
			{ answ = "%_%".format(rootName, newIndex) }
		);
		^answ;
	}

	*textMap {
		map.notNil.if(
			{
				var txt = "";
				var tabs = "";

				map.sortedTreeDo(
					{|root, stageName|
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
					{|stage, item|
						var numTabs = stage.size - 1;
						var slot = stage.last;
						var itemTxt = case
						{ item.isKindOf(QuantNode) }{ itemTxt = "QuantNode [% -> %]".format(item.nodeName, item.proxy.source.def.sourceCode) }
						{ true } { itemTxt = item };

						numTabs.do({tabs = tabs ++ "     ";});
						txt = txt ++ "\n" ++ tabs ++ "- " ++ slot ++ " : " ++ itemTxt;
						tabs = "";
					},
					{},
					{|root|
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
}