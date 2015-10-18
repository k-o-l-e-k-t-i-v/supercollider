List[ [ 1341.21777, 'joach', "Kolektiv.historySave" ], [ 1324.4027127, 'joach', "~sin.stop(16);" ], [ 1311.8876949, 'kof', "~hh.stop(4);" ], [ 1308.353659, 'joach', "(
~sin[0] = {
	var osc = SinOsc.ar(( \\freq.kr(60) + \\fplus.kr(0) ), mul: 1, add: 0);
	var noise = BrownNoise.ar(\\noise.kr(0), (1 - \\noise.kr(0))) * Saw.ar(2, 0.4, 0.6);
	var sig = osc * noise;
	Pan2.ar( sig * \\amp.kr(0), \\pan.kr(0) );
};
)" ], [ 1308.1436565, 'kof', "~kick.stop(4);" ], [ 1304.7836518, 'kof', "~ss.stop(10);" ], [ 1295.2396053, 'joach', "(
~sin[0] = {
	var osc = SinOsc.ar(( \\freq.kr(60) + \\fplus.kr(0) ), mul: 1, add: 0);
	var noise = BrownNoise.ar(\\noise.kr(0), (1 - \\noise.kr(0))) * Saw.ar(2);
	var sig = osc * noise;
	Pan2.ar( sig * \\amp.kr(0), \\pan.kr(0) );
};
)" ], [ 1293.7696032, 'kof', "(
~ss.ar(2);
~ss.quant=2;
~ss.fadeTime=0.002;
~ss={
  //         |       |       |       |       |  
  var pat = [1,0,0,0,1,0,0,0,1,0,0,0,1,1,1,1].rotate(3);
  var imp = PulseDivider.kr(~tick.kr,[2,3,4],~counter.kr);
  var hit = Select.kr(PulseCount.kr(imp)/(1..8)%pat.size,pat);
  var env = EnvGen.ar(Env([0.0001,1,1,0.0001],[0.002,0.05,0.002],[3,1,-3],curve:'exp'),imp * hit);
  var sig = [
  SinOsc.ar(8000/1.5),
    LFSaw.ar(4000*1.125),
    LFNoise2.ar(4000*4),
    Pulse.ar(40)
  ];
  sig = Select.ar(PulseCount.kr(imp*hit)%sig.size,sig);
  sig = sig * env;
  //sig = CombN.ar(sig,1/40,1/40,1);
  Splay.ar(sig,0.25,0.25);
};
~ss.play;
);" ], [ 1291.4195999, 'kof', "(
~ss.ar(2);
~ss.quant=2;
~ss.fadeTime=0.002;
~ss={
  //         |       |       |       |       |  
  var pat = [1,0,0,0,1,0,0,0,1,0,0,0,1,1,1,1].rotate(3);
  var imp = PulseDivider.kr(~tick.kr,[2,3,4],~counter.kr);
  var hit = Select.kr(PulseCount.kr(imp)/(1..8)%pat.size,pat);
  var env = EnvGen.ar(Env([0.0001,1,1,0.0001],[0.002,0.05,0.002],[3,1,-3],curve:'exp'),imp * hit);
  var sig = [
  SinOsc.ar(8000/1.5),
    LFSaw.ar(4000*1.125),
    LFNoise2.ar(4000*4),
    Pulse.ar(400*8)
  ];
  sig = Select.ar(PulseCount.kr(imp*hit)%sig.size,sig);
  sig = sig * env;
  //sig = CombN.ar(sig,1/40,1/40,1);
  Splay.ar(sig,0.25,0.25);
};
~ss.play;
);" ], [ 1289.3595971, 'kof', "(
~ss.ar(2);
~ss.quant=2;
~ss.fadeTime=0.002;
~ss={
  //         |       |       |       |       |  
  var pat = [1,0,0,0,1,0,0,0,1,0,0,0,1,1,1,1].rotate(3);
  var imp = PulseDivider.kr(~tick.kr,[2,3,4],~counter.kr);
  var hit = Select.kr(PulseCount.kr(imp)/(1..8)%pat.size,pat);
  var env = EnvGen.ar(Env([0.0001,1,1,0.0001],[0.002,0.05,0.002],[3,1,-3],curve:'exp'),imp * hit);
  var sig = [
  SinOsc.ar(8000/1.5),
    LFSaw.ar(4000*1.125),
    LFNoise2.ar(4000*4),
    Pulse.ar(400*2)
  ];
  sig = Select.ar(PulseCount.kr(imp*hit)%sig.size,sig);
  sig = sig * env;
  //sig = CombN.ar(sig,1/40,1/40,1);
  Splay.ar(sig,0.25,0.25);
};
~ss.play;
);" ], [ 1286.8195935, 'kof', "(
~ss.ar(2);
~ss.quant=2;
~ss.fadeTime=0.002;
~ss={
  //         |       |       |       |       |  
  var pat = [1,0,0,0,1,0,0,0,1,0,0,0,1,1,1,1].rotate(3);
  var imp = PulseDivider.kr(~tick.kr,[2,3,4],~counter.kr);
  var hit = Select.kr(PulseCount.kr(imp)/(1..8)%pat.size,pat);
  var env = EnvGen.ar(Env([0.0001,1,1,0.0001],[0.002,0.05,0.002],[3,1,-3],curve:'exp'),imp * hit);
  var sig = [
  SinOsc.ar(8000/1.5),
    LFSaw.ar(4000*1.125),
    LFNoise2.ar(4000*4),
    Pulse.ar(400*1.5)
  ];
  sig = Select.ar(PulseCount.kr(imp*hit)%sig.size,sig);
  sig = sig * env;
  //sig = CombN.ar(sig,1/40,1/40,1);
  Splay.ar(sig,0.25,0.25);
};
~ss.play;
);" ], [ 1285.9655636, 'joach', "(
~sin[0] = {
	var osc = SinOsc.ar(( \\freq.kr(60) + \\fplus.kr(0) ), mul: 1, add: 0);
	var noise = BrownNoise.ar(\\noise.kr(0), (1 - \\noise.kr(0))) * Saw.ar(8);
	var sig = osc * noise;
	Pan2.ar( sig * \\amp.kr(0), \\pan.kr(0) );
};
)" ], [ 1284.9355577, 'kof', "(
~ss.ar(2);
~ss.quant=2;
~ss.fadeTime=0.002;
~ss={
  //         |       |       |       |       |  
  var pat = [1,0,0,0,1,0,0,0,1,0,0,0,1,1,1,1].rotate(3);
  var imp = PulseDivider.kr(~tick.kr,[2,3,4],~counter.kr);
  var hit = Select.kr(PulseCount.kr(imp)/(1..8)%pat.size,pat);
  var env = EnvGen.ar(Env([0.0001,1,1,0.0001],[0.002,0.05,0.002],[3,1,-3],curve:'exp'),imp * hit);
  var sig = [
  SinOsc.ar(8000/1.5),
    LFSaw.ar(4000*1.125),
    LFNoise2.ar(4000*4),
    Pulse.ar(400*1.25)
  ];
  sig = Select.ar(PulseCount.kr(imp*hit)%sig.size,sig);
  sig = sig * env;
  //sig = CombN.ar(sig,1/40,1/40,1);
  Splay.ar(sig,0.25,0.25);
};
~ss.play;
);" ], [ 1282.0355537, 'kof', "(
~ss.ar(2);
~ss.quant=2;
~ss.fadeTime=0.002;
~ss={
  //         |       |       |       |       |  
  var pat = [1,0,0,0,1,0,0,0,1,0,0,0,1,1,1,1].rotate(3);
  var imp = PulseDivider.kr(~tick.kr,[2,3,4],~counter.kr);
  var hit = Select.kr(PulseCount.kr(imp)/(1..8)%pat.size,pat);
  var env = EnvGen.ar(Env([0.0001,1,1,0.0001],[0.002,0.05,0.002],[3,1,-3],curve:'exp'),imp * hit);
  var sig = [
  SinOsc.ar(8000/1.5),
    LFSaw.ar(4000*1.125),
    LFNoise2.ar(4000*4),
    Pulse.ar(400*1.125)
  ];
  sig = Select.ar(PulseCount.kr(imp*hit)%sig.size,sig);
  sig = sig * env;
  //sig = CombN.ar(sig,1/40,1/40,1);
  Splay.ar(sig,0.25,0.25);
};
~ss.play;
);" ], [ 1278.4855487, 'kof', "(
~ss.ar(2);
~ss.quant=2;
~ss.fadeTime=0.002;
~ss={
  //         |       |       |       |       |  
  var pat = [1,0,0,0,1,0,0,0,1,0,0,0,1,1,1,1].rotate(3);
  var imp = PulseDivider.kr(~tick.kr,[2,3,4],~counter.kr);
  var hit = Select.kr(PulseCount.kr(imp)/(1..8)%pat.size,pat);
  var env = EnvGen.ar(Env([0.0001,1,1,0.0001],[0.002,0.05,0.002],[3,1,-3],curve:'exp'),imp * hit);
  var sig = [
  SinOsc.ar(8000/1.5),
    LFSaw.ar(4000*1.125),
    LFNoise2.ar(4000*4),
    Pulse.ar(400*1.25)
  ];
  sig = Select.ar(PulseCount.kr(imp*hit)%sig.size,sig);
  sig = sig * env;
  //sig = CombN.ar(sig,1/40,1/40,1);
  Splay.ar(sig,0.25,0.25);
};
~ss.play;
);" ], [ 1274.7255434, 'kof', "(
~ss.ar(2);
~ss.quant=2;
~ss.fadeTime=0.002;
~ss={
  //         |       |       |       |       |  
  var pat = [1,0,0,0,1,0,0,0,1,0,0,0,1,1,1,1].rotate(3);
  var imp = PulseDivider.kr(~tick.kr,[2,3,4],~counter.kr);
  var hit = Select.kr(PulseCount.kr(imp)/(1..8)%pat.size,pat);
  var env = EnvGen.ar(Env([0.0001,1,1,0.0001],[0.002,0.05,0.002],[3,1,-3],curve:'exp'),imp * hit);
  var sig = [
  SinOsc.ar(8000/1.5),
    LFSaw.ar(4000*1.125),
    LFNoise2.ar(4000*4),
    Pulse.ar(400*1.5)
  ];
  sig = Select.ar(PulseCount.kr(imp*hit)%sig.size,sig);
  sig = sig * env;
  //sig = CombN.ar(sig,1/40,1/40,1);
  Splay.ar(sig,0.25,0.25);
};
~ss.play;
);" ], [ 1271.9455395, 'kof', "(
~ss.ar(2);
~ss.quant=2;
~ss.fadeTime=0.002;
~ss={
  //         |       |       |       |       |  
  var pat = [1,0,0,0,1,0,0,0,1,0,0,0,1,1,1,1].rotate(3);
  var imp = PulseDivider.kr(~tick.kr,[2,3,4],~counter.kr);
  var hit = Select.kr(PulseCount.kr(imp)/(1..8)%pat.size,pat);
  var env = EnvGen.ar(Env([0.0001,1,1,0.0001],[0.002,0.05,0.002],[3,1,-3],curve:'exp'),imp * hit);
  var sig = [
  SinOsc.ar(8000/1.5),
    LFSaw.ar(4000*1.125),
    LFNoise2.ar(4000*4),
    Pulse.ar(400)
  ];
  sig = Select.ar(PulseCount.kr(imp*hit)%sig.size,sig);
  sig = sig * env;
  //sig = CombN.ar(sig,1/40,1/40,1);
  Splay.ar(sig,0.25,0.25);
};
~ss.play;
);" ], [ 1269.1855357, 'kof', "(
~ss.ar(2);
~ss.quant=2;
~ss.fadeTime=0.002;
~ss={
  //         |       |       |       |       |  
  var pat = [1,0,0,0,1,0,0,0,1,0,0,0,1,1,1,1].rotate(3);
  var imp = PulseDivider.kr(~tick.kr,[2,3,4],~counter.kr);
  var hit = Select.kr(PulseCount.kr(imp)/(1..8)%pat.size,pat);
  var env = EnvGen.ar(Env([0.0001,1,1,0.0001],[0.002,0.05,0.002],[3,1,-3],curve:'exp'),imp * hit);
  var sig = [
  SinOsc.ar(8000/1.5),
    LFSaw.ar(4000*1.125),
    LFNoise2.ar(4000*4),
    Pulse.ar(4000)
  ];
  sig = Select.ar(PulseCount.kr(imp*hit)%sig.size,sig);
  sig = sig * env;
  //sig = CombN.ar(sig,1/40,1/40,1);
  Splay.ar(sig,0.25,0.25);
};
~ss.play;
);" ], [ 1265.9425293, 'kof', "(
~ss.ar(2);
~ss.quant=2;
~ss.fadeTime=0.002;
~ss={
  //         |       |       |       |       |  
  var pat = [1,0,0,0,1,0,0,0,1,0,0,0,1,1,1,1].rotate(3);
  var imp = PulseDivider.kr(~tick.kr,[2,3,4],~counter.kr);
  var hit = Select.kr(PulseCount.kr(imp)/(1..8)%pat.size,pat);
  var env = EnvGen.ar(Env([0.0001,1,1,0.0001],[0.002,0.05,0.002],[3,1,-3],curve:'exp'),imp * hit);
  var sig = [
  SinOsc.ar(8000/1.5),
    LFSaw.ar(4000*1.125),
    LFNoise2.ar(4000*4),
    Pulse.ar(400)
  ];
  sig = Select.ar(PulseCount.kr(imp*hit)%sig.size,sig);
  sig = sig * env;
  //sig = CombN.ar(sig,1/40,1/40,1);
  Splay.ar(sig,0.25,0.25);
};
~ss.play;
);" ], [ 1265.4335002, 'joach', "(
~sin[3] = \\set -> QuantEnv(\\fplus, 0.5)
.phase(1, [0,240,0], [0.015, 0.11], [8,-8], 0, 4)
.phase(2, [0,300,0], [4.005, 0.205], [8,-4], 0, 1)
.phase(3, [0,1200,0], [0.005, 0.115], [8,-4], 0, 2)
.play([1,2]);
)" ], [ 1262.3924931, 'kof', "(
~ss.ar(2);
~ss.quant=2;
~ss.fadeTime=0.002;
~ss={
  //         |       |       |       |       |  
  var pat = [1,0,0,0,1,0,0,0,1,0,0,0,1,1,1,1].rotate(3);
  var imp = PulseDivider.kr(~tick.kr,[2,3,4],~counter.kr);
  var hit = Select.kr(PulseCount.kr(imp)/(1..8)%pat.size,pat);
  var env = EnvGen.ar(Env([0.0001,1,1,0.0001],[0.002,0.05,0.002],[3,1,-3],curve:'exp'),imp * hit);
  var sig = [
  SinOsc.ar(8000/1.5),
    LFSaw.ar(4000*1.125),
    LFNoise2.ar(4000*4),
    Pulse.ar(4000)
  ];
  sig = Select.ar(PulseCount.kr(imp*hit)%sig.size,sig);
  sig = sig * env;
  //sig = CombN.ar(sig,1/40,1/40,1);
  Splay.ar(sig,0.25,0.25);
};
~ss.play;
);" ], [ 1260.0624898, 'kof', "(
~ss.ar(2);
~ss.quant=2;
~ss.fadeTime=0.002;
~ss={
  //         |       |       |       |       |  
  var pat = [1,0,0,0,1,0,0,0,1,0,0,0,1,1,1,1].rotate(3);
  var imp = PulseDivider.kr(~tick.kr,[2,3,4],~counter.kr);
  var hit = Select.kr(PulseCount.kr(imp)/(1..8)%pat.size,pat);
  var env = EnvGen.ar(Env([0.0001,1,1,0.0001],[0.002,0.05,0.002],[3,1,-3],curve:'exp'),imp * hit);
  var sig = [
  SinOsc.ar(8000/1.5),
    LFSaw.ar(4000*1.125),
    LFNoise2.ar(4000),
    Pulse.ar(4000)
  ];
  sig = Select.ar(PulseCount.kr(imp*hit)%sig.size,sig);
  sig = sig * env;
  //sig = CombN.ar(sig,1/40,1/40,1);
  Splay.ar(sig,0.25,0.25);
};
~ss.play;
);" ], [ 1257.4024861, 'kof', "(
~ss.ar(2);
~ss.quant=2;
~ss.fadeTime=0.002;
~ss={
  //         |       |       |       |       |  
  var pat = [1,0,0,0,1,0,0,0,1,0,0,0,1,1,1,1].rotate(3);
  var imp = PulseDivider.kr(~tick.kr,[2,3,4],~counter.kr);
  var hit = Select.kr(PulseCount.kr(imp)/(1..8)%pat.size,pat);
  var env = EnvGen.ar(Env([0.0001,1,1,0.0001],[0.002,0.05,0.002],[3,1,-3],curve:'exp'),imp * hit);
  var sig = [
  SinOsc.ar(8000/2),
    LFSaw.ar(4000*1.125),
    LFNoise2.ar(4000),
    Pulse.ar(4000)
  ];
  sig = Select.ar(PulseCount.kr(imp*hit)%sig.size,sig);
  sig = sig * env;
  //sig = CombN.ar(sig,1/40,1/40,1);
  Splay.ar(sig,0.25,0.25);
};
~ss.play;
);" ], [ 1254.0824814, 'kof', "(
~ss.ar(2);
~ss.quant=2;
~ss.fadeTime=0.002;
~ss={
  //         |       |       |       |       |  
  var pat = [1,0,0,0,1,0,0,0,1,0,0,0,1,1,1,1].rotate(3);
  var imp = PulseDivider.kr(~tick.kr,[2,3,4],~counter.kr);
  var hit = Select.kr(PulseCount.kr(imp)/(1..8)%pat.size,pat);
  var env = EnvGen.ar(Env([0.0001,1,1,0.0001],[0.002,0.05,0.002],[3,1,-3],curve:'exp'),imp * hit);
  var sig = [
  SinOsc.ar(8000/2),
    LFSaw.ar(4000*1.5),
    LFNoise2.ar(4000),
    Pulse.ar(4000)
  ];
  sig = Select.ar(PulseCount.kr(imp*hit)%sig.size,sig);
  sig = sig * env;
  //sig = CombN.ar(sig,1/40,1/40,1);
  Splay.ar(sig,0.25,0.25);
};
~ss.play;
);" ], [ 1250.5724481, 'joach', "~sin[6] = \\filter -> {|in| GVerb.ar(in, \\gverb_size.kr(12), \\gverb_time.kr(0.25), 0.9, mul:\\mulgverb.kr(1)) };" ], [ 1248.8314411, 'kof', "(
~ss.ar(2);
~ss.quant=2;
~ss.fadeTime=0.002;
~ss={
  //         |       |       |       |       |  
  var pat = [1,0,0,0,1,0,0,0,1,0,0,0,1,1,1,1].rotate(3);
  var imp = PulseDivider.kr(~tick.kr,[2,3,4],~counter.kr);
  var hit = Select.kr(PulseCount.kr(imp)/(1..8)%pat.size,pat);
  var env = EnvGen.ar(Env([0.0001,1,1,0.0001],[0.002,0.05,0.002],[3,1,-3],curve:'exp'),imp * hit);
  var sig = [
  SinOsc.ar(8000/2),
    LFSaw.ar(4000*1.25),
    LFNoise2.ar(4000),
    Pulse.ar(4000)
  ];
  sig = Select.ar(PulseCount.kr(imp*hit)%sig.size,sig);
  sig = sig * env;
  //sig = CombN.ar(sig,1/40,1/40,1);
  Splay.ar(sig,0.25,0.25);
};
~ss.play;
);" ], [ 1234.0773879, 'joach', "(
~sin[1] = \\set -> QuantEnv(\\amp, 16)
.phase(1, [0.2,1,0.5], [4.55, 8.45], [2,-2], 0, 4)
.phase(2, [0.5,1,0.2], [0.35, 0.65], [2,-2], 0, 1)
.phase(3, [0.1,0.1], [0.35], \\lin, 0, 1)
.play([1,3]);
)" ], [ 1231.611383, 'kof', "(
~ss.ar(2);
~ss.quant=2;
~ss.fadeTime=0.002;
~ss={
  //         |       |       |       |       |  
  var pat = [1,0,0,0,1,0,0,0,1,0,0,0,1,1,1,1].rotate(3);
  var imp = PulseDivider.kr(~tick.kr,[2,3,4]*4,~counter.kr);
  var hit = Select.kr(PulseCount.kr(imp)/(1..8)%pat.size,pat);
  var env = EnvGen.ar(Env([0.0001,1,1,0.0001],[0.002,0.05,0.002],[3,1,-3],curve:'exp'),imp * hit);
  var sig = [
  SinOsc.ar(8000/2),
    LFSaw.ar(4000*1.25),
    LFNoise2.ar(4000),
    Pulse.ar(4000)
  ];
  sig = Select.ar(PulseCount.kr(imp*hit)%sig.size,sig);
  sig = sig * env;
  //sig = CombN.ar(sig,1/40,1/40,1);
  Splay.ar(sig,0.25,0.25);
};
~ss.play;
);" ], [ 1226.3813756, 'kof', "(
~ss.ar(2);
~ss.quant=2;
~ss.fadeTime=0.002;
~ss={
  //         |       |       |       |       |  
  var pat = [1,0,0,0,1,0,0,0,1,0,0,0,1,1,1,1].rotate(3);
  var imp = PulseDivider.kr(~tick.kr,[2,3,4]*4,~counter.kr);
  var hit = Select.kr(PulseCount.kr(imp)/(1..8)%pat.size,pat);
  var env = EnvGen.ar(Env([0.0001,1,1,0.0001],[0.002,0.05,0.002],[3,1,-3],curve:'exp'),imp * hit);
  var sig = [
  SinOsc.ar(8000/2),
    LFSaw.ar(4000*1.5),
    LFNoise2.ar(4000),
    Pulse.ar(4000)
  ];
  sig = Select.ar(PulseCount.kr(imp*hit)%sig.size,sig);
  sig = sig * env;
  //sig = CombN.ar(sig,1/40,1/40,1);
  Splay.ar(sig,0.25,0.25);
};
~ss.play;
);" ], [ 1220.1413669, 'kof', "(
~ss.ar(2);
~ss.quant=2;
~ss.fadeTime=0.002;
~ss={
  //         |       |       |       |       |  
  var pat = [1,0,0,0,1,0,0,0,1,0,0,0,1,1,1,1].rotate(3);
  var imp = PulseDivider.kr(~tick.kr,[2,3,4],~counter.kr);
  var hit = Select.kr(PulseCount.kr(imp)/(1..8)%pat.size,pat);
  var env = EnvGen.ar(Env([0.0001,1,1,0.0001],[0.002,0.05,0.002],[3,1,-3],curve:'exp'),imp * hit);
  var sig = [
  SinOsc.ar(8000/2),
    LFSaw.ar(4000*1.5),
    LFNoise2.ar(4000),
    Pulse.ar(4000)
  ];
  sig = Select.ar(PulseCount.kr(imp*hit)%sig.size,sig);
  sig = sig * env;
  //sig = CombN.ar(sig,1/40,1/40,1);
  Splay.ar(sig,0.25,0.25);
};
~ss.play;
);" ], [ 1215.4213603, 'kof', "(
~ss.ar(2);
~ss.quant=2;
~ss.fadeTime=0.002;
~ss={
  //         |       |       |       |       |  
  var pat = [1,0,0,0,1,0,0,0,1,0,0,0,1,1,1,1].rotate(3);
  var imp = PulseDivider.kr(~tick.kr,[2,3,4]*2,~counter.kr);
  var hit = Select.kr(PulseCount.kr(imp)/(1..8)%pat.size,pat);
  var env = EnvGen.ar(Env([0.0001,1,1,0.0001],[0.002,0.05,0.002],[3,1,-3],curve:'exp'),imp * hit);
  var sig = [
  SinOsc.ar(8000/2),
    LFSaw.ar(4000*1.5),
    LFNoise2.ar(4000),
    Pulse.ar(4000)
  ];
  sig = Select.ar(PulseCount.kr(imp*hit)%sig.size,sig);
  sig = sig * env;
  //sig = CombN.ar(sig,1/40,1/40,1);
  Splay.ar(sig,0.25,0.25);
};
~ss.play;
);" ], [ 1210.6513536, 'kof', "(
~ss.ar(2);
~ss.quant=2;
~ss.fadeTime=0.002;
~ss={
  //         |       |       |       |       |  
  var pat = [1,0,0,0,1,0,0,0,1,0,0,0,1,1,1,1].rotate(3);
  var imp = PulseDivider.kr(~tick.kr,[2,3,4]*2,~counter.kr);
  var hit = Select.kr(PulseCount.kr(imp)/(1..8)%pat.size,pat);
  var env = EnvGen.ar(Env([0.0001,1,1,0.0001],[0.002,0.05,0.002],[3,1,-3],curve:'exp'),imp * hit);
  var sig = [
  SinOsc.ar(8000/2),
    LFSaw.ar(4000!2),
    LFNoise2.ar(4000),
    Pulse.ar(4000)
  ];
  sig = Select.ar(PulseCount.kr(imp*hit)%sig.size,sig);
  sig = sig * env;
  //sig = CombN.ar(sig,1/40,1/40,1);
  Splay.ar(sig,0.25,0.25);
};
~ss.play;
);" ], [ 1205.8313469, 'kof', "(
~ss.ar(2);
~ss.quant=2;
~ss.fadeTime=0.002;
~ss={
  //         |       |       |       |       |  
  var pat = [1,0,0,0,1,0,0,0,1,0,0,0,1,1,1,1].rotate(3);
  var imp = PulseDivider.kr(~tick.kr,[2,3,4]*2,~counter.kr);
  var hit = Select.kr(PulseCount.kr(imp)/(1..8)%pat.size,pat);
  var env = EnvGen.ar(Env([0.0001,1,1,0.0001],[0.002,0.05,0.002],[3,1,-3],curve:'exp'),imp * hit);
  var sig = [
  SinOsc.ar(8000),
    LFSaw.ar(4000!2),
    LFNoise2.ar(4000),
    Pulse.ar(4000)
  ];
  sig = Select.ar(PulseCount.kr(imp*hit)%sig.size,sig);
  sig = sig * env;
  //sig = CombN.ar(sig,1/40,1/40,1);
  Splay.ar(sig,0.25,0.25);
};
~ss.play;
);" ], [ 1198.9203042, 'joach', "~sin[2] = \\set -> Pbind(\\args, [\\freq], \\octave, 3, \\degree, Pseq([3,3b,3,4], inf), \\dur, 28);" ], [ 1195.2182989, 'kof', "(
~ss.ar(2);
~ss.quant=2;
~ss.fadeTime=0.002;
~ss={
  //         |       |       |       |       |  
  var pat = [1,0,0,0,1,0,0,0,1,0,0,0,1,1,1,1].rotate(3);
  var imp = PulseDivider.kr(~tick.kr,[1,2,3,4],~counter.kr);
  var hit = Select.kr(PulseCount.kr(imp)/(1..8)%pat.size,pat);
  var env = EnvGen.ar(Env([0.0001,1,1,0.0001],[0.002,0.05,0.002],[3,1,-3],curve:'exp'),imp * hit);
  var sig = [
  SinOsc.ar(8000),
    LFSaw.ar(4000!2),
    LFNoise2.ar(4000),
    Pulse.ar(4000)
  ];
  sig = Select.ar(PulseCount.kr(imp*hit)%sig.size,sig);
  sig = sig * env;
  //sig = CombN.ar(sig,1/40,1/40,1);
  Splay.ar(sig,0.25,0.25);
};
~ss.play;
);" ], [ 1189.3032586, 'joach', "~sin.set(\\lpf_freq, 1200);" ], [ 1184.9342207, 'joach', "(
~sin[7] = \\set -> QuantEnv(\\mulgverb, 8)
.phase(1, [0.2,1,0.2], [0.05, 7.95], [2,-2], 0, 1)
.phase(2, [0,1,0], [0.35, 0.65], [2,-2], 0, 1)
.play([1]);
)" ], [ 1181.6622138, 'kof', "(
~ss.ar(2);
~ss.quant=2;
~ss.fadeTime=0.002;
~ss={
  //         |       |       |       |       |  
  var pat = [1,0,0,0,1,0,0,0,1,0,0,0,1,0,1,0].rotate(3);
  var imp = PulseDivider.kr(~tick.kr,[8,2,3,4]*2,~counter.kr);
  var hit = Select.kr(PulseCount.kr(imp)/(1..8)%pat.size,pat);
  var env = EnvGen.ar(Env([0.0001,1,1,0.0001],[0.002,0.05,0.002],[3,1,-3],curve:'exp'),imp * hit);
  var sig = [
  SinOsc.ar(8000),
    LFSaw.ar(4000!2),
    LFNoise2.ar(4000),
    Pulse.ar(4000)
  ];
  sig = Select.ar(PulseCount.kr(imp*hit)%sig.size,sig);
  sig = sig * env;
  //sig = CombN.ar(sig,1/40,1/40,1);
  Splay.ar(sig,0.25,0.25);
};
~ss.play;
);" ], [ 1175.5571765, 'kof', "(
~ss.ar(2);
~ss.quant=2;
~ss.fadeTime=0.002;
~ss={
  //         |       |       |       |       |  
  var pat = [1,0,0,0,1,0,0,0,1,0,0,0,1,0,1,0].rotate(3);
  var imp = PulseDivider.kr(~tick.kr,[8,2,3,4],~counter.kr);
  var hit = Select.kr(PulseCount.kr(imp)/(1..8)%pat.size,pat);
  var env = EnvGen.ar(Env([0.0001,1,1,0.0001],[0.002,0.05,0.002],[3,1,-3],curve:'exp'),imp * hit);
  var sig = [
  SinOsc.ar(8000),
    LFSaw.ar(4000!2),
    LFNoise2.ar(4000),
    Pulse.ar(4000)
  ];
  sig = Select.ar(PulseCount.kr(imp*hit)%sig.size,sig);
  sig = sig * env;
  //sig = CombN.ar(sig,1/40,1/40,1);
  Splay.ar(sig,0.25,0.25);
};
~ss.play;
);" ], [ 1175.4431711, 'joach', "(
~sin[7] = \\set -> QuantEnv(\\mulgverb, 8)
.phase(1, [0,1,0.2], [0.05, 7.95], [2,-2], 0, 1)
.phase(2, [0,1,0], [0.35, 0.65], [2,-2], 0, 1)
.play([1]);
)" ], [ 1172.2931667, 'kof', "(
~ss.ar(2);
~ss.quant=2;
~ss.fadeTime=0.002;
~ss={
  //         |       |       |       |       |  
  var pat = [1,0,0,0,1,0,0,0,1,0,0,0,1,0,1,0].rotate(3);
  var imp = PulseDivider.kr(~tick.kr,[8,2,3,4],~counter.kr);
  var hit = Select.kr(PulseCount.kr(imp)/(1..8)%pat.size,pat);
  var env = EnvGen.ar(Env([0.0001,1,1,0.0001],[0.002,0.05,0.002],[3,1,-3],curve:'exp'),imp * hit);
  var sig = [
  SinOsc.ar(8000),
    LFSaw.ar(4000!2),
    LFNoise2.ar(4000),
    Pulse.ar(4000)
  ];
  sig = Select.ar(PulseCount.kr(imp*hit)%sig.size,sig);
  sig = sig * env;
  sig = CombN.ar(sig,1/40,1/40,1);
  Splay.ar(sig,0.25,0.25);
};
~ss.play;
);" ], [ 1165.8031576, 'kof', "(
~hh.ar(2);
~hh.quant=2;
~hh.fadeTime=1.2;
~hh={
  //         |       |       |       |       |  
  var pat = [1,0,0,0,1,0,0,0,1,0,0,0,1,1,1,1].rotate(3);
  var imp = PulseDivider.kr(~tick.kr,1,~counter.kr);
  var hit = Select.kr(PulseCount.kr(imp)/[1,2,3,4]%pat.size,pat);
  var env = EnvGen.ar(Env([0.001,1,0.001],[0.002,0.15],[3,-3],curve:'exp'),imp * hit);
  var sig = LFNoise2.ar(5000*[1,2,4,8]);
  sig = sig * env;
  Splay.ar(sig,0.75,0.15);
};
~hh.play;
);" ], [ 1163.8031548, 'kof', "(
~hh.ar(2);
~hh.quant=2;
~hh.fadeTime=1.2;
~hh={
  //         |       |       |       |       |  
  var pat = [1,0,0,0,1,0,0,0,1,0,0,0,1,1,1,1].rotate(3);
  var imp = PulseDivider.kr(~tick.kr,1,~counter.kr);
  var hit = Select.kr(PulseCount.kr(imp)/[1,2,3,4]%pat.size,pat);
  var env = EnvGen.ar(Env([0.001,1,0.001],[0.002,0.05],[3,-3],curve:'exp'),imp * hit);
  var sig = LFNoise2.ar(5000*[1,2,4,8]);
  sig = sig * env;
  Splay.ar(sig,0.75,0.15);
};
~hh.play;
);" ], [ 1161.0250863, 'joach', "~sin[6] = \\filter -> {|in| GVerb.ar(in, \\gverb_size.kr(12), \\gverb_time.kr(1), 0.9, mul:\\mulgverb.kr(1)) };" ], [ 1158.9080818, 'kof', "(
~hh.ar(2);
~hh.quant=2;
~hh.fadeTime=1.2;
~hh={
  //         |       |       |       |       |  
  var pat = [1,0,0,0,1,0,0,0,1,0,0,0,1,1,1,1].rotate(3);
  var imp = PulseDivider.kr(~tick.kr,1,~counter.kr);
  var hit = Select.kr(PulseCount.kr(imp)/[1,2,3,4]%pat.size,pat);
  var env = EnvGen.ar(Env([0.001,1,0.001],[0.002,0.25],[3,-3],curve:'exp'),imp * hit);
  var sig = LFNoise2.ar(5000*[1,2,4,8]);
  sig = sig * env;
  Splay.ar(sig,0.75,0.15);
};
~hh.play;
);" ], [ 1154.0080749, 'kof', "(
~hh.ar(2);
~hh.quant=2;
~hh.fadeTime=1.2;
~hh={
  //         |       |       |       |       |  
  var pat = [1,0,0,0,1,0,0,0,1,0,0,0,1,1,1,1].rotate(3);
  var imp = PulseDivider.kr(~tick.kr,2,~counter.kr);
  var hit = Select.kr(PulseCount.kr(imp)/[1,2,3,4]%pat.size,pat);
  var env = EnvGen.ar(Env([0.001,1,0.001],[0.002,0.25],[3,-3],curve:'exp'),imp * hit);
  var sig = LFNoise2.ar(5000*[1,2,4,8]);
  sig = sig * env;
  Splay.ar(sig,0.75,0.15);
};
~hh.play;
);" ], [ 1149.3480684, 'kof', "(
~hh.ar(2);
~hh.quant=2;
~hh.fadeTime=1.2;
~hh={
  //         |       |       |       |       |  
  var pat = [1,0,0,0,1,0,0,0,1,0,0,0,1,1,1,1].rotate(3);
  var imp = PulseDivider.kr(~tick.kr,2,~counter.kr);
  var hit = Select.kr(PulseCount.kr(imp)/[1,2,3,4]%pat.size,pat);
  var env = EnvGen.ar(Env([0.001,1,0.001],[0.002,0.25],[3,-3],curve:'exp'),imp * hit);
  var sig = LFNoise2.ar(1600*[1,2,4,8]);
  sig = sig * env;
  Splay.ar(sig,0.75,0.15);
};
~hh.play;
);" ], [ 1132.7670122, 'kof', "(
~ss.ar(2);
~ss.quant=2;
~ss.fadeTime=0.002;
~ss={
  //         |       |       |       |       |  
  var pat = [1,0,0,0,1,0,0,0,1,0,0,0,1,0,1,0].rotate(3);
  var imp = PulseDivider.kr(~tick.kr,[1,2,3,4],~counter.kr);
  var hit = Select.kr(PulseCount.kr(imp)/(1..8)%pat.size,pat);
  var env = EnvGen.ar(Env([0.0001,1,1,0.0001],[0.002,0.05,0.002],[3,1,-3],curve:'exp'),imp * hit);
  var sig = [
  SinOsc.ar(8000),
    LFSaw.ar(4000!2),
    LFNoise2.ar(4000),
    Pulse.ar(4000)
  ];
  sig = Select.ar(PulseCount.kr(imp*hit)%sig.size,sig);
  sig = sig * env;
  //sig = CombN.ar(sig,1/40,1/40,1);
  Splay.ar(sig,0.25,0.25);
};
~ss.play;
);" ], [ 1124.2570003, 'kof', "(
~ss.ar(2);
~ss.quant=2;
~ss.fadeTime=0.002;
~ss={
  //         |       |       |       |       |  
  var pat = [1,0,0,0,1,0,0,0,1,0,0,0,1,0,1,0].rotate(3);
  var imp = PulseDivider.kr(~tick.kr,2,~counter.kr);
  var hit = Select.kr(PulseCount.kr(imp)/(1..8)%pat.size,pat);
  var env = EnvGen.ar(Env([0.0001,1,1,0.0001],[0.002,0.05,0.002],[3,1,-3],curve:'exp'),imp * hit);
  var sig = [
  SinOsc.ar(8000),
    LFSaw.ar(4000!2),
    LFNoise2.ar(4000),
    Pulse.ar(4000)
  ];
  sig = Select.ar(PulseCount.kr(imp*hit)%sig.size,sig);
  sig = sig * env;
  //sig = CombN.ar(sig,1/40,1/40,1);
  Splay.ar(sig,0.25,0.25);
};
~ss.play;
);" ], [ 1118.8659927, 'kof', "(
~ss.ar(2);
~ss.quant=2;
~ss.fadeTime=0.002;
~ss={
  //         |       |       |       |       |  
  var pat = [1,0,0,0,1,0,0,0,1,0,0,0,1,0,0,0].rotate(3);
  var imp = PulseDivider.kr(~tick.kr,2,~counter.kr);
  var hit = Select.kr(PulseCount.kr(imp)/(1..8)%pat.size,pat);
  var env = EnvGen.ar(Env([0.0001,1,1,0.0001],[0.002,0.05,0.002],[3,1,-3],curve:'exp'),imp * hit);
  var sig = [
  SinOsc.ar(8000),
    LFSaw.ar(4000!2),
    LFNoise2.ar(4000),
    Pulse.ar(4000)
  ];
  sig = Select.ar(PulseCount.kr(imp*hit)%sig.size,sig);
  sig = sig * env;
  //sig = CombN.ar(sig,1/40,1/40,1);
  Splay.ar(sig,0.25,0.25);
};
~ss.play;
);" ], [ 1115.4949879, 'kof', "(
~ss.ar(2);
~ss.quant=2;
~ss.fadeTime=0.002;
~ss={
  //         |       |       |       |       |  
  var pat = [1,0,0,0,1,0,0,0,1,0,0,0,1,0,0,0].rotate(3);
  var imp = PulseDivider.kr(~tick.kr,2,~counter.kr);
  var hit = Select.kr(PulseCount.kr(imp)/(1..8)%pat.size,pat);
  var env = EnvGen.ar(Env([0.0001,1,1,0.0001],[0.002,0.05,0.002],[3,1,-3],curve:'exp'),imp * hit);
  var sig = [
  SinOsc.ar(8000),
    LFSaw.ar(4000!2),
    LFNoise2.ar(4000),
    Pulse.ar(4000)
  ];
  sig = Select.ar(PulseCount.kr(imp*hit)%sig.size,sig);
  sig = sig * env;
  sig = CombN.ar(sig,1/40,1/40,1);
  Splay.ar(sig,0.25,0.25);
};
~ss.play;
);" ], [ 1104.814973, 'kof', "(
~ss.ar(2);
~ss.quant=2;
~ss.fadeTime=0.002;
~ss={
  //         |       |       |       |       |  
  var pat = [1,0,0,0,1,0,0,0,1,0,0,0,1,0,0,0].rotate(3);
  var imp = PulseDivider.kr(~tick.kr,2,~counter.kr);
  var hit = Select.kr(PulseCount.kr(imp)/(1..8)%pat.size,pat);
  var env = EnvGen.ar(Env([0.0001,1,1,0.0001],[0.002,0.05,0.002],[3,1,-3],curve:'exp'),imp * hit);
  var sig = [
  SinOsc.ar(8000),
    LFSaw.ar(4000!2),
    LFNoise2.ar(4000),
    Pulse.ar(4000)
  ];
  sig = Select.ar(PulseCount.kr(imp*hit)%sig.size,sig);
  sig = sig * env;
  //sig = CombN.ar(sig,1/40,1/40,1);
  Splay.ar(sig,0.25,0.25);
};
~ss.play;
);" ], [ 1102.4469413, 'joach', "~sin[6] = \\filter -> {|in| GVerb.ar(in, \\gverb_size.kr(12), \\gverb_time.kr(1), 0.9, mul:\\mulgverb.kr(1)) };" ], [ 1095.1939265, 'kof', "(
~ss.ar(2);
~ss.quant=2;
~ss.fadeTime=0.002;
~ss={
  //         |       |       |       |       |  
  var pat = [1,0,0,0,1,0,0,0,1,0,0,0,1,0,0,0].rotate(3);
  var imp = PulseDivider.kr(~tick.kr,4,~counter.kr);
  var hit = Select.kr(PulseCount.kr(imp)/(1..8)%pat.size,pat);
  var env = EnvGen.ar(Env([0.0001,1,1,0.0001],[0.002,0.05,0.002],[3,1,-3],curve:'exp'),imp * hit);
  var sig = [
  SinOsc.ar(8000),
    LFSaw.ar(4000!2),
    LFNoise2.ar(4000),
    Pulse.ar(4000)
  ];
  sig = Select.ar(PulseCount.kr(imp*hit)%sig.size,sig);
  sig = sig * env;
  //sig = CombN.ar(sig,1/40,1/40,1);
  Splay.ar(sig,0.25,0.25);
};
~ss.play;
);" ], [ 1090.4328863, 'joach', "(
~sin[3] = \\set -> QuantEnv(\\fplus, 1)
.phase(1, [0,240,0], [0.015, 0.11], [8,-8], 0, 4)
.phase(2, [0,300,0], [4.005, 0.205], [8,-4], 0, 1)
.phase(3, [0,1200,0], [0.005, 0.115], [8,-4], 0, 2)
.play([1,2]);
)" ], [ 1080.4828724, 'kof', "(
~ss.ar(2);
~ss.quant=2;
~ss.fadeTime=0.002;
~ss={
  //         |       |       |       |       |  
  var pat = [1,0,0,0,1,0,0,0,1,0,0,0,1,0,0,0].rotate(3);
  var imp = PulseDivider.kr(~tick.kr,2,~counter.kr);
  var hit = Select.kr(PulseCount.kr(imp)/(1..8)%pat.size,pat);
  var env = EnvGen.ar(Env([0.0001,1,1,0.0001],[0.002,0.05,0.002],[3,1,-3],curve:'exp'),imp * hit);
  var sig = [
  SinOsc.ar(8000),
    LFSaw.ar(4000!2),
    LFNoise2.ar(4000),
    Pulse.ar(4000)
  ];
  sig = Select.ar(PulseCount.kr(imp*hit)%sig.size,sig);
  sig = sig * env;
  //sig = CombN.ar(sig,1/40,1/40,1);
  Splay.ar(sig,0.25,0.25);
};
~ss.play;
);" ], [ 1076.0128662, 'kof', "(
~ss.ar(2);
~ss.quant=2;
~ss.fadeTime=0.002;
~ss={
  //         |       |       |       |       |  
  var pat = [1,0,0,0,1,0,0,0,1,0,0,0,1,0,0,0].rotate(3);
  var imp = PulseDivider.kr(~tick.kr,2,~counter.kr);
  var hit = Select.kr(PulseCount.kr(imp)/(1..8)%pat.size,pat);
  var env = EnvGen.ar(Env([0.0001,1,1,0.0001],[0.002,0.05,0.002],[3,1,-3],curve:'exp'),imp * hit);
  var sig = [
  SinOsc.ar(8000),
    LFSaw.ar(4000!2),
    LFNoise2.ar(4000),
    Pulse.ar(4000)
  ];
  sig = Select.ar(PulseCount.kr(imp*hit)%sig.size,sig);
  sig = sig * env;
  sig = CombN.ar(sig,1/40,1/40,1);
  Splay.ar(sig,0.25,0.25);
};
~ss.play;
);" ], [ 1070.3208268, 'joach', "(
~sin[3] = \\set -> QuantEnv(\\fplus, 1)
.phase(1, [0,240,0], [0.015, 0.11], [8,-8], 0, 4)
.phase(2, [0,-800,0], [4.005, 0.105], [8,-4], 0, 2)
.phase(3, [0,1200,0], [0.005, 0.115], [8,-4], 0, 2)
.play([1]);
)" ], [ 1067.9057925, 'joach', "(
~sin[3] = \\set -> QuantEnv(\\fplus, 1)
.phase(1, [0,240,0], [2.015, 0.11], [8,-8], 0, 4)
.phase(2, [0,-800,0], [4.005, 0.105], [8,-4], 0, 2)
.phase(3, [0,1200,0], [0.005, 0.115], [8,-4], 0, 2)
.play([1]);
)" ], [ 1066.2547862, 'kof', "(
~ss.ar(2);
~ss.quant=2;
~ss.fadeTime=0.002;
~ss={
  //         |       |       |       |       |  
  var pat = [1,0,0,0,1,0,0,0,1,0,0,0,1,0,0,0].rotate(3);
  var imp = PulseDivider.kr(~tick.kr,2,~counter.kr);
  var hit = Select.kr(PulseCount.kr(imp)/(1..8)%pat.size,pat);
  var env = EnvGen.ar(Env([0.0001,1,1,0.0001],[0.002,0.05,0.002],[3,1,-3],curve:'exp'),imp * hit);
  var sig = [
  SinOsc.ar(8000),
    LFSaw.ar(4000!2),
    LFNoise2.ar(4000),
    Pulse.ar(4000)
  ];
  sig = Select.ar(PulseCount.kr(imp*hit)%sig.size,sig);
  sig = sig * env;
  //sig = CombN.ar(sig,1/40,1/400,1);
  Splay.ar(sig,0.25,0.25);
};
~ss.play;
);" ], [ 1063.1247818, 'kof', "(
~ss.ar(2);
~ss.quant=2;
~ss.fadeTime=0.002;
~ss={
  //         |       |       |       |       |  
  var pat = [1,0,0,0,1,0,0,0,1,0,0,0,1,0,0,0].rotate(3);
  var imp = PulseDivider.kr(~tick.kr,2,~counter.kr);
  var hit = Select.kr(PulseCount.kr(imp)/(1..8)%pat.size,pat);
  var env = EnvGen.ar(Env([0.0001,1,1,0.0001],[0.002,0.05,0.002],[3,1,-3],curve:'exp'),imp * hit);
  var sig = [
  SinOsc.ar(8000),
    LFSaw.ar(4000!2),
    LFNoise2.ar(4000),
    Pulse.ar(4000)
  ];
  sig = Select.ar(PulseCount.kr(imp*hit)%sig.size,sig);
  sig = sig * env;
  sig = CombN.ar(sig,1/40,1/400,1);
  Splay.ar(sig,0.25,0.25);
};
~ss.play;
);" ], [ 1060.0947776, 'kof', "(
~ss.ar(2);
~ss.quant=2;
~ss.fadeTime=0.002;
~ss={
  //         |       |       |       |       |  
  var pat = [1,0,0,0,1,0,0,0,1,0,0,0,1,0,0,0].rotate(3);
  var imp = PulseDivider.kr(~tick.kr,2,~counter.kr);
  var hit = Select.kr(PulseCount.kr(imp)/(1..8)%pat.size,pat);
  var env = EnvGen.ar(Env([0.0001,1,1,0.0001],[0.002,0.05,0.002],[3,1,-3],curve:'exp'),imp * hit);
  var sig = [
  SinOsc.ar(8000),
    LFSaw.ar(4000!2),
    LFNoise2.ar(4000),
    Pulse.ar(4000)
  ];
  sig = Select.ar(PulseCount.kr(imp*hit)%sig.size,sig);
  sig = sig * env;
  //sig = CombN.ar(sig,1/40,1/400,1);
  Splay.ar(sig,0.25,0.25);
};
~ss.play;
);" ], [ 1056.9347732, 'kof', "(
~ss.ar(2);
~ss.quant=2;
~ss.fadeTime=0.002;
~ss={
  //         |       |       |       |       |  
  var pat = [1,0,0,0,1,0,0,0,1,0,0,0,1,0,0,0].rotate(3);
  var imp = PulseDivider.kr(~tick.kr,2,~counter.kr);
  var hit = Select.kr(PulseCount.kr(imp)/(1..8)%pat.size,pat);
  var env = EnvGen.ar(Env([0.0001,1,1,0.0001],[0.002,0.05,0.002],[3,1,-3],curve:'exp'),imp * hit);
  var sig = [
  SinOsc.ar(8000),
    LFSaw.ar(4000!2),
    LFNoise2.ar(4000),
    Pulse.ar(4000)
  ];
  sig = Select.ar(PulseCount.kr(imp*hit)%sig.size,sig);
  sig = sig * env;
  sig = CombN.ar(sig,1/40,1/400,1);
  Splay.ar(sig,0.25,0.25);
};
~ss.play;
);" ], [ 1054.1247692, 'kof', "(
~ss.ar(2);
~ss.quant=2;
~ss.fadeTime=0.002;
~ss={
  //         |       |       |       |       |  
  var pat = [1,0,0,0,1,0,0,0,1,0,0,0,1,0,0,0].rotate(3);
  var imp = PulseDivider.kr(~tick.kr,2,~counter.kr);
  var hit = Select.kr(PulseCount.kr(imp)/(1..8)%pat.size,pat);
  var env = EnvGen.ar(Env([0.0001,1,1,0.0001],[0.002,0.05,0.002],[3,1,-3],curve:'exp'),imp * hit);
  var sig = [
  SinOsc.ar(8000),
    LFSaw.ar(4000!2),
    LFNoise2.ar(4000),
    Pulse.ar(4000)
  ];
  sig = Select.ar(PulseCount.kr(imp*hit)%sig.size,sig);
  sig = sig * env;
  //sig = CombN.ar(sig,1/40,1/400,1);
  Splay.ar(sig,0.25,0.25);
};
~ss.play;
);" ], [ 1050.6147643, 'kof', "(
~ss.ar(2);
~ss.quant=2;
~ss.fadeTime=0.002;
~ss={
  //         |       |       |       |       |  
  var pat = [1,0,0,0,1,0,0,0,1,0,0,0,1,0,0,0].rotate(3);
  var imp = PulseDivider.kr(~tick.kr,2,~counter.kr);
  var hit = Select.kr(PulseCount.kr(imp)/(1..8)%pat.size,pat);
  var env = EnvGen.ar(Env([0.0001,1,1,0.0001],[0.002,0.05,0.002],[3,1,-3],curve:'exp'),imp * hit);
  var sig = [
  SinOsc.ar(8000),
    LFSaw.ar(4000!2),
    LFNoise2.ar(4000),
    Pulse.ar(4000)
  ];
  sig = Select.ar(PulseCount.kr(imp*hit)%sig.size,sig);
  sig = sig * env;
  sig = CombN.ar(sig,1/40,1/400,1);
  Splay.ar(sig,0.25,0.25);
};
~ss.play;
);" ], [ 1045.9507252, 'joach', "~sin[3] = nil" ], [ 1034.4896773, 'joach', "(
~sin[1] = \\set -> QuantEnv(\\amp, 16)
.phase(1, [0.2,1,0.5], [4.55, 8.45], [2,-2], 0, 4)
.phase(2, [0.5,1,0.2], [0.35, 0.65], [2,-2], 0, 1)
.phase(3, [0,0], [0.35], \\lin, 0, 1)
.play([1,3]);
)" ], [ 1034.3046745, 'kof', "~kick.resume;" ], [ 1028.8946669, 'kof', "~kick.pause;" ], [ 1027.4966322, 'joach', "~sin.set(\\lpf_freq, 200);" ], [ 1022.513625, 'kof', "(
~ss.ar(2);
~ss.quant=2;
~ss.fadeTime=0.002;
~ss={
  //         |       |       |       |       |  
  var pat = [1,0,0,0,1,0,0,0,1,0,0,0,1,0,0,0].rotate(3);
  var imp = PulseDivider.kr(~tick.kr,2,~counter.kr);
  var hit = Select.kr(PulseCount.kr(imp)/(1..8)%pat.size,pat);
  var env = EnvGen.ar(Env([0.0001,1,1,0.0001],[0.002,0.05,0.002],[3,1,-3],curve:'exp'),imp * hit);
  var sig = [
  SinOsc.ar(8000),
    LFSaw.ar(4000!2),
    LFNoise2.ar(4000),
    Pulse.ar(4000)
  ];
  sig = Select.ar(PulseCount.kr(imp*hit)%sig.size,sig);
  sig = sig * env;
  //sig = CombN.ar(sig,1/40,1/40,1);
  Splay.ar(sig,0.25,0.25);
};
~ss.play;
);" ], [ 1018.7026196, 'kof', "(
~ss.ar(2);
~ss.quant=2;
~ss.fadeTime=0.002;
~ss={
  //         |       |       |       |       |  
  var pat = [1,0,0,0,1,0,0,0,1,0,0,0,1,0,0,0].rotate(3);
  var imp = PulseDivider.kr(~tick.kr,2,~counter.kr);
  var hit = Select.kr(PulseCount.kr(imp)/(1..8)%pat.size,pat);
  var env = EnvGen.ar(Env([0.0001,1,1,0.0001],[0.002,0.025,0.002],[3,1,-3],curve:'exp'),imp * hit);
  var sig = [
  SinOsc.ar(8000),
    LFSaw.ar(4000!2),
    LFNoise2.ar(4000),
    Pulse.ar(4000)
  ];
  sig = Select.ar(PulseCount.kr(imp*hit)%sig.size,sig);
  sig = sig * env;
  //sig = CombN.ar(sig,1/40,1/40,1);
  Splay.ar(sig,0.25,0.25);
};
~ss.play;
);" ], [ 1005.6575732, 'joach', "~sin.play(vol: 0.9, fadeTime: 18);" ], [ 1005.0015675, 'kof', "(
~ss.ar(2);
~ss.quant=2;
~ss.fadeTime=0.002;
~ss={
  //         |       |       |       |       |  
  var pat = [1,0,0,0,1,0,0,0,1,0,0,0,1,0,0,0].rotate(3);
  var imp = PulseDivider.kr(~tick.kr,2,~counter.kr);
  var hit = Select.kr(PulseCount.kr(imp)/(1..8)%pat.size,pat);
  var env = EnvGen.ar(Env([0.0001,1,1,0.0001],[0.002,0.05,0.002],[3,1,-3],curve:'exp'),imp * hit);
  var sig = [
  SinOsc.ar(8000),
    LFSaw.ar(4000!2),
    LFNoise2.ar(4000),
    Pulse.ar(4000)
  ];
  sig = Select.ar(PulseCount.kr(imp*hit)%sig.size,sig);
  sig = sig * env;
  //sig = CombN.ar(sig,1/40,1/40,1);
  Splay.ar(sig,0.25,0.25);
};
~ss.play;
);" ], [ 995.719522, 'joach', "~sin[2] = \\set -> Pbind(\\args, [\\freq], \\octave, 3, \\degree, Pseq([3,3b,3,4], inf), \\dur, 28);" ], [ 986.31750820001, 'kof', "(
~kick.ar(2);
~kick.quant=2;
~kick.fadeTime=0.2;
~kick={
  //         |       |       |       |       |  
  var pat = [1,1,0,0,1,0,0,0,1,1,0,0,1,0,0,0].rotate(1);
  var imp = PulseDivider.kr(~tick.kr,2,~counter.kr);
  var hit = Select.kr(PulseCount.kr(imp)%pat.size,pat);
  var env = EnvGen.ar(Env([0.001,1,0.001],[0.002,2.5],[3,-3],curve:'exp'),imp * hit);
  var sig = SinOsc.ar(50+(env**10*100));
  sig = sig * env;
  Splay.ar(sig,0.75,0.5);
};
~kick.play;
);" ], [ 978.019466, 'joach', "(
~sin[1] = \\set -> QuantEnv(\\amp, 8)
.phase(1, [0.2,1,0.5], [4.55, 4.45], [2,-2], 0, 4)
.phase(2, [0.5,1,0.2], [0.35, 0.65], [2,-2], 0, 1)
.phase(3, [0,0], [0.35], \\lin, 0, 1)
.play([3]);
)" ], [ 975.73446030001, 'kof', "(
~hh.ar(2);
~hh.quant=2;
~hh.fadeTime=1.2;
~hh={
  //         |       |       |       |       |  
  var pat = [1,0,0,0,1,0,0,0,1,0,0,0,1,1,1,1].rotate(3);
  var imp = PulseDivider.kr(~tick.kr,2,~counter.kr);
  var hit = Select.kr(PulseCount.kr(imp)/[1,2,3,4]%pat.size,pat);
  var env = EnvGen.ar(Env([0.001,1,0.001],[0.002,0.25],[3,-3],curve:'exp'),imp * hit);
  var sig = LFNoise2.ar(1600*[1,2,4,8]);
  sig = sig * env;
  Splay.ar(sig,0.75,0.15);
};
~hh.play;
);" ], [ 967.56444880001, 'kof', "(
~hh.ar(2);
~hh.quant=2;
~hh.fadeTime=1.2;
~hh={
  //         |       |       |       |       |  
  var pat = [1,0,0,0,1,0,0,0,1,0,0,0,1,0,0,0].rotate(3);
  var imp = PulseDivider.kr(~tick.kr,2,~counter.kr);
  var hit = Select.kr(PulseCount.kr(imp)/[1,2,3,4]%pat.size,pat);
  var env = EnvGen.ar(Env([0.001,1,0.001],[0.002,0.25],[3,-3],curve:'exp'),imp * hit);
  var sig = LFNoise2.ar(1600*[1,2,4,8]);
  sig = sig * env;
  Splay.ar(sig,0.75,0.15);
};
~hh.play;
);" ], [ 962.94444240001, 'kof', "(
~hh.ar(2);
~hh.quant=2;
~hh.fadeTime=1.2;
~hh={
  //         |       |       |       |       |  
  var pat = [1,0,0,0,1,0,0,0,1,0,0,0,1,0,0,0].rotate(3);
  var imp = PulseDivider.kr(~tick.kr,2,~counter.kr);
  var hit = Select.kr(PulseCount.kr(imp)/[1,2,3,4]%pat.size,pat);
  var env = EnvGen.ar(Env([0.001,1,0.001],[0.002,0.15],[3,-3],curve:'exp'),imp * hit);
  var sig = LFNoise2.ar(1600*[1,2,4,8]);
  sig = sig * env;
  Splay.ar(sig,0.75,0.15);
};
~hh.play;
);" ], [ 956.4344332, 'kof', "(
~hh.ar(2);
~hh.quant=2;
~hh.fadeTime=1.2;
~hh={
  //         |       |       |       |       |  
  var pat = [1,0,0,0,1,0,0,0,1,0,0,0,1,0,0,0].rotate(3);
  var imp = PulseDivider.kr(~tick.kr,2,~counter.kr);
  var hit = Select.kr(PulseCount.kr(imp)/[1,2,3,4]%pat.size,pat);
  var env = EnvGen.ar(Env([0.001,1,0.001],[0.002,0.15],[3,-3],curve:'exp'),imp * hit);
  var sig = LFNoise2.ar(16000!2);
  sig = sig * env;
  Splay.ar(sig,0.75,0.15);
};
~hh.play;
);" ], [ 944.0734159, 'kof', "(
~kick.ar(2);
~kick.quant=2;
~kick.fadeTime=0.2;
~kick={
  //         |       |       |       |       |  
  var pat = [1,1,0,0,1,0,0,0,1,1,0,0,1,0,0,0].rotate(1);
  var imp = PulseDivider.kr(~tick.kr,2,~counter.kr);
  var hit = Select.kr(PulseCount.kr(imp)%pat.size,pat);
  var env = EnvGen.ar(Env([0.001,1,0.001],[0.002,2.5],[3,-3],curve:'exp'),imp * hit);
  var sig = SinOsc.ar(50+(env**100*100));
  sig = sig * env;
  Splay.ar(sig,0.75,0.5);
};
~kick.play;
);" ], [ 937.4934067, 'kof', "(
~ss.ar(2);
~ss.quant=2;
~ss.fadeTime=0.002;
~ss={
  //         |       |       |       |       |  
  var pat = [1,0,0,0,1,0,0,0,1,0,0,0,1,0,0,0].rotate(3);
  var imp = PulseDivider.kr(~tick.kr,2,~counter.kr);
  var hit = Select.kr(PulseCount.kr(imp)/[1,2,3,4]%pat.size,pat);
  var env = EnvGen.ar(Env([0.0001,1,1,0.0001],[0.002,0.05,0.002],[3,1,-3],curve:'exp'),imp * hit);
  var sig = [
  SinOsc.ar(8000),
    LFSaw.ar(4000!2),
    LFNoise2.ar(4000),
    Pulse.ar(4000)
  ];
  sig = Select.ar(PulseCount.kr(imp*hit)%sig.size,sig);
  sig = sig * env;
  //sig = CombN.ar(sig,1/40,1/40,1);
  Splay.ar(sig,0.25,0.25);
};
~ss.play;
);" ], [ 934.61340260001, 'kof', "(
~ss.ar(2);
~ss.quant=2;
~ss.fadeTime=0.002;
~ss={
  //         |       |       |       |       |  
  var pat = [1,0,0,0,1,0,0,0,1,0,0,0,1,0,0,0].rotate(3);
  var imp = PulseDivider.kr(~tick.kr,4,~counter.kr);
  var hit = Select.kr(PulseCount.kr(imp)/[1,2,3,4]%pat.size,pat);
  var env = EnvGen.ar(Env([0.0001,1,1,0.0001],[0.002,0.05,0.002],[3,1,-3],curve:'exp'),imp * hit);
  var sig = [
  SinOsc.ar(8000),
    LFSaw.ar(4000!2),
    LFNoise2.ar(4000),
    Pulse.ar(4000)
  ];
  sig = Select.ar(PulseCount.kr(imp*hit)%sig.size,sig);
  sig = sig * env;
  //sig = CombN.ar(sig,1/40,1/40,1);
  Splay.ar(sig,0.25,0.25);
};
~ss.play;
);" ], [ 918.4033799, 'kof', "(
~ss.ar(2);
~ss.quant=2;
~ss.fadeTime=0.002;
~ss={
  //         |       |       |       |       |  
  var pat = [1,0,0,0,1,0,0,0,1,0,0,0,1,0,0,0].rotate(3);
  var imp = PulseDivider.kr(~tick.kr,1,~counter.kr);
  var hit = Select.kr(PulseCount.kr(imp)/[1,2,3,4]%pat.size,pat);
  var env = EnvGen.ar(Env([0.0001,1,1,0.0001],[0.002,0.05,0.002],[3,1,-3],curve:'exp'),imp * hit);
  var sig = [
  SinOsc.ar(8000),
    LFSaw.ar(4000!2),
    LFNoise2.ar(4000),
    Pulse.ar(4000)
  ];
  sig = Select.ar(PulseCount.kr(imp*hit)%sig.size,sig);
  sig = sig * env;
  //sig = CombN.ar(sig,1/40,1/40,1);
  Splay.ar(sig,0.25,0.25);
};
~ss.play;
);" ], [ 884.5202994, 'joach', "~sin.stop(16);" ], [ 881.4692638, 'joach', "(
~sin[3] = \\set -> QuantEnv(\\fplus, 0.5)
.phase(1, [0,-1240,0], [2.015, 0.11], [8,-8], 0, 4)
.phase(2, [0,-800,0], [4.005, 0.105], [8,-4], 0, 2)
.phase(3, [0,1200,0], [0.005, 0.115], [8,-4], 0, 2)
.play([1,2,1,3]);
)" ], [ 881.12426140001, 'kof', "(
~ss.ar(2);
~ss.quant=2;
~ss.fadeTime=0.002;
~ss={
  //         |       |       |       |       |  
  var pat = [1,0,0,0,1,0,0,0,1,0,0,0,1,0,0,0].rotate(3);
  var imp = PulseDivider.kr(~tick.kr,4,~counter.kr);
  var hit = Select.kr(PulseCount.kr(imp)/[1,2,3,4]%pat.size,pat);
  var env = EnvGen.ar(Env([0.0001,1,0.0001],[0.002,0.15],[3,-3],curve:'exp'),imp * hit);
  var sig = [
  SinOsc.ar(8000),
    LFSaw.ar(4000!2),
    LFNoise2.ar(1600),
    Pulse.ar(4)
  ];
  sig = Select.ar(PulseCount.kr(imp*hit)%sig.size,sig);
  sig = sig * env;
  sig = CombN.ar(sig,1/40,1/40,1);
  Splay.ar(sig,0.25,0.25);
};
~ss.play;
);" ], [ 870.1102162, 'joach', "(
~sin[3] = \\set -> QuantEnv(\\fplus, 0.5)
.phase(1, [0,-1240,0], [2.015, 0.11], [8,-8], 0, 4)
.phase(2, [0,-800,0], [4.005, 0.105], [8,-4], 0, 2)
.phase(3, [0,1200,0], [0.005, 0.115], [8,-4], 0, 2)
.play([3]);
)" ], [ 863.48120360001, 'kof', "(
~hh.ar(2);
~hh.quant=2;
~hh.fadeTime=1.2;
~hh={
  //         |       |       |       |       |  
  var pat = [1,0,0,0,1,0,0,0,1,0,0,0,1,0,0,0].rotate(3);
  var imp = PulseDivider.kr(~tick.kr,4,~counter.kr);
  var hit = Select.kr(PulseCount.kr(imp)/[1,2,3,4]%pat.size,pat);
  var env = EnvGen.ar(Env([0.001,1,0.001],[0.002,0.15],[3,-3],curve:'exp'),imp * hit);
  var sig = LFNoise2.ar(16000!2);
  sig = sig * env;
  Splay.ar(sig,0.75,0.15);
};
~hh.play;
);" ], [ 862.57417240001, 'joach', "(
~sin[3] = \\set -> QuantEnv(\\fplus, 0.5)
.phase(1, [0,-1240,0], [2.015, 0.11], [8,-8], 0, 4)
.phase(2, [0,-800,0], [4.005, 0.105], [8,-4], 0, 2)
.phase(3, [0,200,0], [0.005, 0.115], [8,-4], 0, 2)
.play([3]);
)" ], [ 859.32716470001, 'kof', "(
~hh.ar(2);
~hh.quant=2;
~hh.fadeTime=1.2;
~hh={
  //         |       |       |       |       |  
  var pat = [1,0,0,0,1,0,0,0,1,0,0,0,1,0,0,0].rotate(3);
  var imp = PulseDivider.kr(~tick.kr,1,~counter.kr);
  var hit = Select.kr(PulseCount.kr(imp)/[1,2,3,4]%pat.size,pat);
  var env = EnvGen.ar(Env([0.001,1,0.001],[0.002,0.15],[3,-3],curve:'exp'),imp * hit);
  var sig = LFNoise2.ar(16000!2);
  sig = sig * env;
  Splay.ar(sig,0.75,0.15);
};
~hh.play;
);" ], [ 846.78714710001, 'kof', "~mel.stop(4);" ], [ 843.83714300001, 'kof', "(
~kick.ar(2);
~kick.quant=2;
~kick.fadeTime=0.2;
~kick={
  //         |       |       |       |       |  
  var pat = [1,1,0,0,1,0,0,0,1,1,0,0,1,0,0,0].rotate(1);
  var imp = PulseDivider.kr(~tick.kr,4,~counter.kr);
  var hit = Select.kr(PulseCount.kr(imp)%pat.size,pat);
  var env = EnvGen.ar(Env([0.001,1,0.001],[0.002,2.5],[3,-3],curve:'exp'),imp * hit);
  var sig = SinOsc.ar(50+(env**100*100));
  sig = sig * env;
  Splay.ar(sig,0.75,0.5);
};
~kick.play;
);" ], [ 836.32713250001, 'kof', "(
~mel.ar(2);
~mel.quant=2;
~mel.fadeTime=4.2;
~mel={
  //         |       |       |       |       |  
  var pat = [1,0,0,0,1,0,0,0,1,0,0,0,1,0,1,0].rotate(3);
  var imp = PulseDivider.kr(~tick.kr,1,~counter.kr);
  var hit = Select.kr(PulseCount.kr(imp)/[1,2,3,4,5,6,7,8]%pat.size,pat);
  var env = EnvGen.ar(Env([0.001,1,0.001],[0.002,0.5]/4,[3,-3],curve:'exp'),imp * hit);
  var sig = LFSaw.ar(60.midicps*16/([1,1.125,1.5,2,4,1.125].scramble*2pi),SinOsc.ar(1/4/[1,2,3,4]).range(-pi,pi));
  sig = sig * env;
  Splay.ar(sig,0.15,0.25);
};
~mel.play;
);" ], [ 833.18712810001, 'kof', "(
~mel.ar(2);
~mel.quant=2;
~mel.fadeTime=4.2;
~mel={
  //         |       |       |       |       |  
  var pat = [1,0,0,0,1,0,0,0,1,0,0,0,1,0,1,0].rotate(3);
  var imp = PulseDivider.kr(~tick.kr,1,~counter.kr);
  var hit = Select.kr(PulseCount.kr(imp)/[1,2,3,4,5,6,7,8]%pat.size,pat);
  var env = EnvGen.ar(Env([0.001,1,0.001],[0.002,0.5]/4,[3,-3],curve:'exp'),imp * hit);
  var sig = LFSaw.ar(60.midicps*16/([1,1.125,1.5,2,4,1.125].scramble*1.5pi),SinOsc.ar(1/4/[1,2,3,4]).range(-pi,pi));
  sig = sig * env;
  Splay.ar(sig,0.15,0.25);
};
~mel.play;
);" ], [ 828.9971222, 'kof', "(
~mel.ar(2);
~mel.quant=2;
~mel.fadeTime=4.2;
~mel={
  //         |       |       |       |       |  
  var pat = [1,0,0,0,1,0,0,0,1,0,0,0,1,0,1,0].rotate(3);
  var imp = PulseDivider.kr(~tick.kr,1,~counter.kr);
  var hit = Select.kr(PulseCount.kr(imp)/[1,2,3,4,5,6,7,8]%pat.size,pat);
  var env = EnvGen.ar(Env([0.001,1,0.001],[0.002,0.5]/4,[3,-3],curve:'exp'),imp * hit);
  var sig = LFSaw.ar(60.midicps*16/([1,1.125,1.5,2,4,1.125].scramble*1.25pi),SinOsc.ar(1/4/[1,2,3,4]).range(-pi,pi));
  sig = sig * env;
  Splay.ar(sig,0.15,0.25);
};
~mel.play;
);" ], [ 824.00509050001, 'kof', "(
~mel.ar(2);
~mel.quant=2;
~mel.fadeTime=4.2;
~mel={
  //         |       |       |       |       |  
  var pat = [1,0,0,0,1,0,0,0,1,0,0,0,1,0,1,0].rotate(3);
  var imp = PulseDivider.kr(~tick.kr,1,~counter.kr);
  var hit = Select.kr(PulseCount.kr(imp)/[1,2,3,4,5,6,7,8]%pat.size,pat);
  var env = EnvGen.ar(Env([0.001,1,0.001],[0.002,0.5]/4,[3,-3],curve:'exp'),imp * hit);
  var sig = LFSaw.ar(60.midicps*8/([1,1.125,1.5,2,4,1.125].scramble*1.25pi),SinOsc.ar(1/4/[1,2,3,4]).range(-pi,pi));
  sig = sig * env;
  Splay.ar(sig,0.15,0.25);
};
~mel.play;
);" ], [ 823.80808100001, 'joach', "(
~sin[3] = \\set -> QuantEnv(\\fplus, 0.5)
.phase(1, [0,-1240,0], [2.015, 0.11], [8,-8], 0, 4)
.phase(2, [0,-800,0], [4.005, 0.105], [8,-4], 0, 2)
.phase(3, [80,200,80], [0.105, 0.005], [8,-4], 0, 2)
.play([1,2,1,3]);
)" ], [ 818.5480736, 'kof', "(
~mel.ar(2);
~mel.quant=2;
~mel.fadeTime=4.2;
~mel={
  //         |       |       |       |       |  
  var pat = [1,0,0,0,1,0,0,0,1,0,0,0,1,0,1,0].rotate(3);
  var imp = PulseDivider.kr(~tick.kr,1,~counter.kr);
  var hit = Select.kr(PulseCount.kr(imp)/[1,2,3,4,5,6,7,8]%pat.size,pat);
  var env = EnvGen.ar(Env([0.001,1,0.001],[0.002,0.5]/4,[3,-3],curve:'exp'),imp * hit);
  var sig = LFSaw.ar(60.midicps*8/([1,1.125,1.5,2,4,1.125].scramble*1.5pi),SinOsc.ar(1/4/[1,2,3,4]).range(-pi,pi));
  sig = sig * env;
  Splay.ar(sig,0.15,0.25);
};
~mel.play;
);" ], [ 816.69903870001, 'joach', "(
~sin[3] = \\set -> QuantEnv(\\fplus, 0.5)
.phase(1, [0,-1240,0], [2.015, 0.11], [8,-8], 0, 4)
.phase(2, [0,800,0], [0.005, 0.105], [8,-4], 0, 2)
.phase(3, [80,200,80], [0.105, 0.005], [8,-4], 0, 2)
.play([1,2,1,3]);
)" ], [ 809.4280268, 'kof', "(
~mel.ar(2);
~mel.quant=2;
~mel.fadeTime=4.2;
~mel={
  //         |       |       |       |       |  
  var pat = [1,0,0,0,1,0,0,0,1,0,0,0,1,0,1,0].rotate(3);
  var imp = PulseDivider.kr(~tick.kr,1,~counter.kr);
  var hit = Select.kr(PulseCount.kr(imp)/[1,2,3,4,5,6,7,8]%pat.size,pat);
  var env = EnvGen.ar(Env([0.001,1,0.001],[0.002,0.5]/4,[3,-3],curve:'exp'),imp * hit);
  var sig = LFSaw.ar(60.midicps*16/([1,1.125,1.5,2,4,1.125].scramble*1.5pi),SinOsc.ar(1/4/[1,2,3,4]).range(-pi,pi));
  sig = sig * env;
  Splay.ar(sig,0.15,0.25);
};
~mel.play;
);" ], [ 806.8480232, 'kof', "(
~mel.ar(2);
~mel.quant=2;
~mel.fadeTime=4.2;
~mel={
  //         |       |       |       |       |  
  var pat = [1,0,0,0,1,0,0,0,1,0,0,0,1,0,1,0].rotate(3);
  var imp = PulseDivider.kr(~tick.kr,2,~counter.kr);
  var hit = Select.kr(PulseCount.kr(imp)/[1,2,3,4,5,6,7,8]%pat.size,pat);
  var env = EnvGen.ar(Env([0.001,1,0.001],[0.002,0.5]/4,[3,-3],curve:'exp'),imp * hit);
  var sig = LFSaw.ar(60.midicps*16/([1,1.125,1.5,2,4,1.125].scramble*1.5pi),SinOsc.ar(1/4/[1,2,3,4]).range(-pi,pi));
  sig = sig * env;
  Splay.ar(sig,0.15,0.25);
};
~mel.play;
);" ], [ 800.9739824, 'joach', "(
~sin[3] = \\set -> QuantEnv(\\fplus, 0.5)
.phase(1, [0,-1240,0], [1.015, 0.11], [8,-8], 0, 4)
.phase(2, [0,800,0], [0.005, 0.105], [8,-4], 0, 2)
.phase(3, [80,200,80], [0.105, 0.005], [8,-4], 0, 2)
.play([1,2,1,3]);
)" ], [ 798.5249784, 'kof', "(
~mel.ar(2);
~mel.quant=2;
~mel.fadeTime=4.2;
~mel={
  //         |       |       |       |       |  
  var pat = [1,0,0,0,1,0,0,0,1,0,0,0,1,0,1,0].rotate(3);
  var imp = PulseDivider.kr(~tick.kr,2,~counter.kr);
  var hit = Select.kr(PulseCount.kr(imp)/[1,2,3,4,5,6,7,8]%pat.size,pat);
  var env = EnvGen.ar(Env([0.001,1,0.001],[0.002,0.5]/4,[3,-3],curve:'exp'),imp * hit);
  var sig = LFSaw.ar(60.midicps*16/([1,1.125,1.5,2,4,1.125].scramble*0.5pi),SinOsc.ar(1/4/[1,2,3,4]).range(-pi,pi));
  sig = sig * env;
  Splay.ar(sig,0.15,0.25);
};
~mel.play;
);" ], [ 790.48493590001, 'joach', "(
~sin[3] = \\set -> QuantEnv(\\fplus, 0.5)
.phase(1, [0,-1240,0], [1.015, 0.11], [8,-8], 0, 4)
.phase(2, [0,8000,0], [0.005, 0.105], [8,-4], 0, 2)
.phase(3, [80,200,80], [0.105, 0.005], [8,-4], 0, 2)
.play([1,2,1,3]);
)" ], [ 787.2449286, 'kof', "(
~mel.ar(2);
~mel.quant=2;
~mel.fadeTime=4.2;
~mel={
  //         |       |       |       |       |  
  var pat = [1,0,0,0,1,0,0,0,1,0,0,0,1,0,1,0].rotate(3);
  var imp = PulseDivider.kr(~tick.kr,2,~counter.kr);
  var hit = Select.kr(PulseCount.kr(imp)/[1,2,3,4,5,6,7,8]%pat.size,pat);
  var env = EnvGen.ar(Env([0.001,1,0.001],[0.002,0.5]/4,[3,-3],curve:'exp'),imp * hit);
  var sig = LFSaw.ar(60.midicps*16/([1,1.125,1.5,2,4,1.125].scramble*pi),SinOsc.ar(1/4/[1,2,3,4]).range(-pi,pi));
  sig = sig * env;
  Splay.ar(sig,0.15,0.25);
};
~mel.play;
);" ], [ 782.40288930001, 'joach', "~sin.set(\\lpf_freq, 4200);" ], [ 780.5508543, 'joach', "~sin[5] = \\filter -> {|in| LPF.ar(in, \\lpf_freq.kr(800,18)) };" ], [ 777.5918491, 'kof', "(
~kick.ar(2);
~kick.quant=2;
~kick={
  //         |       |       |       |       |  
  var pat = [1,1,0,0,1,0,0,0,1,1,0,0,1,0,0,0].rotate(1);
  var imp = PulseDivider.kr(~tick.kr,2,~counter.kr);
  var hit = Select.kr(PulseCount.kr(imp)%pat.size,pat);
  var env = EnvGen.ar(Env([0.001,1,0.001],[0.002,2.5],[3,-3],curve:'exp'),imp * hit);
  var sig = SinOsc.ar(50+(env**100*100));
  sig = sig * env;
  Splay.ar(sig,0.75,0.5);
};
~kick.play;
);" ], [ 770.33983880001, 'kof', "(
~kick.ar(2);
~kick.quant=2;
~kick.fadeTime=0.2;
~kick={
  //         |       |       |       |       |  
  var pat = [1,1,0,0,1,0,0,0,1,1,0,0,1,0,0,0].rotate(1);
  var imp = PulseDivider.kr(~tick.kr,1,~counter.kr);
  var hit = Select.kr(PulseCount.kr(imp)%pat.size,pat);
  var env = EnvGen.ar(Env([0.001,1,0.001],[0.002,2.5],[3,-3],curve:'exp'),imp * hit);
  var sig = SinOsc.ar(50+(env**100*100));
  sig = sig * env;
  Splay.ar(sig,0.75,0.5);
};
~kick.play;
);" ], [ 765.5078319, 'kof', "(
~kick.ar(2);
~kick.quant=2;
~kick.fadeTime=0.2;
~kick={
  //         |       |       |       |       |  
  var pat = [1,1,0,0,1,0,0,0,1,1,0,0,1,0,0,0].rotate(1);
  var imp = PulseDivider.kr(~tick.kr,2,~counter.kr);
  var hit = Select.kr(PulseCount.kr(imp)%pat.size,pat);
  var env = EnvGen.ar(Env([0.001,1,0.001],[0.002,2.5],[3,-3],curve:'exp'),imp * hit);
  var sig = SinOsc.ar(50+(env**100*100));
  sig = sig * env;
  Splay.ar(sig,0.75,0.5);
};
~kick.play;
);" ], [ 759.4708203, 'kof', "(
~mel.ar(2);
~mel.quant=2;
~mel.fadeTime=4.2;
~mel={
  //         |       |       |       |       |  
  var pat = [1,0,0,0,1,0,0,0,1,0,0,0,1,0,1,0].rotate(3);
  var imp = PulseDivider.kr(~tick.kr,2,~counter.kr);
  var hit = Select.kr(PulseCount.kr(imp)/[1,2,3,4,5,6,7,8]%pat.size,pat);
  var env = EnvGen.ar(Env([0.001,1,0.001],[0.002,0.5]/4,[3,-3],curve:'exp'),imp * hit);
  var sig = LFSaw.ar(60.midicps*16/([1,1.125,1.5,2,4,1.125].scramble*2pi),SinOsc.ar(1/4/[1,2,3,4]).range(-pi,pi));
  sig = sig * env;
  Splay.ar(sig,0.15,0.25);
};
~mel.play;
);" ], [ 758.92678970001, 'joach', "~sin[3] = nil" ], [ 753.2477489, 'joach', "~sin[2] = nil" ], [ 748.6047423, 'kof', "(
~ss.ar(2);
~ss.quant=2;
~ss.fadeTime=0.002;
~ss={
  //         |       |       |       |       |  
  var pat = [1,0,0,0,1,0,0,0,1,0,0,0,1,0,0,0].rotate(3);
  var imp = PulseDivider.kr(~tick.kr,4,~counter.kr);
  var hit = Select.kr(PulseCount.kr(imp)/[1,2,3,4]%pat.size,pat);
  var env = EnvGen.ar(Env([0.0001,1,0.0001],[0.002,0.15],[3,-3],curve:'exp'),imp * hit);
  var sig = [
  SinOsc.ar(50!2),
    LFSaw.ar(4000!2),
    LFNoise2.ar(1600),
    Pulse.ar(4)
  ];
  sig = Select.ar(PulseCount.kr(imp*hit)%sig.size,sig);
  sig = sig * env;
  sig = CombN.ar(sig,1/40,1/40,1);
  Splay.ar(sig,0.25,0.25);
};
~ss.play;
);" ], [ 744.9947372, 'kof', "(
~ss.ar(2);
~ss.quant=2;
~ss.fadeTime=0.002;
~ss={
  //         |       |       |       |       |  
  var pat = [1,0,0,0,1,0,0,0,1,0,0,0,1,0,0,0].rotate(3);
  var imp = PulseDivider.kr(~tick.kr,4,~counter.kr);
  var hit = Select.kr(PulseCount.kr(imp)/[1,2,3,4]%pat.size,pat);
  var env = EnvGen.ar(Env([0.0001,1,0.0001],[0.002,0.15],[3,-3],curve:'exp'),imp * hit);
  var sig = [
  SinOsc.ar(50!2),
    LFSaw.ar(4000!2),
    LFNoise2.ar(1600),
    Pulse.ar(4)
  ];
  sig = Select.ar(PulseCount.kr(imp*hit)%sig.size,sig);
  sig = sig * env;
  sig = CombN.ar(sig,1/40,1/40,2);
  Splay.ar(sig,0.25,0.25);
};
~ss.play;
);" ], [ 739.1636994, 'joach', "(
~sin[3] = \\set -> QuantEnv(\\fplus, 0.5)
.phase(1, [0,-1240,0], [1.015, 0.11], [8,-8], 0, 4)
.phase(2, [0,8000,0], [0.005, 0.105], [8,-4], 0, 2)
.phase(3, [80,200,80], [0.105, 0.005], [8,-4], 0, 2)
.play([1,2,1,3]);
)" ], [ 738.98069560001, 'kof', "(
~ss.ar(2);
~ss.quant=2;
~ss.fadeTime=0.002;
~ss={
  //         |       |       |       |       |  
  var pat = [1,0,0,0,1,0,0,0,1,0,0,0,1,0,0,0].rotate(3);
  var imp = PulseDivider.kr(~tick.kr,4,~counter.kr);
  var hit = Select.kr(PulseCount.kr(imp)/[1,2,3,4]%pat.size,pat);
  var env = EnvGen.ar(Env([0.0001,1,0.0001],[0.002,0.15],[3,-3],curve:'exp'),imp * hit);
  var sig = [
  SinOsc.ar(50!2),
    LFSaw.ar(4000!2),
    LFNoise2.ar(1600),
    Pulse.ar(4)
  ];
  sig = Select.ar(PulseCount.kr(imp*hit)%sig.size,sig);
  sig = sig * env;
  sig = CombN.ar(sig,1/40,1/40/[1,1.5,1.25,1.125],2);
  Splay.ar(sig,0.25,0.25);
};
~ss.play;
);" ], [ 732.790687, 'kof', "  p.clock.tempo_(8/3);" ], [ 724.40764210001, 'joach', "(
~sin[3] = \\set -> QuantEnv(\\fplus, 0.5)
.phase(1, [0,-1240,0], [1.015, 0.11], [8,-8], 0, 4)
.phase(2, [0,8000,0], [0.005, 0.105], [8,-4], 0, 2)
.phase(3, [80,20,80], [0.105, 0.005], [8,-4], 0, 2)
.play([1,2]);
)" ], [ 714.6566284, 'kof', "(
  p.clock.tempo_(4/3);
  
  ~offset = (0..7)/8;
  
  ~tick.quant = 1;
  ~tick = {Mix(Impulse.kr( ~tempo / 2 , ~offset ))};
  
  ~counter = {PulseCount.kr(~tick.kr)};
);" ], [ 706.3895841, 'joach', "(
~sin[3] = \\set -> QuantEnv(\\fplus, 0.5)
.phase(1, [0,-1240,0], [1.015, 0.11], [8,-8], 0, 4)
.phase(2, [0,800,0], [0.005, 0.105], [8,-4], 0, 2)
.phase(3, [80,20,80], [0.105, 0.005], [8,-4], 0, 2)
.play([1,2]);
)" ], [ 690.4395316, 'joach', "~sin[2] = \\set -> Pbind(\\args, [\\freq], \\octave, 3, \\degree, Pseq([3,4,3,7], inf), \\dur, 4);" ], [ 681.9214869, 'joach', "~sin.set(\\lpf_freq, 1200);" ], [ 678.97544790001, 'joach', "(
~sin[1] = \\set -> QuantEnv(\\amp, 8)
.phase(1, [0.2,1,0.5], [0.55, 4.45], [2,-2], 0, 4)
.phase(2, [0.5,1,0.2], [0.35, 0.65], [2,-2], 0, 1)
.play([1,2]);
)" ], [ 671.78943410001, 'kof', "(
~ss.ar(2);
~ss.quant=2;
~ss.fadeTime=0.002;
~ss={
  //         |       |       |       |       |  
  var pat = [1,0,0,0,1,0,0,0,1,0,0,0,1,0,0,0].rotate(3);
  var imp = PulseDivider.kr(~tick.kr,1,~counter.kr);
  var hit = Select.kr(PulseCount.kr(imp)/[1,2,3,4]%pat.size,pat);
  var env = EnvGen.ar(Env([0.0001,1,0.0001],[0.002,0.15],[3,-3],curve:'exp'),imp * hit);
  var sig = [
  SinOsc.ar(50!2),
    LFSaw.ar(4000!2),
    LFNoise2.ar(1600),
    Pulse.ar(4)
  ];
  sig = Select.ar(PulseCount.kr(imp*hit)%sig.size,sig);
  sig = sig * env;
  sig = CombN.ar(sig,1/40,1/40/[1,1.5,1.25,1.125],2);
  Splay.ar(sig,0.25,0.25);
};
~ss.play;
);" ], [ 669.9153983, 'joach', "(
~sin[1] = \\set -> QuantEnv(\\amp, 8)
.phase(1, [0.2,1,0.2], [0.55, 4.45], [2,-2], 0, 4)
.phase(2, [0.5,1,0.5], [0.35, 0.65], [2,-2], 0, 1)
.play([1,2]);
)" ], [ 660.90538570001, 'kof', "(
~ss.ar(2);
~ss.quant=2;
~ss.fadeTime=0.002;
~ss={
  //         |       |       |       |       |  
  var pat = [1,0,0,0,1,0,0,0,1,0,0,0,1,0,0,0].rotate(3);
  var imp = PulseDivider.kr(~tick.kr,1,~counter.kr);
  var hit = Select.kr(PulseCount.kr(imp)/[1,2,3,4]%pat.size,pat);
  var env = EnvGen.ar(Env([0.0001,1,0.0001],[0.002,0.15],[3,-3],curve:'exp'),imp * hit);
  var sig = [
  SinOsc.ar(50!2),
    LFSaw.ar(4000!2),
    LFNoise2.ar(1600),
    Pulse.ar(4)
  ];
  sig = Select.ar(PulseCount.kr(imp*hit)%sig.size,sig);
  sig = sig * env;
  sig = CombN.ar(sig,1/40,1/40,2);
  Splay.ar(sig,0.25,0.25);
};
~ss.play;
);" ], [ 659.76235100001, 'joach', "(
~sin[0] = {
	var osc = SinOsc.ar(( \\freq.kr(60) + \\fplus.kr(0) ), mul: 1, add: 0);
	var noise = BrownNoise.ar(\\noise.kr(0), (1 - \\noise.kr(0))) * Saw.ar(60);
	var sig = osc * noise;
	Pan2.ar( sig * \\amp.kr(0), \\pan.kr(0) );
};
)" ], [ 651.91234010001, 'kof', "(
~ss.ar(2);
~ss.quant=2;
~ss.fadeTime=0.002;
~ss={
  //         |       |       |       |       |  
  var pat = [1,0,0,0,1,0,0,0,1,0,0,0,1,0,0,0].rotate(3);
  var imp = PulseDivider.kr(~tick.kr,1,~counter.kr);
  var hit = Select.kr(PulseCount.kr(imp)/[1,2,3,4]%pat.size,pat);
  var env = EnvGen.ar(Env([0.0001,1,0.0001],[0.002,0.15],[3,-3],curve:'exp'),imp * hit);
  var sig = [
  SinOsc.ar(50!2),
    LFSaw.ar(4000!2),
    LFNoise2.ar(1600),
    Pulse.ar(4)
  ];
  sig = Select.ar(PulseCount.kr(imp*hit)%sig.size,sig);
  sig = sig * env;
  sig = CombN.ar(sig,1/40,1/40/1.5,2);
  Splay.ar(sig,0.25,0.25);
};
~ss.play;
);" ], [ 644.60232980001, 'kof', "(
~ss.ar(2);
~ss.quant=2;
~ss.fadeTime=0.002;
~ss={
  //         |       |       |       |       |  
  var pat = [1,0,0,0,1,0,0,0,1,0,0,0,1,0,0,0].rotate(3);
  var imp = PulseDivider.kr(~tick.kr,1,~counter.kr);
  var hit = Select.kr(PulseCount.kr(imp)/[1,2,3,4]%pat.size,pat);
  var env = EnvGen.ar(Env([0.0001,1,0.0001],[0.002,0.15],[3,-3],curve:'exp'),imp * hit);
  var sig = [
  SinOsc.ar(50!2),
    LFSaw.ar(4000!2),
    LFNoise2.ar(1600),
    Pulse.ar(4)
  ];
  sig = Select.ar(PulseCount.kr(imp*hit)%sig.size,sig);
  sig = sig * env;
  sig = CombN.ar(sig,1/40,1/40/1.125,2);
  Splay.ar(sig,0.25,0.25);
};
~ss.play;
);" ], [ 637.3872865, 'joach', "(
~sin[4] = \\set -> QuantEnv(\\noise, 2)
.phase(1, [0,0.3,0], [0.05, 0.95], [2,-2], 0, 4)
.phase(2, [0.3,1,0.3], [0.35, 0.65], [2,-2], 0, 1)
.play([1,2]);
)" ], [ 636.55228450001, 'kof', "(
~ss.ar(2);
~ss.quant=2;
~ss={
  //         |       |       |       |       |  
  var pat = [1,0,0,0,1,0,0,0,1,0,0,0,1,0,0,0].rotate(3);
  var imp = PulseDivider.kr(~tick.kr,1,~counter.kr);
  var hit = Select.kr(PulseCount.kr(imp)/[1,2,3,4]%pat.size,pat);
  var env = EnvGen.ar(Env([0.0001,1,0.0001],[0.002,0.15],[3,-3],curve:'exp'),imp * hit);
  var sig = [
  SinOsc.ar(50!2),
    LFSaw.ar(4000!2),
    LFNoise2.ar(1600),
    Pulse.ar(4)
  ];
  sig = Select.ar(PulseCount.kr(imp*hit)%sig.size,sig);
  sig = sig * env;
  sig = CombN.ar(sig,1/40,1/40/1.25,2);
  Splay.ar(sig,0.25,0.25);
};
~ss.play;
);" ], [ 629.052274, 'kof', "(
~ss.ar(2);
~ss.quant=2;
~ss.fadeTime=0.002;
~ss={
  //         |       |       |       |       |  
  var pat = [1,0,0,0,1,0,0,0,1,0,0,0,1,0,0,0].rotate(3);
  var imp = PulseDivider.kr(~tick.kr,1,~counter.kr);
  var hit = Select.kr(PulseCount.kr(imp)/[1,2,3,4]%pat.size,pat);
  var env = EnvGen.ar(Env([0.0001,1,0.0001],[0.002,0.15],[3,-3],curve:'exp'),imp * hit);
  var sig = [
  SinOsc.ar(50!2),
    LFSaw.ar(4000!2),
    LFNoise2.ar(1600),
    Pulse.ar(4)
  ];
  sig = Select.ar(PulseCount.kr(imp*hit)%sig.size,sig);
  sig = sig * env;
  sig = CombN.ar(sig,1/40,1/40/1.25,1);
  Splay.ar(sig,0.25,0.25);
};
~ss.play;
);" ], [ 620.76226240001, 'kof', "(
~ss.ar(2);
~ss.quant=2;
~ss.fadeTime=0.002;
~ss={
  //         |       |       |       |       |  
  var pat = [1,0,0,0,1,0,0,0,1,0,0,0,1,0,0,0].rotate(3);
  var imp = PulseDivider.kr(~tick.kr,1,~counter.kr);
  var hit = Select.kr(PulseCount.kr(imp)/[1,2,3,4]%pat.size,pat);
  var env = EnvGen.ar(Env([0.0001,1,0.0001],[0.002,0.15],[3,-3],curve:'exp'),imp * hit);
  var sig = [
  SinOsc.ar(50!2),
    LFSaw.ar(4000!2),
    LFNoise2.ar(1600),
    Pulse.ar(4)
  ];
  sig = Select.ar(PulseCount.kr(imp*hit)%sig.size,sig);
  sig = sig * env;
  sig = CombN.ar(sig,1/40,1/40/1.5,1);
  Splay.ar(sig,0.25,0.25);
};
~ss.play;
);" ], [ 612.9272182, 'joach', "(
~sin[3] = \\set -> QuantEnv(\\fplus, 0.5)
.phase(1, [0,-1240,0], [0.015, 0.11], [8,-8], 0, 4)
.phase(2, [0,800,0], [0.005, 0.105], [8,-4], 0, 2)
.phase(3, [80,20,80], [0.105, 0.005], [8,-4], 0, 2)
.play([1,2]);
)" ], [ 588.69015380001, 'joach', "(
~sin[3] = \\set -> QuantEnv(\\fplus, 0.5)
.phase(1, [0,-1240,0], [0.015, 0.11], [8,-8], 0, 4)
.phase(2, [0,800,0], [0.005, 0.105], [8,-4], 0, 2)
.phase(3, [80,20,80], [0.105, 0.005], [8,-4], 0, 2)
.play([1]);
)" ], [ 584.7501126, 'joach', "~sin.play(vol: 0.5, fadeTime: 18);" ], [ 576.6461004, 'kof', "(
~ss.ar(2);
~ss.quant=2;
~ss.fadeTime=0.2;
~ss={
  //         |       |       |       |       |  
  var pat = [1,0,0,0,1,0,0,0,1,0,0,0,1,0,0,0].rotate(3);
  var imp = PulseDivider.kr(~tick.kr,1,~counter.kr);
  var hit = Select.kr(PulseCount.kr(imp)/[1,2,3,4]%pat.size,pat);
  var env = EnvGen.ar(Env([0.0001,1,0.0001],[0.002,0.15],[3,-3],curve:'exp'),imp * hit);
  var sig = [
  SinOsc.ar(50!2),
    LFSaw.ar(4000!2),
    LFNoise2.ar(1600),
    Pulse.ar(4)
  ];
  sig = Select.ar(PulseCount.kr(imp*hit)%sig.size,sig);
  sig = sig * env;
  sig = CombN.ar(sig,1/40,1/40,1);
  Splay.ar(sig,0.25,0.25);
};
~ss.play;
);" ], [ 563.98608270001, 'kof', "(
~ss.ar(2);
~ss.quant=2;
~ss.fadeTime=0.2;
~ss={
  //         |       |       |       |       |  
  var pat = [1,0,0,0,1,0,0,0,1,0,0,0,1,0,0,0].rotate(3);
  var imp = PulseDivider.kr(~tick.kr,2,~counter.kr);
  var hit = Select.kr(PulseCount.kr(imp)/[1,2,3,4]%pat.size,pat);
  var env = EnvGen.ar(Env([0.0001,1,0.0001],[0.002,0.15],[3,-3],curve:'exp'),imp * hit);
  var sig = [
  SinOsc.ar(50!2),
    LFSaw.ar(4000!2),
    LFNoise2.ar(1600),
    Pulse.ar(4)
  ];
  sig = Select.ar(PulseCount.kr(imp*hit)%sig.size,sig);
  sig = sig * env;
  sig = CombN.ar(sig,1/40,1/40,8);
  Splay.ar(sig,0.25,0.25);
};
~ss.play;
);" ], [ 555.92906710001, 'kof', "(
~ss.ar(2);
~ss.quant=2;
~ss.fadeTime=0.2;
~ss={
  //         |       |       |       |       |  
  var pat = [1,0,0,0,1,0,0,0,1,0,0,0,1,0,0,0].rotate(3);
  var imp = PulseDivider.kr(~tick.kr,2,~counter.kr);
  var hit = Select.kr(PulseCount.kr(imp)/[1,2,3,4]%pat.size,pat);
  var env = EnvGen.ar(Env([0.0001,1,0.0001],[0.002,0.15],[3,-3],curve:'exp'),imp * hit);
  var sig = [
  SinOsc.ar(50!2),
    LFSaw.ar(4000!2),
    LFNoise2.ar(1600),
    Pulse.ar(4)
  ];
  sig = Select.ar(PulseCount.kr(imp*hit)%sig.size,sig);
  sig = sig * env;
  sig = CombN.ar(sig,1/40,1/40,8);
  Splay.ar(sig,0.25,0.5);
};
~ss.play;
);" ], [ 555.4920421, 'joach', "(
~sin[3] = \\set -> QuantEnv(\\fplus, 0.5)
.phase(1, [0,-240,0], [0.015, 0.11], [8,-8], 0, 4)
.phase(2, [0,800,0], [0.005, 0.105], [8,-4], 0, 2)
.phase(3, [80,20,80], [0.105, 0.005], [8,-4], 0, 2)
.play([1]);
)" ], [ 551.72303240001, 'kof', "(
~ss.ar(2);
~ss.quant=2;
~ss.fadeTime=0.2;
~ss={
  //         |       |       |       |       |  
  var pat = [1,0,0,0,1,0,0,0,1,0,0,0,1,0,0,0].rotate(3);
  var imp = PulseDivider.kr(~tick.kr,2,~counter.kr);
  var hit = Select.kr(PulseCount.kr(imp)/[1,2,3,4]%pat.size,pat);
  var env = EnvGen.ar(Env([0.0001,1,0.0001],[0.002,0.15],[3,-3],curve:'exp'),imp * hit);
  var sig = [
  SinOsc.ar(50!2),
    LFSaw.ar(4000!2),
    LFNoise2.ar(1600),
    Pulse.ar(4)
  ];
  sig = Select.ar(PulseCount.kr(imp*hit)%sig.size,sig);
  sig = sig * env;
  sig = CombN.ar(sig,1/4,1/4,8);
  Splay.ar(sig,0.25,0.5);
};
~ss.play;
);" ], [ 546.9830258, 'kof', "(
~ss.ar(2);
~ss.quant=2;
~ss.fadeTime=0.2;
~ss={
  //         |       |       |       |       |  
  var pat = [1,0,0,0,1,0,0,0,1,0,0,0,1,0,0,0].rotate(3);
  var imp = PulseDivider.kr(~tick.kr,2,~counter.kr);
  var hit = Select.kr(PulseCount.kr(imp)/[1,2,3,4]%pat.size,pat);
  var env = EnvGen.ar(Env([0.0001,1,0.0001],[0.002,0.15],[3,-3],curve:'exp'),imp * hit);
  var sig = [
  SinOsc.ar(50!2),
    LFSaw.ar(4000!2),
    LFNoise2.ar(1600),
    Pulse.ar(4)
  ];
  sig = Select.ar(PulseCount.kr(imp*hit)%sig.size,sig);
  sig = sig * env;
  sig = CombN.ar(sig,1/4,1/4,8);
  Splay.ar(sig,0.75,0.5);
};
~ss.play;
);" ], [ 538.37301380001, 'kof', "(
~ss.ar(2);
~ss.quant=2;
~ss.fadeTime=0.2;
~ss={
  //         |       |       |       |       |  
  var pat = [1,0,0,0,1,0,0,0,1,0,0,0,1,0,0,0].rotate(3);
  var imp = PulseDivider.kr(~tick.kr,2,~counter.kr);
  var hit = Select.kr(PulseCount.kr(imp)%pat.size,pat);
  var env = EnvGen.ar(Env([0.0001,1,0.0001],[0.002,0.15],[3,-3],curve:'exp'),imp * hit);
  var sig = [
  SinOsc.ar(50!2),
    LFSaw.ar(4000!2),
    LFNoise2.ar(1600),
    Pulse.ar(4)
  ];
  sig = Select.ar(PulseCount.kr(imp*hit)%sig.size,sig);
  sig = sig * env;
  sig = CombN.ar(sig,1/4,1/4,8);
  Splay.ar(sig,0.75,0.5);
};
~ss.play;
);" ], [ 534.8459783, 'joach', "~sin.play(vol: 0.3, fadeTime: 8);" ], [ 532.42597160001, 'kof', "(
~ss.ar(2);
~ss.quant=2;
~ss.fadeTime=0.2;
~ss={
  //         |       |       |       |       |  
  var pat = [1,0,0,0,1,0,0,0,1,0,0,0,1,0,0,0].rotate(3);
  var imp = PulseDivider.kr(~tick.kr,2,~counter.kr);
  var hit = Select.kr(PulseCount.kr(imp)%pat.size,pat);
  var env = EnvGen.ar(Env([0.0001,1,0.0001],[0.002,0.05],[3,-3],curve:'exp'),imp * hit);
  var sig = [
  SinOsc.ar(50!2),
    LFSaw.ar(4000!2),
    LFNoise2.ar(1600),
    Pulse.ar(4)
  ];
  sig = Select.ar(PulseCount.kr(imp*hit)%sig.size,sig);
  sig = sig * env;
  sig = CombN.ar(sig,1/4,1/4,8);
  Splay.ar(sig,0.75,0.5);
};
~ss.play;
);" ], [ 530.2699381, 'joach', "(
~sin[0] = {
var osc = SinOsc.ar(( \\freq.kr(60) + \\fplus.kr(0) ), mul: 1, add: 0);
var noise = BrownNoise.ar(\\noise.kr(0), (1 - \\noise.kr(0)));
var sig = osc * noise;
Pan2.ar( sig * \\amp.kr(0), \\pan.kr(0) );
};
)" ], [ 528.4059023, 'joach', "(
~sin[1] = \\set -> QuantEnv(\\amp, 8)
.phase(1, [0.2,1,0.2], [0.55, 4.45], [2,-2], 0, 4)
.phase(2, [0,1,0], [0.35, 0.65], [2,-2], 0, 1)
.play([1,2]);
)" ], [ 514.7398806, 'kof', "(
~ss.ar(2);
~ss.quant=2;
~ss.fadeTime=0.2;
~ss={
  //         |       |       |       |       |  
  var pat = [1,0,0,0,1,0,0,0,1,0,0,0,1,0,0,0].rotate(3);
  var imp = PulseDivider.kr(~tick.kr,2,~counter.kr);
  var hit = Select.kr(PulseCount.kr(imp)%pat.size,pat);
  var env = EnvGen.ar(Env([0.0001,1,0.0001],[0.002,0.05],[3,-3],curve:'exp'),imp * hit);
  var sig = [
  SinOsc.ar(50!2),
    LFSaw.ar(4000!2),
    LFNoise2.ar(16000),
    DC.ar(0)
  ];
  sig = Select.ar(PulseCount.kr(imp*hit)%sig.size,sig);
  sig = sig * env;
  sig = CombN.ar(sig,1/4,1/4,8);
  Splay.ar(sig,0.75,0.5);
};
~ss.play;
);" ], [ 512.33684860001, 'joach', "~sin[2] = \\set -> Pbind(\\args, [\\freq], \\octave, 7, \\degree, Pseq([3,4,3,7], inf), \\dur, 4);" ], [ 494.7368195, 'kof', "(
~ss.ar(2);
~ss.quant=2;
~ss.fadeTime=0.2;
~ss={
  //         |       |       |       |       |  
  var pat = [1,0,0,0,1,0,0,0,1,0,0,0,1,0,0,0].rotate(3);
  var imp = PulseDivider.kr(~tick.kr,2,~counter.kr);
  var hit = Select.kr(PulseCount.kr(imp)%pat.size,pat);
  var env = EnvGen.ar(Env([0.0001,1,0.0001],[0.002,0.05],[3,-3],curve:'exp'),imp * hit);
  var sig = [
  SinOsc.ar(50!2),
    LFSaw.ar(4000!2),
    LFNoise2.ar(16000),
    DC.ar(0)
  ];
  sig = Select.ar(PulseCount.kr(imp*hit)%sig.size,sig);
  sig = sig * env;
  Splay.ar(sig,0.75,0.5);
};
~ss.play;
);" ], [ 490.29681330001, 'kof', "(
~ss.ar(2);
~ss.quant=2;
~ss.fadeTime=0.2;
~ss={
  //         |       |       |       |       |  
  var pat = [1,0,0,0,1,0,0,0,1,0,0,0,1,0,0,0].rotate(1);
  var imp = PulseDivider.kr(~tick.kr,2,~counter.kr);
  var hit = Select.kr(PulseCount.kr(imp)%pat.size,pat);
  var env = EnvGen.ar(Env([0.0001,1,0.0001],[0.002,0.05],[3,-3],curve:'exp'),imp * hit);
  var sig = [
  SinOsc.ar(50!2),
    LFSaw.ar(4000!2),
    LFNoise2.ar(16000),
    DC.ar(0)
  ];
  sig = Select.ar(PulseCount.kr(imp*hit)%sig.size,sig);
  sig = sig * env;
  Splay.ar(sig,0.75,0.5);
};
~ss.play;
);" ], [ 488.53681080001, 'kof', "(
~ss.ar(2);
~ss.quant=2;
~ss.fadeTime=0.2;
~ss={
  //         |       |       |       |       |  
  var pat = [1,0,0,0,1,0,0,0,1,0,0,0,1,0,0,0].rotate(1);
  var imp = PulseDivider.kr(~tick.kr,8,~counter.kr);
  var hit = Select.kr(PulseCount.kr(imp)%pat.size,pat);
  var env = EnvGen.ar(Env([0.0001,1,0.0001],[0.002,0.05],[3,-3],curve:'exp'),imp * hit);
  var sig = [
  SinOsc.ar(50!2),
    LFSaw.ar(4000!2),
    LFNoise2.ar(16000),
    DC.ar(0)
  ];
  sig = Select.ar(PulseCount.kr(imp*hit)%sig.size,sig);
  sig = sig * env;
  Splay.ar(sig,0.75,0.5);
};
~ss.play;
);" ], [ 480.07579890001, 'kof', "(
~ss.quant=2;
~ss.fadeTime=0.2;
~ss={
  //         |       |       |       |       |  
  var pat = [1,0,0,0,1,0,0,0,1,0,0,0,1,0,0,0].rotate(1);
  var imp = PulseDivider.kr(~tick.kr,8,~counter.kr);
  var hit = Select.kr(PulseCount.kr(imp)%pat.size,pat);
  var env = EnvGen.ar(Env([0.001,1,0.001],[0.002,0.05],[3,-3],curve:'exp'),imp * hit);
  var sig = [
  SinOsc.ar(50!2),
    LFSaw.ar(4000!2),
    LFNoise2.ar(16000),
    DC.ar(0)
  ];
  sig = Select.ar(PulseCount.kr(imp*hit)%sig.size,sig);
  sig = sig * env;
  Splay.ar(sig,0.75,0.5);
};
~ss.play;
);" ], [ 439.75474240001, 'kof', "~mel.stop(4);" ], [ 432.80473270001, 'kof', "(
~mel.ar(2);
~mel.quant=2;
~mel.fadeTime=4.2;
~mel={
  //         |       |       |       |       |  
  var pat = [1,0,0,0,1,0,0,0,1,0,0,0,1,0,1,0].rotate(3);
  var imp = PulseDivider.kr(~tick.kr,1,~counter.kr);
  var hit = Select.kr(PulseCount.kr(imp)/[1,2,3,4,5,6,7,8]%pat.size,pat);
  var env = EnvGen.ar(Env([0.001,1,0.001],[0.002,0.5]/4,[3,-3],curve:'exp'),imp * hit);
  var sig = LFSaw.ar(60.midicps*16/([1,1.125,1.5,2,4,1.125].scramble*2pi),SinOsc.ar(1/4/[1,2,3,4]).range(-pi,pi));
  sig = sig * env;
  Splay.ar(sig,0.15,0.25);
};
~mel.play;
);" ], [ 425.5347225, 'kof', "(
~mel.ar(2);
~mel.quant=2;
~mel.fadeTime=4.2;
~mel={
  //         |       |       |       |       |  
  var pat = [1,0,0,0,1,0,0,0,1,0,0,0,1,0,1,0].rotate(3);
  var imp = PulseDivider.kr(~tick.kr,1,~counter.kr);
  var hit = Select.kr(PulseCount.kr(imp)/[1,2,3,4,5,6,7,8]%pat.size,pat);
  var env = EnvGen.ar(Env([0.001,1,0.001],[0.002,0.5]/4,[3,-3],curve:'exp'),imp * hit);
  var sig = LFSaw.ar(60.midicps*16/([1,1.125,1.5,2,4,1.125].scramble*pi),SinOsc.ar(1/4/[1,2,3,4]).range(-pi,pi));
  sig = sig * env;
  Splay.ar(sig,0.15,0.25);
};
~mel.play;
);" ], [ 424.0986923, 'joach', "~sin.stop(16);" ], [ 421.3746542, 'joach', "~sin.set(\\lpf_freq, 200);" ], [ 415.97664230001, 'kof', "(
~mel.ar(2);
~mel.quant=2;
~mel.fadeTime=4.2;
~mel={
  //         |       |       |       |       |  
  var pat = [1,0,0,0,1,0,0,0,1,0,0,0,1,0,1,0].rotate(3);
  var imp = PulseDivider.kr(~tick.kr,1,~counter.kr);
  var hit = Select.kr(PulseCount.kr(imp)/[1,2,3,4,5,6,7,8]%pat.size,pat);
  var env = EnvGen.ar(Env([0.001,1,0.001],[0.002,0.5]/4,[3,-3],curve:'exp'),imp * hit);
  var sig = SinOsc.ar(60.midicps*16/([1,1.125,1.5,2,4,1.125].scramble*pi),SinOsc.ar(1/4/[1,2,3,4]).range(-pi,pi));
  sig = sig * env;
  Splay.ar(sig,0.15,0.25);
};
~mel.play;
);" ], [ 413.49560580001, 'joach', "~sin[3] = nil" ], [ 407.99559810001, 'kof', "(
~kick.ar(2);
~kick.quant=2;
~kick.fadeTime=0.2;
~kick={
  //         |       |       |       |       |  
  var pat = [1,1,0,0,1,0,0,0,1,1,0,0,1,0,0,0].rotate(1);
  var imp = PulseDivider.kr(~tick.kr,1,~counter.kr);
  var hit = Select.kr(PulseCount.kr(imp)%pat.size,pat);
  var env = EnvGen.ar(Env([0.001,1,0.001],[0.002,2.5],[3,-3],curve:'exp'),imp * hit);
  var sig = SinOsc.ar(50+(env**100*100));
  sig = sig * env;
  Splay.ar(sig,0.75,0.5);
};
~kick.play;
);" ], [ 392.81457680001, 'kof', "~kick.clear;" ], [ 391.9845472, 'joach', "(
~sin[3] = \\set -> QuantEnv(\\fplus, 0.5)
.phase(1, [0,2400,0], [0.015, 0.11], [8,-8], 0, 4)
.phase(2, [0,800,0], [0.005, 0.105], [8,-4], 0, 2)
.phase(3, [80,20,80], [0.105, 0.005], [8,-4], 0, 2)
.play([1,2, 1, 3]);
)" ], [ 389.1905386, 'kof', "(
~hh.ar(2);
~hh.quant=2;
~hh.fadeTime=1.2;
~hh={
  //         |       |       |       |       |  
  var pat = [1,0,0,0,1,0,0,0,1,0,0,0,1,0,0,0].rotate(3);
  var imp = PulseDivider.kr(~tick.kr,1,~counter.kr);
  var hit = Select.kr(PulseCount.kr(imp)/[1,2,3,4]%pat.size,pat);
  var env = EnvGen.ar(Env([0.001,1,0.001],[0.002,0.15],[3,-3],curve:'exp'),imp * hit);
  var sig = LFNoise2.ar(16000!2);
  sig = sig * env;
  Splay.ar(sig,0.75,0.15);
};
~hh.play;
);" ], [ 375.85051990001, 'kof', "(
~hh.ar(2);
~hh.quant=2;
~hh.fadeTime=1.2;
~hh={
  //         |       |       |       |       |  
  var pat = [1,0,0,0,1,0,0,0,1,0,0,0,1,0,0,0].rotate(3);
  var imp = PulseDivider.kr(~tick.kr,1,~counter.kr);
  var hit = Select.kr(PulseCount.kr(imp)/[1,2,3,4]%pat.size,pat);
  var env = EnvGen.ar(Env([0.001,1,0.001],[0.002,0.15],[3,-3],curve:'exp'),imp * hit);
  var sig = LFNoise2.ar(16000!2);
  sig = sig * env;
  Splay.ar(sig,0.75,0.25);
};
~hh.play;
);" ], [ 373.088487, 'joach', "(
~sin[3] = \\set -> QuantEnv(\\fplus, 0.5)
.phase(1, [0,2400,0], [0.015, 0.11], [8,-8], 0, 4)
.phase(2, [0,800,0], [0.005, 0.105], [8,-4], 0, 2)
.phase(3, [80,200,180], [0.105, 0.005], [8,-4], 0, 2)
.play([1,2, 1, 3]);
)" ], [ 368.943444, 'joach', "(
~sin[3] = \\set -> QuantEnv(\\fplus, 0.5)
.phase(1, [0,2400,0], [0.015, 0.15], [8,-8], 0, 4)
.phase(2, [0,800,0], [0.005, 0.105], [8,-4], 0, 2)
.phase(3, [80,200,180], [0.105, 0.005], [8,-4], 0, 2)
.play([1,2, 1, 3]);
)" ], [ 362.9344044, 'joach', "(
~sin[3] = \\set -> QuantEnv(\\fplus, 0.5)
.phase(1, [0,1400,0], [0.015, 0.15], [8,-8], 0, 4)
.phase(2, [0,800,0], [0.005, 0.105], [8,-4], 0, 2)
.phase(3, [80,200,180], [0.105, 0.005], [8,-4], 0, 2)
.play([1,2, 1, 3]);
)" ], [ 356.49136120001, 'joach', "~sin.set(\\lpf_freq, 800);" ], [ 334.32229950001, 'joach', "(
~sin[3] = \\set -> QuantEnv(\\fplus, 0.5)
.phase(1, [0,1400,0], [0.015, 0.15], [8,-8], 0, 4)
.phase(2, [0,800,0], [0.005, 0.105], [8,-4], 0, 2)
.phase(3, [180,200,180], [0.105, 0.005], [8,-4], 0, 2)
.play([1,2, 1, 3]);
)" ], [ 332.60529400001, 'kof', "(
~mel.ar(2);
~mel.quant=2;
~mel.fadeTime=4.2;
~mel={
  //         |       |       |       |       |  
  var pat = [1,0,0,0,1,0,0,0,1,0,0,0,1,0,1,0].rotate(3);
  var imp = PulseDivider.kr(~tick.kr,1,~counter.kr);
  var hit = Select.kr(PulseCount.kr(imp)/[1,2,3,4,5,6,7,8]%pat.size,pat);
  var env = EnvGen.ar(Env([0.001,1,0.001],[0.002,1.5]/4,[3,-3],curve:'exp'),imp * hit);
  var sig = SinOsc.ar(60.midicps*16/([1,1.125,1.5,2,4,1.125].scramble*pi),SinOsc.ar(1/4/[1,2,3,4]).range(-pi,pi));
  sig = sig * env;
  Splay.ar(sig,0.15,0.25);
};
~mel.play;
);" ], [ 327.9912549, 'joach', "~sin[2] = \\set -> Pbind(\\args, [\\freq], \\octave, 3, \\degree, Pseq([3,4,3,7], inf), \\dur, 4);" ], [ 321.115212, 'joach', "(
~sin[3] = \\set -> QuantEnv(\\fplus, 0.5)
.phase(1, [0,1400,0], [0.015, 0.15], [8,-8], 0, 4)
.phase(2, [0,800,0], [0.005, 0.105], [8,-4], 0, 2)
.phase(3, [180,2000,180], [0.105, 0.005], [8,-4], 0, 2)
.play([1,2, 1, 3]);
)" ], [ 315.3912038, 'kof', "(
~mel.ar(2);
~mel.quant=2;
~mel.fadeTime=4.2;
~mel={
  //         |       |       |       |       |  
  var pat = [1,0,0,0,1,0,0,0,1,0,0,0,1,0,1,0].rotate(3);
  var imp = PulseDivider.kr(~tick.kr,1,~counter.kr);
  var hit = Select.kr(PulseCount.kr(imp)/[1,2,3,4,5,6,7,8]%pat.size,pat);
  var env = EnvGen.ar(Env([0.001,1,0.001],[0.002,0.5]/4,[3,-3],curve:'exp'),imp * hit);
  var sig = SinOsc.ar(60.midicps*8/([1,1.125,1.5,2,4,1.125].scramble*0.25pi),SinOsc.ar(1/4/[1,2,3,4]).range(-pi,pi));
  sig = sig * env;
  Splay.ar(sig,0.15,0.25);
};
~mel.play;
);" ], [ 308.73119450001, 'kof', "(
~mel.ar(2);
~mel.quant=2;
~mel.fadeTime=4.2;
~mel={
  //         |       |       |       |       |  
  var pat = [1,0,0,0,1,0,0,0,1,0,0,0,1,0,1,0].rotate(3);
  var imp = PulseDivider.kr(~tick.kr,1,~counter.kr);
  var hit = Select.kr(PulseCount.kr(imp)/[1,2,3,4,5,6,7,8]%pat.size,pat);
  var env = EnvGen.ar(Env([0.001,1,0.001],[0.002,0.5]/4,[3,-3],curve:'exp'),imp * hit);
  var sig = SinOsc.ar(67.midicps*8/([1,1.125,1.5,2,4,1.125].scramble*0.25pi),SinOsc.ar(1/4/[1,2,3,4]).range(-pi,pi));
  sig = sig * env;
  Splay.ar(sig,0.15,0.25);
};
~mel.play;
);" ], [ 306.4791622, 'joach', "(
~sin[3] = \\set -> QuantEnv(\\fplus, 0.5)
.phase(1, [0,1400,0], [0.015, 0.15], [8,-8], 0, 4)
.phase(2, [0,800,0], [0.005, 0.105], [8,-4], 0, 2)
.phase(3, [180,8000,180], [0.005, 0.105], [8,-4], 0, 2)
.play([1,2]);
)" ], [ 302.5441196, 'joach', "(
~sin[3] = \\set -> QuantEnv(\\fplus, 0.5)
.phase(1, [0,1400,0], [0.015, 0.15], [8,-8], 0, 4)
.phase(2, [0,800,0], [0.005, 0.105], [8,-4], 0, 2)
.phase(2, [180,8000,180], [0.005, 0.105], [8,-4], 0, 2)
.play([1,2]);
)" ], [ 300.7541171, 'kof', "(
~mel.ar(2);
~mel.quant=2;
~mel.fadeTime=4.2;
~mel={
  //         |       |       |       |       |  
  var pat = [1,0,0,0,1,0,0,0,1,0,0,0,1,0,1,0].rotate(3);
  var imp = PulseDivider.kr(~tick.kr,1,~counter.kr);
  var hit = Select.kr(PulseCount.kr(imp)/[1,2,3,4,5,6,7,8]%pat.size,pat);
  var env = EnvGen.ar(Env([0.001,1,0.001],[0.002,0.5]/4,[3,-3],curve:'exp'),imp * hit);
  var sig = SinOsc.ar(67.midicps*8/([1,1.125,1.5,2,4,1.125].scramble*0.5pi),SinOsc.ar(1/4/[1,2,3,4]).range(-pi,pi));
  sig = sig * env;
  Splay.ar(sig,0.15,0.25);
};
~mel.play;
);" ], [ 288.3530996, 'kof', "(
~mel.ar(2);
~mel.quant=2;
~mel.fadeTime=4.2;
~mel={
  //         |       |       |       |       |  
  var pat = [1,0,0,0,1,0,0,0,1,0,0,0,1,0,1,0].rotate(3);
  var imp = PulseDivider.kr(~tick.kr,1,~counter.kr);
  var hit = Select.kr(PulseCount.kr(imp)/[1,2,3,4,5,6,7,8]%pat.size,pat);
  var env = EnvGen.ar(Env([0.001,1,0.001],[0.002,0.5]/4,[3,-3],curve:'exp'),imp * hit);
  var sig = SinOsc.ar(67.midicps*8/([1,1.125,1.5,2,4,1.125].scramble*pi),SinOsc.ar(1/4/[1,2,3,4]).range(-pi,pi));
  sig = sig * env;
  Splay.ar(sig,0.15,0.25);
};
~mel.play;
);" ], [ 273.7330792, 'kof', "(
~mel.ar(2);
~mel.quant=2;
~mel.fadeTime=4.2;
~mel={
  //         |       |       |       |       |  
  var pat = [1,0,0,0,1,0,0,0,1,0,0,0,1,0,1,0].rotate(3);
  var imp = PulseDivider.kr(~tick.kr,1,~counter.kr);
  var hit = Select.kr(PulseCount.kr(imp)/[1,2,3,4,5,6,7,8]%pat.size,pat);
  var env = EnvGen.ar(Env([0.001,1,0.001],[0.002,0.5]/4,[3,-3],curve:'exp'),imp * hit);
  var sig = SinOsc.ar(60.midicps*8/([1,1.125,1.5,2,4,1.125].scramble*pi),SinOsc.ar(1/4/[1,2,3,4]).range(-pi,pi));
  sig = sig * env;
  Splay.ar(sig,0.15,0.25);
};
~mel.play;
);" ], [ 262.54503800001, 'kof', "(
~mel.ar(2);
~mel.quant=2;
~mel.fadeTime=4.2;
~mel={
  //         |       |       |       |       |  
  var pat = [1,0,0,0,1,0,0,0,1,0,0,0,1,0,1,0].rotate(3);
  var imp = PulseDivider.kr(~tick.kr,1,~counter.kr);
  var hit = Select.kr(PulseCount.kr(imp)/[1,2,3,4,5,6,7,8]%pat.size,pat);
  var env = EnvGen.ar(Env([0.001,1,0.001],[0.002,0.25]/4,[3,-3],curve:'exp'),imp * hit);
  var sig = SinOsc.ar(60.midicps*8/([1,1.125,1.5,2,4,1.125].scramble*pi),SinOsc.ar(1/4/[1,2,3,4]).range(-pi,pi));
  sig = sig * env;
  Splay.ar(sig,0.15,0.25);
};
~mel.play;
);" ], [ 262.4720338, 'joach', "(
~sin[3] = \\set -> QuantEnv(\\fplus, 0.5)
.phase(1, [0,1400,0], [0.015, 0.15], [8,-8], 0, 1)
.phase(2, [0,800,0], [0.005, 0.105], [8,-4], 0, 1)
.play([1,2]);
)" ], [ 260.93102820001, 'kof', "(
~mel.ar(2);
~mel.quant=2;
~mel.fadeTime=4.2;
~mel={
  //         |       |       |       |       |  
  var pat = [1,0,0,0,1,0,0,0,1,0,0,0,1,0,1,0].rotate(3);
  var imp = PulseDivider.kr(~tick.kr,1,~counter.kr);
  var hit = Select.kr(PulseCount.kr(imp)/[1,2,3,4,5,6,7,8]%pat.size,pat);
  var env = EnvGen.ar(Env([0.001,1,0.001],[0.002,1.25]/4,[3,-3],curve:'exp'),imp * hit);
  var sig = SinOsc.ar(60.midicps*8/([1,1.125,1.5,2,4,1.125].scramble*pi),SinOsc.ar(1/4/[1,2,3,4]).range(-pi,pi));
  sig = sig * env;
  Splay.ar(sig,0.15,0.25);
};
~mel.play;
);" ], [ 250.0229829, 'joach', "(
~sin[4] = \\set -> QuantEnv(\\noise, 8)
.phase(1, [0,0.3,0], [6.05, 0.95], [2,-2], 0, 4)
.phase(2, [0.3,1,0.3], [0.35, 0.65], [2,-2], 0, 1)
.play([1,2]);
)" ], [ 237.05496150001, 'kof', "(
~mel.ar(2);
~mel.quant=2;
~mel.fadeTime=4.2;
~mel={
  //         |       |       |       |       |  
  var pat = [1,0,0,0,1,0,0,0,1,0,0,0,1,0,1,0].rotate(3);
  var imp = PulseDivider.kr(~tick.kr,1,~counter.kr);
  var hit = Select.kr(PulseCount.kr(imp)/[1,2,3,4,5,6,7,8]%pat.size,pat);
  var env = EnvGen.ar(Env([0.001,1,0.001],[0.002,1.25]/4,[3,-3],curve:'exp'),imp * hit);
  var sig = SinOsc.ar(60.midicps*16/([1,1.125,1.5,2,4,1.125].scramble*pi),SinOsc.ar(1/4/[1,2,3,4]).range(-pi,pi));
  sig = sig * env;
  Splay.ar(sig,0.15,0.25);
};
~mel.play;
);" ], [ 236.47692850001, 'joach', "~sin.set(\\lpf_freq, 2800);" ], [ 222.9849084, 'kof', "(
~mel.ar(2);
~mel.quant=2;
~mel.fadeTime=4.2;
~mel={
  //         |       |       |       |       |  
  var pat = [1,0,0,0,1,0,0,0,1,0,0,0,1,0,1,0].rotate(3);
  var imp = PulseDivider.kr(~tick.kr,1,~counter.kr);
  var hit = Select.kr(PulseCount.kr(imp)/[1,2,3,4,5,6,7,8]%pat.size,pat);
  var env = EnvGen.ar(Env([0.001,1,0.001],[0.002,1.25]/4,[3,-3],curve:'exp'),imp * hit);
  var sig = SinOsc.ar(60.midicps*16/([1,1.125,1.5,2,4,1.125]*pi),SinOsc.ar(1/4/[1,2,3,4]).range(-pi,pi));
  sig = sig * env;
  Splay.ar(sig,0.15,0.25);
};
~mel.play;
);" ], [ 220.7949053, 'kof', "(
~kick.ar(2);
~kick.quant=2;
~kick.fadeTime=0.2;
~kick={
  //         |       |       |       |       |  
  var pat = [1,1,0,0,1,0,0,0,1,1,0,0,1,0,0,0].rotate(1);
  var imp = PulseDivider.kr(~tick.kr,1,~counter.kr);
  var hit = Select.kr(PulseCount.kr(imp)%pat.size,pat);
  var env = EnvGen.ar(Env([0.001,1,0.001],[0.002,2.5],[3,-3],curve:'exp'),imp * hit);
  var sig = SinOsc.ar(50+(env**100*100));
  sig = sig * env;
  Splay.ar(sig,0.75,0.5);
};
~kick.play;
);" ], [ 218.24287320001, 'joach', "~sin[2] = \\set -> Pbind(\\args, [\\freq], \\octave, 2, \\degree, Pseq([3,4,3,7], inf), \\dur, 4);" ], [ 199.3418126, 'joach', "~sin[5] = \\filter -> {|in| LPF.ar(in, \\lpf_freq.kr(800,8)) };" ], [ 197.1908062, 'kof', "(
~mel.ar(2);
~mel.quant=2;
~mel.fadeTime=4.2;
~mel={
  //         |       |       |       |       |  
  var pat = [1,0,0,0,1,0,0,0,1,0,0,0,1,0,0,0].rotate(3);
  var imp = PulseDivider.kr(~tick.kr,1,~counter.kr);
  var hit = Select.kr(PulseCount.kr(imp)/[1,2,3,4,5,6,7,8]%pat.size,pat);
  var env = EnvGen.ar(Env([0.001,1,0.001],[0.002,1.25]/4,[3,-3],curve:'exp'),imp * hit);
  var sig = SinOsc.ar(60.midicps*16/([1,1.125,1.5,2,4,1.125]*pi),SinOsc.ar(1/4/[1,2,3,4]).range(-pi,pi));
  sig = sig * env;
  Splay.ar(sig,0.15,0.25);
};
~mel.play;
);" ], [ 185.49078980001, 'kof', "(
~mel.ar(2);
~mel.quant=2;
~mel.fadeTime=4.2;
~mel={
  //         |       |       |       |       |  
  var pat = [1,0,0,0,1,0,0,0,1,0,0,0,1,0,0,0].rotate(3);
  var imp = PulseDivider.kr(~tick.kr,1,~counter.kr);
  var hit = Select.kr(PulseCount.kr(imp)/[1,2,3,4,5,6,7,8]%pat.size,pat);
  var env = EnvGen.ar(Env([0.001,1,0.001],[0.002,1.25]/4,[3,-3],curve:'exp'),imp * hit);
  var sig = SinOsc.ar(60.midicps*16/([1,1.125,1.5,2,4,1.125]*1.5pi),SinOsc.ar(1/4/[1,2,3,4]).range(-pi,pi));
  sig = sig * env;
  Splay.ar(sig,0.15,0.25);
};
~mel.play;
);" ], [ 172.87077210001, 'kof', "(
~mel.ar(2);
~mel.quant=2;
~mel.fadeTime=4.2;
~mel={
  //         |       |       |       |       |  
  var pat = [1,0,0,0,1,0,0,0,1,0,0,0,1,0,0,0].rotate(3);
  var imp = PulseDivider.kr(~tick.kr,1,~counter.kr);
  var hit = Select.kr(PulseCount.kr(imp)/[1,2,3,4,5,6,7,8]%pat.size,pat);
  var env = EnvGen.ar(Env([0.001,1,0.001],[0.002,1.25]/4,[3,-3],curve:'exp'),imp * hit);
  var sig = SinOsc.ar(60.midicps*16/([1,1.125,1.5,2,4,1.125]*1.5pi),SinOsc.ar(1/4/[1,2,3,4]).range(-pi,pi));
  sig = sig * env;
  Splay.ar(sig,0.15,0.25);
};
~mel.play;
);" ], [ 168.87073360001, 'joach', "(
~sin[4] = \\set -> QuantEnv(\\noise, 8)
.phase(1, [0,0.3,0], [6.05, 0.95], [2,-2], 0, 1)
.phase(2, [0,1,0], [0.35, 0.65], [2,-2], 0, 1)
.play([1]);
)" ], [ 157.05871700001, 'kof', "(
~mel.ar(2);
~mel.quant=2;
~mel.fadeTime=4.2;
~mel={
  //         |       |       |       |       |  
  var pat = [1,0,0,0,1,0,0,0,1,0,0,0,1,0,0,0].rotate(3);
  var imp = PulseDivider.kr(~tick.kr,1,~counter.kr);
  var hit = Select.kr(PulseCount.kr(imp)/[1,2,3,4,5,6,7,8]%pat.size,pat);
  var env = EnvGen.ar(Env([0.001,1,0.001],[0.002,1.25]/4,[3,-3],curve:'exp'),imp * hit);
  var sig = SinOsc.ar(60.midicps*16/1.5/([1,1.125,1.5,2,4,1.125]*pi),SinOsc.ar(1/4/[1,2,3,4]).range(-pi,pi));
  sig = sig * env;
  Splay.ar(sig,0.15,0.25);
};
~mel.play;
);" ], [ 146.14067220001, 'joach', "(
~sin[1] = \\set -> QuantEnv(\\amp, 1)
.phase(1, [0.2,1,0.2], [0.05, 0.95], [2,-2], 0, 4)
.phase(2, [0,1,0], [0.35, 0.65], [2,-2], 0, 1)
.play([1,2]);
)" ], [ 141.24466170001, 'kof', "(
~kick.ar(2);
~kick.quant=2;
~kick.fadeTime=0.2;
~kick={
  //         |       |       |       |       |  
  var pat = [1,0,0,0,1,0,0,0,1,0,0,0,1,0,0,0].rotate(1);
  var imp = PulseDivider.kr(~tick.kr,1,~counter.kr);
  var hit = Select.kr(PulseCount.kr(imp)%pat.size,pat);
  var env = EnvGen.ar(Env([0.001,1,0.001],[0.002,2.5],[3,-3],curve:'exp'),imp * hit);
  var sig = SinOsc.ar(50+(env**100*100));
  sig = sig * env;
  Splay.ar(sig,0.75,0.5);
};
~kick.play;
);" ], [ 130.18161530001, 'joach', "~sin.play(vol: 0.3, fadeTime: 8);" ], [ 125.7025768, 'joach', "~sin[2] = \\set -> Pbind(\\args, [\\freq], \\octave, 3, \\degree, Pseq([3,4,3,7], inf), \\dur, 4);" ], [ 125.08257310001, 'kof', "(
~mel.ar(2);
~mel.quant=2;
~mel.fadeTime=4.2;
~mel={
  //         |       |       |       |       |  
  var pat = [1,0,0,0,1,0,0,0,1,0,0,0,1,0,0,0].rotate(3);
  var imp = PulseDivider.kr(~tick.kr,1,~counter.kr);
  var hit = Select.kr(PulseCount.kr(imp)/[1,2,3,4,5,6,7,8]%pat.size,pat);
  var env = EnvGen.ar(Env([0.001,1,0.001],[0.002,1.25]/4,[3,-3],curve:'exp'),imp * hit);
  var sig = SinOsc.ar(60.midicps*16/([1,1.25,1.5,2,4,1.125]*pi),SinOsc.ar(1/4/[1,2,3,4]).range(-pi,pi));
  sig = sig * env;
  Splay.ar(sig,0.15,0.25);
};
~mel.play;
);" ], [ 109.1625508, 'kof', "(
~mel.ar(2);
~mel.quant=2;
~mel.fadeTime=4.2;
~mel={
  //         |       |       |       |       |  
  var pat = [1,0,0,0,1,0,0,0,1,0,0,0,1,0,0,0].rotate(3);
  var imp = PulseDivider.kr(~tick.kr,1,~counter.kr);
  var hit = Select.kr(PulseCount.kr(imp)/[1,2,3,4,5,6,7,8]%pat.size,pat);
  var env = EnvGen.ar(Env([0.001,1,0.001],[0.002,1.25]/4,[3,-3],curve:'exp'),imp * hit);
  var sig = SinOsc.ar(60.midicps*16/([1,1.25,1.5,2]*pi),SinOsc.ar(1/4/[1,2,3,4]).range(-pi,pi));
  sig = sig * env;
  Splay.ar(sig,0.15,0.25);
};
~mel.play;
);" ], [ 107.14451520001, 'joach', "(
~sin[3] = \\set -> QuantEnv(\\fplus, 1)
.phase(1, [0,1400,0], [0.015, 0.15], [8,-8], 0, 1)
.phase(2, [0,800,0], [0.005, 0.105], [8,-4], 0, 1)
.play([1,2]);
)" ], [ 99.25050390001, 'kof', "(
~mel.ar(2);
~mel.quant=2;
~mel.fadeTime=4.2;
~mel={
  //         |       |       |       |       |  
  var pat = [1,0,0,0,1,0,0,0,1,0,0,0,1,0,0,0].rotate(3);
  var imp = PulseDivider.kr(~tick.kr,1,~counter.kr);
  var hit = Select.kr(PulseCount.kr(imp)/[1,2,3,4]%pat.size,pat);
  var env = EnvGen.ar(Env([0.001,1,0.001],[0.002,1.25]/4,[3,-3],curve:'exp'),imp * hit);
  var sig = SinOsc.ar(60.midicps*16/([1,1.25,1.5,2]*pi),SinOsc.ar(1/4/[1,2,3,4]).range(-pi,pi));
  sig = sig * env;
  Splay.ar(sig,0.15,0.25);
};
~mel.play;
);" ], [ 94.749497500001, 'kof', "(
~mel.ar(2);
~mel.quant=2;
~mel.fadeTime=4.2;
~mel={
  //         |       |       |       |       |  
  var pat = [1,0,0,0,1,0,0,0,1,0,0,0,1,0,0,0].rotate(3);
  var imp = PulseDivider.kr(~tick.kr,1,~counter.kr);
  var hit = Select.kr(PulseCount.kr(imp)/[1,2,3,4]%pat.size,pat);
  var env = EnvGen.ar(Env([0.001,1,0.001],[0.002,0.25]/4,[3,-3],curve:'exp'),imp * hit);
  var sig = SinOsc.ar(60.midicps*16/([1,1.25,1.5,2]*pi),SinOsc.ar(1/4/[1,2,3,4]).range(-pi,pi));
  sig = sig * env;
  Splay.ar(sig,0.15,0.25);
};
~mel.play;
);" ], [ 91.399462200003, 'joach', "(
~sin[3] = \\set -> QuantEnv(\\fplus, 1)
.phase(1, [0,1400,0], [0.015, 0.15], [8,-8], 0, 3)
.phase(2, [0,800,0], [0.005, 0.105], [8,-4], 0.25, 1)
.play([1,2]);
)" ], [ 85.1714201, 'joach', "~sin.play(vol: 0.1, fadeTime: 8);" ], [ 82.015413600006, 'kof', "(
~mel.ar(2);
~mel.quant=2;
~mel.fadeTime=4.2;
~mel={
  //         |       |       |       |       |  
  var pat = [1,0,0,0,1,0,0,0,1,0,0,0,1,0,0,0].rotate(3);
  var imp = PulseDivider.kr(~tick.kr,1,~counter.kr);
  var hit = Select.kr(PulseCount.kr(imp)/[1,2,3,4]%pat.size,pat);
  var env = EnvGen.ar(Env([0.001,1,0.001],[0.002,0.25]/4,[3,-3],curve:'exp'),imp * hit);
  var sig = SinOsc.ar(60.midicps*16/([1,1.25,1.5,2]*pi),SinOsc.ar(4/[1,2,3,4]).range(-pi,pi));
  sig = sig * env;
  Splay.ar(sig,0.15,0.25);
};
~mel.play;
);" ], [ 77.315374099999, 'joach', "~sin[2] = \\set -> Pbind(\\args, [\\freq], \\octave, 4, \\degree, Pseq([3,4,3,7], inf), \\dur, 4);" ], [ 73.473368700012, 'kof', "(
~mel.ar(2);
~mel.quant=2;
~mel.fadeTime=4.2;
~mel={
  //         |       |       |       |       |  
  var pat = [1,0,0,0,1,0,0,0,1,0,0,0,1,0,0,0].rotate(3);
  var imp = PulseDivider.kr(~tick.kr,1,~counter.kr);
  var hit = Select.kr(PulseCount.kr(imp)/[1,2,3,4]%pat.size,pat);
  var env = EnvGen.ar(Env([0.001,1,0.001],[0.002,0.25]/4,[3,-3],curve:'exp'),imp * hit);
  var sig = SinOsc.ar(64.midicps*16/([1,1.25,1.5,2]*pi),SinOsc.ar(4/[1,2,3,4]).range(-pi,pi));
  sig = sig * env;
  Splay.ar(sig,0.15,0.25);
};
~mel.play;
);" ], [ 71.1963349, 'joach', "~sin.play(vol: 0.5, fadeTime: 8);" ], [ 67.082326700009, 'kof', "(
~mel.ar(2);
~mel.quant=2;
~mel.fadeTime=4.2;
~mel={
  //         |       |       |       |       |  
  var pat = [1,0,0,0,1,0,0,0,1,0,0,0,1,0,0,0].rotate(3);
  var imp = PulseDivider.kr(~tick.kr,2,~counter.kr);
  var hit = Select.kr(PulseCount.kr(imp)/[1,2,3,4]%pat.size,pat);
  var env = EnvGen.ar(Env([0.001,1,0.001],[0.002,0.25]/4,[3,-3],curve:'exp'),imp * hit);
  var sig = SinOsc.ar(64.midicps*16/([1,1.25,1.5,2]*pi),SinOsc.ar(4/[1,2,3,4]).range(-pi,pi));
  sig = sig * env;
  Splay.ar(sig,0.15,0.25);
};
~mel.play;
);" ], [ 63.922322300001, 'kof', "(
~mel.ar(2);
~mel.quant=2;
~mel.fadeTime=4.2;
~mel={
  //         |       |       |       |       |  
  var pat = [1,0,0,0,1,0,0,0,1,0,0,0,1,0,0,0].rotate(3);
  var imp = PulseDivider.kr(~tick.kr,2,~counter.kr);
  var hit = Select.kr(PulseCount.kr(imp)/[1,2,3,4]%pat.size,pat);
  var env = EnvGen.ar(Env([0.001,1,0.001],[0.002,0.25]/4,[3,-3],curve:'exp'),imp * hit);
  var sig = SinOsc.ar(64.midicps*8/([1,1.25,1.5,2]*pi),SinOsc.ar(4/[1,2,3,4]).range(-pi,pi));
  sig = sig * env;
  Splay.ar(sig,0.15,0.25);
};
~mel.play;
);" ], [ 61.582319000008, 'kof', "(
~mel.ar(2);
~mel.quant=2;
~mel.fadeTime=4.2;
~mel={
  //         |       |       |       |       |  
  var pat = [1,0,0,0,1,0,0,0,1,0,0,0,1,0,0,0].rotate(3);
  var imp = PulseDivider.kr(~tick.kr,2,~counter.kr);
  var hit = Select.kr(PulseCount.kr(imp)/[1,2,3,4]%pat.size,pat);
  var env = EnvGen.ar(Env([0.001,1,0.001],[0.002,0.25]/4,[3,-3],curve:'exp'),imp * hit);
  var sig = SinOsc.ar(64.midicps*4/([1,1.25,1.5,2]*pi),SinOsc.ar(4/[1,2,3,4]).range(-pi,pi));
  sig = sig * env;
  Splay.ar(sig,0.15,0.25);
};
~mel.play;
);" ], [ 56.442311799998, 'kof', "(
~mel.ar(2);
~mel.quant=2;
~mel.fadeTime=4.2;
~mel={
  //         |       |       |       |       |  
  var pat = [1,0,0,0,1,0,0,0,1,0,0,0,1,0,0,0].rotate(3);
  var imp = PulseDivider.kr(~tick.kr,2,~counter.kr);
  var hit = Select.kr(PulseCount.kr(imp)/[1,2,3,4]%pat.size,pat);
  var env = EnvGen.ar(Env([0.001,1,0.001],[0.002,0.15]/4,[3,-3],curve:'exp'),imp * hit);
  var sig = SinOsc.ar(64.midicps*4/([1,1.25,1.5,2]*pi),SinOsc.ar(4/[1,2,3,4]).range(-pi,pi));
  sig = sig * env;
  Splay.ar(sig,0.15,0.25);
};
~mel.play;
);" ], [ 55.402310400008, 'kof', "(
  p.clock.tempo_(60/60);
  
  ~offset = (0..7)/8;
  
  ~tick.quant = 1;
  ~tick = {Mix(Impulse.kr( ~tempo / 2 , ~offset ))};
  
  ~counter = {PulseCount.kr(~tick.kr)};
);" ], [ 53.872308200007, 'kof', "  p.makeTempoClock;" ], [ 47.661299500003, 'kof', "(
  p.clock.tempo_(60/60);
  
  ~offset = (0..7)/8;
  
  ~tick.quant = 1;
  ~tick = {Mix(Impulse.kr( ~tempo / 2 , ~offset ))};
  
  ~counter = {PulseCount.kr(~tick.kr)};
);" ], [ 45.972267600009, 'joach', "~sin[2] = \\set -> Pbind(\\args, [\\freq], \\octave, 3, \\degree, Pseq([3,4,3,7], inf), \\dur, 4);" ], [ 43.919261200004, 'kof', "(
~mel.ar(2);
~mel.quant=2;
~mel.fadeTime=4.2;
~mel={
  //         |       |       |       |       |  
  var pat = [1,0,0,0,1,0,0,0,1,0,0,0,1,0,0,0].rotate(3);
  var imp = PulseDivider.kr(~tick.kr,2,~counter.kr);
  var hit = Select.kr(PulseCount.kr(imp)/[1,2,3,4]%pat.size,pat);
  var env = EnvGen.ar(Env([0.001,1,0.001],[0.002,0.15]/4,[3,-3],curve:'exp'),imp * hit);
  var sig = SinOsc.ar(64.midicps*4/([1,1.25,1.5,2]*pi),SinOsc.ar(4/[1,2,3,4]).range(-pi,pi));
  sig = sig * env;
  Splay.ar(sig,0.15,0.25);
};
~mel.play;
);" ], [ 30.80924290001, 'kof', "(
~mel.ar(2);
~mel.quant=2;
~mel.fadeTime=4.2;
~mel={
  //         |       |       |       |       |  
  var pat = [1,0,0,0,1,0,0,0,1,0,0,0,1,0,0,0].rotate(3);
  var imp = PulseDivider.kr(~tick.kr,2,~counter.kr);
  var hit = Select.kr(PulseCount.kr(imp)/[1,2,3,4]%pat.size,pat);
  var env = EnvGen.ar(Env([0.001,1,0.001],[0.002,0.15]/4,[3,-3],curve:'exp'),imp * hit);
  var sig = SinOsc.ar(64.midicps*2/([1,1.25,1.5,2]*pi),SinOsc.ar(4/[1,2,3,4]).range(-pi,pi));
  sig = sig * env;
  Splay.ar(sig,0.15,0.25);
};
~mel.play;
);" ], [ 28.606206700002, 'joach', "(
~sin[3] = \\set -> QuantEnv(\\fplus, 1)
.phase(1, [0,400,0], [0.015, 0.15], [8,-8], 0, 3)
.phase(2, [0,800,0], [0.005, 0.105], [8,-4], 0.25, 1)
.play([1,2]);
)" ], [ 13.320151500011, 'joach', "(
~sin[3] = \\set -> QuantEnv(\\fplus, 1)
.phase(1, [0,400,0], [0.015, 0.15], [8,-8], 0, 3)
.phase(2, [0,800,0], [0.005, 0.105], [8,-4], 0, 1)
.play([1,2]);
)" ], [ 9.2551455000066, 'kof', "(
~kick.ar(2);
~kick.quant=2;
~kick.fadeTime=0.2;
~kick={
  //         |       |       |       |       |  
  var pat = [1,0,0,0,1,0,0,0,1,0,0,0,1,0,0,0].rotate(1);
  var imp = PulseDivider.kr(~tick.kr,2,~counter.kr);
  var hit = Select.kr(PulseCount.kr(imp)%pat.size,pat);
  var env = EnvGen.ar(Env([0.001,1,0.001],[0.002,2.5],[3,-3],curve:'exp'),imp * hit);
  var sig = SinOsc.ar(50+(env**100*100));
  sig = sig * env;
  Splay.ar(sig,0.75,0.5);
};
~kick.play;
);" ], [ 7.4551429999992, 'kof', "(
  p.clock.tempo_(60/60);
  
  ~offset = (0..7)/8;
  
  ~tick.quant = 1;
  ~tick = {Mix(Impulse.kr( ~tempo / 2 , ~offset ))};
  
  ~counter = {PulseCount.kr(~tick.kr)};
);" ], [ 5.5711071999976, 'joach', "(
~sin[1] = \\set -> QuantEnv(\\amp, 1)
.phase(1, [0,1,0], [0.05, 0.95], [2,-2], 0, 1)
.phase(2, [0,1,0], [0.35, 0.65], [2,-2], 0, 1)
.play([1,2]);
)" ], [ 3.604072800008, 'joach', "(
~sin[0] = {
var osc = SinOsc.ar(( \\freq.kr(60) + \\fplus.kr(0) ), mul: 1, add: 0);
var noise = BrownNoise.ar(\\noise.kr(0), (1 - \\noise.kr(0)));
var sig = osc * noise;
Pan2.ar( sig * \\amp.kr(0), \\pan.kr(0) );
};
)" ], [ 1.9620364000002, 'joach', "~sin.play(vol: 0.2, fadeTime: 8);" ], [ 0.0010001000046032, 'joach', "Kolektiv.historyRestart" ], [ 0, 'Kolektiv', "Kolektiv.tempo_(60);" ] ]