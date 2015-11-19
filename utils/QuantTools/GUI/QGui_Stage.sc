QGui_Stage : UserView {

	var parent, bounds;
	var objects;
	var >name;
	var <visible;
	var mapTextView;

	*new { | parent, bounds |
		var me = super.new(parent, bounds ?? {this.sizeHint} );
		me.canFocus = true;
		me.init(parent, bounds);
		^me;
	}

	init { |argParent, argBounds|
		parent = argParent;
		bounds = argBounds;

		objects = Dictionary.new();
		visible = false;
/*
		mapTextView = ScrollView(this)
		.autohidesScrollers_(true)
		.palette_(QuantGUI.qPalette);
*/
		// this.initControl;
		// this.refreshObjects;
		this.drawFunc = { this.draw };
		// this.resizeMenu;
	}

	initControl {
		// "QGui_PanelStages initControl".postln;
		objects.put(\MapText, StaticText(mapTextView)
			.align_(\topLeft)
			.font_(QuantGUI.fonts[\Small])
			.palette_(QuantGUI.qPalette)
		);
		objects.put(\ButtonAddStage, Button.new(this)
			.string_("Add")
			.palette_(QuantGUI.qPalette)
			.action_{|button|
				QuantGUI.addStage;
				objects[\MapText].string_(QuantGUI.getMapText);
			};
		);
		objects.put(\ButtonRemoveStage, Button.new(this)
			.string_("Remove")
			.palette_(QuantGUI.qPalette)
			.action_{|button|
				QuantGUI.removeStage;
				objects[\MapText].string_(QuantGUI.getMapText);
			};
		);
	}

	draw {
		visible.if({
			Pen.width = 1;
			Pen.strokeColor = Color.new255(20,20,20);
			Pen.addRect(Rect(0,0, this.bounds.width, this.bounds.height));
			Pen.stroke;
		});
	}

	visible_ {|bool|
		visible = bool;
		this.refreshObjects;
		this.refresh;
	}
}