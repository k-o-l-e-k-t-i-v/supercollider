
(
Ndef(\inp).quant = 2.0;
Ndef(\inp).fadeTime = 2.0;

Ndef(\inp,{
	~f1 = [44,44.1*2,45*3,45*1.25]*1pi+LFNoise0.kr(8!4).lag(1).range(-4,4);
	~f2 = [44,44.1*1.5,45*2,45*1.5]*0.5pi+LFNoise0.kr(8!4).lag(1).range(-4,4)+LFSaw.ar(11/[1,2,3,5]).range(-5,10000).lag(0.0001);
	Splay.ar(
		Pan2.ar(
			AllpassC.ar(

				SinOsc.ar(~f1.scramble.lag(1),(~f2/102.40).range(-pi,pi),mul:0.233) + LFSaw.ar(~f2,mul:0.233).lag(0.00001+SinOsc.ar([0.01,0.03,0.02,0.041]*1/4/[1,2,3,5,8]).range(0.00001,0.02)) * LFSaw.ar(1/4/[1,2,3,5,8]).squared
				,3,0.033,4)
			,SinOsc.ar(1.1))
)}).play;
)