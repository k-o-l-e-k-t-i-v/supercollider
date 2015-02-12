Platform.systemExtensionDir
Platform.userExtensionDir
Quark.gui;

JMix(4).gui;
MakeSynth;
MakeSynth.gui;
MakeSynth.new.gui;

s.plotTree;

SynthDefPool.gui;

Platform.userExtensionDir;
(
var dict, efxPath, list, aSynth;

~memStore = { |libname=\global, completionMsg, keepDef = true|
	this.scanAll;
	dict.do{|def| def.add(libname, completionMsg, keepDef)};
};

~scanAll = { // Unlazy
	dict.keysDo{|key| this[key]}
};

dict = IdentityDictionary.new;
efxPath = Platform.userExtensionDir ++ "/JMix/Efx";
(efxPath ++ "/*.scd").pathMatch.do{ |xPath|
	dict.put(xPath.basename.splitext[0].asSymbol, 0);
};

dict.postln;

// this.memStore;
dict.keysDo{|key| this[key]};

dict.do{|def| def.add(\global, completionMsg, true)};

list = dict.keys(Array);
list.sort;
list[0].postln;



aSynth = Synth(list[0]);
OSCresponderNode(Server.default.addr, '/n_end', { |time, resp, msg|
	if(aSynth.notNil and: {msg[1]==aSynth.nodeID}){
		// Synth has freed (itself?) so ensure button state is consistent
		//{startButton.value=0}.defer;
	};
}).add.removeWhenDone;



/*

at { |key|
// Lazy loading
if(dict[key]==0){
dict[key] = thisProcess.interpreter.compileFile("%/%.scd".format(poolpath, key)).value;
};
^dict[key]
}


*/
)

