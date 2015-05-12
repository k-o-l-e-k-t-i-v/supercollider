(
Pdfsm(
	[
		// trackStages sequence
		Pseq([
			\intro,
			Pseq([\phase1, \phase2], 2),
			\rest,
			\phase1,
			\phase3,
			\outro
		], 1).trace(prefix:"key STAGE "),
		(
			//intro
			\intro: [ 1, Pbind(\dur, 2, \freq, Pseq([100,110],2)).trace(prefix:"state intro ") ]
		),
		(
			//track
			\phase1: [ 1, Pbind(\dur, 0.5, \freq, Pseq([800,900],2)).trace(prefix:"state phase1 ") ],
			\phase2: [ 1, Pbind(\dur, 0.25, \freq, Pseq([400,900],4)).trace(prefix:"state phase2 ") ],
			\phase3: [ 1, Pbind(\dur, 0.0625, \freq, Pseq([400,800],16)).trace(prefix:"state phase3 ") ],
			\rest: [ 1, Pbind(\dur, Pseq([Rest(1)])).trace(prefix:"state rest ") ],
			\outro: [ 2, Pbind(\dur, Pseq([0.5,0.5,1,2], inf), \freq, Pseq([100,130],2)).trace(prefix:"state outro ") ]
		),
		(
			//end
			\default: [nil]
		)

	],0,1 // startIndex, numRepeats
).play
)