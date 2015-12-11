QGui_Controler : UserView {

	classvar >thisClassDebugging = false;

	var parent, bounds;
	var objects;
	var name;
	var <positionControlY;

	*new { | parent, bounds, controlName|
		var me = super.new(parent, bounds ?? {this.sizeHint} );
		me.canFocus = true;
		me.init(parent, bounds, controlName);
		^me;
	}

	init { |argParent, argBounds, controlName|
		(QGui.debbuging and: thisClassDebugging).if({
			"\n% - % [%, %]".format(thisMethod, controlName, argParent, argBounds).postln;
		});

		objects = Dictionary.new();

		parent = argParent;
		bounds = argBounds;

		name = controlName.asString;

		positionControlY = 0;

		// "Rect %".format(rect).postln;
		this.initControl;
		this.drawFunc = { this.draw };

		this.action = {
			objects[\keyName].string = "\\" ++ name;
		};

		this.onResize = {
			objects[\keyName].bounds_(Rect.offsetCornerLT(this.bounds, 5,5,60,20));
			objects[\controlerCode].bounds_(Rect.offsetCornerLT(this.bounds, 65,5,170,30));
			objects[\controlerTime].bounds_(Rect.offsetCornerLT(this.bounds, 5,35,470,15));
		};
	}

	initControl {

		objects.put(\controlerTime, QGui_Slider(this)
			.domain_(0,8,80)
			.graphDensity_(0.7)
		);

		objects.put(\controlerCode, QGui_CodeView(this)
			/*
			.functionString(proxy.source)
			.action_{|codeView|
				QGui.editNode(this.name, 0, codeView.function);
			}
			*/
		);

		objects.put(\keyName, StaticText(this)
			.align_(\left)
			.string_("aaa")
			.font_(QGui.fonts[\Small])
			.stringColor_(QGui.qPalette.highlight)
			// .background_(Color.black)
		);

	}

	moveConroler{|y|
		(QGui.debbuging and: thisClassDebugging).if({ "% - % [%]".format(thisMethod, name, y).postln; });
		positionControlY = y;
	}

	draw {
		Pen.width = 1;
		Pen.strokeColor = Color.new255(120,120,120);
		Pen.line(0@0, this.bounds.width@0);
		Pen.line(0@this.bounds.height, this.bounds.width@this.bounds.height);
		Pen.stroke;
	}


}