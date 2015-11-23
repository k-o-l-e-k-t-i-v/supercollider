QGui_Stage : UserView {

	classvar >thisClassDebugging = false;

	var parent, bounds;
	var objects;
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
		this.name = stageName;

		positionY = 0;

		objects.put(\StageName, TextField(this)
			.align_(\left)
			.font_(QGui.fonts[\Small])
			.palette_(QGui.qPalette)
			.action_{|text|
				var oldName = this.name;
				this.name = text.string;
				QGui.renameStage(oldName, text.string);
				parent.refresh;
			}
		);

		objects.put(\ButtonRemoveStage, QGui_Button(this)
			.name_("ButtonExit")
			.iconName("ButtonExitGUI")
			.action_{|button|
				QGui.removeStage(this.name);
				parent.refresh;
			}
		);

		this.drawFunc = { this.draw };
	}

	moveTo{|y|
		(QGui.debbuging and: thisClassDebugging).if({ "% - % [%]".format(thisMethod, this.name, y).postln; });
		positionY = y;
	}

	recall {
		(QGui.debbuging and: thisClassDebugging).if({ "% - %".format(thisMethod, this.name).postln; });

		objects[\StageName].string = this.name;

		this.bounds_(Rect.offsetEdgeTop(parent.bounds, positionY, 5, 5, 40));
		objects[\StageName].bounds = Rect.offsetCornerLT(this.bounds, 5,5,60,20);
		objects[\ButtonRemoveStage].bounds_(Rect.offsetCornerRT(this.bounds, 5,5,25,25));
	}

	draw {
		(QGui.debbuging and: thisClassDebugging).if({ "% - %".format(thisMethod, this.name).postln; });

		Pen.width = 1;
		Pen.strokeColor = Color.new255(120,120,120);
		Pen.line(0@0, this.bounds.width@0);
		Pen.line(0@this.bounds.height, this.bounds.width@this.bounds.height);
		// Pen.addRect(Rect(0,0, this.bounds.width, this.bounds.height));
		Pen.stroke;

	}

}