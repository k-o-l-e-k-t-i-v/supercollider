QGui_ViewEdge : UserView {

	var parent;
	var >name, >edge, >offset;
	var frameAlpha;
	var originX, originY, sizeX, sizeY;
	var value;
	var routine;


	*new { | parent, bounds |
		var me = super.new(parent, bounds ?? {this.sizeHint} );
		me.canFocus = true;
		me.init(parent, bounds);
		^me;
	}

	init { |argParent, argBounds|
		// "INIT".postln;
		parent = argParent;
		frameAlpha = 0;
		name = "QGui_ViewEdge";
		edge = \top; // \top, \bottom, \left, \right


		this.drawFunc = { this.draw };
	}

	draw {
		var colorActive = Color.new255(20,180,240, frameAlpha);
		// var colorNormal = Color.new255(30,30,30);
		// var color = colorNormal.blend(colorActive, frameAlpha);

		Pen.width = 2;
		// Pan.alpha = frameAlpha;
		Pen.strokeColor = colorActive;
		switch( edge,
			\top, { Pen.line(offset@2, (this.bounds.width-offset)@2); },
			\bottom, {Pen.line(offset@(this.bounds.height-2), (this.bounds.width-offset)@(this.bounds.height-2)); },
			\left, {Pen.line(2@offset, 2@(this.bounds.height-offset)); },
			\right, {Pen.line((this.bounds.width-2)@offset, (this.bounds.width-2)@(this.bounds.height-offset)); }
		);
		Pen.stroke;
	}

	// (5) define typical widget methods  (only those you need or adjust as needed)
	valueAction_{ |val| // most widgets have this
		this.value = val;
		this.doAction;
	}
	value_{ |val|       // in many widgets, you can change the
		// value and refresh the view , but not do the action.
		value = val;
		this.refresh;
	}

	mouseDown{ arg x, y, modifiers, buttonNumber, clickCount;
		var newVal;
		"MouseClickDown %".format(name).postln;
		// this allows for user defined mouseDownAction
		mouseDownAction.value(this, x, y, modifiers, buttonNumber, clickCount);

		// set the value and do the action
		([256, 0].includes(modifiers)).if{ // restrict to no modifier

			newVal= x.linlin(0,this.bounds.width,0,1);
			// translates the relative mouse position in pixels to a value between 0 and 1

			if (newVal != value) {this.valueAction_(newVal)}; // only do something if the value changed
		};
	}

	mouseMove{ arg x, y, modifiers, buttonNumber, clickCount;
		var newVal;
		"MouseMove".postln;
		// this allows for user defined mouseMoveAction
		mouseMoveAction.value(this, x, y, modifiers, buttonNumber, clickCount);

		// set the value and do the action
		([256, 0].includes(modifiers)).if{ // restrict to no modifier

			newVal= x.linlin(0,this.bounds.width,0,1);
			// translates the  relative mouse position in pixels to a value between 0 and 1

			if (newVal != value) {this.valueAction_(newVal)}; // only do something if the value changed
		};

	}

	mouseEnter{
		"MouseEnter %".format(name).postln;
		mouseEnterAction.value(this);
		this.frameEnter;
	}
	mouseLeave{
		"MouseLeave %".format(name).postln;
		mouseLeaveAction.value(this);
		this.frameExit;
	}

	mouseOver { |x, y|
		"MouseOver [%, %]".format(x, y).postln;
		mouseOverAction.value(this, x, y);
	}

	frameEnter {
		var time = 0.45;
		var frames = 30;
		routine.stop;
		routine = Routine({
			frames.do({|i|
				frameAlpha = (i+1)/frames * 255;
				this.refresh;
				(time/frames).wait;
			});
		}).play(AppClock);
	}

	frameExit {
		var time = 0.15;
		var frames = 15;
		routine.stop;
		routine = Routine({
			frames.do({|i|
				frameAlpha = (frames -(i+1))/frames * 255;
				this.refresh;
				(time/frames).wait;
			});
		}).play(AppClock)
	}
}