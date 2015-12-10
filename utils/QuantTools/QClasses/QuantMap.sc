QuantMap {
	classvar >thisClassDebugging = false;

	classvar <map;
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
		^map;
	}

	cmdPeriod{
		// "QuantMap cmdPeriod".postln;
		Task({
			Server.local.sync;
			map.at(\stage).do({|stage| stage.put(\group, Group.new(nil, \addToHead)) });
			Server.local.sync;
		}).play;
	}

	*addGui{ |canvan|
		(QGui.debbuging and: thisClassDebugging).if({ "% [%, %]".format(thisMethod, canvan).postln });
		map.notNil.if({
			map.put(\gui, \canvan, canvan);
			map.put(\gui, \panelMap, canvan.panelMap);
			map.put(\gui, \panelStages, canvan.panelStages);
			map.put(\gui, \panelNodes, canvan.panelNodes);
			map.put(\gui, \displayStage, \default);

			this.addStage(\default);
			this.stageCurrent_(\default);
		},{ this.prWarnings(\notInitMap, thisMethod).warn });
	}
	*removeGui{
		map.removeEmptyAt(\gui);
	}

	*hasGui {
		map.notNil.if(
			{ ^map.at(\gui, \canvan).notNil },
			{ this.prWarnings(\notInitMap, thisMethod).warn }
		);
	}

	//PANELS///////////////////////////////////////////

	*panelStages{
		this.hasGui.if({
			^map.at(\gui, \panelStages)
		},{ this.prWarnings(\notInitGui, thisMethod).warn })
	}

	*panelNodes{
		this.hasGui.if({
			^map.at(\gui, \panelNodes)
		},{ this.prWarnings(\notInitGui, thisMethod).warn })
	}

	//STAGES///////////////////////////////////////////

	*addStage {|stageName|
		(QGui.debbuging and: thisClassDebugging).if({ "% [%]".format(thisMethod, stageName).postln });

		Server.local.serverRunning.if({
			var group = map.at(\stage, stageName.asSymbol, \group);
			group.isNil.if({ group = Group.new(nil, \addToHead) });
			// group.run;
			group.register(true);

			map.put(\stage, stageName.asSymbol, \group, group);
			this.hasGui.if({
				var panel = map.at(\gui, \canvan).panelStages;
				map.put(\stage, stageName.asSymbol, \gui, QGui_Stage(
					parent: panel,
					bounds: Rect.offsetEdgeTop(panel.bounds, 5, 5, 5, 40),
					stageName: stageName
				));
			});
		},{ this.prWarnings(\notRunServer, thisMethod).warn })
	}

	*removeStage{|stageName|
		(QGui.debbuging and: thisClassDebugging).if({ "% [%]".format(thisMethod, stageName).postln });

		this.stageExist(stageName).if({
			this.nodeNames(stageName).do({|nodeName|
				this.releaseNode(stageName, nodeName);
			});

			this.hasGui.if({
				var stageGui =  map.at(\stage, stageName.asSymbol, \gui);
				stageGui.setDisplay_(false);
				stageGui.remove;
			});

			map.removeEmptyAt(\stage, stageName.asSymbol);
		}, { this.prWarnings(\notExistStage, thisMethod).warn });
	}

	*stageNames {
		(QGui.debbuging and: thisClassDebugging).if({ thisMethod.postln });
		map.at(\stage).notNil.if({
			var stages = List.newClear();
			map.at(\stage).asAssociations.do({|associations|
				associations.do{|oneAssoc| stages.add(oneAssoc.key) }
			});
			^stages;
		}, { this.prWarnings(\notExistFolderStages, thisMethod).warn; ^nil; })
	}

	*stagesGUI {
		(QGui.debbuging and: thisClassDebugging).if({ thisMethod.postln });
		this.hasGui.if({
			var stages = List.newClear();
			map.at(\stage).do({|oneStage| stages.add(oneStage[\gui]) });
			^stages;
		}, { this.prWarnings(\notInitGui, thisMethod).warn; ^nil; })
	}

	*stageExist {|stageName|
		(QGui.debbuging and: thisClassDebugging).if({ "% [%]".format(thisMethod, stageName).postln });
		map.at(\stage).notNil.if({
			^map.at(\stage, stageName.asSymbol).notNil
		}, { this.prWarnings(\notExistFolderStages, thisMethod).warn; ^nil; })
	}

	*stageCurrent_ {|stageName|
		(QGui.debbuging and: thisClassDebugging).if({ "% [%]".format(thisMethod, stageName).postln });
		this.stageExist(stageName).if({
			map.put(\gui, \displayStage, stageName.asSymbol);
			this.hasGui.if({
				this.stagesGUI.do({|oneStage|
					(oneStage.name.asSymbol == stageName.asSymbol).if(
						{
							oneStage.isCurrent_(true).refresh;
							this.nodesGUI(oneStage.name).do({|oneNode| oneNode.setDisplay_(true) })
						},
						{
							oneStage.isCurrent_(false).refresh;
							this.nodesGUI(oneStage.name).do({|oneNode| oneNode.setDisplay_(false) })
						}
					)
				});
			});
		},{ this.prWarnings(\notExistStage, thisMethod).warn });
	}

	*stageCurrent {
		(QGui.debbuging and: thisClassDebugging).if({ thisMethod.postln });
		this.hasGui.if(
			{ ^map.at(\gui, \displayStage) },
			{ this.prWarnings(\notInitGui, thisMethod).warn }
		);
	}

	*renameStage {|oldName, newName|
		(QGui.debbuging and: thisClassDebugging).if({ "% [% -> %]".format(thisMethod, oldName, newName).postln });
		this.stageExist(oldName).if({
			map.put(\stage, newName.asSymbol, \group, this.stageGroup(oldName));

			this.hasGui.if({
				map.put(\stage, newName.asSymbol, \gui, map.at(\stage, oldName.asSymbol, \gui).name_(newName.asSymbol));
				this.nodeNames(oldName).do({|oneNode|
					var node = this.getNode(oldName, oneNode);
					this.setNode(newName, oneNode, node[\curr], node[\prew], node[\group], node[\gui]);
				});
			});

			map.removeEmptyAt(\stage, oldName.asSymbol);
		},{	this.prWarnings(\notExistStage, thisMethod).warn; ^nil;	});
	}

	*stageGroup {|stageName|
		(QGui.debbuging and: thisClassDebugging).if({ "% [%]".format(thisMethod, stageName).postln });
		this.stageExist(stageName).if({
			^map.at(\stage, stageName.asSymbol, \group)
		},{	this.prWarnings(\notExistStage, thisMethod).warn; ^nil;	});
	}

	//NODES///////////////////////////////////////////

	*addNode {|stageName, nodeProxy|

		this.nodeExist(stageName.asSymbol, nodeProxy.asSymbol).not.if(
			{
				var group = Group.new(this.stageGroup(stageName), \addToHead);
				var newNode = QuantNode(nodeProxy);
				// group.run;
				group.register(true);

				group.postln;
				group.isPlaying.postln;
				// nodeProxy.nameDef("QNode [ % ]".format(nodeProxy.envirKey.asSymbol), 0);
				nodeProxy.parentGroup_(group);
				// .monitorGroup = group;
				nodeProxy.group = group;
				// nodeProxy.send;
				// nodeProxy.playN(vol:0,group:group);
				nodeProxy.setGroup();
				nodeProxy.play(vol:0,group:group.nodeID);

				map.put(\stage, stageName.asSymbol, \nodes, nodeProxy.envirKey.asSymbol, \group, group);
				map.put(\stage, stageName.asSymbol, \nodes, nodeProxy.envirKey.asSymbol, \curr, newNode);

				this.hasGui.if({
					var panel = map.at(\gui, \canvan).panelNodes;
					map.put(\stage, stageName.asSymbol, \nodes, nodeProxy.envirKey.asSymbol, \gui, QGui_Node(panel, nodeProxy:nodeProxy));
				});
			},
			{ this.editNode(stageName, nodeProxy) }
		);
	}

	*getNode {|stageName, nodeName|
		(QGui.debbuging and: thisClassDebugging).if({ "% [% || %]".format(thisMethod, stageName, nodeName).postln });

		this.nodeExist(stageName.asSymbol, nodeName.asSymbol).if({
			var dictNode = IdentityDictionary.new();
			dictNode.put(\curr,  map.at(\stage, stageName.asSymbol, \nodes, nodeName.asSymbol, \curr));
			dictNode.put(\prew, map.at(\stage, stageName.asSymbol, \nodes, nodeName.asSymbol, \prew));
			dictNode.put(\group, map.at(\stage, stageName.asSymbol, \nodes, nodeName.asSymbol, \group));
			dictNode.put(\gui, map.at(\stage, stageName.asSymbol, \nodes, nodeName.asSymbol, \gui));
			dictNode.put(\proxy, map.at(\stage, stageName.asSymbol, \nodes, nodeName.asSymbol, \curr).proxy);
			^dictNode;
		}, { this.prWarnings(\notExistNode, thisMethod).warn; ^nil; });
	}

	*setNode {|stageName, nodeName, currQNode = nil, prewQNode = nil, group = nil, guiQNode = nil|
		(QGui.debbuging and: thisClassDebugging).if({
			"% [% || %] (%, %, %, %)".format(thisMethod, stageName, nodeName, currQNode, prewQNode, group, guiQNode).postln
		});

		this.stageExist(stageName.asSymbol).if({
			var dictNode = IdentityDictionary.new();
			var oldNode = this.getNode(stageName.asSymbol, nodeName.asSymbol);
			dictNode.put(\curr, currQNode ? oldNode.notNil.if({ oldNode[\curr] }) );
			dictNode.put(\prew, prewQNode ? oldNode.notNil.if({ oldNode[\prew] }) );
			dictNode.put(\group, group ? oldNode.notNil.if({ oldNode[\group] }) );
			dictNode.put(\gui, guiQNode ? oldNode.notNil.if({ oldNode[\gui] }) );
			map.put(\stage, stageName.asSymbol, \nodes, nodeName.asSymbol, dictNode);
		}, { this.prWarnings(\notExistStage, thisMethod).warn; ^nil; });
	}

	*editNode {|stageName, nodeName, index, function|
		this.nodeExist(stageName.asSymbol, nodeName.asSymbol).if(
			{
				var node = this.getNode(stageName, nodeName);
				var newNode = QuantNode(node[\proxy].copy);
				newNode.proxy[index] = thisProcess.interpreter.compile(function);
				this.setNode(stageName, nodeName, newNode, node[\curr]);
			}, {
				this.prWarnings(\notExistNode, thisMethod).warn;
				^nil;
		});
	}

	*releaseNode {|stageName, nodeName|
		this.nodeExist(stageName, nodeName).if({
			var node = this.getNode(stageName, nodeName);

			node[\gui].notNil.if({
				node[\gui].setDisplay_(false).refresh;
				node[\gui].remove;
			});

			node[\curr].proxy.release(2);
			node[\prew].notNil.if({ node[\prew].proxy.release(2) });
			// nodeCurr.notNil.if({ nodeCurr.proxy.clear(2) });
			// nodePrew.notNil.if({ nodePrew.proxy.clear(2) });

			map.removeEmptyAt(\stage, stageName.asSymbol, \nodes, nodeName.asSymbol);
			nodeName.asSymbol.envirPut(nil);
		}, { this.prWarnings(\notExistNode, thisMethod).warn; ^nil;	});
	}

	*renameNode {|stageName, oldName, newName|
		this.nodeExist(stageName, oldName).if({
			var node = this.getNode(stageName, oldName);

			node[\curr].nodeName_(newName);
			node[\prew].notNil.if({	node[\prew].nodeName = newName });
			node[\gui].notNil.if({ node[\gui].name = newName });

			this.setNode(stageName, newName, node[\curr], node[\prew], node[\group], node[\gui]);

			newName.asSymbol.envirPut(node[\proxy].copy);
			oldName.asSymbol.envirPut(nil);

			map.removeEmptyAt(\stage, stageName.asSymbol, \nodes, oldName.asSymbol);
		}, { this.prWarnings(\notExistNode, thisMethod).warn; ^nil;	});
	}

	*nodeNames{|stageName|
		this.stageExist(stageName).if({
			var nodes = List.newClear();
			map.at(\stage, stageName.asSymbol, \nodes).notNil.if({
				map.at(\stage, stageName.asSymbol, \nodes).asAssociations.do({|associations|
					associations.do({|oneAssoc| nodes.add(oneAssoc.key) })
				});
			});
			^nodes;
		},{ this.prWarnings(\notExistStage, thisMethod).warn; ^nil; });
	}

	*nodesGUI{|stageName|	// stageName == nil -> scan for all stages
		this.stageExist(stageName.asSymbol).if({
			var nodes = List.newClear();
			var stages = stageName ? this.stageNames;
			stages.asSymbol.do({|scanStage|
				map.at(\stage, scanStage.asSymbol, \nodes).do({|oneNode| nodes.add(oneNode[\gui]) })
			});
			^nodes;
		},{ this.prWarnings(\notExistStage, thisMethod).warn; ^nil; });
	}

	*nodeExist {|stageName, nodeName|
		this.stageExist(stageName).if({
			^map.at(\stage, stageName.asSymbol, \nodes, nodeName.asSymbol).notNil
		},{ this.prWarnings(\notExistStage, thisMethod).warn; ^nil; });
	}

	*nodeGroup {|stageName, nodeName|
		this.stageExist(stageName).if(
			{ ^map.at(\stage, stageName.asSymbol, \nodes, nodeName.asSymbol, \group)
		},{ this.prWarnings(\notExistStage, thisMethod).warn; ^nil; });
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
						{ item.isKindOf(QGui_Canvan) }{ itemTxt = "QGui_Canvan [%]".format(item.bounds) }

						{ item.isKindOf(QGui_PanelMap) }{ itemTxt = "QGui_PanelMap [display: %, rect: %]".format(item.display, item.bounds) }

						{ item.isKindOf(QuantNode) }{ itemTxt = "QuantNode [% -> %]".format(item.nodeName, item.proxy.source.def.sourceCode) }
						{ item.isKindOf(QGui_PanelStages) }{ itemTxt = "QGui_PanelStages [display: %]".format(item.display) }
						{ item.isKindOf(QGui_Stage) }{
							itemTxt = "QGui_Stage [name: %, display: %, Y: %]".format(item.name, item.display, item.positionY)
						}
						{ item.isKindOf(QGui_PanelNodes) }{ itemTxt = "QGui_PanelNodes [display: %]".format(item.display) }
						{ item.isKindOf(QGui_Node) }{
							itemTxt = "QGui_Node [name: %, display: %, Y: %]".format(item.name, item.display, item.positionNodeY)
						}
						{ item.isKindOf(Group) }{ itemTxt = "Group % [isPlaying: %]".format(item.nodeID, item.isPlaying) }
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
		{ type == \notExistNode } { "node doesnt exist ..." }
		{ type == \notExistFolderStages } { "folder stages not found in map ..." }

		{ true }{ "msgType [%] doesnt define in prWarnings".format(type) };

		answ = "QuantMap method [*%]: %".format(method.name, msg);
		^answ;
	}
}