QGui_Canvan : UserView {

	var parent, frame;
	var menu, menu2, canvan;
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

		objects = Dictionary.new();
		edges = Dictionary.new();

		this.initControls;
		this.drawFunc = { this.draw };
		this.resizeCanvan;
	}

	initControls {

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

		objects.put(\Button_Exit, QGui_Button(menu)
			.name_("ButtonExit")
			.iconName("ButtonExitGUI")
			.mouseOverAction_{ |view, x, y| "MouseEnterAction % [%, %]".format(view, x, y).postln; }
			.action_{|button| QuantGUI.closeGUI; }
		);
		objects.put(\Button_Maximize, QGui_Button(menu)
			.name_("ButtonMaximize")
			.iconName("ButtonMaximizeGUI")
			.mouseOverAction_{ |view, x, y| "MouseEnterAction % [%, %]".format(view, x, y).postln; }
			.action_{|button| QuantGUI.maximizeGUI; }
		);
		objects.put(\Button_Minimize, QGui_Button(menu)
			.name_("ButtonMinimize")
			.iconName("ButtonMinimizeGUI")
			.mouseOverAction_{ |view, x, y| "MouseEnterAction % [%, %]".format(view, x, y).postln; }
			.action_{|button| QuantGUI.minimizeGUI; }
		);



		objects.put(\NameTest, StaticText(menu) //Rect((menu.bounds.left + 10),(menu.bounds.top + 10),100,25)
			.string_("QTools")
			.align_(\left)
			.font_(QuantGUI.fonts[\Header])
			.palette_(QuantGUI.qPalette);
		);

		objects.put(\Name, StaticText(menu2)
			.string_("version %".format(QuantGUI.version))
			.align_(\right)
			.font_(QuantGUI.fonts[\Small])
			.palette_(QuantGUI.qPalette);
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

		edges[\left].bounds_(Rect.offsetEdgeLeft(parent, 0,50,50,15));
		edges[\top].bounds_(Rect.offsetEdgeTop(parent, 0,50,50,15));
		edges[\right].bounds_(Rect.offsetEdgeRight(parent, 0,50,50,15));
		edges[\bottom].bounds_(Rect.offsetEdgeBottom(parent, 0,50,50,15));

		objects[\Button_Exit].bounds_(Rect.offsetCornerRT(menu, 10,10,25,25));
		objects[\Button_Maximize].bounds_(Rect.offsetCornerRT(menu, 40,10,25,25));
		objects[\Button_Minimize].bounds_(Rect.offsetCornerRT(menu, 70,10,25,25));

		objects[\NameTest].bounds_(Rect.offsetEdgeLeft(menu, 10, 10, 10, 200));
		objects[\Name].bounds_(Rect.offsetEdgeRight(menu2, 10,10,10, 200));

	}

}