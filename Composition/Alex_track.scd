
//  2) composerTrack_A - own scheduling of single track //////////////////////////////////
(







Tdef(\Track_A, {
	~tc.sched(0, {
		"composerTrack_A - sec0 - play".postln;
		Pdef(\looplo).play;
	});
	~tc.sched(30, {
		"composerTrack_A - sec30 - stop".postln;
		Pdef(\looplo).stop;
	});
}).play;

 ~composition.value(True,True,True).play;
);
//  2) composerTrack_A - end of file /////////////////////////////////////////////////////

