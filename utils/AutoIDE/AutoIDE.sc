AutoIDE
{
	classvar <version = 0.13;
	classvar path;
	classvar dict;
	classvar doc;

	*new{ ^super.new.init(true); }
	*run{
		super.new.init(true);
		super.new.start();
		^("AutoIDE [ver %]".format(version));
	}
	*end {
		if(doc.notNil) {
			doc.keyDownAction = nil;
			"AutoIDE stop".postln;
		}
		{ "AutoIDE is not running".warn; };
	}
	*print{
		var txt = "";
		var sortedKeys;

		super.new.init(false);

		sortedKeys = dict.keys;
		sortedKeys = sortedKeys.asArray;
		sortedKeys = sortedKeys.sort;
		sortedKeys.do({|key|
			var script = super.new.getCode(key).asString;
			script = script.replace("\t", ""); // remove all symbol indent \t
			script = script.replace("\n", ""); // remove all symbol newline \n
			script = script.replace("\r", ""); // remove all symbol carriage return \r
			if (script.size > 65) {script = script[0..40] ++ " .... " ++ script[(script.size-15)..script.size] };
			txt = txt + ("\n\t-> [" + key + "||" + script + "]");
		})
		^("AutoIDE library" + txt);
	}
	*add { |key, func|
		super.new.init(false);
		dict.add(key.asSymbol -> func.def.sourceCode);
		super.new.writeLibrary;
		super.new.init(false);
		^("AutoIDE key\n\t- added key [ % ] to library (AutoIDE_lib.scd)".format(key.asString));
	}
	*remove { |key|
		super.new.init(false);
		dict.removeAt(key.asString);
		super.new.writeLibrary;
		super.new.init(false);
		^("AutoIDE key\n\t- removed key [ % ] from library (AutoIDE_lib.scd)".format(key.asString));
	}
	*code { |key|
		super.new.init(false);
		if(dict.at(key.asString).notNil) { ^super.new.getCode(key); }{ ^nil; };
	}
	// privat method for wrinteing to dict
	*prStore {|key, code|
		var script = code.def.sourceCode.asString; // functionDef
		dict.put(key.asString,script);
	}

	init{|flag_reboot|
		if(path.isNil)
		{
			var dir = AutoIDE.filenameSymbol.asString.dirname;
			var file = "AutoIDE_lib.scd";
			path = dir +/+ file;
		};

		if(flag_reboot) {
			Server.local.waitForBoot({
				dict = Dictionary.new;
				this.readLibrary();
				("\nAutoIDE \n\t- start running".format(version)).inform;
				("\t- load library dir (AutoIDE_lib.scd) : %".format(path)).inform;
			});
		}{
			dict = Dictionary.new;
			this.readLibrary();
		};
	}

	readLibrary {
		var dir = AutoIDE.filenameSymbol.asString.dirname;
		var file = "AutoIDE_lib.scd";
		var path = dir +/+ file;

		if(File.exists(path))
		{
			thisProcess.interpreter.executeFile(path); // written to dict by this.prStore
		}{
			("AutoIDE_lib.scd not found in path %".format(path)).error;
		};
	}

	writeLibrary {
		var dir = AutoIDE.filenameSymbol.asString.dirname;
		var file = "AutoIDE_lib.scd";
		var path = dir +/+ file;

		var lib = File.open(path, "w");
		dict.keys.do({|key|
			lib.write("AutoIDE.prStore(\\" ++ key.asString ++ "," ++ dict.at(key).asString ++ ");\n");
		});
		lib.close;
	}

	// Document
	getKeys { ^dict.keys; }

	getCode{ |key|
		var code = dict.at(key.asString);
		var script = code.asString;
		script = script[1..(script.size-2)]; // remove first and last symbol of function {}
		if(script.beginsWith("\n")) { script = script[1..(script.size)] }; // remove first symbol newline \n
		if(script.beginsWith(" ")) { script = script[1..(script.size)] }; // remove first " "
		script = script.replace("\t", ""); // remove all symbol indent \t
		^script;
	}

	start {
		doc = Document.current;

		doc.keyDownAction = { arg ...args;

			// INFORMATIONS FROM DOCUMENT
			var keySymbol = args[4];
			var cursorIndex, currentLineIndexs, lineIndex, lineStartIndex, lineEndIndex;
			var lineText;

			cursorIndex = this.getCurrentCursorIndex;
			currentLineIndexs = this.getCurrentLineIndex(cursorIndex);

			lineIndex = currentLineIndexs[0];
			lineStartIndex = currentLineIndexs[1];
			lineEndIndex = currentLineIndexs[2];

			lineText = this.getLineTxt(doc.text, lineIndex);

			// "GetLineTxt [ % || % ] : |%|".format(cursorIndex, lineIndex, lineText).postln;

			// CALL NodeExtension
			// this.scanNode(lineIndex);

			Platform.case(\windows, {
				if(keySymbol == 112) // F1
				{
					var sortedKeys;
					var txt = "";

					sortedKeys = dict.keys;
					sortedKeys = sortedKeys.asArray;
					sortedKeys = sortedKeys.sort;
					sortedKeys.do({|key|
						var script = this.getCode(key).asString;
						script = script.replace("\t", ""); // remove all symbol indent \t
						script = script.replace("\n", ""); // remove all symbol newline \n
						if (script.size > 65) {script = script[0..40] ++ " .... " ++ script[(script.size-15)..script.size] };
						txt = txt + ("\t-> [" + key + "||" + script + "]\n");
					});
					("\nAutoIDE library\n" + txt).postln;
				};
				if(keySymbol == 113) // F2
				{
					var scannedNode, nodeName, nodeIndex;
					scannedNode = this.scanNode(lineIndex);
					nodeName = scannedNode[0];
					nodeIndex = scannedNode[1];
					if(nodeName.notNil && nodeIndex.notNil){
						"CurrentNode || %[%] ".format(nodeName, nodeIndex).postln;
						this.insertText(cursorIndex, "~%[%]".format(nodeName, nodeIndex));
					};
				};
			});

			dict.keys.do({|key|
				var replaceIndex = this.scanForKey(lineText, key);

				if(replaceIndex.notNil) {
					var scannedNode, nodeName, nodeIndex;
					var script = this.getCode(key);

					// NodeExtension
					scannedNode = this.scanNode(lineIndex);
					nodeName = scannedNode[0];
					nodeIndex = scannedNode[1];

					if(script.find("~nodeName").notNil)
					{
						script = script.replace("~nodeName", "~%".format(nodeName))
					};
					if(script.find("~nodeIndex").notNil)
					{
						script = script.replace("~nodeIndex", "~%[%]".format(nodeName, nodeIndex))
					};

					postf("AutoIDE completation [ % ]\n", key);
					this.replaceText(replaceIndex, lineStartIndex, script, key)
				}
			});

		};
		doc.onClose({ AutoIDE.end; });
	}

	getCurrentCursorIndex { ^doc.selectionStart; }

	getCurrentLineIndex { |cursorIndex|
		var flag_CurrentLine = false;
		var lineStart, lineEnd;
		var endOfLines = Document.current.text.findAll("\n");
		var noLine = 0;
		var answ;

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

		^answ = [noLine,(lineStart+1),lineEnd]
	}

	getLineTxt {|txt, noLine|
		var newLinesIndexs = txt.findAll("\n");
		var lineStartIndex = newLinesIndexs[noLine-2] ?? -1;
		var lineEndIndex = newLinesIndexs[noLine-1] ?? txt.size;

		if((lineStartIndex+1) == lineEndIndex) { ^""; };
		^txt[(lineStartIndex+1)..(lineEndIndex-1)];
	}

	insertText {|index, cmd| ^Document.current.string_(cmd, index, 0);	}

	replaceText {|index, currentLineStart, txt, cmd| ^Document.current.string_(txt, index + currentLineStart, cmd.size); }

	scanForKey {|txt, cmd| ^txt.find(cmd.asString) }

	// nodeExtension

	scanNode {|noLine|
		var flag_nodeNameLine = false;
		var lineTxt;
		var currentNodeName, tempNodeIndex, currentNodeIndex;
		var flag_name, flag_index;
		flag_name = false;
		flag_index = false;

		while ( { flag_nodeNameLine == false },
			{
				lineTxt = this.getLineTxt(doc.text, noLine);

				// looking for node index
				tempNodeIndex = lineTxt.findRegexp("~*\\[.?..?\\]");
				if(tempNodeIndex.notEmpty) {
					tempNodeIndex = tempNodeIndex[0][1];
					currentNodeIndex = tempNodeIndex[1..(tempNodeIndex.size-2)].asInt;
					currentNodeIndex = currentNodeIndex + 1;

					flag_index = true;
				};

				// looking for node name
				if(lineTxt.beginsWith("~"))
				{
					var envir = currentEnvironment;
					envir.valueArrayEnvir.do({|node|
						if(lineTxt.beginsWith("~" ++ node.key.asString))
						{
							currentNodeName = node.key;

							node.getKeysValues.do({|key|
								"\t-> % || %".format(key[0],key[1]).postln;
							});
							flag_name = true;
						};
					});
				};

				if (flag_name && flag_index) { flag_nodeNameLine = true };
				if( noLine <= 1 ) { flag_nodeNameLine = true };
				noLine = noLine - 1;
			}
		);
		// "CurrentNode || %[%] ".format(currentNodeName, currentNodeIndex).postln;

		^[currentNodeName,currentNodeIndex];
	}
}