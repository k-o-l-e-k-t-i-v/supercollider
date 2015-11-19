QGui_PanelStages : UserView {

	var parent, bounds;
	var objects;
	var >name;
	var <visible, value;
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

		mapTextView = ScrollView(this)
		.autohidesScrollers_(true)
		.palette_(QuantGUI.qPalette);

		this.initControl;
		this.refreshObjects;
		this.drawFunc = { this.draw };
		this.resizeMenu;
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

	resizeMenu{
		this.bounds_(Rect.offsetEdgeLeft(parent, 10,50,50,300));

		objects[\ButtonAddStage].bounds_(Rect.offsetCornerLT(this.bounds, 20,10,45,15));
		objects[\ButtonRemoveStage].bounds_(Rect.offsetCornerLT(this.bounds, 70,10,45,15));
		mapTextView.bounds_(Rect.offsetEdgeBottom(this.bounds, 5,5,5,400));

		objects[\MapText].bounds_(Rect.offsetCornerLT(mapTextView, 20,40,270,800));
	}

	refreshObjects{
		objects[\MapText].string_(QuantGUI.getMapText);

		mapTextView.visible = visible;
		objects[\ButtonAddStage].visible = visible;
		objects[\ButtonRemoveStage].visible = visible;
		objects[\MapText].visible = visible;
	}

	/*
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
	*/
}