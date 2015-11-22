QGui_Controler : UserView {

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
		objects.put(\controlerCode, TextView(parent ,Rect.newSides((frame.left + 50),(frame.top + 5), (frame.right - 5), (frame.bottom - 5)))
			.focus(true)
			.palette_(QGui.qPalette)
			.font_(QGui.fonts[\script])
		);
		/*

		objects.put(\timeline, ScrollView(parent, Rect.newSides((frame.left + 405),(frame.top + 5), (frame.right - 5), (frame.bottom - 5)))
			.autohidesScrollers_(true)
			.palette_(QGui.qPalette)
		);

		*/
		objects.put(\keyButt, Button(parent, Rect.newSides((frame.left + 5),(frame.top + 5), 50, (frame.bottom - 5)))
						.font_(QGui.fonts[\script])
		);
		// objects.put(\butt2, Button(parent, Rect(5,25,40,20)).string_("\\freq").font_(QGui.fonts[\script]));
	}

	draw {
		Pen.width = 1;
		Pen.strokeColor = Color.white;
		Pen.addRect(Rect(0,0, frame.bounds.width, frame.bounds.height));
		Pen.stroke;
	}

	setKey{|key|
		objects[\keyButt].string_(key);
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