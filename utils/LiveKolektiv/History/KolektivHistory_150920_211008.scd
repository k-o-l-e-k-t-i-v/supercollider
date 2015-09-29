List[ [ 105.191196568, 'joach', "~jDrum.stop(16);" ], [ 102.830177953, 'alex', "(octave:[4,3], dur:1).play;" ], [ 101.8246959, 'alex', "(octave:[4,3], dur:1).play;" ], [ 100.735965214, 'alex', "(octave:[4,3], dur:1).play;" ], [ 96.138076898, 'alex', "(octave:[4,3], dur:4).play;" ], [ 95.961508999, 'kof', "~kick.stop(7);" ], [ 89.075497809, 'joach', "(
~jDrum[8] = \\set -> QuantEnv(\\freq, 48)
.phase(1, [100,216,100], [32, 16], [\\sin], 0, 3)
.phase(2, [200,(160,120..80),200], [6, 2], [\\sin], 0, 1)
.play([1,2]);
)" ], [ 86.8245085, 'kof', "(
~kick.quant=2;
~kick.fadeTime=0.2;
~kick={
  //         |       |       |       |       |  
  var pat = [1,0,0,0,1,0,0,0,1,0,0,0,1,0,0,0].rotate(1);
  var imp = PulseDivider.kr(~tick.kr,4,~counter.kr);
  var hit = Select.kr(PulseCount.kr(imp)%pat.size,pat);
  var env = EnvGen.ar(Env([0.001,1,0.001],[0.002,3.5],[3,-3],curve:'exp'),imp * hit);
  var sig = SinOsc.ar(50+(env**100*400));
  sig = sig * env;
  Splay.ar(sig,0.75,0.5);
};
~kick.play;
);" ], [ 86.719778758, 'alex', "(octave:[2,3], dur:4).play;" ], [ 83.063396912, 'kof', "(
~kick.quant=2;
~kick.fadeTime=0.2;
~kick={
  //         |       |       |       |       |  
  var pat = [1,0,0,0,1,0,0,0,1,0,0,0,1,0,0,0].rotate(1);
  var imp = PulseDivider.kr(~tick.kr,4,~counter.kr);
  var hit = Select.kr(PulseCount.kr(imp)%pat.size,pat);
  var env = EnvGen.ar(Env([0.001,1,0.001],[0.002,1.5],[3,-3],curve:'exp'),imp * hit);
  var sig = SinOsc.ar(50+(env**100*400));
  sig = sig * env;
  Splay.ar(sig,0.75,0.5);
};
~kick.play;
);" ], [ 79.83969365, 'alex', "(octave:[2,3], dur:4).play;" ], [ 76.704528433, 'kof', "(
~kick.quant=2;
~kick.fadeTime=0.2;
~kick={
  //         |       |       |       |       |  
  var pat = [1,0,0,0,1,0,0,0,1,0,0,0,1,0,0,0].rotate(1);
  var imp = PulseDivider.kr(~tick.kr,4,~counter.kr);
  var hit = Select.kr(PulseCount.kr(imp)%pat.size,pat);
  var env = EnvGen.ar(Env([0.001,1,0.001],[0.002,4.5],[3,-3],curve:'exp'),imp * hit);
  var sig = SinOsc.ar(50+(env**100*400));
  sig = sig * env;
  Splay.ar(sig,0.75,0.5);
};
~kick.play;
);" ], [ 71.995760662, 'kof', "(
~kick.quant=2;
~kick.fadeTime=0.2;
~kick={
  //         |       |       |       |       |  
  var pat = [1,0,0,0,1,0,0,0,1,0,0,0,1,0,0,0].rotate(1);
  var imp = PulseDivider.kr(~tick.kr,8,~counter.kr);
  var hit = Select.kr(PulseCount.kr(imp)%pat.size,pat);
  var env = EnvGen.ar(Env([0.001,1,0.001],[0.002,4.5],[3,-3],curve:'exp'),imp * hit);
  var sig = SinOsc.ar(50+(env**100*400));
  sig = sig * env;
  Splay.ar(sig,0.75,0.5);
};
~kick.play;
);" ], [ 68.890591733, 'joach', "(
~jDrum[7] = \\set -> QuantEnv(\\lpf_freq, 32)
.phase(1, [800,4100,800], [32.05, 0.95], [2,-2], 0, 1)
.phase(2, [800,8200,1200,800], [10.35, 2, 12.65], \\sin, 0, 1)
.play([1,2]);
)" ], [ 67.37527937, 'joach', "~jDrum[4] = \\filter -> {|in| LPF.ar(in, \\lpf_freq.kr(4000,8)) };" ], [ 55.717394989, 'joach', "(
~jDrum[2] = \\set -> QuantEnv(\\fplus, 2)
.phase(1, [0,200,0], [0.005, 0.135], [8,-8], 0, 16)
.phase(2, [0,[220,120],0], [0.035, 0.065], [8,-2], 0, 1)
.phase(3, [0,[70!3,120],0], [0.035, 0.065], [8,-2], 0, 1)
.play([1,2,1,3]);
)" ], [ 54.862710571, 'kof', "(
  
  ~offset = (0..7)/8;
  
  ~tick.quant = 1;
  ~tick = {Mix(Impulse.kr( ~tempo / 2 , ~offset ))};
  
  ~counter = {PulseCount.kr(~tick.kr)};
);" ], [ 47.213205883, 'joach', "~jDrum.play(vol: 0.4, fadeTime: 8);" ], [ 44.124155577, 'alex', "(octave:[2,3], dur:4).play;" ], [ 40.694039356, 'joach', "(
~jDrum[1] = \\set -> QuantEnv(\\amp, 2)
.phase(1, [0.2,1,0.6,0.2], [0.05, 0.15, 0.25], [8,-2, -8], 0, 16)
.phase(2, [0.2,1,0.2], [1.35, 0.65], [2,-2], 0, 1)
.phase(3, [0.2,1,0.2], [8.35, 1.65], [8,-2], 0, 1)
.play([1,2,1,3]);
)" ], [ 40.318802909, 'joach', "(
~jDrum[0] = {
var osc = SinOsc.ar(( \\freq.kr(200) + \\fplus.kr(0) ), mul: 1, add: 0);
var noise = BrownNoise.ar(\\noise.kr(0), (1 - \\noise.kr(0)));
var sig = osc * noise;
Pan2.ar( sig * \\amp.kr(0), \\pan.kr(0) );
};
)" ], [ 39.684024634, 'kof', "(
~kick.quant=2;
~kick.fadeTime=0.2;
~kick={
  //         |       |       |       |       |  
  var pat = [1,0,0,0,1,0,0,0,1,0,0,0,1,0,0,0].rotate(1);
  var imp = PulseDivider.kr(~tick.kr,16,~counter.kr);
  var hit = Select.kr(PulseCount.kr(imp)%pat.size,pat);
  var env = EnvGen.ar(Env([0.001,1,0.001],[0.002,4.5],[3,-3],curve:'exp'),imp * hit);
  var sig = SinOsc.ar(50+(env**100*400));
  sig = sig * env;
  Splay.ar(sig,0.75,0.5);
};
~kick.play;
);" ], [ 15.355917576, 'joach', "p.clock.tempo_(240/60);" ], [ 15.056034615, 'joach', "p = ProxySpace.push(s).makeTempoClock;" ], [ 10.284789754, 'kof', "(
  p.clock.tempo_(240/60);
  
  ~offset = (0..7)/8;
  
  ~tick.quant = 1;
  ~tick = {Mix(Impulse.kr( ~tempo / 2 , ~offset ))};
  
  ~counter = {PulseCount.kr(~tick.kr)};
);" ], [ 0, 'kof', "(
  p=ProxySpace.push(s.boot);
  p.makeTempoClock;
);" ] ]