List[ [ 2915.6372934, 'alex', "~d.play(vol:0.01, fadeTime:2).quant_(3);" ], [ 2906.2572802, 'alex', "~d.play(vol:0.02, fadeTime:2).quant_(3);" ], [ 2876.2472382, 'alex', "~d[2]=\\set->Pbind(\\args, [\\freq], \\dur, 4, \\octave, Pseq([[4,3],[3,5,7],[6,2,3],[3,2,6],[3,4]],inf),\\degree, [3,4,2]);" ], [ 2872.9572336, 'alex', "~d[1]=\\set->Pbind(\\args, [\\trig], \\dur, 4, \\trig, 1);" ], [ 2867.0072253, 'alex', "(~d[0]={
	var sig, env;
	
	env=EnvGen.kr(Env(times:[0.4,8],curve:[\\step, \\welch]),\\trig.tr);
	sig=LFSaw.ar(\\freq.kr!2+[1,2,3].reciprocal).lag([0.02,0.001,0.002,0.005])*LFSaw.ar([1,4,5,2,0.5].reciprocal);
	sig=sig*env;
})" ], [ 2859.6972151, 'alex', "(~d[0]={
	var sig, env;
	
	env=EnvGen.kr(Env(times:[0.4,8],curve:[\\step, \\welch]),\\trig.tr);
	sig=LFSaw.ar(\\freq.kr!2+[1,2,3].reciprocal).lag([0.02,0.001,0.002,0.005])*LFSaw.ar([1,4,5,2].reciprocal);
	sig=sig*env;
})" ], [ 2845.6271954, 'alex', "~d[30]=\\filter-> {arg in; GVerb.ar(in,[20,34],15,mul:0.23,add:in*0.1)};" ], [ 2834.3341476, 'joach', "(octave:[2,3,4,5], strum:7, amp:0.1, sustain:10).play" ], [ 2817.5411222, 'alex', "~a.clear;" ], [ 2807.7811086, 'alex', "~d[2]=\\set->Pbind(\\args, [\\freq], \\dur, 4, \\octave, Pseq([[4,3],[3,5,7],[6,2,3],[3,2,6],[3,4]],inf),\\degree, [3,4,2]);" ], [ 2802.4611011, 'alex', "~d[2]=\\set->Pbind(\\args, [\\freq], \\dur, 4, \\octave, Pseq([[4,3],[3,5,7],[6,2,3],[3,2,6],[3,4]],inf),\\degree, [3,5,2]);" ], [ 2793.4110884, 'alex', "~d[2]=\\set->Pbind(\\args, [\\freq], \\dur, 4, \\octave, Pseq([[4,3],[3,5,7],[6,2,3],[3,2,6],[3,4]],inf),\\degree, [3,8,4]);" ], [ 2784.2910757, 'alex', "~d[2]=\\set->Pbind(\\args, [\\freq], \\dur, Pseq([2,4,4],inf), \\octave, Pseq([[4,3],[3,5,7],[6,2,3],[3,2,6],[3,4]],inf),\\degree, [3,8,4]);" ], [ 2766.5110508, 'alex', "~d[2]=\\set->Pbind(\\args, [\\freq], \\dur, 2, \\octave, Pseq([[4,3],[3,5,7],[6,2,3],[3,2,6],[3,4]],inf),\\degree, [3,8,4]);" ], [ 2755.2100349, 'alex', "(~d[0]={
	var sig, env;
	
	env=EnvGen.kr(Env(times:[0.4,8],curve:[\\step, \\welch]),\\trig.tr);
	sig=LFSaw.ar(\\freq.kr!2+[1,2,3].reciprocal).lag([0.02,0.001,0.002,0.005])*LFSaw.ar([1,4,3].reciprocal);
	sig=sig*env;
})" ], [ 2743.9800192, 'alex', "~d.play(vol:0.04, fadeTime:2).quant_(3);" ], [ 2730.3119706, 'joach', "~jNoise.stop(1);" ], [ 2729.2439647, 'alex', "~d[2]=\\set->Pbind(\\args, [\\freq], \\dur, 4, \\octave, Pseq([[4,3],[3,5,7],[6,2,3],[3,2,6],[3,4]],inf),\\degree, [3,8,4]);" ], [ 2719.3919207, 'joach', "~jNoise.play(vol: 0.0, fadeTime: 18);" ], [ 2717.8339158, 'alex', "~d[2]=\\set->Pbind(\\args, [\\freq], \\dur, 4, \\octave, Pseq([[4,3],[3,5,7],[6,2,3],[3,2,6],[3,4]],inf),\\degree, [3,8,6]);" ], [ 2710.3328724, 'joach', "(
~jDrum[2] = \\set -> QuantEnv(\\fplus, 8)
.phase(1, [0,12070,0], [0.015, 0.125], [8,-8], 0, 8)
.phase(2, [0,470,0], [0.065, 0.015], [8,-8], 0, 4)
.phase(3, [0,4700,120], [0.035, 0.065], [8,-8], 0, 1)
.phase(4, [0,147,100], [0.035, 0.065], [8,-8], 0, 1)
.play([1,2,1,3,1,2,1,4]);
)" ], [ 2709.7228715, 'alex', "~a[31]=\\filter-> {arg in; LPF.ar(in,4000,add:in*0.2)};" ], [ 2706.6528672, 'alex', "~a[31]=\\filter-> {arg in; LPF.ar(in,7000,add:in*0.2)};" ], [ 2705.4168356, 'joach', "~jDrum.stop(16);" ], [ 2702.8308288, 'alex', "~a[31]=nil;" ], [ 2702.2517974, 'joach', "(
~jDrum[1] = \\set -> QuantEnv(\\amp, 4)
.phase(1, [0.2,1,0.2], [0.05, 0.95], [2,-2], 0, 1)
.phase(2, [0.2,1,0.4,0.8,0.2], [0.15, 0.35], [2,-2], 0, 1)

.play([1,2]);
)" ], [ 2694.4967522, 'joach', "(
~jDrum[1] = \\set -> QuantEnv(\\amp, 2)
.phase(1, [0.2,1,0.2], [0.05, 0.95], [2,-2], 0, 1)
.phase(2, [0.2,1,0.4,0.8,0.2], [0.15, 0.35], [2,-2], 0, 1)

.play([1,2]);
)" ], [ 2692.6567485, 'alex', "~a[30]=\\filter-> {arg in; GVerb.ar(in,20,10,mul:0.2,add:in)};" ], [ 2686.5267115, 'joach', "(
~jDrum[2] = \\set -> QuantEnv(\\fplus, 2)
.phase(1, [0,12070,0], [0.015, 0.125], [8,-8], 0, 8)
.phase(2, [0,470,0], [0.065, 0.015], [8,-8], 0, 4)
.phase(3, [0,4700,120], [0.035, 0.065], [8,-8], 0, 1)
.phase(4, [0,147,100], [0.035, 0.065], [8,-8], 0, 1)
.play([1,2,1,3,1,2,1,4]);
)" ], [ 2669.8136544, 'joach', "(
~jDrum[2] = \\set -> QuantEnv(\\fplus, 1)
.phase(1, [0,12070,0], [0.015, 0.125], [8,-8], 0, 8)
.phase(2, [0,470,0], [0.065, 0.015], [8,-8], 0, 4)
.phase(3, [0,4700,120], [0.035, 0.065], [8,-8], 0, 1)
.phase(4, [0,147,100], [0.035, 0.065], [8,-8], 0, 1)
.play([1,2,1,3,1,2,1,4]);
)" ], [ 2664.5756121, 'joach', "(
~jDrum[2] = \\set -> QuantEnv(\\fplus, 0.5)
.phase(1, [0,12070,0], [0.015, 0.125], [8,-8], 0, 8)
.phase(2, [0,470,0], [0.065, 0.015], [8,-8], 0, 4)
.phase(3, [0,4700,120], [0.035, 0.065], [8,-8], 0, 1)
.phase(4, [0,147,100], [0.035, 0.065], [8,-8], 0, 1)
.play([1,2,1,3,1,2,1,4]);
)" ], [ 2658.5676015, 'alex', "~a[1]=\\set->Pbind(\\args, [\\trig], \\dur, 2, \\trig, 1);" ], [ 2642.7345485, 'joach', "(
~jDrum[6] = \\set -> QuantEnv(\\freq, 36)
.phase(1, [60,86,60], [12], [\\step], 0, 1)
.phase(2, [60,190,60], [8], [\\sin], 0, 1)
.play([1,2]);
)" ], [ 2637.8135393, 'alex', "~d[2]=\\set->Pbind(\\args, [\\freq], \\dur, 4, \\octave, Pseq([[4,3],[3,5,7],[6,2,3],[3,2,6],[3,4]],inf),\\degree, [3,8,9]);" ], [ 2627.4325247, 'alex', "~d[2]=\\set->Pbind(\\args, [\\freq], \\dur, 4, \\octave, Pseq([[4,3],[3,5,7],[6,2,3],[3,2,6],[3,4]],inf),\\degree, [2,6,8,9]);" ], [ 2617.9474794, 'joach', "(
~jDrum[2] = \\set -> QuantEnv(\\fplus, 1)
.phase(1, [0,12070,0], [0.015, 0.125], [8,-8], 0, 8)
.phase(2, [0,470,0], [0.065, 0.015], [8,-8], 0, 4)
.phase(3, [0,4700,120], [0.035, 0.065], [8,-8], 0, 1)
.phase(4, [0,147,100], [0.035, 0.065], [8,-8], 0, 1)
.play([1,2,1,3,1,2,1,4]);
)" ], [ 2607.1874632, 'alex', "~d[2]=\\set->Pbind(\\args, [\\freq], \\dur, 4, \\octave, Pseq([[4,3],[3,5],[6,2,3],[3,2],[3,4]],inf),\\degree, [2,6,8,9]);" ], [ 2602.7674274, 'joach', "(
~jDrum[3] = \\set -> QuantEnv(\\noise, 16)
.phase(1, [0,0.4,0], [14.05, 1.95], [2,-2], 0, 4)
.phase(2, [1,0.3,0], [8.35, 0.65], [2,-2], 0, 1)
.phase(3, [0,0.8,0], [8.35, 0.65], [2,-2], 0, 1)
.play([1,2,1,3]);
)" ], [ 2592.5964098, 'alex', "~d[31]=\\filter-> {arg in; LPF.ar(in,5700,add:in*0.4)};" ], [ 2590.8653744, 'joach', "(
~jDrum[3] = \\set -> QuantEnv(\\noise, 16)
.phase(1, [0,0.4,0], [14.05, 1.95], [2,-2], 0, 4)
.phase(2, [1,0.3,0], [8.35, 0.65], [2,-2], 0, 1)
.phase(3, [1,0.3,0], [8.35, 0.65], [2,-2], 0, 1)
.play([1,2,1,3]);
)" ], [ 2586.995369, 'alex', "~d[31]=\\filter-> {arg in; LPF.ar(in,4700,add:in*0.4)};" ], [ 2570.4453151, 'joach', "(
~jDrum[3] = \\set -> QuantEnv(\\noise, 16)
.phase(1, [0,0.4,0], [14.05, 1.95], [2,-2], 0, 4)
.phase(2, [1,0.3,0], [8.35, 0.65], [2,-2], 0, 1)
.play([1,2]);
)" ], [ 2566.7332752, 'joach', "(
~jDrum[3] = \\set -> QuantEnv(\\noise, 16)
.phase(1, [0,0.4,0], [14.05, 1.95], [2,-2], 0, 1)
.phase(2, [1,0.3,0], [8.35, 0.65], [2,-2], 0, 1)
.play([1,2]);
)" ], [ 2558.5442621, 'alex', "~d[2]=\\set->Pbind(\\args, [\\freq], \\dur, 4, \\octave, Pseq([[3,4],[4,3],[3,5],[6,2,3],[3,2]],inf),\\degree, [2,6,8,9]);" ], [ 2546.6942455, 'alex', "(~d[0]={
	var sig, env;
	
	env=EnvGen.kr(Env(times:[0.4,6],curve:[\\step, \\welch]),\\trig.tr);
	sig=LFSaw.ar(\\freq.kr!2+[1,2,3].reciprocal).lag([0.02,0.001,0.002,0.005])*LFSaw.ar([1,4,3].reciprocal);
	sig=sig*env;
})" ], [ 2543.8032085, 'joach', "(
~jDrum[3] = \\set -> QuantEnv(\\noise, 16)
.phase(1, [0,0.4,0], [14.05, 1.95], [2,-2], 0, 1)
.phase(2, [0,0.3,0], [8.35, 0.65], [2,-2], 0, 1)
.play([1,2]);
)" ], [ 2540.7532042, 'alex', "(~d[0]={
	var sig, env;
	
	env=EnvGen.kr(Env(times:[0.4,2],curve:[\\step, \\welch]),\\trig.tr);
	sig=LFSaw.ar(\\freq.kr!2+[1,2,3].reciprocal).lag([0.02,0.001,0.002,0.005])*LFSaw.ar([1,4,3].reciprocal);
	sig=sig*env;
})" ], [ 2540.2232035, 'alex', "~d[1]=\\set->Pbind(\\args, [\\trig], \\dur, 4, \\trig, 1);" ], [ 2523.6431803, 'alex', "(~d[0]={
	var sig, env;
	
	env=EnvGen.kr(Env(times:[0.4,4],curve:[\\step, \\welch]),\\trig.tr);
	sig=LFSaw.ar(\\freq.kr!2+[1,2,3].reciprocal).lag([0.02,0.001,0.002,0.005])*LFSaw.ar([1,4,3].reciprocal);
	sig=sig*env;
})" ], [ 2516.7271373, 'joach', "(
~jDrum[5] = \\set -> QuantEnv(\\gMul, 8)
.phase(1, [0.0,1,0.0], [0.05, 7.35], [2,-2], 0.1, 12)
.phase(2, [0.4,1,0.4], [4.05, 3.35], [2,-2], 0.1, 1)
.play([1,2]);
)" ], [ 2510.1761276, 'alex', "(~d[0]={
	var sig, env;
	
	env=EnvGen.kr(Env(times:[0.4,8],curve:[\\step, \\welch]),\\trig.tr);
	sig=LFSaw.ar(\\freq.kr!2+[1,2,3].reciprocal).lag([0.02,0.001,0.002,0.005])*LFSaw.ar([1,4,3].reciprocal);
	sig=sig*env;
})" ], [ 2501.6530831, 'joach', "(
~jDrum[5] = \\set -> QuantEnv(\\gMul, 8)
.phase(1, [0.0,1,0.0], [0.05, 7.35], [2,-2], 0.1, 12)
.phase(2, [0.4,1,0.4], [0.05, 0.35], [2,-2], 0.1, 1)
.play([1,2]);
)" ], [ 2497.2530764, 'alex', "~d[30]=\\filter-> {arg in; GVerb.ar(in,[20,14],15,mul:0.23,add:in*0.1)};" ], [ 2495.197062, 'alex', "~d[30]=\\filter-> {arg in; GVerb.ar(in,[20,14],15,mul:0.2,add:in*0.1)};" ], [ 2494.8750436, 'joach', "(
~jDrum[5] = \\set -> QuantEnv(\\gMul, 8)
.phase(1, [0.0,1,0.0], [0.05, 0.35], [2,-2], 0.1, 12)
.phase(2, [0.4,1,0.4], [0.05, 0.35], [2,-2], 0.1, 1)
.play([1,2]);
)" ], [ 2491.4720353, 'alex', "~d[30]=\\filter-> {arg in; GVerb.ar(in,[20,14],15,mul:0.4,add:in*0.1)};" ], [ 2489.5240026, 'joach', "(
~jDrum[5] = \\set -> QuantEnv(\\gMul, 1)
.phase(1, [0.0,1,0.0], [0.05, 0.35], [2,-2], 0.1, 12)
.phase(2, [0.4,1,0.4], [0.05, 0.35], [2,-2], 0.1, 1)
.play([1,2]);
)" ], [ 2486.7109957, 'alex', "~d[30]=\\filter-> {arg in; GVerb.ar(in,[20,14],15,mul:0.1,add:in*0.1)};" ], [ 2478.2899515, 'joach', "(
~jDrum[5] = \\set -> QuantEnv(\\gMul, 0.5)
.phase(1, [0.0,1,0.0], [0.05, 0.35], [2,-2], 0.1, 12)
.phase(2, [0.4,1,0.4], [0.05, 0.35], [2,-2], 0.1, 1)
.play([1,2]);
)" ], [ 2473.693914, 'joach', "(
~jDrum[5] = \\set -> QuantEnv(\\gMul, 4)
.phase(1, [0.0,1,0.0], [0.05, 0.35], [2,-2], 0.1, 12)
.phase(2, [0.4,1,0.4], [0.05, 0.35], [2,-2], 0.1, 1)
.play([1,2]);
)" ], [ 2472.0079091, 'alex', "~d[2]=\\set->Pbind(\\args, [\\freq], \\dur, 4, \\octave, Pseq([[3,1],[4,2],[3,2],[2,3],[3,2]],inf),\\degree, [2,6,8,9]);" ], [ 2465.8479004, 'alex', "~d[2]=\\set->Pbind(\\args, [\\freq], \\dur, 4, \\octave, Pseq([[3,1],[4,2],[3,2],[2,3],[3,2]],inf),\\degree, [2,6,9]);" ], [ 2457.4268886, 'alex', "~d.play(vol:0.08, fadeTime:2).quant_(3);" ], [ 2445.6298382, 'joach', "(
~jDrum[2] = \\set -> QuantEnv(\\fplus, 1)
.phase(1, [0,2070,0], [0.015, 0.125], [8,-8], 0, 8)
.phase(2, [0,470,0], [0.065, 0.015], [8,-8], 0, 4)
.phase(3, [0,4700,120], [0.035, 0.065], [8,-8], 0, 1)
.phase(4, [0,147,100], [0.035, 0.065], [8,-8], 0, 1)
.play([1,2,1,3,1,2,1,4]);
)" ], [ 2444.4298365, 'alex', "~d[30]=\\filter-> {arg in; GVerb.ar(in,[20,14],15,mul:0.3,add:in*0.1)};" ], [ 2435.7977914, 'joach', "(
~jDrum[2] = \\set -> QuantEnv(\\fplus, 1)
.phase(1, [0,2070,0], [0.015, 0.125], [8,-8], 0, 8)
.phase(2, [0,470,0], [0.065, 0.015], [8,-8], 0, 4)
.phase(3, [0,47,120], [0.035, 0.065], [8,-8], 0, 1)
.phase(4, [0,147,100], [0.035, 0.065], [8,-8], 0, 1)
.play([1,2,1,3,1,2,1,4]);
)" ], [ 2428.9477818, 'alex', "~a[2]=\\set->Pbind(\\args, [\\freq], \\dur, 8, \\freq, Pseq([14000,7000,9000,12000],inf));" ], [ 2428.2627521, 'joach', "(
~jDrum[2] = \\set -> QuantEnv(\\fplus, 1)
.phase(1, [0,270,0], [0.015, 0.125], [8,-8], 0, 8)
.phase(2, [0,470,0], [0.065, 0.015], [8,-8], 0, 4)
.phase(3, [0,47,120], [0.035, 0.065], [8,-8], 0, 1)
.phase(4, [0,147,100], [0.035, 0.065], [8,-8], 0, 1)
.play([1,2,1,3,1,2,1,4]);
)" ], [ 2422.914709, 'joach', "(
~jDrum[1] = \\set -> QuantEnv(\\amp, 1)
.phase(1, [0.2,1,0.2], [0.05, 0.95], [2,-2], 0, 1)
.phase(2, [0.2,1,0.4,0.8,0.2], [0.15, 0.35], [2,-2], 0, 1)

.play([1,2]);
)" ], [ 2417.3436666, 'joach', "(
~jDrum[1] = \\set -> QuantEnv(\\amp, 2)
.phase(1, [0.2,1,0.2], [0.05, 0.95], [2,-2], 0, 1)
.phase(2, [0.2,1,0.4,0.8,0.2], [0.15, 0.35], [2,-2], 0, 1)

.play([1,2]);
)" ], [ 2402.494618, 'joach', "(
~jDrum[1] = \\set -> QuantEnv(\\amp, 4)
.phase(1, [0.2,1,0.2], [0.05, 0.95], [2,-2], 0, 1)
.phase(2, [0.2,1,0.4,0.8,0.2], [0.15, 0.35], [2,-2], 0, 1)

.play([1,2]);
)" ], [ 2398.2326069, 'alex', "~a[30]=\\filter-> {arg in; GVerb.ar(in,40,10,mul:0.2,add:in)};" ], [ 2384.6205849, 'alex', "~a[29]=\\set->Pbind(\\args, [\\del], \\dur, Pseq([4,1,2],inf), \\del, Pseq([0.5,0.25,0.5],inf));" ], [ 2384.1465578, 'joach', "p.clock.tempo_(480/60);" ], [ 2383.7325536, 'alex', "~a[29]=\\filter-> {arg in; CombN.ar(in,2,\\del.kr(0.25),2)};" ], [ 2382.2725516, 'alex', "~a[2]=\\set->Pbind(\\args, [\\freq], \\dur, 8, \\freq, Pseq([4000,9000,12000],inf));" ], [ 2381.4225504, 'alex', "~a[1]=\\set->Pbind(\\args, [\\trig], \\dur, 4, \\trig, 1);" ], [ 2378.3925462, 'alex', "(~a[0]={
	var sig, env;
	
	env=EnvGen.kr(Env(times:[0.01,0.1],curve:[\\step, \\step]),\\trig.tr);
	sig=HPF.ar(WhiteNoise.ar(1)+GrayNoise.ar(1),\\freq.kr(14000));
	sig=sig*env;
})" ], [ 2377.3825447, 'alex', "~a.play(vol:0.7, fadeTime:2).quant_(3);" ], [ 2375.2905105, 'joach', "(
~jDrum[2] = \\set -> QuantEnv(\\fplus, 1)
.phase(1, [0,270,0], [0.015, 0.125], [8,-8], 0, 8)
.phase(2, [0,470,0], [0.065, 0.015], [8,-8], 0, 4)
.phase(3, [0,47,120], [0.035, 0.065], [8,-8], 0, 1)
.phase(4, [0,147,400], [0.035, 0.065], [8,-8], 0, 1)
.play([1,2,1,3,1,2,1,4]);
)" ], [ 2351.4654456, 'joach', "(
~jDrum[1] = \\set -> QuantEnv(\\amp, 1)
.phase(1, [0.2,1,0.2], [0.05, 0.95], [2,-2], 0, 1)
.phase(2, [0.2,1,0.4,0.8,0.2], [0.15, 0.35], [2,-2], 0, 1)

.play([1,2]);
)" ], [ 2349.0654054, 'joach', "(
~jDrum[1] = \\set -> QuantEnv(\\amp, 1)
.phase(1, [0.2,1,0.2], [0.05, 0.45], [2,-2], 0, 1)
.phase(2, [0.2,1,0.4,0.8,0.2], [0.15, 0.35], [2,-2], 0, 1)

.play([1,2]);
)" ], [ 2339.9973599, 'joach', "~jNoise.play(vol: 0.2, fadeTime: 18);" ], [ 2338.6843244, 'joach', "(
~jNoise[1] = \\set -> QuantEnv(\\amp, 4)
.phase(1, [0,1,0], [0.05, 0.2], [2,-2], 0.25, 4)
.phase(2, [0,1,0], [0.35, 0.05], [2,-2], 0.75, 2)
.play([1,2]);
)" ], [ 2337.7443231, 'alex', "(~d[0]={
	var sig, env;
	
	env=EnvGen.kr(Env(times:[0.4,8],curve:[\\step, \\welch]),\\trig.tr);
	sig=LFSaw.ar(\\freq.kr!2+[1,2,3].reciprocal).lag([0.02,0.001,0.002,0.005])*LFSaw.ar([3,2,1,5].reciprocal);
	sig=sig*env;
})" ], [ 2320.0832983, 'alex', "~d[30]=\\filter-> {arg in; GVerb.ar(in,[20,14],15,mul:0.2,add:in*0.1)};" ], [ 2315.3182601, 'joach', "~jDrum.play(vol: 0.9, fadeTime: 0);" ], [ 2312.4222546, 'alex', "~d[30]=\\filter-> {arg in; GVerb.ar(in,[2,14],15,mul:0.2,add:in*0.1)};" ], [ 2302.5442124, 'joach', "p.clock.tempo_(60/60);" ], [ 2298.8612026, 'alex', "(~d[0]={
	var sig, env;
	
	env=EnvGen.kr(Env(times:[0.4,8],curve:[\\step, \\welch]),\\trig.tr);
	sig=LFSaw.ar(\\freq.kr!2+[1,2,3].reciprocal).lag([0.02,0.001])*LFSaw.ar([3,2,1,5].reciprocal);
	sig=sig*env;
})" ], [ 2283.9891817, 'alex', "~d[2]=\\set->Pbind(\\args, [\\freq], \\dur, 4, \\octave, Pseq([[3,1],[4,2],[3,2],[2,3],[3,2]],inf),\\degree, [2,5,6,9]);" ], [ 2276.8891718, 'alex', "~a[31]=\\filter-> {arg in; RLPF.ar(in,7000,add:in*0.2)};" ], [ 2273.9491676, 'alex', "~a[31]=\\filter-> {arg in; RLPF.ar(in,700,add:in*0.2)};" ], [ 2273.3691668, 'alex', "~a[30]=\\filter-> {arg in; GVerb.ar(in,20,4,mul:0.2,add:in)};" ], [ 2266.8291577, 'alex', "~a[29]=\\set->Pbind(\\args, [\\del], \\dur, Pseq([4,1,2],inf), \\del, Pseq([0.5,0.25,0.5],inf));" ], [ 2262.7091519, 'alex', "~a[29]=\\filter-> {arg in; CombN.ar(in,2,\\del.kr(0.25),2)};" ], [ 2252.4231048, 'joach', "~jNoise.stop(1);" ], [ 2250.2380691, 'joach', "~jDrum.stop(16);" ], [ 2246.6650634, 'alex', "~a[29]=\\set->Pbind(\\args, [\\del], \\dur, Pseq([4,1,2],inf), \\del, Pseq([0.5,0.25,0.5],inf));" ], [ 2245.8950623, 'alex', "~a[29]=\\filter-> {arg in; CombN.ar(in,4,\\del.kr(0.25),2)};" ], [ 2211.0440135, 'alex', "~d[2]=\\set->Pbind(\\args, [\\freq], \\dur, 4, \\octave, Pseq([[3,1],[4,2],[3,2],[2,3],[3,2]],inf),\\degree, [2,5,6,7]);" ], [ 2204.0440037, 'alex', "(~d[0]={
	var sig, env;
	
	env=EnvGen.kr(Env(times:[0.4,8],curve:[\\step, \\welch]),\\trig.tr);
	sig=LFSaw.ar(\\freq.kr!2+[1,2,3].reciprocal).lag([0.02,0.001])*LFSaw.ar([3,2,1,4].reciprocal);
	sig=sig*env;
})" ], [ 2193.3139886, 'alex', "~d[31]=\\filter-> {arg in; LPF.ar(in,4700,add:in*0.4)};" ], [ 2182.0939422, 'joach', "(octave:[2,3,4,5], strum:2, amp:0.1, sustain:10).play" ], [ 2180.5339378, 'alex', "~d[2]=\\set->Pbind(\\args, [\\freq], \\dur, 4, \\octave, Pseq([[3,1],[4,2],[3,2],[2,3],[3,2]],inf),\\degree, [3,5,6]);" ], [ 2168.493921, 'alex', "~d[31]=\\filter-> {arg in; LPF.ar(in,3700,add:in*0.4)};" ], [ 2142.3438525, 'joach', "(
~jDrum[2] = \\set -> QuantEnv(\\fplus, 1)
.phase(1, [0,270,0], [0.015, 0.125], [8,-8], 0, 8)
.phase(2, [0,470,0], [0.065, 0.015], [8,-8], 0, 4)
.phase(3, [0,47,1020], [0.035, 0.065], [8,-8], 0, 4)
.phase(4, [0,147,400], [0.035, 0.065], [8,-8], 0, 1)
.play([1,2,1,3,1,2,1,4]);
)" ], [ 2131.2048035, 'joach', "(
~jDrum[1] = \\set -> QuantEnv(\\amp, 0.5)
.phase(1, [0.2,1,0.2], [0.05, 0.45], [2,-2], 0, 1)
.phase(2, [0.2,1,0.4,0.8,0.2], [0.15, 0.35], [2,-2], 0, 1)

.play([1,2]);
)" ], [ 2127.3847653, 'joach', "(
~jDrum[1] = \\set -> QuantEnv(\\amp, 2)
.phase(1, [0.2,1,0.2], [0.05, 0.45], [2,-2], 0, 1)
.phase(2, [0.2,1,0.4,0.8,0.2], [0.15, 0.35], [2,-2], 0, 1)

.play([1,2]);
)" ], [ 2109.8027087, 'joach', "(
~jNoise[1] = \\set -> QuantEnv(\\amp, 2)
.phase(1, [0,1,0], [0.05, 0.2], [2,-2], 0.25, 4)
.phase(2, [0,1,0], [0.35, 0.05], [2,-2], 0.75, 2)
.play([1,2]);
)" ], [ 2094.4056494, 'joach', "(
~jNoise[2] = \\set -> QuantEnv(\\noise, 1)
.phase(1, [0,1,0], [0.05, 0.05], [8,-8], 0.25, 8)
.phase(2, [0,1,0], [0.35, 0.15], [2,-8], 0.25, 1)
.play([1,2]);
)" ], [ 2093.312617, 'joach', "(
~jNoise[1] = \\set -> QuantEnv(\\amp, 2)
.phase(1, [0,1,0], [0.05, 0.2], [2,-2], 0.25, 4)
.phase(2, [0,1,0], [0.35, 0.05], [2,-2], 0.25, 2)
.play([1,2]);
)" ], [ 2087.3165731, 'joach', "(
~jNoise[2] = \\set -> QuantEnv(\\noise, 0.5)
.phase(1, [0,1,0], [0.05, 0.05], [8,-8], 0.25, 8)
.phase(2, [0,1,0], [0.35, 0.15], [2,-8], 0.25, 1)
.play([1,2]);
)" ], [ 2085.5245699, 'alex', "~a[29]=\\filter-> {arg in; CombN.ar(in,4,\\del.kr(0.25),2)};" ], [ 2077.8145591, 'alex', "~a[29]=\\filter-> {arg in; CombN.ar(in,4,\\del.kr(0.5),2)};" ], [ 2073.3335199, 'joach', "(
~jNoise[2] = \\set -> QuantEnv(\\noise, 0.5)
.phase(1, [0,1,0], [0.05, 0.05], [8,-8], 0.31, 8)
.phase(2, [0,1,0], [0.35, 0.15], [2,-8], 0.35, 1)
.play([1,2]);
)" ], [ 2071.6715175, 'alex', "~a[29]=\\filter-> {arg in; CombN.ar(in,4,\\del.kr(0.5),4)};" ], [ 2064.8114788, 'joach', "(
~jNoise[1] = \\set -> QuantEnv(\\amp, 4)
.phase(1, [0,1,0], [0.05, 0.2], [2,-2], 0.25, 4)
.phase(2, [0,1,0], [0.35, 0.05], [2,-2], 0.25, 2)
.play([1,2]);
)" ], [ 2063.3504728, 'alex', "~a[2]=\\set->Pbind(\\args, [\\freq], \\dur, 8, \\freq, Pseq([4000,9000,12000],inf));" ], [ 2059.0244369, 'joach', "(
~jNoise[1] = \\set -> QuantEnv(\\amp, 4)
.phase(1, [0,1,0], [0.05, 0.2], [2,-2], 0, 4)
.phase(2, [0,1,0], [0.35, 0.05], [2,-2], 0, 2)
.play([1,2]);
)" ], [ 2058.0394324, 'alex', "~a[2]=\\set->Pbind(\\args, [\\freq], \\dur, 8, \\freq, Pseq([14000,9000,12000],inf));" ], [ 2056.5183973, 'joach', "(
~jNoise[1] = \\set -> QuantEnv(\\amp, 1)
.phase(1, [0,1,0], [0.05, 0.2], [2,-2], 0, 4)
.phase(2, [0,1,0], [0.35, 0.05], [2,-2], 0, 2)
.play([1,2]);
)" ], [ 2052.9583923, 'alex', "(~a[0]={
	var sig, env;
	
	env=EnvGen.kr(Env(times:[0.01,0.1],curve:[\\step, \\step]),\\trig.tr);
	sig=HPF.ar(WhiteNoise.ar(1)+GrayNoise.ar(1),\\freq.kr(14000));
	sig=sig*env;
})" ], [ 2039.2183731, 'alex', "~a[29]=\\filter-> {arg in; CombN.ar(in,4,\\del.kr(0.5),4)};" ], [ 2038.2763393, 'joach', "(
~jDrum[2] = \\set -> QuantEnv(\\fplus, 1)
.phase(1, [0,270,0], [0.005, 0.125], [8,-8], 0, 8)
.phase(2, [0,470,0], [0.065, 0.015], [8,-8], 0, 4)
.phase(3, [0,47,1020], [0.035, 0.065], [8,-8], 0, 4)
.phase(4, [0,147,400], [0.035, 0.065], [8,-8], 0, 1)
.play([1,2,1,3,1,2,1,4]);
)" ], [ 2029.0263258, 'alex', "~a[30]=\\filter-> {arg in; GVerb.ar(in,20,4,mul:0.2,add:in)};" ], [ 2024.06929, 'joach', "(
~jDrum[2] = \\set -> QuantEnv(\\fplus, 1)
.phase(1, [0,270,0], [0.005, 0.125], [8,-8], 0, 8)
.phase(2, [0,470,0], [0.065, 0.015], [8,-8], 0, 4)
.phase(3, [0,47,1020], [0.035, 0.065], [8,-8], 0, 1)
.phase(4, [0,147,400], [0.035, 0.065], [8,-8], 0, 1)
.play([1,2,1,3,1,2,1,4]);
)" ], [ 2020.2452805, 'alex', "~a[30]=\\filter-> {arg in; GVerb.ar(in,20,2,mul:0.2,add:in)};" ], [ 2014.5352725, 'alex', "~a.play(vol:0.7, fadeTime:2).quant_(3);" ], [ 2010.5152669, 'alex', "~a.play(vol:0.1, fadeTime:2).quant_(3);" ], [ 2009.2132326, 'joach', "(
~jDrum[2] = \\set -> QuantEnv(\\fplus, 1)
.phase(1, [0,270,0], [0.005, 0.125], [8,-8], 0, 8)
.phase(2, [0,470,0], [0.065, 0.015], [8,-8], 0, 4)
.phase(3, [0,47,120], [0.035, 0.065], [8,-8], 0, 1)
.phase(4, [0,147,400], [0.035, 0.065], [8,-8], 0, 1)
.play([1,2,1,3,1,2,1,4]);
)" ], [ 1997.5361824, 'joach', "~jNoise[5] = \\filter -> {|in| HPF.ar(in, \\lpf_freq.kr(2800,8)) };" ], [ 1994.4771776, 'alex', "~a.play(vol:0.14, fadeTime:2).quant_(3);" ], [ 1994.077177, 'alex', "~a[30]=\\filter-> {arg in; GVerb.ar(in,20,2,mul:0.2,add:in*0.1)};" ], [ 1994.077177, 'alex', "~a[29]=\\filter-> {arg in; CombN.ar(in,4,\\del.kr(0.5),2)};" ], [ 1993.3771761, 'alex', "~a[2]=\\set->Pbind(\\args, [\\freq], \\dur, 8, \\freq, Pseq([14000,9000,12000],inf));" ], [ 1993.3771761, 'alex', "~a[1]=\\set->Pbind(\\args, [\\trig], \\dur, 4, \\trig, 1);" ], [ 1967.7261066, 'joach', "~jNoise.play(vol: 0.9, fadeTime: 8);" ], [ 1940.6390393, 'joach', "p.clock.tempo_(240/60);" ], [ 1934.8469965, 'joach', "~jDrum.play(vol: 0.9, fadeTime: 0);" ], [ 1927.3159535, 'joach', "(
~jDrum[2] = \\set -> QuantEnv(\\fplus, 1)
.phase(1, [0,270,0], [0.005, 0.125], [8,-8], 0, 8)
.phase(2, [0,470,0], [0.065, 0.015], [8,-8], 0, 2)
.phase(3, [0,47,120], [0.035, 0.065], [8,-8], 0, 1)
.phase(4, [0,147,400], [0.035, 0.065], [8,-8], 0, 1)
.play([1,2,1,3,1,2,1,4]);
)" ], [ 1920.0239404, 'alex', "(~a[0]={
	var sig, env;
	
	env=EnvGen.kr(Env(times:[0.01,0.1],curve:[\\step, \\step]),\\trig.tr);
	sig=HPF.ar(WhiteNoise.ar(1),\\freq.kr(14000));
	sig=sig*env;
})" ], [ 1884.2698572, 'joach', "~jNoise.stop(1);" ], [ 1877.1568141, 'joach', "~jDrum.stop(16);" ], [ 1850.6257423, 'joach', "(
~jDrum[1] = \\set -> QuantEnv(\\amp, 1)
.phase(1, [0.2,1,0.2], [0.05, 0.45], [2,-2], 0, 1)
.phase(2, [0.2,1,0.4,0.8,0.2], [0.15, 0.35], [2,-2], 0, 1)

.play([1,2]);
)" ], [ 1848.116706, 'joach', "(
~jDrum[2] = \\set -> QuantEnv(\\fplus, 1)
.phase(1, [0,270,0], [0.005, 0.125], [8,-8], 0, 8)
.phase(2, [0,470,0], [0.015, 0.065], [8,-8], 0, 2)
.phase(3, [0,47,120], [0.035, 0.065], [8,-8], 0, 1)
.phase(4, [0,147,400], [0.035, 0.065], [8,-8], 0, 1)
.play([1,2,1,3,1,2,1,4]);
)" ], [ 1846.5836707, 'joach', "(
~jDrum[5] = \\set -> QuantEnv(\\gMul, 1)
.phase(1, [0.0,1,0.0], [0.05, 0.35], [2,-2], 0.1, 12)
.phase(2, [0.4,1,0.4], [0.05, 0.35], [2,-2], 0.1, 1)
.play([1,2]);
)" ], [ 1844.1196671, 'alex', "~d[2]=\\set->Pbind(\\args, [\\freq], \\dur, 4, \\octave, Pseq([[3,1],[4,2],[3,2],[2,3],[3,2]],inf),\\degree, [3,5]);" ], [ 1820.6676341, 'alex', "~d[31]=\\filter-> {arg in; LPF.ar(in,1700,add:in*0.4)};" ], [ 1816.9755976, 'joach', "~jNoise[6] = \\filter -> {|in| GVerb.ar(in, \\gverb_size.kr(12), \\gverb_time.kr(18),0.9,mul:\\gMul.kr(1)) };" ], [ 1812.69659, 'alex', "~d[2]=\\set->Pbind(\\args, [\\freq], \\dur, 4, \\octave, Pseq([[2,3],[3,1],[4,2],[3,2],[3,2]],inf),\\degree, [2,5]);" ], [ 1811.4085593, 'joach', "~jNoise[6] = \\filter -> {|in| GVerb.ar(in, \\gverb_size.kr(12), \\gverb_time.kr(8),0.9,mul:\\gMul.kr(1)) };" ], [ 1804.6325126, 'joach', "~jNoise[6] = \\filter -> {|in| GVerb.ar(in, \\gverb_size.kr(12), \\gverb_time.kr(2),0.9,mul:\\gMul.kr(1)) };" ], [ 1785.7024861, 'alex', "(~d[0]={
	var sig, env;
	
	env=EnvGen.kr(Env(times:[0.4,8],curve:[\\step, \\welch]),\\trig.tr);
	sig=LFSaw.ar(\\freq.kr!2+[1,2,3].reciprocal).lag([0.02,0.001])*LFSaw.ar([3,2,4].reciprocal);
	sig=sig*env;
})" ], [ 1782.5474524, 'joach', "~jNoise[3] = \\filter -> {|in| FreeVerb.ar(in, \\fverb_mix.kr(0.2), \\fverb_room.kr(0.5)) };" ], [ 1778.6104102, 'joach', "~jNoise[3] = \\filter -> {|in| FreeVerb.ar(in, \\fverb_mix.kr(0.9), \\fverb_room.kr(0.5)) };" ], [ 1762.4093875, 'alex', "~d[31]=\\filter-> {arg in; LPF.ar(in,3700,add:in*0.4)};" ], [ 1757.9623496, 'joach', "~jNoise[5] = \\filter -> {|in| HPF.ar(in, \\lpf_freq.kr(1800,8)) };" ], [ 1756.5083463, 'alex', "~d[31]=\\filter-> {arg in; LPF.ar(in,3700,add:in*0.2)};" ], [ 1747.9143011, 'joach', "(
~jNoise[4] = \\set -> QuantEnv(\\freq, 32)
.phase(1, [60,100,60], [4,8], [\\sin,\\step], 0, 4)
.phase(2, [100,160,60], [1.35, 1.65], [2,-2], 0, 1)
.play([1, 2]);
)" ], [ 1720.6142322, 'joach', "~jNoise[5] = \\filter -> {|in| LPF.ar(in, \\lpf_freq.kr(1800,8)) };" ], [ 1716.6781934, 'joach', "~jNoise.play(vol: 0.9, fadeTime: 8);" ], [ 1711.4401516, 'joach', "~jNoise[5] = \\filter -> {|in| LPF.ar(in, \\lpf_freq.kr(800,8)) };" ], [ 1697.4431015, 'joach', "~jDrum.play(vol: 0.1, fadeTime: 30);" ], [ 1692.4950913, 'alex', "(~d[0]={
	var sig, env;
	
	env=EnvGen.kr(Env(times:[0.4,8],curve:[\\step, \\welch]),\\trig.tr);
	sig=LFSaw.ar(\\freq.kr!2+[1,2,3].reciprocal).lag([0.01,0.001])*LFSaw.ar([0.125,0.5,0.25,1]);
	sig=sig*env;
})" ], [ 1685.5310495, 'joach', "(
~jNoise[1] = \\set -> QuantEnv(\\amp, 0.5)
.phase(1, [0,1,0], [0.05, 0.2], [2,-2], 0, 4)
.phase(2, [0,1,0], [0.35, 0.05], [2,-2], 0, 2)
.play([1,2]);
)" ], [ 1678.7390098, 'joach', "(
~jNoise[1] = \\set -> QuantEnv(\\amp, 0.5)
.phase(1, [0,1,0], [0.05, 0.2], [2,-2], 0, 4)
.phase(2, [0,1,0], [0.35, 0.05], [2,-2], 0, 1)
.play([1,2]);
)" ], [ 1678.6930071, 'alex', "(~d[0]={
	var sig, env;
	
	env=EnvGen.kr(Env(times:[0.4,8],curve:[\\step, \\welch]),\\trig.tr);
	sig=LFSaw.ar(\\freq.kr!2+[1,2,3].reciprocal).lag([0.01,0.001])*LFSaw.ar([0.125,0.5,0.25]);
	sig=sig*env;
})" ], [ 1668.0389585, 'joach', "(
~jNoise[1] = \\set -> QuantEnv(\\amp, 0.5)
.phase(1, [0,1,0], [0.05, 0.2], [2,-2], 0, 1)
.phase(2, [0,1,0], [0.35, 0.05], [2,-2], 0, 1)
.play([1,2]);
)" ], [ 1664.0679523, 'alex', "~d[31]=\\filter-> {arg in; LPF.ar(in,2700,add:in*0.2)};" ], [ 1655.4819087, 'joach', "(
~jNoise[1] = \\set -> QuantEnv(\\amp, 0.5)
.phase(1, [0,1,0], [0.05, 0.2], [2,-2], 0, 1)
.phase(2, [0,1,0], [0.35, 0.05], [2,-2], 0, 1)
.play([1]);
)" ], [ 1652.7259034, 'alex', "~d[31]=\\filter-> {arg in; RLPF.ar(in,2700,add:in*0.2)};" ], [ 1644.1248629, 'joach', "(
~jNoise[2] = \\set -> QuantEnv(\\noise, 0.5)
.phase(1, [0,1,0], [0.05, 0.05], [8,-8], 0.1, 8)
.phase(2, [0,1,0], [0.35, 0.15], [2,-8], 0.05, 1)
.play([1,2]);
)" ], [ 1639.7618521, 'alex', "~d[30]=\\filter-> {arg in; GVerb.ar(in,14,15,mul:0.2,add:in*0.1)};" ], [ 1628.7288047, 'joach', "(
~jNoise[2] = \\set -> QuantEnv(\\noise, 0.5)
.phase(1, [0,1,0], [0.05, 0.05], [8,-8], 0.1, 7)
.phase(2, [0,1,0], [0.35, 0.15], [2,-8], 0.05, 1)
.play([1,2]);
)" ], [ 1625.8287995, 'alex', "~d[31]=\\filter-> {arg in; RLPF.ar(in,1700,add:in*0.2)};" ], [ 1621.9407602, 'joach', "(
~jNoise[2] = \\set -> QuantEnv(\\noise, 0.5)
.phase(1, [0,1,0], [0.05, 0.05], [8,-8], 0.1, 7)
.phase(2, [0,1,0], [0.35, 0.15], [2,-8], 0, 1)
.play([1,2]);
)" ], [ 1613.4217165, 'joach', "(
~jNoise[1] = \\set -> QuantEnv(\\amp, 0.5)
.phase(1, [0,1,0], [0.05, 0.2], [2,-2], 0, 1)
.phase(2, [0,1,0], [0.35, 0.65], [2,-2], 0, 1)
.play([1]);
)" ], [ 1602.5086659, 'joach', "(
~jNoise[4] = \\set -> QuantEnv(\\freq, 32)
.phase(1, [160,200,160], [4,8], [\\sin,\\step], 0, 4)
.phase(2, [600,660,0], [1.35, 1.65], [2,-2], 0, 1)
.play([1, 2]);
)" ], [ 1568.4215871, 'joach', "(
~jDrum[2] = \\set -> QuantEnv(\\fplus, 0.5)
.phase(1, [0,270,0], [0.005, 0.125], [8,-8], 0, 8)
.phase(2, [0,470,0], [0.015, 0.065], [8,-8], 0, 2)
.phase(3, [0,47,120], [0.035, 0.065], [8,-8], 0, 1)
.phase(4, [0,147,400], [0.035, 0.065], [8,-8], 0, 1)
.play([1,2,1,3,1,2,1,4]);
)" ], [ 1550.3965259, 'joach', "(
~jDrum[1] = \\set -> QuantEnv(\\amp, 2)
.phase(1, [0.2,1,0.2], [0.05, 0.45], [2,-2], 0, 1)
.phase(2, [0.2,1,0.4,0.8,0.2], [0.15, 0.35], [2,-2], 0, 1)

.play([1,2]);
)" ], [ 1543.6245163, 'alex', "~q.clear;" ], [ 1534.8974713, 'joach', "(
~jNoise[4] = \\set -> QuantEnv(\\freq, 32)
.phase(1, [600,200,600], [4,8], [\\sin,\\step], 0, 4)
.phase(2, [600,660,0], [1.35, 1.65], [2,-2], 0, 1)
.play([1, 2]);
)" ], [ 1512.056408, 'joach', "(
~jNoise[4] = \\set -> QuantEnv(\\freq, 32)
.phase(1, [600,200,600], [4,8], [\\sin,\\step], 0, 1)
.phase(2, [0,1,0], [0.35, 0.65], [2,-2], 0, 1)
.play([1]);
)" ], [ 1500.66839, 'alex', "~d.play(vol:0.14, fadeTime:2).quant_(3);" ], [ 1488.2653724, 'alex', "~d[30]=\\filter-> {arg in; GVerb.ar(in,14,25,mul:0.2,add:in*0.1)};" ], [ 1480.8553621, 'alex', "~d[31]=\\filter-> {arg in; RLPF.ar(in,700,add:in*0.2)};" ], [ 1479.7353304, 'joach', "(
~jNoise[4] = \\set -> QuantEnv(\\freq, 16)
.phase(1, [600,200,600], [4,8], [\\sin,\\step], 0, 1)
.phase(2, [0,1,0], [0.35, 0.65], [2,-2], 0, 1)
.play([1]);
)" ], [ 1449.0722845, 'alex', "~q[30]=\\filter-> {arg in; GVerb.ar(in,20,3,mul:0.2,add:in)};" ], [ 1447.4922823, 'alex', "~q[2]=\\set->Pbind(\\args, [\\freq], \\dur, 4, \\freq, Pseq([Pseries(85,-2,8),45],inf));" ], [ 1442.8292756, 'alex', "~q[1]=\\set->Pbind(\\args, [\\trig], \\dur, 1, \\trig, 1);" ], [ 1439.4092708, 'alex', "~q[31]=\\filter-> {arg in; LPF.ar(in,\\lpf.kr(1800))};" ], [ 1422.1412143, 'joach', "~jNoise[3] = \\filter -> {|in| FreeVerb.ar(in, \\fverb_mix.kr(0.2), \\fverb_room.kr(0.5)) };" ], [ 1411.4841644, 'alex', "~d[2]=\\set->Pbind(\\args, [\\freq], \\dur, 2, \\octave, Pseq([[2,3],[3,1],[4,2],[3,2],[3,2]],inf),\\degree, [2,5]);" ], [ 1406.6761288, 'joach', "(
~jNoise[2] = \\set -> QuantEnv(\\noise, 0.5)
.phase(1, [0,1,0], [0.05, 0.05], [8,-8], 0, 7)
.phase(2, [0,1,0], [0.35, 0.15], [2,-8], 0, 1)
.play([1,2]);
)" ], [ 1401.5450864, 'joach', "(
~jNoise[2] = \\set -> QuantEnv(\\noise, 0.5)
.phase(1, [0,1,0], [0.05, 0.05], [8,-8], 0, 7)
.phase(2, [0,1,0], [0.35, 0.15], [2,-2], 0, 1)
.play([1,2]);
)" ], [ 1398.7020806, 'alex', "~d.play(vol:0.4, fadeTime:2).quant_(3);" ], [ 1397.8340466, 'joach', "(
~jNoise[2] = \\set -> QuantEnv(\\noise, 0.5)
.phase(1, [0,1,0], [0.05, 0.05], [8,-8], 0, 8)
.phase(2, [0,1,0], [0.35, 0.15], [2,-2], 0, 1)
.play([1,2]);
)" ], [ 1395.2090142, 'joach', "(
~jNoise[2] = \\set -> QuantEnv(\\noise, 0.5)
.phase(1, [0,1,0], [0.05, 0.05], [8,-8], 0, 1)
.phase(2, [0,1,0], [0.35, 0.15], [2,-2], 0, 1)
.play([1,2]);
)" ], [ 1392.293978, 'alex', "~d.play(vol:0.1, fadeTime:2).quant_(3);" ], [ 1392.259976, 'joach', "(
~jNoise[2] = \\set -> QuantEnv(\\noise, 0.5)
.phase(1, [0,1,0], [0.05, 0.05], [8,-8], 0, 1)
.phase(2, [0,1,0], [0.35, 0.25], [2,-2], 0, 1)
.play([1,2]);
)" ], [ 1379.2459542, 'alex', "~d[31]=\\filter-> {arg in; RLPF.ar(in,400,add:in*0.2)};" ], [ 1377.9559524, 'alex', "~d[30]=\\filter-> {arg in; GVerb.ar(in,4,25,mul:0.2,add:in*0.1)};" ], [ 1373.4859462, 'alex', "~d.play(vol:0.071, fadeTime:2).quant_(3);" ], [ 1371.0779117, 'joach', "(
~jNoise[2] = \\set -> QuantEnv(\\noise, 0.5)
.phase(1, [0,1,0], [0.05, 0.05], [8,-8], 0, 1)
.phase(2, [0,1,0], [0.35, 1.65], [2,-2], 0, 1)
.play([1,2]);
)" ], [ 1361.5848965, 'alex', "~d[2]=\\set->Pbind(\\args, [\\freq], \\dur, 12, \\octave, Pseq([[2,3],[3,1],[4,2],[3,2],[3,2]],inf),\\degree, [2,5]);" ], [ 1357.9448915, 'alex', "~d[1]=\\set->Pbind(\\args, [\\trig], \\dur, 6, \\trig, 1);" ], [ 1356.7528562, 'joach', "~jNoise.play(vol: 0.4, fadeTime: 8);" ], [ 1354.5578528, 'alex', "(~d[0]={
	var sig, env;
	
	env=EnvGen.kr(Env(times:[0.4,8],curve:[\\step, \\welch]),\\trig.tr);
	sig=LFSaw.ar(\\freq.kr!2+[1,2,3].reciprocal).lag([0.01,0.001])*LFSaw.ar([0.125,0.5]);
	sig=sig*env;
})" ], [ 1353.7078516, 'alex', "~d.play(vol:0.1, fadeTime:2).quant_(3);" ], [ 1342.497836, 'alex', "~d.play(vol:0.071, fadeTime:2).quant_(3);" ], [ 1338.7347987, 'joach', "~jDrum.play(vol: 0.5, fadeTime: 30);" ], [ 1328.7077826, 'alex', "~v.clear;" ], [ 1324.9657443, 'joach', "(
~jNoise[0] = {
var osc = SinOsc.ar(( \\freq.kr(600) + \\fplus.kr(0) ), mul: 1, add: 0);
var noise = WhiteNoise.ar(\\noise.kr(0), (1 - \\noise.kr(0)));
var sig = osc * noise;
Pan2.ar( sig * \\amp.kr(0), \\pan.kr(0) );
};
)" ], [ 1323.2057419, 'alex', "~d.clear;" ], [ 1316.7627014, 'joach', "(
~jNoise[0] = {
var osc = SinOsc.ar(( \\freq.kr(6000) + \\fplus.kr(0) ), mul: 1, add: 0);
var noise = WhiteNoise.ar(\\noise.kr(0), (1 - \\noise.kr(0)));
var sig = osc * noise;
Pan2.ar( sig * \\amp.kr(0), \\pan.kr(0) );
};
)" ], [ 1297.0756713, 'alex', "~d.clear(fadeTime:4);" ], [ 1295.0326381, 'joach', "(
~jNoise[0] = {
var osc = SinOsc.ar(( \\freq.kr(60) + \\fplus.kr(0) ), mul: 1, add: 0);
var noise = WhiteNoise.ar(\\noise.kr(0), (1 - \\noise.kr(0)));
var sig = osc * noise;
Pan2.ar( sig * \\amp.kr(0), \\pan.kr(0) );
};
)" ], [ 1294.042601, 'joach', "~jNoise.play(vol: 0.1, fadeTime: 8);" ], [ 1292.2935646, 'joach', "(
~jNoise[2] = \\set -> QuantEnv(\\noise, 1)
.phase(1, [0,1,0], [0.05, 0.05], [8,-8], 0, 1)
.phase(2, [0,1,0], [0.35, 0.65], [2,-2], 0, 1)
.play([1,2]);
)" ], [ 1280.1085472, 'alex', "~q[31]=\\filter-> {arg in; LPF.ar(in,\\lpf.kr(800))};" ], [ 1278.4685449, 'alex', "~q[31]=\\filter-> {arg in; LPF.ar(in,\\lpf.kr(2800))};" ], [ 1271.6085353, 'alex', "~q[1]=\\set->Pbind(\\args, [\\trig], \\dur, 2, \\trig, 1);" ], [ 1266.4885282, 'alex', "~q[1]=\\set->Pbind(\\args, [\\trig], \\dur, 1, \\trig, 1);" ], [ 1261.3594898, 'joach', "(
~jNoise[1] = \\set -> QuantEnv(\\amp, 0.25)
.phase(1, [0,1,0], [0.05, 0.05], [2,-2], 0, 1)
.phase(2, [0,1,0], [0.35, 0.65], [2,-2], 0, 1)
.play([1]);
)" ], [ 1248.1124692, 'alex', "~d[31]=\\filter-> {arg in; RLPF.ar(in,400,add:in*0.2)};" ], [ 1246.2724666, 'alex', "~d[30]=\\filter-> {arg in; GVerb.ar(in,4,25,mul:0.2,add:in*0.1)};" ], [ 1236.8414533, 'alex', "(~d[0]={
	var sig, env;
	
	env=EnvGen.kr(Env(times:[0.4,8],curve:[\\step, \\welch]),\\trig.tr);
	sig=LFSaw.ar(\\freq.kr!2+[1,2,3].reciprocal).lag([0.01,0.001])*LFSaw.ar([0.125,0.5]);
	sig=sig*env;
})" ], [ 1223.3134027, 'joach', "~jDrum.stop(16);" ], [ 1215.6693907, 'alex', "~d[31]=\\filter-> {arg in; RLPF.ar(in,400,add:in*0.2)};" ], [ 1208.9593813, 'alex', "~d[30]=\\filter-> {arg in; GVerb.ar(in,40,25,mul:0.2,add:in*0.1)};" ], [ 1205.7493768, 'alex', "~d[30]=\\filter-> {arg in; GVerb.ar(in,40,5,mul:0.2,add:in*0.1)};" ], [ 1197.0793646, 'alex', "(~d[0]={
	var sig, env;
	
	env=EnvGen.kr(Env(times:[0.4,8],curve:[\\step, \\welch]),\\trig.tr);
	sig=LFSaw.ar(\\freq.kr+[1,2,3].reciprocal).lag([0.01,0.001])*LFSaw.ar([0.125,0.5]);
	sig=sig*env;
})" ], [ 1188.5953213, 'joach', "~jDrum[4] = \\filter -> {|in| GVerb.ar(in, \\gverb_size.kr(12), \\gverb_time.kr(2),0.9,mul:\\gMul.kr(1)) };" ], [ 1175.227301, 'alex', "~d[2]=\\set->Pbind(\\args, [\\freq], \\dur, 12, \\octave, Pseq([[2,3],[3,1],[4,2],[3,2],[3,2]],inf),\\degree, [2,5]);" ], [ 1156.8342751, 'alex', "(~d[0]={
	var sig, env;
	
	env=EnvGen.kr(Env(times:[0.4,8],curve:[\\step, \\welch]),\\trig.tr);
	sig=LFSaw.ar(\\freq.kr+[1,2,3,5,8,13].reciprocal).lag([0.01,0.001])*LFSaw.ar([0.125,0.5]);
	sig=sig*env;
})" ], [ 1143.8042569, 'alex', "~q[31]=\\filter-> {arg in; LPF.ar(in,\\lpf.kr(2800))};" ], [ 1136.5542467, 'alex', "~q[31]=\\filter-> {arg in; LPF.ar(in,\\lpf.kr(1800))};" ], [ 1130.7142385, 'alex', "~q.play(vol:0.2, fadeTime:2).quant_(1);" ], [ 1127.9822061, 'joach', "(
~jDrum[6] = \\set -> QuantEnv(\\freq, 36)
.phase(1, [60,66,60], [12], [\\step], 0, 1)
.phase(2, [60,90,60], [8], [\\sin], 0, 1)
.play([1,2]);
)" ], [ 1125.9191986, 'alex', "(~q[0]={
	var sig, env, fenv;
	
	env=EnvGen.kr(Env(times:[0.01,0.5],curve:[\\step, \\welch]),\\trig.tr);
	fenv=EnvGen.kr(Env(levels: [\\freq.kr,\\freq.kr*\\top.kr(4),\\freq.kr],times:[0.01,0.04],curve:[\\step, \\welch]),\\trig.tr);
	
	sig=LFPulse.ar(fenv!2,width:[1,2,3,5.8].reciprocal,add:GrayNoise.ar(0.4)).lag([0.001,0.2,0.02,0.002,0.03])*env;
};
)" ], [ 1115.1771835, 'alex', "(~q[0]={
	var sig, env, fenv;
	
	env=EnvGen.kr(Env(times:[0.01,0.5],curve:[\\step, \\welch]),\\trig.tr);
	fenv=EnvGen.kr(Env(levels: [\\freq.kr,\\freq.kr*\\top.kr(4),\\freq.kr],times:[0.01,0.04],curve:[\\step, \\welch]),\\trig.tr);
	
	sig=LFPulse.ar(fenv!2,width:[1,2,3,5.8].reciprocal,add:GrayNoise.ar(0.4)).lag([0.01,0.2,0.02,0.02,0.03])*env;
};
)" ], [ 1108.3161738, 'alex', "(~q[0]={
	var sig, env, fenv;
	
	env=EnvGen.kr(Env(times:[0.01,0.5],curve:[\\step, \\welch]),\\trig.tr);
	fenv=EnvGen.kr(Env(levels: [\\freq.kr,\\freq.kr*\\top.kr(4),\\freq.kr],times:[0.01,0.04],curve:[\\step, \\welch]),\\trig.tr);
	
	sig=LFPulse.ar(fenv!2,width:[1,2,3,5.8].reciprocal,add:GrayNoise.ar(0.4))*env;
};
)" ], [ 1098.3661599, 'alex', "(~q[0]={
	var sig, env, fenv;
	
	env=EnvGen.kr(Env(times:[0.01,0.5],curve:[\\step, \\welch]),\\trig.tr);
	fenv=EnvGen.kr(Env(levels: [\\freq.kr,\\freq.kr*\\top.kr(4),\\freq.kr],times:[0.01,0.04],curve:[\\step, \\welch]),\\trig.tr);
	
	sig=LFPulse.ar(fenv!2,width:[1,2,3,5.8].reciprocal,add:GrayNoise.ar(0.4)).lag([0.01,0.2,0.02,0.02,0.03])*env;
};
)" ], [ 1086.0641425, 'alex', "(~q[0]={
	var sig, env, fenv;
	
	env=EnvGen.kr(Env(times:[0.01,0.5],curve:[\\step, \\welch]),\\trig.tr);
	fenv=EnvGen.kr(Env(levels: [\\freq.kr,\\freq.kr*\\top.kr(4),\\freq.kr],times:[0.01,0.04],curve:[\\step, \\welch]),\\trig.tr);
	
	sig=LFSaw.ar(fenv!2,width:[1,2,3,5.8].reciprocal,add:GrayNoise.ar(0.4)).lag([0.01,0.2,0.02,0.02,0.03])*env;
};
)" ], [ 1083.7441393, 'alex', "(~q[0]={
	var sig, env, fenv;
	
	env=EnvGen.kr(Env(times:[0.01,0.5],curve:[\\step, \\welch]),\\trig.tr);
	fenv=EnvGen.kr(Env(levels: [\\freq.kr,\\freq.kr*\\top.kr(6),\\freq.kr],times:[0.01,0.04],curve:[\\step, \\welch]),\\trig.tr);
	
	sig=LFSaw.ar(fenv!2,width:[1,2,3,5.8].reciprocal,add:GrayNoise.ar(0.4)).lag([0.01,0.2,0.02,0.02,0.03])*env;
};
)" ], [ 1076.5841293, 'alex', "(~q[0]={
	var sig, env, fenv;
	
	env=EnvGen.kr(Env(times:[0.01,0.5],curve:[\\step, \\welch]),\\trig.tr);
	fenv=EnvGen.kr(Env(levels: [\\freq.kr,\\freq.kr*\\top.kr(8),\\freq.kr],times:[0.01,0.04],curve:[\\step, \\welch]),\\trig.tr);
	
	sig=LFSaw.ar(fenv!2,width:[1,2,3,5.8].reciprocal,add:GrayNoise.ar(0.4)).lag([0.01,0.2,0.02,0.02,0.03])*env;
};
)" ], [ 1064.0241117, 'alex', "(~q[0]={
	var sig, env, fenv;
	
	env=EnvGen.kr(Env(times:[0.01,0.5],curve:[\\step, \\welch]),\\trig.tr);
	fenv=EnvGen.kr(Env(levels: [\\freq.kr,\\freq.kr*\\top.kr(4),\\freq.kr],times:[0.01,0.04],curve:[\\step, \\welch]),\\trig.tr);
	
	sig=LFSaw.ar(fenv!2,width:[1,2,3,5.8].reciprocal,add:GrayNoise.ar(0.4)).lag([0.01,0.2,0.02,0.02,0.03])*env;
};
)" ], [ 1057.4990716, 'joach', "(
~jDrum[2] = \\set -> QuantEnv(\\fplus, 0.5)
.phase(1, [0,270,0], [0.005, 0.125], [8,-8], 0, 8)
.phase(2, [0,470,0], [0.015, 0.065], [8,-8], 0, 2)
.phase(3, [0,47,1200], [0.035, 0.065], [8,-8], 0, 1)
.phase(4, [0,147,800], [0.035, 0.065], [8,-8], 0, 1)
.play([1,2,1,3,1,2,1,4]);
)" ], [ 1048.6360562, 'alex', "~q.play(vol:0.7, fadeTime:2).quant_(1);" ], [ 1045.0860512, 'alex', "~q[30]=\\filter-> {arg in; GVerb.ar(in,20,3,mul:0.2,add:in)};" ], [ 1040.5630152, 'joach', "(
~jDrum[2] = \\set -> QuantEnv(\\fplus, 0.5)
.phase(1, [0,270,0], [0.005, 0.125], [8,-8], 0, 8)
.phase(2, [0,470,0], [0.015, 0.065], [8,-8], 0, 2)
.phase(3, [500,47,1200], [0.035, 0.065], [8,-8], 0, 1)
.phase(4, [800,47,800], [0.035, 0.065], [8,-8], 0, 1)
.play([1,2,1,3,1,2,1,4]);
)" ], [ 1033.572002, 'alex', "~q[2]=\\set->Pbind(\\args, [\\freq], \\dur, 4, \\freq, Pseq([Pseries(85,-2,8),45],inf));" ], [ 1032.9119726, 'joach', "(
~jDrum[2] = \\set -> QuantEnv(\\fplus, 0.5)
.phase(1, [0,470,0], [0.005, 0.125], [8,-8], 0, 8)
.phase(2, [0,270,0], [0.015, 0.065], [8,-8], 0, 2)
.phase(3, [500,47,1200], [0.035, 0.065], [8,-8], 0, 1)
.phase(4, [800,47,800], [0.035, 0.065], [8,-8], 0, 1)
.play([1,2,1,3,1,2,1,4]);
)" ], [ 1027.37596, 'alex', "~q[1]=\\set->Pbind(\\args, [\\trig], \\dur, 2, \\trig, 1);" ], [ 1021.7819224, 'joach', "~jDrum[4] = \\filter -> {|in| GVerb.ar(in, \\gverb_size.kr(12), \\gverb_time.kr(8),0.9,mul:\\gMul.kr(1)) };" ], [ 1012.919882, 'alex', "(~q[0]={
	var sig, env, fenv;
	
	env=EnvGen.kr(Env(times:[0.01,0.5],curve:[\\step, \\welch]),\\trig.tr);
	fenv=EnvGen.kr(Env(levels: [\\freq.kr,\\freq.kr*\\top.kr(4),\\freq.kr],times:[0.01,0.04],curve:[\\step, \\welch]),\\trig.tr);
	
	sig=LFSaw.ar(fenv!2,width:[1,2,3,5.8].reciprocal,add:GrayNoise.ar(0.1)).lag([0.01,0.2,0.02,0.02,0.03])*env;
};
)" ], [ 1012.8178762, 'joach', "(
~jDrum[5] = \\set -> QuantEnv(\\gMul, 0.5)
.phase(1, [0.0,1,0.0], [0.05, 0.35], [2,-2], 0.1, 12)
.phase(2, [0.4,1,0.4], [0.05, 0.35], [2,-2], 0.1, 1)
.play([1,2]);
)" ], [ 997.0968189, 'joach', "(
~jDrum[5] = \\set -> QuantEnv(\\gMul, 0.5)
.phase(1, [0.0,1,0.0], [0.05, 0.85], [2,-2], 0.1, 12)
.phase(2, [0.4,1,0.4], [0.35, 0.65], [2,-2], 0.1, 1)
.play([1,2]);
)" ], [ 988.4448056, 'alex', "~d[2]=\\set->Pbind(\\args, [\\freq], \\dur, 12, \\octave, Pseq([[2,3],[3,1],[4,2],[3,2],[3,2]],inf),\\degree, [4,6,2]);" ], [ 977.8787598, 'joach', "(
~jDrum[5] = \\set -> QuantEnv(\\gMul, 0.5)
.phase(1, [0.0,1,0.0], [0.05, 0.95], [2,-2], 0.1, 12)
.phase(2, [0.4,1,0.4], [0.35, 0.65], [2,-2], 0.1, 1)
.play([1,2]);
)" ], [ 977.4807571, 'alex', "~d[2]=\\set->Pbind(\\args, [\\freq], \\dur, 2, \\octave, Pseq([[2,3],[3,1],[4,2],[3,2],[3,2]],inf),\\degree, [4,6,2]);" ], [ 974.9277204, 'joach', "(
~jDrum[5] = \\set -> QuantEnv(\\gMul, 0.5)
.phase(1, [0.0,1,0.4], [0.05, 0.95], [2,-2], 0.1, 12)
.phase(2, [0.4,1,0.4], [0.35, 0.65], [2,-2], 0.1, 1)
.play([1,2]);
)" ], [ 968.8136799, 'joach', "(
~jDrum[5] = \\set -> QuantEnv(\\gMul, 0.5)
.phase(1, [0.1,1,0.4], [0.05, 0.95], [2,-2], 0.1, 12)
.phase(2, [0.4,1,0.4], [0.35, 0.65], [2,-2], 0.1, 1)
.play([1,2]);
)" ], [ 964.9906409, 'joach', "(
~jDrum[5] = \\set -> QuantEnv(\\gMul, 0.5)
.phase(1, [0.1,1,0.4], [0.05, 0.95], [2,-2], 0.1, 1)
.phase(2, [0.4,1,0.4], [0.35, 0.65], [2,-2], 0.1, 1)
.play([1,2]);
)" ], [ 964.713639, 'alex', "(~d[0]={
	var sig, env;
	
	env=EnvGen.kr(Env(times:[0.4,8],curve:[\\step, \\welch]),\\trig.tr);
	sig=LFSaw.ar(\\freq.kr+[1,2,3,5,8,13].reciprocal).lag([0.01,0.001,0.1,0.02,0.2])*LFSaw.ar([0.125,0.5]);
	sig=sig*env;
})" ], [ 956.1475937, 'joach', "(
~jDrum[5] = \\set -> QuantEnv(\\gMul, 0.5)
.phase(1, [0.4,1,0.4], [0.05, 0.95], [2,-2], 0.1, 1)
.phase(2, [0.4,1,0.4], [0.35, 0.65], [2,-2], 0.1, 1)
.play([1,2]);
)" ], [ 952.981561, 'joach', "(
~jDrum[5] = \\set -> QuantEnv(\\gMul, 0.5)
.phase(1, [0.4,1,0.4], [0.05, 0.95], [2,-2], 0.5, 1)
.phase(2, [0.4,1,0.4], [0.35, 0.65], [2,-2], 0.5, 1)
.play([1,2]);
)" ], [ 945.2225134, 'joach', "(
~jDrum[5] = \\set -> QuantEnv(\\gMul, 2)
.phase(1, [0.4,1,0.4], [0.05, 0.95], [2,-2], 0.5, 1)
.phase(2, [0.4,1,0.4], [0.35, 0.65], [2,-2], 0.5, 1)
.play([1,2]);
)" ], [ 943.1515093, 'alex', "(~d[0]={
	var sig, env;
	
	env=EnvGen.kr(Env(times:[0.4,8],curve:[\\step, \\welch]),\\trig.tr);
	sig=LFSaw.ar(\\freq.kr+[1,2,3,5,8,13].reciprocal).lag([0.01,0.001,0.1,0.02,0.2])*LFPulse.ar([0.125,0.5]);
	sig=sig*env;
})" ], [ 926.552456, 'joach', "(
~jDrum[2] = \\set -> QuantEnv(\\fplus, 0.5)
.phase(1, [0,170,0], [0.005, 0.125], [8,-8], 0, 8)
.phase(2, [0,270,0], [0.015, 0.065], [8,-8], 0, 2)
.phase(3, [500,47,1200], [0.035, 0.065], [8,-8], 0, 1)
.phase(4, [800,47,800], [0.035, 0.065], [8,-8], 0, 1)
.play([1,2,1,3,1,2,1,4]);
)" ], [ 925.8104521, 'alex', "(~d[0]={
	var sig, env;
	
	env=EnvGen.kr(Env(times:[0.4,8],curve:[\\step, \\welch]),\\trig.tr);
	sig=LFSaw.ar(\\freq.kr+[1,2,3,5,8,13].reciprocal).lag([0.01,0.001,0.1,0.02,0.2]);
	sig=sig*env;
})" ], [ 921.093415, 'joach', "(
~jDrum[2] = \\set -> QuantEnv(\\fplus, 0.5)
.phase(1, [0,170,0], [0.005, 0.125], [8,-8], 0, 8)
.phase(2, [0,270,0], [0.035, 0.065], [8,-8], 0, 2)
.phase(3, [500,47,1200], [0.035, 0.065], [8,-8], 0, 1)
.phase(4, [800,47,800], [0.035, 0.065], [8,-8], 0, 1)
.play([1,2,1,3,1,2,1,4]);
)" ], [ 914.321373, 'joach', "(
~jDrum[2] = \\set -> QuantEnv(\\fplus, 0.5)
.phase(1, [0,170,0], [0.005, 0.095], [8,-8], 0, 8)
.phase(2, [0,270,0], [0.035, 0.065], [8,-8], 0, 2)
.phase(3, [500,47,1200], [0.035, 0.065], [8,-8], 0, 1)
.phase(4, [800,47,800], [0.035, 0.065], [8,-8], 0, 1)
.play([1,2,1,3,1,2,1,4]);
)" ], [ 904.5213559, 'alex', "~d[2]=\\set->Pbind(\\args, [\\freq], \\dur, 2, \\octave, Pseq([[2,3],[4,3,2],[4,2],[3,2],[3,2]],inf),\\degree, [4,6,2]);" ], [ 903.0763252, 'joach', "(
~jDrum[2] = \\set -> QuantEnv(\\fplus, 0.5)
.phase(1, [0,170,0], [0.005, 0.195], [8,-8], 0, 8)
.phase(2, [0,270,0], [0.035, 0.065], [8,-8], 0, 2)
.phase(3, [500,47,1200], [0.035, 0.065], [8,-8], 0, 1)
.phase(4, [800,47,800], [0.035, 0.065], [8,-8], 0, 1)
.play([1,2,1,3,1,2,1,4]);
)" ], [ 894.9263093, 'alex', "~d[31]=\\filter-> {arg in; RLPF.ar(in,1400,add:in*0.2)};" ], [ 885.8172642, 'joach', "~jDrum.play(vol: 0.9, fadeTime: 1);" ], [ 879.0502237, 'joach', "(
~jDrum[1] = \\set -> QuantEnv(\\amp, 0.5)
.phase(1, [0.2,1,0.2], [0.05, 0.45], [2,-2], 0, 1)
.phase(2, [0.2,1,0.4,0.8,0.2], [0.15, 0.35], [2,-2], 0, 1)

.play([1,2]);
)" ], [ 876.2091867, 'joach', "(
~jDrum[2] = \\set -> QuantEnv(\\fplus, 0.5)
.phase(1, [0,170,0], [0.005, 0.195], [8,-8], 0, 8)
.phase(2, [0,270,0], [0.035, 0.065], [8,-8], 0, 2)
.phase(3, [500,47,1200], [0.035, 0.065], [8,-8], 0, 1)
.phase(4, [800,47,800], [0.035, 0.065], [8,-8], 0, 4)
.play([1,2,1,3,1,2,1,4]);
)" ], [ 875.3401817, 'alex', "~d.play(vol:0.071, fadeTime:2).quant_(3);" ], [ 854.9101531, 'alex', "~d[2]=\\set->Pbind(\\args, [\\freq], \\dur, 4, \\octave, Pseq([[2,3],[4,3,2],[4,2],[3,2],[3,2]],inf),\\degree, [4,6,2]);" ], [ 847.8991432, 'alex', "~d[30]=\\filter-> {arg in; GVerb.ar(in,40,15,mul:0.2,add:in*0.1)};" ], [ 838.2990996, 'joach', "~jDrum.play(vol: 0.1, fadeTime: 28);" ], [ 828.5680832, 'alex', "(~d[0]={
	var sig, env;
	
	env=EnvGen.kr(Env(times:[0.4,8],curve:[\\step, \\welch]),\\trig.tr);
	sig=LFSaw.ar(\\freq.kr+[1,2,3,5,8,13].reciprocal).lag([0.01,0.001,0.1,0.02,0.2]);
	sig=sig*env;
})" ], [ 822.6070747, 'alex', "~d[1]=\\set->Pbind(\\args, [\\trig], \\dur, 6, \\trig, 1);" ], [ 816.2750658, 'alex', "~d[31]=\\filter-> {arg in; LPF.ar(in,1400,add:in*0.2)};" ], [ 812.1910303, 'joach', "~jDrum[4] = \\filter -> {|in| GVerb.ar(in, \\gverb_size.kr(12), \\gverb_time.kr(4),0.9,mul:\\gMul.kr(1)) };" ], [ 781.1709494, 'joach', "(
~jDrum[2] = \\set -> QuantEnv(\\fplus, 0.5)
.phase(1, [0,170,0], [0.005, 0.195], [8,-8], 0, 8)
.phase(2, [0,270,0], [0.035, 0.065], [8,-8], 0, 2)
.phase(3, [500,1470,0], [0.035, 0.065], [8,-8], 0, 1)
.phase(4, [800,470,0], [0.035, 0.065], [8,-8], 0, 4)
.play([1,2,1,3,1,2,1,4]);
)" ], [ 776.7909433, 'alex', "~v[30]=\\filter-> {arg in; GVerb.ar(in,40,15,mul:0.4,add:in*0.1)};" ], [ 774.2989113, 'joach', "(
~jDrum[2] = \\set -> QuantEnv(\\fplus, 0.5)
.phase(1, [0,170,0], [0.005, 0.195], [8,-8], 0, 8)
.phase(2, [0,270,0], [0.035, 0.065], [8,-8], 0, 2)
.phase(3, [800,470,0], [0.035, 0.065], [8,-8], 0, 1)
.phase(4, [500,1470,0], [0.035, 0.065], [8,-8], 0, 4)
.play([1,2,1,3,1,2,1,4]);
)" ], [ 771.5638692, 'joach', "(
~jDrum[2] = \\set -> QuantEnv(\\fplus, 0.5)
.phase(1, [0,170,0], [0.005, 0.195], [8,-8], 0, 8)
.phase(2, [0,270,0], [0.035, 0.065], [8,-8], 0, 2)
.phase(3, [800,470,0], [0.035, 0.065], [8,-8], 0, 1)
.phase(4, [500,470,0], [0.035, 0.065], [8,-8], 0, 4)
.play([1,2,1,3,1,2,1,4]);
)" ], [ 758.5688195, 'joach', "(
~jDrum[5] = \\set -> QuantEnv(\\gMul, 1)
.phase(1, [0.4,1,0.4], [0.05, 0.95], [2,-2], 0.5, 1)
.phase(2, [0.4,1,0.4], [0.35, 0.65], [2,-2], 0.5, 1)
.play([1,2]);
)" ], [ 750.272778, 'joach', "(
~jDrum[1] = \\set -> QuantEnv(\\amp, 1)
.phase(1, [0.2,1,0.2], [0.05, 0.95], [2,-2], 0, 1)
.phase(2, [0.2,1,0.4,0.8,0.2], [0.15, 0.65], [2,-2], 0, 1)
.play([1,2]);
)" ], [ 749.4997722, 'alex', "~v[31]=\\filter-> {arg in; LPF.ar(in,1400,add:in*0.2)};" ], [ 746.3387354, 'joach', "(
~jDrum[5] = \\set -> QuantEnv(\\amp, 1)
.phase(1, [0.4,1,0.4], [0.05, 0.95], [2,-2], 0.5, 1)
.phase(2, [0.4,1,0.4], [0.35, 0.65], [2,-2], 0.5, 1)
.play([1,2]);
)" ], [ 739.6857254, 'alex', "~v[30]=\\filter-> {arg in; GVerb.ar(in,40,10,mul:0.4,add:in*0.1)};" ], [ 731.1257134, 'alex', "~v[2]=\\set->Pbind(\\args, [\\freq], \\dur, 4, \\octave, Pseq([[2,3],[4,3,2],[4,2],[3,2],[3,2,5]],inf),\\degree, [4,6,2]);" ], [ 709.2326826, 'alex', "~v.play(vol:0.1, fadeTime:2).quant_(3);" ], [ 700.8116707, 'alex', "~v[30]=\\filter-> {arg in; GVerb.ar(in,40,10,mul:0.4,add:in*0.4)};" ], [ 699.4796397, 'joach', "~jDrum[4] = \\filter -> {|in| GVerb.ar(in, \\gverb_size.kr(12), \\gverb_time.kr(1),0.9,mul:\\gMul.kr(1)) };" ], [ 689.2886215, 'alex', "~v[30]=\\filter-> {arg in; GVerb.ar(in,20,10,mul:0.2,add:in*0.4)};" ], [ 679.648608, 'alex', "~v[31]=\\filter-> {arg in; LPF.ar(in,400,add:in*0.2)};" ], [ 674.8386013, 'alex', "~v[31]=\\filter-> {arg in; LPF.ar(in,400,add:in*0.7)};" ], [ 670.5465951, 'alex', "~v[31]=\\filter-> {arg in; LPF.ar(in,400,add:in*0.2)};" ], [ 661.2765822, 'alex', "~v[31]=\\filter-> {arg in; LPF.ar(in,400)};" ], [ 654.3565725, 'alex', "(~v[0]={
	var sig, env;
	
	env=EnvGen.kr(Env(times:[0.4,4],curve:[\\step, \\welch]),\\trig.tr);
	sig=LFSaw.ar(\\freq.kr+[1,2,3,5,8,13].reciprocal).lag([0.01,0.001,0.1,0.02,0.2]);
	sig=sig*env;
})" ], [ 647.4465628, 'alex', "(~v[0]={
	var sig, env;
	
	env=EnvGen.kr(Env(times:[0.4,4],curve:[\\welch, \\welch]),\\trig.tr);
	sig=LFSaw.ar(\\freq.kr+[1,2,3,5,8,13].reciprocal).lag([0.01,0.001,0.1,0.02,0.2]);
	sig=sig*env;
})" ], [ 640.8205219, 'joach', "(
~jDrum[2] = \\set -> QuantEnv(\\fplus, 0.5)
.phase(1, [0,170,0], [0.005, 0.195], [8,-8], 0, 8)
.phase(2, [0,270,0], [0.035, 0.065], [8,-8], 0, 2)
.phase(3, [800,470,0], [0.035, 0.065], [8,-8], 0, 1)
.phase(4, [800,470,0], [0.035, 0.065], [8,-8], 0, 4)
.play([1,2,1,3,1,2,1,4]);
)" ], [ 631.6795074, 'alex', "~v.play(vol:0.2, fadeTime:2).quant_(3);" ], [ 630.3354724, 'joach', "(
~jDrum[2] = \\set -> QuantEnv(\\fplus, 0.5)
.phase(1, [0,170,0], [0.005, 0.195], [8,-8], 0, 8)
.phase(2, [0,270,0], [0.035, 0.065], [8,-8], 0, 2)
.phase(3, [800,470,0], [0.035, 0.065], [8,-8], 0, 1)
.phase(1, [800,470,0], [0.035, 0.065], [8,-8], 0, 4)
.play([1,2,1,3,1,2,1,4]);
)" ], [ 621.51446, 'alex', "~v[2]=\\set->Pbind(\\args, [\\freq], \\dur, 4, \\octave, Pseq([[2,3],[4,2],[3,2],[4,3,2],[3,2,5]],inf),\\degree, [4,6,2]);" ], [ 601.4904005, 'joach', "(
~jDrum[2] = \\set -> QuantEnv(\\fplus, 0.5)
.phase(1, [0,170,0], [0.005, 0.195], [8,-8], 0, 8)
.phase(2, [0,270,0], [0.035, 0.065], [8,-8], 0, 2)
.phase(3, [800,470,0], [0.035, 0.065], [8,-8], 0, 4)
.play([1,2,1,3]);
)" ], [ 591.1293842, 'alex', "(~v[0]={
	var sig, env;
	
	env=EnvGen.kr(Env(times:[0.4,4],curve:[\\step, \\welch]),\\trig.tr);
	sig=LFSaw.ar(\\freq.kr+[1,2,3,5,8,13].reciprocal).lag([0.01,0.001,0.1,0.02,0.2]);
	sig=sig*env;
})" ], [ 582.1373715, 'alex', "(~v[0]={
	var sig, env;
	
	env=EnvGen.kr(Env(times:[0.4,4],curve:[\\step, \\welch]),\\trig.tr);
	sig=LFSaw.ar(\\freq.kr+[1,2,3,5,8,13].reciprocal).lag([0.01,0.1,0.02,0.2]);
	sig=sig*env;
})" ], [ 574.9593315, 'joach', "(
~jDrum[3] = \\set -> QuantEnv(\\noise, 16)
.phase(1, [0,0.1,0], [14.05, 1.95], [2,-2], 0, 1)
.phase(2, [0,0.3,0], [0.35, 0.65], [2,-2], 0, 1)
.play([1,2]);
)" ], [ 555.7382694, 'joach', "(
~jDrum[2] = \\set -> QuantEnv(\\fplus, 0.5)
.phase(1, [0,170,0], [0.005, 0.195], [8,-8], 0, 8)
.phase(2, [0,270,0], [0.035, 0.065], [8,-8], 0, 2)
.phase(3, [800,470,0], [0.035, 0.065], [8,-8], 0, 1)
.play([1,2,1,3]);
)" ], [ 554.9372671, 'alex', "~v[2]=\\set->Pbind(\\args, [\\freq], \\dur, 4, \\octave, Pseq([[2,3],[4,2],[3,2]],inf),\\degree, [4,6,2]);" ], [ 552.3562338, 'joach', "(
~jDrum[2] = \\set -> QuantEnv(\\fplus, 0.5)
.phase(1, [0,170,0], [0.005, 0.195], [8,-8], 0, 8)
.phase(2, [0,270,0], [0.035, 0.065], [8,-8], 0, 2)
.phase(3, [800,470,0], [0.035, 0.065], [8,-8], 0, 2)
.play([1,2,1,3]);
)" ], [ 538.602211, 'alex', "~v[31]=\\filter-> {arg in; LPF.ar(in,1400)};" ], [ 531.1312005, 'alex', "~v[30]=\\filter-> {arg in; GVerb.ar(in,20,5,mul:0.2,add:in*0.4)};" ], [ 528.0011961, 'alex', "~v[2]=\\set->Pbind(\\args, [\\freq], \\dur, 4, \\octave, Prand([[2,3],[4,2],[3,2]],inf),\\degree, [4,6,2]);" ], [ 527.5411954, 'alex', "~v[1]=\\set->Pbind(\\args, [\\trig], \\dur, 3, \\trig, 1);" ], [ 523.4111897, 'alex', "(~v[0]={
	var sig, env;
	
	env=EnvGen.kr(Env(times:[0.4,4],curve:[\\step, \\welch]),\\trig.tr);
	sig=LFSaw.ar(\\freq.kr+[1,2,3,5,8,13].reciprocal).lag([0.01,0.001,0.02,0.2]);
	sig=sig*env;
})" ], [ 522.3611882, 'alex', "~v.play(vol:0.2, fadeTime:2).quant_(1);" ], [ 518.0601525, 'joach', "(
~jDrum[3] = \\set -> QuantEnv(\\noise, 16)
.phase(1, [0,0.1,0], [0.05, 0.95], [2,-2], 0, 1)
.phase(2, [0,0.3,0], [0.35, 0.65], [2,-2], 0, 1)
.play([1,2]);
)" ], [ 493.3810857, 'joach', "(
~jDrum[1] = \\set -> QuantEnv(\\amp, 1)
.phase(1, [0.2,1,0.2], [0.05, 0.95], [2,-2], 0, 1)
.phase(2, [0.2,1,0.4,0.8,0.2], [0.15, 0.65], [2,-2], 0, 1)
.play([1,2]);
)" ], [ 492.250079, 'alex', "(~v[0]={
	var sig, env;
	
	env=EnvGen.kr(Env(times:[0.4,4],curve:[\\step, \\welch]),\\trig.tr);
	sig=LFSaw.ar(\\freq.kr+[1,2,3,5,8,13].reciprocal).lag([0.01,0.001,0.02,0.2]);
	sig=sig*env;
})" ], [ 474.2730233, 'joach', "(
~jDrum[2] = \\set -> QuantEnv(\\fplus, 0.5)
.phase(1, [0,170,0], [0.005, 0.195], [8,-8], 0, 8)
.phase(2, [0,270,0], [0.035, 0.065], [8,-8], 0, 2)
.play([1,2]);
)" ], [ 466.8509805, 'joach', "(
~jDrum[2] = \\set -> QuantEnv(\\fplus, 1)
.phase(1, [0,170,0], [0.005, 0.195], [8,-8], 0, 8)
.phase(2, [0,270,0], [0.035, 0.065], [8,-8], 0, 2)
.play([1,2]);
)" ], [ 446.6479152, 'joach', "(
~jDrum[2] = \\set -> QuantEnv(\\fplus, 1)
.phase(1, [0,170,0], [0.005, 0.195], [8,-8], 0, 1)
.phase(2, [0,270,0], [0.035, 0.065], [8,-8], 0, 1)
.play([1,2]);
)" ], [ 436.9268714, 'joach', "(
~jDrum[2] = \\set -> QuantEnv(\\fplus, 1)
.phase(1, [0,170,0], [0.005, 0.195], [8,-8], 0, 1)
.phase(2, [0,270,0], [0.035, 0.065], [8,-2], 0, 1)
.play([1,2]);
)" ], [ 435.8338362, 'joach', "2" ], [ 415.1798032, 'alex', "(octave: [4,1],strum:1,dur:4,degree:[4,6], sustain:2, amp:1).play;" ], [ 411.7197983, 'alex', "(octave: [4,1],strum:1,dur:4,degree:[4,6], sustain:2, amp:0.1).play;" ], [ 407.8587929, 'alex', "(octave: [4,1],strum:1,dur:4,degree:[4,6], sustain:20, amp:0.1).play;" ], [ 404.2887879, 'alex', "(octave: [4,1],strum:1,dur:4,degree:[4,7,5,6], sustain:20, amp:0.1).play;" ], [ 400.2987823, 'alex', "(octave: [4,1],strum:1,dur:14,degree:[4,7,5,6], sustain:20, amp:0.1).play;" ], [ 398.8027486, 'joach', "(
~jDrum[1] = \\set -> QuantEnv(\\amp, 1)
.phase(1, [0,1,0], [0.05, 0.95], [2,-2], 0, 1)
.phase(2, [0,1,0.2,0.8,0], [0.15, 0.65], [2,-2], 0, 1)
.play([1,2]);
)" ], [ 397.5957114, 'joach', "(
~jDrum[0] = {
var osc = SinOsc.ar(( \\freq.kr(60) + \\fplus.kr(0) ), mul: 1, add: 0);
var noise = BrownNoise.ar(\\noise.kr(0), (1 - \\noise.kr(0)));
var sig = osc * noise;
Pan2.ar( sig * \\amp.kr(0), \\pan.kr(0) );
};
)" ], [ 397.322708, 'alex', "p.clock.tempo_(60/60);" ], [ 396.8306799, 'joach', "~jDrum.play(vol: 0.7, fadeTime: 28);" ], [ 393.3376441, 'joach', "~jDrum.play(vol: 0.2, fadeTime: 28);" ], [ 390.6426356, 'alex', "p.clock.tempo_(260/60);" ], [ 387.3356033, 'joach', "p.clock.tempo_(240/60);" ], [ 383.7365631, 'joach', "p = ProxySpace.push(s).makeTempoClock;" ], [ 379.3395538, 'alex', "(octave: [4,1,2],strum:1,dur:14,degree:[4,7,5,6], sustain:20, amp:0.1).play;" ], [ 370.6995417, 'alex', "(octave: [4,1,8],strum:1,dur:14,degree:[4,7,5,6], sustain:20, amp:0.1).play;" ], [ 366.0995353, 'alex', "(octave: [4,1],strum:1,dur:14,degree:[4,7,5,6], sustain:20, amp:0.1).play;" ], [ 361.8095292, 'alex', "(octave: [4,1],strum:0.4,dur:14,degree:[4,7,5,6], sustain:20, amp:0.1).play;" ], [ 352.9985169, 'alex', "(octave: [4,1],strum:0.4,dur:4,degree:[4,7,5,6], sustain:20, amp:0.1).play;" ], [ 340.3284991, 'alex', "(octave: [4,1],strum:0.4,dur:4, sustain:20, amp:0.1).play;" ], [ 339.2904671, 'joach', "(
~jDrum[0] = {
var osc = SinOsc.ar(( \\freq.kr(60) + \\fplus.kr(0) ), mul: 1, add: 0);
var noise = BrownNoise.ar(\\noise.kr(0), (1 - \\noise.kr(0)));
var sig = osc * noise;
Pan2.ar( sig * \\amp.kr(0), \\pan.kr(0) );
};
)" ], [ 335.4254592, 'alex', "(octave: [4,1],strum:0.4, sustain:20, amp:0.1).play;" ], [ 332.1844228, 'joach', "~jDrum.play(vol: 0.0, fadeTime: 8);" ], [ 327.8224154, 'alex', "(octave: [4,1], sustain:20, amp:0.1).play;" ], [ 323.8414098, 'alex', "(octave: [4,6,1], sustain:20, amp:0.1).play;" ], [ 319.1014032, 'alex', "(octave: [4,6,7,1], sustain:20, amp:0.1).play;" ], [ 317.0814003, 'alex', "(octave: [4,6,7,1], sustain:20, amp:0.1).play;" ], [ 314.9513974, 'alex', "(octave: [4,6,7,15], sustain:20, amp:0.1).play;" ], [ 311.9613932, 'alex', "(octave: [4,6,7,9], sustain:20, amp:0.1).play;" ], [ 308.4413882, 'alex', "(octave: [4,6,7], sustain:20, amp:0.1).play;" ], [ 301.5613786, 'alex', "(octave: [4,3,7], sustain:20, amp:0.1).play;" ], [ 300.5203442, 'joach', "(octave:[2,3,4,5], strum:2, amp:0.8, sustain:10).play" ], [ 295.9403378, 'alex', "(octave: [4,3,1], sustain:20, amp:0.2).play;" ], [ 294.4033068, 'joach', "(octave:[2,3,4,5], strum:2, amp:0.2, sustain:10).play" ], [ 288.6082945, 'alex', "(octave: [4,3,5], sustain:20, amp:0.3).play;" ], [ 283.1582868, 'alex', "(octave: [4,3,1], sustain:20, amp:0.2).play;" ], [ 278.7862494, 'joach', "(octave:[2,3,4,5], strum:0.2, amp:0.2, sustain:10).play" ], [ 276.2072441, 'alex', "(octave: [4,3,1], sustain:20, amp:1).play;" ], [ 273.0672397, 'alex', "(octave: [4,3,6], sustain:20, amp:1).play;" ], [ 271.5832079, 'joach', "(octave:[2,3,4,5], strum:0.2, amp:1, sustain:10).play" ], [ 267.5001981, 'alex', "(octave: [4,3], sustain:20, amp:1).play;" ], [ 265.249167, 'joach', "(octave:[2,3,4,5], strum:0.2, amp:1, sustain:10).play" ], [ 245.3491341, 'alex', "(octave: [4,3], sustain:20, amp:1).play;" ], [ 242.3191298, 'alex', "(octave: [1,3], sustain:20, amp:1).play;" ], [ 239.9791266, 'alex', "(octave: [1,-2], sustain:20, amp:1).play;" ], [ 232.419116, 'alex', "(octave: [2,3,1,-2], sustain:20, amp:1).play;" ], [ 226.1550752, 'joach', "(octave:4, amp:1, sustain:0.010).play" ], [ 225.8260737, 'alex', "(octave: [2,3,1], sustain:20, amp:1).play;" ], [ 225.1670399, 'joach', "(octave:4, amp:1, sustain:0.010).play" ], [ 224.1880073, 'joach', "(octave:4, amp:1, sustain:0.010).play" ], [ 223.3109756, 'joach', "(octave:4, amp:1, sustain:0.010).play" ], [ 222.3339409, 'joach', "(octave:4, amp:1, sustain:0.010).play" ], [ 221.4569041, 'joach', "(octave:4, amp:1, sustain:0.010).play" ], [ 220.5858705, 'joach', "(octave:4, amp:1, sustain:0.010).play" ], [ 219.5998358, 'joach', "(octave:4, amp:1, sustain:0.010).play" ], [ 218.5078018, 'joach', "(octave:4, amp:1, sustain:0.010).play" ], [ 216.3797967, 'alex', "(octave: [2,3,7], sustain:20, amp:1).play;" ], [ 214.9027664, 'joach', "(octave:4, amp:1, sustain:0.10).play" ], [ 211.0857562, 'alex', "(octave: [2,3,7], sustain:0.1, amp:1).play;" ], [ 210.3357551, 'alex', "(octave: [2,3,7], sustain:0.1, amp:1).play;" ], [ 209.4257538, 'alex', "(octave: [2,3,7], sustain:0.1, amp:1).play;" ], [ 207.8457516, 'alex', "(octave: [2,3,7], sustain:0.11, amp:1).play;" ], [ 202.6957444, 'alex', "(octave: [2,3,7], sustain:1, amp:1).play;" ], [ 200.2737113, 'joach', "~jDrum.play(vol: 0.0, fadeTime: 8);" ], [ 199.2937066, 'alex', "(octave: [2,3], sustain:1, amp:1).play;" ], [ 194.3236997, 'alex', "(octave: [2,3], sustain:10, amp:1).play;" ], [ 192.5836972, 'alex', "(octave: [2,2], sustain:10, amp:1).play;" ], [ 190.4436942, 'alex', "(octave: [2,5], sustain:10, amp:1).play;" ], [ 184.8236864, 'alex', "(octave: [2,1], sustain:10, amp:1).play;" ], [ 173.5146416, 'joach', "(octave:4, amp:1, sustain:10).play" ], [ 172.4046255, 'alex', "(octave: [2,1], sustain:10, amp:1).play;" ], [ 171.9916024, 'joach', "(octave:34, amp:1, sustain:10).play" ], [ 167.4405631, 'alex', "(octave: [4,1], sustain:10, amp:1).play;" ], [ 165.6585276, 'joach', "(octave:4, amp:1, sustain:10).play" ], [ 164.5635252, 'alex', "(octave: [4,3], sustain:10, amp:1).play;" ], [ 162.7044897, 'joach', "(octave:8, amp:1, sustain:10).play" ], [ 160.091453, 'joach', "(octave:2, amp:1, sustain:10).play" ], [ 156.6214481, 'alex', "(octave: [2,3], sustain:10, amp:1).play;" ], [ 138.2483943, 'joach', "(octave:2, amp:1, sustain:10).play" ], [ 125.5793437, 'joach', "(octave:2, amp:1, sustain:10).play" ], [ 111.7082908, 'joach', "(octave:2, amp:1).play" ], [ 101.773242, 'joach', "(octave:2).play" ], [ 92.9832269, 'alex', "p.clock.tempo_(60/60);" ], [ 91.6171928, 'joach', "().play" ], [ 90.13319, 'alex', "p = ProxySpace.push(s).makeTempoClock;" ], [ 85.403183400001, 'alex', "().play;" ], [ 5.6780391000002, 'joach', "AutoIDE.run" ], [ 0, 'joach', "Kolektiv.print" ] ]