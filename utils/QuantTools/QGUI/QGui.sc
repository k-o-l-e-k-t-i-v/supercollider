QGui {
	classvar >thisClassDebugging = false;
	classvar <>debbuging = true;

	classvar
	canvan,
	<>isRunning,
	<qPalette, <fonts, <syntax;

	*new{ ^super.new.initPalette.initGUI }
	*close {
		canvan = nil;
		isRunning = false;
		QuantMap.removeGui;
	}

	initGUI {
		this.initDebugging(true);

		// (QGui.debbuging and: thisClassDebugging).if({"\n% [debugging: %]".format(thisMethod, debbuging).postln;});

		canvan.isNil.if(
			{ isRunning = false },
			{
				isRunning = true;
				canvan.asView.visible_(true);
			}
		);

		isRunning.not.if({
			canvan = QGui_Canvan(Rect(50,100,1000,800));
			canvan.background_(qPalette.window);
			canvan.front;

			QuantMap.addGui(canvan);
		});

		super.class.refreshAll;
	}



	initDebugging{|bool|
		debbuging = bool;
		debbuging.if({
			QuantMap.thisClassDebugging = true;
			QGui.thisClassDebugging = true;
			QGui_Canvan.thisClassDebugging = true;
			QGui_PanelMap.thisClassDebugging = true;
			QGui_PanelStages.thisClassDebugging = true;
			QGui_Stage.thisClassDebugging = true;
			QGui_PanelNodes.thisClassDebugging = true;
			QGui_Node.thisClassDebugging = true;
			QGui_Controler.thisClassDebugging = true;
			QGui_CodeView.thisClassDebugging = true;
		})
	}

	initPalette {
		qPalette = QPalette.new();
		qPalette.window = Color.new255(30,30,30); // background
		qPalette.windowText = Color.white;
		qPalette.button = Color.new255(30,30,30);
		qPalette.buttonText = Color.white;
		qPalette.base = Color.new255(30,30,30);
		qPalette.baseText = Color.white;
		qPalette.highlight = Color.new255(20,180,240);
		qPalette.highlightText = Color.white;

		fonts = Dictionary.new();
		fonts.put(\Header, Font('Segoe UI', 14, 'true'));
		// fonts.put(\fontChapter, Font('Segoe UI', 10, 'true'));
		fonts.put(\Small, Font('Segoe UI', 10, \false, usePointSize: \true ));
		fonts.put(\script, Font('Courier',8,usePointSize:true));

		syntax = Dictionary.new();
		syntax.put(\text, Color.new255(100,100,100));
		syntax.put(\var, Color.new255(255,255,255));
		syntax.put(\varName, Color.new255(250,220,100));
		syntax.put(\class, Color.new255(180,180,180));
		syntax.put(\nameControl, Color.new255(20,180,240));
	}

	// PANELS ///////////////////////////////

	*setDisplayPanel {|type, bool|
		case
		{type.asSymbol == \panelMap}{ QuantMap.panelMap.setDisplay_(bool) }
		{type.asSymbol == \panelStages}{ QuantMap.panelStages.setDisplay_(bool) }
		{type.asSymbol == \panelNodes}{ QuantMap.panelNodes.setDisplay_(bool) };
		this.refreshAll;
	}


	// STAGES ///////////////////////////////

	*getMapText { ^QuantMap.textMap; }

	*addStage {|name|
		name = QuantMap.uniqueName(this.getStages, name.asSymbol);
		QuantMap.stageExist(name.asSymbol).not.if({
			QuantMap.addStage(name.asSymbol);
			this.refreshAll;
		});
	}

	*removeStage {|name|
		QuantMap.removeStage(name);
		this.refreshAll;
	}

	*renameStage {|oldName, newName|
		QuantMap.stageExist(oldName.asSymbol).if({
			QuantMap.renameStage(oldName, newName);
			this.refreshAll;
		})
	}

	*getStages { ^QuantMap.stageNames }

	*getStagesGUI { ^QuantMap.stagesGUI }

	*currentStage { ^QuantMap.stageCurrent }

	*currentStage_ {|name|
		(QGui.debbuging and: thisClassDebugging).if({ "% [%]".format(thisMethod, name).postln });
		QuantMap.stageCurrent_(name.asSymbol);
		this.refreshAll;
	}

	*getStageGroup {|name| ^QuantMap.stageGroup(name) }

	// NODES ///////////////////////////////

	*addNode {|name|
		var proxy;
		var currStage = QuantMap.stageCurrent;
		var currGroup = this.getStageGroup(currStage);
		var node = NodeProxy.audio(Server.local, 2);
		name = QuantMap.uniqueName(this.getNodeNames(currStage), name.asSymbol);

		name.asSymbol.envirPut(node);
		proxy = name.asSymbol.envirGet;
		// proxy.playN(vol:0,group:currGroup);
		// proxy.group = currGroup;
		proxy.fadeTime = 4;
		// proxy[0] = {SinOsc.ar(\freq.kr(120)!2, mul:Saw.kr(1,0.25,0.4), add:\add.kr(0))}; //.play(currGroup);
		proxy.put(0, {SinOsc.ar(\freq.kr(120)!2, mul:Saw.kr(1,0.25,0.4), add:\add.kr(0))}, now:false); //.play(currGroup);

		QuantMap.addNode(currStage, proxy);
		this.refreshAll;
	}

	*editNode{|nodeName, index, function|
		QuantMap.editNode(QuantMap.stageCurrent, nodeName, index, function);
		this.refreshAll;
	}

	*getNodeNames {|stage| ^QuantMap.nodeNames(stage.asSymbol) }

	*getNodesGUI {|stage| ^QuantMap.nodesGUI(stage) } // stageName == nil -> scan for all stages

	*renameNode{|oldName, newName|
		var currStage = QuantMap.stageCurrent;
		QuantMap.renameNode(currStage, oldName, newName);
		this.refreshAll;
	}

	*releaseNode {|name|
		QuantMap.releaseNode(QuantMap.stageCurrent, name);
		this.refreshAll;
	}

	// CONTROL ///////////////////////////////

	*addControl{|node, key|

	}


	// WIN ///////////////////////////////

	*refreshAll { canvan.asView.doAction; canvan.refresh; }

}