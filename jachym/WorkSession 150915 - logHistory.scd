// History, as it was on __date_time_please__.

[
[ 0, 'alex', "Kolektiv.print;" ],
[ 20.5211737, 'tester', "p = ProxySpace.push(s).makeTempoClock;" ],
[ 22.152267, 'tester', "p.clock.tempo_(120/60);" ],
[ 30.8727658, 'tester', "~jSaw.play(vol: 0.4, fadeTime: 28);" ],
[ 32.16984, 'tester', "(
~jSaw[0] = {
	var osc = LFSaw.ar(( \\freq.kr(60) + \\fplus.kr(0) ), mul: 1, add: 0);
	var noise = BrownNoise.ar(\\noise.kr(0), (1 - \\noise.kr(0)));
	var sig = osc * noise;
	Pan2.ar( sig * \\amp.kr(0), \\pan.kr(0) );
};
)" ],
[ 33.7539306, 'tester', "(
~jSaw[1] = \\set -> QuantEnv(\\amp, 8)
.phase(1, [0,(1,0.9..0.7),0.2], [0.05, 1.45], [2,-8], 0, 1)
.phase(2, [0,1,0], [5.35, 0.65], [\\sin,-8], 0, 1)
.play([1,2]);
)" ],
[ 36.8981105, 'tester', "(
~jSaw[2] = \\set -> QuantEnv(\\freq, 16)
.phase(1, [60,66,60], [8.05, 2.95], [2,-2], 0, 4)
.phase(2, [80,98,90], [12.35, 0.65], [2,-2], 0, 1)
.phase(3, [100,128,90], [3.35, 8.65], [2,-2], 0, 1)
.play([1,2,1,3]);
)" ],
[ 40.6113228, 'tester', "~jSaw[3] = \\filter -> {|in| LPF.ar(in, \\lpf_freq.kr(800,8)) };" ],
[ 41.4863729, 'tester', "~jSaw[4] = \\filter -> {|in| GVerb.ar(in, \\gverb_size.kr(60, 4), \\gverb_time.kr(4, 1)) };" ],
[ 42.1554112, 'alex', "(
~c[0]={
	var sig, env, fenv;

	env=EnvGen.kr(Env([0,1,0], [0.1, 3],[\\welch, \\lin]),\\trig.tr);
	fenv=EnvGen.kr(Env([\\freq.kr,\\freq.kr*\\top.kr(4), \\freq.kr], [0.01, 0.04],[\\welch, \\lin]),\\trig.tr);

	sig=LFPulse.ar([1,2,3,5]/7,0,[0.1,0.5,0.7])*VarSaw.ar(fenv!2);
	sig=sig*env;
};)" ],
[ 44.1135231, 'alex', "~c[1]=\\set->Pbind(\\args, [\\trig], \\dur, 2, \\trig,1);" ],
[ 44.774561, 'alex', "~c[2]=\\set-> Pbind(\\args, [\\freq], \\dur, 2, \\freq,Pseq([Pn(65,4), Pn(45, 2), Prand([75,64,78],2)],inf));" ],
[ 45.4295984, 'alex', "~c[30]=\\filter-> {arg in; Balance2.ar(in, in+(GrayNoise.ar(LFNoise1.kr(0.5).range(0.1,0.5))*Decay.ar(Impulse.ar([0.5,0.25]),0.01)),0)};" ],
[ 47.0696922, 'alex', "~c[31]=\\filter-> {arg in; GVerb.ar(in,roomsize:SinOsc.kr(SinOsc.kr(0.125).range(0.5,4)).range(10,80),add:in)};" ],
[ 51.3219354, 'alex', "~c.play( vol:0.4, fadeTime:2).quant_(1);" ],
[ 69.5469779, 'tester', "(
~jSaw[5] = \\set -> QuantEnv(\\fplus, 0.5)
.phase(1, [0,470,0], [0.01, 0.24], [16,-8], 0, 8).plot
.phase(2, [0,1000,0], [0.105, 0.65], [\\step,\\step], 0, 1).plot
.play([1,2]);
)" ],
[ 90.9422016, 'tester', "(
~jSaw[5] = \\set -> QuantEnv(\\fplus, 0.5)
.phase(1, [0,470,0], [0.01, 0.24], [16,-8], 0, 8)
.phase(2, [0,1000,0], [0.105, 0.65], [\\step,\\step], 0, 4)
.play([1,2]);
)" ],
[ 102.7468768, 'tester', "(
~jSaw[5] = \\set -> QuantEnv(\\fplus, 0.5)
.phase(1, [0,470,0], [0.01, 0.24], [16,-8], 0, 8)
.phase(2, [0,1000,0], [0.105, 0.65], [\\step,\\step], 0, 4)
.play([1,1,1,1,2]);
)" ],
[ 119.359827, 'alex', "~c[31]=\\filter-> {arg in; GVerb.ar(in,roomsize:SinOsc.kr(SinOsc.kr(0.125).range(0.5,4)).range(10,80),drylevel:SinOsc.kr(0.125).range(0.2,1),add:in)};" ],
[ 125.2421634, 'tester', "(
~jSaw[5] = \\set -> QuantEnv(\\fplus, 0.5)
.phase(1, [0,470,0], [0.01, 0.24], [16,-8], 0, 8)
.phase(2, [0,1000,0], [0.105, 0.65], [\\step,\\step], 0, 1)
.phase(5, [0,00,0], [0.105, 0.65], [\\step,\\step], 0, 4)
.play([1,1,1,2,1,1,1,3]);
)" ],
[ 131.249507, 'tester', "(
~jSaw[5] = \\set -> QuantEnv(\\fplus, 0.5)
.phase(1, [0,470,0], [0.01, 0.24], [16,-8], 0, 8)
.phase(2, [0,1000,0], [0.105, 0.65], [\\step,\\step], 0, 1)
.phase(5, [0,2000,0], [0.105, 0.65], [\\step,\\step], 0, 4)
.play([1,1,1,2,1,1,1,3]);
)" ],
[ 133.9926639, 'alex', "~c[31]=\\filter-> {arg in; GVerb.ar(in,roomsize:SinOsc.kr(SinOsc.kr(0.125).range(0.5,4)).range(10,80),revtime:5,drylevel:SinOsc.kr(0.125).range(0.2,1),add:in)};" ],
[ 136.3838007, 'tester', "(
~jSaw[5] = \\set -> QuantEnv(\\fplus, 0.5)
.phase(1, [0,470,0], [0.01, 0.24], [16,-8], 0, 8)
.phase(2, [0,1000,0], [0.105, 0.65], [\\step,\\step], 0, 1)
.phase(3, [0,2000,0], [0.105, 0.65], [\\step,\\step], 0, 4)
.play([1,1,1,2,1,1,1,3]);
)" ],
[ 139.8890012, 'alex', "~c[31]=\\filter-> {arg in; GVerb.ar(in,roomsize:SinOsc.kr(SinOsc.kr(0.125).range(0.5,4)).range(10,80),revtime:15,drylevel:SinOsc.kr(0.125).range(0.2,1),add:in)};" ],
[ 143.278195, 'alex', "~c[31]=\\filter-> {arg in; GVerb.ar(in,roomsize:SinOsc.kr(SinOsc.kr(0.125).range(0.5,4)).range(10,80),revtime:5,drylevel:SinOsc.kr(0.125).range(0.2,1),add:in)};" ],
[ 146.4353756, 'alex', "~c.clear;" ],
[ 189.678849, 'alex', "~c[31]=nil;" ],
[ 200.4924675, 'alex', "~c[31]=\\filter-> {arg in; GVerb.ar(in,roomsize:SinOsc.kr(SinOsc.kr(0.125).range(0.5,4)).range(10,80),revtime:5,drylevel:SinOsc.kr(0.125).range(0.2,1),add:in)};" ],
[ 202.6755924, 'alex', "~c.play( vol:0.4, fadeTime:2).quant_(1);" ],
[ 220.6796222, 'tester', "p.clock.tempo_(240/60);" ],
[ 223.4207789, 'alex', "~c.play( vol:0.4, fadeTime:2).quant_(1);" ],
[ 224.1938232, 'alex', "(
~c[0]={
	var sig, env, fenv;

	env=EnvGen.kr(Env([0,1,0], [0.1, 3],[\\welch, \\lin]),\\trig.tr);
	fenv=EnvGen.kr(Env([\\freq.kr,\\freq.kr*\\top.kr(4), \\freq.kr], [0.01, 0.04],[\\welch, \\lin]),\\trig.tr);

	sig=LFPulse.ar([1,2,3,5]/7,0,[0.1,0.5,0.7])*VarSaw.ar(fenv!2);
	sig=sig*env;
};)" ],
[ 226.6979664, 'alex', "~c[1]=\\set->Pbind(\\args, [\\trig], \\dur, 2, \\trig,1);" ],
[ 227.6800226, 'alex', "~c[2]=\\set-> Pbind(\\args, [\\freq], \\dur, 2, \\freq,Pseq([Pn(65,4), Pn(45, 2), Prand([75,64,78],2)],inf));" ],
[ 228.3420604, 'alex', "~c[30]=\\filter-> {arg in; Balance2.ar(in, in+(GrayNoise.ar(LFNoise1.kr(0.5).range(0.1,0.5))*Decay.ar(Impulse.ar([0.5,0.25]),0.01)),0)};" ],
[ 245.2510276, 'tester', "p.clock.tempo_(60/60);" ],
[ 262.0679894, 'tester', "p.clock.tempo_(120/60);" ],
[ 265.679196, 'tester', "(
~jSaw[1] = \\set -> QuantEnv(\\amp, 8)
.phase(1, [0,(1,0.9..0.7),0.2], [0.05, 1.45], [2,-8], 0, 1)
.phase(2, [0,1,0], [5.35, 0.65], [\\sin,-8], 0, 1)
.play([1,2]);
)" ],
[ 266.7742586, 'tester', "(
~jSaw[2] = \\set -> QuantEnv(\\freq, 16)
.phase(1, [60,66,60], [8.05, 2.95], [2,-2], 0, 4)
.phase(2, [80,98,90], [12.35, 0.65], [2,-2], 0, 1)
.phase(3, [100,128,90], [3.35, 8.65], [2,-2], 0, 1)
.play([1,2,1,3]);
)" ],
[ 268.5193584, 'tester', "~jSaw[3] = \\filter -> {|in| LPF.ar(in, \\lpf_freq.kr(800,8)) };" ],
[ 273.9886713, 'alex', "~c[32]=\\filter-> {arg in; LPF.ar(in,\\lpf.kr(400))};" ],
[ 275.6137642, 'tester', "(
~jSaw[5] = \\set -> QuantEnv(\\fplus, 0.5)
.phase(1, [0,470,0], [0.01, 0.24], [16,-8], 0, 8)
.phase(2, [0,1000,0], [0.105, 0.65], [\\step,\\step], 0, 1)
.phase(3, [0,2000,0], [0.105, 0.65], [\\step,\\step], 0, 4)
.play([1,1,1,2,1,1,1,3]);
)" ],
[ 281.1840828, 'tester', "(
~jSaw[5] = \\set -> QuantEnv(\\fplus, 0.5)
.phase(1, [0,870,0], [0.01, 0.24], [16,-8], 0, 8)
.phase(2, [0,1000,0], [0.105, 0.65], [\\step,\\step], 0, 1)
.phase(3, [0,2000,0], [0.105, 0.65], [\\step,\\step], 0, 4)
.play([1,1,1,2,1,1,1,3]);
)" ],
[ 286.3153763, 'tester', "(
~jSaw[5] = \\set -> QuantEnv(\\fplus, 0.5)
.phase(1, [0,807,0], [0.01, 0.24], [16,-8], 0, 8)
.phase(2, [0,1000,0], [0.105, 0.65], [\\step,\\step], 0, 1)
.phase(3, [0,2000,0], [0.105, 0.65], [\\step,\\step], 0, 4)
.play([1,1,1,2,1,1,1,3]);
)" ],
[ 310.5647633, 'alex', "~c[33]=\\set->Pbind(\\args, [\\lpf], \\dur, 2, \\lpf,Pseq([400,1200,200,400],inf));" ],
[ 313.1789128, 'tester', "~jSaw.play(vol: 0.8, fadeTime: 28);" ],
[ 330.2208876, 'alex', "~c[33]=\\set->Pbind(\\args, [\\lpf], \\dur, 2, \\lpf,Pseq([400,1200,2000,4000],inf));" ],
[ 334.5841371, 'tester', "(
~jSaw[6] = \\set -> QuantEnv(\\noise, 24)
.phase(1, [0,0.1,0], [22.05, 0.95], [2,-2], 0, 1)
.phase(2, [0,1,0], [0.35, 0.65], [2,-2], 0, 1)
.play([1,2]);
)" ],
[ 348.5629367, 'tester', "(
~jSaw[6] = \\set -> QuantEnv(\\noise, 24)
.phase(1, [0,0.1,0], [22.05, 0.95], [2,-2], 0, 1)
.phase(2, [0,1,0], [8.35, 0.65], [2,-2], 0, 1)
.play([1,2]);
)" ],
[ 352.9321866, 'tester', "(
~jSaw[6] = \\set -> QuantEnv(\\noise, 24)
.phase(1, [0,0.1,0], [22.05, 0.95], [2,-2], 0, 1)
.phase(2, [0,0.4,0], [8.35, 0.65], [2,-2], 0, 1)
.play([1,2]);
)" ],
[ 377.9876197, 'tester', "~jSaw[6].stop(16)" ],
[ 387.1071413, 'tester', "~jDrum.play(vol: 0.0, fadeTime: 8);" ],
[ 396.1826604, 'tester', "(
~jSaw[0] = {
var osc = SinOsc.ar(( \\freq.kr(60) + \\fplus.kr(0) ), mul: 1, add: 0);
var noise = BrownNoise.ar(\\noise.kr(0), (1 - \\noise.kr(0)));
var sig = osc * noise;
Pan2.ar( sig * \\amp.kr(0), \\pan.kr(0) );
};
)" ],
[ 429.2255503, 'tester', "~jSaw.stop(16)" ],
[ 454.3759888, 'tester', "p.clock.tempo_(240/60);" ],
[ 468.2447821, 'tester', "~jSaw.play(vol: 0.8, fadeTime: 8);" ],
[ 472.4280213, 'tester', "(
~jSaw[6] = \\set -> QuantEnv(\\noise, 24)
.phase(1, [0,0.1,0], [22.05, 0.95], [2,-2], 0, 1)
.phase(2, [0,0.4,0], [8.35, 0.65], [2,-2], 0, 1)
.play([1,2]);
)" ],
[ 483.4346509, 'tester', "(
~jDrum[0] = {
var osc = SinOsc.ar(( \\freq.kr(60) + \\fplus.kr(0) ), mul: 1, add: 0);
var noise = BrownNoise.ar(\\noise.kr(0), (1 - \\noise.kr(0)));
var sig = osc * noise;
Pan2.ar( sig * \\amp.kr(0), \\pan.kr(0) );
};
)" ],
[ 486.0668014, 'tester', "(
~jSaw[0] = {
	var osc = LFSaw.ar(( \\freq.kr(60) + \\fplus.kr(0) ), mul: 1, add: 0);
	var noise = BrownNoise.ar(\\noise.kr(0), (1 - \\noise.kr(0)));
	var sig = osc * noise;
	Pan2.ar( sig * \\amp.kr(0), \\pan.kr(0) );
};
)" ],
[ 500.7936438, 'tester', "(
~jDrum[1] = \\set -> QuantEnv(\\amp, 1)
.phase(1, [0,1,0], [0.05, 0.95], [2,-2], 0, 8)
.phase(2, [0,1,0], [0.35, 0.65], [2,-2], 0, 1)
.play([1,2]);
)" ],
[ 512.6973246, 'tester', "(
~jDrum[1] = \\set -> QuantEnv(\\amp, 1)
.phase(1, [0.6,1,0.6], [0.05, 0.95], [2,-2], 0, 8)
.phase(2, [0,1,0], [0.35, 0.65], [2,-2], 0, 1)
.play([1,2]);
)" ],
[ 520.2267553, 'tester', "~jDrum.play(vol: 0.9, fadeTime: 8);" ],
[ 551.5685479, 'tester', "(
~jDrum[2] = \\set -> QuantEnv(\\flpus, 1)
.phase(1, [0,1000,0], [0.005, 0.15], [2,-2], 0, 1)
.phase(2, [0,1,0], [0.35, 0.65], [2,-2], 0, 1)
.play([1,2]);
)" ],
[ 569.1475534, 'tester', "(
~jDrum[2] = \\set -> QuantEnv(\\flpus, 1)
.phase(1, [0,1000,0], [0.005, 0.15], [8,-8], 0, 1)
.phase(2, [0,1,0], [0.35, 0.65], [2,-2], 0, 1)
.play([1,2]);
)" ],
[ 588.3686528, 'tester', "~jDrum.stop(6);" ],
[ 591.7528463, 'tester', "~jSaw.stop(6)" ],
[ 1852.8269756, 'tester', "~jDrum.play(vol: 0.9, fadeTime: 8);" ],
[ 1854.0370449, 'tester', "(
~jDrum[0] = {
var osc = SinOsc.ar(( \\freq.kr(60) + \\fplus.kr(0) ), mul: 1, add: 0);
var noise = BrownNoise.ar(\\noise.kr(0), (1 - \\noise.kr(0)));
var sig = osc * noise;
Pan2.ar( sig * \\amp.kr(0), \\pan.kr(0) );
};
)" ],
[ 1855.1261071, 'tester', "(
~jDrum[1] = \\set -> QuantEnv(\\amp, 1)
.phase(1, [0.6,1,0.6], [0.05, 0.95], [2,-2], 0, 8)
.phase(2, [0,1,0], [0.35, 0.65], [2,-2], 0, 1)
.play([1,2]);
)" ],
[ 1856.3241757, 'tester', "(
~jDrum[2] = \\set -> QuantEnv(\\flpus, 1)
.phase(1, [0,1000,0], [0.005, 0.15], [8,-8], 0, 1)
.phase(2, [0,1,0], [0.35, 0.65], [2,-2], 0, 1)
.play([1,2]);
)" ],
[ 1864.4086381, 'tester', "(
~jDrum[2] = \\set -> QuantEnv(\\fplus, 1)
.phase(1, [0,1000,0], [0.005, 0.15], [8,-8], 0, 1)
.phase(2, [0,1,0], [0.35, 0.65], [2,-2], 0, 1)
.play([1,2]);
)" ],
[ 1872.4861001, 'tester', "(
~jDrum[2] = \\set -> QuantEnv(\\fplus, 1)
.phase(1, [0,1000,0], [0.005, 0.15], [8,-8], 0, 1)
.phase(2, [0,8000,0], [0.35, 0.65], [2,-2], 0, 1)
.play([1,2]);
)" ],
[ 1875.9802999, 'tester', "(
~jDrum[2] = \\set -> QuantEnv(\\fplus, 1)
.phase(1, [0,1000,0], [0.005, 0.15], [8,-8], 0, 1)
.phase(2, [0,2000,0], [0.35, 0.65], [2,-2], 0, 1)
.play([1,2]);
)" ],
[ 1879.5865062, 'tester', "(
~jDrum[2] = \\set -> QuantEnv(\\fplus, 1)
.phase(1, [0,1000,0], [0.005, 0.15], [8,-8], 0, 1)
.phase(2, [0,2000,0], [0.35, 0.065], [2,-2], 0, 1)
.play([1,2]);
)" ],
[ 1884.0617622, 'tester', "(
~jDrum[2] = \\set -> QuantEnv(\\fplus, 1)
.phase(1, [0,1000,0], [0.005, 0.15], [8,-8], 0, 1)
.phase(2, [0,200,0], [0.35, 0.065], [2,-2], 0, 1)
.play([1,2]);
)" ],
[ 1884.1327662, 'alex', "~c[2]=\\set-> Pbind(\\args, [\\freq], \\dur, 2, \\freq,Pseq([Pn(85,4), Pn(95, 2), Prand([75,64,78],2)],inf));" ],
[ 1891.0491618, 'tester', "(
~jDrum[2] = \\set -> QuantEnv(\\fplus, 1)
.phase(1, [0,1000,0], [0.005, 0.15], [8,-8], 0, 4)
.phase(2, [0,200,0], [0.35, 0.065], [2,-2], 0, 1)
.play([1,2]);
)" ],
[ 1893.7903186, 'alex', "~c[33]=\\set->Pbind(\\args, [\\lpf], \\dur, 2, \\lpf,Pseq([200,120,800,4000],inf));" ],
[ 1896.9524995, 'tester', "(
~jDrum[2] = \\set -> QuantEnv(\\fplus, 1)
.phase(1, [0,1000,0], [0.005, 0.15], [8,-8], 0, 4)
.phase(2, [0,200,0], [0.035, 0.065], [2,-2], 0, 1)
.play([1,2]);
)" ],
[ 1898.482587, 'alex', "~c[1]=\\set->Pbind(\\args, [\\trig], \\dur, 4, \\trig,1);" ],
[ 1907.661112, 'alex', "(
~c[0]={
	var sig, env, fenv;

	env=EnvGen.kr(Env([0,1,0], [0.1, 5],[\\welch, \\lin]),\\trig.tr);
	fenv=EnvGen.kr(Env([\\freq.kr,\\freq.kr*\\top.kr(4), \\freq.kr], [0.01, 0.04],[\\welch, \\lin]),\\trig.tr);

	sig=LFPulse.ar([1,2,3,5]/7,0,[0.1,0.5,0.7])*VarSaw.ar(fenv!2);
	sig=sig*env;
};)" ],
[ 1909.287205, 'tester', "(
~jDrum[2] = \\set -> QuantEnv(\\fplus, 1)
.phase(1, [0,1000,0], [0.005, 0.15], [8,-8], 0, 4)
.phase(2, [0,400,0], [0.035, 0.065], [2,-2], 0, 1)
.play([1,2]);
)" ],
[ 1912.3503802, 'alex', "~c.play( vol:0.4, fadeTime:2).quant_(1);" ],
[ 1924.2590613, 'alex', "~c[31]=\\filter-> {arg in; GVerb.ar(in,roomsize:SinOsc.kr(SinOsc.kr(0.125).range(0.5,4)).range(10,80),revtime:15,drylevel:SinOsc.kr(0.125).range(0.2,1),add:in)};" ],
[ 1933.9726169, 'tester', "~jDrum[4] = \\filter -> {|in| GVerb.ar(in, \\gverb_size.kr(60, 4), \\gverb_time.kr(1)) };" ],
[ 1949.2584912, 'tester', "(
~jDrum[5] = \\set -> QuantEnv(\\gverb_time, 1)
.phase(1, [0,1,0], [0.05, 0.95], [2,-2], 0, 1)
.phase(2, [0,1,0], [0.35, 0.65], [2,-2], 0, 1)
.play([1,2]);
)" ],
[ 1954.9438164, 'tester', "~jDrum.stop(6);" ],
[ 1955.2678349, 'alex', "~c.clear;" ],
[ 1958.0979968, 'tester', "~jDrum.stop(1);" ],
[ 1975.5839969, 'alex', "(
~f[0]={
	var sig, env, fenv;

	env=EnvGen.kr(Env([0,1,0], [0.1, 3],[\\welch, \\lin]),\\trig.tr);
	sig=SinOsc.ar(\\freq.kr(400)*([1,2,3,5]/4));
	sig=sig*env;
};)" ],
[ 1978.1991465, 'alex', "~f[1]=\\set->Pbind(\\args, [\\trig], \\dur, 4, \\trig,1);" ],
[ 1978.9681905, 'alex', "~f[2]=\\set-> Pbind(\\args, [\\freq], \\dur, 2, \\freq,Pseq([Pn(1650,4), Pn(1450, 2), Prand([75,64,78],2)],inf));" ],
[ 1979.6252281, 'alex', "~f[31]=\\filter-> {arg in; GVerb.ar(in,roomsize:40,revtime:5,drylevel:SinOsc.kr(0.125).range(0.2,1),add:in)};" ],
[ 1983.3314401, 'alex', "~f.play( vol:0.4, fadeTime:2).quant_(1);" ],
[ 1991.8529275, 'alex', "~f.play( vol:0.1, fadeTime:2).quant_(1);" ],
[ 2002.3425274, 'alex', "~f[31]=\\filter-> {arg in; GVerb.ar(in,roomsize:40,revtime:25,drylevel:SinOsc.kr(0.125).range(0.2,1),add:in)};" ],
[ 2004.9526767, 'tester', "(
~jDrum[5] = \\set -> QuantEnv(\\gverb_time, 1)
.phase(1, [0.25,1,0.25], [0.05, 0.95], [2,-2], 0, 1)
.phase(2, [0.25,4,0.25], [0.35, 0.65], [2,-2], 0, 1)
.play([1,2]);
)" ],
[ 2008.6598888, 'tester', "~jDrum.play(vol: 0.1, fadeTime: 8);" ],
[ 2012.7091204, 'alex', "~f[32]=\\filter-> {arg in; LPF.ar(in,\\lpf.kr(600))};" ],
[ 2013.5701696, 'tester', "~jDrum.stop(1);" ],
[ 2020.7945828, 'alex', "~f[32]=\\filter-> {arg in; LPF.ar(in,\\lpf.kr(200))};" ],
[ 2025.0468261, 'alex', "~f[33]=\\set->Pbind(\\args, [\\lpf], \\dur, 2, \\lpf,Pseq([400,1200,2000,4000],inf));" ],
[ 2040.0026815, 'tester', "~jSaw.play(vol: 0.1, fadeTime: 8);" ],
[ 2043.718894, 'alex', "~f[2]=\\set-> Pbind(\\args, [\\freq], \\dur, 2, \\freq,Pseq([Pn(1650,4), Pn(1450, 2), Prand([750,640,780,75,85],2)],inf));" ],
[ 2070.6934369, 'alex', "~f[33]=\\set->Pbind(\\args, [\\lpf], \\dur, 2, \\lpf,Pseq([400,1200,2000,4000,200],inf));" ],
[ 2071.2054662, 'tester', "(
~jSaw[1] = \\set -> QuantEnv(\\amp, 8)
.phase(1, [0,(1,0.9..0.1),0.2], [0.05, 1.45], [2,-8], 0, 1)
.phase(2, [0,1,0], [5.35, 0.65], [\\sin,-8], 0, 1)
.play([1,2]);
)" ],
[ 2075.2826994, 'tester', "(
~jSaw[1] = \\set -> QuantEnv(\\amp, 8)
.phase(1, [0,(1,0.9..0.1),0.2], [0.05, 1.45], [2,-8], 0, 1).plot
.phase(2, [0,1,0], [5.35, 0.65], [\\sin,-8], 0, 1)
.play([1,2]);
)" ],
[ 2080.853018, 'alex', "~f.play( vol:0.071, fadeTime:2).quant_(1);" ],
[ 2083.4631673, 'tester', "~jSaw.play(vol: 0.4, fadeTime: 8);" ],
[ 2087.0743738, 'tester', "(
~jSaw[0] = {
	var osc = LFSaw.ar(( \\freq.kr(600) + \\fplus.kr(0) ), mul: 1, add: 0);
	var noise = BrownNoise.ar(\\noise.kr(0), (1 - \\noise.kr(0)));
	var sig = osc * noise;
	Pan2.ar( sig * \\amp.kr(0), \\pan.kr(0) );
};
)" ],
[ 2100.0721173, 'alex', "(
~c[0]={
	var sig, env, fenv;

	env=EnvGen.kr(Env([0,1,0], [0.1,05],[\\welch, \\lin]),\\trig.tr);
	fenv=EnvGen.kr(Env([\\freq.kr,\\freq.kr*\\top.kr(4), \\freq.kr], [0.01, 0.04],[\\welch, \\lin]),\\trig.tr);

	sig=LFPulse.ar([1,2,3,5]/7,0,[0.1,0.5,0.7])*VarSaw.ar(fenv!2);
	sig=sig*env;
};)" ],
[ 2103.6703231, 'alex', "~c[1]=\\set->Pbind(\\args, [\\trig], \\dur, 2, \\trig,1);" ],
[ 2104.6533793, 'alex', "~c[2]=\\set-> Pbind(\\args, [\\freq], \\dur, 2, \\freq,Pseq([Pn(85,4), Pn(95, 2), Prand([75,64,78],2)],inf));" ],
[ 2106.9485106, 'alex', "~c.play( vol:0.4, fadeTime:2).quant_(1);" ],
[ 2107.3875357, 'tester', "(
~jSaw[1] = \\set -> QuantEnv(\\amp, 8)
.phase(1, [0,(1,0.9..0.4),0.2], [0.05, 1.45], [2,-8], 0, 1).plot
.phase(2, [0,1,0], [5.35, 0.65], [\\sin,-8], 0, 1)
.play([1,2]);
)" ],
[ 2112.4068228, 'tester', "(
~jSaw[1] = \\set -> QuantEnv(\\amp, 8)
.phase(1, [0,(1,0.9..0.5),0.2], [0.05, 1.45], [2,-8], 0, 1).plot
.phase(2, [0,1,0], [5.35, 0.65], [\\sin,-8], 0, 1)
.play([1,2]);
)" ],
[ 2114.7039541, 'tester', "(
~jSaw[1] = \\set -> QuantEnv(\\amp, 8)
.phase(1, [0,(1,0.9..0.6),0.2], [0.05, 1.45], [2,-8], 0, 1).plot
.phase(2, [0,1,0], [5.35, 0.65], [\\sin,-8], 0, 1)
.play([1,2]);
)" ],
[ 2117.1070916, 'alex', "~c[30]=\\filter-> {arg in; Balance2.ar(in, in+(GrayNoise.ar(LFNoise1.kr(0.5).range(0.1,0.5))*Decay.ar(Impulse.ar([0.5,0.25]),0.01)),0)};" ],
[ 2117.9851418, 'alex', "~c[31]=\\filter-> {arg in; GVerb.ar(in,roomsize:SinOsc.kr(SinOsc.kr(0.125).range(0.5,4)).range(10,80),revtime:15,drylevel:SinOsc.kr(0.125).range(0.2,1),add:in)};" ],
[ 2118.8501913, 'tester', "(
~jSaw[1] = \\set -> QuantEnv(\\amp, 8)
.phase(1, [0,(1,0.9..0.7),0.2], [0.05, 1.45], [2,-8], 0, 1).plot
.phase(2, [0,1,0], [5.35, 0.65], [\\sin,-8], 0, 1)
.play([1,2]);
)" ],
[ 2119.5182295, 'alex', "~c[32]=\\filter-> {arg in; LPF.ar(in,\\lpf.kr(400))};" ],
[ 2121.9083662, 'alex', "~c.clear;" ],
[ 2133.5960347, 'tester', "(
~jSaw[2] = \\set -> QuantEnv(\\freq, 16)
.phase(1, [160,66,60], [8.05, 2.95], [2,-2], 0, 4)
.phase(2, [80,98,90], [12.35, 0.65], [2,-2], 0, 1)
.phase(3, [100,128,90], [3.35, 8.65], [2,-2], 0, 1)
.play([1,2,1,3]);
)" ],
[ 2138.0702906, 'tester', "(
~jSaw[1] = \\set -> QuantEnv(\\amp, 8)
.phase(1, [0,(1,0.9..0.7),0.2], [0.05, 1.45], [2,-8], 0, 1)
.phase(2, [0,1,0], [5.35, 0.65], [\\sin,-8], 0, 1)
.play([1,2]);
)" ],
[ 2146.1527529, 'tester', "(
~jSaw[2] = \\set -> QuantEnv(\\freq, 16)
.phase(1, [60,66,60], [8.05, 2.95], [2,-2], 0, 4)
.phase(2, [80,98,90], [12.35, 0.65], [2,-2], 0, 1)
.phase(3, [100,128,90], [3.35, 8.65], [2,-2], 0, 1)
.play([1,2,1,3]);
)" ],
[ 2155.3272777, 'tester', "(
~jSaw[2] = \\set -> QuantEnv(\\freq, 16)
.phase(1, [60,66,60], [8.05, 2.95], [\\sin,\\sin], 0, 4)
.phase(2, [80,98,90], [12.35, 0.65], [2,-2], 0, 1)
.phase(3, [100,128,90], [3.35, 8.65], [2,-2], 0, 1)
.play([1,2,1,3]);
)" ],
[ 2159.5865213, 'tester', "(
~jSaw[2] = \\set -> QuantEnv(\\freq, 16)
.phase(1, [60,86,60], [8.05, 2.95], [\\sin,\\sin], 0, 4)
.phase(2, [80,98,90], [12.35, 0.65], [2,-2], 0, 1)
.phase(3, [100,128,90], [3.35, 8.65], [2,-2], 0, 1)
.play([1,2,1,3]);
)" ],
[ 2163.7307583, 'tester', "(
~jSaw[2] = \\set -> QuantEnv(\\freq, 16)
.phase(1, [60,86,60], [8.05, 2.95], [\\sin,\\sin], 0, 4).plot
.phase(2, [80,98,90], [12.35, 0.65], [2,-2], 0, 1)
.phase(3, [100,128,90], [3.35, 8.65], [2,-2], 0, 1)
.play([1,2,1,3]);
)" ],
[ 2164.0257752, 'alex', "~f[32]=\\filter-> {arg in; RLPF.ar(LPF.ar(in,\\lpf.kr(200)),\\rez.kr(700),rq:SinOsc.kr(0.25).range(0.001,0.1))};" ],
[ 2174.7173867, 'alex', "~f[32]=\\filter-> {arg in; RLPF.ar(LPF.ar(in,\\lpf.kr(200)),\\rez.kr(700),rq:SinOsc.kr(0.25).range(0.001,0.1),mul:0.1)};" ],
[ 2178.6496116, 'alex', "~f[32]=\\filter-> {arg in; RLPF.ar(LPF.ar(in,\\lpf.kr(200)),\\rez.kr(700),rq:SinOsc.kr(0.25).range(0.001,0.1),mul:0.4)};" ],
[ 2189.3952262, 'tester', "~jSaw[7] = \\filter -> {|in| LPF.ar(in, \\lpf_freq.kr(800,8)) };" ],
[ 2196.8656535, 'tester', "~jSaw.play(vol: 0.8, fadeTime: 8);" ],
[ 2206.3761975, 'tester', "~jSaw[7] = \\filter -> {|in| LPF.ar(in, \\lpf_freq.kr(1800,8)) };" ],
[ 2213.0975819, 'tester', "~jSaw[7] = \\filter -> {|in| LPF.ar(in, \\lpf_freq.kr(1200,8)) };" ],
[ 2214.46166, 'alex', "~f[33]=\\set-> Pbind(\\args, [\\rez], \\dur, 2, \\rez,Pseq([Pn(650,4), Pn(450, 2)],inf));" ],
[ 2222.7061315, 'tester', "(
~jSaw[2] = \\set -> QuantEnv(\\freq, 16)
.phase(1, [60,86,60], [8.05, 2.95], [\\sin,\\sin], 0, 4)
.phase(2, [80,98,90], [12.35, 0.65], [2,-2], 0, 1)
.phase(3, [80,128,90], [3.35, 8.65], [2,-2], 0, 1)
.play([1,2,1,3]);
)" ],
[ 2224.7332475, 'alex', "~f[34]=\\set->Pbind(\\args, [\\lpf], \\dur, 2, \\lpf,Pseq([400,1200,2000,4000,200],inf));" ],
[ 2232.7037033, 'alex', "~f[32]=\\filter-> {arg in; RLPF.ar(LPF.ar(in,\\lpf.kr(200)),\\rez.kr(700),rq:SinOsc.kr(0.25).range(0.001,0.1),mul:0.1)};" ],
[ 2235.6508719, 'alex', "~f[32]=\\filter-> {arg in; RLPF.ar(LPF.ar(in,\\lpf.kr(200)),\\rez.kr(700),rq:SinOsc.kr(0.25).range(0.001,0.1),mul:0.2)};" ],
[ 2243.0142931, 'tester', "~jDrum[4] = nil" ],
[ 2250.2137049, 'tester', "~jDrum[5] = nil" ],
[ 2251.317768, 'tester', "~jDrum[4] = \\filter -> {|in| GVerb.ar(in, \\gverb_size.kr(60, 4), \\gverb_time.kr(1)) };" ],
[ 2255.793024, 'tester', "~jDrum[4] = \\filter -> {|in| GVerb.ar(in, \\gverb_size.kr(6, 4), \\gverb_time.kr(1)) };" ],
[ 2259.1732173, 'tester', "~jDrum.play(vol: 0.1, fadeTime: 8);" ],
[ 2260.26928, 'tester', "(
~jDrum[0] = {
var osc = SinOsc.ar(( \\freq.kr(60) + \\fplus.kr(0) ), mul: 1, add: 0);
var noise = BrownNoise.ar(\\noise.kr(0), (1 - \\noise.kr(0)));
var sig = osc * noise;
Pan2.ar( sig * \\amp.kr(0), \\pan.kr(0) );
};
)" ],
[ 2262.1183858, 'tester', "(
~jDrum[1] = \\set -> QuantEnv(\\amp, 1)
.phase(1, [0.6,1,0.6], [0.05, 0.95], [2,-2], 0, 8)
.phase(2, [0,1,0], [0.35, 0.65], [2,-2], 0, 1)
.play([1,2]);
)" ],
[ 2263.976492, 'tester', "(
~jDrum[2] = \\set -> QuantEnv(\\fplus, 1)
.phase(1, [0,1000,0], [0.005, 0.15], [8,-8], 0, 4)
.phase(2, [0,400,0], [0.035, 0.065], [2,-2], 0, 1)
.play([1,2]);
)" ],
[ 2272.8249982, 'tester', "~jDrum.play(vol: 0.8, fadeTime: 8);" ],
[ 2276.5332103, 'tester', "~jSaw.play(vol: 0.4, fadeTime: 8);" ],
[ 2283.7176212, 'alex', "(
~f[0]={
	var sig, env, fenv;

	env=EnvGen.kr(Env([0,1,0], [0.1, 3],[\\welch, \\lin]),\\trig.tr);
	sig=SinOsc.ar(\\freq.kr(400)*([1,2,3,5]/4))+BrownNoise.ar(0.2)*Decay2.ar(Impulse.ar([0.25,0.125]),2,0.1);
	sig=sig*env;
};)" ],
[ 2286.5977859, 'tester', "(
~jDrum[2] = \\set -> QuantEnv(\\fplus, 1)
.phase(1, [0,1000,0], [0.005, 0.05], [8,-8], 0, 4)
.phase(2, [0,400,0], [0.035, 0.065], [2,-2], 0, 1)
.play([1,2]);
)" ],
[ 2292.561127, 'alex', "~f[32]=\\filter-> {arg in; RLPF.ar(LPF.ar(in,\\lpf.kr(200)),\\rez.kr(700),rq:SinOsc.kr(0.25).range(0.001,0.1),mul:0.4)};" ],
[ 2294.5682418, 'tester', "(
~jDrum[2] = \\set -> QuantEnv(\\fplus, 1)
.phase(1, [0,2000,0], [0.005, 0.05], [8,-8], 0, 4)
.phase(2, [0,400,0], [0.035, 0.065], [2,-2], 0, 1)
.play([1,2]);
)" ],
[ 2296.6073584, 'alex', "~f[32]=\\filter-> {arg in; RLPF.ar(LPF.ar(in,\\lpf.kr(200)),\\rez.kr(700),rq:SinOsc.kr(0.25).range(0.001,0.1),mul:0.7)};" ],
[ 2296.7543668, 'tester', "(
~jDrum[2] = \\set -> QuantEnv(\\fplus, 1)
.phase(1, [0,270,0], [0.005, 0.05], [8,-8], 0, 4)
.phase(2, [0,400,0], [0.035, 0.065], [2,-2], 0, 1)
.play([1,2]);
)" ],
[ 2301.5616418, 'tester', "(
~jDrum[2] = \\set -> QuantEnv(\\fplus, 1)
.phase(1, [0,270,0], [0.005, 0.05], [8,-8], 0, 4)
.phase(2, [0,300,0], [0.035, 0.065], [2,-2], 0, 1)
.play([1,2]);
)" ],
[ 2309.9711228, 'tester', "(
~jDrum[2] = \\set -> QuantEnv(\\fplus, 1)
.phase(1, [0,270,0], [0.005, 0.05], [8,-8], 0, 4)
.phase(2, [0,170,0], [0.035, 0.065], [2,-2], 0, 1)
.play([1,2]);
)" ],
[ 2313.8503447, 'alex', "~f.play( vol:0.1, fadeTime:2).quant_(1);" ],
[ 2316.4124912, 'tester', "(
~jDrum[2] = \\set -> QuantEnv(\\fplus, 1)
.phase(1, [0,270,0], [0.005, 0.05], [8,-8], 0, 7)
.phase(2, [0,170,0], [0.035, 0.065], [2,-2], 0, 1)
.play([1,2]);
)" ],
[ 2318.2215947, 'alex', "~f.play( vol:0.2, fadeTime:2).quant_(1);" ],
[ 2320.0186975, 'tester', "(
~jDrum[2] = \\set -> QuantEnv(\\fplus, 1)
.phase(1, [0,270,0], [0.005, 0.05], [8,-8], 0, 7)
.phase(2, [0,170,0], [0.035, 0.065], [8,-2], 0, 1)
.play([1,2]);
)" ],
[ 2321.496782, 'alex', "~f.play( vol:0.3, fadeTime:2).quant_(1);" ],
[ 2333.7374821, 'alex', "~f.play( vol:0.1, fadeTime:2).quant_(1);" ],
[ 2340.9368939, 'alex', "~f[31]=\\filter-> {arg in; GVerb.ar(in,roomsize:40,revtime:15,drylevel:SinOsc.kr(0.125).range(0.2,1),add:in)};" ],
[ 2342.9470089, 'tester', "(
~jDrum[5] = \\set -> QuantEnv(\\gverb_time, 4)
.phase(1, [0.25,1,0.25], [0.05, 0.95], [2,-2], 0, 1)
.phase(2, [0.25,4,0.25], [0.35, 0.65], [2,-2], 0, 1)
.play([1,2]);
)" ],
[ 2358.3428895, 'tester', "(
~jDrum[5] = \\set -> QuantEnv(\\gverb_time, 4)
.phase(1, [0.25,1,0.25], [0.05, 1.95], [2,-2], 0, 1)
.phase(2, [0.25,4,0.25], [0.35, 0.65], [2,-2], 0, 1)
.play([1,2]);
)" ],
[ 2378.0020139, 'tester', "~jSaw.play(vol: 0.8, fadeTime: 8);" ],
[ 2388.4896138, 'tester', "(
~jDrum[5] = \\set -> QuantEnv(\\gverb_time, 4)
.phase(1, [0.15,1,0.25], [0.05, 1.95], [2,-2], 0, 1)
.phase(2, [0.25,4,0.25], [0.35, 0.65], [2,-2], 0, 1)
.play([1,2]);
)" ],
[ 2396.571076, 'tester', "(
~jDrum[5] = \\set -> QuantEnv(\\gverb_time, 4)
.phase(1, [0.15,1,0.25], [0.05, 1.95], [2,-2], 0, 1)
.phase(2, [0.25,4,0.25], [0.35, 7.65], [2,-2], 0, 1)
.play([1,2]);
)" ],
[ 2405.1965694, 'tester', "(
~jDrum[5] = \\set -> QuantEnv(\\gverb_time, 4)
.phase(1, [0.15,1,0.25], [0.05, 1.95], [2,-2], 0, 8)
.phase(2, [0.25,4,0.25], [0.35, 7.65], [2,-2], 0, 1)
.play([1,2]);
)" ],
[ 2417.4242688, 'tester', "(
~jDrum[2] = \\set -> QuantEnv(\\fplus, 1)
.phase(1, [0,470,0], [0.005, 0.05], [8,-8], 0, 7)
.phase(2, [0,170,0], [0.035, 0.065], [8,-2], 0, 1)
.play([1,2]);
)" ],
[ 2426.2667745, 'tester', "(
~jDrum[1] = \\set -> QuantEnv(\\amp, 1)
.phase(1, [0.6,1,0.6], [0.05, 0.95], [2,-2], 0, 8)
.phase(2, [0,1,0.4], [0.35, 0.65], [2,-2], 0, 1)
.play([1,2]);
)" ],
[ 2435.0092746, 'tester', "~jDrum[6] = \\filter -> {|in| LPF.ar(in, \\lpf_freq.kr(800,8)) };" ],
[ 2438.8344934, 'tester', "~jDrum[6] = \\filter -> {|in| LPF.ar(in, \\lpf_freq.kr(2800,8)) };" ],
[ 2445.3828679, 'tester', "~jDrum[6] = \\filter -> {|in| LPF.ar(in, \\lpf_freq.kr(4800,8)) };" ],
[ 2455.961473, 'alex', "(
~r[0]={
	var sig, env, fenv;

	env=EnvGen.kr(Env([0,1,0], [0.1, 3],[\\welch, \\lin]),\\trig.tr);
	fenv=EnvGen.kr(Env([\\freq.kr,\\freq.kr*\\top.kr(4), \\freq.kr], [0.01, 0.04],[\\welch, \\lin]),\\trig.tr);
	sig=LFSaw.ar([\\freq.kr, \\freq.kr+[1,2,3,5].reciprocal]).lag(\\lag.kr(0.01,2));
	sig=sig*env;
};)" ],
[ 2458.1585986, 'tester', "(
~jDrum[5] = \\set -> QuantEnv(\\gverb_time, 4)
.phase(1, [0.15,1,0.25], [4.05, 1.95], [2,-2], 0, 8)
.phase(2, [0.25,4,0.25], [0.35, 7.65], [2,-2], 0, 1)
.play([1,2]);
)" ],
[ 2461.5447923, 'tester', "(
~jDrum[5] = \\set -> QuantEnv(\\gverb_time, 4)
.phase(1, [0.15,1,0.25], [2.05, 1.95], [2,-2], 0, 8)
.phase(2, [0.25,4,0.25], [0.35, 7.65], [2,-2], 0, 1)
.play([1,2]);
)" ],
[ 2472.0233917, 'tester', "(
~jDrum[2] = \\set -> QuantEnv(\\fplus, 1)
.phase(1, [0,470,0], [0.005, 0.05], [8,-8], 0, 7)
.phase(2, [0,1700,0], [0.035, 0.065], [8,-2], 0, 1)
.play([1,2]);
)" ],
[ 2489.7724068, 'tester', "(
~jDrum[5] = \\set -> QuantEnv(\\gverb_time, 4)
.phase(1, [0.15,1,0.25], [2.05, 1.95], [2,-2], 0, 8)
.phase(2, [0.25,4,0.25], [0.35, 0.65], [2,-2], 0, 1)
.play([1,2]);
)" ],
[ 2495.5077349, 'tester', "(
~jDrum[5] = \\set -> QuantEnv(\\gverb_time, 4)
.phase(1, [0.15,1,0.25], [1.05, 0.95], [2,-2], 0, 8)
.phase(2, [0.25,4,0.25], [0.35, 0.65], [2,-2], 0, 1)
.play([1,2]);
)" ],
[ 2501.0710531, 'tester', "(
~jDrum[5] = \\set -> QuantEnv(\\gverb_time, 4)
.phase(1, [0.15,1,0.25], [1.05, 4.95], [2,-2], 0, 8)
.phase(2, [0.25,4,0.25], [0.35, 0.65], [2,-2], 0, 1)
.play([1,2]);
)" ],
[ 2507.2774081, 'alex', "~r.play( vol:0.1, fadeTime:2).quant_(1);" ],
[ 2509.3755281, 'tester', "(
~jDrum[5] = \\set -> QuantEnv(\\gverb_time, 4)
.phase(1, [0.15,0.45,0.25], [1.05, 4.95], [2,-2], 0, 8)
.phase(2, [0.25,4,0.25], [0.35, 0.65], [2,-2], 0, 1)
.play([1,2]);
)" ],
[ 2509.6825456, 'alex', "~r[1]=\\set->Pbind(\\args, [\\trig], \\dur, 4, \\trig,1);" ],
[ 2511.6446579, 'alex', "~r[2]=\\set-> Pbind(\\args, [\\freq], \\dur, 2, \\freq,Pseq([Pn(1650,4), Pn(1450, 2), Prand([750,640,780,75,85],2)],inf));" ],
[ 2515.0578531, 'tester', "(
~jDrum[5] = \\set -> QuantEnv(\\gverb_time, 4)
.phase(1, [0.15,3.45,0.25], [1.05, 4.95], [2,-2], 0, 8)
.phase(2, [0.25,4,0.25], [0.35, 0.65], [2,-2], 0, 1)
.play([1,2]);
)" ],
[ 2523.7413497, 'tester', "(
~jDrum[5] = \\set -> QuantEnv(\\gverb_time, 4)
.phase(1, [0.15,0.45,0.25], [1.05, 0.95], [2,-2], 0, 8)
.phase(2, [0.25,4,0.25], [0.35, 0.65], [2,-2], 0, 1)
.play([1,2]);
)" ],
[ 2528.9246462, 'tester', "~jDrum.play(vol: 0.2, fadeTime: 8);" ],
[ 2532.3978449, 'alex', "~r[2]=\\set-> Pbind(\\args, [\\freq], \\dur, 2, \\freq,Pseq([Pn(45,4), Pn(50, 2), Prand([75,64,78,75,85],2)],inf));" ],
[ 2536.177061, 'tester', "(
~jDrum[1] = \\set -> QuantEnv(\\amp, 0.5)
.phase(1, [0.6,1,0.6], [0.05, 0.95], [2,-2], 0, 8)
.phase(2, [0,1,0.4], [0.35, 0.65], [2,-2], 0, 1)
.play([1,2]);
)" ],
[ 2539.6082573, 'alex', "~r[31]=\\filter-> {arg in; GVerb.ar(in,roomsize:40,revtime:15,drylevel:SinOsc.kr(0.125).range(0.2,1),add:in)};" ],
[ 2546.3436425, 'tester', "(
~jDrum[1] = \\set -> QuantEnv(\\amp, 0.5)
.phase(1, [0.6,1,0.6], [0.05, 0.45], [2,-2], 0, 8)
.phase(2, [0,1,0.4], [0.35, 0.05], [2,-2], 0, 1)
.play([1,2]);
)" ],
[ 2546.6976628, 'alex', "~r.play( vol:0.3, fadeTime:2).quant_(1);" ],
[ 2552.1579751, 'alex', "~r.play( vol:0.2, fadeTime:2).quant_(1);" ],
[ 2553.6000576, 'tester', "~jSaw.stop(16)" ],
[ 2559.6984064, 'alex', "(
~r[0]={
	var sig, env, fenv;

	env=EnvGen.kr(Env([0,1,0], [0.1, 1],[\\welch, \\lin]),\\trig.tr);
	fenv=EnvGen.kr(Env([\\freq.kr,\\freq.kr*\\top.kr(4), \\freq.kr], [0.01, 0.04],[\\welch, \\lin]),\\trig.tr);
	sig=LFSaw.ar([\\freq.kr, \\freq.kr+[1,2,3,5].reciprocal]).lag(\\lag.kr(0.01,2));
	sig=sig*env;
};)" ],
[ 2562.226551, 'tester', "~jDrum[5] = nil" ],
[ 2576.1553477, 'tester', "(
~jDrum[1] = \\set -> QuantEnv(\\amp, 1)
.phase(1, [0.6,1,0.6], [0.05, 0.45], [2,-2], 0, 8)
.phase(2, [0,1,0.4], [0.35, 0.05], [2,-2], 0, 1)
.play([1,2]);
)" ],
[ 2577.1824064, 'tester', "(
~jDrum[2] = \\set -> QuantEnv(\\fplus, 0.5)
.phase(1, [0,470,0], [0.005, 0.05], [8,-8], 0, 7)
.phase(2, [0,1700,0], [0.035, 0.065], [8,-2], 0, 1)
.play([1,2]);
)" ],
[ 2579.3495304, 'alex', "~f.clear(fadeTime:2);" ],
[ 2582.6517192, 'tester', "(
~jDrum[2] = \\set -> QuantEnv(\\fplus, 0.5)
.phase(1, [0,470,0], [0.005, 0.05], [8,-8], 0, 7)
.phase(2, [0,700,0], [0.035, 0.065], [8,-2], 0, 1)
.play([1,2]);
)" ],
[ 2590.3971622, 'tester', "~jDrum.play(vol: 0.8, fadeTime: 18);" ],
[ 2590.4891675, 'alex', "~r[2]=\\set-> Pbind(\\args, [\\freq], \\dur, 8, \\freq,Pseq([Pn(45,4), Pn(50, 2), Prand([75,64,78,75,85],2)],inf));" ],
[ 2597.2835561, 'tester', "(
~jDrum[2] = \\set -> QuantEnv(\\fplus, 0.5)
.phase(1, [0,470,0], [0.005, 0.05], [8,-8], 0, 7)
.phase(2, [0,170,0], [0.035, 0.065], [8,-2], 0, 1)
.play([1,2]);
)" ],
[ 2607.2021234, 'alex', "(
~r[0]={
	var sig, env, fenv;

	env=EnvGen.kr(Env([0,1,0], [0.1,3],[\\welch, \\lin]),\\trig.tr);
	fenv=EnvGen.kr(Env([\\freq.kr,\\freq.kr*\\top.kr(4), \\freq.kr], [0.01, 0.04],[\\welch, \\lin]),\\trig.tr);
	sig=LFSaw.ar([\\freq.kr, \\freq.kr+[1,2,3,5].reciprocal]).lag(\\lag.kr(0.01,2));
	sig=sig*env;
};)" ],
[ 2610.3623042, 'alex', "~r[1]=\\set->Pbind(\\args, [\\trig], \\dur, 6, \\trig,1);" ],
[ 2612.6604356, 'alex', "~r[2]=\\set-> Pbind(\\args, [\\freq], \\dur, 8, \\freq,Pseq([Pn(45,4), Pn(50, 2), Prand([75,64,78,75,85],2)],inf));" ],
[ 2616.3676477, 'alex', "~r.play( vol:0.1, fadeTime:2).quant_(1);" ],
[ 2618.5727738, 'tester', "~jDrum[4] = nil" ],
[ 2620.3048729, 'alex', "~r[31]=\\filter-> {arg in; GVerb.ar(in,roomsize:40,revtime:15,drylevel:SinOsc.kr(0.125).range(0.2,1),add:in)};" ],
[ 2622.1589789, 'alex', "~r[32]=\\filter-> {arg in; LPF.ar(in,\\lpf.kr(200))};" ],
[ 2624.9961412, 'alex', "~r[34]=\\set->Pbind(\\args, [\\lpf], \\dur, 2, \\lpf,Pseq([400,1200,2000,4000,200],inf));" ],
[ 2631.1374925, 'tester', "(
~jDrum[2] = \\set -> QuantEnv(\\fplus, 0.5)
.phase(1, [0,470,0], [0.005, 0.15], [8,-8], 0, 7)
.phase(2, [0,170,0], [0.035, 0.065], [8,-2], 0, 1)
.play([1,2]);
)" ],
[ 2646.8593917, 'tester', "(
~jDrum[1] = \\set -> QuantEnv(\\amp, 4)
.phase(1, [0.6,1,0.6], [0.05, 0.45], [2,-2], 0, 8)
.phase(2, [0,1,0.4], [0.35, 0.05], [2,-2], 0, 1)
.play([1,2]);
)" ],
[ 2655.1418654, 'alex', "~r[31]=\\filter-> {arg in; GVerb.ar(in,roomsize:80,revtime:15,drylevel:SinOsc.kr(0.125).range(0.2,1),add:in)};" ],
[ 2665.5074583, 'alex', "~r[34]=\\set->Pbind(\\args, [\\lpf], \\dur, 4, \\lpf,Pseq([400,1200,2000,4000,200],inf));" ],
[ 2670.8587644, 'alex', "~r[34]=\\set->Pbind(\\args, [\\lpf], \\dur, 2, \\lpf,Pseq([400,1200,2000,4000,200],inf));" ],
[ 2670.8817657, 'tester', "~jDrum[3] = nil" ],
[ 2680.3603078, 'alex', "~r.play( vol:0.2, fadeTime:2).quant_(1);" ],
[ 2681.9173969, 'tester', "~jDrum[6] = \\filter -> {|in| LPF.ar(in, \\lpf_freq.kr(4800,8)) };" ],
[ 2687.8997391, 'alex', "~r.play( vol:0.3, fadeTime:2).quant_(1);" ],
[ 2693.1680404, 'tester', "~jDrum[6] = \\filter -> {|in| LPF.ar(in, \\lpf_freq.kr(4800)) };" ],
[ 2702.8555945, 'alex', "~r[2]=\\set-> Pbind(\\args, [\\freq], \\dur, 8, \\freq,Pseq([Pn(35,4), Pn(50, 2), Prand([75,64,78,75,85],2)],inf));" ],
[ 2709.7339879, 'alex', "~r.play( vol:0.2, fadeTime:2).quant_(1);" ],
[ 2733.0223199, 'tester', "(
~jDrum[7] = \\set -> QuantEnv(\\lpf_freq, 16)
.phase(1, [800,4801,1800], [8.05, 7.95], [2,-2], 0, 1)
.phase(2, [1800,4001,800], [12.35, 3.65], [2,-2], 0, 1)
.play([1,2]);
)" ],
[ 2742.2808495, 'alex', "~r[2]=\\set-> Pbind(\\args, [\\freq], \\dur, 8, \\freq,Pseq([Pn(35,4), Pn(50, 2), Prand([175,164,178,175,185],2)],inf));" ],
[ 2775.8127674, 'tester', "(
~jSaw[2] = \\set -> QuantEnv(\\freq, 16)
.phase(1, [600,860,600], [8.05, 2.95], [\\sin,\\sin], 0, 4)
.phase(2, [800,980,900], [12.35, 0.65], [2,-2], 0, 1)
.phase(3, [800,1280,900], [3.35, 8.65], [2,-2], 0, 1)
.play([1,2,1,3]);
)" ],
[ 2778.7359346, 'tester', "~jSaw.play(vol: 0.2, fadeTime: 8);" ],
[ 2791.9926928, 'tester', "(
~jSaw[2] = \\set -> QuantEnv(\\freq, 16)
.phase(1, [600,660,600], [8.05, 2.95], [\\sin,\\sin], 0, 4)
.phase(2, [800,980,900], [12.35, 0.65], [2,-2], 0, 1)
.phase(3, [800,1280,900], [3.35, 8.65], [2,-2], 0, 1)
.play([1,2,1,3]);
)" ],
[ 2797.1309867, 'tester', "(
~jSaw[2] = \\set -> QuantEnv(\\freq, 16)
.phase(1, [600,660,600], [8.05, 2.95], [\\sin,\\sin], 0, 4)
.phase(2, [800,880,800], [12.35, 0.65], [2,-2], 0, 1)
.phase(3, [800,1280,900], [3.35, 8.65], [2,-2], 0, 1)
.play([1,2,1,3]);
)" ],
[ 2800.9482051, 'tester', "(
~jSaw[2] = \\set -> QuantEnv(\\freq, 16)
.phase(1, [600,660,600], [8.05, 2.95], [\\sin,\\sin], 0, 4)
.phase(2, [800,880,800], [12.35, 0.65], [2,-2], 0, 1)
.phase(3, [800,1280,800], [3.35, 8.65], [2,-2], 0, 1)
.play([1,2,1,3]);
)" ],
[ 2804.1733895, 'tester', "(
~jSaw[2] = \\set -> QuantEnv(\\freq, 16)
.phase(1, [600,640,600], [8.05, 2.95], [\\sin,\\sin], 0, 4)
.phase(2, [800,880,800], [12.35, 0.65], [2,-2], 0, 1)
.phase(3, [800,1280,800], [3.35, 8.65], [2,-2], 0, 1)
.play([1,2,1,3]);
)" ],
[ 2812.2008487, 'tester', "~jSaw[4] = \\filter -> {|in| GVerb.ar(in, \\gverb_size.kr(60, 4), \\gverb_time.kr(14, 1)) };" ],
[ 2815.1210157, 'alex', "(
~r[0]={
	var sig, env, fenv;

	env=EnvGen.kr(Env([0,1,0], [0.1,5],[\\welch, \\lin]),\\trig.tr);
	fenv=EnvGen.kr(Env([\\freq.kr,\\freq.kr*\\top.kr(4), \\freq.kr], [0.01, 0.04],[\\welch, \\lin]),\\trig.tr);
	sig=LFSaw.ar([\\freq.kr, \\freq.kr+[1,2,3,5].reciprocal]).lag(\\lag.kr(0.01,2));
	sig=sig*env;
};)" ],
[ 2818.1711902, 'alex', "~r.play( vol:0.2, fadeTime:2).quant_(1);" ],
[ 2821.5833853, 'tester', "(
~jSaw[1] = \\set -> QuantEnv(\\amp, 8)
.phase(1, [0,(1,0.9..0.7),0.2], [0.05, 1.45], [2,-8], 0, 1)
.phase(2, [0,1,0], [5.35, 0.65], [\\sin,-8], 0, 1)
.play([1,2]);
)" ],
[ 2829.6278455, 'tester', "(
~jSaw[5] = \\set -> QuantEnv(\\fplus, 2)
.phase(1, [0,807,0], [0.01, 0.24], [16,-8], 0, 8)
.phase(2, [0,1000,0], [0.105, 0.65], [\\step,\\step], 0, 1)
.phase(3, [0,2000,0], [0.105, 0.65], [\\step,\\step], 0, 4)
.play([1,1,1,2,1,1,1,3]);
)" ],
[ 2854.5652718, 'tester', "(
~jSaw[2] = \\set -> QuantEnv(\\freq, 16)
.phase(1, [600,240,600], [8.05, 2.95], [\\sin,\\sin], 0, 4)
.phase(2, [800,880,800], [12.35, 0.65], [2,-2], 0, 1)
.phase(3, [800,1280,800], [3.35, 8.65], [2,-2], 0, 1)
.play([1,2,1,3]);
)" ],
[ 2879.220682, 'alex', "(
~h[0]={
	var sig, env, fenv;

	env=EnvGen.kr(Env([0,1,0], [0.01,0.1],[\\step, \\step]),\\trig.tr);
	sig=SinOsc.ar(\\freq.kr(400)*([1,2,3,5]/4));
	sig=sig*env;
};)" ],
[ 2883.6309343, 'tester', "(
~jSaw[2] = \\set -> QuantEnv(\\freq, 16)
.phase(1, [600,240,600], [8.05, 2.95], [\\sin,\\sin], 0, 3)
.phase(2, [800,880,800], [12.35, 0.65], [2,-2], 0, 1)
.phase(3, [800,1280,800], [3.35, 8.65], [2,-2], 0, 1)
.play([1,2,1,3]);
)" ],
[ 2884.5679879, 'alex', "~h[1]=\\set->Pbind(\\args, [\\trig], \\dur, 4, \\trig,1);" ],
[ 2885.5540443, 'alex', "~h[2]=\\set-> Pbind(\\args, [\\freq], \\dur, 2, \\freq,Pseq([Pn(16500,4), Pn(145.0, 2), Prand([7500,6400,7800,7500,8500],2)],inf));" ],
[ 2886.756113, 'alex', "~h[31]=\\filter-> {arg in; GVerb.ar(in,roomsize:40,revtime:15,add:in)};" ],
[ 2889.7012815, 'alex', "~h.play( vol:0.1, fadeTime:2).quant_(1);" ],
[ 2890.8153452, 'tester', "(
~jSaw[6] = \\set -> QuantEnv(\\noise, 24)
.phase(1, [0,0.1,0], [22.05, 0.95], [2,-2], 0, 1)
.phase(2, [0,0.4,0], [8.35, 0.65], [2,-2], 0, 1)
.play([1,2]);
)" ],
[ 2912.0045571, 'tester', "(
~jDrum[2] = \\set -> QuantEnv(\\fplus, 0.5)
.phase(1, [0,770,0], [0.005, 0.15], [8,-8], 0, 7)
.phase(2, [0,170,0], [0.035, 0.065], [8,-2], 0, 1)
.play([1,2]);
)" ],
[ 2919.1059633, 'tester', "(
~jDrum[2] = \\set -> QuantEnv(\\fplus, 0.5)
.phase(1, [0,770,0], [0.005, 0.15], [8,-8], 0, 7)
.phase(2, [0,1070,0], [0.035, 0.065], [8,-2], 0, 1)
.play([1,2]);
)" ],
[ 2936.9099816, 'tester', "(
~jSaw[2] = \\set -> QuantEnv(\\freq, 16)
.phase(1, [600,440,600], [8.05, 2.95], [\\sin,\\sin], 0, 3)
.phase(2, [800,880,800], [12.35, 0.65], [2,-2], 0, 1)
.phase(3, [800,1280,800], [3.35, 8.65], [2,-2], 0, 1)
.play([1,2,1,3]);
)" ],
[ 2943.6733685, 'tester', "(
~jSaw[2] = \\set -> QuantEnv(\\freq, 16)
.phase(1, [600,640,600], [8.05, 2.95], [\\sin,\\sin], 0, 3)
.phase(2, [800,880,800], [12.35, 0.65], [2,-2], 0, 1)
.phase(3, [800,1280,800], [3.35, 8.65], [2,-2], 0, 1)
.play([1,2,1,3]);
)" ],
[ 2948.017617, 'alex', "~h[25]=\\filter-> {arg in; CombN.ar(in,4,3,1)};" ],
[ 2949.4146969, 'tester', "(
~jSaw[2] = \\set -> QuantEnv(\\freq, 16)
.phase(1, [600,640,600], [8.05, 2.95], [\\sin,\\sin], 0, 3)
.phase(2, [800,680,800], [12.35, 0.65], [2,-2], 0, 1)
.phase(3, [800,1280,800], [3.35, 8.65], [2,-2], 0, 1)
.play([1,2,1,3]);
)" ],
[ 2951.3508076, 'tester', "(
~jSaw[2] = \\set -> QuantEnv(\\freq, 16)
.phase(1, [600,640,600], [8.05, 2.95], [\\sin,\\sin], 0, 3)
.phase(2, [800,600,800], [12.35, 0.65], [2,-2], 0, 1)
.phase(3, [800,1280,800], [3.35, 8.65], [2,-2], 0, 1)
.play([1,2,1,3]);
)" ],
[ 2958.8282353, 'alex', "~h[25]=\\filter-> {arg in; CombN.ar(in,4,3,0.5)};" ],
[ 2963.1924849, 'alex', "~h.play( vol:0.1, fadeTime:2).quant_(1);" ],
[ 2982.0865656, 'alex', "~h[25]=\\filter-> {arg in; CombN.ar(in,4,1,2)};" ],
[ 2983.0956233, 'tester', "(
~jSaw[2] = \\set -> QuantEnv(\\freq, 16)
.phase(1, [400,440,400], [8.05, 2.95], [\\sin,\\sin], 0, 3)
.phase(2, [500,380,400], [12.35, 0.65], [2,-2], 0, 1)
.phase(3, [400,1280,400], [3.35, 8.65], [2,-2], 0, 1)
.play([1,2,1,3]);
)" ],
[ 3000.3666112, 'tester', "(
~jSaw[6] = \\set -> QuantEnv(\\noise, 24)
.phase(1, [0,0.4,0], [22.05, 0.95], [2,-2], 0, 1)
.phase(2, [0,0.4,0], [8.35, 0.65], [2,-2], 0, 1)
.play([1,2]);
)" ],
[ 3000.7096308, 'alex', "~h[25]=\\filter-> {arg in; CombN.ar(in,4,0.5,2)};" ],
[ 3005.5969103, 'tester', "(
~jSaw[6] = \\set -> QuantEnv(\\noise, 24)
.phase(1, [0,0.4,0], [22.05, 0.95], [2,-2], 0, 1)
.phase(2, [0,0.8,0], [8.35, 0.65], [2,-2], 0, 1)
.play([1,2]);
)" ],
[ 3016.9535599, 'tester', "~jSaw[3] = \\filter -> {|in| LPF.ar(in, \\lpf_freq.kr(1800,8)) };" ],
[ 3027.4271589, 'tester', "~jDrum.stop(1);" ],
[ 3033.5425087, 'tester', "~jDrum.play(vol: 0.8, fadeTime: 1);" ],
[ 3047.4183024, 'tester', "(
~jDrum[2] = \\set -> QuantEnv(\\fplus, 0.5)
.phase(1, [0,1770,0], [0.005, 0.15], [8,-8], 0, 7)
.phase(2, [0,1070,0], [0.035, 0.065], [8,-2], 0, 1)
.play([1,2]);
)" ],
[ 3051.677546, 'tester', "(
~jDrum[2] = \\set -> QuantEnv(\\fplus, 0.5)
.phase(1, [0,4770,0], [0.005, 0.15], [8,-8], 0, 7)
.phase(2, [0,1070,0], [0.035, 0.065], [8,-2], 0, 1)
.play([1,2]);
)" ],
[ 3061.171089, 'tester', "~jSaw.play(vol: 0.0, fadeTime: 28);" ],
[ 3066.6394017, 'tester', "(
~jDrum[2] = \\set -> QuantEnv(\\fplus, 0.5)
.phase(1, [0,4770,0], [0.005, 0.15], [8,-8], 0, 7)
.phase(2, [0,5070,0], [0.035, 0.065], [8,-2], 0, 1)
.play([1,2]);
)" ],
[ 3067.5544541, 'alex', "~h[26]=\\set-> Pbind(\\args, [\\del], \\dur, Pseq([8,12,8],inf), \\del, Pseq([0.25,0.5,1],inf));" ],
[ 3070.7896391, 'tester', "(
~jDrum[2] = \\set -> QuantEnv(\\fplus, 1)
.phase(1, [0,4770,0], [0.005, 0.15], [8,-8], 0, 7)
.phase(2, [0,5070,0], [0.035, 0.065], [8,-2], 0, 1)
.play([1,2]);
)" ],
[ 3074.2788387, 'tester', "(
~jDrum[2] = \\set -> QuantEnv(\\fplus, 0.5)
.phase(1, [0,4770,0], [0.005, 0.15], [8,-8], 0, 7)
.phase(2, [0,5070,0], [0.035, 0.065], [8,-2], 0, 1)
.play([1,2]);
)" ],
[ 3076.5099663, 'alex', "~h.play( vol:0.4, fadeTime:2).quant_(1);" ],
[ 3079.3501288, 'tester', "~jDrum[4] = \\filter -> {|in| GVerb.ar(in, \\gverb_size.kr(6, 4), \\gverb_time.kr(1)) };" ],
[ 3084.756438, 'tester', "~jDrum.stop(10);" ],
[ 3092.6228879, 'tester', "~jDrum[4] = nil" ],
[ 3102.1274315, 'tester', "~jDrum.play(vol: 0.8, fadeTime: 1);" ],
[ 3112.1690059, 'tester', "(
~jDrum[2] = \\set -> QuantEnv(\\fplus, 2)
.phase(1, [0,4770,0], [0.005, 0.15], [8,-8], 0, 7)
.phase(2, [0,5070,0], [0.035, 0.065], [8,-2], 0, 1)
.play([1,2]);
)" ],
[ 3120.2574685, 'tester', "(
~jDrum[2] = \\set -> QuantEnv(\\fplus, 2)
.phase(1, [0,770,0], [0.005, 0.15], [8,-8], 0, 7)
.phase(2, [0,5070,0], [0.035, 0.065], [8,-2], 0, 1)
.play([1,2]);
)" ],
[ 3126.4788244, 'tester', "(
~jDrum[2] = \\set -> QuantEnv(\\fplus, 2)
.phase(1, [0,770,0], [0.005, 0.17], [8,-8], 0, 7)
.phase(2, [0,5070,0], [0.035, 0.065], [8,-2], 0, 1)
.play([1,2]);
)" ],
[ 3127.3978769, 'alex', "~h[2]=\\set-> Pbind(\\args, [\\freq], \\dur, 2, \\freq,Pseq([Pn(9500,4), Pn(7000, 2), Prand([7500,6400,7800,7500,8500],2)],inf));" ],
[ 3131.8331306, 'tester', "(
~jDrum[2] = \\set -> QuantEnv(\\fplus, 2)
.phase(1, [0,770,0], [0.005, 0.17], [8,-8], 0, 7)
.phase(2, [0,1570,0], [0.035, 0.065], [8,-2], 0, 1)
.play([1,2]);
)" ],
[ 3145.0988894, 'tester', "(
~jDrum[2] = \\set -> QuantEnv(\\fplus, 2)
.phase(1, [0,770,0], [0.005, 0.17], [8,-8], 0, 7)
.phase(2, [0,1570,0], [0.15, 0.005], [8,-2], 0, 1)
.play([1,2]);
)" ],
[ 3150.3341888, 'alex', "~h[31]=\\filter-> {arg in; GVerb.ar(in,roomsize:40,revtime:5,add:in)};" ],
[ 3156.2885294, 'tester', "(
~jDrum[2] = \\set -> QuantEnv(\\fplus, 2)
.phase(1, [0,770,0], [0.005, 0.17], [8,-8], 0, 7)
.phase(2, [0,1570,0], [0.15, 0.005], [\\sin,-8], 0, 1)
.play([1,2]);
)" ],
[ 3160.8747917, 'tester', "(
~jDrum[2] = \\set -> QuantEnv(\\fplus, 2)
.phase(1, [0,770,0], [0.005, 0.17], [8,-8], 0, 7)
.phase(2, [0,1570,0], [0.35, 0.005], [\\sin,-8], 0, 1)
.play([1,2]);
)" ],
[ 3164.3209888, 'tester', "(
~jDrum[2] = \\set -> QuantEnv(\\fplus, 2)
.phase(1, [0,770,0], [0.005, 0.17], [8,-8], 0, 7)
.phase(2, [0,170,0], [0.35, 0.005], [\\sin,-8], 0, 1)
.play([1,2]);
)" ],
[ 3165.2900442, 'alex', "~h[26]=\\set-> Pbind(\\args, [\\del], \\dur, Pseq([8,12,8],inf), \\del, Pseq([0.25,0.5,1],inf));" ],
[ 3172.2854443, 'alex', "~h[25]=\\filter-> {arg in; CombN.ar(in,4,\\del.kr(0.25),2)};" ],
[ 3178.3927937, 'alex', "~h[26]=\\set-> Pbind(\\args, [\\del], \\dur, Pseq([8,12,8],inf), \\del, Pseq([0.25,0.5,1],inf));" ],
[ 3178.5398021, 'tester', "~jDrum[8] = \\filter -> {|in| FreeVerb.ar(in, \\fverb_mix.kr(0), \\fverb_room.kr(0.5)) };" ],
[ 3194.2977034, 'tester', "(
~jDrum[9] = \\set -> QuantEnv(\\fverb_mix, 1)
.phase(1, [0,1,0], [0.05, 0.95], [2,-2], 0, 1)
.phase(2, [0,1,0], [0.35, 0.65], [2,-2], 0, 1)
.play([1,2]);
)" ],
[ 3197.5058869, 'alex', "~h[26]=\\set-> Pbind(\\args, [\\del], \\dur, Pseq([16,12,8],inf), \\del, Pseq([0.25,0.5,1],inf));" ],
[ 3207.1034358, 'tester', "(
~jDrum[2] = \\set -> QuantEnv(\\fplus, 1)
.phase(1, [0,770,0], [0.005, 0.17], [8,-8], 0, 7)
.phase(2, [0,170,0], [0.35, 0.005], [\\sin,-8], 0, 1)
.play([1,2]);
)" ],
[ 3211.3766802, 'alex', "(
~h[0]={
	var sig, env, fenv;

	env=EnvGen.kr(Env([0,1,0], [0.01,0.1],[\\step, \\step]),\\trig.tr);
	sig=SinOsc.ar(\\freq.kr(400)*([1,2,3,5]/4))+GrayNoise.ar(0.2);
	sig=sig*env;
};)" ],
[ 3224.1044082, 'tester', "(
~jDrum[7] = \\set -> QuantEnv(\\lpf_freq, 16)
.phase(1, [800,4801,1800], [8.05, 7.95], [2,-2], 0, 1)
.phase(2, [1800,4001,800], [12.35, 3.65], [2,-2], 0, 1)
.play([1,2]);
)" ],
[ 3251.0189476, 'alex', "~h[31]=\\filter-> {arg in; GVerb.ar(in,roomsize:40,revtime:5,drylevel:SinOsc.kr(0.125).