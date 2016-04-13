
(
fork{
var paths = PathName("/home/kof/annex/kof/").files;
	paths.do({arg item;
		var filename = item.fullPath;
		("rendering"+filename).warn;
		s.prepareForRecord((filename++".aiff"));
		(filename).loadPath;
		SystemClock.sched(0, {s.record;});
		SystemClock.sched(60,{s.stopRecording;});
		SystemClock.sched(61,{s.freeAll;});
		62.wait;
	});
}
)



/*
(x[0].pathOnly++x[0].fileName).postln
s.prepareForRecord(("/home/kof/recordings/"++filename++".aiff"));
("/home/kof/annex/kof/"++filename).loadPath;
s.record;
*/
