s.scope(2);
(
SynthDef(\morphSin, {|out = 0, gate = 1, amp = 0.3, freq = 150, sustain = 1|
	var aEnv, osc1, osc2, oEnv, tone, num;
	aEnv = EnvGen.kr(Env.adsr(0.05*sustain,0.3*sustain,0.5,0.65*sustain),gate,doneAction:2);
	oEnv = EnvGen.kr(Env([1,0.96,0],[0.3*sustain,0.7*sustain],\sin));
	osc1 = SinOsc.ar([freq-0.2,freq+0.2],0,Saw.kr(32,0,0.25,0.25));
	num = 16;
	osc2 = Mix.fill(num, { |i| SinOsc.ar(Line.kr(freq*1.2,freq-(0.5+(i*0.5)),sustain+(0.2*i))!2,0.01*i,0.5/num*Saw.kr(90,0,1)); });
	tone = Mix([osc1*oEnv,osc2*(1-oEnv)]);
	tone = FreeVerb.ar(tone,0.07,1,0.8);
	Out.ar(out, tone*aEnv);
}).add;
)

(
Pdef(\seq_morphSin,
	Ppar([
		Pbind(\instrument, \morphSin, \out, 0, \amp, 0.2,
			\dur, Pseq([3.25,0.75,4,8, Rest(4)],inf), \legato, 1.1,
			\octave, 2,
			\degree, Pswitch([
				Pseq([3,6,3,5]),
				Pseq([2,3,4,6]),
				Pseq([4,5,4,5]),
				Pseq([4,5,7,6,4,3,7])
				],Pseq([0,1,0,2,1,0,2,3],inf)
			)
		),
		Pbind(\instrument, \morphSin, \out, 0, \amp, 0.3,
			\dur, Pswitch([
				Pseq([3.25,0.75,4,8, Rest(4)]),
				Pseq([3.25,0.75,4,1.25,0.75,6, Rest(4)])
			],Pseq([0,0,1],inf)),
			\legato, 1.4,
			\octave, Pseq([Pn(4,27),Pn(5,7)],inf),
			\degree, Pswitch([
				Pseq([3,2,3,5,4,5]),
				Pseq([2,3,4,1,6,8]),
				Pseq([6,5,4,3,5,3]),
				Pseq([4,5,1,6,4,3,1])
				],Pseq([2,0,1,0,0,2,3],inf)
			)
		)
	])
).play(quant:8);
)
Pdef(\seq_morphSin).stop;

//this is very nice ^_^

// copy of Alex GAMU   ///////////////////////////////////////////////////////////////////
(
Ndef(\3).fadeTime=1;
Ndef(\3).quant=1;
Ndef(\3, {
	~long=(SinOsc.ar(95)*VarSaw.kr(5))*2;
	~long=~long*Decay2.ar(Impulse.ar(1),0.1,2,0.5);
	~long=FreeVerb.ar(~long);
}).play;
)

(
Ndef(\5).fadeTime=1;
Ndef(\5).quant=2;
Ndef(\5,  {
	~pik=WhiteNoise.ar(0.5)*Pulse.ar([0.5,1],0.2,0.5);
	~pik=LPF.ar(~pik*Decay2.ar(Impulse.ar(0.5),0.1,3),400);

	~wet=SinOsc.kr(0.25).range(0.2,2); //varies the "wetness" of the room

	~pik=FreeVerb.ar(~pik,0.5,2,~wet);
}).play;
)
Ndef(\5).clear;