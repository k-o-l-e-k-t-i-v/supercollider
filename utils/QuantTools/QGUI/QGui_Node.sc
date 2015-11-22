QGui_Node : UserView {

	var parent, frame;
	var objects;
	var >name;
	var value;

	*new { | parent, bounds |
		var me = super.new(parent, bounds ?? {this.sizeHint} );
		me.canFocus = true;
		me.init(parent, bounds);
		^me;
	}

	init { |argParent, argBounds|
		// "INIT".postln;
		objects = Dictionary.new();

		parent = argParent;
		frame = argBounds;


		// "Rect %".format(rect).postln;
		this.initControl;
		this.drawFunc = { this.draw };
	}

	initControl {
		objects.put(\sourceCode, TextView(parent ,Rect.newSides((frame.left + 5),(frame.top + 5), 400, (frame.bottom - 5)))
			.focus(true)
			.palette_(QGui.qPalette)
			.font_(QGui.fonts[\script])
		);

		objects.put(\timeline, ScrollView(parent, Rect.newSides((frame.left + 405),(frame.top + 5), (frame.right - 5), (frame.bottom - 5)))
			.autohidesScrollers_(true)
			.palette_(QGui.qPalette)
		);

		objects.put(\cnt1, QGui_Controler(objects[\timeline], Rect(5,5,400,40)).setKey("amp"));
		objects.put(\cnt2, QGui_Controler(objects[\timeline], Rect(5,50,400,40)).setKey("freq"));
	}

	draw {
		Pen.width = 1;
		Pen.strokeColor = Color.white;
		Pen.addRect(Rect(0,0, frame.bounds.width, frame.bounds.height));
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
}