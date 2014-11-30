{l=LFNoise2;
	GVerb.ar(i=GrainSin.ar(
		2,Impulse.ar(16),l.kr(1).range(0.0025,0.02),l.kr(1/8).range(400,1200.0),l.kr(1/2)),99,5)*0.5+i*0.5}.play



