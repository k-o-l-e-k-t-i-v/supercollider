QGui_Controler : UserView {

	classvar >thisClassDebugging = false;

	var parent, bounds;
	var objects;
	var nodeName;
	var name;
	var quant;
	var code;
	var <positionControlY;

	*new { | parent, bounds, nodeName, controlKey, quant, fnc|
		var me = super.new(parent, bounds ?? {this.sizeHint} );
		me.canFocus = true;
		me.init(parent, bounds, nodeName, controlKey, quant, fnc);
		^me;
	}

	init { |argParent, argBounds, argNodeName, controlKey, argQuant, fnc|
		(QGui.debbuging and: thisClassDebugging).if({
			"\n% - % [%, %]".format(thisMethod, controlKey, argParent, argBounds).postln;
		});

		objects = Dictionary.new();

		parent = argParent;
		bounds = argBounds;

		nodeName = argNodeName;
		name = controlKey.asString;
		quant = argQuant;
		code = fnc;

		positionControlY = 0;

		// "Rect %".format(rect).postln;
		this.initControl;
		this.drawFunc = { this.draw };

		this.action = {
			objects[\keyName].string = "\\" ++ name;
		};

		this.onResize = {
			objects[\keyName].bounds_(Rect.offsetCornerLT(this.bounds, 5,5,60,20));
			objects[\controlerCode].bounds_(Rect.offsetCornerLT(this.bounds, 65,5,370,30));
			objects[\controlerTime].bounds_(Rect.offsetCornerLT(this.bounds, 5,35,470,15));
		};
	}

	initControl {

		objects.put(\controlerTime, QGui_Slider(this)
			.domain_(0,8,80)
			.graphDensity_(0.7)
		);

		objects.put(\controlerCode, QGui_CodeView(this)
			// .string_(code.asCompileString)
			.functionString(code)

			.action_{|codeView|
				"nodeName: %".format(nodeName).postln;
				"codeView: %".format(codeView.function).postln;
				// QGui.controlNode(nodeName, name, codeView.function);
			}

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