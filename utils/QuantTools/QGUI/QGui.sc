QGui {
	classvar >thisClassDebugging = false;

	classvar
	<version,
	win, canvan,
	<qPalette, <fonts, <syntax,
	isRunning, <isFullScreen, <isMinimize,
	lastWinBounds, minWinSizeX, minWinSizeY,
	<mouseClickDown,
	<>debbuging;

	var objects;

	*new{ ^super.new.initPalette.initGUI }

	initGUI {
		this.initDebugging(true);

		(QGui.debbuging and: thisClassDebugging).if({"\n% [debugging: %]".format(thisMethod, debbuging).postln;});

		win.isNil.if(
			{ isRunning = false },
			{
				isRunning = true;
				win.front;
			}
		);

		isRunning.not.if({
			version = QTools.version;

			lastWinBounds = Rect(100,100,800,600);
			win = Window.new(bounds:lastWinBounds, border:false).front;
			canvan = QGui_Canvan(win, win.view.bounds);

			QuantMap.addGui(win, canvan);

			isRunning = true;
			isFullScreen = false;
			isMinimize = false;
			minWinSizeX = 600;
			minWinSizeY = 400;
		});

		super.class.refreshAll;
	}

	initDebugging{|bool|
		debbuging = bool;
		debbuging.if({
			QuantMap.thisClassDebugging = true;
			QGui.thisClassDebugging = true;
			QGui_Canvan.thisClassDebugging = true;
			QGui_PanelStages.thisClassDebugging = true;
			QGui_Stage.thisClassDebugging = true;
			QGui_PanelNodes.thisClassDebugging = true;
			QGui_Node.thisClassDebugging = true;
			QGui_Controler.thisClassDebugging = true;
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
		{type.asSymbol == \panelStages}{ QuantMap.panelStages.setDisplay_(bool) }
		// {type.asSymbol == \panelNodes}{ QuantMap.panelNodes[\xxx].setDisplay_(bool) }
		;
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

	*getStages { ^QuantMap.stages }

	*getStagesGUI { ^QuantMap.stagesGUI }

	*currentStage { ^QuantMap.stageCurrent }

	*currentStage_ {|name|
		(QGui.debbuging and: thisClassDebugging).if({ "% [%]".format(thisMethod, name).postln });

		QuantMap.stageCurrent_(name.asSymbol);
		// canvan.menuStages.setCurrentStage(name.asSymbol);


		"Current stage nodes: %".format(this.getNodes(this.currentStage)).postln;
		// this.displayNodes(QuantMap.stageCurrent);
		this.refreshAll;
	}

	*getStageGroup {|name| ^QuantMap.stageGroup(name) }

	// NODES ///////////////////////////////

	*addNode {|name|
		var proxy;
		var currStage = QuantMap.stageCurrent;
		var currGroup = this.getStageGroup(currStage);
		var node = NodeProxy.audio(Server.local, 2);
		name = QuantMap.uniqueName(this.getNodes(currStage), name.asSymbol);

		name.asSymbol.envirPut(node);
		proxy = name.asSymbol.envirGet;
		proxy.playN(group:currGroup);
		proxy.group = currGroup;
		proxy.fadeTime = 4;
		proxy[0] = {SinOsc.ar(\freq.kr(120)!2, mul:Saw.kr(1,0.25,0.4), add:\add.kr(0))}; //.play(currGroup);

		QuantMap.addNode(currStage, proxy);

		canvan.menuNodes.addNode(name.asSymbol);
		this.refreshAll;
	}

	*editNode{|nodeName, index, function|
		QuantMap.editNode(QuantMap.stageCurrent, nodeName, index, function);
		this.refreshAll;
	}

	*getNodes {|stage| ^QuantMap.nodes(stage.asSymbol) }

	*renameNode{|oldName, newName|
		var currStage = QuantMap.stageCurrent;
		QuantMap.renameNode(currStage, oldName, newName);
		canvan.menuNodes.renameNode(oldName, newName);
		this.refreshAll;
	}

	*releaseNode {|name|
		QuantMap.releaseNode(QuantMap.stageCurrent, name);
		canvan.menuNodes.removeNode(name);
		this.refreshAll;
	}
	/*
	displayNodes {|stage|
	(QGui.debbuging and: thisClassDebugging).if({ "% [stage:%, name:%, bool:%]".format(thisMethod, stage, name, bool).postln });
	// canvan.menuNodes.
	}
	*/
	// CONTROL ///////////////////////////////

	*addControl{|node, key|

	}


	// WIN ///////////////////////////////

	*refreshAll { canvan.recall; canvan.refresh; }

	*closeGUI {
		"CloseGUI".postln;
		isRunning = false;
		win.close;
		win = nil;
	}

	*maximizeGUI {
		isFullScreen.not.if(
			{
				"MaximizeGUI [fullScreen: %]".format(isFullScreen).postln;
				lastWinBounds = win.bounds;
				win.bounds_(Rect
					(
						0,
						Window.screenBounds.height - Window.availableBounds.height,
						Window.availableBounds.width,
						Window.availableBounds.height
					)
				);
				isFullScreen = true;
			},
			{
				"MaximizeGUI [fullScreen: %]".format(isFullScreen).postln;
				win.bounds_(lastWinBounds);
				isFullScreen = false;
			}
		);
		this.refreshAll;
	}

	*minimizeGUI {
		"MinimizeGUI".postln;
		isMinimize.not.if(
			{win.minimize; isMinimize = true},
			{win.unminimize; isMinimize = false}
		)
	}

	*resizeGUI { |x, y, direction = nil|
		// "ResizeGUI [%,%,%]".format(x, y, direction).postln;
		isFullScreen.not.if({
			(x.notNil && y.notNil && direction.notNil).if({
				switch ( direction,
					\right, {
						var newWidth = win.bounds.width + x - mouseClickDown.x;
						(newWidth > minWinSizeX).if({
							win.bounds_(Rect(win.bounds.origin.x, win.bounds.origin.y, newWidth, win.bounds.height));
						});
					},
					\top, {
						var newHeight = win.bounds.height - y + mouseClickDown.y;
						(newHeight > minWinSizeY).if({
							win.bounds_(Rect(win.bounds.origin.x, win.bounds.origin.y, win.bounds.width, newHeight));
						});
					},
					\bottom, {
						var newHeight = win.bounds.height + y - mouseClickDown.y;
						(newHeight > minWinSizeY).if({
							win.bounds_(Rect(win.bounds.origin.x, win.bounds.origin.y, win.bounds.width, newHeight));
						});
					},
					\left, {
						var newWidth = win.bounds.width - x + mouseClickDown.x;
						(newWidth > minWinSizeX).if({
							win.bounds_(Rect(win.bounds.origin.x, win.bounds.origin.y, newWidth, win.bounds.height));
						});
					}
				);
			});
			this.refreshAll;
		});
	}

	*moveGUI {|x, y|
		isFullScreen.not.if({
			var newX = win.bounds.origin.x + x - mouseClickDown.x;
			var newY = win.bounds.origin.y - y + mouseClickDown.y;
			// "MoveGUI [%,%]".format(x, y).postln;
			win.bounds_(Rect(newX, newY, win.bounds.width, win.bounds.height));
		});
	}

	*mouseDown { |w, x, y, buttNum|
		"MouseDown [%, %, %, %]".format(w.name, x, y, buttNum).postln;
		mouseClickDown = x@y;
	}






	////////////////////////////////////////
	/*
	initControls {
	var v, b, t ;


	v = ListView(canvan,Rect(10,10,220,70))
	.items_([ "SinOsc", "Saw", "LFSaw", "WhiteNoise", "PinkNoise", "BrownNoise", "Osc" ])
	.palette_(qPalette)
	.action_({ arg sbs;
	[sbs.value, v.items[sbs.value]].postln; // .value returns the integer
	});


	b = EnvelopeView(canvan, Rect(0, 300, 230, 80))
	.drawLines_(true)
	//     .selectionColor_(Color.red)
	.drawRects_(true)
	.resize_(5)
	.step_(0.05)
	.action_({arg b; [b.index, b.value].postln})
	.thumbSize_(5)
	.value_([[0.0, 0.1, 0.5, 1.0],[0.1,1.0,0.8,0.0]])
	.palette_(qPalette)
	;
	b.grid = Point(0.2, 0.2);
	b.gridOn_(true);
	}
	*/
}