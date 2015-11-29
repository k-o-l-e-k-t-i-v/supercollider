QGui_PanelStages : UserView {

	classvar >thisClassDebugging = false;

	var parent, bounds;
	var objects, <>stages;
	var mapTextView;
	var <>display;

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

		this.name = "QGui_PanelStages";
		this.setDisplay_(false);

		yPositionStageStart = 25;
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
		objects.put(\ButtonAddStage, QGui_Button.new(this)
			.string_("Add")
			// .palette_(QGui.qPalette)
			.colorFrame_(Color.new255(120,120,120))
			.keepingState_(false)
			.action_{|button|
				QGui.addStage(\temp);
				// this.refresh;
			};
		);
	}

	setDisplay_ {|bool|
		(QGui.debbuging and: thisClassDebugging).if({ "% [%]".format(thisMethod, bool).postln; });
		// this.positionOfStages;
		display = bool;
		this.visible_(bool);

		QGui.getStagesGUI.do({|oneStage| oneStage.setDisplay_(bool) });
	}

	/*
	addStage {|name|
	(QGui.debbuging and: thisClassDebugging).if({ "% [%]".format(thisMethod, name).postln });
	"POZOR".warn;
	// stages.put(name.asSymbol, QGui_Stage(this, stageName:name.asSymbol));
	this.positionOfStages;
	}

	removeStage{|name|
	(QGui.debbuging and: thisClassDebugging).if({ "% [%]".format(thisMethod, name).postln });

	stages.at(name.asSymbol).remove;
	stages.removeAt(name.asSymbol);
	this.positionOfStages;
	}
	*/
/*
	setCurrentStage { |name|
		(QGui.debbuging and: thisClassDebugging).if({ "% [%]".format(thisMethod, name).postln });

		QGui.getStagesGUI.do({|oneStage|
			// stages.do({|oneStage|
			(name.asSymbol == oneStage.name.asSymbol).if(
				{ oneStage.isCurrent = true; "oneStage.isCurrent = true".warn },
				{ oneStage.isCurrent = false; "oneStage.isCurrent = false".warn }
			);
			oneStage.refresh;
		});
	}
*/
	positionOfStages {
		(QGui.debbuging and: thisClassDebugging).if({ thisMethod.postln });

		QGui.getStagesGUI.do({|oneStage, i|
			yPositionStage = ((ySizeStage + 5)*i ) + yPositionStageStart;
			oneStage.moveTo(yPositionStage);
		});
	}

	recall {
		(QGui.debbuging and: thisClassDebugging).if({ thisMethod.postln });

		objects[\MapText].string_(QGui.getMapText);

		this.bounds_(Rect.offsetEdgeLeft(parent, 10,50,50,300));
		// this.bounds_(Rect.offsetCornerLT(parent, 10,10,300,1300));
		objects[\ButtonAddStage].bounds_(Rect.offsetEdgeTop(this.bounds, 5,5,5,15));
		objects[\MapText].bounds_(Rect.offsetCornerLT(mapTextView, 10,10,280,500));
		mapTextView.bounds_(Rect.offsetEdgeBottom(this.bounds, 5,5,5,300));

		this.positionOfStages;
		QGui.getStagesGUI.do({|oneStage| oneStage.recall });
		// stages.do({|oneStage| oneStage.recall });
	}

	draw {
		(QGui.debbuging and: thisClassDebugging).if({ thisMethod.postln });

		this.background_(Color.new255(30,30,30));
		Pen.width = 1;
		Pen.strokeColor = Color.new255(20,20,20);
		Pen.addRect(Rect(0,0, this.bounds.width, this.bounds.height));
		Pen.stroke;
	}
}