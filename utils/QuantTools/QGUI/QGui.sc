QGui {
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

		win.isNil.if(
			{ isRunning = false },
			{
				isRunning = true;
				win.front;
			}
		);

		isRunning.not.if({
			version = QTools.version;

			// this.initMapTest;

			lastWinBounds = Rect(100,100,800,600);
			win = Window.new(bounds:lastWinBounds, border:false).front;
			canvan = QGui_Canvan(win, win.view.bounds);

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
			QGui_Canvan.thisClassDebugging = true;
			// QGui_PanelStages.thisClassDebugging = true;
			// QGui_Stage.thisClassDebugging = true;
			QGui_PanelNodes.thisClassDebugging = true;
			QGui_Node.thisClassDebugging = true;
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
		// fonts.put(\script, Font('Courier', 11, 'true'));
		fonts.put(\script, Font('Courier',8,usePointSize:true));

		syntax = Dictionary.new();
		syntax.put(\text, Color.new255(100,100,100));
		syntax.put(\var, Color.new255(255,255,255));
		syntax.put(\varName, Color.new255(250,220,100));
		syntax.put(\class, Color.new255(180,180,180));
		syntax.put(\nameControl, Color.new255(20,180,240));
	}

	initMapTest{
		QuantMap.addStage(\default);
		QuantMap.addStage(\test);
	}

	// STAGES ///////////////////////////////

	*getMapText { ^QuantMap.textMap; }

	*addStage {|name|
		QuantMap.stageExist(name.asSymbol).not.if({
			QuantMap.addStage(name.asSymbol);
			canvan.menuStages.addStage(name.asSymbol);
			this.refreshAll;
		});
	}

	*removeStage {|name|
		canvan.menuStages.removeStage(name);
		QuantMap.removeStage(name);
		this.refreshAll;
	}

	*renameStage {|oldName, newName|
		QuantMap.stageExist(oldName.asSymbol).if({
			QuantMap.renameStage(oldName, newName);
			canvan.menuStages.addStage(newName.asSymbol);
			canvan.menuStages.removeStage(oldName.asSymbol);
			this.refreshAll;
		})
	}

	*getStages { ^QuantMap.stages }

	*currentStage { ^QuantMap.stageCurrent }

	*currentStage_ {|name| QuantMap.stageCurrent_(name.asSymbol) }

	*getStageGroup {|name| ^QuantMap.stageGroup(name) }

	// NODES ///////////////////////////////

	*addNode {|name|
		var proxy;
		var currStage = QuantMap.stageCurrent;
		var node = NodeProxy.audio(Server.local, 2);

		// "this.getStageGroup(currStage): %".format(this.getStageGroup(currStage)).postln;

		// currentEnvironment.put(name.asSymbol, node);
		name.asSymbol.envirPut(node);
		proxy = name.asSymbol.envirGet;
		proxy.source_{SinOsc.ar(120!2, mul:Saw.kr(1,0.25,0.4))};

		QuantMap.addNode( currStage, name.asSymbol.envirGet);
		name.asSymbol.envirGet.play(group: this.getStageGroup(currStage));

		canvan.menuNodes.addNode(name.asSymbol);
		this.refreshAll;
	}

	*editNode{|name, index, function|
		function.compile.postln;
		name.asSymbol.envirGet.source_(function.compile);
	}

	*getNodes {|stage| ^QuantMap.nodes(stage.asSymbol) }


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