QGui_Slider : UserView {

	classvar >thisClassDebugging = false;

	var parent, bounds;
	var objects, controls;
	var value, valueMin, valueMax;
	var graph, graphValue, graphDensity;
	var fadeTime, routine;

	*new { | parent, bounds |
		var me = super.new(parent, bounds ?? {this.sizeHint} );
		me.canFocus = true;
		me.init(parent, bounds);
		^me;
	}

	init { |argParent, argBounds|

		// (QGui.debbuging and: thisClassDebugging).if({
		"\n% - % [%, %]".format(thisMethod, argParent, argBounds).postln;
		// });

		objects = Dictionary.new();
		controls = Dictionary.new();

		parent = argParent;
		bounds = argBounds;

		value = 0;
		valueMin = 0;
		valueMax = 1;

		graph = Interval(0, 9, 1);
		graphValue = graph.start;
		graphDensity = 0.5;

		fadeTime = 4;

		this.name = "QGui_Slider";

		this.onResize_{
			"resize".warn;
			// this.bounds_(Rect.offsetEdgeTop(parent, 10,10,10,55));
			// this.refresh;
		};

		this.addAction(
			{|view, x, y, modifiers, buttonNumber, clickCount|
				var xVal = ((x / this.bounds.width) * ( valueMax - valueMin)) + valueMin ;
				var xValGraph = graph.at(x / this.bounds.width * (graph.size - 1)) ;
				// "mouseClickTest [%,%,%,%,%,%]".format(view, x, y, modifiers, buttonNumber, clickCount).postln;
				// ("xVal: " ++ xVal).postln;
				// ("xValGraph: " ++ xValGraph).postln;
				(buttonNumber == 0).if({ this.value_(xVal) });
				(buttonNumber == 1).if({ this.valueFade_(xVal,fadeTime) });
				this.refresh;
			}, \mouseDownAction
		);
		// this.addAction({"mouseEnterTest".postln}, \mouseEnterAction);
		// this.addAction({"mouseLeaveTest".postln; num = 0; this.refresh;}, \mouseLeaveAction);
		// this.action_{ "generalAction".warn; // num = 10; // this.refresh; };

		this.drawFunc = { this.draw };
	}

	domain_ {|minVal, maxVal, segments|
		var steps = segments ? (maxVal - minVal);
		valueMin = minVal;
		valueMax = maxVal;
		// ("steps: " + steps).postln;
		graph = Interval(0, steps, 1);
		this.value = minVal;
		this.refresh;
	}

	value_ { |val|
		(val > valueMax).if({ val = valueMax });
		(val < valueMin).if({ val = valueMin });
		value = val;
		graphValue = ((val - valueMin) / (valueMax - valueMin)) * (graph.size-1);
		this.refresh;
	}

	valueFade_ { |targetVal, time|
		var frames = time * 24;
		var startVal = value;
		(targetVal > valueMax).if({ targetVal = valueMax });
		(targetVal < valueMin).if({ targetVal = valueMin });
		("targetVal:" + targetVal).postln;

		routine = Routine.new({
			frames.do({|i|
				var valTemp = ((i+1)/frames * (targetVal - startVal)) + startVal;
				this.value_(valTemp);
				(time/frames).wait;
			});
		}).play(AppClock);
	}

	graphDensity_ {|val|
		(val > 1).if({ val = 1 });
		(val < 0).if({ val = 0 });
		graphDensity = val;
		this.refresh;
	}

	draw {
		// "Draw % ".format(this.name).postln;
		Pen.width = 1;
		Pen.strokeColor = Color.new255(120,120,120);
		Pen.line(0@0, this.bounds.width@0);
		Pen.line(0@this.bounds.height, this.bounds.width@this.bounds.height);
		Pen.stroke;

		graph.do({|val, i|
			var sizeX = this.bounds.width / (graph.size - 1);
			var posX = sizeX * i;
			// "grhapValue %".format(graphValue).postln;
			// "grhap.do [%, %]".format(val, i).postln;
			Pen.addRect(Rect.offsetEdgeLeft(this.bounds, posX + (sizeX * (1 - graphDensity) / 2), 5,5, sizeX * graphDensity));
			(posX <= (graphValue * sizeX)).if(
				{ Pen.fillColor_(Color.new255(20,180,240)) },
				{ Pen.fillColor_(Color.new255(50,60,70)) }
			);
			Pen.fill;
		});

		Pen.stringAtPoint(
			value.round(0.1).asString,
			20@((this.bounds.height/2)-8),
			Font('Courier',8,usePointSize:true),
			Color.white
		);

	}
}