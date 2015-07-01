AutoIDE
{
	classvar version = 0.1;
	classvar dict;
	classvar doc;
	var cursorIndex, lineStartIndex, lineEndIndex;

	*new{ ^super.new.init(); }
	*run{
		("AutoIDE [ver %] start running".format(version)).inform;
		^super.new.start();
	}
	*add {|key, func|
		var txt = func.def.sourceCode.asString;
		var script = txt[1..(txt.size-2)]; // remove first and last symbol of function {}
		if(script.beginsWith("\n")) { script = script[1..(txt.size)] }; // remove first symbol newline \n
		script = script.replace("\t", ""); // remove all symbol indent \t
		dict.put(key.asString,script);  // functionDef
	}
	*print{
		var txt = "";
		var instance = super.new.init();
		dict.keys.do({|key|
			var script = instance.getScript(key).asString;
			if (script.size > 65) {script = script[0..40] ++ " .... " ++ script[(script.size-15)..script.size] };
			txt = txt + ("\n\t-> [" + key + "||" + script + "]\n");
		})
		^("AutoIDE library" + txt);
	}
	*end {
		if(doc.notNil) {
			doc.keyDownAction = nil;
			"AutoIDE stop".postln;
		}
		{ "AutoIDE is not running".warn; };
	}

	init{
		dict = Dictionary.new;
		this.readLibrary();
	}

	readLibrary {
		var dir = Platform.systemExtensionDir ++ "\/AutoIDE";
		var file = "AutoIDE_lib";
		var path = ("%\/%.scd".format(dir, file));
		if(File.exists(path)) {
			thisProcess.interpreter.executeFile(path);
		}
		{
			("AutoIDE_lib.scd not found in path %".format(path)).error;
		}
		;
	}

	read {|key, val|
		var func = val.def.sourceCode;
		dict.put(key,val.def.sourceCode); } // functionDef

	// Document
	getCommands { ^dict.keys; }

	getScript{ |key| ^dict.at(key.asString) }

	start {
		this.init();

		doc = Document.current;

		doc.keyDownAction = { arg ...args;
			var keySymbol = args[4];

			cursorIndex = this.getCursorIndex;
			this.getLineIndex(cursorIndex); // set start and end index of current line

			// CHECKPRINT
			// ("KeyDownAction : " ++ args).postln;
			// "\n".postln;
			// ("CursorIndex : " ++ cursorIndex).postln;
			// ("LineStartIndex : " ++ lineStartIndex).postln;
			// ("LineEndIndex : " ++ lineEndIndex).postln;
			// ("CursorLineTxt : " ++ this.getCursorLineTxt).postln;

			if(keySymbol == 112) // F1
			{
				("AutoIDE shortcut pressed F1 || nodeBasic" ++ this.getScript("nodebasic")).postln;
				this.insertText(cursorIndex, "nodebasic").postln;
			};
			if(keySymbol == 113) // F2
			{
				("AutoIDE shortcut pressed F2 || " ++ this.getScript("envg")).postln;
				this.insertText(cursorIndex, "envg").postln;
			};


			dict.keys.do({|key|
				var replaceIndex = this.scanForKey(this.getCursorLineTxt, key);

				if(replaceIndex.notNil) {
					var script = this.getScript(key);
					// ("ReplaceIndex : " ++ replaceIndex).postln;
					// ("KEY : " ++ key).postln;
					// ("CMD script : " ++ script).postln;
					postf("AutoIDE completation [ % || % ]\n", key, script);
					this.replaceText(replaceIndex, script, key)
				}
			});
		};
		doc.onClose({ AutoIDE.end; });
	}

	getCursorIndex { ^doc.selectionStart }

	getLineIndex { |cursorIndex|
		var flag_CurrentLine = false;
		var lineStart, lineEnd;
		var endOfLines = doc.text.findAll("\n");
		var noLine = 0;

		while ( { flag_CurrentLine == false },
			{
				lineEnd = endOfLines[noLine];
				lineStart = endOfLines[noLine-1];

				if(lineStart.isNil) {lineStart = (-1)};
				if(lineEnd.isNil) {lineEnd = doc.text.size};

				if( lineEnd >= cursorIndex ) { flag_CurrentLine = true };
				noLine = noLine + 1;
			}
		);

		lineStartIndex = lineStart+1;
		lineEndIndex = lineEnd;
	}

	getCursorLineTxt { ^doc.rangeText(lineStartIndex,lineEndIndex-lineStartIndex) }

	insertText {|index, cmd| ^Document.current.string_(this.getScript(cmd.asString), index, 0);	}

	replaceText {|index, txt, cmd| ^Document.current.string_(txt, index + lineStartIndex, cmd.size); }

	scanForKey {|txt, cmd| ^txt.find(cmd.asString) }

}