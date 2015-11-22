QGui_PanelStages : UserView {

	var parent, bounds;
	var objects, stages;
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
		"QGui_PanelStages init".postln;
		parent = argParent;
		bounds = argBounds;

		objects = Dictionary.new();
		stages = Dictionary.new();

		visible = false;

		mapTextView = ScrollView(this)
		.hasHorizontalScroller_(false)
		.hasVerticalScroller_(true)
		.autohidesScrollers_(true)
		.palette_(QGui.qPalette);

		this.initControl;
		this.drawFunc = { this.draw };
		this.refresh;

		"QGui_PanelStages [stages: %]".format(QGui.getStages).postln;
		"QGui_PanelStages [currentStages: %]".format(QGui.getCurrentStage).postln;
	}

	initControl {

		// "QGui_PanelStages initControl".postln;
		objects.put(\MapText, StaticText(mapTextView)
			.align_(\topLeft)
			.font_(QGui.fonts[\Small])
			.palette_(QGui.qPalette)
		);
		objects.put(\ButtonAddStage, Button.new(this)
			.string_("Add")
			.palette_(QGui.qPalette)
			.action_{|button|
				QGui.addStage;
				objects[\MapText].string_(QGui.getMapText);
				// this.refresh;
			};
		);
	}

	visible_ {|bool|
		visible = bool;
		this.refresh;
	}

	refresh {
		"QGui_PanelStages refresh".postln;
		this.bounds_(Rect.offsetEdgeLeft(parent, 10,50,50,300));

		objects[\MapText].string_(QGui.getMapText);

		mapTextView.visible = visible;
		objects[\ButtonAddStage].visible = visible;
		objects[\MapText].visible = visible;

		objects[\ButtonAddStage].bounds_(Rect.offsetEdgeTop(this.bounds, 5,10,10,15));
		objects[\MapText].bounds_(Rect.offsetCornerLT(mapTextView, 10,10,280,500));
		mapTextView.bounds_(Rect.offsetEdgeBottom(this.bounds, 5,5,5,300));

		visible.if({
			stages.do({|oneStage| oneStage.close });
			stages = Dictionary.new();

			QuantMap.stages.do({|stageName, i|
				var yPositionStage;
				var yPositionStageStart = 30;
				var ySizeStage = 40;

				// "\nnew %".format(i).postln;
				yPositionStage = ((ySizeStage + 5)*i ) + yPositionStageStart;
				// yPositionStage.postln;

				stages.put(stageName.asSymbol, QGui_Stage(this)
					.name_(stageName)

					.bounds_(Rect.offsetEdgeTop(this.bounds, yPositionStage, 10,10, ySizeStage));
				);
			});
		});

		stages.do({|oneStage| oneStage.visible_(visible) });
	}

	draw {
		"QGui_PanelStages draw".postln;
		visible.if({
			stages.do({|oneStage| oneStage.refresh });

			Pen.width = 1;
			Pen.strokeColor = Color.new255(20,20,20);
			Pen.addRect(Rect(0,0, this.bounds.width, this.bounds.height));
			Pen.stroke;
		});
	}
}