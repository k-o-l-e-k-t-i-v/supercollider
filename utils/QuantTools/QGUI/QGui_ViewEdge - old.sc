QGui_ViewEdge : UserView {


	// var screen;
	var parent, limits;
	var edgeViews;
	var >offset;
	var manipulatorMouseClick, manipulatorDrag, originalParentRect;
	var routine;


	*new { | parent, limitsView , selectorEdges |
		var me = super.new(parent, this.sizeHint );
		me.canFocus = true;
		me.init(parent, limitsView, selectorEdges);
		^me;
	}

	init { |argParent, limitsView, selectorEdges|
		parent = argParent;
		limits = limitsView;

		this.name = "QGui_ViewEdges";
		"%.init".format(this.name).postln;

		manipulatorDrag = false;
		routine = Dictionary.new();

		this.acceptsMouse = false;

		this.addAction({|view, x, y|
			"\n%.Enter [%]".format(this.name,this.bounds).postln;
		}, \mouseEnterAction);
		this.addAction({|view, x, y|
			"%.Leave".format(this.name).postln;
		}, \mouseLeaveAction);

		this.action = {
			"%.action".format(this.name).postln;
			this.bounds = Rect(0,0, parent.bounds.width, parent.bounds.height);
			this.fitManipulators;
			this.refresh;
		};
		this.onResize = {
			"%.onResize".format(this.name).postln;

			this.bounds = Rect(0,0, parent.bounds.width, parent.bounds.height);
			this.fitManipulators;
		};
		this.onMove = {
			"%.onMove".format(this.name).postln;
			this.fitManipulators
		};

		parent.onResize = {
			"parent.onResize".postln;
			this.bounds = Rect(0,0, parent.bounds.width, parent.bounds.height);
			this.fitManipulators;
		};

		edgeViews = Dictionary.new();

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

		edgeViews.do({|manipulator|
			manipulator.addAction({|man, x, y|
				"\n%_ManipulatorEnter [%]".format(man.name, man.bounds).postln;
				this.manipulatorEnter(man);
			}, \mouseEnterAction);
			manipulator.addAction({|man, x, y|
				"leaveManipulator %".format(man.name).postln;
				this.manipulatorLeave(man);
			}, \mouseLeaveAction);
			manipulator.addAction({|man, x, y, buttNum|
				"mouseDownAction % [%,%]".format(man.name, x, y).postln;
				manipulatorMouseClick = x@y;
				originalParentRect = parent.bounds;
				manipulatorDrag = true;
				routine[man.name.asSymbol].stop;
				man.alpha = 0;
				man.refresh;
				("manipulatorDrag" + manipulatorDrag).warn;
			}, \mouseDownAction);
			manipulator.addAction({|man, x, y, buttNum|
				"mouseUpAction % [%,%]".format(man.name, x, y).postln;
				manipulatorDrag = false;
				man.alpha = 1;
				man.refresh;
				("manipulatorDrag" + manipulatorDrag).warn;
				this.doAction;
			}, \mouseUpAction);
			manipulator.addAction({|man, x, y, modifiers|
				// "\n%_Manipulator [%, %, %]".format(man.name, man.bounds, x, y).postln;
				case
				{man.name.asSymbol == \left}{
					parent.moveTo(man.bounds.left + manipulatorMouseClick.x + x, parent.bounds.top);
					parent.resizeTo(originalParentRect.width - x + manipulatorMouseClick.x, originalParentRect.height)
				}
				{man.name.asSymbol == \top}{
					parent.moveTo(originalParentRect.left,man.bounds.top + manipulatorMouseClick.y + y);
					parent.resizeTo(originalParentRect.width, originalParentRect.height - y + manipulatorMouseClick.y )
				}
				{man.name.asSymbol == \right}{
					// "mouseMoveAction % [%,%]".format(man.name, x, y).postln;
					parent.resizeTo(originalParentRect.width + x , originalParentRect.height)
				}
				{man.name.asSymbol == \bottom}{
					// "mouseMoveAction % [%,%]".format(man.name, x, y).postln;
					parent.resizeTo(originalParentRect.width, man.bounds.bottom - originalParentRect.top - manipulatorMouseClick.y + y)
				}
			}, \mouseMoveAction);
		});

		this.drawFunc = {
			offset = 2;
			edgeViews.do({|view|
				view.drawFunc = {
					view.background = Color.new255(60,60,60,160);
					Pen.width = 2;
					Pen.strokeColor = Color.new255(20,180,240,view.alpha*255);
					case
					{ view.name.asSymbol == \left } {Pen.line((view.bounds.width-2)@offset, (view.bounds.width-2)@(view.bounds.height-offset)) }
					{ view.name.asSymbol == \top } {Pen.line(offset@(view.bounds.height-2), (view.bounds.width-offset)@(view.bounds.height-2)) }
					{ view.name.asSymbol == \right } {Pen.line(2@offset, 2@(view.bounds.height-offset)) }
					{ view.name.asSymbol == \bottom } { Pen.line(offset@2, (view.bounds.width-offset)@2) };
					Pen.stroke;
				};
			});

			limits.drawFunc = {
				Pen.width = 5;
				Pen.strokeColor = Color.red;
				Pen.addRect(Rect(0,0,limits.bounds.width,limits.bounds.height));
				Pen.stroke;
			};
		};
	}

	fitManipulators {
		var manipulatorsZone = 10;
		manipulatorDrag.not.if({
			"%.fitManipulators".format(this.name).postln;
			edgeViews.do({|manipulator|
				case
				{ manipulator.name.asSymbol == \left }{
					manipulator.bounds_(
						Rect.offsetEdgeLeft(
							limits.bounds,
							parent.bounds.left-manipulatorsZone,
							parent.bounds.top,
							limits.bounds.height - parent.bounds.bottom,
							manipulatorsZone)
					)
				}
				{ manipulator.name.asSymbol == \top }{
					manipulator.bounds_(
						Rect.offsetEdgeTop(
							limits.bounds,
							parent.bounds.top-manipulatorsZone,
							parent.bounds.left,
							limits.bounds.width - parent.bounds.right,
							manipulatorsZone)
					)
				}
				{ manipulator.name.asSymbol == \right }{
					manipulator.bounds_(
						Rect.offsetEdgeRight(
							limits.bounds,
							limits.bounds.width - parent.bounds.right-manipulatorsZone,
							parent.bounds.top,
							limits.bounds.height - parent.bounds.bottom,
							manipulatorsZone)
					)
				}
				{ manipulator.name.asSymbol == \bottom }{
					manipulator.bounds_(
						Rect.offsetEdgeBottom(
							limits.bounds,
							limits.bounds.height - parent.bounds.bottom-manipulatorsZone,
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