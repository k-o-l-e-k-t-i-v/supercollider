QGui_Controler : UserView {

	classvar >thisClassDebugging = false;

	var parent, bounds;
	var objects;
	var name;
	var positionControlY;

	*new { | parent, bounds, controlName|
		var me = super.new(parent, bounds ?? {this.sizeHint} );
		me.canFocus = true;
		me.init(parent, bounds, controlName);
		^me;
	}

	init { |argParent, argBounds, controlName|
		(QGui.debbuging and: thisClassDebugging).if({
			"\n% - % [%, %]".format(thisMethod, controlName, argParent, argBounds).postln;
		});

		objects = Dictionary.new();

		parent = argParent;
		bounds = argBounds;

		name = controlName.asString;

		positionControlY = 0;

		// "Rect %".format(rect).postln;
		this.initControl;
		this.drawFunc = { this.draw };
	}

	initControl {

		objects.put(\controlerCode, TextView(this)
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
		objects.put(\keyName, StaticText(this)
			.align_(\left)
			.string_("aaa")
			.font_(QGui.fonts[\Small])
			.stringColor_(QGui.qPalette.highlight)
			// .background_(Color.black)
		);

	}

	moveTo{|y|
		(QGui.debbuging and: thisClassDebugging).if({ "% - % [%]".format(thisMethod, name, y).postln; });
		positionControlY = y;
	}

	recall {
		(QGui.debbuging and: thisClassDebugging).if({ thisMethod.postln });

		objects[\keyName].string = "\\" ++ name;

		this.bounds_(Rect.offsetEdgeTop(parent.bounds, positionControlY, 5, 15, 50));
		objects[\keyName].bounds_(Rect.offsetCornerLT(this.bounds, 5,5,60,20));
		objects[\controlerCode].bounds_(Rect.offsetCornerLT(this.bounds, 65,5,170,20));
	}

	draw {
		Pen.width = 1;
		Pen.strokeColor = Color.new255(120,120,120);
		Pen.line(0@0, this.bounds.width@0);
		Pen.line(0@this.bounds.height, this.bounds.width@this.bounds.height);
		Pen.stroke;
	}


}