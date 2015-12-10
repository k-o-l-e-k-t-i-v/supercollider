QGui_ViewControl : UserView {
	classvar >displayEdgesZone = false;
	classvar >displayMoveZone = false;

	var parent, limits;
	var edgeViews, moveView;
	var >offset, manipulatorsZone;
	var manipulatorMouseClick, screenMouseClick, manipulatorDrag, originalParentRect;
	var routine;

	*new { | parent,  selectorEdges = #[\left, \top, \right, \bottom] |
		var me = super.new(parent, this.sizeHint );
		me.canFocus = true;
		me.init(parent, selectorEdges);
		^me;
	}

	init { |argParent, selectorEdges|
		// "%.init".format(this.name).postln;

		manipulatorsZone = 10;
		manipulatorDrag = false;
		routine = Dictionary.new();
		edgeViews = Dictionary.new();

		parent = argParent;
		parent.isKindOf(TopView).if(
			{ limits = parent.findWindow },
			{ limits = parent.getParents[0]	}
		);
		parent.onMove = { this.doAction	};
		parent.onResize = {	this.doAction };

		this.name = "QGui_ViewEdges";
		this.acceptsMouse = false;
		this.action = {
			// var manipulatorsZone = 20;
			// "%.action".format(this.name).postln;
			this.bounds = Rect(0,0, parent.bounds.width, parent.bounds.height);
			this.fitManipulators;
			// moveView.bounds_(Rect.offsetRect(parent.bounds, manipulatorsZone , manipulatorsZone, manipulatorsZone, manipulatorsZone));
			moveView.bounds_(Rect.offsetEdgeTop(parent.bounds, manipulatorsZone , manipulatorsZone, manipulatorsZone, manipulatorsZone + 25));
		};

		moveView = UserView(parent).name_(\move);
		selectorEdges.do({|edgeName|
			case
			{ edgeName.asSymbol == \left }
			{ edgeViews.put(edgeName.asSymbol, UserView(limits).name_(\left).alpha_(0))}

			{ edgeName.asSymbol == \top }
			{ edgeViews.put(edgeName.asSymbol, UserView(limits).name_(\top).alpha_(0) )}

			{ edgeName.asSymbol == \right }
			{ edgeViews.put(edgeName.asSymbol, UserView(limits).name_(\right).alpha_(0) )}

			{ edgeName.asSymbol == \bottom }
			{ edgeViews.put(edgeName.asSymbol, UserView(limits).name_(\bottom).alpha_(0) )}
		});

		moveView.addAction({|man, x, y|
			// "\n%_ManipulatorEnter [%]".format(man.name, man.bounds).postln;

		}, \mouseEnterAction);
		moveView.addAction({|man, x, y|
			// "leaveManipulator %".format(man.name).postln;

		}, \mouseLeaveAction);
		moveView.addAction({|man, x, y, buttNum|
			// "mouseDownAction % [%,%]".format(man.name, x, y).postln;
			manipulatorMouseClick = x@y;
			screenMouseClick = QtGUI.cursorPosition;
			originalParentRect = parent.bounds;

		}, \mouseDownAction);
		moveView.addAction({|man, x, y, buttNum|
			// "\n%_ManipulatorEnter [%]".format(man.name, man.bounds).postln;
			var mouse = QtGUI.cursorPosition;

			// (direction.asSymbol == \horizontal).if({ newY = anchorPoint.y });
			// (direction.asSymbol == \vertical).if({ newX = anchorPoint.x });

			parent.isKindOf(TopView).if(
				{
					var canvan = parent.findWindow;
					canvan.setTopLeftBounds(
						Rect(
							originalParentRect.origin.x + mouse.x - manipulatorMouseClick.x - man.bounds.left ,
							originalParentRect.origin.y + mouse.y - manipulatorMouseClick.y - man.bounds.top,
							originalParentRect.width,
							originalParentRect.height
						),
						0)
				},
				{
					var newX = mouse.x - screenMouseClick.x;
					var newY = mouse.y - screenMouseClick.y;
					parent.bounds_(
						Rect(
							originalParentRect.origin.x + newX,
							originalParentRect.origin.y + newY,
							originalParentRect.width,
							originalParentRect.height
						)
					)
				}
			)
		}, \mouseMoveAction);

		edgeViews.do({|manipulator|
			manipulator.addAction({|man, x, y|
				// "\n%_ManipulatorEnter [%]".format(man.name, man.bounds).postln;
				this.manipulatorEnter(man);
			}, \mouseEnterAction);
			manipulator.addAction({|man, x, y|
				// "leaveManipulator %".format(man.name).postln;
				this.manipulatorLeave(man);
			}, \mouseLeaveAction);
			manipulator.addAction({|man, x, y, buttNum|
				// "mouseDownAction % [%,%]".format(man.name, x, y).postln;
				manipulatorMouseClick = x@y;
				screenMouseClick = QtGUI.cursorPosition;
				originalParentRect = parent.bounds;

				manipulatorDrag = true;
				routine[man.name.asSymbol].stop;
				man.alpha = 0;
				man.refresh;
				// ("manipulatorDrag" + manipulatorDrag).warn;
			}, \mouseDownAction);
			manipulator.addAction({|man, x, y, buttNum|
				// "mouseUpAction % [%,%]".format(man.name, x, y).postln;
				manipulatorDrag = false;
				routine[man.name.asSymbol].stop;
				man.alpha = 1;
				man.refresh;
				// ("manipulatorDrag" + manipulatorDrag).warn;
				this.doAction;
			}, \mouseUpAction);
			manipulator.addAction({|man, x, y, modifiers|
				// "\n%_Manipulator [%, %, %]".format(man.name, man.bounds, x, y).postln;
				var mouse = QtGUI.cursorPosition;

				case
				{man.name.asSymbol == \left}{
					parent.isKindOf(TopView).if(
						{
							var canvan = parent.findWindow;
							canvan.bounds_(
								Window.flipY(
									Rect(
										mouse.x - manipulatorMouseClick.x,
										screenMouseClick.y - manipulatorMouseClick.y,
										originalParentRect.width + screenMouseClick.x - mouse.x,
										originalParentRect.height
									)
								)
							);
						},
						{
							parent.moveTo(man.bounds.left - manipulatorMouseClick.x + x, parent.bounds.top);
							parent.resizeTo(originalParentRect.width - x + manipulatorMouseClick.x, originalParentRect.height);
						}
					);
				}
				{man.name.asSymbol == \top}{
					parent.isKindOf(TopView).if(
						{
							var canvan = parent.findWindow;
							canvan.bounds_(
								Window.flipY(
									Rect(
										screenMouseClick.x - manipulatorMouseClick.x,
										mouse.y - manipulatorMouseClick.y,
										originalParentRect.width,
										originalParentRect.height + screenMouseClick.y - mouse.y
									)
								)
							)
						},
						{
							parent.moveTo(originalParentRect.left,man.bounds.top - manipulatorMouseClick.y + y);
							parent.resizeTo(originalParentRect.width, originalParentRect.height - y + manipulatorMouseClick.y );
						}
					);

				}
				{man.name.asSymbol == \right}{
					// "mouseMoveAction % [%,%]".format(man.name, x, y).postln;
					parent.resizeTo(originalParentRect.width + x - manipulatorMouseClick.x, originalParentRect.height)
				}
				{man.name.asSymbol == \bottom}{
					// "mouseMoveAction % [%,%]".format(man.name, x, y).postln;
					parent.resizeTo(originalParentRect.width, man.bounds.bottom - originalParentRect.top - manipulatorMouseClick.y + y)
				}
			}, \mouseMoveAction);
		});

		this.drawFunc = {
			displayMoveZone.if({ moveView.background = Color.new255(60,160,60,160) });
			// parent.background = Color.blue;
			offset = 2;
			edgeViews.do({|view|
				view.drawFunc = {
					displayEdgesZone.if({ view.background = Color.new255(160,60,60,160) });
					Pen.width = 2;
					Pen.strokeColor = Color.new255(20,180,240,view.alpha*255);
					case
					{ view.name.asSymbol == \left }
					{Pen.line(2@offset, 2@(view.bounds.height-offset)) }

					{ view.name.asSymbol == \top }
					{ Pen.line(offset@2, (view.bounds.width-offset)@2) }

					{ view.name.asSymbol == \right }
					{Pen.line((view.bounds.width-2)@offset, (view.bounds.width-2)@(view.bounds.height-offset)) }

					{ view.name.asSymbol == \bottom }
					{Pen.line(offset@(view.bounds.height-2), (view.bounds.width-offset)@(view.bounds.height-2)) };
					Pen.stroke;
				};
			});
		};
	}

	fitManipulators {
		// var manipulatorsZone = 20;
		manipulatorDrag.not.if({
			// "%.fitManipulators".format(this.name).postln;

			edgeViews.do({|manipulator|
				case
				{ manipulator.name.asSymbol == \left }{
					manipulator.bounds_(
						Rect.offsetEdgeLeft(
							limits.bounds,
							parent.bounds.left,
							parent.bounds.top,
							limits.bounds.height - parent.bounds.bottom,
							manipulatorsZone)
					)
				}
				{ manipulator.name.asSymbol == \top }{
					manipulator.bounds_(
						Rect.offsetEdgeTop(
							limits.bounds,
							parent.bounds.top,
							parent.bounds.left,
							limits.bounds.width - parent.bounds.right,
							manipulatorsZone)
					)
				}
				{ manipulator.name.asSymbol == \right }{
					manipulator.bounds_(
						Rect.offsetEdgeRight(
							limits.bounds,
							limits.bounds.width - parent.bounds.right,
							parent.bounds.top,
							limits.bounds.height - parent.bounds.bottom,
							manipulatorsZone)
					)
				}
				{ manipulator.name.asSymbol == \bottom }{
					manipulator.bounds_(
						Rect.offsetEdgeBottom(
							limits.bounds,
							limits.bounds.height - parent.bounds.bottom,
							parent.bounds.left,
							limits.bounds.width - parent.bounds.right,
							manipulatorsZone)
					)
				}
			});
		});
	}

	manipulatorEnter {|man|
		var time = 0.45;
		var frames = 30;
		routine[man.name.asSymbol].stop;
		routine.put(man.name.asSymbol, Routine({
			frames.do({|i|
				man.alpha = (i+1)/frames;
				man.refresh;
				(time/frames).wait;
			});
		}));
		routine[man.name.asSymbol].play(AppClock);
	}

	manipulatorLeave {|man|
		var time = 0.15;
		var frames = 15;
		routine[man.name.asSymbol].stop;
		routine.put(man.name.asSymbol, Routine({
			frames.do({|i|
				man.alpha = (frames -(i+1))/frames;
				man.refresh;
				(time/frames).wait;
			});
		}));
		routine[man.name.asSymbol].play(AppClock);
	}


}