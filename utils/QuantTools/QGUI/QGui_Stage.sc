QGui_Stage : UserView {

	var parent, bounds;
	var objects;
	var <>name;
	var <visible;

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

		this.initControl;
		this.drawFunc = { this.draw };
		this.refresh;
	}

	initControl {
		objects.put(\StageName, TextField(this)
			.align_(\left)
			.font_(QGui.fonts[\Small])
			.palette_(QGui.qPalette)
			.visible_(false)
			.action_{|text|
				var oldName = name;
				this.name = text.string;
				QGui.renameStage(oldName, text.string);
				// QGui.refresh;
			}
		);

		objects.put(\ButtonRemoveStage, QGui_Button(this)
			.name_("ButtonExit")
			.iconName("ButtonExitGUI")
			.action_{|button| QGui.removeStage(name); parent.refresh; }
		);
	}

	visible_ {|bool|
		visible = bool;
		this.refresh;
	}

	refresh {
		objects[\ButtonRemoveStage].visible = visible;
		objects[\StageName].visible = visible;
		objects[\StageName].string = name;

		objects[\StageName].bounds = Rect.offsetCornerLT(this.bounds, 5,5,60,20);
		objects[\ButtonRemoveStage].bounds_(Rect.offsetCornerRT(this.bounds, 5,5,25,25));
	}

	draw {
		visible.if({
			Pen.width = 1;
			Pen.strokeColor = Color.new255(120,120,120);
			Pen.line(0@0, this.bounds.width@0);
			Pen.line(0@this.bounds.height, this.bounds.width@this.bounds.height);
			// Pen.addRect(Rect(0,0, this.bounds.width, this.bounds.height));
			Pen.stroke;
		});
	}

}