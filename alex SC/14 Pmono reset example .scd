

(
SynthDef( \test, {
	arg freq=65;
	Out.ar(0,VarSaw.ar(freq,0, 0.2, 0.5)*Pulse.kr([1,2,3,5,8,13,21],0.5));
	}
).add;
)


(
x=Pdef( \looptest, {
	Pmono(
		\test,
		\dur, Pseq([2,4],inf),
		\freq, Pseq([65,185],inf)
		//\legato, 1
)}).reset.fadeTime=1;
)
x.stop;
x.play;

	