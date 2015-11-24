QGui_PanelNodes : UserView {
	classvar >thisClassDebugging = false;

	var parent, bounds;
	var objects, nodes;

	var yPositionNode, yPositionNodeStart, ySizeNode;

	*new { | parent, bounds |
		var me = super.new(parent, bounds ?? {this.sizeHint} );
		me.canFocus = true;
		me.init(parent, bounds);
		^me;
	}

	init { |argParent, argBounds|
		(QGui.debbuging and: thisClassDebugging).if({
			"\n% [%, %]".format(thisMethod, argParent, argBounds).postln;
		});

		parent = argParent;
		bounds = argBounds;

		objects = Dictionary.new();
		nodes = Dictionary.new();

		this.visible = false;

		yPositionNodeStart = 30;
		ySizeNode = 200;

		"nodes : %".format(QGui.getNodes(QuantMap.stageCurrent)).postln;

		this.initControl;
		this.drawFunc = { this.draw };
	}

	initControl {
		(QGui.debbuging and: thisClassDebugging).if({ thisMethod.postln });

		objects.put(\ButtonAddNode, Button.new(this)
			.string_("Add")
			.palette_(QGui.qPalette)
			.action_{|button|
				QGui.addNode(\newNode);
				// QGui.addStage;
				// objects[\MapText].string_(QGui.getMapText);
			};
		);

		QGui.getNodes(QGui.currentStage).do({|nodeName, i|
			this.addNode(nodeName);
		});

		/*
		objects.put(\timeline, ScrollView(parent, Rect.newSides((frame.left + 405),(frame.top + 5), (frame.right - 5), (frame.bottom - 5)))
		.autohidesScrollers_(true)
		.palette_(QGui.qPalette)
		);

		objects.put(\cnt1, QGui_Controler(objects[\timeline], Rect(5,5,400,40)).setKey("amp"));
		objects.put(\cnt2, QGui_Controler(objects[\timeline], Rect(5,50,400,40)).setKey("freq"));
		*/
	}

	addNode {|name|
		(QGui.debbuging and: thisClassDebugging).if({ "% [%]".format(thisMethod, name).postln });

		nodes.put(name.asSymbol, QGui_Node(this, nodeName:name.asSymbol));
		this.positionOfNodes;
	}

	positionOfNodes {
		(QGui.debbuging and: thisClassDebugging).if({ thisMethod.postln });
		nodes.do({|oneNode, i|
			yPositionNode = ((ySizeNode + 5)*i ) + yPositionNodeStart;
			oneNode.moveTo(yPositionNode);
		});
	}

	recall{
		(QGui.debbuging and: thisClassDebugging).if({ thisMethod.postln });

		this.bounds_(Rect.offsetEdgeLeft(parent, 315,50,50,300));
		objects[\ButtonAddNode].bounds_(Rect.offsetEdgeTop(this.bounds, 5,10,10,15));

		nodes.do({|oneNode| oneNode.recall });
	}

	draw {
		(QGui.debbuging and: thisClassDebugging).if({ thisMethod.postln });
		// visible.if({
		Pen.width = 1;
		Pen.strokeColor = Color.new255(20,20,20);
		Pen.addRect(Rect(0,0, this.bounds.width, this.bounds.height));
		Pen.stroke;
		// })
	}

}