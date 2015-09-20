List[ [ 90.539421899999, 'joach', "~jDrum.stop(16);" ], [ 88.697415899998, 'alex', "(octave:[4,3], dur:1).play;" ], [ 87.647414399999, 'alex', "(octave:[4,3], dur:1).play;" ], [ 87.547414299999, 'alex', "(octave:[4,3], dur:1).play;" ], [ 82.266406799999, 'alex', "(octave:[4,3], dur:4).play;" ], [ 82.236406799999, 'kof', "~kick.stop(7);" ], [ 73.709362099999, 'joach', "(
~jDrum[8] = \\set -> QuantEnv(\\freq, 48)
.phase(1, [100,216,100], [32, 16], [\\sin], 0, 3)
.phase(2, [200,(160,120..80),200], [6, 2], [\\sin], 0, 1)
.play([1,2]);
)" ], [ 72.754360499999, 'kof', "(
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
);" ], [ 72.654360299999, 'alex', "(octave:[2,3], dur:4).play;" ], [ 69.724356199999, 'kof', "(
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
);" ], [ 65.714350599999, 'alex', "(octave:[2,3], dur:4).play;" ], [ 63.504347499998, 'kof', "(
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
);" ], [ 57.834339599998, 'kof', "(
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
);" ], [ 54.052303999999, 'joach', "(
~jDrum[7] = \\set -> QuantEnv(\\lpf_freq, 32)
.phase(1, [800,4100,800], [32.05, 0.95], [2,-2], 0, 1)
.phase(2, [800,8200,1200,800], [10.35, 2, 12.65], \\sin, 0, 1)
.play([1,2]);
)" ], [ 52.196266499999, 'joach', "~jDrum[4] = \\filter -> {|in| LPF.ar(in, \\lpf_freq.kr(4000,8)) };" ], [ 40.956216199998, 'joach', "(
~jDrum[2] = \\set -> QuantEnv(\\fplus, 2)
.phase(1, [0,200,0], [0.005, 0.135], [8,-8], 0, 16)
.phase(2, [0,[220,120],0], [0.035, 0.065], [8,-2], 0, 1)
.phase(3, [0,[70!3,120],0], [0.035, 0.065], [8,-2], 0, 1)
.play([1,2,1,3]);
)" ], [ 40.8212157, 'kof', "(
  
  ~offset = (0..7)/8;
  
  ~tick.quant = 1;
  ~tick = {Mix(Impulse.kr( ~tempo / 2 , ~offset ))};
  
  ~counter = {PulseCount.kr(~tick.kr)};
);" ], [ 32.821204499998, 'alex', "(octave:[2,3], dur:4).play;" ], [ 29.920169699999, 'joach', "~jDrum.play(vol: 0.4, fadeTime: 8);" ], [ 25.7701282, 'joach', "(
~jDrum[1] = \\set -> QuantEnv(\\amp, 2)
.phase(1, [0.2,1,0.6,0.2], [0.05, 0.15, 0.25], [8,-2, -8], 0, 16)
.phase(2, [0.2,1,0.2], [1.35, 0.65], [2,-2], 0, 1)
.phase(3, [0.2,1,0.2], [8.35, 1.65], [8,-2], 0, 1)
.play([1,2,1,3]);
)" ], [ 25.600127399999, 'kof', "(
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
);" ], [ 24.902097499998, 'joach', "(
~jDrum[0] = {
var osc = SinOsc.ar(( \\freq.kr(200) + \\fplus.kr(0) ), mul: 1, add: 0);
var noise = BrownNoise.ar(\\noise.kr(0), (1 - \\noise.kr(0)));
var sig = osc * noise;
Pan2.ar( sig * \\amp.kr(0), \\pan.kr(0) );
};
)" ], [ 0.54303110000001, 'joach', "p.clock.tempo_(240/60);" ], [ 0, 'joach', "p = ProxySpace.push(s).makeTempoClock;" ] ]