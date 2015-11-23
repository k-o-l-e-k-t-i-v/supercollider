QGui_Node : UserView {

	classvar >thisClassDebugging = false;

	var parent, bounds;
	var objects;
	var positionY;


	*new { | parent, bounds, nodeName |
		var me = super.new(parent, bounds ?? {this.sizeHint} );
		me.canFocus = true;
		me.init(parent, bounds, nodeName);
		^me;
	}

	init { |argParent, argBounds, nodeName|

		(QGui.debbuging and: thisClassDebugging).if({
			"\n% - % [%, %]".format(thisMethod, nodeName, argParent, argBounds).postln;
		});

		objects = Dictionary.new();

		parent = argParent;
		bounds = argBounds;

		this.name = nodeName;

		positionY = 0;

		this.initControl;
		this.drawFunc = { this.draw };
	}

	initControl {
		objects.put(\sourceCode, TextView(this)
			.focus(true)
			.palette_(QGui.qPalette)
			.font_(QGui.fonts[\script])
		);

		objects.put(\nodeName, TextField(this)
			.align_(\left)
			.font_(QGui.fonts[\Small])
			.palette_(QGui.qPalette)
			.background_(Color.clear)
			.action_{|text|

			}
		);

		/*
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
		*/
	}

	moveTo{|y|
		(QGui.debbuging and: thisClassDebugging).if({ "% - % [%]".format(thisMethod, this.name, y).postln; });
		positionY = y;
	}

	recall {
		objects[\nodeName].string = this.name;

		this.bounds_(Rect.offsetEdgeTop(parent.bounds, positionY, 5, 5, 200));
		objects[\nodeName].bounds = Rect.offsetCornerLT(this.bounds, 5,5,60,20);
		objects[\sourceCode].bounds_(Rect.offsetEdgeTop(this.bounds, 35,5,5,100));
	}

	draw {
		Pen.width = 1;
		Pen.strokeColor = Color.new255(120,120,120);
		Pen.line(0@0, this.bounds.width@0);
		Pen.line(0@this.bounds.height, this.bounds.width@this.bounds.height);
		Pen.stroke;
	}


}