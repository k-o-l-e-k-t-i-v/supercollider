MIDIClient.init;
MIDIIn.connectAll;
(
MIDIdef.noteOn(\noteOnTest, {
	arg vel, nn, chan, src;
	[vel, nn, chan, src].postln;
	{
		var sig, env;
		sig=SinOsc.ar(nn.midicps*20)!2;
		env=EnvGen.kr(Env.perc(vel.linexp(1,127,0.03,0.01),vel.linexp(1,127,2,0.1)), doneAction:2);
		sig=sig*env*vel.linexp(1,127,0.1,0.8);

	}.play;
});
)

QuarksGui.new;
(
SynthDef.new(\tone,
	{
		arg freq=440, amp=0.5, gate=0;
		var sig, env;
		sig=SinOsc.ar(freq!2);
		env=EnvGen.kr(Env.adsr,gate, doneAction:2);
		sig=sig*env*amp;
		sig=GVerb.ar(sig,revtime:0.2);
		Out.ar(0, sig);
}).add;
)

(
MIDIdef.noteOn(\noteOnTest, {
	arg vel, nn, chan, src;
	[vel, nn, chan, src].postln;
	~notes[nn]=Synth(\tone,
		[
			\freq, nn.midicps*5,
			\amp, vel.linexp(1,127, 0.3,0.9),
			\gate,1
	]);
});
)


(
MIDIdef.noteOff(\noteOffTest, {
	arg vel, nn;
	[vel, nn].postln;

	~notes[nn].set(\gate, 0);
	~notes[nn]=nil;
});
)


(
MIDIdef.cc(\knob1,{
	arg cc1;
	cc1.postln;},1
);
)


MIDIdef.freeAll;
~notes=Array.newClear(128);