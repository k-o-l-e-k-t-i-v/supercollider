QGui_Node : UserView {

	classvar >thisClassDebugging = false;

	var parent, bounds;
	var qNode;
	// var proxy;
	var objects, controls;
	var <>display;
	var <positionNodeY;
	var yPositionControl, yPositionControlStart, ySizeControl;


	*new { | parent, bounds, qNode |
		var me = super.new(parent, bounds ?? {this.sizeHint} );
		me.canFocus = true;
		me.init(parent, bounds, qNode);
		^me;
	}

	init { |argParent, argBounds, argQNode|

		(QGui.debbuging and: thisClassDebugging).if({
			"\n% - % [%, %]".format(thisMethod, argQNode.proxy.envirKey, argParent, argBounds).postln;
		});

		objects = Dictionary.new();
		controls = Dictionary.new();

		parent = argParent;
		this.bounds = argBounds;

		this.setDisplay_(true);

		yPositionControlStart = 5;
		ySizeControl = 50;

		qNode = argQNode;

		this.name = qNode.nodeName;

		// ndoeName.asSymbol.envirPut(node);
		// proxy = nodeProxy;
		"proxy : %".format(qNode.proxy).postln;
		"proxyControls : %".format(qNode.proxy.controlKeys).postln;
		"proxySource : %".format(qNode.proxy.source.def.sourceCode).postln;

		positionNodeY = 0;

		this.initControl;
		this.drawFunc = { this.draw };

		this.onResize_{
			this.refreshCoor;
		};

		this.action_{
			objects[\nodeName].string = this.name;

			controls.do({|oneControl| oneControl.doAction; });

			this.refreshCoor;
		};

		this.refreshCoor;
		objects[\sourceCode].functionString(qNode.proxy[0]);

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

		controls = Dictionary.new();

		objects.put(\sourceCode, QGui_CodeView(this)
			.action_{|codeView|

				QGui.editNode(this.name, 0, codeView.function);
				// qNode.initControlKeys;
				this.doAction;
				/*
				QGui.getNodeControlNames.do({|oneCnt|
				// qNode.qControls.do({|oneCnt|
				// key.postln;
				controls.put(oneCnt.key.asSymbol,
				QGui_Controler(
				parent:	objects[\timeline],
				bounds: Rect(5,5,400,50),
				nodeName: this.name,
				controlKey: oneCnt.key.asSymbol,
				quant: oneCnt.quant,
				fnc: oneCnt.fnc
				));
				});
				*/

				this.positionOfCotrolers;
				this.refreshCoor;
				QGui.refreshAll;
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
		/*
		qNode.qControls.do({|oneCnt|
		// key.postln;
		controls.put(oneCnt.key.asSymbol,
		QGui_Controler(
		parent:	objects[\timeline],
		bounds: Rect(5,5,400,50),
		nodeName: this.name,
		controlKey: oneCnt.key.asSymbol,
		quant: oneCnt.quant,
		fnc: oneCnt.fnc
		));
		});
		*/
		this.positionOfCotrolers;
		// objects[\nodeName].doAction;
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


	draw {
		(QGui.debbuging and: thisClassDebugging).if({ thisMethod.postln });

		Pen.width = 1;
		Pen.strokeColor = Color.new255(120,120,120);
		Pen.line(0@0, this.bounds.width@0);
		Pen.line(0@this.bounds.height, this.bounds.width@this.bounds.height);
		Pen.stroke;
	}
}