(
SynthDef(\checkTone, { |freq = 440, dur = 0.1, vol = 0.2|
	var env = EnvGen.ar(Env([0,vol,0],[0.1*dur, 0.9*dur],\sin),doneAction:2);
	var toneL = SinOsc.ar(freq+SinOsc.kr(1,0,0.5,0.5).range(-60,0),0,env);
	var toneR = SinOsc.ar(freq+SinOsc.kr(1,3pi,0.5,0.5).range(0,60),0,env);
	Out.ar(0, [toneL,toneR]);
}).add;

SynthDef(\beat1, { |freq = 665, dt = 0.2, vol = 0.2, ffreq = 1100|
	var tone, env, noise;
	env = EnvGen.ar(Env([0,vol,0], [0.1 *dt, 0.9*dt]), doneAction: 2);
	noise = ((LFSaw.kr(freq/4)) * SinOsc.kr(freq/4, 0, 0.35, 0.6)).range(0.6,1.1);
	tone = SinOsc.ar([freq, freq + 2],[0, 0.1pi, 0.2pi],env*noise);
	tone = HPF.ar(tone, ffreq);

	Out.ar(0, tone ! 2);
}).add;

SynthDef(\bass, { |freq = 440, gate = 1, amp = 0.5, slideTime = 0.17, ffreq = 1100, width = 0.15, detune = 1.005, preamp = 4|
	var tone,
	env = Env.adsr(0.01, 0.3, 0.4, 0.1);
	freq = Lag.kr(freq, slideTime);
	tone = Mix(VarSaw.ar([freq, freq * detune], 0, width, preamp)).distort * amp	* EnvGen.kr(env, gate, doneAction: 2);
	tone = LPF.ar(tone, ffreq);
	Out.ar(0, tone ! 2)
}).add;

SynthDef(\toneSin, { |freq = 100, dt = 1, vol = 0.02|
	var tone, env;
	env = EnvGen.ar(Env([0,vol, vol*0.4, vol*0.8, 0],[0.1*dt, 0.3*dt, 0.1*dt, 0.5*dt]),doneAction:2);
	tone = SinOsc.ar(freq, 0, env);

	Out.ar(0, tone ! 2);
}).add;
)

Tdef(\mainLoop).play;
Tdef(\mainLoop).stop;
TempoClock.default.tempo = 1;  // 2 beats/sec, or 120 BPM
(

Tdef(\mainLoop).quant = 24.0;
Tdef(\mainLoop, {
	~startT = thisThread.seconds;
	//~toneSeq = Pseq([0,10,30,20],inf).asStream;

	loop {
		var timeNow = TempoClock.default.beats;
		//"Time is now: ".post; timeNow.postln;
		//var valFreq = ~toneSeq.next;


		TempoClock.default.schedAbs(timeNow + 0,{Pdef(\toneLoop).fork;});
		TempoClock.default.schedAbs(timeNow + 0,{Pdef(\drumLoop).fork;});
		TempoClock.default.schedAbs(timeNow + 0.25,{Pdef(\drumLoop2).fork;});
		TempoClock.default.schedAbs(timeNow + 0.5,{Pdef(\drumLoop2).fork;});
		TempoClock.default.schedAbs(timeNow + 0.75,{Pdef(\drumLoop).fork;});

		TempoClock.default.schedAbs(timeNow + 0,{Synth(\checkTone,[\freq, 600,\dur,0.28, \vol, 0.08]);});
		TempoClock.default.schedAbs(timeNow + 6,{Synth(\checkTone,[\freq, 550,\dur,0.28, \vol, 0.08]);});
		TempoClock.default.schedAbs(timeNow + 12,{Synth(\checkTone,[\freq, 500,\dur,0.28, \vol, 0.08]);});
		TempoClock.default.schedAbs(timeNow + 18,{Synth(\checkTone,[\freq, 700,\dur,0.28, \vol, 0.08]);});
		24.wait;

		postf("seconds: % , delay: % \n", (thisThread.seconds - ~startT) ,((thisThread.seconds - ~startT)%6.0));
	}
});
)

(
Pdef(\toneLoop).fadeTime = 6.0;
Pdef(\toneLoop, {
	var loopCnt = 4;
	//valF.postln;
	Pbind(
		\instrument, \toneSin,
		\freq, Pseq([780,765,772,775, 690,675,682,685, 810,795,802,805, 900,985,992,995]),
		\dur, Pseq([2.75, 0.35, 1.75, 1],loopCnt),
		\vol, Pseq([0.05,0.08,0.05,0.05],loopCnt),
		\dt, Pseq([2.85, 1.75, 2.85, 3.65],loopCnt),
	);
}).play(quant:24);


Pdef(\drumLoop, {
	var loopCnt = 4;
	Pbind(
		\instrument, \bass,
		\freq, Pseq([120,122,120,124,125,126],loopCnt),
		\dur, Pseq([1, 1, 1, 1, 1.05, 1.2],loopCnt),
		\vol, Pseq([0.2,0.3],3*loopCnt),
		\dt, Pseq([0.85, 0.75, 0.65, 0.85, 0.3, 0.65],loopCnt),
		\detune, 1.01,
		\ffreq, Pseq([1100,900,700,500,800,1000],loopCnt)
	);
}).play(quant:24);

Pdef(\drumLoop2, {
	var loopCnt = 4;
	Pbind(
		\instrument, \beat1,
		\freq, 95,
		\dur, Pseq([0.5,0.5,0.5,0.35,0.15, 0.5,0.25,0.5,0.5,0.25, 0.5,0.5,0.5,0.25,0.25],loopCnt),
		\vol, Pseq([0.18,0.15,0.13,0.14,0.16],3*loopCnt),
		\dt, Pseq([0.15, 0.15, 0.15, 0.3, 0.1],3*loopCnt),
		\ffreq, Pseq([270,230,170,130,90],3*loopCnt)
	);
}).play(quant:24);

)



