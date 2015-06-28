AutoIDE
{
	classvar dict;
	classvar doc;

	var cursorIndex, lineStartIndex, lineEndIndex;

	*new { ^super.new.init(); }
	*run{ ^super.new.init(); }

	init {
		dict = Dictionary.new;
		this.cmds;

		doc = Document.current;

		doc.keyDownAction = { arg ...args;
			var keySymbol = args[4];

			cursorIndex = this.getCursorIndex;
			this.getLineIndex(cursorIndex); // set start and end index of current line

			// CHECKPRINT
			// ("KeyDownAction : " ++ args).postln;
			"\n".postln;
			("CursorIndex : " ++ cursorIndex).postln;
			("LineStartIndex : " ++ lineStartIndex).postln;
			("LineEndIndex : " ++ lineEndIndex).postln;
			("CursorLineTxt : " ++ this.getCursorLineTxt).postln;

			if(keySymbol == 112) // F1
			{
				("AutoIDE shortcut pressed F1 || " ++ this.getScript("test")).postln;
				this.insertText(cursorIndex, "test").postln;
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
					("ReplaceIndex : " ++ replaceIndex).postln;
					("KEY : " ++ key).postln;
					("CMD script : " ++ script).postln;
					this.replaceText(replaceIndex, script, key)
				}
			});
		};
		doc.onClose({ AutoIDE.end; });
	}

	*end {
		doc.textChangedAction = nil;
		doc.keyDownAction = nil;
		"AutoIDE stop".postln;
	}

	*add {|key, val| dict.put(key,val); }

	*getCommands { ^dict.keys; }

	getScript{ |key| ^dict.at(key.asString) }

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

	cmds{
		AutoIDE.add("test", "Ndef(\\sin, { SinOsc.ar(60!2, 0, 0.3) }).play;");
		AutoIDE.add("envg", "EnvGen.ar( Env( [0,1,0], [0.15,0.85]), \\aTrig.tr )");
		AutoIDE.add("filterlpf", "\\filter -> {|in| LPF.ar(in, 400) };");
	}

	insertText {|index, cmd| ^Document.current.string_(this.getScript(cmd.asString), index, 0);	}

	replaceText {|index, txt, cmd| ^Document.current.string_(txt, index + lineStartIndex, cmd.size); }

	scanForKey {|txt, cmd| ^txt.find(cmd.asString) }

}