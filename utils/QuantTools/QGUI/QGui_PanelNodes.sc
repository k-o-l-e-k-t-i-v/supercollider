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

		yPositionNodeStart = 25;
		ySizeNode = 200;

		this.initControl;
		this.drawFunc = { this.draw };
	}

	initControl {
		(QGui.debbuging and: thisClassDebugging).if({ thisMethod.postln });

		objects.put(\ButtonAddNode, QGui_Button.new(this)
			.string_("Add")
			.colorFrame_(Color.new255(120,120,120))
			.keepingState_(false)
			.action_{|button| QGui.addNode(\node) };
		);

		QGui.getNodes(QGui.currentStage).do({|nodeName, i|
			this.addNode(nodeName);
		});

	}

	addNode {|name|
		(QGui.debbuging and: thisClassDebugging).if({ "% [%]".format(thisMethod, name).postln });

		QGui.getNodes(QGui.currentStage).postln;
		nodes.put(name.asSymbol, QGui_Node(this, nodeName:name.asSymbol));
		// "addNodes nodes: %".format(nodes).postln;
		this.positionOfNodes;
	}

	removeNode {|name|
		(QGui.debbuging and: thisClassDebugging).if({ "% [%]".format(thisMethod, name).postln });

		nodes.at(name.asSymbol).remove;
		nodes.removeAt(name.asSymbol);

		// "removeNodes nodes: %".format(nodes).postln;
		this.positionOfNodes;
	}

	renameNode {|oldName, newName|

		nodes.put(newName.asSymbol,nodes.at(oldName.asSymbol));
		nodes.removeAt(oldName.asSymbol);

		// "renameNode nodes: %".format(nodes).postln;

		this.positionOfNodes;
		this.refresh;
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

		this.bounds_(Rect.offsetEdgeRight(parent, 10,50,50, parent.bounds.width - 325));
		objects[\ButtonAddNode].bounds_(Rect.offsetEdgeTop(this.bounds, 5,5,5,15));

		this.positionOfNodes;

		nodes.do({|oneNode| oneNode.recall });
	}

	draw {
		(QGui.debbuging and: thisClassDebugging).if({ thisMethod.postln });
		this.background_(Color.new255(30,30,30));
		Pen.width = 1;
		Pen.strokeColor = Color.new255(20,20,20);
		Pen.addRect(Rect(0,0, this.bounds.width, this.bounds.height));
		Pen.stroke;
		// })
	}

}