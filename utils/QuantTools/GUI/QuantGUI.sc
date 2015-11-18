QuantGUI{
	classvar
	<version,
	win, canvan,
	<qPalette, <fonts,
	isFullScreen, isMinimize, lastWinBounds, minWinSizeX, minWinSizeY,
	<mouseClickDown;

	var objects;

	*new{ ^super.new.initPalette.initGUI }

	initGUI {
		Server.local.waitForBoot({
			version = 0.11;
			this.initMap;

			lastWinBounds = Rect(100,100,900,600);
			win = Window.new(bounds:lastWinBounds, border:false).front;
			canvan = QGui_Canvan(win, win.view.bounds);

			isFullScreen = false;
			isMinimize = false;
			minWinSizeX = 600;
			minWinSizeY = 400;
		});
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
		fonts.put(\script, Font('Courier', 11, 'true'));
	}

	initMap {
		QuantMap.new();
		QuantMap.addStage(\default);
		QuantMap.addStage(\test);
	}

	*closeGUI {	"CloseGUI".postln;	win.close;	}

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
		canvan.resizeCanvan;
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
		canvan.resizeCanvan;
	}

	*moveGUI {|x, y|
		var newX = win.bounds.origin.x + x - mouseClickDown.x;
		var newY = win.bounds.origin.y - y + mouseClickDown.y;
		// "MoveGUI [%,%]".format(x, y).postln;
		win.bounds_(Rect(newX, newY, win.bounds.width, win.bounds.height));
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