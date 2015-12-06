QGui_Canvan2 : UserView {
	classvar >thisClassDebugging = false;

	var mouseClickDown;

	var screen;
	var menuHead, menuIcons;
	var <menuStages, <menuNodes;
	var edges;
	var objects;

	*new { | screen, bounds |
		// var me = super.new(parent, this.sizeHint );
		// var me = super.newCustom(["", bounds ?? {this.sizeHint}, true, false] );
		// var screezn
		var me = super.new( screen,  bounds ?? {this.sizeHint} );
		me.canFocus = true;
		me.init(screen, bounds);
		me.front;
		^me;
	}

	init { |argParent, argBounds|
		(QGui.debbuging and: thisClassDebugging).if({
			"\n% [%]".format(thisMethod, argBounds).postln;
		});

		screen = argParent;
		// screen.background_(Color.clear).front;
		// .acceptsClickThrough_(true)
		this.bounds = argBounds;
		this.alpha = 0.9;
		this.alwaysOnTop_(true);
		this.background = Color.gray;

		objects = Dictionary.new();
		edges = Dictionary.new();

		menuHead = UserView(this)
		.name_("MenuHead")
		.addAction({|view, x, y, modifiers| this.moveCanvan(x, y) }, \mouseMoveAction)
		.addAction({|view, x, y, buttNum| mouseClickDown = x@y }, \mouseDownAction)
		.background_(Color.new255(20,20,20));

		menuIcons = UserView(this).name_("header2")
		.background_(Color.new255(20,20,20));

		// menuMap =
		// menuStages = QGui_PanelStages(this).name_("panelStages");
		// menuNodes = QGui_PanelNodes(this).name_("panelNodes");

		this.initControls;

		this.action = {
			// edges.doAction;
			this.resizeCanvan;
		};

		this.onResize_{
			"canvanResize".warn;
			this.resizeCanvan;
			edges.doAction;
		};

		this.onMove_{
			"canvanMove".warn;
			this.getProperty( \geometry ).postln;
			edges.doAction;
		};

		this.onClose_{
			"canvanClose".warn;
			screen.close;
		};

		this.doAction;
		edges.fitManipulators;
		// this.refresh;
		// this.drawFunc = { this.draw };
	}

	moveCanvan {|x, y|
		var screenPoint = this.mapToGlobal(x@y);
		var canvanOrigin = (screenPoint.x - mouseClickDown.x)@(screenPoint.y - mouseClickDown.y);
		(canvanOrigin.x < 0).if({ canvanOrigin.x = 0 });
		(canvanOrigin.y < 0).if({ canvanOrigin.y = 0 });
		// "[x:%, y:%]".format(screenPoint.x, screenPoint.y).postln;
		// "[originX:%, originY:%]".format(canvanOrigin.x, canvanOrigin.y).postln;

		this.setProperty( \geometry, Rect(canvanOrigin.x, canvanOrigin.y, this.bounds.width, this.bounds.height));
	}

	resizeCanvan {
		menuHead.bounds_(Rect.offsetEdgeTop(this.bounds, 0,0,0,45));
		menuIcons.bounds_(Rect.offsetEdgeBottom(this.bounds, 0,0,0,45));


		objects[\Button_Exit].bounds_(Rect.offsetCornerRT(menuHead, 10,10,25,25));
		objects[\Button_Maximize].bounds_(Rect.offsetCornerRT(menuHead, 40,10,25,25));
		objects[\Button_Minimize].bounds_(Rect.offsetCornerRT(menuHead, 70,10,25,25));
		objects[\Logo].bounds_(Rect.offsetEdgeLeft(menuHead, 10, 10, 10, 200));

		objects[\Version].bounds_(Rect.offsetEdgeRight(menuIcons, 10,10,10, 200));
		objects[\Button_Map].bounds_(Rect.offsetCornerLB(menuIcons, 10,10,25,25));
		objects[\Button_Node].bounds_(Rect.offsetCornerLB(menuIcons, 40,10,25,25));
		objects[\Button_Time].bounds_(Rect.offsetCornerLB(menuIcons, 70,10,25,25));

	}



	initControls {

		edges = QGui_ViewEdge(this, screen, [\left, \top, \right, \bottom]);
		// (QGui.debbuging and: thisClassDebugging).if({ thisMethod.postln });

		// objects.put(\edgesControl, QGui_ViewEdge(this, screen, [\left, \top, \right, \bottom]));
		/*
		// EDGES ///////////////////////////////
		edges.put(\left, QGui_ViewEdge(this).edge_(\left).offset_(100)
		.name_("QGui_WinEdge_left")
		.mouseMoveAction_{ |view, x, y, modifiers|
		QGui.moveGUI(x, QGui.mouseClickDown.y);
		QGui.resizeGUI(x, y, \left);
		}
		.mouseDownAction_{ |view, x, y, buttNum| QGui.mouseDown(view, x, y, buttNum); }
		);
		edges.put(\top, QGui_ViewEdge(this).edge_(\top).offset_(200)
		.name_("QGui_WinEdge_top")
		.mouseMoveAction_{ |view, x, y, modifiers| QGui.resizeGUI(x, y, \top) }
		.mouseDownAction_{ |view, x, y, buttNum| QGui.mouseDown(view, x, y, buttNum); }
		);
		edges.put(\right, QGui_ViewEdge(this).edge_(\right).offset_(100)
		.name_("QGui_WinEdge_right")
		.mouseMoveAction_{ |view, x, y, modifiers| QGui.resizeGUI(x, y, \right) }
		.mouseDownAction_{ |view, x, y, buttNum| QGui.mouseDown(view, x, y, buttNum); }
		);
		edges.put(\bottom, QGui_ViewEdge(this).edge_(\bottom).offset_(200)
		.name_("QGui_WinEdge_bottom")
		.mouseMoveAction_{ |view, x, y, modifiers|
		QGui.moveGUI(QGui.mouseClickDown.x, y);
		QGui.resizeGUI(x, y, \bottom);
		}
		.mouseDownAction_{ |view, x, y, buttNum| QGui.mouseDown(view, x, y, buttNum); }
		);
		*/

		// WIN ///////////////////////////////
		objects.put(\Button_Exit, QGui_Button(menuHead)
			.name_("ButtonExit")
			.iconName("ButtonExitGUI")
			.colorFrame_(Color.clear)
			.action_{|button|
				// QGui.closeGUI;
				this.close;
			}
		);

		objects.put(\Button_Maximize, QGui_Button(menuHead)
			.name_("ButtonMaximize")
			.iconName("ButtonMaximizeGUI")
			.colorFrame_(Color.clear)
			.action_{|button|
				QGui.maximizeGUI;
				(button.value == 1).if({ button.value_(0); });
			}
		);
		objects.put(\Button_Minimize, QGui_Button(menuHead)
			.name_("ButtonMinimize")
			.iconName("ButtonMinimizeGUI")
			.colorFrame_(Color.clear)
			.action_{|button|
				QGui.minimizeGUI;
				(button.value == 1).if({ button.valueAction_(0); });
			}
		);

		// MAP ///////////////////////////////

		objects.put(\Button_Map, QGui_Button(menuIcons)
			.name_("ButtonMap")
			.iconName("IconMap2")
			.colorFrame_(Color.clear)
			.action_{|button|
				"\n>>>Button_Map pressed %".format(button.value).postln;
				(button.value == 1).if(
					{ QGui.setDisplayPanel(\panelStages, true)},
					{ QGui.setDisplayPanel(\panelStages, false)}
				);
				menuStages.refresh;
			}
		);
		objects.put(\Button_Node, QGui_Button(menuIcons)
			.name_("ButtonNode")
			.iconName("IconNode")
			.colorFrame_(Color.clear)
			.action_{|button|
				"\n>>>Button_Node pressed %".format(button.value).postln;
				(button.value == 1).if(
					// { menuNodes.visible_(true) },
					// { menuNodes.visible_(false) }
					{ QGui.setDisplayPanel(\panelNodes, true)},
					{ QGui.setDisplayPanel(\panelNodes, false)}
				)
			}
		);
		objects.put(\Button_Time, QGui_Button(menuIcons)
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
		objects.put(\Logo, StaticText(menuHead)
			.string_("QTools")
			.align_(\left)
			.font_(QGui.fonts[\Header])
			.stringColor_(Color.new255(20,180,240))
			// .palette_(QGui.qPalette);
		);

		objects.put(\Version, StaticText(menuIcons)
			.string_("version %".format(QGui.version))
			.align_(\right)
			.font_(QGui.fonts[\Small])
			.stringColor_(Color.new255(20,180,240))
			// .palette_(QGui.qPalette);
		);

	}

	recall{
		// (QGui.debbuging and: thisClassDebugging).if({ ("\nrecall\n" ++ thisMethod).postln });

		// menuStages.recall;
		// menuNodes.recall;
	}



	/*
	draw {
	(QGui.debbuging and: thisClassDebugging).if({ ("\nDRAW\n" ++ thisMethod).postln });

	this.background = Color.red;


	Pen.width = 1;
	// Pen.strokeColor = Color.new255(20,180,240);
	Pen.strokeColor = Color.white;
	Pen.addRect(Rect(0,0, this.bounds.width, this.bounds.height));
	Pen.stroke;

	menu.background_(Color.new255(20,20,20));
	menuIcons.background_(Color.new255(20,20,20));
	}
	*/
}