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

		this.initControl;

		this.onResize_{
			// (this.name + "resize").warn;
			objects[\ButtonAddStage].bounds_(Rect.offsetEdgeTop(this.bounds, 5,5,5,15));
						QGui.getStagesGUI.do({|oneStage|
				oneStage.bounds_(Rect.offsetEdgeTop(this.bounds, oneStage.positionY, 5, 5, 40))
				// oneStage.resize;
			});

			parent.refreshPanels;
		};

		this.drawFunc = { this.draw };

		this.action_{
			(QGui.debbuging and: thisClassDebugging).if({ thisMethod.postln });

			this.positionOfStages;

			QGui.getStagesGUI.do({|oneStage| oneStage.doAction });
		};

		this.doAction;
	}

	initControl {

		(QGui.debbuging and: thisClassDebugging).if({ thisMethod.postln });

		QGui_ViewControl(this, [\right]).removeMoveConroler;

			objects.put(\ButtonAddStage, QGui_Button.new(this)
			.string_("Add")
			// .palette_(QGui.qPalette)
			.colorFrame_(Color.new255(120,120,120))
			.keepingState_(false)
			.action_{|button|
				QGui.addStage(\temp);
				this.positionOfStages;
				this.doAction;
			};
		);
	}

	setDisplay_ {|bool|
		(QGui.debbuging and: thisClassDebugging).if({ "% [%]".format(thisMethod, bool).postln; });

		display = bool;
		this.visible_(bool);

		QGui.getStagesGUI.do({|oneStage| oneStage.setDisplay_(bool).doAction });
	}

	positionOfStages {
		(QGui.debbuging and: thisClassDebugging).if({ thisMethod.postln });

		QGui.getStagesGUI.do({|oneStage, i|
			yPositionStage = ((ySizeStage + 5)*i ) + yPositionStageStart;
			yPositionStage.postln;
			oneStage.moveStage(yPositionStage);
			// oneStage.resizeTo(this.bounds.width-10, oneStage.height);
			/*oneStage.recall;*/
			oneStage.doAction;
		});
	}

	draw {
		// (QGui.debbuging and: thisClassDebugging).if({ thisMethod.postln });

		this.background_(Color.new255(30,30,30));
		Pen.width = 1;
		Pen.strokeColor = Color.new255(20,20,20);
		Pen.addRect(Rect(0,0, this.bounds.width, this.bounds.height));
		Pen.stroke;
	}
}