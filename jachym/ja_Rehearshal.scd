// this setup make a lot of mistake, not sure about use
/*
(
p = { ProxySpace.push(s); };
CmdPeriod.add(p);
CmdPeriod.objects;
)
CmdPeriod.remove(p);
*/

p = ProxySpace.push(s);

s.plotTree;
s.scope(2);
////phase_1///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
(
~q1.play.fadeTime_(10).quant_(1);
~q1[0] = {
	var freq = 8000;
	SinOsc.ar([SinOsc.kr(1/64,0,600,freq),LFSaw.kr(1/2,0.5,4260,freq)],0, Saw.kr([1/2,1/8],0.05,0.1));
};
)
////phase_1 -> phase_2////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
(
~q1.free(10);
~q2.play.fadeTime_(2).quant_(2);

~q2[0] = { |out, freq, amp| Out.ar(out,SinOsc.ar([freq/2,freq/2],0,1) * amp/2;); };
~q2[1] = { |out, freq, amp| Out.ar(out,LFCub.ar(freq!2,0.1,1) * amp/2;); };
~q2[10] = \xset -> Pbind( \amp, 0.3,
	\dur, Pseq([0.25,0.25,1.5,0.5], inf),
	\octave, Pseq([Pn(2,8),Pn(3,7),Prand([5,8])], inf),
	\degree, Pswitch([
		Pseq([3,3,3,7]),
		Pseq([5,5,3,3]),
		Pseq([3,4,3,2]),
	], Pseq([0,1,0,2,0,1], inf));
);
~q2[30] = \filter -> {|in| LPF.ar(in, SinOsc.kr(1/16,0,1600,2000));};
)
~q2.sources;
~q2.free(4);
////phase_2 -> phase_3////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
(
~q2.release(10);
~q3.play.fadeTime_(4).quant_(2);

~q3[0] = {|gate=1, freq, sustain, amp|
	var aEnv, fEnv, osc, tone;
	aEnv = EnvGen.kr(Env.adsr(0.3*sustain,0.25*sustain,0.1,0.45*sustain),gate, doneAction:2);
	fEnv = Mix.fill(80, {|i| SinOsc.ar(800,pi/80*i,Rand(0,5));});
	osc = SinOsc.ar([freq+fEnv,freq+fEnv+10],0,0.7,Saw.ar([90,95],0.4,0.6));
	tone = osc * aEnv * amp;
};
~q3[10] = \xset -> Pbind(
	\amp, 0.35,
	\dur, Pseq([3.5,0.5,1.5,0.5], inf),
	// \legato, Pseq([1.1,1.3,0.5,1.7,0.4,0.9], inf),
	\octave, Pseq([Pn(7,4),Pn(6,2)], inf),
	\degree, Pswitch([
		Pseq([4,4,5,4]),
		Pseq([4,7,5,4]),
		Pseq([4,2,5,4])
	], Pseq([0,0,1,0,2], inf))
);
~q3[30] = \filter -> {|in| LPF.ar(in, 800);};
~q3[31] = \filter -> {|in| AllpassC.ar(in/2,0.5,0.25,4.5,1,in/2); };
)
~q3.free(10);
//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
(
Ndef(\stage6).play;
Ndef(\stage6).quant = 4;
Ndef(\stage6).fadeTime = 8;

Ndef(\stage6)[0] = { |freq = 220, amp| SinOsc.ar((freq/2)!2,0,SinOsc.kr(1/2,0,0.4), 0.6) * BrownNoise.ar(0.15,0.85) * amp/2; };
Ndef(\stage6)[1] = { |freq = 220, amp| LFSaw.ar(freq!2,0,Saw.kr(1/4,0.2), 0.8) * amp/2; };

Ndef(\stage6)[10] = \xset -> Pbind(
	\amp, 0.5,
	\dur, Pseq([Pn(4,4),2,4,2], inf),
	\octave, Pstutter([8,4,2],Pseq([5,7,4], inf)),
	\degree, Pswitch([
		Pseq([3,3b,3,7], inf),
		Pseq([3,7,6,3b], inf),
	], Pseq([0,1], inf))
);

Ndef(\stage6)[30] = \filter -> {|in| LPF.ar(in, SinOsc.kr(1/16,0,1000,1200)); };
Ndef(\stage6)[31] = \filter -> {|in| GVerb.ar(in, 220, 0.5, 0.7); };
)
Ndef(\stage6).stop(4);

(
// zpev
Ndef(\stage10).play(4);
Ndef(\stage10)[0] = { |out, freq = 150, ffreq = 4, amp = 0.2, lpf = 400, shift = 0.001|
	var tone, num, vol;
	num = 12;
	vol = LFSaw.kr([ffreq,ffreq+0.002],0,0.8,0.2);
	tone = Mix.fill(num, { |i| VarSaw.ar(Rand(freq-20,freq+20), shift+(i*0.001) ,i, vol/num,0)});
	tone = LPF.ar(tone, lpf,amp);
	Out.ar(out, Pan2.ar(tone,SinOsc.kr(1,0,0.7)));
};
Ndef(\stage10)[10] = \xset -> Pmono(
	\octave, Pstutter(Pseq([8,4], inf), Pseq([4,6], inf)),
	\degree, Pseq([3,5], inf),
	\ffreq, Prand([0.5,1,2], inf),
	\dur, Pseq([Pn(1,3),5],inf),
	\amp, Pseq([Pseries(0.35,0.005,40),Pseries(0.55,-0.005,20)],inf),
	\lpf, Prand([3500,2500,1500,1000,500],inf),
	\shift, Pseq([Pn(0,10),Pseries(0.001,0.0001,10)],inf),
).trace;
)