QGui_PanelMap : UserView {
	classvar >thisClassDebugging = false;

	var parent, bounds;
	var objects;
	var mapTextView;
	var <>display;

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

		parent = argParent;
		bounds = argBounds;

		objects = Dictionary.new();

		this.name = "QGui_PanelMap";
		this.setDisplay_(false);

		mapTextView = ScrollView(this)
		.hasHorizontalScroller_(false)
		.hasVerticalScroller_(true)
		.autohidesScrollers_(true)
		.palette_(QGui.qPalette);

		this.initControl;

		this.onResize_{
			(this.name + "resize").warn;
			mapTextView.bounds_(Rect.offsetEdgeBottom(this.bounds, 5,5,5,500));
			objects[\MapText].bounds_(Rect.offsetCornerLT(mapTextView, 10,10,480,500));

			parent.refreshPanels;
		};

		// this.drawFunc = { this.draw };

		this.action_{
			(QGui.debbuging and: thisClassDebugging).if({ thisMethod.postln });
			// "action".warn;
			objects[\MapText].string_(QGui.getMapText);
		};

		this.doAction;
	}

	initControl {

		(QGui.debbuging and: thisClassDebugging).if({ thisMethod.postln });

		QGui_ViewControl(this, [\right]).removeMoveConroler;

		objects.put(\MapText, StaticText(mapTextView)
			.align_(\topLeft)
			.font_(QGui.fonts[\Small])
			.palette_(QGui.qPalette)
		);
	}

	setDisplay_ {|bool|
		(QGui.debbuging and: thisClassDebugging).if({ "% [%]".format(thisMethod, bool).postln; });

		display = bool;
		this.visible_(bool);
	}

}