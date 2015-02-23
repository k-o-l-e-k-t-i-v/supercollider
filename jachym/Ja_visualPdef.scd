(
Pdef(\aaa,
	Pbind(\dur, 4, \legato, 0.6, \amp, 0.3, \octave,3, \degree, Pseq([2,2,3,4], inf)),
);

Pdef(\bbb,
	// Pmono(\default, \dur, 0.5, \amp, 0.3, \octave,5, \degree, Pseq([7,2,3,4], inf))
	Pbind(\amp, 0.3, \dur, 0.5, \octave, 5, \degree, Pseq([7,2,3,4], inf))
);
/*
Pdef(\ccc,
Ppar([
Pbind(\dur, 4, \legato, 0.6, \amp, 0.3, \octave,3, \degree, Pseq([2,2,3,4], inf)),
Pbind(\dur, 7, \legato, 1.6, \amp, 0.1, \octave,3, \degree, Pseq([8,7], inf))
], inf)
);
*/
)

(
var pbind, rout;
~id = IdentityDictionary.new;
~id = Pdef.all;
~id.do{|pdef|
	("pdef : " ++ pdef).postln;
	("pdef.source : " ++ pdef.source).postln;
	("pdef.pattern : " ++ pdef.pattern).postln;
	("pdef.player : " ++ pdef.player).postln;
	("pdef.key : " ++ pdef.key).postln;
	("pdef.condition : " ++ pdef.condition).postln;
	("pdef.source.patternpairs : " ++ pdef.source.patternpairs).postln;

	pbind = pdef.source;
	("pbind.patternpairs.size : " ++ pbind.patternpairs.size).postln;
	("pbind.indexOf(\dur) : " ++ pbind.patternpairs.indexOf(\dur)).postln;
	("pbind.val(\dur) : " ++ pbind.patternpairs.at(pbind.patternpairs.indexOf(\dur) + 1).source).postln;
	("pbind.val(\degree) : " ++ pbind.patternpairs.at(pbind.patternpairs.indexOf(\degree) + 1).source).postln;

	"\n".postln;

	("pbind.asStream : " ++ pdef.player.routine).postln;
	rout = pdef.player.routine;

	pdef.player.event.do{|i|
		i.postln;
	};



	// pbind.collect({ |ev| ev.postln; }).play;
	pbind.collect({ |ev| ("ev : " ++ ev).postln;});
};

// ~id.at(\bbb).source.postln;
// ("~id.at(\bbb).source.patternpairs : " ++ ~id.at(\bbb).source.patternpairs);
)