QGui_Node : UserView {

	classvar >thisClassDebugging = false;

	var parent, bounds;
	var proxy;
	var objects, controls;
	var <>display;
	var positionNodeY;
	var yPositionControl, yPositionControlStart, ySizeControl;


	*new { | parent, bounds, nodeProxy |
		var me = super.new(parent, bounds ?? {this.sizeHint} );
		me.canFocus = true;
		me.init(parent, bounds, nodeProxy);
		^me;
	}

	init { |argParent, argBounds, nodeProxy|

		(QGui.debbuging and: thisClassDebugging).if({
			"\n% - % [%, %]".format(thisMethod, nodeProxy.envirKey, argParent, argBounds).postln;
		});

		objects = Dictionary.new();
		controls = Dictionary.new();

		parent = argParent;
		bounds = argBounds;

		this.setDisplay_(true);

		yPositionControlStart = 5;
		ySizeControl = 50;

		this.name = nodeProxy.envirKey;

		// ndoeName.asSymbol.envirPut(node);
		proxy = nodeProxy;
		"proxy : %".format(proxy).postln;
		"proxyControls : %".format(proxy.controlKeys).postln;
		"proxySource : %".format(proxy.source.def.sourceCode).postln;

		positionNodeY = 0;

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

				/*
				this.colorizeSyntax(view, proxy.source, \var, Color.new255(255,255,255));
				this.colorizeSyntax(view, proxy.source, \varName, Color.new255(250,220,100));
				this.colorizeSyntax(view, proxy.source, \class, Color.new255(180,180,180));
				*/
				this.colorizeSyntax(view, proxy.source, \nameControl, Color.new255(20,180,240));

				// Ctrl + Enter -> unicode 10
				(unicode == 10).if({
					"\n>>> FIRE %".format(view.string).postln;
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
				var oldName = this.name;
				this.name = text.string;
				"\n>>> QGui_Node rename TextField [% -> %]".format(oldName, text.string).postln;
				QGui.renameNode(oldName, text.string);
			}
		);

		objects.put(\ButtonReleaseNode, QGui_Button.new(this)
			.keepingState_(false)
			.name_("ButtonRelease")
			.iconName("ButtonExitGUI")
			.colorFrameOver_(Color.clear)
			.action_{|button|
				"\n>>> QGui_Node release [%]".format(this.name).postln;
				QGui.releaseNode(this.name);
				parent.refresh;
			}

		);

		objects.put(\timeline, ScrollView(this)
			.autohidesScrollers_(true)
			.palette_(QGui.qPalette)
		);

		proxy.controlKeys.do({|key|
			// key.postln;
			controls.put(key.asSymbol, QGui_Controler(objects[\timeline], Rect(5,5,400,40), key.asSymbol));
		});

		this.positionOfCotrolers
		/*

		objects.put(\timeline, ScrollView(parent, Rect.newSides((frame.left + 405),(frame.top + 5), (frame.right - 5), (frame.bottom - 5)))
		.autohidesScrollers_(true)
		.palette_(QGui.qPalette)
		);

		objects.put(\cnt1, QGui_Controler(objects[\timeline], Rect(5,5,400,40)).setKey("amp"));
		objects.put(\cnt2, QGui_Controler(objects[\timeline], Rect(5,50,400,40)).setKey("freq"));
		*/
	}

	setDisplay_ {|bool|
		(QGui.debbuging and: thisClassDebugging).if({ "% [%]".format(thisMethod, bool).postln; });

		display = bool;
		this.visible_(bool);

		// QGui.getStagesGUI.do({|oneStage| oneStage.setDisplay_(bool) });
	}

	positionOfCotrolers {
		(QGui.debbuging and: thisClassDebugging).if({ thisMethod.postln });
		controls.do({|oneCnt, i|
			yPositionControl = ((ySizeControl + 5)*i ) + yPositionControlStart;
			oneCnt.moveTo(yPositionControl);
		});
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
					// { textView.setStringColor(Color.red, onePosition, oneKey.asString.size)} //NUMBERS??
					);
				};
			});
		});
	}

	moveTo{|y|
		(QGui.debbuging and: thisClassDebugging).if({ "% - % [%]".format(thisMethod, this.name, y).postln; });
		positionNodeY = y;
	}

	recall {

		(QGui.debbuging and: thisClassDebugging).if({ thisMethod.postln });

		objects[\nodeName].string = this.name;
		objects[\sourceCode].string = proxy.source.asCompileString;

		/*
		this.colorizeSyntax(objects[\sourceCode], proxy.source, \var, Color.new255(255,255,255));
		this.colorizeSyntax(objects[\sourceCode], proxy.source, \varName, Color.new255(250,220,100));
		this.colorizeSyntax(objects[\sourceCode], proxy.source, \class, Color.new255(180,180,180));
		*/

		this.bounds_(Rect.offsetEdgeTop(parent.bounds, positionNodeY, 5, 5, 200));
		objects[\nodeName].bounds = Rect.offsetCornerLT(this.bounds, 5,5,60,20);
		objects[\ButtonReleaseNode].bounds = Rect.offsetCornerLT(this.bounds, 595,5,15,15);
		objects[\sourceCode].bounds_(Rect.offsetCornerLT(this.bounds, 5,30,600,100));
		objects[\timeline].bounds_(Rect.offsetEdgeRight(this.bounds, 5,5,5,(this.bounds.width - objects[\sourceCode].bounds.width - 20)));

		this.colorizeSyntax(objects[\sourceCode], proxy[0], \nameControl, Color.new255(20,180,240));

		controls.do({|oneControl| oneControl.recall; });
	}

	draw {
		Pen.width = 1;
		Pen.strokeColor = Color.new255(120,120,120);
		Pen.line(0@0, this.bounds.width@0);
		Pen.line(0@this.bounds.height, this.bounds.width@this.bounds.height);
		Pen.stroke;
	}
}