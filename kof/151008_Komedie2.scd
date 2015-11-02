List[ [ 1557.323664823, 'kof', "Kolektiv.historySave" ], [ 1392.657140384, 'kof', "~pulse.clear;" ], [ 1389.010225145, 'kof', "~rr.clear;" ], [ 1386.29100795, 'kof', "~hh.clear;" ], [ 1380.930519015, 'kof', "~ssa.clear;" ], [ 1378.936956923, 'kof', "~ss.clear;" ], [ 1376.11559381, 'kof', "(
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
);" ], [ 1357.610381596, 'kof', "(
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
);" ], [ 1347.083315663, 'kof', "~rr.clear;" ], [ 1345.362822228, 'kof', "~pulse.clear;" ], [ 1341.873866741, 'kof', "~ssa.clear;" ], [ 1275.785944925, 'joach', "~jdrum.stop(16);" ], [ 1270.212944599, 'joach', "~jdrum.play(vol: 0.0, fadeTime: 18);" ], [ 1262.353288776, 'joach', "~jSaw.stop(20);" ], [ 1254.496684442, 'joach', "~jdrum.set(\\lpf_freq, 200);" ], [ 1251.695067638, 'joach', "(
~jdrum[5] = \\set -> QuantEnv(\\noise, 8)
.phase(1, [0.2,0.5,0.2], [2.05, 0.95], [2,-2], 0, 1)
.phase(2, [0.2,0.8,0.2], [1.35, 2.65], [2,-2], 0, 1)
.play([1]);
)" ], [ 1248.70672531, 'joach', "(
~jdrum[2] = \\set -> QuantEnv(\\fplus, 2)
.phase(1, [0,100,0], [0.005, 0.15], [8,-2], 0, 8)
.phase(2, [0,[100,1000],0], [0.005, 0.15], [8,-2], 0, 1)
.phase(2, [0,2000,0], [0.005, 0.15], [8,-8], 0, 1)
.play([1,2]);
)" ], [ 1244.902454657, 'joach', "(
~jdrum[1] = \\set -> QuantEnv(\\amp, 2)
.phase(1, [0.2,1,0.2], [0.05, 0.45], [2,-2], 0, 4)
.phase(2, [0.2,1,0.2], [0.15, 0.85], [2,-2], 0, 1)
.phase(3, [0.2,1,0.2], [0.85, 0.15], [2,-2], 0, 1)
.phase(4, [0.2,0,0,0.2], [0.85, 3, 0.15], [\\sin,\\sin], 0, 2)
.play([1,2,1,3, 4]);
)" ], [ 1243.702739608, 'alex', "~v.clear;" ], [ 1241.9594584, 'joach', "(
~jdrum[2] = \\set -> QuantEnv(\\fplus, 1)
.phase(1, [0,100,0], [0.005, 0.15], [8,-2], 0, 8)
.phase(2, [0,[100,1000],0], [0.005, 0.15], [8,-2], 0, 1)
.phase(2, [0,2000,0], [0.005, 0.15], [8,-8], 0, 1)
.play([1,2]);
)" ], [ 1235.854662638, 'alex', "(
~v[0]={
	var sig, env,fenv, penv;

	env=EnvGen.kr(Env([0,1,0],[2,0.01],[\\lin, \\step]),\\trig.tr);
	penv=EnvGen.kr(Env([0.8,0,2],[0.04,0.1],[\\lin,\\welch]),\\trig.tr);

	sig=AudioIn.ar(1)*env;
	sig=sig*env;
};
)" ], [ 1235.842579686, 'joach', "(
~jdrum[1] = \\set -> QuantEnv(\\amp, 1)
.phase(1, [0.2,1,0.2], [0.05, 0.45], [2,-2], 0, 4)
.phase(2, [0.2,1,0.2], [0.15, 0.85], [2,-2], 0, 1)
.phase(3, [0.2,1,0.2], [0.85, 0.15], [2,-2], 0, 1)
.phase(4, [0.2,0,0,0.2], [0.85, 3, 0.15], [\\sin,\\sin], 0, 2)
.play([1,2,1,3, 4]);
)" ], [ 1225.506178277, 'joach', "(
~jdrum[1] = \\set -> QuantEnv(\\amp, 1)
.phase(1, [0.2,1,0.2], [0.05, 0.95], [2,-2], 0, 4)
.phase(2, [0.2,1,0.2], [0.15, 0.85], [2,-2], 0, 1)
.phase(3, [0.2,1,0.2], [0.85, 0.15], [2,-2], 0, 1)
.phase(4, [0.2,0,0,0.2], [0.85, 3, 0.15], [\\sin,\\sin], 0, 2)
.play([1,2,1,3, 4]);
)" ], [ 1223.34284796, 'alex', "(
~v[0]={
	var sig, env,fenv, penv;

	env=EnvGen.kr(Env([0,1,0],[3,0.01],[\\lin, \\step]),\\trig.tr);
	penv=EnvGen.kr(Env([0.8,0,2],[0.04,0.1],[\\lin,\\welch]),\\trig.tr);

	sig=AudioIn.ar(1)*env;
	sig=sig*env;
};
)" ], [ 1216.912833388, 'joach', "(
~jdrum[2] = \\set -> QuantEnv(\\fplus, 2)
.phase(1, [0,100,0], [0.005, 0.15], [8,-2], 0, 8)
.phase(2, [0,[100,1000],0], [0.005, 0.15], [8,-2], 0, 1)
.phase(2, [0,2000,0], [0.005, 0.15], [8,-8], 0, 1)
.play([1,2]);
)" ], [ 1211.479616466, 'kof', "(
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
);" ], [ 1210.075512087, 'joach', "(
~jdrum[2] = \\set -> QuantEnv(\\fplus, 1)
.phase(1, [0,100,0], [0.005, 0.15], [8,-2], 0, 8)
.phase(2, [0,[100,1000],0], [0.005, 0.15], [8,-2], 0, 1)
.phase(2, [0,2000,0], [0.005, 0.15], [8,-8], 0, 1)
.play([1,2]);
)" ], [ 1209.291565003, 'kof', "(
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
);" ], [ 1208.14544203, 'alex', "~v[1]=\\set->Pbind(\\args, [\\trig], \\dur, 8, \\trig, 1);" ], [ 1204.165967312, 'joach', "(
~jdrum[2] = \\set -> QuantEnv(\\fplus, 0.5)
.phase(1, [0,100,0], [0.005, 0.15], [8,-2], 0, 8)
.phase(2, [0,[100,1000],0], [0.005, 0.15], [8,-2], 0, 1)
.phase(2, [0,2000,0], [0.005, 0.15], [8,-8], 0, 1)
.play([1,2]);
)" ], [ 1202.784220307, 'alex', "~v[31]=\\filter-> {arg in; Limiter.ar(GVerb.ar(in,roomsize:40,revtime:8,add:in),0.2)};" ], [ 1198.200056018, 'joach', "(
~jdrum[2] = \\set -> QuantEnv(\\fplus, 0.5)
.phase(1, [0,100,0], [0.005, 0.15], [8,-2], 0, 8)
.phase(2, [0,[100,1000],0], [0.005, 0.15], [8,-2], 0, 1)
.phase(2, [0,8000,0], [0.005, 0.15], [8,-8], 0, 1)
.play([1,2]);
)" ], [ 1196.294930522, 'alex', "(
~v[0]={
	var sig, env,fenv, penv;

	env=EnvGen.kr(Env([0,1,0],[1,0.01],[\\lin, \\step]),\\trig.tr);
	penv=EnvGen.kr(Env([0.8,0,2],[0.04,0.1],[\\lin,\\welch]),\\trig.tr);

	sig=AudioIn.ar(1)*env;
	sig=sig*env;
};
)" ], [ 1196.22845501, 'kof', "(
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
);" ], [ 1192.255580932, 'joach', "~jdrum.play(vol: 0.9, fadeTime: 8);" ], [ 1189.44046135, 'alex', "~v[1]=\\set->Pbind(\\args, [\\trig], \\dur, 8, \\trig, 1);" ], [ 1182.664563712, 'kof', "(
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
);" ], [ 1182.093165041, 'joach', "(
~jSaw[6] = \\set -> QuantEnv(\\flpus, 4)
.phase(1, [0,1000,0], [0.005, 0.25], [8,-2], 0, 16)
.phase(2, [0,800,0], [0.035, 0.12], [8,-2], 0, 8)
.play([1,2]);
)" ], [ 1179.916457432, 'alex', "~v[32]=\\filter->{arg in; LPF.ar(in,\\lpf.kr(800))};" ], [ 1173.862056675, 'joach', "(
~jSaw[1] = \\set -> QuantEnv(\\amp, 8)
.phase(1, [0.2,1,0.5], [0.05, 7.95], [8,-2], 0, 3)
.phase(2, [0.5,1,0.2], [3.35, 6.65], [8,-2], 0, 1)
.play([1,2]);
)" ], [ 1173.019955355, 'kof', "(
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
);" ], [ 1166.583749029, 'joach', "(
~jSaw[1] = \\set -> QuantEnv(\\amp, 1)
.phase(1, [0.2,1,0.5], [0.05, 7.95], [8,-2], 0, 3)
.phase(2, [0.5,1,0.2], [3.35, 6.65], [8,-2], 0, 1)
.play([1,2]);
)" ], [ 1162.366688069, 'kof', "(
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
);" ], [ 1161.749713913, 'joach', "~jSaw.play(vol: 0.8, fadeTime: 12);" ], [ 1158.512310149, 'kof', "(
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
);" ], [ 1156.759004441, 'joach', "~jSaw[7] = \\set -> Pbind(\\args, [\\freq], \\octave, 3, \\degree, Pseq([3,4,3,7], inf), \\dur, 16);" ], [ 1149.764327152, 'kof', "(
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
);" ], [ 1142.940565164, 'joach', "~jSaw[3] = \\filter -> {|in| GVerb.ar(in, \\gverb_size.kr(60), \\gverb_time.kr(14), 0.9, mul:\\mulgverb.kr(1)) };" ], [ 1137.936457402, 'joach', "~jSaw[3] = \\filter -> {|in| GVerb.ar(in, \\gverb_size.kr(12), \\gverb_time.kr(14), 0.9, mul:\\mulgverb.kr(1)) };" ], [ 1128.890346994, 'joach', "(
~jSaw[5] = \\set -> QuantEnv(\\noise, 8)
.phase(1, [0.2,1,0.2], [1.05, 7.95], [2,-2], 0, 1)
.phase(2, [0,1,0], [3.35, 4.65], [2,-2], 0, 1)
.play([1,2]);
)" ], [ 1127.482186127, 'joach', "(
~jSaw[6] = \\set -> QuantEnv(\\flpus, 1)
.phase(1, [0,100,0], [0.005, 0.25], [8,-2], 0, 16)
.phase(2, [0,800,0], [0.035, 0.12], [8,-2], 0, 8)
.play([1,2]);
)" ], [ 1121.15432147, 'joach', "~jSaw.play(vol: 0.5, fadeTime: 12);" ], [ 1114.446841574, 'kof', "(
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
);" ], [ 1109.223972424, 'joach', "~jSaw[7] = \\set -> Pbind(\\args, [\\freq], \\octave, 7, \\degree, Pseq([3,4,3,7], inf), \\dur, 16);" ], [ 1108.209952992, 'kof', "(
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
);" ], [ 1103.367075958, 'kof', "(
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
);" ], [ 1102.164509155, 'kof', "(
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
);" ], [ 1098.414143797, 'kof', "(
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
);" ], [ 1096.415760751, 'alex', "~v[32]=\\filter->{arg in; LPF.ar(in,\\lpf.kr(400))};" ], [ 1089.894256167, 'alex', "~v[32]=\\filter->{arg in; LPF.ar(in,\\lpf.kr(200))};" ], [ 1088.441714697, 'kof', "(
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
);" ], [ 1087.913343469, 'joach', "~jdrum[4] = \\filter -> {|in| CombC.ar(in, 0.25, 0.125, 0.5) };" ], [ 1079.548570215, 'alex', "(
~v[0]={
	var sig, env,fenv, penv;

	env=EnvGen.kr(Env([0,1,0],[0.2,0.01],[\\lin, \\step]),\\trig.tr);
	penv=EnvGen.kr(Env([0.8,0,2],[0.04,0.1],[\\lin,\\welch]),\\trig.tr);

	sig=AudioIn.ar(1)*env;
	sig=sig*env;
};
)" ], [ 1077.702697195, 'joach', "(
~jdrum[5] = \\set -> QuantEnv(\\noise, 4)
.phase(1, [0.2,0.5,0.2], [2.05, 0.95], [2,-2], 0, 1)
.phase(2, [0.2,0.8,0.2], [1.35, 2.65], [2,-2], 0, 1)
.play([1]);
)" ], [ 1076.214590194, 'joach', "(
~jdrum[5] = \\set -> QuantEnv(\\noise, 4)
.phase(1, [0.2,0.5,0.2], [2.05, 0.95], [2,-2], 0, 1)
.phase(2, [0.2,0.8,0.2], [5.35, 2.65], [2,-2], 0, 1)
.play([1]);
)" ], [ 1073.334495577, 'joach', "(
~jdrum[5] = \\set -> QuantEnv(\\noise, 4)
.phase(1, [0.2,0.5,0.2], [7.05, 0.95], [2,-2], 0, 1)
.phase(2, [0.2,0.8,0.2], [5.35, 2.65], [2,-2], 0, 1)
.play([1]);
)" ], [ 1073.052711224, 'alex', "~v[1]=\\set->Pbind(\\args, [\\trig], \\dur, 2, \\trig, 1);" ], [ 1065.440263549, 'alex', "(
~v[0]={
	var sig, env,fenv, penv;

	env=EnvGen.kr(Env([0,1,0],[0.4,0.01],[\\lin, \\step]),\\trig.tr);
	penv=EnvGen.kr(Env([0.8,0,2],[0.04,0.1],[\\lin,\\welch]),\\trig.tr);

	sig=AudioIn.ar(1)*env;
	sig=sig*env;
};
)" ], [ 1063.33091767, 'alex', "(
~v[0]={
	var sig, env,fenv, penv;

	env=EnvGen.kr(Env([0,1,0],[1,0.01],[\\lin, \\step]),\\trig.tr);
	penv=EnvGen.kr(Env([0.8,0,2],[0.04,0.1],[\\lin,\\welch]),\\trig.tr);

	sig=AudioIn.ar(1)*env;
	sig=sig*env;
};
)" ], [ 1062.078908102, 'joach', "~jdrum.set(\\lpf_freq, 8200);" ], [ 1016.523738285, 'alex', "(
~v[0]={
	var sig, env,fenv, penv;

	env=EnvGen.kr(Env([0,1,0],[1,0.01],[\\lin, \\step]),\\trig.tr);
	penv=EnvGen.kr(Env([0.8,0,2],[0.04,0.1],[\\lin,\\welch]),\\trig.tr);

	sig=AudioIn.ar(1)*env;
	sig=sig*env;
};
)" ], [ 1004.569578081, 'kof', "(
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
);" ], [ 1002.42689497, 'joach', "~jdrum[3] = \\set -> Pbind(\\args, [\\freq], \\octave, 4, \\degree, Pseq([3,4,3,7], inf), \\dur, 32);" ], [ 1001.158142908, 'alex', "(
~v[0]={
	var sig, env,fenv, penv;

	env=EnvGen.kr(Env([0,1,0],[4,0.01],[\\lin, \\step]),\\trig.tr);
	penv=EnvGen.kr(Env([0.8,0,2],[0.04,0.1],[\\lin,\\welch]),\\trig.tr);

	sig=AudioIn.ar(1)*env;
	sig=sig*env;
};
)" ], [ 999.157582973, 'joach', "~jdrum[3] = \\set -> Pbind(\\args, [\\freq], \\octave, 5, \\degree, Pseq([3,4,3,7], inf), \\dur, 32);" ], [ 992.051914888, 'alex', "~v.play(vol:0.8, fadeTime:6);" ], [ 991.858374393, 'joach', "~jSaw[7] = \\set -> Pbind(\\args, [\\freq], \\octave, 3, \\degree, Pseq([3,4,3,7], inf), \\dur, 16);" ], [ 981.832984424, 'joach', "(
~jSaw[0] = {
	var osc = SinOsc.ar(( \\freq.kr(90) + \\fplus.kr(0) ), mul: 1, add: 0);
	var noise = BrownNoise.ar(\\noise.kr(0), (1 - \\noise.kr(0)));
	var sig = osc * noise;
	Pan2.ar( sig * \\amp.kr(0), \\pan.kr(0) );
};
)" ], [ 978.873955309, 'alex', "~v.play(vol:0.6, fadeTime:6);" ], [ 966.963402065, 'joach', "~jSaw.play(vol: 0.2, fadeTime: 12);" ], [ 965.764721718, 'alex', "~v.play(vol:0.2, fadeTime:6);" ], [ 960.879457638, 'alex', "~v[31]=\\filter-> {arg in; Limiter.ar(GVerb.ar(in,roomsize:40,revtime:8,add:in),0.2)};" ], [ 958.468541434, 'alex', "~v[2]=\\set->Pbind(\\args, [\\freq], \\dur, 12, \\freq, Pseq([250,450,350,440,220,550],inf));" ], [ 957.599819229, 'alex', "~v[1]=\\set->Pbind(\\args, [\\trig], \\dur, 6, \\trig, 1);" ], [ 955.171622862, 'alex', "(
~v[0]={
	var sig, env,fenv, penv;

	env=EnvGen.kr(Env([0,1,0],[1,0.01],[\\lin, \\step]),\\trig.tr);
	penv=EnvGen.kr(Env([0.8,0,2],[0.04,0.1],[\\lin,\\welch]),\\trig.tr);

	sig=AudioIn.ar(1)*env;
	sig=sig*env;
};
)" ], [ 939.260074259, 'joach', "~jSaw.play(vol: 0.7, fadeTime: 12);" ], [ 938.898909443, 'alex', "(
~v[0]={
	var sig, env,fenv, penv;

	env=EnvGen.kr(Env([0,1,0],[4,0.01],[\\lin, \\step]),\\trig.tr);
	penv=EnvGen.kr(Env([0.8,0,2],[0.04,0.1],[\\lin,\\welch]),\\trig.tr);

	sig=AudioIn.ar(1)*env;
	sig=sig*env;
};
)" ], [ 936.347997533, 'joach', "(
~jSaw[6] = \\set -> QuantEnv(\\flpus, 1)
.phase(1, [0,100,0], [0.005, 0.25], [8,-2], 0, 16)
.phase(2, [0,800,0], [0.035, 0.12], [8,-2], 0, 8)
.play([1,2]);
)" ], [ 933.114120649, 'joach', "(
~jSaw[4] = \\set -> QuantEnv(\\mulgverb, 2)
.phase(1, [0,1,0], [3.05, 8.95], [6,-2], 0, 1)
.phase(2, [0,1,0.2,0.4,0], [0.35, 5.65], [\\sin,-2], 6, 1)
.play([1,2]);
)" ], [ 931.867238399, 'joach', "~jSaw[3] = \\filter -> {|in| GVerb.ar(in, \\gverb_size.kr(12), \\gverb_time.kr(4), 0.9, mul:\\mulgverb.kr(1)) };" ], [ 930.335372279, 'joach', "~jSaw.set(\\lpf_freq, 1400);" ], [ 929.908193836, 'joach', "~jSaw[2] = \\filter -> {|in| LPF.ar(in, \\lpf_freq.kr(800,28)) };" ], [ 928.538506501, 'kof', "(
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
);" ], [ 927.62353227, 'joach', "(
~jSaw[1] = \\set -> QuantEnv(\\amp, 1)
.phase(1, [0.2,1,0.2], [0.05, 7.95], [8,-2], 0, 3)
.phase(2, [0.5,1,0.2], [3.35, 6.65], [8,-2], 0, 1)
.play([1,2]);
)" ], [ 926.773738953, 'joach', "(
~jSaw[0] = {
	var osc = LFSaw.ar(( \\freq.kr(90) + \\fplus.kr(0) ), mul: 1, add: 0);
	var noise = BrownNoise.ar(\\noise.kr(0), (1 - \\noise.kr(0)));
	var sig = osc * noise;
	Pan2.ar( sig * \\amp.kr(0), \\pan.kr(0) );
};
)" ], [ 924.375526346, 'kof', "(
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
);" ], [ 922.013419921, 'kof', "(
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
);" ], [ 920.413278196, 'joach', "~jdrum.set(\\lpf_freq, 1200);" ], [ 915.035353857, 'kof', "(
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
);" ], [ 913.300886061, 'joach', "(
~jdrum[2] = \\set -> QuantEnv(\\fplus, 0.5)
.phase(1, [0,1000,0], [0.005, 0.15], [8,-2], 0, 8)
.phase(2, [0,[100,1000],0], [0.005, 0.15], [8,-2], 0, 1)
.phase(2, [0,8000,0], [0.005, 0.15], [8,-8], 0, 1)
.play([1,2]);
)" ], [ 906.784318874, 'joach', "(
~jdrum[2] = \\set -> QuantEnv(\\fplus, 1)
.phase(1, [0,1000,0], [0.005, 0.15], [8,-2], 0, 8)
.phase(2, [0,[100,1000],0], [0.005, 0.15], [8,-2], 0, 1)
.phase(2, [0,8000,0], [0.005, 0.15], [8,-8], 0, 1)
.play([1,2]);
)" ], [ 906.490925746, 'kof', "(
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
);" ], [ 899.210100354, 'joach', "(
~jdrum[2] = \\set -> QuantEnv(\\fplus, 0.5)
.phase(1, [0,1000,0], [0.005, 0.15], [8,-2], 0, 8)
.phase(2, [0,[100,1000],0], [0.005, 0.15], [8,-2], 0, 1)
.phase(2, [0,8000,0], [0.005, 0.15], [8,-8], 0, 1)
.play([1,2]);
)" ], [ 895.972691447, 'kof', "(
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
);" ], [ 894.411548201, 'joach', "(
~jdrum[2] = \\set -> QuantEnv(\\fplus, 0.5)
.phase(1, [0,100,0], [0.005, 0.15], [8,-2], 0, 8)
.phase(2, [0,[100,1000],0], [0.005, 0.15], [8,-2], 0, 1)
.phase(2, [0,8000,0], [0.005, 0.15], [8,-8], 0, 1)
.play([1,2]);
)" ], [ 891.737345806, 'joach', "(
~jdrum[2] = \\set -> QuantEnv(\\fplus, 0.5)
.phase(1, [0,800,0], [0.005, 0.15], [8,-2], 0, 8)
.phase(2, [0,[100,1000],0], [0.005, 0.15], [8,-2], 0, 1)
.phase(2, [0,8000,0], [0.005, 0.15], [8,-8], 0, 1)
.play([1,2]);
)" ], [ 885.086468091, 'kof', "(
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
);" ], [ 875.557824984, 'kof', "(
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
);" ], [ 870.068435413, 'joach', "~jdrum.play(vol: 0.4, fadeTime: 8);" ], [ 862.452506911, 'joach', "(
~jdrum[1] = \\set -> QuantEnv(\\amp, 4)
.phase(1, [0.2,1,0.2], [0.05, 0.95], [2,-2], 0, 4)
.phase(2, [0.2,1,0.2], [0.15, 0.85], [2,-2], 0, 1)
.phase(3, [0.2,1,0.2], [0.85, 0.15], [2,-2], 0, 1)
.phase(4, [0.2,0,0,0.2], [0.85, 3, 0.15], [\\sin,\\sin], 0, 2)
.play([1,2,1,3, 4]);
)" ], [ 857.00691813, 'joach', "(
~jdrum[5] = \\set -> QuantEnv(\\noise, 16)
.phase(1, [0.2,0.5,0.2], [7.05, 0.95], [2,-2], 0, 1)
.phase(2, [0.2,0.8,0.2], [5.35, 2.65], [2,-2], 0, 1)
.play([1]);
)" ], [ 849.511440604, 'joach', "(
~jdrum[5] = \\set -> QuantEnv(\\noise, 8)
.phase(1, [0.2,0.5,0.2], [7.05, 0.95], [2,-2], 0, 1)
.phase(2, [0.2,0.8,0.2], [5.35, 2.65], [2,-2], 0, 1)
.play([1]);
)" ], [ 841.210396934, 'joach', "(
~jdrum[5] = \\set -> QuantEnv(\\noise, 8)
.phase(1, [0.2,0.5,0.2], [7.05, 0.95], [2,-2], 0, 1)
.phase(2, [0,0.8,0], [5.35, 2.65], [2,-2], 0, 1)
.play([1]);
)" ], [ 837.091188746, 'joach', "~jdrum.set(\\lpf_freq, 4200);" ], [ 817.331914311, 'joach', "(
~jdrum[2] = \\set -> QuantEnv(\\fplus, 0.5)
.phase(1, [0,800,0], [0.005, 0.15], [8,-2], 0, 8)
.phase(2, [0,[100,2000],0], [0.005, 0.15], [8,-2], 0, 1)
.phase(2, [0,8000,0], [0.005, 0.15], [8,-8], 0, 1)
.play([1,2]);
)" ], [ 800.941092768, 'joach', "~jdrum[3] = \\set -> Pbind(\\args, [\\freq], \\octave, 6, \\degree, Pseq([3,4,3,7], inf), \\dur, 32);" ], [ 786.638347853, 'kof', "(
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
);" ], [ 783.429513478, 'joach', "~jdrum[3] = \\set -> Pbind(\\args, [\\freq], \\octave, 6, \\degree, Pseq([3,4,3,7], inf), \\dur, 8);" ], [ 778.557599632, 'joach', "~jdrum.play(vol: 0.1, fadeTime: 8);" ], [ 772.210573852, 'joach', "~jdrum[4] = nil" ], [ 770.727239325, 'kof', "(
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
);" ], [ 745.712918147, 'kof', "(
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
);" ], [ 737.789837498, 'kof', "(
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
);" ], [ 734.641311845, 'kof', "(
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
);" ], [ 731.238246673, 'kof', "(
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
);" ], [ 730.967930063, 'joach', "(
~jdrum[1] = \\set -> QuantEnv(\\amp, 1)
.phase(1, [0.2,1,0.2], [0.05, 0.95], [2,-2], 0, 4)
.phase(2, [0.2,1,0.2], [0.15, 0.85], [2,-2], 0, 1)
.phase(3, [0.2,1,0.2], [0.85, 0.15], [2,-2], 0, 1)
.phase(4, [0.2,0,0,0.2], [0.85, 3, 0.15], [\\sin,\\sin], 0, 2)
.play([1,2,1,3, 4]);
)" ], [ 729.837340573, 'kof', "(
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
);" ], [ 728.314460223, 'kof', "(
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
);" ], [ 722.011591049, 'kof', "(
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
);" ], [ 718.749732945, 'kof', "(
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
);" ], [ 715.290804595, 'kof', "(
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
);" ], [ 710.616867876, 'kof', "(
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
);" ], [ 707.551713032, 'kof', "(
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
);" ], [ 701.271196788, 'kof', "~pulse.clear;" ], [ 688.18835969, 'kof', "(
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
);" ], [ 686.918277991, 'joach', "(
~jdrum[5] = \\set -> QuantEnv(\\noise, 8)
.phase(1, [0.2,0.5,0.2], [7.05, 0.95], [2,-2], 0, 1)
.phase(2, [0,0.8,0], [5.35, 2.65], [2,-2], 0, 1)
.play([1]);
)" ], [ 686.180000969, 'kof', "(
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
);" ], [ 682.181534088, 'kof', "(
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
);" ], [ 666.442715991, 'kof', "Kolektiv.tempo = 240;" ], [ 658.194843264, 'kof', "Kolektiv.tempo = 8/3;" ], [ 653.722572754, 'kof', "Kolektiv.tempo = 4/3;" ], [ 644.452172771, 'joach', "(
~jdrum[2] = \\set -> QuantEnv(\\fplus, 0.5)
.phase(1, [0,100,0], [0.005, 0.15], [8,-2], 0, 8)
.phase(2, [0,[100,2000],0], [0.005, 0.15], [8,-2], 0, 1)
.phase(2, [0,8000,0], [0.005, 0.15], [8,-8], 0, 1)
.play([1,2]);
)" ], [ 639.343538488, 'joach', "(
~jdrum[2] = \\set -> QuantEnv(\\fplus, 0.5)
.phase(1, [0,1700,0], [0.005, 0.15], [8,-2], 0, 8)
.phase(2, [0,[100,2000],0], [0.005, 0.15], [8,-2], 0, 1)
.phase(2, [0,8000,0], [0.005, 0.15], [8,-8], 0, 1)
.play([1,2]);
)" ], [ 635.447227365, 'kof', "(
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
);" ], [ 627.427564986, 'joach', "(
~jdrum[1] = \\set -> QuantEnv(\\amp, 1)
.phase(1, [0.2,1,0.2], [0.05, 0.95], [2,-2], 0, 4)
.phase(2, [0.2,1,0.2], [0.15, 0.85], [2,-2], 0, 1)
.phase(3, [0.2,1,0.2], [0.85, 0.15], [2,-2], 0, 1)
.play([1,2,1,3]);
)" ], [ 616.581280769, 'joach', "~jdrum.set(\\lpf_freq, 1200);" ], [ 614.875069476, 'kof', "~pulse.clear;" ], [ 610.833301889, 'kof', "(
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
);" ], [ 607.328174345, 'kof', "(
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
);" ], [ 606.898693477, 'joach', "~jdrum[6] = \\filter -> {|in| LPF.ar(in, \\lpf_freq.kr(800,28)) };" ], [ 601.939953425, 'kof', "(
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
);" ], [ 598.621752041, 'kof', "(
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
);" ], [ 593.013766952, 'kof', "(
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
);" ], [ 575.997798071, 'kof', "(
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
);" ], [ 569.963902564, 'kof', "(
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
);" ], [ 568.333313092, 'joach', "~jdrum.play(vol: 0.9, fadeTime: 8);" ], [ 557.959075616, 'joach', "~jdrum.set(\\lpf_freq, 200);" ], [ 555.882242582, 'kof', "(
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
);" ], [ 544.506959431, 'kof', "(
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
);" ], [ 539.390501, 'joach', "(
~jdrum[2] = \\set -> QuantEnv(\\fplus, 1)
.phase(1, [0,1700,0], [0.005, 0.15], [8,-2], 0, 8)
.phase(2, [0,[100,2000],0], [0.005, 0.15], [8,-2], 0, 1)
.phase(2, [0,8000,0], [0.005, 0.15], [8,-8], 0, 1)
.play([1,2]);
)" ], [ 538.935083464, 'kof', "(
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
);" ], [ 530.503263025, 'kof', "(
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
);" ], [ 527.938081515, 'joach', "~jdrum[3] = \\set -> Pbind(\\args, [\\freq], \\octave, 1, \\degree, Pseq([3,4,3,7], inf), \\dur, 8);" ], [ 522.810720254, 'kof', "(
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
);" ], [ 518.819224299, 'kof', "(
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
);" ], [ 516.667237047, 'joach', "(
~jdrum[1] = \\set -> QuantEnv(\\amp, 2)
.phase(1, [0.2,1,0.2], [0.05, 0.95], [2,-2], 0, 4)
.phase(2, [0.2,1,0.2], [0.15, 0.85], [2,-2], 0, 1)
.phase(3, [0.2,1,0.2], [0.85, 0.15], [2,-2], 0, 1)
.play([1,2,1,3]);
)" ], [ 510.347555764, 'kof', "(
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
);" ], [ 507.258899365, 'kof', "(
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
);" ], [ 501.501455075, 'kof', "(
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
);" ], [ 499.698770973, 'joach', "(
~jdrum[1] = \\set -> QuantEnv(\\amp, 2)
.phase(1, [0.2,1,0.2], [0.05, 0.95], [2,-2], 0, 4)
.phase(2, [0.2,1,0.2], [0.15, 0.85], [2,-2], 0, 1)
.play([1,2]);
)" ], [ 496.801818599, 'kof', "(
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
);" ], [ 492.866211985, 'kof', "(
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
);" ], [ 488.782286182, 'kof', "(
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
);" ], [ 486.772444469, 'joach', "(
~jdrum[1] = \\set -> QuantEnv(\\amp, 4)
.phase(1, [0.2,1,0.2], [0.05, 0.95], [2,-2], 0, 4)
.phase(2, [0.2,1,0.2], [0.15, 0.85], [2,-2], 0, 1)
.play([1,2]);
)" ], [ 482.278981048, 'joach', "(
~jdrum[1] = \\set -> QuantEnv(\\amp, 1)
.phase(1, [0.2,1,0.2], [0.05, 0.95], [2,-2], 0, 4)
.phase(2, [0.2,1,0.2], [0.15, 0.85], [2,-2], 0, 1)
.play([1,2]);
)" ], [ 479.944410438, 'kof', "(
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
);" ], [ 475.682810279, 'kof', "(
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
);" ], [ 475.366988502, 'joach', "~jdrum[3] = \\set -> Pbind(\\args, [\\freq], \\octave, 3, \\degree, Pseq([3,4,3,7], inf), \\dur, 8);" ], [ 472.874733346, 'kof', "(
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
);" ], [ 467.249395647, 'kof', "(
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
);" ], [ 465.623150626, 'joach', "~jdrum[6] = \\filter -> {|in| LPF.ar(in, \\lpf_freq.kr(800,8)) };" ], [ 463.586448713, 'kof', "(
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
);" ], [ 457.156971665, 'kof', "(
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
);" ], [ 452.393598993, 'joach', "(
~jdrum[5] = \\set -> QuantEnv(\\noise, 8)
.phase(1, [0,0.2,0], [7.05, 0.95], [2,-2], 0, 1)
.phase(2, [0,0.8,0], [5.35, 2.65], [2,-2], 0, 1)
.play([1]);
)" ], [ 451.76013129, 'kof', "(
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
);" ], [ 446.505813489, 'kof', "(
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
);" ], [ 442.806062286, 'kof', "(
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
);" ], [ 433.869359396, 'kof', "(
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
);" ], [ 433.413107931, 'joach', "(
~jdrum[5] = \\set -> QuantEnv(\\noise, 8)
.phase(1, [0,0.2,0], [7.05, 0.95], [2,-2], 0, 1)
.phase(2, [0,1,0], [0.35, 0.65], [2,-2], 0, 1)
.play([1]);
)" ], [ 430.304262825, 'kof', "(
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
);" ], [ 424.96981341, 'kof', "(
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
);" ], [ 424.1933013, 'joach', "(
~jdrum[5] = \\set -> QuantEnv(\\noise, 8)
.phase(1, [0,1,0], [7.05, 0.95], [2,-2], 0, 1)
.phase(2, [0,1,0], [0.35, 0.65], [2,-2], 0, 1)
.play([1]);
)" ], [ 423.22493429, 'kof', "(
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
);" ], [ 418.794768514, 'kof', "(
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
);" ], [ 416.25119583, 'kof', "(
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
);" ], [ 413.505040729, 'kof', "(
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
);" ], [ 407.500551887, 'kof', "(
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
);" ], [ 392.818446324, 'kof', "(
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
);" ], [ 387.161897966, 'kof', "(
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
);" ], [ 385.72500142, 'joach', "~jdrum[4] = \\filter -> {|in| CombC.ar(in, 0.25, 0.125, 0.5) };" ], [ 373.69970442, 'kof', "(
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
);" ], [ 373.168521887, 'joach', "(
~jdrum[2] = \\set -> QuantEnv(\\fplus, 1)
.phase(1, [0,170,0], [0.005, 0.15], [8,-2], 0, 8)
.phase(2, [0,[100,2000],0], [0.005, 0.15], [8,-2], 0, 1)
.phase(2, [0,8000,0], [0.005, 0.15], [8,-8], 0, 1)
.play([1,2]);
)" ], [ 369.668084329, 'joach', "(
~jdrum[2] = \\set -> QuantEnv(\\fplus, 1)
.phase(1, [0,170,0], [0.005, 0.15], [8,-2], 0, 8)
.phase(2, [0,[100,200],0], [0.005, 0.15], [8,-2], 0, 1)
.phase(2, [0,8000,0], [0.005, 0.15], [8,-8], 0, 1)
.play([1,2]);
)" ], [ 355.323747937, 'joach', "~jdrum[4] = \\filter -> {|in| CombC.ar(in, 0.25, 0.125, 2) };" ], [ 352.308976952, 'kof', "(
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
);" ], [ 346.97093666, 'kof', "(
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
);" ], [ 338.507369035, 'kof', "(
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
);" ], [ 337.874119693, 'joach', "~jdrum[4] = \\filter -> {|in| CombC.ar(in, 0.5, 0.125, 2) };" ], [ 332.886708873, 'kof', "(
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
);" ], [ 325.402744225, 'joach', "~jdrum[3] = \\set -> Pbind(\\args, [\\freq], \\octave, 2, \\degree, Pseq([3,4,3,7], inf), \\dur, 8);" ], [ 309.172070581, 'joach', "~jdrum[3] = \\set -> Pbind(\\args, [\\freq], \\octave, 3, \\degree, Pseq([3,4,3,7], inf), \\dur, 8);" ], [ 292.564950949, 'kof', "(
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
);" ], [ 284.79484748, 'kof', "(
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
);" ], [ 280.882169423, 'kof', "(
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
);" ], [ 276.789350768, 'joach', "~jdrum[3] = \\set -> Pbind(\\args, [\\freq], \\octave, 2, \\degree, Pseq([3,4,3,7], inf), \\dur, 8);" ], [ 269.033039213, 'kof', "(
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
);" ], [ 267.820467069, 'kof', "(
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
);" ], [ 264.3596278, 'kof', "(
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
);" ], [ 261.746643765, 'kof', "(
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
);" ], [ 260.79740542, 'joach', "(
~jdrum[1] = \\set -> QuantEnv(\\amp, 1)
.phase(1, [0.2,1,0.2], [0.05, 0.95], [2,-2], 0, 1)
.phase(2, [0.2,1,0.2], [0.15, 0.85], [2,-2], 0, 1)
.play([1,2]);
)" ], [ 256.716460612, 'kof', "(
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
);" ], [ 253.108727724, 'kof', "(
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
);" ], [ 247.867518749, 'kof', "(
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
);" ], [ 228.983177935, 'joach', "(
~jdrum[2] = \\set -> QuantEnv(\\fplus, 1)
.phase(1, [0,170,0], [0.005, 0.15], [8,-2], 0, 8)
.phase(2, [0,[100,200],0], [0.005, 0.15], [8,-2], 0, 1)
.phase(2, [0,800,0], [0.005, 0.15], [8,-8], 0, 1)
.play([1,2]);
)" ], [ 227.990010573, 'kof', "(
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
);" ], [ 212.948214293, 'kof', "(
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
);" ], [ 211.807718369, 'joach', "~jdrum.play(vol: 0.4, fadeTime: 8);" ], [ 207.713888928, 'kof', "(
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
);" ], [ 202.729624784, 'kof', "(
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
);" ], [ 196.211985025, 'joach', "(
~jdrum[2] = \\set -> QuantEnv(\\fplus, 1)
.phase(1, [0,170,0], [0.005, 0.15], [8,-2], 0, 8)
.phase(2, [0,[100,200],0], [0.005, 0.15], [8,-2], 0, 1)
.play([1,2]);
)" ], [ 189.464451499, 'joach', "(
~jdrum[2] = \\set -> QuantEnv(\\fplus, 1)
.phase(1, [0,100,0], [0.005, 0.15], [8,-2], 0, 8)
.phase(2, [0,[100,200],0], [0.005, 0.15], [8,-2], 0, 1)
.play([1,2]);
)" ], [ 180.984056018, 'joach', "(
~jdrum[2] = \\set -> QuantEnv(\\fplus, 1)
.phase(1, [0,100,0], [0.005, 0.15], [8,-2], 0, 1)
.phase(2, [0,[100,200],0], [0.005, 0.15], [8,-2], 0, 1)
.play([1,2]);
)" ], [ 177.657643359, 'joach', "(
~jdrum[2] = \\set -> QuantEnv(\\fplus, 1)
.phase(1, [0,100,0], [0.005, 0.15], [8,-2], 0, 1)
.phase(2, [0,[100,200],0], [0.005, 0.15], [8,-2], 0, 1)
.play([1]);
)" ], [ 131.239426308, 'kof', "(
  ~offset = (0..7)/8;

  ~tick.quant = 1;
  ~tick = {Mix(Impulse.kr( ~tempo / 2 , ~offset ))};

  ~counter = {PulseCount.kr(~tick.kr)};
);" ], [ 130.128584697, 'joach', "(
~jdrum[2] = \\set -> QuantEnv(\\fplus, 1)
.phase(1, [0,100,0], [0.005, 0.15], [8,-2], 0, 1)
.phase(2, [0,1,0], [0.35, 0.65], [2,-2], 0, 1)
.play([1]);
)" ], [ 126.398324144, 'joach', "(
~jdrum[1] = \\set -> QuantEnv(\\amp, 1)
.phase(1, [0,1,0], [0.05, 0.95], [2,-2], 0, 1)
.phase(2, [0,1,0], [0.15, 0.85], [2,-2], 0, 1)
.play([1,2]);
)" ], [ 123.110089172, 'joach', "(
~jdrum[0] = {
var osc = SinOsc.ar(( \\freq.kr(60) + \\fplus.kr(0) ), mul: 1, add: 0);
var noise = BrownNoise.ar(\\noise.kr(0), (1 - \\noise.kr(0)));
var sig = osc * noise;
Pan2.ar( sig * \\amp.kr(0), \\pan.kr(0) );
};
)" ], [ 122.233689946, 'joach', "~jdrum.play(vol: 0.2, fadeTime: 8);" ], [ 34.105921399, 'kof', "Kolektiv.tempo_(120);" ], [ 0.11415723400023, 'kof', "Kolektiv.tempo_(60);" ], [ 0, 'kof', "Kolektiv.tempo_(120);" ] ]