QGui_Canvan : UserView {
	classvar >thisClassDebugging = false;

	var parent, bounds;
	var menu, menu2, canvan;
	var <menuStages, <menuNodes;
	var edges;
	var objects;

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
		edges = Dictionary.new();

		menu = UserView(parent)
		.name_("HeaderMenu")
		.mouseMoveAction_{ |view, x, y, modifiers| QGui.moveGUI(x, y) }
		.mouseDownAction_{ |view, x, y, buttNum| QGui.mouseDown(view, x, y, buttNum); };

		menu2 = UserView(parent).name_("header2");
		canvan = ScrollView(parent).autohidesScrollers_(true).palette_(QGui.qPalette);

		menuStages = QGui_PanelStages(parent).name_("panelStages");
		menuNodes = QGui_PanelNodes(parent).name_("panelNodes");
		// menuTimeline =


		this.initControls;
		this.drawFunc = { this.draw };
	}

	initControls {
		(QGui.debbuging and: thisClassDebugging).if({ thisMethod.postln });

		// EDGES ///////////////////////////////
		edges.put(\left, QGui_ViewEdge(parent).edge_(\left).offset_(100)
			.name_("QGui_WinEdge_left")
			.mouseMoveAction_{ |view, x, y, modifiers|
					QGui.moveGUI(x, QGui.mouseClickDown.y);
					QGui.resizeGUI(x, y, \left);
			}
			.mouseDownAction_{ |view, x, y, buttNum| QGui.mouseDown(view, x, y, buttNum); }
		);
		edges.put(\top, QGui_ViewEdge(parent).edge_(\top).offset_(200)
			.name_("QGui_WinEdge_top")
			.mouseMoveAction_{ |view, x, y, modifiers| QGui.resizeGUI(x, y, \top) }
			.mouseDownAction_{ |view, x, y, buttNum| QGui.mouseDown(view, x, y, buttNum); }
		);
		edges.put(\right, QGui_ViewEdge(parent).edge_(\right).offset_(100)
			.name_("QGui_WinEdge_right")
			.mouseMoveAction_{ |view, x, y, modifiers| QGui.resizeGUI(x, y, \right) }
			.mouseDownAction_{ |view, x, y, buttNum| QGui.mouseDown(view, x, y, buttNum); }
		);
		edges.put(\bottom, QGui_ViewEdge(parent).edge_(\bottom).offset_(200)
			.name_("QGui_WinEdge_bottom")
			.mouseMoveAction_{ |view, x, y, modifiers|
				QGui.moveGUI(QGui.mouseClickDown.x, y);
				QGui.resizeGUI(x, y, \bottom);
			}
			.mouseDownAction_{ |view, x, y, buttNum| QGui.mouseDown(view, x, y, buttNum); }
		);

		// WIN ///////////////////////////////
		objects.put(\Button_Exit, QGui_Button(menu)
			.name_("ButtonExit")
			.iconName("ButtonExitGUI")
			.colorFrame_(Color.clear)
			.action_{|button| QGui.closeGUI; }
		);

		objects.put(\Button_Maximize, QGui_Button(menu)
			.name_("ButtonMaximize")
			.iconName("ButtonMaximizeGUI")
			.colorFrame_(Color.clear)
			.action_{|button|
				QGui.maximizeGUI;
				(button.value == 1).if({ button.value_(0); });
			}
		);
		objects.put(\Button_Minimize, QGui_Button(menu)
			.name_("ButtonMinimize")
			.iconName("ButtonMinimizeGUI")
			.colorFrame_(Color.clear)
			.action_{|button|
				QGui.minimizeGUI;
				(button.value == 1).if({ button.valueAction_(0); });
			}
		);

		// MAP ///////////////////////////////

		objects.put(\Button_Map, QGui_Button(menu2)
			.name_("ButtonMap")
			.iconName("IconMap2")
			.colorFrame_(Color.clear)
			.action_{|button|
				"\nMapPressed %".format(button.value).postln;
				(button.value == 1).if(
					{ menuStages.visible_(true)	},
					{ menuStages.visible_(false) }
				);
				menuStages.refresh;
			}
		);
		objects.put(\Button_Node, QGui_Button(menu2)
			.name_("ButtonNode")
			.iconName("IconNode")
			.colorFrame_(Color.clear)
			.action_{|button|
				"\nNodePressed %".format(button.value).postln;
				(button.value == 1).if(
					{ menuNodes.visible_(true)	},
					{ menuNodes.visible_(false) }
				)
			}
		);
		objects.put(\Button_Time, QGui_Button(menu2)
			.name_("ButtonTime")
			.iconName("IconTime")
			.colorFrame_(Color.clear)
			.action_{|button|
				"\nTimePressed %".format(button.value).postln;
				(button.value == 1).if(
					{
						// menuStages.recall;
						// menuStages.visible_(true);
					},
					// { menuStages.visible_(false) }
				)
			}
		);

		// REST ///////////////////////////////
		objects.put(\Logo, StaticText(menu)
			.string_("QTools")
			.align_(\left)
			.font_(QGui.fonts[\Header])
			.stringColor_(Color.new255(20,180,240))
			// .palette_(QGui.qPalette);
		);

		objects.put(\Version, StaticText(menu2)
			.string_("version %".format(QGui.version))
			.align_(\right)
			.font_(QGui.fonts[\Small])
			.stringColor_(Color.new255(20,180,240))
			// .palette_(QGui.qPalette);
		);
	}

	recall{
		(QGui.debbuging and: thisClassDebugging).if({ ("\nrecall\n" ++ thisMethod).postln });

		menu.bounds_(Rect.offsetEdgeTop(parent, 0,0,0,45));
		menu2.bounds_(Rect.offsetEdgeBottom(parent, 0,0,0,45));

		canvan.bounds_(
			Rect.offsetEdgeTop(parent, 45,0,0, parent.view.bounds.height - menu.bounds.height - menu2.bounds.height)
		);

		edges[\left].bounds_(Rect.offsetEdgeLeft(parent, 0,50,50,15));
		edges[\top].bounds_(Rect.offsetEdgeTop(parent, 0,50,50,15));
		edges[\right].bounds_(Rect.offsetEdgeRight(parent, 0,50,50,15));
		edges[\bottom].bounds_(Rect.offsetEdgeBottom(parent, 0,50,50,15));

		objects[\Button_Exit].bounds_(Rect.offsetCornerRT(menu, 10,10,25,25));
		objects[\Button_Maximize].bounds_(Rect.offsetCornerRT(menu, 40,10,25,25));
		objects[\Button_Minimize].bounds_(Rect.offsetCornerRT(menu, 70,10,25,25));

		objects[\Logo].bounds_(Rect.offsetEdgeLeft(menu, 10, 10, 10, 200));
		objects[\Version].bounds_(Rect.offsetEdgeRight(menu2, 10,10,10, 200));

		objects[\Button_Map].bounds_(Rect.offsetCornerLB(menu2, 10,10,25,25));
		objects[\Button_Node].bounds_(Rect.offsetCornerLB(menu2, 40,10,25,25));
		objects[\Button_Time].bounds_(Rect.offsetCornerLB(menu2, 70,10,25,25));

		menuStages.recall;
		menuNodes.recall;
	}

	draw {
		(QGui.debbuging and: thisClassDebugging).if({ ("\nDRAW\n" ++ thisMethod).postln });

		menu.background_(Color.new255(20,20,20));
		menu2.background_(Color.new255(20,20,20));

		Pen.width = 1;
		Pen.strokeColor = Color.new255(20,180,240);
		Pen.addRect(Rect(0,0, this.bounds.width, this.bounds.height));
		Pen.stroke;
	}
}