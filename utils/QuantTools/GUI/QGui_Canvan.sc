QGui_Canvan : UserView {

	var parent, frame;
	var menu, menu2, canvan, menuMap;
	var edges;
	var objects;

	*new { | parent, bounds |
		var me = super.new(parent, bounds ?? {this.sizeHint} );
		me.canFocus = true;
		me.init(parent, bounds);
		^me;
	}

	init { |argParent, argBounds|
		"INIT Canvan".postln;
		parent = argParent;
		frame = argBounds;

		menu = UserView(parent)
		.name_("HeaderMenu")
		.mouseMoveAction_{ |view, x, y, modifiers| QuantGUI.moveGUI(x, y) }
		.mouseDownAction_{ |view, x, y, buttNum| QuantGUI.mouseDown(view, x, y, buttNum); };

		menu2 = UserView(parent).name_("header2");

		canvan = ScrollView(parent).autohidesScrollers_(true).palette_(QuantGUI.qPalette);

		menuMap = ScrollView(parent)
		.autohidesScrollers_(true)
		.palette_(QuantGUI.qPalette)
		.visible_(false);

		objects = Dictionary.new();
		edges = Dictionary.new();

		this.initControls;
		this.drawFunc = { this.draw };
		this.resizeCanvan;
	}

	initControls {

		// EDGES ///////////////////////////////
		edges.put(\left, QGui_ViewEdge(parent).edge_(\left).offset_(100)
			.name_("QGui_WinEdge_left")
			.mouseMoveAction_{ |view, x, y, modifiers|
				QuantGUI.moveGUI(x, QuantGUI.mouseClickDown.y);
				QuantGUI.resizeGUI(x, y, \left);
			}
			.mouseDownAction_{ |view, x, y, buttNum| QuantGUI.mouseDown(view, x, y, buttNum); }
		);
		edges.put(\top, QGui_ViewEdge(parent).edge_(\top).offset_(200)
			.name_("QGui_WinEdge_top")
			.mouseMoveAction_{ |view, x, y, modifiers| QuantGUI.resizeGUI(x, y, \top) }
			.mouseDownAction_{ |view, x, y, buttNum| QuantGUI.mouseDown(view, x, y, buttNum); }
		);
		edges.put(\right, QGui_ViewEdge(parent).edge_(\right).offset_(100)
			.name_("QGui_WinEdge_right")
			.mouseMoveAction_{ |view, x, y, modifiers| QuantGUI.resizeGUI(x, y, \right) }
			.mouseDownAction_{ |view, x, y, buttNum| QuantGUI.mouseDown(view, x, y, buttNum); }
		);
		edges.put(\bottom, QGui_ViewEdge(parent).edge_(\bottom).offset_(200)
			.name_("QGui_WinEdge_bottom")
			.mouseMoveAction_{ |view, x, y, modifiers|
				QuantGUI.moveGUI(QuantGUI.mouseClickDown.x, y);
				QuantGUI.resizeGUI(x, y, \bottom);
			}
			.mouseDownAction_{ |view, x, y, buttNum| QuantGUI.mouseDown(view, x, y, buttNum); }
		);

		// WIN ///////////////////////////////
		objects.put(\Button_Exit, QGui_Button(menu)
			.name_("ButtonExit")
			.iconName("ButtonExitGUI")
			.action_{|button| QuantGUI.closeGUI; }
		);
		objects.put(\Button_Maximize, QGui_Button(menu)
			.name_("ButtonMaximize")
			.iconName("ButtonMaximizeGUI")
			.action_{|button|
				QuantGUI.maximizeGUI;
				(button.value == 1).if({ button.value_(0); });
			}
		);
		objects.put(\Button_Minimize, QGui_Button(menu)
			.name_("ButtonMinimize")
			.iconName("ButtonMinimizeGUI")
			.action_{|button|
				QuantGUI.minimizeGUI;
				(button.value == 1).if({ button.valueAction_(0); });
			}
		);

		// MAP ///////////////////////////////
		objects.put(\Button_Map, QGui_Button(menu2)
			.name_("ButtonMap")
			.iconName("IconMap2")
			.action_{|button|
				"MapPressed %".format(button.value).postln;
				(button.value == 1).if(
					{
						objects[\MapText].string_(QuantGUI.getMapText);
						menuMap.visible_(true)
					},
					{ menuMap.visible_(false) }
				)
			}
		);
		objects.put(\MapText, StaticText(menuMap)
			// .string_("map")
			.align_(\topLeft)
			.font_(QuantGUI.fonts[\Small])
			.palette_(QuantGUI.qPalette)
		);

		objects.put(\ButtonAddStage, Button.new(menuMap)
			.string_("Add")
			.action_{|button|
				QuantGUI.addStage;
				objects[\MapText].string_(QuantGUI.getMapText);

			};
		);
		objects.put(\ButtonRemoveStage, Button.new(menuMap)
			.string_("Remove")
			.action_{|button|
				QuantGUI.removeStage;
				objects[\MapText].string_(QuantGUI.getMapText);

			};
		);


		// REST ///////////////////////////////
		objects.put(\Logo, StaticText(menu)
			.string_("QTools")
			.align_(\left)
			.font_(QuantGUI.fonts[\Header])
			.stringColor_(Color.new255(20,180,240))
			// .palette_(QuantGUI.qPalette);
		);

		objects.put(\Version, StaticText(menu2)
			.string_("version %".format(QuantGUI.version))
			.align_(\right)
			.font_(QuantGUI.fonts[\Small])
			.stringColor_(Color.new255(20,180,240))
			// .palette_(QuantGUI.qPalette);
		);



		/*
		objects.put(\testNode, QGui_Node(canvan, Rect(10,10,(canvan.bounds.width-30), 200))
		.name("testNode")
		);

		objects.put(\testNode2, QGui_Node(canvan, Rect(10,215,(canvan.bounds.width-30), 200))
		.name("testNode2")
		);
		*/


		// Button.new(canvan, Rect(20,1400,80,30)).string_("ahoj2");

	}

	draw {
		menu.background_(Color.new255(20,20,20));
		menu2.background_(Color.new255(20,20,20));

		Pen.width = 1;
		Pen.strokeColor = Color.new255(20,180,240);
		Pen.addRect(Rect(0,0, frame.width, frame.height));
		Pen.stroke;
	}

	// (5) define typical widget methods  (only those you need or adjust as needed)
	valueAction_{ |val| // most widgets have this
		this.value = val;
		this.doAction;
	}
	value_{ |val|       // in many widgets, you can change the
		// value and refresh the view , but not do the action.
		// value = val;
		this.refresh;
	}

	resizeCanvan{
		// "ResizeCanvan".postln;
		menu.bounds_(Rect.offsetEdgeTop(parent, 0,0,0,45));
		menu2.bounds_(Rect.offsetEdgeBottom(parent, 0,0,0,45));
		canvan.bounds_(Rect.offsetEdgeTop(parent, 45,0,0, parent.view.bounds.height - menu.bounds.height - menu2.bounds.height));
		menuMap.bounds_(Rect.offsetEdgeLeft(parent, 5,235,50,300));


		edges[\left].bounds_(Rect.offsetEdgeLeft(parent, 0,50,50,15));
		edges[\top].bounds_(Rect.offsetEdgeTop(parent, 0,50,50,15));
		edges[\right].bounds_(Rect.offsetEdgeRight(parent, 0,50,50,15));
		edges[\bottom].bounds_(Rect.offsetEdgeBottom(parent, 0,50,50,15));

		objects[\Button_Exit].bounds_(Rect.offsetCornerRT(menu, 10,10,25,25));
		objects[\Button_Maximize].bounds_(Rect.offsetCornerRT(menu, 40,10,25,25));
		objects[\Button_Minimize].bounds_(Rect.offsetCornerRT(menu, 70,10,25,25));

		objects[\Button_Map].bounds_(Rect.offsetCornerLB(menu2, 10,10,25,25));
		objects[\ButtonAddStage].bounds_(Rect.offsetCornerLT(menuMap, 20,10,45,15));
		objects[\ButtonRemoveStage].bounds_(Rect.offsetCornerLT(menuMap, 70,10,45,15));
		objects[\MapText].bounds_(Rect.offsetCornerLT(menuMap, 20,40,270,800));

		objects[\Logo].bounds_(Rect.offsetEdgeLeft(menu, 10, 10, 10, 200));
		objects[\Version].bounds_(Rect.offsetEdgeRight(menu2, 10,10,10, 200));

	}

}