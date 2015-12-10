QGui_Button : UserView {

	var <parent;
	var displayState, >keepingState;
	var <name, string;
	var colorBackground, colorBackgroundActive;
	var colorFrame, colorFrameOver, colorFrameActive;
	var colorString, colorStringActive;
	var stringFont;
	var iconPath;
	var iconSymbol, iconFrame, iconLight;
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
		this.bounds = argBounds;

		this.displayState_(\off);
		keepingState = true;

		frameAlpha = 0;
		name = "QGui_Button";
		string = nil;
		stringFont = Font( 'Helvetica', 10 );

		colorBackground = Color.clear;
		colorBackgroundActive = Color.new255(50,60,70);

		colorFrame = Color.clear;
		colorFrameOver = Color.new255(20,180,240);
		colorFrameActive = colorFrame;

		colorString = Color.white;
		colorStringActive = colorString;

		value = 0;

		this.drawFunc = { this.draw };

		this.onClose_{
			iconSymbol.free;
			routine.stop;
			// this.remove;
			// "jsem".warn;
		};
	}

	name_ {|buttonName| name = "QGui_Button [%]".format(buttonName) }

	string_ {|text| string = text; }

	colorBackground_ {|color| colorBackground = color }
	colorBackgroundActive_ {|color| colorBackgroundActive = color }

	colorFrame_ {|color| colorFrame = color }
	colorFrameActive_ {|color| colorFrameActive = color }
	colorFrameOver_ {|color| colorFrameOver = color }

	displayFont_ {|font| stringFont = font }

	displayState_ {|type|

		case
		{type.asSymbol == \on} {displayState = \on}
		{type.asSymbol == \onOver} {displayState = \onOver}
		{type.asSymbol == \off} {displayState = \off}
		{type.asSymbol == \offOver} {displayState = \offOver}
		{true}{("QGui_Button displayState_(%) not define, use [\\on, \\over, \\off]".format(type)).warn};

		// displayState.postln;

	}

	iconName{|name|
		iconPath = super.class.filenameSymbol.asString.dirname +/+ name ++ ".png";
		iconSymbol = Image.new(iconPath);
		// iconPath.postln;
	}

	iconPath{|path|
		// iconPath = PathName(path).fullPath;
		// iconPath.postln;
	}

	draw {

		this.background = case
		{displayState == \on} { colorBackgroundActive }
		{displayState == \onOver} { colorBackgroundActive }
		{displayState == \off} { colorBackground }
		{displayState == \offOver} { colorBackground };

		iconPath.notNil.if({
			iconSymbol.drawInRect(
				Rect(0,0,this.bounds.width,this.bounds.height),
				Rect(0,0,iconSymbol.width, iconSymbol.height),
				'sourceOver',
				1
			);
		});

		Pen.width = 1;

		Pen.strokeColor = case
		{displayState == \on} { colorFrameActive.blend(colorFrameOver,frameAlpha) }
		{displayState == \onOver} { colorFrameActive.blend(colorFrameOver,frameAlpha) }
		{displayState == \off} { colorFrame.blend(colorFrameOver,frameAlpha) }
		{displayState == \offOver} { colorFrame.blend(colorFrameOver,frameAlpha) };

		Pen.addRect(Rect(0,0, this.bounds.width, this.bounds.height));
		Pen.stroke;

		string.notNil.if({
			Pen.font = stringFont;
			Pen.stringCenteredIn( string, Rect(0,0, this.bounds.width, this.bounds.height),
				color:case
				{displayState == \on} { colorStringActive }
				{displayState == \onOver} { colorStringActive }
				{displayState == \off} { colorString }
				{displayState == \offOver} { colorString };
			);
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
		keepingState.if({
			(displayState.asSymbol == \offOver).if(
				{ this.displayState_(\onOver) },
				{ this.displayState_( \offOver) }
			)
		});

		value = val;
		this.refresh;
	}

	mouseDown{ arg x, y, modifiers, buttonNumber, clickCount;
		// "MouseClickDown % [value %]".format(name, value).postln;
		routine.stop;
		mouseDownAction.value(this, x, y, modifiers, buttonNumber, clickCount);
		(value == 0).if( {this.valueAction_(1);}, {this.valueAction_(0);} );
	}

	mouseEnter{
		// "MouseEnter %".format(name).postln;

		this.displayState_(
			case
			{displayState.asSymbol == \on } {\onOver}
			{displayState.asSymbol == \off } {\offOver};
		);

		mouseEnterAction.value(this);
		this.frameEnter;
	}

	mouseLeave{
		// "MouseLeave %".format(name).postln;

		this.displayState_(
			case
			{displayState.asSymbol == \onOver } {\on}
			{displayState.asSymbol == \offOver } {\off};
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
				frameAlpha = (i+1)/frames ;
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
				frameAlpha = (frames -(i+1))/frames ;
				this.refresh;
				(time/frames).wait;
			});
		}).play(AppClock)
	}


}
