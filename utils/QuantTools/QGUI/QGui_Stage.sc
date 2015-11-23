QGui_Stage : UserView {

	classvar >thisClassDebugging = false;

	var parent, bounds;
	var objects;
	var <>name;
	// var <visible;
	var positionY;

	*new { | parent, bounds, stageName |
		var me = super.new(parent, bounds ?? {this.sizeHint} );
		me.canFocus = true;
		me.init(parent, bounds, stageName);
		^me;
	}

	init { |argParent, argBounds, stageName|

		(QGui.debbuging and: thisClassDebugging).if({
			"\n% - % [%, %]".format(thisMethod, stageName, argParent, argBounds).postln;
		});

		parent = argParent;
		bounds = argBounds;

		objects = Dictionary.new();
		// this.visible = parent.visible;
		name = stageName;

		positionY = 0;

		objects.put(\StageName, TextField(this)
			.align_(\left)
			.font_(QGui.fonts[\Small])
			.palette_(QGui.qPalette)
			// .visible_(this.visible)
			.action_{|text|
				var oldName = name;
				this.name = text.string;
				QGui.renameStage(oldName, text.string);
				parent.refresh;
			}
		);

		objects.put(\ButtonRemoveStage, QGui_Button(this)
			.name_("ButtonExit")
			.iconName("ButtonExitGUI")
			// .visible_(this.visible)
			.action_{|button|
				QGui.removeStage(name);
				parent.refresh;
			}
		);

		this.drawFunc = { this.draw };
	}

	moveTo{|y|
		(QGui.debbuging and: thisClassDebugging).if({ "% - % [%]".format(thisMethod, name, y).postln; });

		positionY = y;
		// this.refresh;
	}

	/*
	visible {|bool|
	(QGui.debbuging and: thisClassDebugging).if({ "% - % [%]".format(thisMethod, name, bool).postln; });

	// visible = bool;

	// objects[\ButtonRemoveStage].visible = this.visible;
	// objects[\StageName].visible = this.visible;

	// this.refresh;
	}
	*/

	reCalculate {
		(QGui.debbuging and: thisClassDebugging).if({ "% - %".format(thisMethod, name).postln; });
		// ("stage.visible" + this + this.visible).postln;

		objects[\StageName].string = name;

		this.bounds_(Rect.offsetEdgeTop(parent.bounds, positionY, 5, 5, 40));
		objects[\StageName].bounds = Rect.offsetCornerLT(this.bounds, 5,5,60,20);
		objects[\ButtonRemoveStage].bounds_(Rect.offsetCornerRT(this.bounds, 5,5,25,25));
		// this.doAction;
	}

	draw {
		(QGui.debbuging and: thisClassDebugging).if({ "% - %".format(thisMethod, name).postln; });

		// visible.if({
		Pen.width = 1;
		Pen.strokeColor = Color.new255(120,120,120);
		Pen.line(0@0, this.bounds.width@0);
		Pen.line(0@this.bounds.height, this.bounds.width@this.bounds.height);
		// Pen.addRect(Rect(0,0, this.bounds.width, this.bounds.height));
		Pen.stroke;
		// });
	}

}