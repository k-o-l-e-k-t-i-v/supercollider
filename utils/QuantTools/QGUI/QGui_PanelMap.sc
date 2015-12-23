QGui_PanelMap : UserView {
	classvar >thisClassDebugging = false;

	var parent;
	var objects;
	var mapTextView;
	var <>display;
	var normalWidth;
	var routine, isSlideResize;

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
		this.bounds = argBounds;

		normalWidth = this.bounds.width;
		isSlideResize = false;

		objects = Dictionary.new();

		this.name = "QGui_PanelMap";
		this.setDisplay_(true);

		mapTextView = ScrollView(this)
		.hasHorizontalScroller_(false)
		.hasVerticalScroller_(true)
		.autohidesScrollers_(true)
		.palette_(QGui.qPalette);

		this.initControl;

		this.onResize_{
			// (this.name + "resize").warn;
			isSlideResize.not.if({ normalWidth = this.bounds.width });
			mapTextView.bounds_(Rect.offsetRect(this.bounds, 5,5,5,5));
			objects[\MapText].bounds_(Rect.offsetCornerLT(mapTextView, 10,10,480,500));
			// "normalWidth %".format(normalWidth).postln;
			parent.refreshPanels;
		};

		this.action_{
			(QGui.debbuging and: thisClassDebugging).if({ thisMethod.postln });
			objects[\MapText].string_(QGui.getMapText);
			objects[\edges].doAction;
		};

		this.drawFunc = { this.draw };
	}

	initControl {

		(QGui.debbuging and: thisClassDebugging).if({ thisMethod.postln });

		objects.put(\edges, QGui_ViewControl(this, [\right])
			.removeMoveConroler
		);

		objects.put(\MapText, StaticText(mapTextView)
			.align_(\topLeft)
			.font_(QGui.fonts[\Small])
			.palette_(QGui.qPalette)
		);
	}

	setDisplay_ {|bool|
		(QGui.debbuging and: thisClassDebugging).if({ "% [%]".format(thisMethod, bool).postln; });

		display = bool;
		bool.if(
			{ this.slideIn },
			{ this.slideOut }
		);
	}

	draw {
		// (QGui.debbuging and: thisClassDebugging).if({ thisMethod.postln });

		this.background_(Color.new255(330,30,30));
		Pen.width = 1;
		Pen.strokeColor = Color.new255(20,20,20);
		Pen.addRect(Rect(0,0, this.bounds.width, this.bounds.height));
		Pen.stroke;
	}

	slideOut{
		var time = 0.25;
		var frames = 24;
		var x;

		isSlideResize = true;
		routine = Routine({
			frames.do({|i|
				x = 1-(i/frames);
				this.bounds_(Rect.offsetEdgeLeft(parent.bounds, 10,50,50, x * normalWidth));
				this.refresh;
				(time/frames).wait;
			});

			this.bounds_(Rect.offsetEdgeLeft(parent.bounds, 10,50,50, 2));
			this.refresh;

			objects[\edges].doAction;

			(time/frames).wait;
			this.visible_(false);
			objects[\edges].notNil.if({
				objects[\edges].edgeViews.do({|oneMan| oneMan.visible_(false)});
			});

			isSlideResize = false;
		}).play(AppClock);
	}

	slideIn{
		var time = 0.25;
		var frames = 24;
		var x;

		this.visible_(true);
		objects[\edges].notNil.if({
			objects[\edges].edgeViews.do({|oneMan| oneMan.visible_(true)});
		});

		isSlideResize = true;
		routine = Routine({
			frames.do({|i|
				x = i/frames;
				this.bounds_(Rect.offsetEdgeLeft(parent.bounds, 10,50,50, x * normalWidth));
				this.refresh;
				(time/frames).wait;
			});
			objects[\edges].doAction;

			(time/frames).wait;
			isSlideResize = false;
		}).play(AppClock);
	}
}