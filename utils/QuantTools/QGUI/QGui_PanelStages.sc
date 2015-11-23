QGui_PanelStages : UserView {

	classvar >thisClassDebugging = false;

	var parent, bounds;
	var objects, stages;
	var mapTextView;

	var yPositionStage, yPositionStageStart, ySizeStage;

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
		stages = Dictionary.new();

		this.visible = false;

		yPositionStageStart = 30;
		ySizeStage = 40;

		mapTextView = ScrollView(this)
		.hasHorizontalScroller_(false)
		.hasVerticalScroller_(true)
		.autohidesScrollers_(true)
		.palette_(QGui.qPalette);

		this.initControl;
		this.drawFunc = { this.draw };
	}

	initControl {

		(QGui.debbuging and: thisClassDebugging).if({ thisMethod.postln });

		objects.put(\MapText, StaticText(mapTextView)
			.align_(\topLeft)
			.font_(QGui.fonts[\Small])
			.palette_(QGui.qPalette)
		);
		objects.put(\ButtonAddStage, Button.new(this)
			.string_("Add")
			.palette_(QGui.qPalette)
			.action_{|button|
				QGui.addStage(\temp);
				objects[\MapText].string_(QGui.getMapText);
			};
		);

		QuantMap.stages.do({|stageName, i|
			this.addStage(stageName);
		});
	}

	addStage {|name|
		(QGui.debbuging and: thisClassDebugging).if({ "% [%]".format(thisMethod, name).postln });

		stages.put(name.asSymbol, QGui_Stage(this, stageName:name.asSymbol)
			.mouseDownAction_{ |view, x, y, buttNum|
				QGui.currentStage_(view.name.asSymbol);
				stages.do({|oneStage| oneStage.isCurrent = false; oneStage.refresh });
				view.isCurrent = true;
				QGui.refreshAll;
			}
		);
		this.positionOfStages;
	}

	removeStage{|name|
		(QGui.debbuging and: thisClassDebugging).if({ "% [%]".format(thisMethod, name).postln });

		stages.at(name.asSymbol).remove;
		stages.removeAt(name.asSymbol);
		this.positionOfStages;
	}

	positionOfStages {
		(QGui.debbuging and: thisClassDebugging).if({ thisMethod.postln });
		stages.do({|oneStage, i|
			yPositionStage = ((ySizeStage + 5)*i ) + yPositionStageStart;
			oneStage.moveTo(yPositionStage);
		});
	}

	recall {
		(QGui.debbuging and: thisClassDebugging).if({ thisMethod.postln });

		objects[\MapText].string_(QGui.getMapText);

		this.bounds_(Rect.offsetEdgeLeft(parent, 10,50,50,300));
		objects[\ButtonAddStage].bounds_(Rect.offsetEdgeTop(this.bounds, 5,10,10,15));
		objects[\MapText].bounds_(Rect.offsetCornerLT(mapTextView, 10,10,280,500));
		mapTextView.bounds_(Rect.offsetEdgeBottom(this.bounds, 5,5,5,300));

		stages.do({|oneStage| oneStage.recall });
	}

	draw {
		QGui.debbuging.if({	"%".format(thisMethod).postln });

		Pen.width = 1;
		Pen.strokeColor = Color.new255(20,20,20);
		Pen.addRect(Rect(0,0, this.bounds.width, this.bounds.height));
		Pen.stroke;
	}
}