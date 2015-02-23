(
Pdef(\aaa,
	Pbind(\dur, 4, \legato, 0.6, \amp, 0.3, \octave,3, \degree, Pseq([2,2,3,4], inf)),
);
)
(
Pdef(\bbb,
	Pbind(\dur, 0.5, \legato, 0.2, \amp, 0.3, \octave,5, \degree, Pseq([7,2,3,4], inf))
);
)

(
var pdef, rout;
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
	("pdef.asStream : " ++ pdef.asStream).postln;
	"\n".postln;

	rout = pdef.asStream;

	// pdef[0].at(\dur);
};


("~id.at(\bbb).source.patternpairs : " ++ ~id.at(\bbb).source.patternpairs);
)