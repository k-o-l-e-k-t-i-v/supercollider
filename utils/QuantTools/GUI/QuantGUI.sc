QuantGUI{
	classvar <version;
	classvar <qPalette, <fonts;
	classvar win, canvan;
	classvar origin;
	classvar isFullScreen, isMinimize, normalViewRect;
	classvar mouseClickDown;
	var objects;

	*new{|hasBoard = false| ^super.new.initPalette.initGUI(hasBoard) }

	initGUI {|hasBoard|

		version = 0.1;

		normalViewRect = Rect(100,100,900,600);

		hasBoard.not.if(
			{ win = Window.new(bounds: normalViewRect, resizable:true, border:false).front; },
			{ win = Window.new("QTools %".format(version), bounds: normalViewRect, border:true).front; }
		);
		// win.drawFunc_{this.draw};
		win.asView
		.onResize_{super.class.resizeGUI}
		.onClose_{super.class.closeGUI};

		canvan = QGui_Canvan(win, win.view.bounds);

		isFullScreen = false;
		isMinimize = false;

		win.refresh;
		// this.initControls();
	}
	/*
	draw {
	"WIN draw".postln;
	// win.background = Color.clear;

	Pen.width = 2;
	Pen.strokeColor = Color.new255(20,180,240);
	Pen.addRect(win.view.bounds);
	Pen.stroke;
	}
	*/
	initPalette {
		qPalette = QPalette.new();
		qPalette.window = Color.new255(30,30,30); // background
		qPalette.windowText = Color.new255(20,180,240);
		qPalette.button = Color.new255(30,30,30);
		qPalette.buttonText = Color.white;
		qPalette.base = Color.new255(30,30,30);
		qPalette.baseText = Color.white;
		qPalette.highlight = Color.new255(20,180,240);
		qPalette.highlightText = Color.white;

		fonts = Dictionary.new();
		fonts.put(\fontHeader, Font('Segoe UI', 14, 'true'));
		fonts.put(\fontChapter, Font('Segoe UI', 10, 'true'));
		fonts.put(\fontSmall, Font('Segoe UI', 9, 'true'));
		fonts.put(\script, Font('Courier', 11, 'true'));
	}

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

	*closeGUI {
		"CloseGUI".postln;
		win.close;
	}

	*maximizeGUI {
		isFullScreen.not.if(
			{
				"MaximizeGUI [fullScreen: %]".format(isFullScreen).postln;
				normalViewRect = win.bounds;
				win.bounds_(Rect(0,
					(Window.screenBounds.height - Window.availableBounds.height),
					Window.availableBounds.width,
					Window.availableBounds.height)
				);
				isFullScreen = true;
			},
			{
				"MaximizeGUI [fullScreen: %]".format(isFullScreen).postln;
				win.bounds_(normalViewRect);
				isFullScreen = false;
			}
		);
	}

	*minimizeGUI {
		"MinimizeGUI".postln;
		isMinimize.not.if(
			{win.minimize; isMinimize = true},
			{win.unminimize; isMinimize = false}
		)
	}

	*resizeGUI {
		"ResizeGUI".postln;
		"win %".format(win.bounds).postln;
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

}