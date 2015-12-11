QGui_Node : UserView {

	classvar >thisClassDebugging = false;

	var parent, bounds;
	var proxy;
	var objects, controls;
	var <>display;
	var <positionNodeY;
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
		this.bounds = argBounds;

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

		this.onResize_{
			this.refreshCoor;
		};

		this.action_{
			objects[\nodeName].string = this.name;
			// objects[\sourceCode].functionString(proxy.source);

			controls.do({|oneControl| oneControl.doAction; });

			this.refreshCoor;
		};
		this.refreshCoor;
		objects[\sourceCode].functionString(proxy.source);
	}

	refreshCoor{
		objects[\nodeName].bounds = Rect.offsetCornerLT(this.bounds, 5,5,60,20);
		objects[\ButtonReleaseNode].bounds = Rect.offsetCornerLT(this.bounds, 595,5,15,15);
		objects[\sourceCode].bounds_(Rect.offsetCornerLT(this.bounds, 5,30,600,100)).resize;
		objects[\timeline].bounds_(
			Rect.offsetEdgeRight(this.bounds, 5,5,5,(this.bounds.width - objects[\sourceCode].bounds.width - 20))
		);

		controls.do({|oneControl|
			oneControl.bounds_(Rect.offsetEdgeTop(parent.bounds, oneControl.positionControlY, 5, 15, 50));
		});
	}

	initControl {

		objects.put(\sourceCode, QGui_CodeView(this)

			.action_{|codeView|
				// "codeAction".warn;
				// codeView.function.postln;
				// codeView.function.def.sourceCode.postln;
				// "codeAction2".warn;
				QGui.editNode(this.name, 0, codeView.function);
				// codeView.functionString(proxy[0]);
				// QGui.refreshAll;
				this.doAction;
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
			controls.put(key.asSymbol, QGui_Controler(objects[\timeline], Rect(5,5,400,50), key.asSymbol));
		});

		this.positionOfCotrolers
	}

	setDisplay_ {|bool|
		(QGui.debbuging and: thisClassDebugging).if({ "% [%]".format(thisMethod, bool).postln; });

		display = bool;
		this.visible_(bool);
	}

	positionOfCotrolers {
		(QGui.debbuging and: thisClassDebugging).if({ thisMethod.postln });
		controls.do({|oneCnt, i|
			yPositionControl = ((ySizeControl + 5)*i ) + yPositionControlStart;
			oneCnt.moveConroler(yPositionControl);
		});
	}



	moveNode{|y|
		(QGui.debbuging and: thisClassDebugging).if({ "% - % [%]".format(thisMethod, this.name, y).postln; });
		positionNodeY = y;
	}

	recall {

		// (QGui.debbuging and: thisClassDebugging).if({ thisMethod.postln });

		"Node.recall".warn;

		// objects[\nodeName].string = this.name;
		// objects[\sourceCode].functionString(proxy.source);
		/*
		this.bounds_(Rect.offsetEdgeTop(parent.bounds, positionNodeY, 5, 5, 200));
		objects[\nodeName].bounds = Rect.offsetCornerLT(this.bounds, 5,5,60,20);
		objects[\ButtonReleaseNode].bounds = Rect.offsetCornerLT(this.bounds, 595,5,15,15);
		objects[\sourceCode].bounds_(Rect.offsetCornerLT(this.bounds, 5,30,600,100)).resize;
		objects[\timeline].bounds_(Rect.offsetEdgeRight(this.bounds, 5,5,5,(this.bounds.width - objects[\sourceCode].bounds.width - 20)));
		*/
		// controls.do({|oneControl| oneControl.recall; });
	}

	draw {
		(QGui.debbuging and: thisClassDebugging).if({ thisMethod.postln });

		Pen.width = 1;
		Pen.strokeColor = Color.new255(120,120,120);
		Pen.line(0@0, this.bounds.width@0);
		Pen.line(0@this.bounds.height, this.bounds.width@this.bounds.height);
		Pen.stroke;
	}
}