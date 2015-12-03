QGui_CodeView : UserView {
	classvar >thisClassDebugging = false;

	var <parent;
	var textView, buttonOk, buttonCancle;
	var isChanged;
	var lastValidDef;

	var displayError;


	var displayState, >keepingState;
	var string;
	var colorPalette;
	var colorBackground, colorBackgroundActive;
	var colorFrame, colorFrameOver, colorFrameActive;
	var colorString, colorStringActive;
	var stringFont;
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
		this.onResize = {|view|
			(QGui.debbuging and: thisClassDebugging).if({("% [node %] onResize".format(parent.name, view.name)).postln;});
			textView.bounds_(Rect.offsetEdgeLeft(this.bounds, 2,2,2,this.bounds.width - 30));
			buttonOk.bounds_(Rect.offsetCornerRT(this.bounds, 3,3,26,(this.bounds.height/2)-3));
			buttonCancle.bounds_(Rect.offsetCornerRB(this.bounds, 3,3,26,(this.bounds.height/2)-3));
		};
		this.onMove = {|view|
			(QGui.debbuging and: thisClassDebugging).if({("% [node %] onMove".format(parent.name, view.name)).postln });

		};
		this.onClose = {|view|
			(QGui.debbuging and: thisClassDebugging).if({("% [node %] onClose".format(parent.name, view.name)).postln});

		};

		this.name = "QGui_CodeView";
		string = "";
		stringFont = Font('Courier',8,usePointSize:true);

		colorBackground = Color.clear;
		colorBackgroundActive = Color.new255(50,60,70);

		colorFrame = Color.clear;
		colorFrameOver = Color.new255(20,180,240);
		colorFrameActive = colorFrame;

		colorString = Color.white;
		colorStringActive = colorString;

		colorPalette = QPalette.new();
		colorPalette.window = Color.new255(30,30,30); // background
		colorPalette.windowText = Color.white;
		colorPalette.button = Color.new255(30,30,30);
		colorPalette.buttonText = Color.white;
		colorPalette.base = Color.new255(30,30,30);
		colorPalette.baseText = Color.white;
		colorPalette.highlight = Color.new255(20,180,240);
		colorPalette.highlightText = Color.white;

		value = 0;

		textView = TextView(this)
		.focus(true)
		.enterInterpretsSelection_(false)
		.editable_(false)
		.string_(string)
		.stringColor_(Color.new255(100,100,100))
		.font_(stringFont)
		.palette_(colorPalette)
		.tabWidth_(25)
		.keyDownAction_{ |view, char, modifiers, unicode, keycode, key|
			(displayState != \isError).if({this.displayState_(\isChanged)});
			this.colorizeSyntax(view.string, \var, Color.new255(255,255,255));
			this.colorizeSyntax(view.string, \varName, Color.new255(250,220,100));
			this.colorizeSyntax(view.string, \class, Color.new255(180,180,180));
			this.colorizeSyntax(view.string, \nameControl, Color.new255(20,180,240));

			this.refresh;
		}
		.keyUpAction_{ |view, char, modifiers, unicode, keycode, key|
			// "ENTER \sourceCode %,%,%,%,%,%".format(view, char, modifiers, unicode, keycode, key).postln;


			// Ctrl + Enter -> unicode 10
			(unicode == 10).if({
				"\n>>> FIRE %".format(view.string).postln;
				this.safeTry(view.string);
				this.colorizeSyntax(view.string, \var, Color.new255(255,255,255));
				this.colorizeSyntax(view.string, \varName, Color.new255(250,220,100));
				this.colorizeSyntax(view.string, \class, Color.new255(180,180,180));
				this.colorizeSyntax(view.string, \nameControl, Color.new255(20,180,240));
			});
			this.refresh;
		};

		buttonOk = QGui_Button(this)
		.string_("OK")
		.colorBackground_(Color.new255(30,30,30))
		.keepingState_(false)
		.action_{QGui.refreshAll};

		buttonCancle = QGui_Button(this)
		.string_("X")
		.colorBackground_(Color.new255(30,30,30))
		.keepingState_(false);

		this.displayState_(\isCode);
		lastValidDef = (textView.string).compile.def;

		this.drawFunc = { this.draw };
	}


	string_{|txt| textView.string = txt }

	functionString{|function|
		var sourceCode = function.def.sourceCode;
		this.string_(sourceCode[1..sourceCode.size-2]);

		this.safeTry(string);
	}

	displayState_ {|type|
		case
		{type.asSymbol == \isCode} {displayState = \isCode}
		{type.asSymbol == \isChanged} {displayState = \isChanged}
		{type.asSymbol == \isError} {displayState = \isError}
		{type.asSymbol == \isOver} {displayState = \isOver}
		{true} {("QGui_CodeView displayState_(%) not define, use [\\isCode, \\isChanged, \\isError, \\isOver]".format(type)).warn};
	}

	safeTry {|string|
		// var function;

		try {
			// function = string.compile;
			lastValidDef = string.compile.def;
			this.displayState_(\isCode);
		}
		{ |error|
			this.displayState_(\isError);
		};

		("\nValidCode:" + lastValidDef.sourceCode).postln;
		("Class" + lastValidDef.selectors).postln;
		("Constats" + lastValidDef.constants).postln;
		("VarNames" + lastValidDef.varNames).postln;
		// ("displayError" + displayError).postln;


	}

	colorizeSyntax{	|string, type, color|
		// var string = def.sourceCode.asString;
		var keys;
		keys = case
		// {type.asSymbol == \var} { \var }
		{type.asSymbol == \varName} { lastValidDef.varNames }
		{type.asSymbol == \class} { lastValidDef.selectors }
		{type.asSymbol == \nameControl} { lastValidDef.constants };

		keys.do({|oneKey|
			var positions = string.findAll(oneKey.asString);

			positions.do({|onePosition|
				case
				{type.asSymbol == \var}
				{ textView.setStringColor(color, onePosition, oneKey.asString.size) }

				{type.asSymbol == \varName}
				{
					(string[onePosition-1] == $\ ).if({
						textView.setStringColor(color, onePosition, oneKey.asString.size)
					})
				}

				{type.asSymbol == \class}
				{ textView.setStringColor(color, onePosition, oneKey.asString.size) }

				{type.asSymbol == \nameControl}
				{
					oneKey.isKindOf(Symbol).if({
						(string[onePosition-1] != $\ ).if({
							textView.setStringColor(color, onePosition-1, oneKey.asString.size+1)
						})
					},
					// { textView.setStringColor(Color.red, onePosition, oneKey.asString.size)} //NUMBERS??
					);
				};
			});
		});

	}


	mouseEnter{
		// "MouseEnter %".format(name).postln;
		textView.editable = true;


		this.displayState_(
			case
			{displayState == \isCode } {\isOver};
			// {displayState == \off } {\offOver};
		);

		mouseEnterAction.value(this);
		this.frameEnter;
	}
	mouseLeave{
		// "MouseLeave %".format(name).postln;
		textView.editable = false;
		this.displayState_(
			case
			{displayState == \isOver } {\isCode};
			// {displayState == \offOver } {\off};
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

	draw {
		(QGui.debbuging and: thisClassDebugging).if({("% [node %] draw".format(parent.name, this.name)).postln });

		this.colorizeSyntax(textView.string, \var, Color.new255(255,255,255));
		this.colorizeSyntax(textView.string, \varName, Color.new255(250,220,100));
		this.colorizeSyntax(textView.string, \class, Color.new255(180,180,180));
		this.colorizeSyntax(textView.string, \nameControl, Color.new255(20,180,240));


		this.background = Color.black;

		Pen.width = case
		{displayState == \isCode} {1}
		{displayState == \isChanged} {1}
		{displayState == \isError} {5}
		{displayState == \isOver} {5}
		{true}{1};

		Pen.strokeColor = case
		{displayState == \isCode} {Color.gray}
		{displayState == \isChanged} {Color.new255(20,180,240)}
		{displayState == \isError} {Color.red}
		{displayState == \isOver} {Color.new255(50,60,70)}
		{true}{Color.white};

		Pen.addRect(Rect.offsetRect(this.bounds, 0,0,0,0));
		Pen.stroke;
	}
}