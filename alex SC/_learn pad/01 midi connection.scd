MIDIClient.init;
MIDIIn.connectAll;
MIDIIn.free;
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
MIDIdef.cc(\knob,{
	arg ...args;
	args.postln;},(1..12)
);
)

MIDIdef.cc(\test1, {arg ...args; args.postln}, 1); // match cc 1
MIDIdef.cc(\test2, {arg ...args; args.postln}, 1, 1); // match cc1, chan 1
MIDIdef.cc(\test3, {arg ...args; args.postln}, (1..20)); // match cc 1-10
MIDIdef.noteOn(\test4, {arg ...args; args.postln}); // match any noteOn


MIDIdef.freeAll;
~notes=Array.newClear(128);








////////////////

p=ProxySpace.push(s);

(

~x.play;
~x[0]={
	var sig, env;
	sig=LFSaw.ar(\freq.kr(200)).lag(0.02);
	env=EnvGen.kr(Env.adsr,\gate.kr(0),doneAction:2);
	sig=sig*env;
});

(
MIDIdef.noteOn(\noteon1, { arg vel, num, src, chan;
	[vel, num, chan,src].postln;
	~x[1]=\set->Pbind(\args, [\freq],\freq, 500);
	~x[2]=\set->Pbind(\args, [\gate],\gate, 1);
	// ~x.set(\gate, 1);
 } );
)

(
MIDIdef.noteOff(\noteOff1, {arg vel, num, src, chan;
	[vel, num, chan, src].postln;
	~x[2]=\set->Pbind(\args, [\gate],\gate, 0);
	// ~x[2]=nil;
});
)



/////////////////




(
~bum.play;
~bum[0]={
	var sig, env, fenv;
	env=EnvGen.kr(Env.adsr,\gate.kr(0));
	fenv=EnvGen.kr(Env([\freq.kr,\freq.kr*\velo.kr,\freq.kr], [0.01,0.04]),\gate.kr(0));
	sig=SinOsc.ar(fenv+fib(10).reciprocal,add:GrayNoise.ar([0.01,0.03]));
	sig=sig*env;
});

(MIDIdef.noteOn(\noteon1, { arg vel, num, src, chan;
	[vel, num, chan,src].postln;
	if (num!= 48,
	    {~bum[1]=\set->Pbind(\args, [\freq],\freq, num.midicps*1.5);
		~bum[2]=\set->Pbind(\args, [\gate],\gate, 1);
		~bum[3]=\set->Pbind(\args, [\velo],\velo, vel/10)
		}
)});)


MIDIdef(\noteOff).free;
(MIDIdef.noteOff(\noteOff1, {arg vel, num, src, chan;
	~bum[2]=\set->Pbind(\args, [\gate],\gate, 0);
});)


(MIDIdef.cc(\knob1,{
	arg cc, val;
	[cc, val].postln;
	~bum[30]=\filter->{arg in; Limiter.ar(GVerb.ar(in,val,revtime:8),1)};}
,(3,9),);
)


(MIDIdef.cc(\knob2,{
	arg cc, val;
	[cc, val].postln;
	~bum[31]=\filter->{arg in; LPF.ar(in,val.linexp(0,127,400,1600))};}
,9);
)