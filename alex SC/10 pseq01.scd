
s.scope(2);

{SinOsc.ar(900)*Pulse.kr(5)}.play
{ VarSaw.ar(10, 1, 0.1) }.play
{ LFSaw.ar(10, 1, 0.1) }.play
{ Saw.ar(10, 1, 0.1) }.play





//soft
(
SynthDef( \soft,
	{ arg  freq=75, sustain=0.005, vol=0.2;
		var env, tone;
		env=EnvGen.kr(Env.linen(0.02, sustain, 0.2), doneAction:2);
		tone=Splay.ar((SinOsc.ar([freq,freq+2,freq+1,freq+4],[0,1/2pi]* env)!4),1,0.2);
		tone=FreeVerb.ar(tone,0.1,0.2,0.1,vol);
		Out.ar(0, tone )
}).play;
)

///sonar
(
SynthDef( \sonar,
	{ arg freq=4100, sustain=0.25, freqPulse=3, pan=(-1) ;
		var env, tone;
		env=EnvGen.kr(Env.linen(sustain, sustain, 0.2, 0.1), doneAction:2);
		tone= SinOsc.ar(freq, 0, 0.2)*Pulse.kr(freqPulse)*env;
		tone=Pan2.ar(tone, pan, 0.7);
		Out.ar(0,tone);
}).play;
)

//steps
(
SynthDef( \steps,
	{ arg freq=2,pan=1, times=0.5;
		var step, env;
		step=PinkNoise.ar(freq,0,0.5)*Impulse.kr(freq,0,0.5);
		step=FreeVerb.ar(step, 0.2);
		step=Pan2.ar(step, pan,1);
		env=EnvGen.kr(Env.linen(0.01,times,0.01), doneAction:2);
		step=step*env;
		Out.ar(0,step);
}).play;
)


//roarrr
(
SynthDef(\roar,
	{ arg  sustain=2, freq=65;
		var env, tone;
		env=EnvGen.kr(Env.perc(0.1, sustain, 0.2), doneAction:2);
Out.ar(0,FreeVerb.ar((SinOsc.ar([freq,freq+10])*Pulse.kr([15,22]))*env,0.3,0.2,0.2,1)
)}).play;
)

///////////////////////////////////////////////////////////////////////
(

Pdef(\loopSonar, {
	Pbind(
		\instrument, \sonar,
		\freq, Pseq([4000,4000,6000,4000,4000,4000,7000,7000],inf),
		\dur, Pseq([0.2,0.2],inf),

		\pan, Pseq([-1,1,0.2,0.3,-0.2,1,-1,1,-1],inf),

	)
}).play(quant:1);


//////


Pdef( \loopSteps, {
	Pbind(
		\instrument, \steps,
		\freq, 1,
		\times, Pseq([0.5,0.1,0.2,0.2],inf),
		\dur, Pseq([0.01,0.08,0.01,0.01,0.08,0.08],inf),
		\pan, Pseq([Pseq([1,-1,1,0.2,-0.2,0,-1,1,1,1],inf)],inf),
	)
}).play(quant:2);


//////


Pdef(\loopRoar, {
	Pbind(
		\instrument, \roar,
		\freq, Pseq([0,65],inf),
		\dur, Pseq([1.8, 1.8,Rest(1.8)],inf),
	)
}).play(quant:1);


//////


	Pdef(\loopSoft, {
		Pbind(
			\instrument, \soft,
			\freq, Pseq([75,75,95,75],inf),
			\dur, Pseq([0.42,0.42,0.22,0.42],inf),
		\vol, Pseq([Pseries(0.2,0.1,10)], inf),
		)
	}).play(quant:1);

)