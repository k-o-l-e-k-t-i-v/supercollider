QuantGUI{
	var win, view;
	var objects, images;
	var path;

	var frameAlpha;

	*new{
		super.new.initGUI().initControls();
	}

	initGUI {

		objects = Dictionary.new();
		images = Dictionary.new();
		frameAlpha = Dictionary.new();

		path = super.class.filenameSymbol.asString.dirname;
		path.postln;

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
	}

	initControls {
		objects.put(\ButtonExitGUI,
			UserView(view, Rect((view.bounds.right - 35),(view.bounds.top + 10),25,25))
			.name_(\ButtonExitGUI)
			.mouseDownAction_{ |view, x, y, modifiers, buttonNumber, clickCount| this.closeGUI; }
			.mouseEnterAction_{ |view, x, y| this.objMouseEnter(view); }
			.mouseLeaveAction_{ |view, x, y| this.objMouseExit(view); }
			.action_{|button| this.closeGUI; }
			.drawFunc_({|view| this.objDraw(view); });
		);
		images.put(\ButtonExitGUI, path +/+ "ButtonExitGUI.png");
		frameAlpha.put(\ButtonExitGUI, 0);

		objects.put(\ButtonMaximizeGUI,
			UserView(view, Rect((view.bounds.right - 65),(view.bounds.top + 10),25,25))
			.name_(\ButtonMaximizeGUI)
			.mouseDownAction_{ |view, x, y, modifiers, buttonNumber, clickCount| this.closeGUI; }
			.mouseEnterAction_{ |view, x, y| this.objMouseEnter(view); }
			.mouseLeaveAction_{ |view, x, y| this.objMouseExit(view); }
			.action_{|button| this.closeGUI; }
			.drawFunc_({|view| this.objDraw(view); });
		);
		images.put(\ButtonMaximizeGUI, path +/+ "ButtonMaximizeGUI.png");
		frameAlpha.put(\ButtonMaximizeGUI, 0);

		objects.put(\ButtonMinimizeGUI,
			UserView(view, Rect((view.bounds.right - 95),(view.bounds.top + 10),25,25))
			.name_(\ButtonMinimizeGUI)
			.mouseDownAction_{ |view, x, y, modifiers, buttonNumber, clickCount| this.closeGUI; }
			.mouseEnterAction_{ |view, x, y| this.objMouseEnter(view); }
			.mouseLeaveAction_{ |view, x, y| this.objMouseExit(view); }
			.action_{|button| this.closeGUI; }
			.drawFunc_({|view| this.objDraw(view); });
		);
		images.put(\ButtonMinimizeGUI, path +/+ "ButtonMinimizeGUI.png");
		frameAlpha.put(\ButtonMinimizeGUI, 0);


		/*
		JButton(view, 20,20,30,30)
		.addConteiner(\aaa)
		.drawFunc_({|view|
		Pen.strokeColor = Color.new255(20,180,240);
		// Pen.strokeColor = Color.new255(20,180,240);
		Pen.addRect(Rect(0,0, view.bounds.width, view.bounds.height));
		Pen.stroke;
		});
		*/
	}

	objMouseEnter {	|view|
		var time = 0.45;
		var frames = 30;
		// frameAlpha[view.name.asSymbol] = 255;
		"objMouseEnter %".format(view.name).postln;
		// view.refresh;
		objects.do{_.mouseLeaveAction};
		Routine.run({
			frames.do({|i|
				{
					frameAlpha[view.name.asSymbol] = (i+1)/frames * 255;
					view.refresh;
				}.defer;
				(time/frames).wait;
			});
		});

	}

	closeGUI {
		"fncMouseEnter".postln;
		win.close;
	}

	objMouseExit { |view|
		var time = 0.15;
		var frames = 30;
		"objMouseExit %".format(view.name).postln;
		frameAlpha[view.name.asSymbol] = 0;
		view.refresh;
		/*
		Routine.run({
		frames.do({|i|
		{
		frameAlpha[view.name] = (frames -(i+1))/frames * 255;
		view.refresh;
		}.defer;
		(time/frames).wait;
		});
		}).play
		*/

	}

	objDraw { |view|
		// "fncDraw".postln;

		var img = Image.new(path +/+ view.name ++ ".png");
		view.backgroundImage_(img);
		Pen.width = 1;
		Pen.strokeColor = Color.new255(20,180,240, frameAlpha[view.name.asSymbol]);
		Pen.addRect(Rect(0,0, view.bounds.width, view.bounds.height));
		Pen.stroke;
	}
}