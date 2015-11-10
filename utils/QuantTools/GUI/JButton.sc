JButton : UserView {
	var parent;
	var originX, originY, sizeX, sizeY;
	var view;
	var name;
	var <>value;
	var frameAlpha;

	*new{|parent, originX, originY, sizeX, sizeY|
		^super.newCopyArgs(parent).init;
		/*
		var me = super.new(parent, bounds ?? {this.sizeHint} );
		me.canFocus = true;
		^me;
		*/
	}

	init{
		name = "temp";
		frameAlpha = 255;
		view = UserView(parent, originX, originY, sizeX, sizeY)
		.mouseDownAction_{ |view, x, y, modifiers, buttonNumber, clickCount| this.mouseDownAction; }
		.mouseEnterAction_{ |view, x, y| this.mouseEnterAction; }
		.mouseLeaveAction_{ |view, x, y| this.mouseLeaveAction; }
		.action_{|view| this.action; }
		.drawFunc_({|view| this.drawFunc(view); });
	}
	// images.put(\ButtonExitGUI, path +/+ "ButtonExitGUI.png");

	addConteiner {|name| view.name = name.asSymbol; }

	mouseDownAction {|func|
		"Button % mouseDownAction".format(name).postln;
		this.action;
			}

	mouseEnterAction {|view, x, y|

		var time = 0.25;
		var frames = 30;
		"Button % mouseEnterAction".format(name).postln;

		Routine.run({
			frames.do({|i|
				frameAlpha = (i+1)/frames * 255;
				{view.refresh}.defer;
				(time/frames).wait;
			});
		}).play
	}

	mouseLeaveAction {|view, x, y|

		var time = 0.25;
		var frames = 30;
		"Button % mouseLeaveAction".format(name).postln;

		Routine.run({
			frames.do({|i|
				frameAlpha = (frames -(i+1))/frames * 255;
				{view.refresh}.defer;
				(time/frames).wait;
			});
		}).play
	}

	action {
		"Button % action".format(name).postln;
	}

	refresh {
		"Button % refresh".format(name).postln;
		this.draw(view);
	}

	drawFunc_ { arg aFunction;
		this.setProperty( \drawingEnabled, aFunction.notNil );
		drawFunc = aFunction;
	}

	draw {|view|
		"Button % draw".format(name).postln;

		// var img = Image.new(path +/+ view.name ++ ".png");
		// view.backgroundImage_(img);
		// Pen.width = 1;
		// Pen.use{
			Pen.strokeColor = Color.new255(20,180,240, frameAlpha);
			// Pen.strokeColor = Color.new255(20,180,240);
			Pen.addRect(Rect(0,0, view.bounds.width, view.bounds.height));
			Pen.stroke;
	// };
	}
}