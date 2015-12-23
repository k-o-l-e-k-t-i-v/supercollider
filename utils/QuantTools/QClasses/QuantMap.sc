QuantMap {
	classvar >thisClassDebugging = false;

	classvar <map;
	classvar <currentProxy, currentChOff, <currentSlot;

	*initClass{
		Class.initClassTree(AbstractPlayControl);

		AbstractPlayControl.proxyControlClasses.put(\qmap, SynthDefControl);
		AbstractPlayControl.buildMethods.put(\qmap,
			#{ arg func, proxy, channelOffset=0, index;
				// var oldNode, newNode;

				QuantMap.lastCodeExecution(proxy, channelOffset, index);

				QuantMap.mapExist.if({
					"mapExist".warn;
				},
				{
					"mapNOTExist".warn;
					QuantMap.new();
					QuantMap.addStage(\default);
					QuantMap.stageCurrent_(\default);
				}
				);

				proxy.postln;
				QuantMap.addNode(QuantMap.stageCurrent, proxy.envirKey);

				// "func: %".format(func.def.sourceCode).postln;
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




	*new { ^super.new.init(); }

	init {

		// thisClassDebugging = true;

		map.isNil.if(
			{
				"\nQuantMap [v%] init...".format(QTools.version).postln;
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

	*lastCodeExecution { |proxy, channelOffset = 0, slot|
		currentProxy = proxy;
		currentChOff = channelOffset;
		currentSlot = slot;

		"\nlastCodeExecution: %[%]".format(currentProxy.envirKey, currentSlot).postln;
	}

	*mapExist { map.notNil.if( { ^true },{ ^false }) }



	//GUI///////////////////////////////////////////

	*addGui{ |canvan|
		(QGui.debbuging and: thisClassDebugging).if({ "% [%, %]".format(thisMethod, canvan).postln });
		this.mapExist.if({
			map.put(\gui, \canvan, canvan);
			map.put(\gui, \panelMap, canvan.panelMap);
			map.put(\gui, \panelStages, canvan.panelStages);
			map.put(\gui, \panelNodes, canvan.panelNodes);

			this.addStage(\default);
			this.stageCurrent_(\default);
			this.stageNames.do({|oneStage|
				// ("oneStage" + oneStage).warn;
				this.hasStageGui(oneStage).not.if({
					// ("oneStage nema GUI" + oneStage).warn;
					this.addStageGui(oneStage);
				});

				this.nodeNames(oneStage).do({|oneNode|
					// ("oneNode" + oneNode).warn;
					this.hasNodeGui(oneStage, oneNode).not.if({
						this.addNodeGui(oneStage, oneNode);
					});
				});
			});
			// QTools.print;
			// "addGuiEnd".warn;
		},{ this.prWarnings(\notInitMap, thisMethod).warn });
	}

	*removeGui{	map.removeEmptyAt(\gui) }

	*hasGui {
		this.mapExist.if(
			{ ^map.at(\gui, \canvan).notNil },
			{ this.prWarnings(\notInitMap, thisMethod).warn }
		);
	}

	*hasStageGui {|stageName|
		this.mapExist.if(
			{ ^map.at(\stage, stageName.asSymbol, \gui).notNil },
			{ this.prWarnings(\notInitMap, thisMethod).warn }
		);
	}

	*hasNodeGui {|stageName, nodeName|
		this.mapExist.if(
			{ ^map.at(\stage, stageName.asSymbol, \nodes, nodeName.asSymbol, \gui).notNil },
			{ this.prWarnings(\notInitMap, thisMethod).warn }
		);
	}

	//PANELS///////////////////////////////////////////

	*panelMap{
		this.hasGui.if({
			^map.at(\gui, \panelMap)
		},{ this.prWarnings(\notInitGui, thisMethod).warn })
	}

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

			// this.hasGui.if({ this.addStageGui(stageName) });
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

			this.stageGroup(stageName).release(4);
			Server.local.makeBundle(4, {this.stageGroup(stageName).free;});

			map.removeEmptyAt(\stage, stageName.asSymbol);
		}, { this.prWarnings(\notExistStage, thisMethod).warn });
	}

	*addStageGui { |stageName|
		(QGui.debbuging and: thisClassDebugging).if({ "% [%]".format(thisMethod, stageName).postln });
		this.hasStageGui.not.if({
			var panelStage = map.at(\gui, \panelStages);
			var guiStage = QGui_Stage(
				parent: panelStage,
				bounds: Rect.offsetEdgeTop(panelStage.bounds, 25, 5, 5, 60),
				stageName: stageName.asString
			);
			// guiStage.name = stageName.asString;
			// guiStage.doAction;
			this.setStage(stageName, guiQStage: guiStage);
		});
	}
	*removeStageGui { |stageName|
		(QGui.debbuging and: thisClassDebugging).if({ "% [%]".format(thisMethod, stageName).postln });
		this.hasStageGui.if({
			this.setStage(stageName, guiQStage: nil);
		});
	}

	*getStage {|stageName|
		(QGui.debbuging and: thisClassDebugging).if({ "% [%]".format(thisMethod, stageName).postln });

		this.stageExist(stageName.asSymbol).if({
			var dictStage = IdentityDictionary.new();
			dictStage.put(\group, map.at(\stage, stageName.asSymbol, \group));
			dictStage.put(\gui, map.at(\stage, stageName.asSymbol, \gui));
			dictStage.put(\nodes, map.at(\stage, stageName.asSymbol, \nodes));
			^dictStage;
		}, { this.prWarnings(\notExistNode, thisMethod).warn; ^nil; });
	}

	*setStage {|stageName, group = nil, guiQStage = nil|
		(QGui.debbuging and: thisClassDebugging).if({
			"% [%] (%, %)".format(thisMethod, stageName, group, guiQStage).postln
		});

		this.stageExist(stageName.asSymbol).if({
			var dictStage = IdentityDictionary.new();
			var oldStage = this.getStage(stageName);
			dictStage.put(\group, group ? oldStage.notNil.if({ oldStage[\group] }) );
			dictStage.put(\gui, guiQStage ? oldStage.notNil.if({ oldStage[\gui] }) );
			dictStage.put(\nodes, oldStage.notNil.if({ oldStage[\nodes] }) );
			// dictStage.postln;
			map.put(\stage, stageName.asSymbol, dictStage);
		}, { this.prWarnings(\notExistStage, thisMethod).warn; ^nil; });
	}

	*stageNames {
		(QGui.debbuging and: thisClassDebugging).if({ thisMethod.postln });
		map.at(\stage).notNil.if({
			var stages = List.newClear();
			map.at(\stage).asAssociations.do({|associations|
				associations.value.isKindOf(IdentityDictionary).if({
					stages.add(associations.key);
					// ("\t - " + associations.key).postln;
				});
			});
			^stages;
		}, { this.prWarnings(\notExistFolderStages, thisMethod).warn; ^nil; })
	}

	*stagesGUI {
		(QGui.debbuging and: thisClassDebugging).if({ thisMethod.postln });
		// "stagesGUI".warn;
		this.hasGui.if({
			var stages = List.newClear();
			map.at(\stage).asAssociations.do({|associations|
				// ("associations" + associations).postln;
				associations.value.isKindOf(IdentityDictionary).if({
					var stageName = associations.key;
					// ("stagesGUI.stageName" + stageName).warn;
					this.hasStageGui(stageName).if({

						stages.add(this.getStage(stageName)[\gui]);
						// ("\t - " + stageName).postln;
					},{
						// var guiStage = this.addStageGui(stageName);
						// stages.add(this.getStage(stageName)[\gui]);
						// ("\t - " + stageName).postln;
					});
				});
			});
			// ("stages DONE" + stages.asArray).warn;
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
			map.put(\stage, \currentStage, stageName.asSymbol);

			this.stagesGUI.do({|oneStage|
				this.hasStageGui(oneStage.name).if({
					// ("stageCurrent.oneStage" + oneStage).warn;
					(oneStage.name.asSymbol == stageName.asSymbol).if(
						{
							var guiNodes = this.nodesGUI(oneStage.name);
							oneStage.isCurrent_(true).refresh;
							// guiNodes.not
							this.nodesGUI(oneStage.name).do({|oneNode|
								// ("oneNode" + oneNode).postln;
								this.hasNodeGui(oneStage.name, oneNode.name).if({
									oneNode.setDisplay_(true)
								})
							})
						},
						{
							oneStage.isCurrent_(false).refresh;
							this.nodesGUI(oneStage.name).do({|oneNode|

								// ("oneNode" + oneNode).postln;
								this.hasNodeGui(oneStage.name, oneNode.name).if({
									oneNode.setDisplay_(false)
								})
							})
						}
					)
				});
			});
		},{ this.prWarnings(\notExistStage, thisMethod).warn });
	}

	*stageCurrent {
		(QGui.debbuging and: thisClassDebugging).if({ thisMethod.postln });
		^map.at(\stage, \currentStage)
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

	*playStage {|stageName|
		(QGui.debbuging and: thisClassDebugging).if({ "% [%]".format(thisMethod, stageName).postln });
		this.stageGroup(stageName).run(true);
	}

	*stopStage {|stageName|
		(QGui.debbuging and: thisClassDebugging).if({ "% [%]".format(thisMethod, stageName).postln });
		this.stageGroup(stageName).run(false);
	}

	//NODES///////////////////////////////////////////

	*addNode {|stageName, nodeName|

		this.nodeExist(stageName.asSymbol, nodeName.asSymbol).not.if(
			{
				var group = Group.new(this.stageGroup(stageName), \addToHead);
				var newNode = QuantNode(nodeName, group);


				// group.run;
				group.register(true);

				// group.postln;
				// group.isPlaying.postln;
				// nodeProxy.nameDef("QNode [ % ]".format(nodeProxy.envirKey.asSymbol), 0);
				newNode.proxy.parentGroup_(group);
				// .monitorGroup = group;
				// nodeProxy.group = group;
				newNode.proxy.send;
				// nodeProxy.playN(vol:0,group:group);
				newNode.proxy.setGroup(group);
				newNode.proxy.play(vol:0.5,group:group.nodeID);

				map.put(\stage, stageName.asSymbol, \nodes, nodeName.asSymbol, \group, group);
				map.put(\stage, stageName.asSymbol, \nodes, nodeName.asSymbol, \curr, newNode);

				this.addSlot(stageName, nodeName, 0, newNode.proxy[0]);
				newNode.proxy.controlKeys.do({|oneKey|
					// oneKey.postln;
					this.addControl(stageName, nodeName, oneKey, 1, "nil...");


					// qControls.put(oneKey.asSymbol, QuantControl(oneKey, 1, {Env( [0,1,0], [0.15,0.85], [8,-4] )}));
				});

				this.hasGui.if({
					this.addNodeGui(stageName, newNode);
					/*
					var panel = map.at(\gui, \canvan).panelNodes;
					map.put(
					\stage, stageName.asSymbol, \nodes, nodeProxy.envirKey.asSymbol, \gui,
					QGui_Node(
					parent:panel.nodeView,
					bounds: Rect.offsetEdgeTop(panel.bounds, 5, 5, 5, 400),
					nodeProxy:nodeProxy
					);
					);
					*/
				});
			},
			{ this.editNode(stageName, nodeName) }
		);
	}

	*addNodeGui { |stageName, qNode|
		this.hasNodeGui.not.if({
			var panelNode = map.at(\gui, \panelNodes);
			var guiNode = QGui_Node(
				parent: panelNode.nodeView,
				bounds: Rect.offsetEdgeTop(panelNode.bounds, 5, 5, 5, 400),
				// nodeProxy: nodeName.asSymbol.envirGet
				qNode: qNode
			);
			this.setNode(stageName, qNode.proxy.envirKey, guiQNode:guiNode);
		});
	}
	*removeNodeGui { |stageName, nodeName|
		this.hasNodeGui.if({
			this.setNode(stageName, nodeName, guiQNode: nil);
		});
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
		(QGui.debbuging and: thisClassDebugging).if({
			"% [% || % || % || %]".format(thisMethod, stageName, nodeName, index, function).postln
		});
		this.nodeExist(stageName.asSymbol, nodeName.asSymbol).if(
			{
				var node = this.getNode(stageName, nodeName);
				var oldNode = QuantNode(node[\proxy].copy);
				node[\proxy][index] = function;
				oldNode.nodeName = nodeName.asSymbol;

				node[\proxy].controlKeys.postln;
				this.setNode(stageName, nodeName, node[\curr], oldNode);
			}, {
				this.prWarnings(\notExistNode, thisMethod).warn;
				^nil;
		});
	}

	// ????
	*controlNode {|stageName, nodeName, key, function|
		(QGui.debbuging and: thisClassDebugging).if({
			"% [% || % || % || %]".format(thisMethod, stageName, nodeName, key, function).postln
		});
		this.nodeExist(stageName.asSymbol, nodeName.asSymbol).if(
			{
				var node = this.getNode(stageName, nodeName);
				var oldNode = QuantNode(node[\proxy].copy);
				// newNode.name = node[\proxy].envirKey;
				// node[\proxy][index].free;
				// newNode.proxy[index] = thisProcess.interpreter.compile(function.def.sourceCode);
				node[\proxy].set(key.asSymbol, function);
				oldNode.nodeName = nodeName.asSymbol;
				// newNode.proxy[index] = function;

				// function.play(newNode.proxy.parentGroup);
				// newNode.proxy[index] = function.value();
				// newNode.proxy[index].set(function);
				this.setNode(stageName, nodeName, node[\curr], oldNode);
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
				map.at(\stage, scanStage.asSymbol, \nodes).do({|oneNode|
					oneNode[\gui].notNil.if({
						nodes.add(oneNode[\gui])
					})
				})
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

	// Controls ////////////////////////////////////////////

	*addControl {|stageName, nodeName, keyName, quant, function|
		var newControl = QuantControl(keyName, quant, function);
		map.put(\stage, stageName.asSymbol, \nodes, nodeName.asSymbol, \controls, keyName.asSymbol, newControl);
	}

	*setControl {|stageName, nodeName, keyName, qControl|
		map.put(\stage, stageName.asSymbol, \nodes, nodeName.asSymbol, \controls, keyName.asSymbol, qControl);
	}

	*getControl {|stageName, nodeName, keyName|
		var cnt = map.at(\stage, stageName.asSymbol, \nodes, nodeName.asSymbol, \controls, keyName.asSymbol);
		^cnt;
	}

	*controlExist {|stageName, nodeName, keyName|
		this.stageExist(stageName).if({
			this.nodeExist(stageName, nodeName).if({
				^map.at(\stage, stageName.asSymbol, \nodes, nodeName.asSymbol, \controls, keyName.asSymbol).notNil;
			});
		});
	}

	*controlNames{|stageName, nodeName|
		this.nodeExist(stageName, nodeName).if({
			var cnt = List.newClear();
			map.at(\stage, stageName.asSymbol, \nodes, nodeName.asSymbol, \controls).do({|oneCnt|
				cnt.add(oneCnt.key);
				// oneCnt.key.postln;
			})
			^cnt;
		},{ this.prWarnings(\notExistStage, thisMethod).warn; ^nil; });
	}

	*removeControl { |stageName, nodeName, keyName|
		map.removeEmptyAt(\stage, stageName.asSymbol, \nodes, nodeName.asSymbol, \controls, keyName.asSymbol);
	}

	// Slots ////////////////////////////////////////////

	*addSlot {|stageName, nodeName, index, function|
		// var newControl = QuantControl(keyName, quant, function);
		map.put(\stage, stageName.asSymbol, \nodes, nodeName.asSymbol, \slots, index.asSymbol, function);
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

						{ item.isKindOf(QGui_PanelMap) }
						{ itemTxt = "QGui_PanelMap [display: %, %]".format(item.display, item.bounds) }

						{ item.isKindOf(QuantNode) }
						{ itemTxt = "QuantNode [%]%".format(item.nodeName, item.text) }
						// { itemTxt = "QuantNode [%]".format(item.print) }

						{ item.isKindOf(QuantControl) }
						{ itemTxt = "QuantControl [%, %]".format(item.quant, item.fnc.asCompileString) }

						{ item.isKindOf(Function) }
						{ itemTxt = "Fnc %".format(item.def.sourceCode) }

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