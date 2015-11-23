QGui_PanelNodes : UserView {
	classvar >thisClassDebugging = false;

	var parent, bounds;
	var objects;
	var >name;
	// var <visible;

	*new { | parent, bounds |
		var me = super.new(parent, bounds ?? {this.sizeHint} );
		me.canFocus = true;
		me.init(parent, bounds);
		^me;
	}

	init { |argParent, argBounds|
		(QGui.debbuging and: thisClassDebugging).if({
			"\n% [%, %]".format(thisMethod, argParent, argBounds).postln;
		});

		objects = Dictionary.new();

		parent = argParent;
		bounds = argBounds;

		// visible = false;
		this.visible = false;

		this.initControl;
		// this.reCalculate;
		this.drawFunc = { this.draw };
	}

	initControl {
		(QGui.debbuging and: thisClassDebugging).if({ thisMethod.postln });

		objects.put(\sourceCode, TextView(this)
			.focus(true)
			.palette_(QGui.qPalette)
			.font_(QGui.fonts[\script])
			// .visible_(visible)
		);

		objects.put(\ButtonAddNode, Button.new(this)
			.string_("Add")
			.palette_(QGui.qPalette)
			// .visible_(visible)
			.action_{|button|
				// QGui.addStage;
				// objects[\MapText].string_(QGui.getMapText);
			};
		);
		objects.put(\ButtonRemoveNode, Button.new(this)
			.string_("Remove")
			.palette_(QGui.qPalette)
			// .visible_(visible)
			.action_{|button|
				// QGui.removeStage;
				// objects[\MapText].string_(QGui.getMapText);
			};
		);


		/*
		objects.put(\timeline, ScrollView(parent, Rect.newSides((frame.left + 405),(frame.top + 5), (frame.right - 5), (frame.bottom - 5)))
		.autohidesScrollers_(true)
		.palette_(QGui.qPalette)
		);

		objects.put(\cnt1, QGui_Controler(objects[\timeline], Rect(5,5,400,40)).setKey("amp"));
		objects.put(\cnt2, QGui_Controler(objects[\timeline], Rect(5,50,400,40)).setKey("freq"));
		*/
	}
/*
	visible_ {|bool|
		(QGui.debbuging and: thisClassDebugging).if({ "% [%]".format(thisMethod, bool).postln });

		visible = bool;
		objects[\ButtonAddNode].visible = visible;
		objects[\ButtonRemoveNode].visible = visible;
		objects[\sourceCode].visible = visible;
		// this.reCalculate;
	}
*/
	reCalculate{
		(QGui.debbuging and: thisClassDebugging).if({ thisMethod.postln });


		this.bounds_(Rect.offsetEdgeLeft(parent, 350,50,50,300));

		objects[\ButtonAddNode].bounds_(Rect.offsetCornerLT(this.bounds, 20,10,45,15));
		objects[\ButtonRemoveNode].bounds_(Rect.offsetCornerLT(this.bounds, 70,10,45,15));
		objects[\sourceCode].bounds_(Rect.offsetCornerLT(this.bounds, 10,60,280,150));
	}

	draw {
		(QGui.debbuging and: thisClassDebugging).if({ thisMethod.postln });
		// visible.if({
			Pen.width = 1;
			Pen.strokeColor = Color.white;
			Pen.addRect(Rect(0,0, this.bounds.width, this.bounds.height));
			Pen.stroke;
// })
	}

}