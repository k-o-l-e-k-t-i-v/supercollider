
// test

//  4) composerTrack_A - own scheduling of single track //////////////////////////////////
(

Tdef(\Track_C, {
	~tc.sched(15, {
		"composerTrack_C - sec15 - play".postln;
		Pdef(\seqDrum).play;
	});
	~tc.sched(25, {
		"composerTrack_C - sec25 - stop".postln;
		Pdef(\seqDrum).stop;
	});
});
)
//  4) composerTrack_C - end of file /////////////////////////////////////////////////////



