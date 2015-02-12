MakeSynth {
	classvar <global;
	var <efxPath, <dict;


	*new { |efxPath|
		^super.newCopyArgs(efxPath).init;
	}
	init {
		// ("global: " ++ this.filenameSymbol.asString.dirname +/+ "Efx").postln;

		dict = IdentityDictionary.new;
		efxPath = Platform.systemExtensionDir ++ "\/JMix\/Efx\/";
		("Efx path: " ++ efxPath).postln;
		("Efx path2: " ++ efxPath.dirname).postln;

		(efxPath ++ "*.scd").pathMatch.do{ |apath|
			// Lazy loading - ignore the file contents for now
			dict.put(apath.basename.splitext[0].asSymbol, 0); // we put "0" because can't actually put nil into a dictionary...
			apath.postln;
		};

	}

	*initClass {
		// adresa slozky
		StartUp.add{
			global = this.new(this.filenameSymbol.asString.dirname ++ "\/Efx")
		}

	}

	*at { |key|
		^global.at(key)
	}
	at { |key|

		// Lazy loading
		if(dict[key]==0){
			dict[key] = thisProcess.interpreter.compileFile("%\/%.scd".format(efxPath, key)).value;
			("thisProcess.interpreter.compileFile: %\/%.scd".format(efxPath, key) ++ " - key: " ++ key).postln;
		};
		^dict[key]
	}
	scanAll { // Unlazy
		dict.keysDo{|key|
			this[key];
			("scanAll: " ++ key).postln;
		}
	}

	*gui {
		^global.gui
	}
	gui {
		var w, win, list, listview, wrect, startButton, aSynth;
		Server.default.waitForBoot{
			this.memStore;
			"after this.memStore".postln;

			win = Window.new("MakeSynth", Rect(400,400,500,100));
			win.alwaysOnTop_(true);
			win.front;

			list = dict.keys(Array);
			list.sort;
			("list: " ++ list).postln;

			wrect = win.view.bounds;
			listview = GUI.popUpMenu.new(win, wrect.copy.width_(wrect.width/2 - 75).height_(50).insetBy(5, 15)).items_(list);
			("listview: " ++ listview).postln;

			// add a button to start and stop the sound.
			startButton = GUI.button.new(win, Rect(listview.bounds.right+10, listview.bounds.top, 65, listview.bounds.height))
			.states_([
				["Start", Color.black, Color(0.5, 0.7, 0.5)],
				["Stop", Color.white, Color(0.7, 0.5, 0.5)]
			]).action_{|widg|
				if(widg.value==0){
					if(aSynth.notNil){aSynth.free; aSynth=nil };
				}{
					aSynth = Synth(listview.item);
					("listview.item : " ++ listview.item).postln;
					("aSynth : " ++ aSynth).postln;

					OSCresponderNode(Server.default.addr, '/n_end', { |time, resp, msg|
						if(aSynth.notNil and: {msg[1]==aSynth.nodeID}){
							// Synth has freed (itself?) so ensure button state is consistent
							{startButton.value=0}.defer;
						};
					}).add.removeWhenDone;
				}
			};
		}
	}
	*memStore { |libname=\global, completionMsg, keepDef = true|
		^global.add(libname, completionMsg, keepDef)
	}
	memStore { |libname=\global, completionMsg, keepDef = true|
		"memStore...".postln;
		this.scanAll;
		dict.do{|def|
			def.add(libname, completionMsg, keepDef);
			("def.add: " ++ def).postln;};
	}
}