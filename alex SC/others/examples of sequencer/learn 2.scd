(
ProxySynthDef(\sin, {
	arg freq, amp, sustain, gate=1;
	var env=EnvGen.kr(Env.adsr(),gate,timeScale:sustain,doneAction:2);
	var sig=SinOsc.ar(freq!2)*env*amp;}).add;
ProxySynthDef(\saw, {
	arg freq, amp, sustain, gate=1;
	var env=EnvGen.kr(Env.adsr(),gate,timeScale:sustain,doneAction:2);
	var sig=LFSaw.ar(freq!2)*env*amp;}).add;
ProxySynthDef(\saw, {
	arg amp, sustain, gate=1;
	var env=EnvGen.kr(Env.adsr(),gate,timeScale:sustain,doneAction:2);
	var sig=WhiteNoise.ar(amp)*env;}).add;
)

(
~sin[0]=Pbind(\instrument
