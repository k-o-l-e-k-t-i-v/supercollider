QGui_Node : UserView {

	classvar >thisClassDebugging = false;

	var parent, bounds;
	var proxy;
	var objects;
	var positionY;


	*new { | parent, bounds, nodeName |
		var me = super.new(parent, bounds ?? {this.sizeHint} );
		me.canFocus = true;
		me.init(parent, bounds, nodeName);
		^me;
	}

	init { |argParent, argBounds, nodeName|

		(QGui.debbuging and: thisClassDebugging).if({
			"\n% - % [%, %]".format(thisMethod, nodeName, argParent, argBounds).postln;
		});

		objects = Dictionary.new();

		parent = argParent;
		bounds = argBounds;

		this.name = nodeName;
		// proxy = currentEnvironment[nodeName.asSymbol];
		proxy = nodeName.asSymbol.envirGet;
		"proxy : %".format(proxy).postln;
		"proxyControl : %".format(proxy.controlKeys).postln;
		"proxySource : %".format(proxy.source.def.sourceCode).postln;

		positionY = 0;

		this.initControl;
		this.drawFunc = { this.draw };
	}

	initControl {
		// QGui.syntax.at(\nameControl).postln;
		objects.put(\sourceCode, TextView(this)
			.focus(true)
			.palette_(QGui.qPalette)
			.font_(QGui.fonts[\script])
			.string_(proxy.source.asCompileString)
			.stringColor_(Color.new255(100,100,100))
			.tabWidth_(25)
			.keyDownAction_{ |view, char, modifiers, unicode, keycode, key|
				// "ENTER \sourceCode %,%,%,%,%,%".format(view, char, modifiers, unicode, keycode, key).postln

				this.colorizeSyntax(view, proxy.source, \var, Color.new255(255,255,255));
				this.colorizeSyntax(view, proxy.source, \varName, Color.new255(250,220,100));
				this.colorizeSyntax(view, proxy.source, \class, Color.new255(180,180,180));
				this.colorizeSyntax(view, proxy.source, \nameControl, Color.new255(20,180,240));

				// Ctrl + Enter -> unicode 10
				(unicode == 10).if({
					"FIRE %".format(view.string).postln;
					QGui.editNode(this.name, 0, view.string);
				});
			}
		);


		objects.put(\nodeName, TextField(this)
			.align_(\left)
			.font_(QGui.fonts[\Small])
			.palette_(QGui.qPalette)
			.background_(Color.clear)
			.action_{|text|
				// "ENTER \nodeName %".format(text).postln;
			}
		);

		/*
		objects.put(\sourceCode, TextView(parent ,Rect.newSides((frame.left + 5),(frame.top + 5), 400, (frame.bottom - 5)))
		.focus(true)
		.palette_(QGui.qPalette)
		.font_(QGui.fonts[\script])
		);

		objects.put(\timeline, ScrollView(parent, Rect.newSides((frame.left + 405),(frame.top + 5), (frame.right - 5), (frame.bottom - 5)))
		.autohidesScrollers_(true)
		.palette_(QGui.qPalette)
		);

		objects.put(\cnt1, QGui_Controler(objects[\timeline], Rect(5,5,400,40)).setKey("amp"));
		objects.put(\cnt2, QGui_Controler(objects[\timeline], Rect(5,50,400,40)).setKey("freq"));
		*/
	}

	colorizeSyntax{	|textView, function, type, color|
		var string, keys;

		(QGui.debbuging and: thisClassDebugging).if({ thisMethod.postln });

		// textView.stringColor_(Color.new255(100,100,100));

		string = function.asCompileString;
		keys = case
		{type.asSymbol == \var} { \var }
		{type.asSymbol == \varName} { function.def.varNames }
		{type.asSymbol == \class} { function.def.selectors }
		{type.asSymbol == \nameControl} { function.def.constants };

		keys.do({|oneKey|
			var positions = string.findAll(oneKey.asString);
			positions.do({|onePosition|
				case
				{type.asSymbol == \var}
				{ textView.setStringColor(color, onePosition, oneKey.asString.size) }

				{type.asSymbol == \varName}
				{
					(string[onePosition-1] == $\ ).if({
						textView.setStringColor(color, onePosition, oneKey.asString.size)
					})
				}

				{type.asSymbol == \class}
				{ textView.setStringColor(color, onePosition, oneKey.asString.size) }

				{type.asSymbol == \nameControl}
				{
					oneKey.isKindOf(Symbol).if({
						(string[onePosition-1] != $\ ).if({
							textView.setStringColor(color, onePosition-1, oneKey.asString.size+1)
						})
					},
					{ textView.setStringColor(Color.red, onePosition, oneKey.asString.size)}
					);
				};
			});
		});
	}

	moveTo{|y|
		(QGui.debbuging and: thisClassDebugging).if({ "% - % [%]".format(thisMethod, this.name, y).postln; });
		positionY = y;
	}

	recall {

		(QGui.debbuging and: thisClassDebugging).if({ thisMethod.postln });

		objects[\nodeName].string = this.name;
		objects[\sourceCode].string = proxy.source.asCompileString;

		QGui.syntax.at(\varName).postln;

		this.colorizeSyntax(objects[\sourceCode], proxy.source, \var, Color.new255(255,255,255));
		this.colorizeSyntax(objects[\sourceCode], proxy.source, \varName, Color.new255(250,220,100));
		this.colorizeSyntax(objects[\sourceCode], proxy.source, \class, Color.new255(180,180,180));
		this.colorizeSyntax(objects[\sourceCode], proxy.source, \nameControl, Color.new255(20,180,240));
		/*
		syntax.put(\text, Color.new255(100,100,100));
		syntax.put(\var, Color.new255(255,255,255));
		syntax.put(\varName, Color.new255(250,220,100));
		syntax.put(\class, Color.new255(180,180,180));
		syntax.put(\nameControl, Color.new255(20,180,240));
		*/

		this.bounds_(Rect.offsetEdgeTop(parent.bounds, positionY, 5, 5, 200));
		objects[\nodeName].bounds = Rect.offsetCornerLT(this.bounds, 5,5,60,20);
		objects[\sourceCode].bounds_(Rect.offsetCornerLT(this.bounds, 5,30,600,100));
	}

	draw {
		Pen.width = 1;
		Pen.strokeColor = Color.new255(120,120,120);
		Pen.line(0@0, this.bounds.width@0);
		Pen.line(0@this.bounds.height, this.bounds.width@this.bounds.height);
		Pen.stroke;
	}


}