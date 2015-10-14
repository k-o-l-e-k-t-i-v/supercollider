List[ [ 1292.1302476, 'joach', "Kolektiv.historySave" ], [ 1279.4582298, 'kof', "~pulse.clear;" ], [ 1275.8182247, 'kof', "~rr.clear;" ], [ 1273.0982209, 'kof', "~hh.clear;" ], [ 1267.7482134, 'kof', "~ssa.clear;" ], [ 1265.7482106, 'kof', "~ss.clear;" ], [ 1262.9382066, 'kof', "(
~ss.ar(2);
~ss.quant=2;
~ss.fadeTime=0.2;
~ss={
  //         |       |       |       |       |  
  var pat = [1,0,0,0,1,0,0,0,1,0,0,0,1,0,0,0].rotate(3);
  var imp = PulseDivider.kr(~tick.kr,16,~counter.kr);
  var hit = Select.kr(PulseCount.kr(imp)%pat.size,pat);
  var env = EnvGen.ar(Env([0.001,1,1,0.001],[0.002,0.05,0.0002],[3,1,-3],curve:'exp'),imp * hit);
  var sig = [
  SinOsc.ar(5000),
    LFSaw.ar(15000),
    Pulse.ar(4),
    LFSaw.ar(50),
    Pulse.ar(50),
    LFSaw.ar(50)
  ];
  sig = Select.ar(PulseCount.kr(imp*hit)%sig.size,sig);
  sig = sig * env;
  Splay.ar(sig,0.75,0.05);
};
~ss.play;
);" ], [ 1259.4761688, 'joach', "Kolektiv.tempo" ], [ 1244.4731476, 'kof', "(
~ssa.ar(2);
~ssa.quant=2;
~ssa.fadeTime=4.2;
~ssa={
  //         |       |       |       |       |  
  var pat = [1,0,0,0,1,0,0,0,1,0,0,0,1,0,0,0].rotate(3);
  var imp = PulseDivider.kr(~tick.kr,1,~counter.kr);
  var hit = Select.kr(PulseCount.kr(imp)/[1,2,3,4]%pat.size,pat);
  var env = EnvGen.ar(Env([0.001,1,0.001],[0.002,0.25],[3,-3],curve:'exp'),imp * hit);
  var sig = SinOsc.ar(15000/1.25/(1+(1..4).reciprocal**1.5)+SinOsc.ar(4/fib(4)).range(-40,40),SinOsc.ar(50/[1,2,3,4]).range(-pi,pi));
  sig = sig * env;
  Splay.ar(sig,0.75,0.75);
};
~ssa.play;
);" ], [ 1233.8921327, 'kof', "~rr.clear;" ], [ 1232.1721303, 'kof', "~pulse.clear;" ], [ 1228.6821254, 'kof', "~ssa.clear;" ], [ 1162.4919998, 'joach', "~jdrum.stop(16);" ], [ 1156.9149621, 'joach', "~jdrum.play(vol: 0.0, fadeTime: 18);" ], [ 1149.0519157, 'joach', "~jSaw.stop(20);" ], [ 1141.1988705, 'joach', "~jdrum.set(\\lpf_freq, 200);" ], [ 1138.3578336, 'joach', "(
~jdrum[5] = \\set -> QuantEnv(\\noise, 8)
.phase(1, [0.2,0.5,0.2], [2.05, 0.95], [2,-2], 0, 1)
.phase(2, [0.2,0.8,0.2], [1.35, 2.65], [2,-2], 0, 1)
.play([1]);
)" ], [ 1135.3897961, 'joach', "(
~jdrum[2] = \\set -> QuantEnv(\\fplus, 2)
.phase(1, [0,100,0], [0.005, 0.15], [8,-2], 0, 8)
.phase(2, [0,[100,1000],0], [0.005, 0.15], [8,-2], 0, 1)
.phase(2, [0,2000,0], [0.005, 0.15], [8,-8], 0, 1)
.play([1,2]);
)" ], [ 1131.5687577, 'joach', "(
~jdrum[1] = \\set -> QuantEnv(\\amp, 2)
.phase(1, [0.2,1,0.2], [0.05, 0.45], [2,-2], 0, 4)
.phase(2, [0.2,1,0.2], [0.15, 0.85], [2,-2], 0, 1)
.phase(3, [0.2,1,0.2], [0.85, 0.15], [2,-2], 0, 1)
.phase(4, [0.2,0,0,0.2], [0.85, 3, 0.15], [\\sin,\\sin], 0, 2)
.play([1,2,1,3, 4]);
)" ], [ 1130.4677561, 'alex', "~v.clear;" ], [ 1128.6187207, 'joach', "(
~jdrum[2] = \\set -> QuantEnv(\\fplus, 1)
.phase(1, [0,100,0], [0.005, 0.15], [8,-2], 0, 8)
.phase(2, [0,[100,1000],0], [0.005, 0.15], [8,-2], 0, 1)
.phase(2, [0,2000,0], [0.005, 0.15], [8,-8], 0, 1)
.play([1,2]);
)" ], [ 1122.6306906, 'alex', "(
~v[0]={
	var sig, env,fenv, penv;

	env=EnvGen.kr(Env([0,1,0],[2,0.01],[\\lin, \\step]),\\trig.tr);
	penv=EnvGen.kr(Env([0.8,0,2],[0.04,0.1],[\\lin,\\welch]),\\trig.tr);

	sig=AudioIn.ar(1)*env;
	sig=sig*env;
};
)" ], [ 1122.5056835, 'joach', "(
~jdrum[1] = \\set -> QuantEnv(\\amp, 1)
.phase(1, [0.2,1,0.2], [0.05, 0.45], [2,-2], 0, 4)
.phase(2, [0.2,1,0.2], [0.15, 0.85], [2,-2], 0, 1)
.phase(3, [0.2,1,0.2], [0.85, 0.15], [2,-2], 0, 1)
.phase(4, [0.2,0,0,0.2], [0.85, 3, 0.15], [\\sin,\\sin], 0, 2)
.play([1,2,1,3, 4]);
)" ], [ 1112.1316314, 'joach', "(
~jdrum[1] = \\set -> QuantEnv(\\amp, 1)
.phase(1, [0.2,1,0.2], [0.05, 0.95], [2,-2], 0, 4)
.phase(2, [0.2,1,0.2], [0.15, 0.85], [2,-2], 0, 1)
.phase(3, [0.2,1,0.2], [0.85, 0.15], [2,-2], 0, 1)
.phase(4, [0.2,0,0,0.2], [0.85, 3, 0.15], [\\sin,\\sin], 0, 2)
.play([1,2,1,3, 4]);
)" ], [ 1110.0316284, 'alex', "(
~v[0]={
	var sig, env,fenv, penv;

	env=EnvGen.kr(Env([0,1,0],[3,0.01],[\\lin, \\step]),\\trig.tr);
	penv=EnvGen.kr(Env([0.8,0,2],[0.04,0.1],[\\lin,\\welch]),\\trig.tr);

	sig=AudioIn.ar(1)*env;
	sig=sig*env;
};
)" ], [ 1103.5005863, 'joach', "(
~jdrum[2] = \\set -> QuantEnv(\\fplus, 2)
.phase(1, [0,100,0], [0.005, 0.15], [8,-2], 0, 8)
.phase(2, [0,[100,1000],0], [0.005, 0.15], [8,-2], 0, 1)
.phase(2, [0,2000,0], [0.005, 0.15], [8,-8], 0, 1)
.play([1,2]);
)" ], [ 1098.309579, 'kof', "(
~ss.ar(2);
~ss.quant=2;
~ss.fadeTime=0.2;
~ss={
  //         |       |       |       |       |  
  var pat = [1,0,0,0,1,0,0,0,1,0,0,0,1,0,0,0].rotate(3);
  var imp = PulseDivider.kr(~tick.kr,8,~counter.kr);
  var hit = Select.kr(PulseCount.kr(imp)%pat.size,pat);
  var env = EnvGen.ar(Env([0.001,1,1,0.001],[0.002,0.05,0.0002],[3,1,-3],curve:'exp'),imp * hit);
  var sig = [
  SinOsc.ar(5000),
    LFSaw.ar(15000),
    Pulse.ar(4),
    LFSaw.ar(50),
    Pulse.ar(50),
    LFSaw.ar(50)
  ];
  sig = Select.ar(PulseCount.kr(imp*hit)%sig.size,sig);
  sig = sig * env;
  Splay.ar(sig,0.75,0.05);
};
~ss.play;
);" ], [ 1096.7315445, 'joach', "(
~jdrum[2] = \\set -> QuantEnv(\\fplus, 1)
.phase(1, [0,100,0], [0.005, 0.15], [8,-2], 0, 8)
.phase(2, [0,[100,1000],0], [0.005, 0.15], [8,-2], 0, 1)
.phase(2, [0,2000,0], [0.005, 0.15], [8,-8], 0, 1)
.play([1,2]);
)" ], [ 1096.1085429, 'kof', "(
~ss.ar(2);
~ss.quant=2;
~ss.fadeTime=0.2;
~ss={
  //         |       |       |       |       |  
  var pat = [1,0,0,0,1,0,0,0,1,0,0,0,1,0,0,0].rotate(3);
  var imp = PulseDivider.kr(~tick.kr,8,~counter.kr);
  var hit = Select.kr(PulseCount.kr(imp)%pat.size,pat);
  var env = EnvGen.ar(Env([0.001,1,1,0.001],[0.002,0.5,0.0002],[3,1,-3],curve:'exp'),imp * hit);
  var sig = [
  SinOsc.ar(5000),
    LFSaw.ar(15000),
    Pulse.ar(4),
    LFSaw.ar(50),
    Pulse.ar(50),
    LFSaw.ar(50)
  ];
  sig = Select.ar(PulseCount.kr(imp*hit)%sig.size,sig);
  sig = sig * env;
  Splay.ar(sig,0.75,0.05);
};
~ss.play;
);" ], [ 1094.8985412, 'alex', "~v[1]=\\set->Pbind(\\args, [\\trig], \\dur, 8, \\trig, 1);" ], [ 1090.8325067, 'joach', "(
~jdrum[2] = \\set -> QuantEnv(\\fplus, 0.5)
.phase(1, [0,100,0], [0.005, 0.15], [8,-2], 0, 8)
.phase(2, [0,[100,1000],0], [0.005, 0.15], [8,-2], 0, 1)
.phase(2, [0,2000,0], [0.005, 0.15], [8,-8], 0, 1)
.play([1,2]);
)" ], [ 1089.5375007, 'alex', "~v[31]=\\filter-> {arg in; Limiter.ar(GVerb.ar(in,roomsize:40,revtime:8,add:in),0.2)};" ], [ 1084.8384613, 'joach', "(
~jdrum[2] = \\set -> QuantEnv(\\fplus, 0.5)
.phase(1, [0,100,0], [0.005, 0.15], [8,-2], 0, 8)
.phase(2, [0,[100,1000],0], [0.005, 0.15], [8,-2], 0, 1)
.phase(2, [0,8000,0], [0.005, 0.15], [8,-8], 0, 1)
.play([1,2]);
)" ], [ 1083.0544586, 'kof', "(
~ss.ar(2);
~ss.quant=2;
~ss.fadeTime=0.2;
~ss={
  //         |       |       |       |       |  
  var pat = [1,0,0,0,1,0,0,0,1,0,0,0,1,0,0,0].rotate(3);
  var imp = PulseDivider.kr(~tick.kr,4,~counter.kr);
  var hit = Select.kr(PulseCount.kr(imp)%pat.size,pat);
  var env = EnvGen.ar(Env([0.001,1,1,0.001],[0.002,0.5,0.0002],[3,1,-3],curve:'exp'),imp * hit);
  var sig = [
  SinOsc.ar(5000!2),
    LFSaw.ar(15000),
    Pulse.ar(4),
    LFSaw.ar(50),
    Pulse.ar(500),
    LFSaw.ar(50)
  ];
  sig = Select.ar(PulseCount.kr(imp*hit)%sig.size,sig);
  sig = sig * env;
  Splay.ar(sig,0.75,0.05);
};
~ss.play;
);" ], [ 1083.0144585, 'alex', "(
~v[0]={
	var sig, env,fenv, penv;

	env=EnvGen.kr(Env([0,1,0],[1,0.01],[\\lin, \\step]),\\trig.tr);
	penv=EnvGen.kr(Env([0.8,0,2],[0.04,0.1],[\\lin,\\welch]),\\trig.tr);

	sig=AudioIn.ar(1)*env;
	sig=sig*env;
};
)" ], [ 1078.9144221, 'joach', "~jdrum.play(vol: 0.9, fadeTime: 8);" ], [ 1076.194416, 'alex', "~v[1]=\\set->Pbind(\\args, [\\trig], \\dur, 8, \\trig, 1);" ], [ 1069.5234067, 'kof', "(
~ss.ar(2);
~ss.quant=2;
~ss.fadeTime=0.2;
~ss={
  //         |       |       |       |       |  
  var pat = [1,0,0,0,1,0,0,0,1,0,0,0,1,0,0,0].rotate(3);
  var imp = PulseDivider.kr(~tick.kr,4,~counter.kr);
  var hit = Select.kr(PulseCount.kr(imp)%pat.size,pat);
  var env = EnvGen.ar(Env([0.001,1,1,0.001],[0.002,0.5,0.0002],[3,1,-3],curve:'exp'),imp * hit);
  var sig = [
  SinOsc.ar(5000!2),
    LFSaw.ar(15000),
    Pulse.ar(4),
    LFSaw.ar(50),
  ];
  sig = Select.ar(PulseCount.kr(imp*hit)%sig.size,sig);
  sig = sig * env;
  Splay.ar(sig,0.75,0.05);
};
~ss.play;
);" ], [ 1068.7623726, 'joach', "(
~jSaw[6] = \\set -> QuantEnv(\\flpus, 4)
.phase(1, [0,1000,0], [0.005, 0.25], [8,-2], 0, 16)
.phase(2, [0,800,0], [0.035, 0.12], [8,-2], 0, 8)
.play([1,2]);
)" ], [ 1066.6523697, 'alex', "~v[32]=\\filter->{arg in; LPF.ar(in,\\lpf.kr(800))};" ], [ 1060.4633292, 'joach', "(
~jSaw[1] = \\set -> QuantEnv(\\amp, 8)
.phase(1, [0.2,1,0.5], [0.05, 7.95], [8,-2], 0, 3)
.phase(2, [0.5,1,0.2], [3.35, 6.65], [8,-2], 0, 1)
.play([1,2]);
)" ], [ 1059.8453263, 'kof', "(
~ss.ar(2);
~ss.quant=2;
~ss.fadeTime=0.2;
~ss={
  //         |       |       |       |       |  
  var pat = [1,0,0,0,1,0,0,0,1,0,0,0,1,0,0,0].rotate(3);
  var imp = PulseDivider.kr(~tick.kr,4,~counter.kr);
  var hit = Select.kr(PulseCount.kr(imp)%pat.size,pat);
  var env = EnvGen.ar(Env([0.001,1,1,0.001],[0.002,0.5,0.0002],[3,1,-3],curve:'exp'),imp * hit);
  var sig = [
  SinOsc.ar(5000!2),
    LFSaw.ar(15000),
    Pulse.ar(4),
  ];
  sig = Select.ar(PulseCount.kr(imp*hit)%sig.size,sig);
  sig = sig * env;
  Splay.ar(sig,0.75,0.05);
};
~ss.play;
);" ], [ 1053.2582871, 'joach', "(
~jSaw[1] = \\set -> QuantEnv(\\amp, 1)
.phase(1, [0.2,1,0.5], [0.05, 7.95], [8,-2], 0, 3)
.phase(2, [0.5,1,0.2], [3.35, 6.65], [8,-2], 0, 1)
.play([1,2]);
)" ], [ 1049.1982775, 'kof', "(
~ss.ar(2);
~ss.quant=2;
~ss.fadeTime=0.2;
~ss={
  //         |       |       |       |       |  
  var pat = [1,0,0,0,1,0,0,0,1,0,0,0,1,0,0,0].rotate(3);
  var imp = PulseDivider.kr(~tick.kr,4,~counter.kr);
  var hit = Select.kr(PulseCount.kr(imp)%pat.size,pat);
  var env = EnvGen.ar(Env([0.001,1,1,0.001],[0.002,0.5,0.0002],[3,1,-3],curve:'exp'),imp * hit);
  var sig = [
  SinOsc.ar(5000!2),
    LFSaw.ar(15000),
  ];
  sig = Select.ar(PulseCount.kr(imp*hit)%sig.size,sig);
  sig = sig * env;
  Splay.ar(sig,0.75,0.05);
};
~ss.play;
);" ], [ 1048.4492469, 'joach', "~jSaw.play(vol: 0.8, fadeTime: 12);" ], [ 1045.3382392, 'kof', "(
~ss.ar(2);
~ss.quant=2;
~ss.fadeTime=0.2;
~ss={
  //         |       |       |       |       |  
  var pat = [1,0,0,0,1,0,0,0,1,0,0,0,1,0,0,0].rotate(3);
  var imp = PulseDivider.kr(~tick.kr,4,~counter.kr);
  var hit = Select.kr(PulseCount.kr(imp)%pat.size,pat);
  var env = EnvGen.ar(Env([0.001,1,1,0.001],[0.002,0.5,0.0002],[3,1,-3],curve:'exp'),imp * hit);
  var sig = [
  SinOsc.ar(5000!2),
    LFSaw.ar(15000),
  ];
  sig = Select.ar(PulseCount.kr(imp*hit)%sig.size,sig);
  sig = sig * env;
  Splay.ar(sig,0.75,0.15);
};
~ss.play;
);" ], [ 1042.9882074, 'joach', "~jSaw[7] = \\set -> Pbind(\\args, [\\freq], \\octave, 3, \\degree, Pseq([3,4,3,7], inf), \\dur, 16);" ], [ 1036.5971939, 'kof', "(
~ss.ar(2);
~ss.quant=2;
~ss.fadeTime=0.2;
~ss={
  //         |       |       |       |       |  
  var pat = [1,0,0,0,1,0,0,0,1,0,0,0,1,0,0,0].rotate(3);
  var imp = PulseDivider.kr(~tick.kr,4,~counter.kr);
  var hit = Select.kr(PulseCount.kr(imp)%pat.size,pat);
  var env = EnvGen.ar(Env([0.001,1,1,0.001],[0.002,0.5,0.0002],[3,1,-3],curve:'exp'),imp * hit);
  var sig = [
  SinOsc.ar(5000!2),
    LFSaw.ar(15000),
  ];
  sig = Select.ar(PulseCount.kr(imp*hit)%sig.size,sig);
  sig = sig * env;
  Splay.ar(sig,0.75,0.5);
};
~ss.play;
);" ], [ 1029.5611542, 'joach', "~jSaw[3] = \\filter -> {|in| GVerb.ar(in, \\gverb_size.kr(60), \\gverb_time.kr(14), 0.9, mul:\\mulgverb.kr(1)) };" ], [ 1024.6431128, 'joach', "~jSaw[3] = \\filter -> {|in| GVerb.ar(in, \\gverb_size.kr(12), \\gverb_time.kr(14), 0.9, mul:\\mulgverb.kr(1)) };" ], [ 1015.5830655, 'joach', "(
~jSaw[5] = \\set -> QuantEnv(\\noise, 8)
.phase(1, [0.2,1,0.2], [1.05, 7.95], [2,-2], 0, 1)
.phase(2, [0,1,0], [3.35, 4.65], [2,-2], 0, 1)
.play([1,2]);
)" ], [ 1014.1580298, 'joach', "(
~jSaw[6] = \\set -> QuantEnv(\\flpus, 1)
.phase(1, [0,100,0], [0.005, 0.25], [8,-2], 0, 16)
.phase(2, [0,800,0], [0.035, 0.12], [8,-2], 0, 8)
.play([1,2]);
)" ], [ 1007.8289892, 'joach', "~jSaw.play(vol: 0.5, fadeTime: 12);" ], [ 1001.2809784, 'kof', "(
~ss.ar(2);
~ss.quant=2;
~ss.fadeTime=4.2;
~ss={
  //         |       |       |       |       |  
  var pat = [1,0,0,0,1,0,0,0,1,0,0,0,1,0,0,0].rotate(1);
  var imp = PulseDivider.kr(~tick.kr,32,~counter.kr);
  var hit = Select.kr(PulseCount.kr(imp)/[1,2,3,4]%pat.size,pat);
  var env = EnvGen.ar(Env([0.001,1,0.001],[1.002,0.05],[3,-3],curve:'exp'),imp * hit);
  var sig = SinOsc.ar(5000/1.25/(1+(1..4).reciprocal**2)+SinOsc.ar(40/fib(4)).range(-40,40),SinOsc.ar(500/[1,2,3,4]).range(-pi,pi));
  sig = sig * env;
  Splay.ar(sig,0.75,0.25);
};
~ss.play;
);" ], [ 995.922942, 'joach', "~jSaw[7] = \\set -> Pbind(\\args, [\\freq], \\octave, 7, \\degree, Pseq([3,4,3,7], inf), \\dur, 16);" ], [ 995.0439358, 'kof', "(
~ss.ar(2);
~ss.quant=2;
~ss.fadeTime=4.2;
~ss={
  //         |       |       |       |       |  
  var pat = [1,0,0,0,1,0,0,0,1,0,0,0,1,0,0,0].rotate(1);
  var imp = PulseDivider.kr(~tick.kr,32,~counter.kr);
  var hit = Select.kr(PulseCount.kr(imp)/[1,2,3,4]%pat.size,pat);
  var env = EnvGen.ar(Env([0.001,1,0.001],[1.002,0.05],[3,-3],curve:'exp'),imp * hit);
  var sig = SinOsc.ar(5000/1.5/(1+(1..4).reciprocal**2)+SinOsc.ar(40/fib(4)).range(-40,40),SinOsc.ar(500/[1,2,3,4]).range(-pi,pi));
  sig = sig * env;
  Splay.ar(sig,0.75,0.25);
};
~ss.play;
);" ], [ 990.232929, 'kof', "(
~ss.ar(2);
~ss.quant=2;
~ss.fadeTime=4.2;
~ss={
  //         |       |       |       |       |  
  var pat = [1,0,0,0,1,0,0,0,1,0,0,0,1,0,0,0].rotate(1);
  var imp = PulseDivider.kr(~tick.kr,32,~counter.kr);
  var hit = Select.kr(PulseCount.kr(imp)/[1,2,3,4]%pat.size,pat);
  var env = EnvGen.ar(Env([0.001,1,0.001],[1.002,0.05],[3,-3],curve:'exp'),imp * hit);
  var sig = SinOsc.ar(5000/2/(1+(1..4).reciprocal**2)+SinOsc.ar(40/fib(4)).range(-40,40),SinOsc.ar(500/[1,2,3,4]).range(-pi,pi));
  sig = sig * env;
  Splay.ar(sig,0.75,0.25);
};
~ss.play;
);" ], [ 988.9929273, 'kof', "(
~ss.ar(2);
~ss.quant=2;
~ss.fadeTime=4.2;
~ss={
  //         |       |       |       |       |  
  var pat = [1,0,0,0,1,0,0,0,1,0,0,0,1,0,0,0].rotate(1);
  var imp = PulseDivider.kr(~tick.kr,32,~counter.kr);
  var hit = Select.kr(PulseCount.kr(imp)/[1,2,3,4]%pat.size,pat);
  var env = EnvGen.ar(Env([0.001,1,0.001],[1.002,0.05],[3,-3],curve:'exp'),imp * hit);
  var sig = SinOsc.ar(5000/2/(1+(1..4).reciprocal**2)+SinOsc.ar(40/fib(4)).range(-40,4),SinOsc.ar(500/[1,2,3,4]).range(-pi,pi));
  sig = sig * env;
  Splay.ar(sig,0.75,0.25);
};
~ss.play;
);" ], [ 985.2529221, 'kof', "(
~ss.ar(2);
~ss.quant=2;
~ss.fadeTime=4.2;
~ss={
  //         |       |       |       |       |  
  var pat = [1,0,0,0,1,0,0,0,1,0,0,0,1,0,0,0].rotate(1);
  var imp = PulseDivider.kr(~tick.kr,32,~counter.kr);
  var hit = Select.kr(PulseCount.kr(imp)/[1,2,3,4]%pat.size,pat);
  var env = EnvGen.ar(Env([0.001,1,0.001],[1.002,0.05],[3,-3],curve:'exp'),imp * hit);
  var sig = SinOsc.ar(5000/2/(1+(1..4).reciprocal**2)+SinOsc.ar(40/fib(4)).range(-4,4),SinOsc.ar(500/[1,2,3,4]).range(-pi,pi));
  sig = sig * env;
  Splay.ar(sig,0.75,0.25);
};
~ss.play;
);" ], [ 983.1929192, 'alex', "~v[32]=\\filter->{arg in; LPF.ar(in,\\lpf.kr(400))};" ], [ 976.64291, 'alex', "~v[32]=\\filter->{arg in; LPF.ar(in,\\lpf.kr(200))};" ], [ 975.2729081, 'kof', "(
~ss.ar(2);
~ss.quant=2;
~ss.fadeTime=4.2;
~ss={
  //         |       |       |       |       |  
  var pat = [1,0,0,0,1,0,0,0,1,0,0,0,1,0,0,0].rotate(1);
  var imp = PulseDivider.kr(~tick.kr,32,~counter.kr);
  var hit = Select.kr(PulseCount.kr(imp)/[1,2,3,4]%pat.size,pat);
  var env = EnvGen.ar(Env([0.001,1,0.001],[1.002,0.05],[3,-3],curve:'exp'),imp * hit);
  var sig = SinOsc.ar(5000/2/(1+(1..4).reciprocal**2)+SinOsc.ar(4/fib(4)).range(-4,4),SinOsc.ar(50/[1,2,3,4]).range(-pi,pi));
  sig = sig * env;
  Splay.ar(sig,0.75,0.25);
};
~ss.play;
);" ], [ 974.629878, 'joach', "~jdrum[4] = \\filter -> {|in| CombC.ar(in, 0.25, 0.125, 0.5) };" ], [ 966.2818625, 'alex', "(
~v[0]={
	var sig, env,fenv, penv;

	env=EnvGen.kr(Env([0,1,0],[0.2,0.01],[\\lin, \\step]),\\trig.tr);
	penv=EnvGen.kr(Env([0.8,0,2],[0.04,0.1],[\\lin,\\welch]),\\trig.tr);

	sig=AudioIn.ar(1)*env;
	sig=sig*env;
};
)" ], [ 964.3668306, 'joach', "(
~jdrum[5] = \\set -> QuantEnv(\\noise, 4)
.phase(1, [0.2,0.5,0.2], [2.05, 0.95], [2,-2], 0, 1)
.phase(2, [0.2,0.8,0.2], [1.35, 2.65], [2,-2], 0, 1)
.play([1]);
)" ], [ 962.8337925, 'joach', "(
~jdrum[5] = \\set -> QuantEnv(\\noise, 4)
.phase(1, [0.2,0.5,0.2], [2.05, 0.95], [2,-2], 0, 1)
.phase(2, [0.2,0.8,0.2], [5.35, 2.65], [2,-2], 0, 1)
.play([1]);
)" ], [ 959.9977586, 'joach', "(
~jdrum[5] = \\set -> QuantEnv(\\noise, 4)
.phase(1, [0.2,0.5,0.2], [7.05, 0.95], [2,-2], 0, 1)
.phase(2, [0.2,0.8,0.2], [5.35, 2.65], [2,-2], 0, 1)
.play([1]);
)" ], [ 959.8067544, 'alex', "~v[1]=\\set->Pbind(\\args, [\\trig], \\dur, 2, \\trig, 1);" ], [ 952.1867438, 'alex', "(
~v[0]={
	var sig, env,fenv, penv;

	env=EnvGen.kr(Env([0,1,0],[0.4,0.01],[\\lin, \\step]),\\trig.tr);
	penv=EnvGen.kr(Env([0.8,0,2],[0.04,0.1],[\\lin,\\welch]),\\trig.tr);

	sig=AudioIn.ar(1)*env;
	sig=sig*env;
};
)" ], [ 950.1067408, 'alex', "(
~v[0]={
	var sig, env,fenv, penv;

	env=EnvGen.kr(Env([0,1,0],[1,0.01],[\\lin, \\step]),\\trig.tr);
	penv=EnvGen.kr(Env([0.8,0,2],[0.04,0.1],[\\lin,\\welch]),\\trig.tr);

	sig=AudioIn.ar(1)*env;
	sig=sig*env;
};
)" ], [ 948.7467105, 'joach', "~jdrum.set(\\lpf_freq, 8200);" ], [ 903.2456423, 'alex', "(
~v[0]={
	var sig, env,fenv, penv;

	env=EnvGen.kr(Env([0,1,0],[1,0.01],[\\lin, \\step]),\\trig.tr);
	penv=EnvGen.kr(Env([0.8,0,2],[0.04,0.1],[\\lin,\\welch]),\\trig.tr);

	sig=AudioIn.ar(1)*env;
	sig=sig*env;
};
)" ], [ 891.4046256, 'kof', "(
~ss.ar(2);
~ss.quant=2;
~ss.fadeTime=0.2;
~ss={
  //         |       |       |       |       |  
  var pat = [1,0,0,0,1,0,0,0,1,0,0,0,1,0,0,0].rotate(1);
  var imp = PulseDivider.kr(~tick.kr,32,~counter.kr);
  var hit = Select.kr(PulseCount.kr(imp)/[1,2,3,4]%pat.size,pat);
  var env = EnvGen.ar(Env([0.001,1,0.001],[1.002,0.05],[3,-3],curve:'exp'),imp * hit);
  var sig = SinOsc.ar(5000/1.25/(1+(1..4).reciprocal**2)+SinOsc.ar(1/4/fib(4)).range(-4,4),SinOsc.ar(50/[1,2,3,4]).range(-pi,pi));
  sig = sig * env;
  Splay.ar(sig,0.75,0.25);
};
~ss.play;
);" ], [ 889.127593, 'joach', "~jdrum[3] = \\set -> Pbind(\\args, [\\freq], \\octave, 4, \\degree, Pseq([3,4,3,7], inf), \\dur, 32);" ], [ 887.9045878, 'alex', "(
~v[0]={
	var sig, env,fenv, penv;

	env=EnvGen.kr(Env([0,1,0],[4,0.01],[\\lin, \\step]),\\trig.tr);
	penv=EnvGen.kr(Env([0.8,0,2],[0.04,0.1],[\\lin,\\welch]),\\trig.tr);

	sig=AudioIn.ar(1)*env;
	sig=sig*env;
};
)" ], [ 885.854552, 'joach', "~jdrum[3] = \\set -> Pbind(\\args, [\\freq], \\octave, 5, \\degree, Pseq([3,4,3,7], inf), \\dur, 32);" ], [ 878.8285279, 'alex', "~v.play(vol:0.8, fadeTime:6);" ], [ 878.5345111, 'joach', "~jSaw[7] = \\set -> Pbind(\\args, [\\freq], \\octave, 3, \\degree, Pseq([3,4,3,7], inf), \\dur, 16);" ], [ 868.496462, 'joach', "(
~jSaw[0] = {
	var osc = SinOsc.ar(( \\freq.kr(90) + \\fplus.kr(0) ), mul: 1, add: 0);
	var noise = BrownNoise.ar(\\noise.kr(0), (1 - \\noise.kr(0)));
	var sig = osc * noise;
	Pan2.ar( sig * \\amp.kr(0), \\pan.kr(0) );
};
)" ], [ 865.6314577, 'alex', "~v.play(vol:0.6, fadeTime:6);" ], [ 853.6394123, 'joach', "~jSaw.play(vol: 0.2, fadeTime: 12);" ], [ 852.251406, 'alex', "~v.play(vol:0.2, fadeTime:6);" ], [ 847.6613996, 'alex', "~v[31]=\\filter-> {arg in; Limiter.ar(GVerb.ar(in,roomsize:40,revtime:8,add:in),0.2)};" ], [ 845.2413962, 'alex', "~v[2]=\\set->Pbind(\\args, [\\freq], \\dur, 12, \\freq, Pseq([250,450,350,440,220,550],inf));" ], [ 844.371395, 'alex', "~v[1]=\\set->Pbind(\\args, [\\trig], \\dur, 6, \\trig, 1);" ], [ 841.9113916, 'alex', "(
~v[0]={
	var sig, env,fenv, penv;

	env=EnvGen.kr(Env([0,1,0],[1,0.01],[\\lin, \\step]),\\trig.tr);
	penv=EnvGen.kr(Env([0.8,0,2],[0.04,0.1],[\\lin,\\welch]),\\trig.tr);

	sig=AudioIn.ar(1)*env;
	sig=sig*env;
};
)" ], [ 825.4613378, 'joach', "~jSaw.play(vol: 0.7, fadeTime: 12);" ], [ 825.4533374, 'alex', "(
~v[0]={
	var sig, env,fenv, penv;

	env=EnvGen.kr(Env([0,1,0],[4,0.01],[\\lin, \\step]),\\trig.tr);
	penv=EnvGen.kr(Env([0.8,0,2],[0.04,0.1],[\\lin,\\welch]),\\trig.tr);

	sig=AudioIn.ar(1)*env;
	sig=sig*env;
};
)" ], [ 822.9493002, 'joach', "(
~jSaw[6] = \\set -> QuantEnv(\\flpus, 1)
.phase(1, [0,100,0], [0.005, 0.25], [8,-2], 0, 16)
.phase(2, [0,800,0], [0.035, 0.12], [8,-2], 0, 8)
.play([1,2]);
)" ], [ 819.7812612, 'joach', "(
~jSaw[4] = \\set -> QuantEnv(\\mulgverb, 2)
.phase(1, [0,1,0], [3.05, 8.95], [6,-2], 0, 1)
.phase(2, [0,1,0.2,0.4,0], [0.35, 5.65], [\\sin,-2], 6, 1)
.play([1,2]);
)" ], [ 818.5842302, 'joach', "~jSaw[3] = \\filter -> {|in| GVerb.ar(in, \\gverb_size.kr(12), \\gverb_time.kr(4), 0.9, mul:\\mulgverb.kr(1)) };" ], [ 817.0501904, 'joach', "~jSaw.set(\\lpf_freq, 1400);" ], [ 816.6211659, 'joach', "~jSaw[2] = \\filter -> {|in| LPF.ar(in, \\lpf_freq.kr(800,28)) };" ], [ 815.3671611, 'kof', "(
~ss.ar(2);
~ss.quant=2;
~ss.fadeTime=0.2;
~ss={
  //         |       |       |       |       |  
  var pat = [1,0,0,0,1,0,0,0,1,0,0,0,1,0,0,0].rotate(1);
  var imp = PulseDivider.kr(~tick.kr,32,~counter.kr);
  var hit = Select.kr(PulseCount.kr(imp)/[1,2,3,4]%pat.size,pat);
  var env = EnvGen.ar(Env([0.001,1,0.001],[1.002,0.05],[3,-3],curve:'exp'),imp * hit);
  var sig = SinOsc.ar(5000/(1+(1..4).reciprocal**2)+SinOsc.ar(1/4/fib(4)).range(-4,4),SinOsc.ar(50/[1,2,3,4]).range(-pi,pi));
  sig = sig * env;
  Splay.ar(sig,0.75,0.25);
};
~ss.play;
);" ], [ 814.3211314, 'joach', "(
~jSaw[1] = \\set -> QuantEnv(\\amp, 1)
.phase(1, [0.2,1,0.2], [0.05, 7.95], [8,-2], 0, 3)
.phase(2, [0.5,1,0.2], [3.35, 6.65], [8,-2], 0, 1)
.play([1,2]);
)" ], [ 813.4550969, 'joach', "(
~jSaw[0] = {
	var osc = LFSaw.ar(( \\freq.kr(90) + \\fplus.kr(0) ), mul: 1, add: 0);
	var noise = BrownNoise.ar(\\noise.kr(0), (1 - \\noise.kr(0)));
	var sig = osc * noise;
	Pan2.ar( sig * \\amp.kr(0), \\pan.kr(0) );
};
)" ], [ 811.2040893, 'kof', "(
~ss.ar(2);
~ss.quant=2;
~ss.fadeTime=0.2;
~ss={
  //         |       |       |       |       |  
  var pat = [1,0,0,0,1,0,0,0,1,0,0,0,1,0,0,0].rotate(1);
  var imp = PulseDivider.kr(~tick.kr,32,~counter.kr);
  var hit = Select.kr(PulseCount.kr(imp)/[1,2,3,4]%pat.size,pat);
  var env = EnvGen.ar(Env([0.001,1,0.001],[1.002,0.05],[3,-3],curve:'exp'),imp * hit);
  var sig = SinOsc.ar(500/(1+(1..4).reciprocal**2)+SinOsc.ar(1/4/fib(4)).range(-4,4),SinOsc.ar(50/[1,2,3,4]).range(-pi,pi));
  sig = sig * env;
  Splay.ar(sig,0.75,0.25);
};
~ss.play;
);" ], [ 808.854086, 'kof', "(
~ss.ar(2);
~ss.quant=2;
~ss.fadeTime=0.2;
~ss={
  //         |       |       |       |       |  
  var pat = [1,0,0,0,1,0,0,0,1,0,0,0,1,0,0,0].rotate(1);
  var imp = PulseDivider.kr(~tick.kr,32,~counter.kr);
  var hit = Select.kr(PulseCount.kr(imp)/[1,2,3,4]%pat.size,pat);
  var env = EnvGen.ar(Env([0.001,1,0.001],[1.002,0.05],[3,-3],curve:'exp'),imp * hit);
  var sig = SinOsc.ar(500/(1+(1..4).reciprocal**2)+SinOsc.ar(4/fib(4)).range(-4,4),SinOsc.ar(50/[1,2,3,4]).range(-pi,pi));
  sig = sig * env;
  Splay.ar(sig,0.75,0.25);
};
~ss.play;
);" ], [ 807.1130522, 'joach', "~jdrum.set(\\lpf_freq, 1200);" ], [ 801.8770423, 'kof', "(
~ss.ar(2);
~ss.quant=2;
~ss.fadeTime=0.2;
~ss={
  //         |       |       |       |       |  
  var pat = [1,0,0,0,1,0,0,0,1,0,0,0,1,0,0,0].rotate(1);
  var imp = PulseDivider.kr(~tick.kr,32,~counter.kr);
  var hit = Select.kr(PulseCount.kr(imp)/[1,2,3,4]%pat.size,pat);
  var env = EnvGen.ar(Env([0.001,1,0.001],[1.002,0.05],[3,-3],curve:'exp'),imp * hit);
  var sig = SinOsc.ar(500/(1+(1..4).reciprocal**2)+SinOsc.ar(4/fib(4)),SinOsc.ar(50/[1,2,3,4]).range(-pi,pi));
  sig = sig * env;
  Splay.ar(sig,0.75,0.25);
};
~ss.play;
);" ], [ 800.0180119, 'joach', "(
~jdrum[2] = \\set -> QuantEnv(\\fplus, 0.5)
.phase(1, [0,1000,0], [0.005, 0.15], [8,-2], 0, 8)
.phase(2, [0,[100,1000],0], [0.005, 0.15], [8,-2], 0, 1)
.phase(2, [0,8000,0], [0.005, 0.15], [8,-8], 0, 1)
.play([1,2]);
)" ], [ 793.4669669, 'joach', "(
~jdrum[2] = \\set -> QuantEnv(\\fplus, 1)
.phase(1, [0,1000,0], [0.005, 0.15], [8,-2], 0, 8)
.phase(2, [0,[100,1000],0], [0.005, 0.15], [8,-2], 0, 1)
.phase(2, [0,8000,0], [0.005, 0.15], [8,-8], 0, 1)
.play([1,2]);
)" ], [ 793.3149644, 'kof', "(
~ss.ar(2);
~ss.quant=2;
~ss.fadeTime=0.2;
~ss={
  //         |       |       |       |       |  
  var pat = [1,0,0,0,1,0,0,0,1,0,0,0,1,0,0,0].rotate(1);
  var imp = PulseDivider.kr(~tick.kr,32,~counter.kr);
  var hit = Select.kr(PulseCount.kr(imp)/[1,2,3,4]%pat.size,pat);
  var env = EnvGen.ar(Env([0.001,1,0.001],[1.002,0.05],[3,-3],curve:'exp'),imp * hit);
  var sig = SinOsc.ar(500/(1+(1..4).reciprocal**2)+SinOsc.ar(4/fib(4)),SinOsc.ar(50).range(-pi,pi));
  sig = sig * env;
  Splay.ar(sig,0.75,0.25);
};
~ss.play;
);" ], [ 785.9339255, 'joach', "(
~jdrum[2] = \\set -> QuantEnv(\\fplus, 0.5)
.phase(1, [0,1000,0], [0.005, 0.15], [8,-2], 0, 8)
.phase(2, [0,[100,1000],0], [0.005, 0.15], [8,-2], 0, 1)
.phase(2, [0,8000,0], [0.005, 0.15], [8,-8], 0, 1)
.play([1,2]);
)" ], [ 782.8029166, 'kof', "(
~ss.ar(2);
~ss.quant=2;
~ss.fadeTime=0.2;
~ss={
  //         |       |       |       |       |  
  var pat = [1,0,0,0,1,0,0,0,1,0,0,0,1,0,0,0].rotate(1);
  var imp = PulseDivider.kr(~tick.kr,32,~counter.kr);
  var hit = Select.kr(PulseCount.kr(imp)/[1,2,3,4]%pat.size,pat);
  var env = EnvGen.ar(Env([0.001,1,0.001],[1.002,0.05],[3,-3],curve:'exp'),imp * hit);
  var sig = SinOsc.ar(500/(1+(1..4).reciprocal**2)+SinOsc.ar(4/fib(4)));
  sig = sig * env;
  Splay.ar(sig,0.75,0.25);
};
~ss.play;
);" ], [ 781.0178854, 'joach', "(
~jdrum[2] = \\set -> QuantEnv(\\fplus, 0.5)
.phase(1, [0,100,0], [0.005, 0.15], [8,-2], 0, 8)
.phase(2, [0,[100,1000],0], [0.005, 0.15], [8,-2], 0, 1)
.phase(2, [0,8000,0], [0.005, 0.15], [8,-8], 0, 1)
.play([1,2]);
)" ], [ 778.3968482, 'joach', "(
~jdrum[2] = \\set -> QuantEnv(\\fplus, 0.5)
.phase(1, [0,800,0], [0.005, 0.15], [8,-2], 0, 8)
.phase(2, [0,[100,1000],0], [0.005, 0.15], [8,-2], 0, 1)
.phase(2, [0,8000,0], [0.005, 0.15], [8,-8], 0, 1)
.play([1,2]);
)" ], [ 771.9208355, 'kof', "(
~ss.ar(2);
~ss.quant=2;
~ss.fadeTime=0.2;
~ss={
  //         |       |       |       |       |  
  var pat = [1,0,0,0,1,0,0,0,1,0,0,0,1,0,0,0].rotate(1);
  var imp = PulseDivider.kr(~tick.kr,32,~counter.kr);
  var hit = Select.kr(PulseCount.kr(imp)/[1,2,3,4]%pat.size,pat);
  var env = EnvGen.ar(Env([0.001,1,0.001],[1.002,0.05],[3,-3],curve:'exp'),imp * hit);
  var sig = SinOsc.ar(500/(1+(1..4).reciprocal**2)+SinOsc.ar(4/fib(4)));
  sig = sig * env;
  Splay.ar(sig,0.75,0.15);
};
~ss.play;
);" ], [ 762.3908221, 'kof', "(
~ss.ar(2);
~ss.quant=2;
~ss.fadeTime=0.2;
~ss={
  //         |       |       |       |       |  
  var pat = [1,0,0,0,1,0,0,0,1,0,0,0,1,0,0,0].rotate(1);
  var imp = PulseDivider.kr(~tick.kr,16,~counter.kr);
  var hit = Select.kr(PulseCount.kr(imp)/[1,2,3,4]%pat.size,pat);
  var env = EnvGen.ar(Env([0.001,1,0.001],[1.002,0.05],[3,-3],curve:'exp'),imp * hit);
  var sig = SinOsc.ar(500/(1+(1..4).reciprocal**2)+SinOsc.ar(4/fib(4)));
  sig = sig * env;
  Splay.ar(sig,0.75,0.15);
};
~ss.play;
);" ], [ 756.7707813, 'joach', "~jdrum.play(vol: 0.4, fadeTime: 8);" ], [ 749.1287404, 'joach', "(
~jdrum[1] = \\set -> QuantEnv(\\amp, 4)
.phase(1, [0.2,1,0.2], [0.05, 0.95], [2,-2], 0, 4)
.phase(2, [0.2,1,0.2], [0.15, 0.85], [2,-2], 0, 1)
.phase(3, [0.2,1,0.2], [0.85, 0.15], [2,-2], 0, 1)
.phase(4, [0.2,0,0,0.2], [0.85, 3, 0.15], [\\sin,\\sin], 0, 2)
.play([1,2,1,3, 4]);
)" ], [ 743.6726989, 'joach', "(
~jdrum[5] = \\set -> QuantEnv(\\noise, 16)
.phase(1, [0.2,0.5,0.2], [7.05, 0.95], [2,-2], 0, 1)
.phase(2, [0.2,0.8,0.2], [5.35, 2.65], [2,-2], 0, 1)
.play([1]);
)" ], [ 736.1356578, 'joach', "(
~jdrum[5] = \\set -> QuantEnv(\\noise, 8)
.phase(1, [0.2,0.5,0.2], [7.05, 0.95], [2,-2], 0, 1)
.phase(2, [0.2,0.8,0.2], [5.35, 2.65], [2,-2], 0, 1)
.play([1]);
)" ], [ 727.83661, 'joach', "(
~jdrum[5] = \\set -> QuantEnv(\\noise, 8)
.phase(1, [0.2,0.5,0.2], [7.05, 0.95], [2,-2], 0, 1)
.phase(2, [0,0.8,0], [5.35, 2.65], [2,-2], 0, 1)
.play([1]);
)" ], [ 723.7955731, 'joach', "~jdrum.set(\\lpf_freq, 4200);" ], [ 704.0285132, 'joach', "(
~jdrum[2] = \\set -> QuantEnv(\\fplus, 0.5)
.phase(1, [0,800,0], [0.005, 0.15], [8,-2], 0, 8)
.phase(2, [0,[100,2000],0], [0.005, 0.15], [8,-2], 0, 1)
.phase(2, [0,8000,0], [0.005, 0.15], [8,-8], 0, 1)
.play([1,2]);
)" ], [ 687.6514581, 'joach', "~jdrum[3] = \\set -> Pbind(\\args, [\\freq], \\octave, 6, \\degree, Pseq([3,4,3,7], inf), \\dur, 32);" ], [ 673.4704337, 'kof', "(
~hh.ar(2);
~hh.quant=2;
~hh.fadeTime=0.2;
~hh={
  //         |       |       |       |       |  
  var pat = [1,0,0,0,1,0,0,0,1,0,0,0,1,0,0,0].rotate(1);
  var imp = PulseDivider.kr(~tick.kr,2,~counter.kr);
  var hit = Select.kr(PulseCount.kr(imp)/[1,2,3,4]%pat.size,pat);
  var env = EnvGen.ar(Env([0.001,1,0.001],[0.002,0.05],[3,-3],curve:'exp'),imp * hit);
  var sig = WhiteNoise.ar(1!4);
  sig = sig * env;
  Splay.ar(sig,0.75,0.25);
};
~hh.play;
);" ], [ 670.0683992, 'joach', "~jdrum[3] = \\set -> Pbind(\\args, [\\freq], \\octave, 6, \\degree, Pseq([3,4,3,7], inf), \\dur, 8);" ], [ 665.2703564, 'joach', "~jdrum.play(vol: 0.1, fadeTime: 8);" ], [ 658.9293167, 'joach', "~jdrum[4] = nil" ], [ 657.5673125, 'kof', "(
~rr.ar(2);
~rr.quant=2;
~rr.fadeTime=0.2;
~rr={
  //         |       |       |       |       |  
  var pat = [1,0,0,0,1,0,0,0,1,0,0,0,1,0,0,0].rotate(3);
  var imp = PulseDivider.kr(~tick.kr,2,~counter.kr);
  var hit = Select.kr(PulseCount.kr(imp)/[1,2,3,4]%pat.size,pat);
  var env = EnvGen.ar(Env([0.001,1,0.001],[0.002,4.5],[3,-3],curve:'exp'),imp * hit);
  var sig = SinOsc.ar(50+(env**[40,60,70,90]*400));
  sig = sig * env;
  Splay.ar(sig,0.25,0.95);
};
~rr.play;
);" ], [ 632.5542773, 'kof', "(
~rr.ar(2);
~rr.quant=2;
~rr.fadeTime=0.2;
~rr={
  //         |       |       |       |       |  
  var pat = [1,0,0,0,1,0,0,0,1,0,0,0,1,0,0,0].rotate(3);
  var imp = PulseDivider.kr(~tick.kr,2,~counter.kr);
  var hit = Select.kr(PulseCount.kr(imp)/[1,2,3,4]%pat.size,pat);
  var env = EnvGen.ar(Env([0.001,1,0.001],[0.002,4.5],[3,-3],curve:'exp'),imp * hit);
  var sig = SinOsc.ar(50+(env**[40,60,70,90]*4000));
  sig = sig * env;
  Splay.ar(sig,0.25,0.95);
};
~rr.play;
);" ], [ 624.6342662, 'kof', "(
~rr.ar(2);
~rr.quant=2;
~rr.fadeTime=0.2;
~rr={
  //         |       |       |       |       |  
  var pat = [1,0,0,0,1,0,0,0,1,0,0,0,1,0,0,0].rotate(3);
  var imp = PulseDivider.kr(~tick.kr,4,~counter.kr);
  var hit = Select.kr(PulseCount.kr(imp)/[1,2,3,4]%pat.size,pat);
  var env = EnvGen.ar(Env([0.001,1,0.001],[0.002,4.5],[3,-3],curve:'exp'),imp * hit);
  var sig = SinOsc.ar(50+(env**[40,60,70,90]*4000));
  sig = sig * env;
  Splay.ar(sig,0.25,0.95);
};
~rr.play;
);" ], [ 621.4742618, 'kof', "(
~rr.ar(2);
~rr.quant=2;
~rr.fadeTime=0.2;
~rr={
  //         |       |       |       |       |  
  var pat = [1,0,0,0,1,0,0,0,1,0,0,0,1,0,0,0].rotate(3);
  var imp = PulseDivider.kr(~tick.kr,8,~counter.kr);
  var hit = Select.kr(PulseCount.kr(imp)/[1,2,3,4]%pat.size,pat);
  var env = EnvGen.ar(Env([0.001,1,0.001],[0.002,4.5],[3,-3],curve:'exp'),imp * hit);
  var sig = SinOsc.ar(50+(env**[40,60,70,90]*4000));
  sig = sig * env;
  Splay.ar(sig,0.25,0.95);
};
~rr.play;
);" ], [ 618.0802524, 'kof', "(
~rr.ar(2);
~rr.quant=2;
~rr.fadeTime=0.2;
~rr={
  //         |       |       |       |       |  
  var pat = [1,0,0,0,1,0,0,0,1,0,0,0,1,0,0,0].rotate(3);
  var imp = PulseDivider.kr(~tick.kr,8,~counter.kr);
  var hit = Select.kr(PulseCount.kr(imp)/[1,2,3,4]%pat.size,pat);
  var env = EnvGen.ar(Env([0.001,1,0.001],[0.002,4.5],[3,-3],curve:'exp'),imp * hit);
  var sig = SinOsc.ar(50+(env**[40,60,70,90]*4000));
  sig = sig * env;
  Splay.ar(sig,0.75,0.95);
};
~rr.play;
);" ], [ 617.6532279, 'joach', "(
~jdrum[1] = \\set -> QuantEnv(\\amp, 1)
.phase(1, [0.2,1,0.2], [0.05, 0.95], [2,-2], 0, 4)
.phase(2, [0.2,1,0.2], [0.15, 0.85], [2,-2], 0, 1)
.phase(3, [0.2,1,0.2], [0.85, 0.15], [2,-2], 0, 1)
.phase(4, [0.2,0,0,0.2], [0.85, 3, 0.15], [\\sin,\\sin], 0, 2)
.play([1,2,1,3, 4]);
)" ], [ 616.682222, 'kof', "(
~rr.ar(2);
~rr.quant=2;
~rr.fadeTime=0.2;
~rr={
  //         |       |       |       |       |  
  var pat = [1,0,0,0,1,0,0,0,1,0,0,0,1,0,0,0].rotate(3);
  var imp = PulseDivider.kr(~tick.kr,8,~counter.kr);
  var hit = Select.kr(PulseCount.kr(imp)/[1,2,3,4]%pat.size,pat);
  var env = EnvGen.ar(Env([0.001,1,0.001],[0.002,4.5],[3,-3],curve:'exp'),imp * hit);
  var sig = SinOsc.ar(50+(env**[40,60,70,90]*400));
  sig = sig * env;
  Splay.ar(sig,0.75,0.95);
};
~rr.play;
);" ], [ 615.1622199, 'kof', "(
~rr.ar(2);
~rr.quant=2;
~rr.fadeTime=0.2;
~rr={
  //         |       |       |       |       |  
  var pat = [1,0,0,0,1,0,0,0,1,0,0,0,1,0,0,0].rotate(3);
  var imp = PulseDivider.kr(~tick.kr,8,~counter.kr);
  var hit = Select.kr(PulseCount.kr(imp)/[1,2,3,4]%pat.size,pat);
  var env = EnvGen.ar(Env([0.001,1,0.001],[0.002,4.5],[3,-3],curve:'exp'),imp * hit);
  var sig = SinOsc.ar(50+(env**[40,60,70,90]*40));
  sig = sig * env;
  Splay.ar(sig,0.75,0.95);
};
~rr.play;
);" ], [ 608.8622111, 'kof', "(
~rr.ar(2);
~rr.quant=2;
~rr.fadeTime=0.2;
~rr={
  //         |       |       |       |       |  
  var pat = [1,0,0,0,1,0,0,0,1,0,0,0,1,0,0,0].rotate(3);
  var imp = PulseDivider.kr(~tick.kr,8,~counter.kr);
  var hit = Select.kr(PulseCount.kr(imp)/[1,2,3,4]%pat.size,pat);
  var env = EnvGen.ar(Env([0.001,1,0.001],[0.002,4.5],[3,-3],curve:'exp'),imp * hit);
  var sig = SinOsc.ar(50+(env**40*40));
  sig = sig * env;
  Splay.ar(sig,0.75,0.95);
};
~rr.play;
);" ], [ 605.5822065, 'kof', "(
~rr.ar(2);
~rr.quant=2;
~rr.fadeTime=0.2;
~rr={
  //         |       |       |       |       |  
  var pat = [1,0,0,0,1,0,0,0,1,0,0,0,1,0,0,0].rotate(3);
  var imp = PulseDivider.kr(~tick.kr,8,~counter.kr);
  var hit = Select.kr(PulseCount.kr(imp)%pat.size,pat);
  var env = EnvGen.ar(Env([0.001,1,0.001],[0.002,4.5],[3,-3],curve:'exp'),imp * hit);
  var sig = SinOsc.ar(50+(env**40*40));
  sig = sig * env;
  Splay.ar(sig,0.75,0.95);
};
~rr.play;
);" ], [ 602.1122017, 'kof', "(
~rr.ar(2);
~rr.quant=2;
~rr.fadeTime=0.2;
~rr={
  //         |       |       |       |       |  
  var pat = [1,0,0,0,1,0,0,0,1,0,0,0,1,0,0,0].rotate(3);
  var imp = PulseDivider.kr(~tick.kr,4,~counter.kr);
  var hit = Select.kr(PulseCount.kr(imp)%pat.size,pat);
  var env = EnvGen.ar(Env([0.001,1,0.001],[0.002,4.5],[3,-3],curve:'exp'),imp * hit);
  var sig = SinOsc.ar(50+(env**40*40));
  sig = sig * env;
  Splay.ar(sig,0.75,0.95);
};
~rr.play;
);" ], [ 597.4521951, 'kof', "(
~rr.ar(2);
~rr.quant=2;
~rr.fadeTime=0.2;
~rr={
  //         |       |       |       |       |  
  var pat = [1,0,0,0,1,0,0,0,1,0,0,0,1,0,0,0].rotate(3);
  var imp = PulseDivider.kr(~tick.kr,4,~counter.kr);
  var hit = Select.kr(PulseCount.kr(imp)%pat.size,pat);
  var env = EnvGen.ar(Env([0.001,1,0.001],[0.002,4.5],[3,-3],curve:'exp'),imp * hit);
  var sig = SinOsc.ar(50+(env**40*40));
  sig = sig * env;
  Splay.ar(sig,0.75,0.5);
};
~rr.play;
);" ], [ 594.3821908, 'kof', "(
~rr.ar(2);
~rr.quant=2;
~rr.fadeTime=0.2;
~rr={
  //         |       |       |       |       |  
  var pat = [1,0,0,0,1,0,0,0,1,0,0,0,1,0,0,0].rotate(3);
  var imp = PulseDivider.kr(~tick.kr,4,~counter.kr);
  var hit = Select.kr(PulseCount.kr(imp)%pat.size,pat);
  var env = EnvGen.ar(Env([0.001,1,0.001],[0.002,0.5],[3,-3],curve:'exp'),imp * hit);
  var sig = SinOsc.ar(50+(env**40*40));
  sig = sig * env;
  Splay.ar(sig,0.75,0.5);
};
~rr.play;
);" ], [ 588.0901819, 'kof', "~pulse.clear;" ], [ 575.0301636, 'kof', "(
~pulse.ar(2);
~pulse.quant=2;
~pulse.fadeTime=4.2;
~pulse={
  //         |       |       |       |       |  
  var pat = [1,0,0,0,1,0,0,0,1,0,0,0,1,0,0,0].rotate(1);
  var imp = PulseDivider.kr(~tick.kr,8,~counter.kr);
  var hit = Select.kr(PulseCount.kr(imp)/[1,2,3,4]%pat.size,pat);
  var env = EnvGen.ar(Env([0.001,0.1,1,0.001],[0.002,0.05,0.002],[3,1,-3],curve:'exp'),imp * hit);
  var sig = Pulse.ar(50) * LFSaw.ar(150*[1,2,10,20]) + SinOsc.ar(50*(1+(1..4).reciprocal),SinOsc.ar(50/fib(8)).range(-pi,pi));
  sig = LPF.ar(sig,80+LFNoise2.ar(8/fib(4)).range(0,10000) );
  sig = sig * env;
  //sig = CombN.ar(sig,1/2,1/8,4);
  Splay.ar(sig,0.25,0.25);
};
~pulse.play;
);" ], [ 573.6271336, 'joach', "(
~jdrum[5] = \\set -> QuantEnv(\\noise, 8)
.phase(1, [0.2,0.5,0.2], [7.05, 0.95], [2,-2], 0, 1)
.phase(2, [0,0.8,0], [5.35, 2.65], [2,-2], 0, 1)
.play([1]);
)" ], [ 573.0491279, 'kof', "(
~pulse.ar(2);
~pulse.quant=2;
~pulse.fadeTime=4.2;
~pulse={
  //         |       |       |       |       |  
  var pat = [1,0,0,0,1,0,0,0,1,0,0,0,1,0,0,0].rotate(1);
  var imp = PulseDivider.kr(~tick.kr,8,~counter.kr);
  var hit = Select.kr(PulseCount.kr(imp)/[1,2,3,4]%pat.size,pat);
  var env = EnvGen.ar(Env([0.001,0.1,1,0.001],[0.002,0.5,0.002],[3,1,-3],curve:'exp'),imp * hit);
  var sig = Pulse.ar(50) * LFSaw.ar(150*[1,2,10,20]) + SinOsc.ar(50*(1+(1..4).reciprocal),SinOsc.ar(50/fib(8)).range(-pi,pi));
  sig = LPF.ar(sig,80+LFNoise2.ar(8/fib(4)).range(0,10000) );
  sig = sig * env;
  //sig = CombN.ar(sig,1/2,1/8,4);
  Splay.ar(sig,0.25,0.25);
};
~pulse.play;
);" ], [ 569.0191222, 'kof', "(
~pulse.ar(2);
~pulse.quant=2;
~pulse.fadeTime=4.2;
~pulse={
  //         |       |       |       |       |  
  var pat = [1,0,0,0,1,0,0,0,1,0,0,0,1,0,0,0].rotate(3);
  var imp = PulseDivider.kr(~tick.kr,8,~counter.kr);
  var hit = Select.kr(PulseCount.kr(imp)/[1,2,3,4]%pat.size,pat);
  var env = EnvGen.ar(Env([0.001,0.1,1,0.001],[0.002,0.5,0.002],[3,1,-3],curve:'exp'),imp * hit);
  var sig = Pulse.ar(50) * LFSaw.ar(150*[1,2,10,20]) + SinOsc.ar(50*(1+(1..4).reciprocal),SinOsc.ar(50/fib(8)).range(-pi,pi));
  sig = LPF.ar(sig,80+LFNoise2.ar(8/fib(4)).range(0,10000) );
  sig = sig * env;
  //sig = CombN.ar(sig,1/2,1/8,4);
  Splay.ar(sig,0.25,0.25);
};
~pulse.play;
);" ], [ 553.2691002, 'joach', "Kolektiv.tempo_(240);" ], [ 545.0180886, 'joach', "Kolektiv.tempo_(2);" ], [ 540.5480823, 'joach', "Kolektiv.tempo_(1);" ], [ 531.1540371, 'joach', "(
~jdrum[2] = \\set -> QuantEnv(\\fplus, 0.5)
.phase(1, [0,100,0], [0.005, 0.15], [8,-2], 0, 8)
.phase(2, [0,[100,2000],0], [0.005, 0.15], [8,-2], 0, 1)
.phase(2, [0,8000,0], [0.005, 0.15], [8,-8], 0, 1)
.play([1,2]);
)" ], [ 526.0189984, 'joach', "(
~jdrum[2] = \\set -> QuantEnv(\\fplus, 0.5)
.phase(1, [0,1700,0], [0.005, 0.15], [8,-2], 0, 8)
.phase(2, [0,[100,2000],0], [0.005, 0.15], [8,-2], 0, 1)
.phase(2, [0,8000,0], [0.005, 0.15], [8,-8], 0, 1)
.play([1,2]);
)" ], [ 522.2789898, 'kof', "(
~rr.ar(2);
~rr.quant=2;
~rr.fadeTime=0.2;
~rr={
  //         |       |       |       |       |  
  var pat = [1,0,0,0,1,0,0,0,1,0,0,0,1,0,0,0].rotate(3);
  var imp = PulseDivider.kr(~tick.kr,2,~counter.kr);
  var hit = Select.kr(PulseCount.kr(imp)%pat.size,pat);
  var env = EnvGen.ar(Env([0.001,1,0.001],[0.002,0.5],[3,-3],curve:'exp'),imp * hit);
  var sig = SinOsc.ar(50+(env**40*40));
  sig = sig * env;
  Splay.ar(sig,0.75,0.5);
};
~rr.play;
);" ], [ 514.1139469, 'joach', "(
~jdrum[1] = \\set -> QuantEnv(\\amp, 1)
.phase(1, [0.2,1,0.2], [0.05, 0.95], [2,-2], 0, 4)
.phase(2, [0.2,1,0.2], [0.15, 0.85], [2,-2], 0, 1)
.phase(3, [0.2,1,0.2], [0.85, 0.15], [2,-2], 0, 1)
.play([1,2,1,3]);
)" ], [ 503.3058973, 'joach', "~jdrum.set(\\lpf_freq, 1200);" ], [ 501.695895, 'kof', "~pulse.clear;" ], [ 497.6758894, 'kof', "(
~pulse.ar(2);
~pulse.quant=2;
~pulse.fadeTime=4.2;
~pulse={
  //         |       |       |       |       |  
  var pat = [1,0,0,0,1,0,0,0,1,0,0,0,1,0,0,0].rotate(3);
  var imp = PulseDivider.kr(~tick.kr,4,~counter.kr);
  var hit = Select.kr(PulseCount.kr(imp)/[1,2,3,4]%pat.size,pat);
  var env = EnvGen.ar(Env([0.001,0.1,1,0.001],[0.002,0.5,0.002],[3,1,-3],curve:'exp'),imp * hit);
  var sig = Pulse.ar(50) * LFSaw.ar(150*[1,2,10,20]) + SinOsc.ar(50*(1+(1..4).reciprocal),SinOsc.ar(50/fib(8)).range(-pi,pi));
  sig = LPF.ar(sig,80+LFNoise2.ar(8/fib(4)).range(0,10000) );
  sig = sig * env;
  //sig = CombN.ar(sig,1/2,1/8,4);
  Splay.ar(sig,0.25,0.25);
};
~pulse.play;
);" ], [ 494.1758845, 'kof', "(
~pulse.ar(2);
~pulse.quant=2;
~pulse.fadeTime=4.2;
~pulse={
  //         |       |       |       |       |  
  var pat = [1,0,0,0,1,0,0,0,1,0,0,0,1,0,0,0].rotate(3);
  var imp = PulseDivider.kr(~tick.kr,4,~counter.kr);
  var hit = Select.kr(PulseCount.kr(imp)/[1,2,3,4]%pat.size,pat);
  var env = EnvGen.ar(Env([0.001,1,1,0.001],[0.002,0.5,0.002],[3,1,-3],curve:'exp'),imp * hit);
  var sig = Pulse.ar(50) * LFSaw.ar(150*[1,2,10,20]) + SinOsc.ar(50*(1+(1..4).reciprocal),SinOsc.ar(50/fib(8)).range(-pi,pi));
  sig = LPF.ar(sig,80+LFNoise2.ar(8/fib(4)).range(0,10000) );
  sig = sig * env;
  //sig = CombN.ar(sig,1/2,1/8,4);
};
~pulse.play;
);" ], [ 493.5888526, 'joach', "~jdrum[6] = \\filter -> {|in| LPF.ar(in, \\lpf_freq.kr(800,28)) };" ], [ 488.7798431, 'kof', "(
~pulse.ar(2);
~pulse.quant=2;
~pulse.fadeTime=4.2;
~pulse={
  //         |       |       |       |       |  
  var pat = [1,0,0,0,1,0,0,0,1,0,0,0,1,0,0,0].rotate(3);
  var imp = PulseDivider.kr(~tick.kr,2,~counter.kr);
  var hit = Select.kr(PulseCount.kr(imp)/[1,2,3,4]%pat.size,pat);
  var env = EnvGen.ar(Env([0.001,1,1,0.001],[0.002,0.5,0.002],[3,1,-3],curve:'exp'),imp * hit);
  var sig = Pulse.ar(50) * LFSaw.ar(150*[1,2,10,20]) + SinOsc.ar(50*(1+(1..4).reciprocal),SinOsc.ar(50/fib(8)).range(-pi,pi));
  sig = LPF.ar(sig,80+LFNoise2.ar(8/fib(4)).range(0,10000) );
  sig = sig * env;
  //sig = CombN.ar(sig,1/2,1/8,4);
  Splay.ar(sig,0.25,0.25);
};
~pulse.play;
);" ], [ 485.4688384, 'kof', "(
~pulse.ar(2);
~pulse.quant=2;
~pulse.fadeTime=4.2;
~pulse={
  //         |       |       |       |       |  
  var pat = [1,0,0,0,1,0,0,0,1,0,0,0,1,0,0,0].rotate(3);
  var imp = PulseDivider.kr(~tick.kr,2,~counter.kr);
  var hit = Select.kr(PulseCount.kr(imp)/[1,2,3,4]%pat.size,pat);
  var env = EnvGen.ar(Env([0.001,1,1,0.001],[0.002,0.25,0.002],[3,1,-3],curve:'exp'),imp * hit);
  var sig = Pulse.ar(50) * LFSaw.ar(150*[1,2,10,20]) + SinOsc.ar(50*(1+(1..4).reciprocal),SinOsc.ar(50/fib(8)).range(-pi,pi));
  sig = LPF.ar(sig,80+LFNoise2.ar(8/fib(4)).range(0,10000) );
  sig = sig * env;
  //sig = CombN.ar(sig,1/2,1/8,4);
  Splay.ar(sig,0.25,0.25);
};
~pulse.play;
);" ], [ 479.8688306, 'kof', "(
~pulse.ar(2);
~pulse.quant=2;
~pulse.fadeTime=4.2;
~pulse={
  //         |       |       |       |       |  
  var pat = [1,0,0,0,1,0,0,0,1,0,0,0,1,0,0,0].rotate(3);
  var imp = PulseDivider.kr(~tick.kr,2,~counter.kr);
  var hit = Select.kr(PulseCount.kr(imp)/[1,2,3,4]%pat.size,pat);
  var env = EnvGen.ar(Env([0.001,1,1,0.001],[0.002,0.25,0.002],[3,1,-3],curve:'exp'),imp * hit);
  var sig = Pulse.ar(50) * LFSaw.ar(150*[1,2,10,20]) * SinOsc.ar(50*(1+(1..4).reciprocal),SinOsc.ar(50/fib(8)).range(-pi,pi));
  sig = LPF.ar(sig,80+LFNoise2.ar(8/fib(4)).range(0,10000) );
  sig = sig * env;
  //sig = CombN.ar(sig,1/2,1/8,4);
  Splay.ar(sig,0.25,0.25);
};
~pulse.play;
);" ], [ 475.8268025, 'joach', "~jdrum.scope;" ], [ 462.8457737, 'kof', "(
~pulse.ar(2);
~pulse.quant=2;
~pulse.fadeTime=4.2;
~pulse={
  //         |       |       |       |       |  
  var pat = [1,0,0,0,1,0,0,0,1,0,0,0,1,0,0,0].rotate(3);
  var imp = PulseDivider.kr(~tick.kr,2,~counter.kr);
  var hit = Select.kr(PulseCount.kr(imp)/[1,2,3,4]%pat.size,pat);
  var env = EnvGen.ar(Env([0.001,1,1,0.001],[0.002,0.25,0.002],[3,1,-3],curve:'exp'),imp * hit);
  var sig = Pulse.ar(50) * LFSaw.ar(150*[1,2,10,20]) * SinOsc.ar(50,SinOsc.ar(50/fib(8)).range(-pi,pi));
  sig = LPF.ar(sig,80+LFNoise2.ar(8/fib(4)).range(0,10000) );
  sig = sig * env;
  //sig = CombN.ar(sig,1/2,1/8,4);
  Splay.ar(sig,0.25,0.25);
};
~pulse.play;
);" ], [ 456.8057652, 'kof', "(
~pulse.ar(2);
~pulse.quant=2;
~pulse.fadeTime=4.2;
~pulse={
  //         |       |       |       |       |  
  var pat = [1,0,0,0,1,0,0,0,1,0,0,0,1,0,0,0].rotate(3);
  var imp = PulseDivider.kr(~tick.kr,2,~counter.kr);
  var hit = Select.kr(PulseCount.kr(imp)/[1,2,3,4]%pat.size,pat);
  var env = EnvGen.ar(Env([0.001,1,1,0.001],[0.002,0.25,0.002],[3,1,-3],curve:'exp'),imp * hit);
  var sig = Pulse.ar(50) * LFSaw.ar(150*[1,2,10,20]) * SinOsc.ar(50,SinOsc.ar(50).range(-pi,pi));
  sig = LPF.ar(sig,80+LFNoise2.ar(8/fib(4)).range(0,10000) );
  sig = sig * env;
  //sig = CombN.ar(sig,1/2,1/8,4);
  Splay.ar(sig,0.25,0.25);
};
~pulse.play;
);" ], [ 455.0367338, 'joach', "~jdrum.play(vol: 0.9, fadeTime: 8);" ], [ 444.6656818, 'joach', "~jdrum.set(\\lpf_freq, 200);" ], [ 442.7286787, 'kof', "(
~pulse.ar(2);
~pulse.quant=2;
~pulse.fadeTime=4.2;
~pulse={
  //         |       |       |       |       |  
  var pat = [1,0,0,0,1,0,0,0,1,0,0,0,1,0,0,0].rotate(3);
  var imp = PulseDivider.kr(~tick.kr,2,~counter.kr);
  var hit = Select.kr(PulseCount.kr(imp)/[1,2,3,4]%pat.size,pat);
  var env = EnvGen.ar(Env([0.001,1,1,0.001],[0.002,0.25,0.002],[3,1,-3],curve:'exp'),imp * hit);
  var sig = Pulse.ar(50) * LFSaw.ar(150*[1,2,10,20]) * SinOsc.ar(50);
  sig = LPF.ar(sig,80+LFNoise2.ar(8/fib(4)).range(0,10000) );
  sig = sig * env;
  //sig = CombN.ar(sig,1/2,1/8,4);
  Splay.ar(sig,0.25,0.25);
};
~pulse.play;
);" ], [ 431.3486628, 'kof', "(
~pulse.ar(2);
~pulse.quant=2;
~pulse.fadeTime=4.2;
~pulse={
  //         |       |       |       |       |  
  var pat = [1,0,0,0,1,0,0,0,1,0,0,0,1,0,0,0].rotate(3);
  var imp = PulseDivider.kr(~tick.kr,2,~counter.kr);
  var hit = Select.kr(PulseCount.kr(imp)/[1,2,3,4]%pat.size,pat);
  var env = EnvGen.ar(Env([0.001,1,1,0.001],[0.002,0.25,0.002],[3,1,-3],curve:'exp'),imp * hit);
  var sig = Pulse.ar(50) * LFSaw.ar(150*[1,2,10,20]);
  sig = LPF.ar(sig,80+LFNoise2.ar(8/fib(4)).range(0,10000) );
  sig = sig * env;
  //sig = CombN.ar(sig,1/2,1/8,4);
  Splay.ar(sig,0.25,0.25);
};
~pulse.play;
);" ], [ 426.1026261, 'joach', "(
~jdrum[2] = \\set -> QuantEnv(\\fplus, 1)
.phase(1, [0,1700,0], [0.005, 0.15], [8,-2], 0, 8)
.phase(2, [0,[100,2000],0], [0.005, 0.15], [8,-2], 0, 1)
.phase(2, [0,8000,0], [0.005, 0.15], [8,-8], 0, 1)
.play([1,2]);
)" ], [ 425.780621, 'kof', "(
~pulse.ar(2);
~pulse.quant=2;
~pulse.fadeTime=4.2;
~pulse={
  //         |       |       |       |       |  
  var pat = [1,0,0,0,1,0,0,0,1,0,0,0,1,0,0,0].rotate(3);
  var imp = PulseDivider.kr(~tick.kr,4,~counter.kr);
  var hit = Select.kr(PulseCount.kr(imp)/[1,2,3,4]%pat.size,pat);
  var env = EnvGen.ar(Env([0.001,1,1,0.001],[0.002,0.25,0.002],[3,1,-3],curve:'exp'),imp * hit);
  var sig = Pulse.ar(50) * LFSaw.ar(150*[1,2,10,20]);
  sig = LPF.ar(sig,80+LFNoise2.ar(8/fib(4)).range(0,10000) );
  sig = sig * env;
  //sig = CombN.ar(sig,1/2,1/8,4);
  Splay.ar(sig,0.25,0.25);
};
~pulse.play;
);" ], [ 417.3506092, 'kof', "(
~pulse.ar(2);
~pulse.quant=2;
~pulse.fadeTime=4.2;
~pulse={
  //         |       |       |       |       |  
  var pat = [1,0,0,0,1,0,0,0,1,0,0,0,1,0,0,0].rotate(3);
  var imp = PulseDivider.kr(~tick.kr,4,~counter.kr);
  var hit = Select.kr(PulseCount.kr(imp)/[1,2,3,4]%pat.size,pat);
  var env = EnvGen.ar(Env([0.001,1,1,0.001],[0.002,0.25,0.002],[3,1,-3],curve:'exp'),imp * hit);
  var sig = Pulse.ar(50) * LFSaw.ar(50*[1,2,10,20]);
  sig = LPF.ar(sig,80+LFNoise2.ar(8/fib(4)).range(0,10000) );
  sig = sig * env;
  //sig = CombN.ar(sig,1/2,1/8,4);
  Splay.ar(sig,0.25,0.25);
};
~pulse.play;
);" ], [ 414.632576, 'joach', "~jdrum[3] = \\set -> Pbind(\\args, [\\freq], \\octave, 1, \\degree, Pseq([3,4,3,7], inf), \\dur, 8);" ], [ 409.6505655, 'kof', "(
~pulse.ar(2);
~pulse.quant=2;
~pulse.fadeTime=4.2;
~pulse={
  //         |       |       |       |       |  
  var pat = [1,0,0,0,1,0,0,0,1,0,0,0,1,0,0,0].rotate(3);
  var imp = PulseDivider.kr(~tick.kr,4,~counter.kr);
  var hit = Select.kr(PulseCount.kr(imp)/[1,2,3,4]%pat.size,pat);
  var env = EnvGen.ar(Env([0.001,1,1,0.001],[0.002,0.25,0.002],[3,1,-3],curve:'exp'),imp * hit);
  var sig = Pulse.ar(50) * LFSaw.ar(500/4*[1,2,10,20]);
  sig = LPF.ar(sig,80+LFNoise2.ar(8/fib(4)).range(0,10000) );
  sig = sig * env;
  //sig = CombN.ar(sig,1/2,1/8,4);
  Splay.ar(sig,0.25,0.25);
};
~pulse.play;
);" ], [ 405.66056, 'kof', "(
~pulse.ar(2);
~pulse.quant=2;
~pulse.fadeTime=4.2;
~pulse={
  //         |       |       |       |       |  
  var pat = [1,0,0,0,1,0,0,0,1,0,0,0,1,0,0,0].rotate(3);
  var imp = PulseDivider.kr(~tick.kr,4,~counter.kr);
  var hit = Select.kr(PulseCount.kr(imp)/[1,2,3,4]%pat.size,pat);
  var env = EnvGen.ar(Env([0.001,1,1,0.001],[0.002,0.25,0.002],[3,1,-3],curve:'exp'),imp * hit);
  var sig = Pulse.ar(50) * LFSaw.ar(500*[1,2,10,20]);
  sig = LPF.ar(sig,80+LFNoise2.ar(8/fib(4)).range(0,10000) );
  sig = sig * env;
  //sig = CombN.ar(sig,1/2,1/8,4);
  Splay.ar(sig,0.25,0.25);
};
~pulse.play;
);" ], [ 403.3855269, 'joach', "(
~jdrum[1] = \\set -> QuantEnv(\\amp, 2)
.phase(1, [0.2,1,0.2], [0.05, 0.95], [2,-2], 0, 4)
.phase(2, [0.2,1,0.2], [0.15, 0.85], [2,-2], 0, 1)
.phase(3, [0.2,1,0.2], [0.85, 0.15], [2,-2], 0, 1)
.play([1,2,1,3]);
)" ], [ 397.1895151, 'kof', "(
~pulse.ar(2);
~pulse.quant=2;
~pulse.fadeTime=4.2;
~pulse={
  //         |       |       |       |       |  
  var pat = [1,0,0,0,1,0,0,0,1,0,0,0,1,0,0,0].rotate(3);
  var imp = PulseDivider.kr(~tick.kr,2,~counter.kr);
  var hit = Select.kr(PulseCount.kr(imp)/[1,2,3,4]%pat.size,pat);
  var env = EnvGen.ar(Env([0.001,1,1,0.001],[0.002,0.25,0.002],[3,1,-3],curve:'exp'),imp * hit);
  var sig = Pulse.ar(50) * LFSaw.ar(500*[1,2,10,20]);
  sig = LPF.ar(sig,80+LFNoise2.ar(8/fib(4)).range(0,10000) );
  sig = sig * env;
  //sig = CombN.ar(sig,1/2,1/8,4);
  Splay.ar(sig,0.25,0.25);
};
~pulse.play;
);" ], [ 394.0995108, 'kof', "(
~pulse.ar(2);
~pulse.quant=2;
~pulse.fadeTime=4.2;
~pulse={
  //         |       |       |       |       |  
  var pat = [1,0,0,0,1,0,0,0,1,0,0,0,1,0,0,0].rotate(3);
  var imp = PulseDivider.kr(~tick.kr,1,~counter.kr);
  var hit = Select.kr(PulseCount.kr(imp)/[1,2,3,4]%pat.size,pat);
  var env = EnvGen.ar(Env([0.001,1,1,0.001],[0.002,0.25,0.002],[3,1,-3],curve:'exp'),imp * hit);
  var sig = Pulse.ar(50) * LFSaw.ar(500*[1,2,10,20]);
  sig = LPF.ar(sig,80+LFNoise2.ar(8/fib(4)).range(0,10000) );
  sig = sig * env;
  //sig = CombN.ar(sig,1/2,1/8,4);
  Splay.ar(sig,0.25,0.25);
};
~pulse.play;
);" ], [ 388.3395027, 'kof', "(
~pulse.ar(2);
~pulse.quant=2;
~pulse.fadeTime=4.2;
~pulse={
  //         |       |       |       |       |  
  var pat = [1,0,0,0,1,0,0,0,1,0,0,0,1,0,0,0].rotate(3);
  var imp = PulseDivider.kr(~tick.kr,1,~counter.kr);
  var hit = Select.kr(PulseCount.kr(imp)/[1,2,3,4]%pat.size,pat);
  var env = EnvGen.ar(Env([0.001,1,1,0.001],[0.002,0.125,0.002],[3,1,-3],curve:'exp'),imp * hit);
  var sig = Pulse.ar(50) * LFSaw.ar(500*[1,2,10,20]);
  sig = LPF.ar(sig,80+LFNoise2.ar(8/fib(4)).range(0,10000) );
  sig = sig * env;
  //sig = CombN.ar(sig,1/2,1/8,4);
  Splay.ar(sig,0.25,0.25);
};
~pulse.play;
);" ], [ 386.3504688, 'joach', "(
~jdrum[1] = \\set -> QuantEnv(\\amp, 2)
.phase(1, [0.2,1,0.2], [0.05, 0.95], [2,-2], 0, 4)
.phase(2, [0.2,1,0.2], [0.15, 0.85], [2,-2], 0, 1)
.play([1,2]);
)" ], [ 383.6464631, 'kof', "(
~pulse.ar(2);
~pulse.quant=2;
~pulse.fadeTime=4.2;
~pulse={
  //         |       |       |       |       |  
  var pat = [1,0,0,0,1,0,0,0,1,0,0,0,1,0,0,0].rotate(3);
  var imp = PulseDivider.kr(~tick.kr,1,~counter.kr);
  var hit = Select.kr(PulseCount.kr(imp)/[1,2,3,4]%pat.size,pat);
  var env = EnvGen.ar(Env([0.001,1,1,0.001],[0.002,0.125,0.002],[3,1,-3],curve:'exp'),imp * hit);
  var sig = Pulse.ar(50) * LFSaw.ar(500*[1,2,10,20]);
  sig = LPF.ar(sig,80+LFNoise2.ar(8/fib(4)).range(0,10000) );
  sig = sig * env;
  sig = CombN.ar(sig,1/2,1/8,4);
  Splay.ar(sig,0.25,0.25);
};
~pulse.play;
);" ], [ 379.7064576, 'kof', "(
~pulse.ar(2);
~pulse.quant=2;
~pulse.fadeTime=4.2;
~pulse={
  //         |       |       |       |       |  
  var pat = [1,0,0,0,1,0,0,0,1,0,0,0,1,0,0,0].rotate(3);
  var imp = PulseDivider.kr(~tick.kr,1,~counter.kr);
  var hit = Select.kr(PulseCount.kr(imp)/[1,2,3,4]%pat.size,pat);
  var env = EnvGen.ar(Env([0.001,1,1,0.001],[0.002,0.125,0.002],[3,1,-3],curve:'exp'),imp * hit);
  var sig = Pulse.ar(50) * LFSaw.ar(500/1.25*[1,2,10,20]);
  sig = LPF.ar(sig,80+LFNoise2.ar(8/fib(4)).range(0,10000) );
  sig = sig * env;
  sig = CombN.ar(sig,1/2,1/8,4);
  Splay.ar(sig,0.25,0.25);
};
~pulse.play;
);" ], [ 375.6164518, 'kof', "(
~pulse.ar(2);
~pulse.quant=2;
~pulse.fadeTime=4.2;
~pulse={
  //         |       |       |       |       |  
  var pat = [1,0,0,0,1,0,0,0,1,0,0,0,1,0,0,0].rotate(3);
  var imp = PulseDivider.kr(~tick.kr,1,~counter.kr);
  var hit = Select.kr(PulseCount.kr(imp)/[1,2,3,4]%pat.size,pat);
  var env = EnvGen.ar(Env([0.001,1,1,0.001],[0.002,0.125,0.002],[3,1,-3],curve:'exp'),imp * hit);
  var sig = Pulse.ar(50) * LFSaw.ar(500/1.5*[1,2,10,20]);
  sig = LPF.ar(sig,80+LFNoise2.ar(8/fib(4)).range(0,10000) );
  sig = sig * env;
  sig = CombN.ar(sig,1/2,1/8,4);
  Splay.ar(sig,0.25,0.25);
};
~pulse.play;
);" ], [ 373.467416, 'joach', "(
~jdrum[1] = \\set -> QuantEnv(\\amp, 4)
.phase(1, [0.2,1,0.2], [0.05, 0.95], [2,-2], 0, 4)
.phase(2, [0.2,1,0.2], [0.15, 0.85], [2,-2], 0, 1)
.play([1,2]);
)" ], [ 368.9873784, 'joach', "(
~jdrum[1] = \\set -> QuantEnv(\\amp, 1)
.phase(1, [0.2,1,0.2], [0.05, 0.95], [2,-2], 0, 4)
.phase(2, [0.2,1,0.2], [0.15, 0.85], [2,-2], 0, 1)
.play([1,2]);
)" ], [ 366.7773726, 'kof', "(
~pulse.ar(2);
~pulse.quant=2;
~pulse.fadeTime=4.2;
~pulse={
  //         |       |       |       |       |  
  var pat = [1,0,0,0,1,0,0,0,1,0,0,0,1,0,0,0].rotate(3);
  var imp = PulseDivider.kr(~tick.kr,1,~counter.kr);
  var hit = Select.kr(PulseCount.kr(imp)/[1,2,3,4]%pat.size,pat);
  var env = EnvGen.ar(Env([0.001,1,1,0.001],[0.002,0.125,0.002],[3,1,-3],curve:'exp'),imp * hit);
  var sig = Pulse.ar(50) * LFSaw.ar(500*[1,2,10,20]);
  sig = LPF.ar(sig,80+LFNoise2.ar(8/fib(4)).range(0,10000) );
  sig = sig * env;
  sig = CombN.ar(sig,1/2,1/8,4);
  Splay.ar(sig,0.25,0.25);
};
~pulse.play;
);" ], [ 362.5333625, 'kof', "(
~pulse.ar(2);
~pulse.quant=2;
~pulse.fadeTime=4.2;
~pulse={
  //         |       |       |       |       |  
  var pat = [1,0,0,0,1,0,0,0,1,0,0,0,1,0,0,0].rotate(3);
  var imp = PulseDivider.kr(~tick.kr,1,~counter.kr);
  var hit = Select.kr(PulseCount.kr(imp)/[1,2,3,4]%pat.size,pat);
  var env = EnvGen.ar(Env([0.001,1,1,0.001],[0.002,0.125,0.002],[3,1,-3],curve:'exp'),imp * hit);
  var sig = Pulse.ar(50) * LFSaw.ar(500*[1,2,10,20]);
  sig = LPF.ar(sig,80+LFNoise2.ar(8/fib(4)).range(0,1000) );
  sig = sig * env;
  sig = CombN.ar(sig,1/2,1/8,4);
  Splay.ar(sig,0.25,0.25);
};
~pulse.play;
);" ], [ 362.001332, 'joach', "~jdrum[3] = \\set -> Pbind(\\args, [\\freq], \\octave, 3, \\degree, Pseq([3,4,3,7], inf), \\dur, 8);" ], [ 359.7103288, 'kof', "(
~pulse.ar(2);
~pulse.quant=2;
~pulse.fadeTime=4.2;
~pulse={
  //         |       |       |       |       |  
  var pat = [1,0,0,0,1,0,0,0,1,0,0,0,1,0,0,0].rotate(3);
  var imp = PulseDivider.kr(~tick.kr,1,~counter.kr);
  var hit = Select.kr(PulseCount.kr(imp)/[1,2,3,4]%pat.size,pat);
  var env = EnvGen.ar(Env([0.001,1,1,0.001],[0.002,0.125,0.002],[3,1,-3],curve:'exp'),imp * hit);
  var sig = Pulse.ar(50) * LFSaw.ar(500*[1,2,10,20]);
  sig = LPF.ar(sig,800+LFNoise2.ar(8/fib(4)).range(0,1000) );
  sig = sig * env;
  sig = CombN.ar(sig,1/2,1/8,4);
  Splay.ar(sig,0.25,0.25);
};
~pulse.play;
);" ], [ 354.0903209, 'kof', "(
~pulse.ar(2);
~pulse.quant=2;
~pulse.fadeTime=4.2;
~pulse={
  //         |       |       |       |       |  
  var pat = [1,0,0,0,1,0,0,0,1,0,0,0,1,0,0,0].rotate(3);
  var imp = PulseDivider.kr(~tick.kr,1,~counter.kr);
  var hit = Select.kr(PulseCount.kr(imp)/[1,2,3,4]%pat.size,pat);
  var env = EnvGen.ar(Env([0.001,1,1,0.001],[0.002,0.125,0.002],[3,1,-3],curve:'exp'),imp * hit);
  var sig = Pulse.ar(50) * LFSaw.ar(500*[1,2,10,20]);
  sig = LPF.ar(sig,800+LFNoise2.ar(8/fib(4)).range(0,10000) );
  sig = sig * env;
  sig = CombN.ar(sig,1/2,1/8,4);
  Splay.ar(sig,0.25,0.25);
};
~pulse.play;
);" ], [ 352.2802855, 'joach', "~jdrum[6] = \\filter -> {|in| LPF.ar(in, \\lpf_freq.kr(800,8)) };" ], [ 350.4302829, 'kof', "(
~pulse.ar(2);
~pulse.quant=2;
~pulse.fadeTime=4.2;
~pulse={
  //         |       |       |       |       |  
  var pat = [1,0,0,0,1,0,0,0,1,0,0,0,1,0,0,0].rotate(3);
  var imp = PulseDivider.kr(~tick.kr,1,~counter.kr);
  var hit = Select.kr(PulseCount.kr(imp)/[1,2,3,4]%pat.size,pat);
  var env = EnvGen.ar(Env([0.001,1,1,0.001],[0.002,0.125,0.002],[3,1,-3],curve:'exp'),imp * hit);
  var sig = Pulse.ar(50) * LFSaw.ar(500*[1,2,10,20]);
  sig = LPF.ar(sig,800+LFNoise2.ar(8/fib(4)).range(0,1000) );
  sig = sig * env;
  sig = CombN.ar(sig,1/2,1/8,4);
  Splay.ar(sig,0.25,0.25);
};
~pulse.play;
);" ], [ 344.0002739, 'kof', "(
~pulse.ar(2);
~pulse.quant=2;
~pulse.fadeTime=4.2;
~pulse={
  //         |       |       |       |       |  
  var pat = [1,0,0,0,1,0,0,0,1,0,0,0,1,0,0,0].rotate(3);
  var imp = PulseDivider.kr(~tick.kr,1,~counter.kr);
  var hit = Select.kr(PulseCount.kr(imp)/[1,2,3,4]%pat.size,pat);
  var env = EnvGen.ar(Env([0.001,1,1,0.001],[0.002,0.125,0.002],[3,1,-3],curve:'exp'),imp * hit);
  var sig = Pulse.ar(50) * LFSaw.ar(500*[1,2,10,20]);
  sig = LPF.ar(sig,800+LFNoise2.ar(1/8/fib(4)).range(0,1000) );
  sig = sig * env;
  sig = CombN.ar(sig,1/2,1/8,4);
  Splay.ar(sig,0.25,0.25);
};
~pulse.play;
);" ], [ 339.0652349, 'joach', "(
~jdrum[5] = \\set -> QuantEnv(\\noise, 8)
.phase(1, [0,0.2,0], [7.05, 0.95], [2,-2], 0, 1)
.phase(2, [0,0.8,0], [5.35, 2.65], [2,-2], 0, 1)
.play([1]);
)" ], [ 338.6092333, 'kof', "(
~pulse.ar(2);
~pulse.quant=2;
~pulse.fadeTime=4.2;
~pulse={
  //         |       |       |       |       |  
  var pat = [1,0,0,0,1,0,0,0,1,0,0,0,1,0,0,0].rotate(3);
  var imp = PulseDivider.kr(~tick.kr,1,~counter.kr);
  var hit = Select.kr(PulseCount.kr(imp)/[1,2,3,4]%pat.size,pat);
  var env = EnvGen.ar(Env([0.001,1,1,0.001],[0.002,0.125,0.002],[3,1,-3],curve:'exp'),imp * hit);
  var sig = Pulse.ar(50) * LFSaw.ar(500/1.25*[1,2,10,20]);
  sig = LPF.ar(sig,800+LFNoise2.ar(1/8/fib(4)).range(0,1000) );
  sig = sig * env;
  sig = CombN.ar(sig,1/2,1/8,4);
  Splay.ar(sig,0.25,0.25);
};
~pulse.play;
);" ], [ 333.349226, 'kof', "(
~pulse.ar(2);
~pulse.quant=2;
~pulse.fadeTime=4.2;
~pulse={
  //         |       |       |       |       |  
  var pat = [1,0,0,0,1,0,0,0,1,0,0,0,1,0,0,0].rotate(3);
  var imp = PulseDivider.kr(~tick.kr,1,~counter.kr);
  var hit = Select.kr(PulseCount.kr(imp)/[1,2,3,4]%pat.size,pat);
  var env = EnvGen.ar(Env([0.001,1,1,0.001],[0.002,0.125,0.002],[3,1,-3],curve:'exp'),imp * hit);
  var sig = Pulse.ar(50) * LFSaw.ar(500/1.5*[1,2,10,20]);
  sig = LPF.ar(sig,800+LFNoise2.ar(1/8/fib(4)).range(0,1000) );
  sig = sig * env;
  sig = CombN.ar(sig,1/2,1/8,4);
  Splay.ar(sig,0.25,0.25);
};
~pulse.play;
);" ], [ 329.6492208, 'kof', "(
~pulse.ar(2);
~pulse.quant=2;
~pulse.fadeTime=4.2;
~pulse={
  //         |       |       |       |       |  
  var pat = [1,0,0,0,1,0,0,0,1,0,0,0,1,0,0,0].rotate(3);
  var imp = PulseDivider.kr(~tick.kr,1,~counter.kr);
  var hit = Select.kr(PulseCount.kr(imp)/[1,2,3,4]%pat.size,pat);
  var env = EnvGen.ar(Env([0.001,1,1,0.001],[0.002,0.125,0.002],[3,1,-3],curve:'exp'),imp * hit);
  var sig = Pulse.ar(50) * LFSaw.ar(500/2*[1,2,10,20]);
  sig = LPF.ar(sig,800+LFNoise2.ar(1/8/fib(4)).range(0,1000) );
  sig = sig * env;
  sig = CombN.ar(sig,1/2,1/8,4);
  Splay.ar(sig,0.25,0.25);
};
~pulse.play;
);" ], [ 320.7092083, 'kof', "(
~pulse.ar(2);
~pulse.quant=2;
~pulse.fadeTime=4.2;
~pulse={
  //         |       |       |       |       |  
  var pat = [1,0,0,0,1,0,0,0,1,0,0,0,1,0,0,0].rotate(3);
  var imp = PulseDivider.kr(~tick.kr,1,~counter.kr);
  var hit = Select.kr(PulseCount.kr(imp)/[1,2,3,4]%pat.size,pat);
  var env = EnvGen.ar(Env([0.001,1,1,0.001],[0.002,0.125,0.002],[3,1,-3],curve:'exp'),imp * hit);
  var sig = Pulse.ar(50) * LFSaw.ar(500*[1,2,10,20]);
  sig = LPF.ar(sig,800+LFNoise2.ar(1/8/fib(4)).range(0,1000) );
  sig = sig * env;
  sig = CombN.ar(sig,1/2,1/8,4);
  Splay.ar(sig,0.25,0.25);
};
~pulse.play;
);" ], [ 320.0681761, 'joach', "(
~jdrum[5] = \\set -> QuantEnv(\\noise, 8)
.phase(1, [0,0.2,0], [7.05, 0.95], [2,-2], 0, 1)
.phase(2, [0,1,0], [0.35, 0.65], [2,-2], 0, 1)
.play([1]);
)" ], [ 317.1521694, 'kof', "(
~pulse.ar(2);
~pulse.quant=2;
~pulse.fadeTime=4.2;
~pulse={
  //         |       |       |       |       |  
  var pat = [1,0,0,0,1,0,0,0,1,0,0,0,1,0,0,0].rotate(3);
  var imp = PulseDivider.kr(~tick.kr,1,~counter.kr);
  var hit = Select.kr(PulseCount.kr(imp)/[1,2,3,4]%pat.size,pat);
  var env = EnvGen.ar(Env([0.001,1,1,0.001],[0.002,0.125,0.002],[3,1,-3],curve:'exp'),imp * hit);
  var sig = Pulse.ar(50) * LFSaw.ar(500*[1,2,10,20]);
  sig = LPF.ar(sig,800+LFNoise2.ar(1/8/fib(4)).range(0,1000) );
  sig = sig * env;
  sig = CombN.ar(sig,1/2,1/80,4);
  Splay.ar(sig,0.25,0.25);
};
~pulse.play;
);" ], [ 311.812162, 'kof', "(
~pulse.ar(2);
~pulse.quant=2;
~pulse.fadeTime=4.2;
~pulse={
  //         |       |       |       |       |  
  var pat = [1,0,0,0,1,0,0,0,1,0,0,0,1,0,0,0].rotate(3);
  var imp = PulseDivider.kr(~tick.kr,1,~counter.kr);
  var hit = Select.kr(PulseCount.kr(imp)/[1,2,3,4]%pat.size,pat);
  var env = EnvGen.ar(Env([0.001,1,1,0.001],[0.002,0.125,0.002],[3,1,-3],curve:'exp'),imp * hit);
  var sig = Pulse.ar(50) * LFSaw.ar(500*[1,2,10,20]);
  sig = LPF.ar(sig,800+LFNoise2.ar(1/8/fib(4)).range(0,1000) );
  sig = sig * env;
  sig = CombN.ar(sig,1/2,1/80,16);
  Splay.ar(sig,0.25,0.25);
};
~pulse.play;
);" ], [ 310.890131, 'joach', "(
~jdrum[5] = \\set -> QuantEnv(\\noise, 8)
.phase(1, [0,1,0], [7.05, 0.95], [2,-2], 0, 1)
.phase(2, [0,1,0], [0.35, 0.65], [2,-2], 0, 1)
.play([1]);
)" ], [ 310.0711265, 'kof', "(
~pulse.ar(2);
~pulse.quant=2;
~pulse.fadeTime=4.2;
~pulse={
  //         |       |       |       |       |  
  var pat = [1,0,0,0,1,0,0,0,1,0,0,0,1,0,0,0].rotate(3);
  var imp = PulseDivider.kr(~tick.kr,1,~counter.kr);
  var hit = Select.kr(PulseCount.kr(imp)/[1,2,3,4]%pat.size,pat);
  var env = EnvGen.ar(Env([0.001,1,1,0.001],[0.002,0.125,0.002],[3,1,-3],curve:'exp'),imp * hit);
  var sig = Pulse.ar(50) * LFSaw.ar(500*[1,2,10,20]);
  sig = LPF.ar(sig,800+LFNoise2.ar(1/8/fib(4)).range(0,1000) );
  sig = sig * env;
  sig = CombN.ar(sig,1/2,1/8,16);
  Splay.ar(sig,0.25,0.25);
};
~pulse.play;
);" ], [ 305.6411203, 'kof', "(
~pulse.ar(2);
~pulse.quant=2;
~pulse.fadeTime=4.2;
~pulse={
  //         |       |       |       |       |  
  var pat = [1,0,0,0,1,0,0,0,1,0,0,0,1,0,0,0].rotate(3);
  var imp = PulseDivider.kr(~tick.kr,1,~counter.kr);
  var hit = Select.kr(PulseCount.kr(imp)/[1,2,3,4]%pat.size,pat);
  var env = EnvGen.ar(Env([0.001,1,1,0.001],[0.002,0.125,0.002],[3,1,-3],curve:'exp'),imp * hit);
  var sig = Pulse.ar(50) * LFSaw.ar(500*[1,2,10,20]);
  sig = LPF.ar(sig,800+LFNoise2.ar(1/8/fib(4)).range(0,1000) );
  sig = sig * env;
  sig = CombN.ar(sig,1/8,1/8,16);
  Splay.ar(sig,0.25,0.25);
};
~pulse.play;
);" ], [ 303.0911168, 'kof', "(
~pulse.ar(2);
~pulse.quant=2;
~pulse.fadeTime=4.2;
~pulse={
  //         |       |       |       |       |  
  var pat = [1,0,0,0,1,0,0,0,1,0,0,0,1,0,0,0].rotate(3);
  var imp = PulseDivider.kr(~tick.kr,1,~counter.kr);
  var hit = Select.kr(PulseCount.kr(imp)/[1,2,3,4]%pat.size,pat);
  var env = EnvGen.ar(Env([0.001,1,1,0.001],[0.002,0.125,0.002],[3,1,-3],curve:'exp'),imp * hit);
  var sig = Pulse.ar(50) * LFSaw.ar(500*[1,2,10,20]);
  sig = LPF.ar(sig,800+LFNoise2.ar(1/8/fib(4)).range(0,1000) );
  sig = sig * env;
  sig = CombN.ar(sig,1/4,1/8,16);
  Splay.ar(sig,0.25,0.25);
};
~pulse.play;
);" ], [ 300.3511129, 'kof', "(
~pulse.ar(2);
~pulse.quant=2;
~pulse.fadeTime=4.2;
~pulse={
  //         |       |       |       |       |  
  var pat = [1,0,0,0,1,0,0,0,1,0,0,0,1,0,0,0].rotate(3);
  var imp = PulseDivider.kr(~tick.kr,1,~counter.kr);
  var hit = Select.kr(PulseCount.kr(imp)/[1,2,3,4]%pat.size,pat);
  var env = EnvGen.ar(Env([0.001,1,1,0.001],[0.002,0.125,0.002],[3,1,-3],curve:'exp'),imp * hit);
  var sig = Pulse.ar(50) * LFSaw.ar(500*[1,2,10,20]);
  sig = LPF.ar(sig,800+LFNoise2.ar(1/8/fib(4)).range(0,1000) );
  sig = sig * env;
  sig = CombN.ar(sig,1/4,1/8,4);
  Splay.ar(sig,0.25,0.25);
};
~pulse.play;
);" ], [ 294.3401045, 'kof', "(
~pulse.ar(2);
~pulse.quant=2;
~pulse.fadeTime=4.2;
~pulse={
  //         |       |       |       |       |  
  var pat = [1,0,0,0,1,0,0,0,1,0,0,0,1,0,0,0].rotate(3);
  var imp = PulseDivider.kr(~tick.kr,1,~counter.kr);
  var hit = Select.kr(PulseCount.kr(imp)/[1,2,3,4]%pat.size,pat);
  var env = EnvGen.ar(Env([0.001,1,1,0.001],[0.002,0.125,0.002],[3,1,-3],curve:'exp'),imp * hit);
  var sig = Pulse.ar(50) * LFSaw.ar(500*[1,2,10,20]);
  sig = LPF.ar(sig,800+LFNoise2.ar(1/8/fib(4)).range(0,1000) );
  sig = sig * env;
  sig = CombN.ar(sig,1/4,1/4,4);
  Splay.ar(sig,0.25,0.25);
};
~pulse.play;
);" ], [ 279.6680838, 'kof', "(
~pulse.ar(2);
~pulse.quant=2;
~pulse.fadeTime=0.2;
~pulse={
  //         |       |       |       |       |  
  var pat = [1,0,0,0,1,0,0,0,1,0,0,0,1,0,0,0].rotate(3);
  var imp = PulseDivider.kr(~tick.kr,1,~counter.kr);
  var hit = Select.kr(PulseCount.kr(imp)/[1,2,3,4]%pat.size,pat);
  var env = EnvGen.ar(Env([0.001,1,1,0.001],[0.002,0.125,0.002],[3,1,-3],curve:'exp'),imp * hit);
  var sig = Pulse.ar(50) * LFSaw.ar(500*[1,2,10,20]);
  sig = LPF.ar(sig,800+LFNoise2.ar(1/8/fib(4)).range(0,10000) );
  sig = sig * env;
  sig = CombN.ar(sig,1/4,1/4,4);
  Splay.ar(sig,0.25,0.25);
};
~pulse.play;
);" ], [ 274.0080759, 'kof', "(
~pulse.ar(2);
~pulse.quant=2;
~pulse.fadeTime=0.2;
~pulse={
  //         |       |       |       |       |  
  var pat = [1,0,0,0,1,0,0,0,1,0,0,0,1,0,0,0].rotate(3);
  var imp = PulseDivider.kr(~tick.kr,2,~counter.kr);
  var hit = Select.kr(PulseCount.kr(imp)/[1,2,3,4]%pat.size,pat);
  var env = EnvGen.ar(Env([0.001,1,1,0.001],[0.002,0.125,0.002],[3,1,-3],curve:'exp'),imp * hit);
  var sig = Pulse.ar(50) * LFSaw.ar(500*[1,2,10,20]);
  sig = LPF.ar(sig,800+LFNoise2.ar(1/8/fib(4)).range(0,10000) );
  sig = sig * env;
  sig = CombN.ar(sig,1/4,1/4,4);
  Splay.ar(sig,0.25,0.25);
};
~pulse.play;
);" ], [ 272.4560418, 'joach', "~jdrum[4] = \\filter -> {|in| CombC.ar(in, 0.25, 0.125, 0.5) };" ], [ 260.555024, 'kof', "(
~pulse.ar(2);
~pulse.quant=2;
~pulse.fadeTime=0.2;
~pulse={
  //         |       |       |       |       |  
  var pat = [1,0,0,0,1,0,0,0,1,0,0,0,1,0,0,0].rotate(3);
  var imp = PulseDivider.kr(~tick.kr,2,~counter.kr);
  var hit = Select.kr(PulseCount.kr(imp)/[1,2,3,4]%pat.size,pat);
  var env = EnvGen.ar(Env([0.001,1,1,0.001],[0.002,0.125,0.002],[3,1,-3],curve:'exp'),imp * hit);
  var sig = Pulse.ar(40) * LFSaw.ar(500*[1,2,10,20]);
  sig = LPF.ar(sig,800+LFNoise2.ar(1/8/fib(4)).range(0,10000) );
  sig = sig * env;
  sig = CombN.ar(sig,1/4,1/4,4);
  Splay.ar(sig,0.25,0.25);
};
~pulse.play;
);" ], [ 259.7879913, 'joach', "(
~jdrum[2] = \\set -> QuantEnv(\\fplus, 1)
.phase(1, [0,170,0], [0.005, 0.15], [8,-2], 0, 8)
.phase(2, [0,[100,2000],0], [0.005, 0.15], [8,-2], 0, 1)
.phase(2, [0,8000,0], [0.005, 0.15], [8,-8], 0, 1)
.play([1,2]);
)" ], [ 256.295955, 'joach', "(
~jdrum[2] = \\set -> QuantEnv(\\fplus, 1)
.phase(1, [0,170,0], [0.005, 0.15], [8,-2], 0, 8)
.phase(2, [0,[100,200],0], [0.005, 0.15], [8,-2], 0, 1)
.phase(2, [0,8000,0], [0.005, 0.15], [8,-8], 0, 1)
.play([1,2]);
)" ], [ 241.9858998, 'joach', "~jdrum[4] = \\filter -> {|in| CombC.ar(in, 0.25, 0.125, 2) };" ], [ 239.1518951, 'kof', "(
~pulse.ar(2);
~pulse.quant=2;
~pulse.fadeTime=0.2;
~pulse={
  //         |       |       |       |       |  
  var pat = [1,0,0,0,1,0,0,0,1,0,0,0,1,0,0,0].rotate(3);
  var imp = PulseDivider.kr(~tick.kr,2,~counter.kr);
  var hit = Select.kr(PulseCount.kr(imp)/[1,2,3,4]%pat.size,pat);
  var env = EnvGen.ar(Env([0.001,1,1,0.001],[0.002,0.125,0.002],[3,1,-3],curve:'exp'),imp * hit);
  var sig = Pulse.ar(40) * LFSaw.ar(500*[1,2,10,20]);
  sig = LPF.ar(sig,800+LFNoise2.ar(1/8/fib(4)).range(0,10000) );
  sig = sig * env;
  Splay.ar(sig,0.25,0.25);
};
~pulse.play;
);" ], [ 233.8118876, 'kof', "(
~pulse.ar(2);
~pulse.quant=2;
~pulse.fadeTime=0.2;
~pulse={
  //         |       |       |       |       |  
  var pat = [1,0,0,0,1,0,0,0,1,0,0,0,1,0,0,0].rotate(3);
  var imp = PulseDivider.kr(~tick.kr,1,~counter.kr);
  var hit = Select.kr(PulseCount.kr(imp)/[1,2,3,4]%pat.size,pat);
  var env = EnvGen.ar(Env([0.001,1,1,0.001],[0.002,0.125,0.002],[3,1,-3],curve:'exp'),imp * hit);
  var sig = Pulse.ar(40) * LFSaw.ar(500*[1,2,10,20]);
  sig = LPF.ar(sig,800+LFNoise2.ar(1/8/fib(4)).range(0,10000) );
  sig = sig * env;
  Splay.ar(sig,0.25,0.25);
};
~pulse.play;
);" ], [ 225.3618758, 'kof', "(
~pulse.ar(2);
~pulse.quant=2;
~pulse.fadeTime=0.2;
~pulse={
  //         |       |       |       |       |  
  var pat = [1,0,0,0,1,0,0,0,1,0,0,0,1,0,0,0].rotate(3);
  var imp = PulseDivider.kr(~tick.kr,2,~counter.kr);
  var hit = Select.kr(PulseCount.kr(imp)/[1,2,3,4]%pat.size,pat);
  var env = EnvGen.ar(Env([0.001,1,1,0.001],[0.002,0.25,0.002],[3,1,-3],curve:'exp'),imp * hit);
  var sig = Pulse.ar(40) * LFSaw.ar(500*[1,2,10,20]);
  sig = LPF.ar(sig,800+LFNoise2.ar(1/8/fib(4)).range(0,10000) );
  sig = sig * env;
  Splay.ar(sig,0.25,0.25);
};
~pulse.play;
);" ], [ 224.5138451, 'joach', "~jdrum[4] = \\filter -> {|in| CombC.ar(in, 0.5, 0.125, 2) };" ], [ 219.7348346, 'kof', "(
~pulse.ar(2);
~pulse.quant=2;
~pulse.fadeTime=0.2;
~pulse={
  //         |       |       |       |       |  
  var pat = [1,0,0,0,1,0,0,0,1,0,0,0,1,0,0,0].rotate(3);
  var imp = PulseDivider.kr(~tick.kr,2,~counter.kr);
  var hit = Select.kr(PulseCount.kr(imp)/[1,2,3,4]%pat.size,pat);
  var env = EnvGen.ar(Env([0.001,1,1,0.001],[0.002,0.25,0.002],[3,1,-3],curve:'exp'),imp * hit);
  var sig = Pulse.ar(40) * LFSaw.ar(500*[1,2,10,20]);
  sig = LPF.ar(sig,800+LFNoise2.ar(1/8/fib(4)).range(0,10000) );
  sig = sig * env;
  Splay.ar(sig,0.25,0.5);
};
~pulse.play;
);" ], [ 212.0637925, 'joach', "~jdrum[3] = \\set -> Pbind(\\args, [\\freq], \\octave, 2, \\degree, Pseq([3,4,3,7], inf), \\dur, 8);" ], [ 195.9067372, 'joach', "~jdrum[3] = \\set -> Pbind(\\args, [\\freq], \\octave, 3, \\degree, Pseq([3,4,3,7], inf), \\dur, 8);" ], [ 179.4137122, 'kof', "(
~pulse.ar(2);
~pulse.quant=2;
~pulse.fadeTime=0.2;
~pulse={
  //         |       |       |       |       |  
  var pat = [1,0,0,0,1,0,0,0,1,0,0,0,1,0,0,0].rotate(3);
  var imp = PulseDivider.kr(~tick.kr,2,~counter.kr);
  var hit = Select.kr(PulseCount.kr(imp)/[1,2,3,4]%pat.size,pat);
  var env = EnvGen.ar(Env([0.001,1,1,0.001],[0.002,0.25,0.002],[3,1,-3],curve:'exp'),imp * hit);
  var sig = Pulse.ar(40) * LFSaw.ar(500*[1,2,10,20]);
  sig = LPF.ar(sig,800);
  sig = sig * env;
  Splay.ar(sig,0.25,0.5);
};
~pulse.play;
);" ], [ 171.6337013, 'kof', "(
~pulse.ar(2);
~pulse.quant=2;
~pulse.fadeTime=0.2;
~pulse={
  //         |       |       |       |       |  
  var pat = [1,0,0,0,1,0,0,0,1,0,0,0,1,0,0,0].rotate(1);
  var imp = PulseDivider.kr(~tick.kr,4,~counter.kr);
  var hit = Select.kr(PulseCount.kr(imp)/[1,2,3,4]%pat.size,pat);
  var env = EnvGen.ar(Env([0.001,1,1,0.001],[0.002,0.25,0.002],[3,1,-3],curve:'exp'),imp * hit);
  var sig = Pulse.ar(40) * LFSaw.ar(500*[1,2,10,20]);
  sig = LPF.ar(sig,800);
  sig = sig * env;
  Splay.ar(sig,0.25,0.5);
};
~pulse.play;
);" ], [ 167.7236959, 'kof', "(
~pulse.ar(2);
~pulse.quant=2;
~pulse.fadeTime=0.2;
~pulse={
  //         |       |       |       |       |  
  var pat = [1,0,0,0,1,0,0,0,1,0,0,0,1,0,0,0].rotate(1);
  var imp = PulseDivider.kr(~tick.kr,4,~counter.kr);
  var hit = Select.kr(PulseCount.kr(imp)/[1,2,3,4]%pat.size,pat);
  var env = EnvGen.ar(Env([0.001,1,1,0.001],[0.002,0.25,0.002],[3,1,-3],curve:'exp'),imp * hit);
  var sig = Pulse.ar(40) * LFSaw.ar(500*[1,2,10,20]);
  sig = LPF.ar(sig,800);
  sig = sig * env;
  Splay.ar(sig,0.75,0.5);
};
~pulse.play;
);" ], [ 163.476656, 'joach', "~jdrum[3] = \\set -> Pbind(\\args, [\\freq], \\octave, 2, \\degree, Pseq([3,4,3,7], inf), \\dur, 8);" ], [ 155.8666454, 'kof', "(
~pulse.ar(2);
~pulse.quant=2;
~pulse.fadeTime=0.2;
~pulse={
  //         |       |       |       |       |  
  var pat = [1,0,0,0,1,0,0,0,1,0,0,0,1,0,0,0].rotate(1);
  var imp = PulseDivider.kr(~tick.kr,4,~counter.kr);
  var hit = Select.kr(PulseCount.kr(imp)%pat.size,pat);
  var env = EnvGen.ar(Env([0.001,1,1,0.001],[0.002,0.25,0.002],[3,1,-3],curve:'exp'),imp * hit);
  var sig = Pulse.ar(40) * LFSaw.ar(500);
  sig = LPF.ar(sig,800);
  sig = sig * env;
  Splay.ar(sig,0.75,0.5);
};
~pulse.play;
);" ], [ 154.6566437, 'kof', "(
~pulse.ar(2);
~pulse.quant=2;
~pulse.fadeTime=0.2;
~pulse={
  //         |       |       |       |       |  
  var pat = [1,0,0,0,1,0,0,0,1,0,0,0,1,0,0,0].rotate(1);
  var imp = PulseDivider.kr(~tick.kr,4,~counter.kr);
  var hit = Select.kr(PulseCount.kr(imp)%pat.size,pat);
  var env = EnvGen.ar(Env([0.001,1,1,0.001],[0.002,0.25,0.002],[3,1,-3],curve:'exp'),imp * hit);
  var sig = Pulse.ar(40) * LFSaw.ar(5000);
  sig = LPF.ar(sig,800);
  sig = sig * env;
  Splay.ar(sig,0.75,0.5);
};
~pulse.play;
);" ], [ 151.1956388, 'kof', "(
~pulse.ar(2);
~pulse.quant=2;
~pulse.fadeTime=0.2;
~pulse={
  //         |       |       |       |       |  
  var pat = [1,0,0,0,1,0,0,0,1,0,0,0,1,0,0,0].rotate(1);
  var imp = PulseDivider.kr(~tick.kr,4,~counter.kr);
  var hit = Select.kr(PulseCount.kr(imp)%pat.size,pat);
  var env = EnvGen.ar(Env([0.001,1,1,0.001],[0.002,0.25,0.002],[3,1,-3],curve:'exp'),imp * hit);
  var sig = Pulse.ar(40) * LFSaw.ar(500);
  sig = LPF.ar(sig,800);
  sig = sig * env;
  Splay.ar(sig,0.75,0.5);
};
~pulse.play;
);" ], [ 148.5856351, 'kof', "(
~pulse.ar(2);
~pulse.quant=2;
~pulse.fadeTime=0.2;
~pulse={
  //         |       |       |       |       |  
  var pat = [1,0,0,0,1,0,0,0,1,0,0,0,1,0,0,0].rotate(1);
  var imp = PulseDivider.kr(~tick.kr,4,~counter.kr);
  var hit = Select.kr(PulseCount.kr(imp)%pat.size,pat);
  var env = EnvGen.ar(Env([0.001,1,1,0.001],[0.002,0.25,0.002],[3,1,-3],curve:'exp'),imp * hit);
  var sig = Pulse.ar(40) * LFSaw.ar(50);
  sig = LPF.ar(sig,800);
  sig = sig * env;
  Splay.ar(sig,0.75,0.5);
};
~pulse.play;
);" ], [ 147.5286048, 'joach', "(
~jdrum[1] = \\set -> QuantEnv(\\amp, 1)
.phase(1, [0.2,1,0.2], [0.05, 0.95], [2,-2], 0, 1)
.phase(2, [0.2,1,0.2], [0.15, 0.85], [2,-2], 0, 1)
.play([1,2]);
)" ], [ 143.5645951, 'kof', "(
~pulse.ar(2);
~pulse.quant=2;
~pulse.fadeTime=0.2;
~pulse={
  //         |       |       |       |       |  
  var pat = [1,0,0,0,1,0,0,0,1,0,0,0,1,0,0,0].rotate(1);
  var imp = PulseDivider.kr(~tick.kr,4,~counter.kr);
  var hit = Select.kr(PulseCount.kr(imp)%pat.size,pat);
  var env = EnvGen.ar(Env([0.001,1,1,0.001],[0.002,0.15,0.002],[3,1,-3],curve:'exp'),imp * hit);
  var sig = Pulse.ar(40) * LFSaw.ar(50);
  sig = LPF.ar(sig,800);
  sig = sig * env;
  Splay.ar(sig,0.75,0.5);
};
~pulse.play;
);" ], [ 139.9645901, 'kof', "(
~pulse.ar(2);
~pulse.quant=2;
~pulse.fadeTime=0.2;
~pulse={
  //         |       |       |       |       |  
  var pat = [1,0,0,0,1,0,0,0,1,0,0,0,1,0,0,0].rotate(1);
  var imp = PulseDivider.kr(~tick.kr,4,~counter.kr);
  var hit = Select.kr(PulseCount.kr(imp)%pat.size,pat);
  var env = EnvGen.ar(Env([0.001,1,1,0.001],[0.002,0.05,0.002],[3,1,-3],curve:'exp'),imp * hit);
  var sig = Pulse.ar(40) * LFSaw.ar(50);
  sig = LPF.ar(sig,800);
  sig = sig * env;
  Splay.ar(sig,0.75,0.5);
};
~pulse.play;
);" ], [ 134.7145827, 'kof', "(
~pulse.ar(2);
~pulse.quant=2;
~pulse.fadeTime=0.2;
~pulse={
  //         |       |       |       |       |  
  var pat = [1,0,0,0,1,0,0,0,1,0,0,0,1,0,0,0].rotate(1);
  var imp = PulseDivider.kr(~tick.kr,4,~counter.kr);
  var hit = Select.kr(PulseCount.kr(imp)%pat.size,pat);
  var env = EnvGen.ar(Env([0.001,1,1,0.001],[0.002,0.05,0.002],[3,1,-3],curve:'exp'),imp * hit);
  var sig = Pulse.ar(1) * LFSaw.ar(50);
  sig = LPF.ar(sig,800);
  sig = sig * env;
  Splay.ar(sig,0.75,0.5);
};
~pulse.play;
);" ], [ 115.6455254, 'joach', "(
~jdrum[2] = \\set -> QuantEnv(\\fplus, 1)
.phase(1, [0,170,0], [0.005, 0.15], [8,-2], 0, 8)
.phase(2, [0,[100,200],0], [0.005, 0.15], [8,-2], 0, 1)
.phase(2, [0,800,0], [0.005, 0.15], [8,-8], 0, 1)
.play([1,2]);
)" ], [ 114.8335219, 'kof', "(
~pulse.ar(2);
~pulse.quant=2;
~pulse.fadeTime=0.2;
~pulse={
  //         |       |       |       |       |  
  var pat = [1,0,0,0,1,0,0,0,1,0,0,0,1,0,0,0].rotate(1);
  var imp = PulseDivider.kr(~tick.kr,4,~counter.kr);
  var hit = Select.kr(PulseCount.kr(imp)%pat.size,pat);
  var env = EnvGen.ar(Env([0.001,1,1,0.001],[0.002,0.05,0.002],[3,1,-3],curve:'exp'),imp * hit);
  var sig = Pulse.ar(1) * LFSaw.ar(50);
  sig = sig * env;
  Splay.ar(sig,0.75,0.5);
};
~pulse.play;
);" ], [ 99.783500899999, 'kof', "(
~pulse.ar(2);
~pulse.quant=2;
~pulse.fadeTime=0.2;
~pulse={
  //         |       |       |       |       |  
  var pat = [1,0,0,0,1,0,0,0,1,0,0,0,1,0,0,0].rotate(1);
  var imp = PulseDivider.kr(~tick.kr,4,~counter.kr);
  var hit = Select.kr(PulseCount.kr(imp)%pat.size,pat);
  var env = EnvGen.ar(Env([0.001,1,1,0.001],[0.002,0.05,0.002],[3,1,-3],curve:'exp'),imp * hit);
  var sig = Pulse.ar(1);
  sig = sig * env;
  Splay.ar(sig,0.75,0.5);
};
~pulse.play;
);" ], [ 98.493466099999, 'joach', "~jdrum.play(vol: 0.4, fadeTime: 8);" ], [ 94.5434606, 'kof', "(
~pulse.ar(2);
~pulse.quant=2;
~pulse.fadeTime=0.2;
~pulse={
  //         |       |       |       |       |  
  var pat = [1,0,0,0,1,0,0,0,1,0,0,0,1,0,0,0].rotate(1);
  var imp = PulseDivider.kr(~tick.kr,4,~counter.kr);
  var hit = Select.kr(PulseCount.kr(imp)%pat.size,pat);
  var env = EnvGen.ar(Env([0.001,1,1,0.001],[0.002,0.05,0.002],[3,1,-3],curve:'exp'),imp * hit);
  var sig = Pulse.ar(50);
  sig = sig * env;
  Splay.ar(sig,0.75,0.5);
};
~pulse.play;
);" ], [ 89.5634536, 'kof', "(
~pulse.ar(2);
~pulse.quant=2;
~pulse.fadeTime=0.2;
~pulse={
  //         |       |       |       |       |  
  var pat = [1,0,0,0,1,0,0,0,1,0,0,0,1,0,0,0].rotate(1);
  var imp = PulseDivider.kr(~tick.kr,1,~counter.kr);
  var hit = Select.kr(PulseCount.kr(imp)%pat.size,pat);
  var env = EnvGen.ar(Env([0.001,1,1,0.001],[0.002,0.05,0.002],[3,1,-3],curve:'exp'),imp * hit);
  var sig = Pulse.ar(50);
  sig = sig * env;
  Splay.ar(sig,0.75,0.5);
};
~pulse.play;
);" ], [ 82.881411799999, 'joach', "(
~jdrum[2] = \\set -> QuantEnv(\\fplus, 1)
.phase(1, [0,170,0], [0.005, 0.15], [8,-2], 0, 8)
.phase(2, [0,[100,200],0], [0.005, 0.15], [8,-2], 0, 1)
.play([1,2]);
)" ], [ 76.1103699, 'joach', "(
~jdrum[2] = \\set -> QuantEnv(\\fplus, 1)
.phase(1, [0,100,0], [0.005, 0.15], [8,-2], 0, 8)
.phase(2, [0,[100,200],0], [0.005, 0.15], [8,-2], 0, 1)
.play([1,2]);
)" ], [ 67.7033254, 'joach', "(
~jdrum[2] = \\set -> QuantEnv(\\fplus, 1)
.phase(1, [0,100,0], [0.005, 0.15], [8,-2], 0, 1)
.phase(2, [0,[100,200],0], [0.005, 0.15], [8,-2], 0, 1)
.play([1,2]);
)" ], [ 64.3172863, 'joach', "(
~jdrum[2] = \\set -> QuantEnv(\\fplus, 1)
.phase(1, [0,100,0], [0.005, 0.15], [8,-2], 0, 1)
.phase(2, [0,[100,200],0], [0.005, 0.15], [8,-2], 0, 1)
.play([1]);
)" ], [ 18.0811877, 'kof', "(
  ~offset = (0..7)/8;

  ~tick.quant = 1;
  ~tick = {Mix(Impulse.kr( ~tempo / 2 , ~offset ))};

  ~counter = {PulseCount.kr(~tick.kr)};
);" ], [ 16.814156499999, 'joach', "(
~jdrum[2] = \\set -> QuantEnv(\\fplus, 1)
.phase(1, [0,100,0], [0.005, 0.15], [8,-2], 0, 1)
.phase(2, [0,1,0], [0.35, 0.65], [2,-2], 0, 1)
.play([1]);
)" ], [ 13.100114299999, 'joach', "(
~jdrum[1] = \\set -> QuantEnv(\\amp, 1)
.phase(1, [0,1,0], [0.05, 0.95], [2,-2], 0, 1)
.phase(2, [0,1,0], [0.15, 0.85], [2,-2], 0, 1)
.play([1,2]);
)" ], [ 9.8280794999991, 'joach', "(
~jdrum[0] = {
var osc = SinOsc.ar(( \\freq.kr(60) + \\fplus.kr(0) ), mul: 1, add: 0);
var noise = BrownNoise.ar(\\noise.kr(0), (1 - \\noise.kr(0)));
var sig = osc * noise;
Pan2.ar( sig * \\amp.kr(0), \\pan.kr(0) );
};
)" ], [ 8.9500470999992, 'joach', "~jdrum.play(vol: 0.2, fadeTime: 8);" ], [ 0, 'joach', "Kolektiv.historyRestart" ], [ 0, 'Kolektiv', "Kolektiv.tempo_(120);" ] ]