QGui_Button : UserView {

	var <parent, <bounds;
	var state;
	var <name, string;
	var colorBackground, colorBackgroundActive;
	var colorFrame, colorFrameOver, colorFrameActive;
	var colorString;
	var stringFont;
	var iconPath;
	var iconFrame, iconLight;
	var frameAlpha;
	var <value;
	var routine;

	*new { | parent, bounds |
		var me = super.new(parent, bounds ?? {this.sizeHint} );
		me.canFocus = true;
		me.init(parent, bounds);
		^me;
	}

	init { |argParent, argBounds|

		parent = argParent;
		bounds = argBounds;

		this.state_(\off);

		frameAlpha = 0;
		name = "QGui_Button";
		string = nil;
		stringFont = Font( 'Helvetica', 10 );

		colorBackground = Color.clear;
		colorBackgroundActive = Color.new255(50,60,70);
		colorFrame = Color.clear;
		colorFrameOver = Color.new255(20,180,240);
		colorFrameActive = Color.new255(50,60,70);
		colorString = Color.gray;

		value = 0;

		this.drawFunc = { this.draw };
	}

	bounds_ {|rect| this.bounds = rect}

	name_ {|name| this.name = "QGui_Button [%]".format(name) }

	string_ {|text| string = text; }

	colorBackground_ {|color| colorBackground = color }
	colorBackgroundActive_ {|color| colorBackgroundActive = color }

	colorFrame_ {|color| colorFrame = color }
	colorFrameActive_ {|color| colorFrameActive = color }
	colorFrameOver_ {|color| colorFrameOver = color }

	font_ {|font| stringFont = font }

	state_ {|type|
		case
		{type.asSymbol == \on} {state = \on}
		{type.asSymbol == \onOver} {state = \onOver}
		{type.asSymbol == \off} {state = \off}
		{type.asSymbol == \offOver} {state = \offOver}
		{true}{("QGui_Button state_(%) not define, use [\\on, \\over, \\off]".format(type)).warn};

		state.postln;
	}

	iconName{|name|
		iconPath = super.class.filenameSymbol.asString.dirname +/+ name ++ ".png";
		// iconPath.postln;
	}

	iconPath{|path|
		iconPath = PathName(path).fullPath;
		iconPath.postln;
	}

	draw {
		// colorFrame.postln;
		// colorFrameActive.postln;
		// frameAlpha.postln;

		(value == 1).if(
			{ this.background = colorBackgroundActive },
			{ this.background = colorBackground }
		);
		iconPath.notNil.if({
			var img = Image.new(iconPath);
			this.backgroundImage_(img);
		});
		Pen.width = 1;
		Pen.strokeColor = case
		{state == \on} { colorFrameActive.blend(colorFrameOver,frameAlpha) }
		{state == \onOver} { colorFrameActive.blend(colorFrameOver,frameAlpha) }
		{state == \off} { colorFrame.blend(colorFrameOver,frameAlpha) }
		{state == \offOver} { colorFrame.blend(colorFrameOver,frameAlpha) };

		Pen.addRect(Rect(0,0, this.bounds.width, this.bounds.height));
		// Pen.addRect(this.bounds);
		Pen.stroke;

		string.notNil.if({
			Pen.font = stringFont;
			Pen.stringCenteredIn( string, Rect(0,0, this.bounds.width, this.bounds.height), color:colorString);
		});
	}

	// (5) define typical widget methods  (only those you need or adjust as needed)
	valueAction_{ |val| // most widgets have this
		// (value == 0).if( {value = 1}, {value = 0} );
		this.value_(val);
		this.doAction;
	}
	value_{ |val|       // in many widgets, you can change the
		// value and refresh the view , but not do the action.

		(state.asSymbol == \offOver).if({ this.state_(\onOver) },{ this.state_( \offOver) });
		value = val;
		this.refresh;
	}

	mouseDown{ arg x, y, modifiers, buttonNumber, clickCount;
		// "MouseClickDown % [value %]".format(name, value).postln;
		mouseDownAction.value(this, x, y, modifiers, buttonNumber, clickCount);
		(value == 0).if( {this.valueAction_(1);}, {this.valueAction_(0);} );
	}

	mouseEnter{
		// "MouseEnter %".format(name).postln;
		this.state_(
			case
			{state.asSymbol == \on } {\onOver}
			{state.asSymbol == \off } {\offOver};
		);

		mouseEnterAction.value(this);
		this.frameEnter;
	}

	mouseLeave{
		// "MouseLeave %".format(name).postln;
		this.state_(
			case
			{state.asSymbol == \onOver } {\on}
			{state.asSymbol == \offOver } {\off};
		);

		mouseLeaveAction.value(this);
		this.frameExit;
	}

	frameEnter {
		var time = 0.45;
		var frames = 30;
		routine.stop;
		routine = Routine({
			frames.do({|i|
				frameAlpha = (i+1)/frames ; //* 255
				this.refresh;
				(time/frames).wait;
			});
		}).play(AppClock);
	}

	frameExit {
		var time = 0.15;
		var frames = 15;
		routine.stop;
		routine = Routine({
			frames.do({|i|
				frameAlpha = (frames -(i+1))/frames ; //* 255
				this.refresh;
				(time/frames).wait;
			});
		}).play(AppClock)
	}
}