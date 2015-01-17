(
SynthDef(\TickA, { |out, freq = 100, amp = 0.1, dt = 0.08|
	var env, tone;
	env = EnvGen.ar(Env.perc(1/16*dt, 15/16*dt, amp),doneAction:2);
	tone = WhiteNoise.ar(Rand(0.9, 1.1)!2)*env;
	tone = HPF.ar(tone*env, Rand(1600, 2000));
	tone = AllpassC.ar(tone, 1.55, 0.2, 0.5, 1, tone);
	DetectSilence.ar(tone,0.001, doneAction:2);
	Out.ar(out, tone);
}).add;

SynthDef(\DrumA, { |freq = 50, amp = 0.3, dt = 0.3, room = 2|
	var env, tone;
	env = EnvGen.ar(Env.perc(0.1*dt, 0.9*dt, amp),doneAction:2);
	tone = SinOsc.ar(freq+Rand(-5.0,5.0))*env;
	tone = FreeVerb.ar(tone,0.33,room,0.5, 1, tone);
	Out.ar(0, Splay.ar(tone));
}).add;

SynthDef(\SawA, { |out, freq = 150, dt = 1, amp = 0.2, shift = 0|
	var env, tone, num;
	num = 10;
	env = EnvGen.ar(Env([0,amp,0],[0.9*dt, 0.1*dt]),doneAction:2);
	tone = Mix.fill(num, { |i| LFSaw.ar([freq,freq+2],shift*i,env/num)});
	tone = LPF.ar(tone, Rand(600, 1000));
	Out.ar(out,tone);
}).add;

SynthDef(\SawB, { |out, freq = 150, ffreq = 4, amp = 0.2, lpf = 400, shift = 0.001|
	var tone, env, num, vol;
	num = 4;
	vol = LFSaw.kr(ffreq,0,0.65,0.3);
	tone = Mix.fill(num, { |i|
		VarSaw.ar(Rand(freq-20,freq+20), shift*i ,1, vol/num*amp,0)
	});
	tone = LPF.ar(tone, lpf);
	Out.ar(0, Pan2.ar(tone,SinOsc.kr(1,0,0.7)));
}).add;

SynthDef(\SinB, { |out, freq = 150, dt = 1, amp = 0.2|
	var tone, env, num;
	num = 25;
	env = EnvGen.ar(Env.linen(0.3*dt,0.4*dt,0.3*dt, amp, \sin));
	tone = Mix.fill(num, {
		|i| SinOsc.ar(freq+Rand(-5.0,5.0),0.05*i,0.40,0.5/num)*SinOsc.kr(i/4,0.03*i,i/num)
	});
	tone = tone * env;
	DetectSilence.ar(tone , doneAction:2);
	Out.ar(0, Pan2.ar(tone,SinOsc.kr(1)));
}).add;

SynthDef(\SinC, { |out, freq = 150, amp = 0.2|
	var tone, num, vol;
	num = 6;
	vol = LFSaw.kr(freq/2,0,0.2,0.8);
	tone = Mix.fill(num, { |i|
		SinOsc.ar(freq+Rand(-15.0,15.0),SinOsc.kr(i*0.001),vol/num*amp)
	});
	Out.ar(0, Pan2.ar(tone));
}).add;

SynthDef(\SignalA, { |chnl, freq = 800, amp = 0.2, at = 0.05, rt = 0.125|
	var osc1, env, tone;
	osc1 = SinOsc.ar([freq,freq+2]);
	env = EnvGen.ar(Env.perc(at, rt, amp),doneAction:2);
	tone = osc1 * env;
	tone = FreeVerb.ar(tone, 0.6,5);

	Out.ar(chnl, tone);
}).add;

SynthDef(\echo, { |chnl=0, maxdeltime=0.2, deltime=0.2, dectime=2|
	var eff, in;
	in = In.ar(chnl, 2);
	eff = CombL.ar(in, maxdeltime, deltime, dectime,1, in);
	Out.ar(0,eff);
}).add;

)