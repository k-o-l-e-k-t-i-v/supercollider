QuantGUI{
	var win, view;
	var objects;

	var isFullScreen;

	*new{ ^super.new.initGUI().initControls(); }

	initGUI {

		objects = Dictionary.new();

		win = Window.new(bounds: Rect(100,100,700,600), border:false)
		.alwaysOnTop_(true)
		.front;

		view = UserView(win, win.view.bounds)
		.background_(Color.new255(30,30,30))
		.drawFunc_{
			Pen.strokeColor = Color.new255(150,150,150);
			Pen.addRect(Rect(0,0, view.bounds.width, view.bounds.height));
			Pen.stroke;
		};

		isFullScreen = false;
	}

	initControls {

		objects.put(\ButtonExit, Jbutton(view, Rect((view.bounds.right - 35),(view.bounds.top + 10),25,25))
			.name_("ButtonExit")
			.iconName("ButtonExitGUI")
			.mouseOverAction_{ |view, x, y| "MouseEnterAction % [%, %]".format(view, x, y).postln; }
			.action_{|button| this.closeGUI; }
		);

		objects.put(\ButtonMaximize, Jbutton(view, Rect((view.bounds.right - 65),(view.bounds.top + 10),25,25))
			.name_("ButtonMaximize")
			.iconName("ButtonMaximizeGUI")
			.mouseOverAction_{ |view, x, y| "MouseEnterAction % [%, %]".format(view, x, y).postln; }
			.action_{|button| this.maximizeGUI; }
		);

		objects.put(\ButtonMinimize, Jbutton(view, Rect((view.bounds.right - 95),(view.bounds.top + 10),25,25))
			.name_("ButtonMinimize")
			.iconName("ButtonMinimizeGUI")
			.mouseOverAction_{ |view, x, y| "MouseEnterAction % [%, %]".format(view, x, y).postln; }
			.action_{|button| this.closeGUI; }
		);
	}

	closeGUI {
		"fncMouseEnter".postln;
		win.close;
	}

	maximizeGUI {
		"fncMouseEnter".postln;
		isFullScreen.not.if(
			{win.fullScreen; isFullScreen = true},
			{win.endFullScreen; isFullScreen = false}
		)
	}


}