QuantMap {
	classvar >thisClassDebugging = false;

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

		// thisClassDebugging = true;

		map.isNil.if(
			{
				"\nQuantMap init".postln;
				CmdPeriod.add(this);
				map = MultiLevelIdentityDictionary.new;
			},
			{
				// "\nQuantMap map exist".postln
			}
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

	*addGui{ |win, canvan|
		(QGui.debbuging and: thisClassDebugging).if({ "% [%, %]".format(thisMethod, win, canvan).postln });
		map.notNil.if(
			{
				map.put(\gui, \win, win);
				map.put(\gui, \canvan, canvan);
				map.put(\gui, \panelStages, canvan.menuStages);
				map.put(\gui, \panelNodes, canvan.menuNodes);
				map.put(\gui, \displayStage, \default);

				this.addStage(\default);
				this.stageCurrent_(\default);
			},
			{ this.prWarnings(\notInitMap, thisMethod).warn }
		);
	}

	*hasGui {
		map.notNil.if(
			{ ^map.at(\gui, \canvan).notNil },
			{ this.prWarnings(\notInitMap, thisMethod).warn }
		);
	}

	//PANELS///////////////////////////////////////////

	*panelStages{
		this.hasGui.if(
			{ ^map.at(\gui, \panelStages) },
			{ this.prWarnings(\notInitGui, thisMethod).warn	}
		)
	}

	*panelNodes{
		this.hasGui.if(
			{ ^map.at(\gui, \panelNodes) },
			{ this.prWarnings(\notInitGui, thisMethod).warn	}
		)
	}

	//STAGES///////////////////////////////////////////

	*addStage {|stageName|
		(QGui.debbuging and: thisClassDebugging).if({ "% [%]".format(thisMethod, stageName).postln });

		Server.local.serverRunning.if(
			{
				var group = map.at(\stage, stageName.asSymbol, \group);
				group.isNil.if({ group = Group.new(nil, \addToHead) });

				map.put(\stage, stageName.asSymbol, \group, group);
				this.hasGui.if({
					var panel = map.at(\gui, \canvan).menuStages;
					map.put(\stage, stageName.asSymbol, \gui, QGui_Stage(panel, stageName:stageName));
				});
			},
			{ this.prWarnings(\notRunServer, thisMethod).warn }
		)
	}

	*removeStage{|stage|
		var nodeCurr = map.at(\stage, stage.asSymbol, \nodeCurr).free;
		var nodePrew = map.at(\stage, stage.asSymbol, \nodePrew).free;
		var group = map.at(\stage, stage.asSymbol, \group).free;
		this.hasGui.if({
			var guiStage = map.at(\stage, stage.asSymbol, \gui);
			var nodeNames = this.nodeNames(stage.asSymbol);
			nodeNames.do({|oneName| this.releaseNode(stage.asSymbol, oneName.asSymbol) });
			guiStage.setDisplay_(false);
			guiStage.remove;
		});
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

	*stagesGUI {
		var stages = List.newClear();
		map.at(\stage).notNil.if({
			map.at(\stage).do({|oneStage| stages.add(oneStage[\gui]) });
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
			{
				map.put(\gui, \displayStage, stageName.asSymbol);
				this.hasGui.if({
					this.stagesGUI.do({|oneStage|
						(oneStage.name.asSymbol == stageName.asSymbol).if(
							{ oneStage.isCurrent_(true).refresh },
							{ oneStage.isCurrent_(false).refresh }
						)
					})
				});
			},
			{ this.prWarnings(\notExistStage, thisMethod).warn }
		);
	}

	*stageCurrent {
		map.notNil.if(
			{ ^map.at(\gui, \displayStage) },
			{ this.prWarnings(\notInitMap, thisMethod).warn }
		);
	}

	*renameStage {|oldName, newName|
		var nodeCurr = map.at(\stage, oldName.asSymbol, \nodeCurr);
		var nodePrew = map.at(\stage, oldName.asSymbol, \nodePrew);
		var group = map.at(\stage, oldName.asSymbol, \group);
		// var

		map.put(\stage, newName.asSymbol, \group, group);
		map.put(\stage, newName.asSymbol, \nodeCurr, nodeCurr);
		map.put(\stage, newName.asSymbol, \nodeCurr, nodePrew);

		this.hasGui.if({
			var stageGui = map.at(\stage, oldName.asSymbol, \gui);
			map.put(\stage, newName.asSymbol, \gui, stageGui);
		});

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

				this.hasGui.if({
					var panel = map.at(\gui, \canvan).menuNodes;
					map.put(\stage, stageName.asSymbol, \nodes, nodeProxy.envirKey.asSymbol, \gui, QGui_Node(panel, nodeProxy:nodeProxy));
				});
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

			this.hasGui.if({
				var guiNode = map.at(\stage, stageName.asSymbol, \nodes, nodeName.asSymbol, \gui);
				guiNode.setDisplay_(false);
				guiNode.remove;
			});

			map.removeEmptyAt(\stage, stageName.asSymbol, \nodes, nodeName.asSymbol);
		});


	}

	*renameNode {|stageName, oldName, newName|
		var nodeCurr = map.at(\stage, stageName.asSymbol, \nodes, oldName.asSymbol, \nodeCurr);
		var nodePrew = map.at(\stage, stageName.asSymbol, \nodes, oldName.asSymbol, \nodePrew);
		var nodeGui = map.at(\stage, stageName.asSymbol, \nodes, oldName.asSymbol, \gui);

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
		this.hasGui.if({
			nodeGui.name = newName;
			map.put(\stage, stageName.asSymbol, \nodes, newName.asSymbol, \gui, nodeGui);
		});
	}

	*nodeNames{|stageName|
		var nodes = List.newClear();
		map.at(\stage, stageName.asSymbol, \nodes).notNil.if({
			map.at(\stage, stageName.asSymbol, \nodes).asAssociations.do({|associations|
				associations.do({|oneAssoc| nodes.add(oneAssoc.key) })
			});
		});
		^nodes;
	}

	*nodesGUI{|stageName|	// stageName == nil -> scan for all stages
		var nodes = List.newClear();
		var stages = stageName ? this.stages;
		stages.do({|stageName|
			map.at(\stage, stageName.asSymbol, \nodes).do({|oneNode| nodes.add(oneNode[\gui]) })
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
						{ item.isKindOf(QGui_PanelStages) }{ itemTxt = "QGui_PanelStages [display: %]".format(item.display) }
						{ item.isKindOf(QGui_Stage) }{ itemTxt = "QGui_Stage [display: %]".format(item.display) }
						{ item.isKindOf(QGui_PanelNodes) }{ itemTxt = "QGui_PanelNodes [display: %]".format(item.display) }
						{ item.isKindOf(QGui_Node) }{ itemTxt = "QGui_Node [display: %]".format(item.display) }
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
		{ type == \notInitGui } { "GUI doesnt created ..." }
		{ type == \notExistStage } { "stage doesnt exist ..." }

		{ true }{ "msgType [%] doesnt define in prWarnings".format(type) };

		answ = "QuantMap method [*%]: %".format(method.name, msg);
		^answ;
	}
}