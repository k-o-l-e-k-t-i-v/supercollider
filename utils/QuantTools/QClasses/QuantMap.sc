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
				// group.run;
				group.register(true);

				map.put(\stage, stageName.asSymbol, \group, group);
				this.hasGui.if({
					var panel = map.at(\gui, \canvan).menuStages;
					map.put(\stage, stageName.asSymbol, \gui, QGui_Stage(panel, stageName:stageName));
				});
			},
			{ this.prWarnings(\notRunServer, thisMethod).warn }
		)
	}

	*removeStage{|stageName|
		(QGui.debbuging and: thisClassDebugging).if({ "% [%]".format(thisMethod, stageName).postln });

		this.stageExist(stageName).if({
			this.nodeNames(stageName).do({|nodeName|
				/*
				var nodeCurr = map.at(\stage, stageName.asSymbol, \nodes, nodeName.asSymbol, \curr).free;
				var nodePrew = map.at(\stage, stageName.asSymbol, \nodes, nodeName.asSymbol, \prew).free;
				var group = map.at(\stage, stageName.asSymbol, \group).free;
				this.hasGui.if({
				var guiStage = map.at(\stage, stageName.asSymbol, \nodes, nodeName.asSymbol, \gui);
				// var nodeNames = this.nodeNames(stageName.asSymbol);
				// nodeNames.do({|oneName| this.releaseNode(stageName.asSymbol, oneName.asSymbol) });

				this.releaseNode(stageName, nodeName);

				guiStage.setDisplay_(false);
				guiStage.remove;
				});
				*/
				this.releaseNode(stageName, nodeName);
			});

			this.hasGui.if({
				var stageGui =  map.at(\stage, stageName.asSymbol, \gui);
				stageGui.setDisplay_(false);
				stageGui.remove;
			});

			map.removeEmptyAt(\stage, stageName.asSymbol);
		},
		{ this.prWarnings(\notExistStage, thisMethod).warn });
	}

	*stages {
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
		(QGui.debbuging and: thisClassDebugging).if({ thisMethod.postln });
		this.hasGui.if(
			{ ^map.at(\gui, \displayStage) },
			{ this.prWarnings(\notInitGui, thisMethod).warn }
		);
	}

	*renameStage {|oldName, newName|
		(QGui.debbuging and: thisClassDebugging).if({ "% [% -> %]".format(thisMethod, oldName, newName).postln });
		this.stageExist(oldName).if({
			var group = map.at(\stage, oldName.asSymbol, \group);
			map.put(\stage, newName.asSymbol, \group, group);

			this.hasGui.if({
				var oldStageGui, newStageGui;
				oldStageGui =  map.at(\stage, oldName.asSymbol, \gui);
				map.put(\stage, newName.asSymbol, \gui, oldStageGui);
				newStageGui = map.at(\stage, newName.asSymbol, \gui);
				newStageGui.name = newName.asSymbol;
				newStageGui.refresh;
				("oldStageGui.display:" + oldStageGui.display).postln;
				("newStageGui:" + newStageGui).postln;
				("newStageGui.display:" + newStageGui.display).postln;
				newStageGui.setDisplay_(oldStageGui.display);
				// stageGui.display
				oldStageGui.setDisplay_(false);
				oldStageGui.remove;
			});

			this.nodeNames(oldName).do({|oneNode|

				var nodeCurr = map.at(\stage, oldName.asSymbol, \nodes, oneNode.asSymbol, \curr);
				var nodePrew = map.at(\stage, oldName.asSymbol, \nodes, oneNode.asSymbol, \prew);

				("NODENAME:" + oneNode).postln;
				("NODECURR:" + nodeCurr).postln;
				("NODEPREW:" + nodePrew).postln;

				map.put(\stage, newName.asSymbol, \nodes, oneNode.asSymbol, \curr, nodeCurr);
				map.put(\stage, newName.asSymbol, \nodes, oneNode.asSymbol, \prew, nodePrew);

				map.at(\stage, newName.asSymbol, \nodes, oneNode.asSymbol, \curr).postln;
				map.at(\stage, newName.asSymbol, \nodes, oneNode.asSymbol, \prew).postln;

				this.hasGui.if({
					var nodeGui = map.at(\stage, oldName.asSymbol,  \nodes, oneNode.asSymbol, \gui);
					map.put(\stage, newName.asSymbol, \nodes, oneNode.asSymbol, \gui, nodeGui);
					// nodeGui.remove;
				});

				// this.releaseNode(oldName, oneNodeName);

			});
			// this.removeStage(oldName);

			/*

			var nodeCurr = map.at(\stage, oldName.asSymbol, \curr);
			var nodePrew = map.at(\stage, oldName.asSymbol, \prew);
			var group = map.at(\stage, oldName.asSymbol, \group);
			// var

			map.put(\stage, newName.asSymbol, \group, group);
			map.put(\stage, newName.asSymbol, \curr, nodeCurr);
			map.put(\stage, newName.asSymbol, \curr, nodePrew);

			this.hasGui.if({
			var stageGui = map.at(\stage, oldName.asSymbol, \gui);
			map.put(\stage, newName.asSymbol, \gui, stageGui);
			});

			map.removeEmptyAt(\stage, oldName.asSymbol);
			"QuantMap renameStage [%,%]".format(oldName, newName).postln;
			// map.put(\stage, newName.asSymbol, \nodes, nodeCurr.envirKey.asSymbol, \prew, oldNode);
			// map.put(\stage, newName.asSymbol, \nodes, nodePrew.envirKey.asSymbol, \curr, newNode);
			*/
		});
	}

	*stageGroup {|stageName|
		(QGui.debbuging and: thisClassDebugging).if({ "% [%]".format(thisMethod, stageName).postln });

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
					var panel = map.at(\gui, \canvan).menuNodes;
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
			oldNode.notNil.if({	oldNode[\curr].nodeName = nodeName });
			oldNode.notNil.if({ oldNode[\prew].nodeName = nodeName });

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
				// var nodeProxy = map.at(\stage, stageName.asSymbol, \nodes, nodeName.asSymbol, \curr).proxy;
				// var oldNode = this.copyNode(stageName.asSymbol, nodeName);
				// var newNode = QuantNode(node[\proxy]);
				// var fnc = Interpreter.inte
				// function.postln;
				// function.class.postln;
				// newNode.proxy.playN(group:this.stageGroup(this.stageCurrent));
				// nodeProxy.put(index, function.value());
				var editNode = node[\proxy];

			("\nnode[\curr]:"+node[\curr]).postln;
			("node[\prew]:"+node[\prew]).postln;
			("node[\group]:"+node[\group]).postln;
			("node[\gui]:"+node[\gui]).postln;


				editNode[index] = thisProcess.interpreter.compile(function);

				this.setNode(stageName, nodeName, QuantNode(editNode), node[\curr]);
				// map.put(\stage, stageName.asSymbol, \nodes, nodeName.asSymbol, \prew, oldNode);
				// map.put(\stage, stageName.asSymbol, \nodes, nodeName.asSymbol, \curr, newNode);
			}, {
				this.prWarnings(\notExistNode, thisMethod).warn;
				^nil;
		});
	}
	/*
	*copyNode {|stageName, nodeName|
		var nodeProxy = map.at(\stage, stageName.asSymbol, \nodes, nodeName.asSymbol, \curr).proxy.copy;
		^QuantNode(nodeProxy);
	}
	*/
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
		}, {
			this.prWarnings(\notExistNode, thisMethod).warn;
			^nil;
		});
	}

	*renameNode {|stageName, oldName, newName|
		this.nodeExist(stageName, oldName).if({
			var node = this.getNode(stageName, oldName);

			("\nnode[\curr]:"+node[\curr]).postln;
			("node[\prew]:"+node[\prew]).postln;
			("node[\group]:"+node[\group]).postln;
			("node[\gui]:"+node[\gui]).postln;

			this.setNode(stageName, newName, currQNode:node[\curr], group:node[\group]);

			node[\prew].notNil.if({
				node[\prew].nodeName = newName;
				this.setNode(stageName, newName, prewQNode:node[\prew]);
			});
			node[\gui].notNil.if({
				node[\gui].name = newName;
				this.setNode(stageName, newName, guiQNode:node[\gui]);
			});

			newName.asSymbol.envirPut(node[\curr].proxy.copy);
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
		this.stageExist(stageName).if({
			var nodes = List.newClear();
			var stages = stageName ? this.stages;
			stages.do({|stageName|
				map.at(\stage, stageName.asSymbol, \nodes).do({|oneNode| nodes.add(oneNode[\gui]) })
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
						{ item.isKindOf(QuantNode) }{ itemTxt = "QuantNode [% -> %]".format(item.nodeName, item.proxy.source.def.sourceCode) }
						{ item.isKindOf(QGui_PanelStages) }{ itemTxt = "QGui_PanelStages [display: %]".format(item.display) }
						{ item.isKindOf(QGui_Stage) }{ itemTxt = "QGui_Stage [display: %]".format(item.display) }
						{ item.isKindOf(QGui_PanelNodes) }{ itemTxt = "QGui_PanelNodes [display: %]".format(item.display) }
						{ item.isKindOf(QGui_Node) }{ itemTxt = "QGui_Node [display: %]".format(item.display) }
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