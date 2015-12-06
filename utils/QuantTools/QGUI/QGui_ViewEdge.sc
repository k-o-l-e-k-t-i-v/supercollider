QGui_ViewEdge : UserView {



	var parent, limits;
	var edgeViews;
	var >name, >offset;
	var manipulatorMouseClick, manipulatorDrag, originalParentRect;
	var routine;


	*new { | parent, limitsView , selectorEdges |
		var me = super.new(parent, this.sizeHint );
		me.canFocus = true;
		me.init(parent, limitsView, selectorEdges);
		^me;
	}

	init { |argParent, limitsView, selectorEdges|
		"init".postln;
		parent = argParent;

		offset = 20;
		name = "QGui_ViewEdges";

		limits = limitsView;
		// limits.isNil.if ({limits = Window.availableBounds});
		("limit.class" + limits.class).postln;

		manipulatorDrag = false;

		parent.addAction({|view, x, y|
			"\nparentEnter [%]".format(parent.bounds).postln;
			parent.parents.do({|oneParent|
				oneParent.isKindOf(TopView).if({ oneParent.acceptsMouseOver = true; });
			});
			// view.acceptsMouseOver = true;
		}, \mouseEnterAction);
		parent.addAction({|view, x, y|
			"parentLeave".postln;
			parent.parents.do({|oneParent|
				oneParent.isKindOf(TopView).if({ oneParent.acceptsMouseOver = false; });
			});
		}, \mouseLeaveAction);
		/*
		parent.addAction({|view, x, y, modifiers|
		"mouseMoveAction % [%,%]".format(view.name, x, y).postln;

		}, \mouseMoveAction);
		*/
		// parent.addAction({|view, x, y| "parent[%,%]".format(x, y).postln;}, \mouseOverAction);

		this.acceptsMouse = false;

		this.addAction({|view, x, y|
			("\nthisEnter [%]" + this.bounds).postln;
		}, \mouseEnterAction);
		this.addAction({|view, x, y|
			"thisLeave".postln;
		}, \mouseLeaveAction);

		this.action = {
			"this.action".postln;
			this.fitManipulators;
		};

		this.onResize = {
			// "this.onResize".postln;
		};


		parent.onResize = {
			// "parent.onResize".postln;

			this.bounds = Rect(0,0, parent.bounds.width, parent.bounds.height);
			// ("this.bounds" + this.bounds).postln;

			manipulatorDrag.not.if({ this.fitManipulators });
		};



		// screenBounds = Window.availableBounds;

		edgeViews = Dictionary.new();

		selectorEdges.do({|edgeName|
			case
			{ edgeName.asSymbol == \left }
			{ edgeViews.put(edgeName.asSymbol, UserView(limits).name_(\left) )}

			{ edgeName.asSymbol == \top }
			{ edgeViews.put(edgeName.asSymbol, UserView(limits).name_(\top) )}

			{ edgeName.asSymbol == \right }
			{ edgeViews.put(edgeName.asSymbol, UserView(limits).name_(\right) )}

			{ edgeName.asSymbol == \bottom }
			{ edgeViews.put(edgeName.asSymbol, UserView(limits).name_(\bottom) )}
		});

		edgeViews.do({|manipulator|
			manipulator.addAction({|man, x, y| "\n%_ManipulatorEnter [%]".format(man.name, man.bounds).postln }, \mouseEnterAction);
			manipulator.addAction({|man, x, y| "leaveManipulator %".format(man.name).postln }, \mouseLeaveAction);
			manipulator.addAction({|man, x, y, buttNum|
				"mouseDownAction % [%,%]".format(man.name, x, y).postln;
				manipulatorMouseClick = x@y;
				originalParentRect = parent.bounds;
				manipulatorDrag = true;
				("manipulatorDrag" + manipulatorDrag).warn;
			}, \mouseDownAction);
			manipulator.addAction({|man, x, y, buttNum|
				"mouseUpAction % [%,%]".format(man.name, x, y).postln;
				manipulatorDrag = false;
				("manipulatorDrag" + manipulatorDrag).warn;
				// this.moveTo(parent.bounds.left,parent.bounds.top + y);
				this.doAction;
			}, \mouseUpAction);
			manipulator.addAction({|man, x, y, modifiers|
				// "\n%_Manipulator [%, %, %]".format(man.name, man.bounds, x, y).postln;

				case
				{man.name.asSymbol == \left}{
					parent.moveTo(man.bounds.left - manipulatorMouseClick.x + x, parent.bounds.top);
					parent.resizeTo(originalParentRect.width - x + manipulatorMouseClick.x, originalParentRect.height)
				}
				{man.name.asSymbol == \top}{
					parent.moveTo(originalParentRect.left,man.bounds.top - manipulatorMouseClick.y + y);
					parent.resizeTo(originalParentRect.width, originalParentRect.height - y + manipulatorMouseClick.y )
				}
				{man.name.asSymbol == \right}{
					"mouseMoveAction % [%,%]".format(man.name, x, y).postln;
					parent.resizeTo(originalParentRect.width + x , originalParentRect.height)
				}
				{man.name.asSymbol == \bottom}{
					"mouseMoveAction % [%,%]".format(man.name, x, y).postln;
					parent.resizeTo(originalParentRect.width, man.bounds.bottom - originalParentRect.top - manipulatorMouseClick.y + y)
				}

			}, \mouseMoveAction);


		});

		this.drawFunc = { this.draw };

		edgeViews.do({|view|
			view.drawFunc = {
				view.background = Color.new255(60,60,60,160);
				Pen.width = 2;
				Pen.strokeColor = Color.new255(20,180,240);
				case
				{ view.name.asSymbol == \left } {Pen.line(2@offset, 2@(view.bounds.height-offset)) }
				{ view.name.asSymbol == \top } { Pen.line(offset@2, (view.bounds.width-offset)@2) }
				{ view.name.asSymbol == \right } {Pen.line((view.bounds.width-2)@offset, (view.bounds.width-2)@(view.bounds.height-offset)) }
				{ view.name.asSymbol == \bottom } {Pen.line(offset@(view.bounds.height-2), (view.bounds.width-offset)@(view.bounds.height-2)) };
				Pen.stroke;
			};
		});

		limits.drawFunc = {
			Pen.width = 5;
			Pen.strokeColor = Color.red;
			Pen.addRect(Rect(0,0,limits.bounds.width,limits.bounds.height));
			Pen.stroke;
		}
	}

	fitManipulators {
		edgeViews.do({|manipulator|
			case
			// { manipulator.name.asSymbol == \left }{ manipulator.bounds_(Rect.offsetEdgeLeft(this.bounds, 5,0,0,20)) }
			// { manipulator.name.asSymbol == \top }{ manipulator.bounds_(Rect.offsetEdgeTop(this.bounds, 5,0,0,20)) }
			// { manipulator.name.asSymbol == \right }{ manipulator.bounds_(Rect.offsetEdgeRight(this.bounds, 5,0,0,20)) }
			// { manipulator.name.asSymbol == \bottom }{ manipulator.bounds_(Rect.offsetEdgeBottom(this.bounds, 5,0,0,20)) }
			{ manipulator.name.asSymbol == \left }{
				manipulator.bounds_(
					Rect.offsetEdgeLeft(
						limits.bounds,
						parent.bounds.left,
						parent.bounds.top,
						limits.bounds.height - parent.bounds.bottom,
						20)
				)
			}
			{ manipulator.name.asSymbol == \top }{
				manipulator.bounds_(
					Rect.offsetEdgeTop(
						limits.bounds,
						parent.bounds.top,
						parent.bounds.left,
						limits.bounds.width - parent.bounds.right,
						20)
				)
			}
			{ manipulator.name.asSymbol == \right }{
				manipulator.bounds_(
					Rect.offsetEdgeRight(
						limits.bounds,
						limits.bounds.width - parent.bounds.right,
						parent.bounds.top,
						limits.bounds.height - parent.bounds.bottom,
						20)
				)
			}
			{ manipulator.name.asSymbol == \bottom }{
				manipulator.bounds_(
					Rect.offsetEdgeBottom(
						limits.bounds,
						limits.bounds.height - parent.bounds.bottom,
						parent.bounds.left,
						limits.bounds.width - parent.bounds.right,
						20)
				)
			}
		});
	}

	draw {

		// "\ndraw".postln;
		// ("this.bounds" + this.bounds).postln;

		// this.background = Color.new255(255,0,0);

		Pen.width = 2;
		Pen.strokeColor = Color.white;
		Pen.addRect(Rect(0,0,this.bounds.width,this.bounds.height));

		Pen.stroke;
	}

	frameEnter {|view|
		var time = 0.45;
		var frames = 30;
		routine = Routine({
			frames.do({|i|
				// view.alpha = (i+1)/frames;
				this.refresh;
				(time/frames).wait;
			});
		}).play(AppClock);
	}

	frameLeave {|view|
		var time = 0.15;
		var frames = 15;
		routine = Routine({
			frames.do({|i|
				// view.alpha = (frames -(i+1))/frames;
				this.refresh;
				(time/frames).wait;
			});
		}).play(AppClock)
	}

}