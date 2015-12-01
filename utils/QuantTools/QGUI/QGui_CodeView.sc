QGui_CodeText : UserView {

	var <parent;
	var textView;
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

		this.name = "QGui_CodeText";
		string = nil;
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

		textView = TextView(this,Rect.offsetRect(this.bounds, 10,10,30,10))
		.focus(true)
		.string_("SinOsc.ar(\\freq.kr(120), mul: 0.2)")
		.font_(stringFont)
		.palette_(colorPalette)
		.tabWidth_(25)
		.keyUpAction_{ |view, char, modifiers, unicode, keycode, key|
			// var newString = view.setString(char, 0, char.size);
			// newString.postln;
			"ENTER \sourceCode %,%,%,%,%,%".format(view, char, modifiers, unicode, keycode, key).postln;
			// view.stringColor_(Color.white);
			// thisProcess.interpreter
			// thisProcess.interpreter.compile(view.string)

			// view.string.postln;
			// this.colorizeSyntax(view, "{%}".format(view.string), \nameControl, Color.new255(20,180,240));
			this.colorizeSyntax(view, view.string, \nameControl, Color.new255(20,180,240));
			// this.colorizeSyntax(view, proxy.source, \nameControl, Color.new255(20,180,240));
			// Ctrl + Enter -> unicode 10
			(unicode == 10).if({
				"\n>>> FIRE %".format(view.string).postln;
				// QGui.editNode(this.name, 0, view.string);
			});
		}
		// .keyTyped_


		.front;


		this.drawFunc = { this.draw };
	}

	colorizeSyntax{	|textView, string, type, color|
		// var compileString = string.asCompileString;
		// var formatedString = "{%}".format(compileString);
		var function = string.compile;
		var keys;

		function.def.sourceCode.postln;
		function.def.selectors.postln;
		function.def.sourceCode.findAll("SinOsc").postln;
		function.def.selectors.do({|oneKey|

			/*
			var positions = formatedString.findAll(oneKey.asString);
			oneKey.class.postln;
			oneKey.code.postln;
			positions.postln;
			positions.do({|onePosition|
			onePosition.postln;
			// string[]
			})
			*/
		});
		/*
		keys = case
		{type.asSymbol == \var} { \var }
		{type.asSymbol == \varName} { function.def.varNames }
		{type.asSymbol == \class} { function.def.selectors }
		{type.asSymbol == \nameControl} { function.def.constants };

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
		*/
	}


	safeTry {|string|
		var function;
		var def;


		try {

			// protect {
			function = string.compile;
			// work with the file here, which might cause an error
			def = function.def;

			function.isFunction.postln;

			def.sourceCode.postln;
			("Class" + def.selectors).postln;
			("Constats" + def.constants).postln;
			// } {
			// file.close;
			// "chyba".warn;
			// };


		}
		// {|error| \caught.postln; error.dump; };

		{ |error|
			("typErroru:" + error.species.name).postln;

			switch(error.species.name)
			{ 'Error' } {"jsem tu Error".postln;}
			{ 'DoesNotUnderstandError'} {"jsem tu".postln;}
			// default condition: unhandled exception, rethrow
			// { error.throw }
			{ "unknown exception".postln; error.dump; /*error.throw;*/ }

		};




	}


	draw {
		this.background = Color.black;
		Pen.width = 1;
		Pen.strokeColor = Color.red;
		Pen.addRect(Rect(0,0, this.bounds.width, this.bounds.height));
		Pen.stroke;
	}
}