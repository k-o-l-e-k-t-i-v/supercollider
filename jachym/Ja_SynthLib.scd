s.scope(2);
FreqScope();
(

//////// DRUMS synths ///////////////////////////////////////////////////

SynthDef(\DrumA, { |out = 0, gate = 1, amp = 1, freq = 50, sustain = 0.9|
	var tone, osc, aEnv, fEnv;
	aEnv = EnvGen.kr(Env.adsr(0.15*sustain, 0.35*sustain, 0.6, 0.5*sustain),gate);
	fEnv = EnvGen.kr(Env([Rand(600,700),freq,0.01],[0.03*sustain, 0.97*sustain],\exp));
	osc = SinOsc.ar([fEnv,fEnv],0,amp);
	tone = osc * aEnv;
	tone = LPF.ar(tone,fEnv + 700);
	tone = FreeVerb.ar(tone*0.5,0.8,0.5,0.5, 1,tone*0.5);
	DetectSilence.ar(tone,doneAction:2);
	Out.ar(out, tone);
}).store;

SynthDef(\DrumB, { |out = 0, gate = 1, amp = 1, freq = 50, sustain = 0.9|
	var tone, osc, aEnv, fEnv;
	aEnv = EnvGen.kr(Env.adsr(0.4*sustain, 0.2*sustain, 0.35, 0.4*sustain),gate);
	fEnv = EnvGen.kr(Env([Rand(1800,2000),freq,0.01],[0.03*sustain, 0.97*sustain],\exp));
	osc = SinOsc.ar([fEnv*1.01,fEnv*(-1.01)],0,amp)*LFPulse.ar([fEnv+10,fEnv-10],0,0.5,1);
	tone = osc * aEnv;
	tone = FreeVerb.ar(tone*0.5,0.45,0.25,0.5, 1, tone*0.5);
	tone = LPF.ar(tone,fEnv + 100);
	DetectSilence.ar(tone,doneAction:2);
	Out.ar(out, tone);
}).store;

SynthDef(\DrumC, { |out = 0, gate = 1, amp = 1, freq = 90, sustain = 0.5|
	var tone, osc, aEnv, fEnv;
	aEnv = EnvGen.kr(Env.adsr(0.03*sustain, 0.45*sustain, 0.5, 0.52*sustain),gate);
	fEnv = EnvGen.kr(Env([Rand(1700,1900),freq,0.01],[0.05*sustain, 0.95*sustain],\exp));
	osc = SinOsc.ar([fEnv-10,fEnv+10],0,amp)*Pulse.ar([fEnv+10,fEnv-10],0.9,1);
	tone = osc * aEnv;
	tone = LPF.ar(tone,fEnv + 100);
	tone = FreeVerb.ar(tone*0.5,2,0.5,0.5, 1, tone*0.5);
	DetectSilence.ar(tone,doneAction:2);
	Out.ar(out, tone);
}).store;

SynthDef(\DrumD, { |out = 0, gate = 1, amp = 1, freq = 90, sustain = 0.5|
	var tone, osc, aEnv, fEnv;
	aEnv = EnvGen.kr(Env.adsr(0.05*sustain, 0.3*sustain, 0.4, 0.65*sustain),gate, doneAction:2);
	fEnv = EnvGen.kr(Env([Rand(freq*10,freq*11),freq,1],[0.09*sustain, 0.6*sustain],\exp));
	osc = SinOsc.ar([freq-1, freq+1],0,amp)*SinOsc.ar([fEnv+10,fEnv-10],pi,amp);
	tone = osc * aEnv;
	tone = LPF.ar(tone,fEnv + 400);
	Out.ar(out, tone);
}).store;

SynthDef(\DrumE, { |out = 0, gate = 1, amp = 1, freq = 90, sustain = 0.5|
	var tone, osc, aEnv, fEnv, num;
	aEnv = EnvGen.kr(Env.adsr(0.05*sustain, 0.1*sustain, 0.1, 0.85*sustain),gate);
	num = 5;
	osc = Mix.fill(num, {|i|
		fEnv = EnvGen.kr(Env([Rand(600/num*i,900/num*i),freq,0.01],[0.05*sustain, 0.91*sustain],\exp));
		SinOsc.ar([fEnv-i,fEnv+i],(1/num)*pi*i,amp/num)
	});
	tone = osc * aEnv;
	tone = AllpassC.ar(tone*0.5,sustain*0.1,sustain*0.5,sustain*2, 1, tone*0.5);
	tone = LPF.ar(tone,fEnv + 100);

	DetectSilence.ar(tone,doneAction:2);
	Out.ar(out, tone);
}).store;

//////// TICKS synths ///////////////////////////////////////////////////

SynthDef(\TickA, { |out = 0, gate = 1, amp = 1, sustain = 1|
	var aEnv, fEnv, tone;
	aEnv = EnvGen.ar(Env.asr(3/16*sustain, amp, 13/16*sustain),gate);
	fEnv = EnvGen.ar(Env([Rand(12000, 16000),0.001], [1/32*sustain],\exp));
	tone = WhiteNoise.ar(Rand(0.4, 0.8),0.2)!2;
	tone = HPF.ar(tone*aEnv, fEnv);
	tone = FreeVerb.ar(tone*0.5,0.8,0.5,0.5, 1,tone*0.5);
	DetectSilence.ar(tone,doneAction:2);
	Out.ar(out, tone);
}).store;

SynthDef(\TickB, { |out = 0, gate = 1, freq = 1000, amp = 1, sustain = 1|
	var env, tone;
	env = EnvGen.ar(Env.asr(1/16*sustain, amp, 15/16*sustain),gate,doneAction:2);
	tone = LFSaw.ar([freq-0.005, freq+0.005],0,0.2+WhiteNoise.ar(Rand(0.3, 0.8)));
	tone = HPF.ar(tone, Rand(2000, 16000));
	tone = AllpassC.ar(tone, sustain, 0.2, 0.5, env, tone*env);
	Out.ar(out, tone);
}).store;

//////// SAWS synths ///////////////////////////////////////////////////

SynthDef(\SawA, { |out = 0, gate = 1, amp = 1, freq = 90, sustain = 0.5|
	var tone, osc, aEnv, fEnv;
	aEnv = EnvGen.kr(Env.asr(0.95*sustain, 1, 0.05*sustain),gate);
	fEnv = EnvGen.kr(Env([freq,freq,Rand(freq*7,freq*9),1],[0.7*sustain, 0.15*sustain,0.15*sustain],\welch));
	osc = LFSaw.ar([fEnv+1,fEnv-1],0,amp)*LFPulse.ar([fEnv+1,fEnv-1],0,0.9,amp);
	tone = osc * aEnv;
	tone = AllpassC.ar(tone*0.5,sustain*0.1,sustain*0.0625,sustain/2, 1, tone*0.5);
	tone = LPF.ar(tone,fEnv + 300);
	DetectSilence.ar(tone,time:sustain*0.1,doneAction:2);
	Out.ar(out, tone);
}).store;

//test////////////////////////
SynthDef(\SawB, { |out = 0, gate = 1, sustain = 1, freq = 150, amp = 0.2|
	var osc, tone, num, fEnv, aEnv;
	num = 2;
	aEnv = EnvGen.kr(Env.asr(0.35*sustain, amp, 0.65*sustain,4),gate, doneAction:2);
	fEnv = LFSaw.kr([Rand(freq*2-0.8,freq*2+0.2),Rand(freq*2-0.2,freq*2+0.8)],0,0.8,0.2);
	osc = Mix.fill(num, { |i| LFSaw.ar(fEnv,0.1*i, SinOsc.kr(freq,0,SinOsc.kr(freq/2,0,0.8/num),0.2/num))*LFPulse.ar(freq*1.5,0.01*i,0.8,0.7/num,0.3/num)});
	tone = osc * aEnv;
	tone = LPF.ar(tone, fEnv+1800);
	Out.ar(out, Pan2.ar(tone,SinOsc.kr(2,0,0.7)));
}).add;

//////// SINS synths ///////////////////////////////////////////////////

SynthDef(\SinA, { |out = 0, gate = 1, freq = 130, amp = 1, sustain = 1|
	var osc, aEnv,fEnv, num;
	num = 5;
	osc = Mix.fill(num, {|i|
		fEnv = Line.kr(1,0.6,(0.85+(0.01*i))*sustain);
		SinOsc.ar([freq+(i*0.001), freq-(i*0.001)],0,1/num)*SinOsc.ar([16,16.01]+(0.005*i),0.005*i,0.9,fEnv)});
	aEnv = EnvGen.ar(Env.adsr(0.1*sustain,0.3*sustain,0.6,0.6*sustain),gate,doneAction:2);
	osc = osc * aEnv * amp;
	Out.ar(out, osc);
}).store;

SynthDef(\SinB, { |out = 0, gate = 1, freq = 130, amp = 1, sustain = 1|
	var osc, aEnv, num;
	aEnv = EnvGen.kr(Env([0,1,0.3,0.5,0.2,0.4,0],[0.5*sustain,0.01*sustain,0.19*sustain,0.01*sustain,0.29*sustain],\welch),gate,amp,doneAction:2);
	num = 21;
	osc = Mix.fill(num, {|i| SinOsc.ar([freq+(0.005*i),freq-(0.005*i)],0.0001*i,1/num*VarSaw.kr([63,64],0.0001*i,0.1,0.7,0.3))});
	osc = LPF.ar(osc,freq+800,osc);
	osc = AllpassC.ar(osc,0.2,0.2,1,1,osc)*aEnv;
	Out.ar(out, osc);
}).store;

//////// EFX synths ///////////////////////////////////////////////////



)