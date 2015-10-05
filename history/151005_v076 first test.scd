List[ [ 2236.8787731, 'kof', "thisProcess.stop;" ], [ 2219.0337524, 'joach', "Kolektiv.historySave" ], [ 2154.3910551, 'kof', "~nn.clear;" ], [ 2152.185929, 'kof', "~kick.clear;" ], [ 2149.5237767, 'kof', "~slow.clear;" ], [ 2145.9655732, 'kof', "~slow.clear;" ], [ 2143.5814368, 'kof', "~sw.clear;" ], [ 2142.7793909, 'kof', "~sw.stop(7);" ], [ 2138.4071409, 'kof', "~ss.clear;" ], [ 2136.9600581, 'kof', "~ff.clear;" ], [ 2132.3467942, 'joach', "~test.stop(6);" ], [ 2132.2017859, 'kof', "~ff.clear;" ], [ 2129.5016315, 'kof', "~hiss.clear;" ], [ 2126.8914822, 'kof', "~kick.clear;" ], [ 2124.3543371, 'kof', "~first.clear;" ], [ 2122.8072486, 'kof', "~chaotic.clear;" ], [ 2121.2821614, 'kof', "~ssmp.clear;" ], [ 2111.0445758, 'kof', "(
~kick.quant=2;
~kick.fadeTime=0.2;
~kick={
  //         |       |       |       |       |  
  var pat = [1,0,0,0,1,0,0,0,1,0,0,0,1,0,0,0].rotate(1);
  var imp = PulseDivider.kr(~tick.kr,1,~counter.kr);
    var hit = Select.kr(PulseCount.kr(imp)/[1,2,3,4]%pat.size,pat);
  var env = EnvGen.ar(Env([0.001,1,0.001],[0.002,1.5],[1,-1],curve:'exp'),imp * hit);
  var sig = Mix.ar(SinOsc.ar(50+(env**(10..100)*100),mul:0.1));
  sig = sig * env;
  Splay.ar(sig,0.25,0.65);
};
~kick.play;
);" ], [ 2110.837564, 'kof', "(
~kick.quant=2;
~kick.fadeTime=0.2;
~kick={
  //         |       |       |       |       |  
  var pat = [1,0,0,0,1,0,0,0,1,0,0,0,1,0,0,0].rotate(1);
  var imp = PulseDivider.kr(~tick.kr,1,~counter.kr);
    var hit = Select.kr(PulseCount.kr(imp)/[1,2,3,4]%pat.size,pat);
  var env = EnvGen.ar(Env([0.001,1,0.001],[0.002,1.5],[1,-1],curve:'exp'),imp * hit);
  var sig = Mix.ar(SinOsc.ar(50+(env**(10..100)*100),mul:0.1));
  sig = sig * env;
  Splay.ar(sig,0.25,0.65);
};
~kick.play;
);" ], [ 2110.6225517, 'kof', "(
~kick.quant=2;
~kick.fadeTime=0.2;
~kick={
  //         |       |       |       |       |  
  var pat = [1,0,0,0,1,0,0,0,1,0,0,0,1,0,0,0].rotate(1);
  var imp = PulseDivider.kr(~tick.kr,1,~counter.kr);
    var hit = Select.kr(PulseCount.kr(imp)/[1,2,3,4]%pat.size,pat);
  var env = EnvGen.ar(Env([0.001,1,0.001],[0.002,1.5],[1,-1],curve:'exp'),imp * hit);
  var sig = Mix.ar(SinOsc.ar(50+(env**(10..100)*100),mul:0.1));
  sig = sig * env;
  Splay.ar(sig,0.25,0.65);
};
~kick.play;
);" ], [ 2110.4025391, 'kof', "(
~kick.quant=2;
~kick.fadeTime=0.2;
~kick={
  //         |       |       |       |       |  
  var pat = [1,0,0,0,1,0,0,0,1,0,0,0,1,0,0,0].rotate(1);
  var imp = PulseDivider.kr(~tick.kr,1,~counter.kr);
    var hit = Select.kr(PulseCount.kr(imp)/[1,2,3,4]%pat.size,pat);
  var env = EnvGen.ar(Env([0.001,1,0.001],[0.002,1.5],[1,-1],curve:'exp'),imp * hit);
  var sig = Mix.ar(SinOsc.ar(50+(env**(10..100)*100),mul:0.1));
  sig = sig * env;
  Splay.ar(sig,0.25,0.65);
};
~kick.play;
);" ], [ 2105.3362493, 'kof', "~crackle.clear" ], [ 2099.9089389, 'kof', "~kick.clear;" ], [ 2097.498801, 'joach', "~test[6] = \\filter -> {|in| GVerb.ar(in, \\gverb_size.kr(160), \\gverb_time.kr(0.25), 0.9, mul:\\mulgverb.kr(1)) };" ], [ 2091.3824512, 'joach', "~test.set(\\lpf_freq, 4000);" ], [ 2088.1042637, 'joach', "(
~test[3] = \\set -> QuantEnv(\\fplus, 1)
.phase(1, [0,1870,0], [0.005, 0.1225], [-8,-8], 0, 4)
.phase(2, [0,1450,0], [0.007, 0.165], [8,-4], 0, 1)
.play([1,2]);
)" ], [ 2076.4355963, 'kof', "(
~kick.quant=2;
~kick.fadeTime=0.2;
~kick={
  //         |       |       |       |       |  
  var pat = [1,0,0,0,1,0,0,0,1,0,0,0,1,0,0,0].rotate(1);
  var imp = PulseDivider.kr(~tick.kr,1,~counter.kr);
    var hit = Select.kr(PulseCount.kr(imp)/[1,2,3,4]%pat.size,pat);
  var env = EnvGen.ar(Env([0.001,1,0.001],[0.002,1.5],[1,-1],curve:'exp'),imp * hit);
  var sig = Mix.ar(SinOsc.ar(50+(env**(10..100)*100),mul:0.1));
  sig = sig * env;
  Splay.ar(sig,0.25,0.65);
};
~kick.play;
);" ], [ 2071.9093374, 'kof', "(
~kick.quant=2;
~kick.fadeTime=0.2;
~kick={
  //         |       |       |       |       |  
  var pat = [1,0,0,0,1,0,0,0,1,0,0,0,1,0,0,0].rotate(1);
  var imp = PulseDivider.kr(~tick.kr,1,~counter.kr);
    var hit = Select.kr(PulseCount.kr(imp)/[1,2,3,4]%pat.size,pat);
  var env = EnvGen.ar(Env([0.001,1,0.001],[0.002,1.5],[1,-1],curve:'exp'),imp * hit);
  var sig = Mix.ar(SinOsc.ar(50+(env**(10..100)*100),mul:0.1));
  sig = sig * env;
  Splay.ar(sig,0.25,0.65);
};
~kick.play;
);" ], [ 2068.423138, 'kof', "(
~kick.quant=2;
~kick.fadeTime=0.2;
~kick={
  //         |       |       |       |       |  
  var pat = [1,0,0,0,1,0,0,0,1,0,0,0,1,0,0,0].rotate(1);
  var imp = PulseDivider.kr(~tick.kr,1,~counter.kr);
    var hit = Select.kr(PulseCount.kr(imp)/[1,2,3,4]%pat.size,pat);
  var env = EnvGen.ar(Env([0.001,1,0.001],[0.002,1.5],[1,-1],curve:'exp'),imp * hit);
  var sig = Mix.ar(SinOsc.ar(50+(env**(10..100)*100),mul:0.1));
  sig = sig * env;
  Splay.ar(sig,0.75,0.65);
};
~kick.play;
);" ], [ 2066.2650146, 'joach', "(
~test[3] = \\set -> QuantEnv(\\fplus, 1)
.phase(1, [0,1870,0], [0.005, 0.1225], [-8,-8], 0, 4)
.phase(2, [0,450,0], [0.007, 0.165], [8,-4], 0, 1)
.play([1,2]);
)" ], [ 2063.317846, 'joach', "(
~test[3] = \\set -> QuantEnv(\\fplus, 1)
.phase(1, [0,870,0], [0.005, 0.1225], [-8,-8], 0, 4)
.phase(2, [0,450,0], [0.007, 0.165], [8,-4], 0, 1)
.play([1,2]);
)" ], [ 2058.1485503, 'kof', "(
~kick.quant=2;
~kick.fadeTime=0.2;
~kick={
  //         |       |       |       |       |  
  var pat = [1,0,0,0,1,0,0,0,1,0,0,0,1,0,0,0].rotate(1);
  var imp = PulseDivider.kr(~tick.kr,1,~counter.kr);
  var hit = Select.kr(PulseCount.kr(imp)%pat.size,pat);
  var env = EnvGen.ar(Env([0.001,1,0.001],[0.002,1.5],[1,-1],curve:'exp'),imp * hit);
  var sig = Mix.ar(SinOsc.ar(50+(env**(10..100)*100),mul:0.1));
  sig = sig * env;
  Splay.ar(sig,0.75,0.65);
};
~kick.play;
);" ], [ 2055.7774147, 'joach', "(
~test[3] = \\set -> QuantEnv(\\fplus, 1)
.phase(1, [0,870,0], [0.005, 0.1925], [-8,-8], 0, 4)
.phase(2, [0,450,0], [0.007, 0.165], [8,-4], 0, 1)
.play([1,2]);
)" ], [ 2045.3718196, 'kof', "(
~kick.quant=2;
~kick.fadeTime=0.2;
~kick={
  //         |       |       |       |       |  
  var pat = [1,0,0,0,1,0,0,0,1,0,0,0,1,0,0,0].rotate(1);
  var imp = PulseDivider.kr(~tick.kr,2,~counter.kr);
  var hit = Select.kr(PulseCount.kr(imp)%pat.size,pat);
  var env = EnvGen.ar(Env([0.001,1,0.001],[0.002,1.5],[1,-1],curve:'exp'),imp * hit);
  var sig = Mix.ar(SinOsc.ar(50+(env**(10..100)*100),mul:0.1));
  sig = sig * env;
  Splay.ar(sig,0.75,0.65);
};
~kick.play;
);" ], [ 2044.9727967, 'joach', "~test[5] = \\filter -> {|in| LPF.ar(in, \\lpf_freq.kr(800,28)) };" ], [ 2040.694552, 'joach', "~test.set(\\lpf_freq, 2000);" ], [ 2035.0182274, 'joach', "(
~test[3] = \\set -> QuantEnv(\\fplus, 1)
.phase(1, [0,270,0], [0.005, 0.1925], [-8,-8], 0, 4)
.phase(2, [0,450,0], [0.007, 0.165], [8,-4], 0, 1)
.play([1,2]);
)" ], [ 2023.8815904, 'joach', "(
~test[1] = \\set -> QuantEnv(\\amp, 2)
.phase(1, [0,1,0.1], [0.05, 0.95], [2,-2], 0, 4)
.phase(2, [0,1!2,0.2], [0.05, 0.45], [2,-2], 0, 1)
.phase(3, [0.2,1,0.2], [0.85, 0.15], [2,-2], 0, 1)
.play([1,2,1,3]);
)" ], [ 2014.6000595, 'joach', "(
~test[1] = \\set -> QuantEnv(\\amp, 2)
.phase(1, [0,1,0.1], [0.05, 0.95], [2,-2], 0, 4)
.phase(2, [0,1!2,0.2], [0.05, 0.45], [2,-2], 0, 1)
.phase(3, [0.2,1,0.2], [0.35, 0.65], [2,-2], 0, 1)
.play([1,2,1,3]);
)" ], [ 1995.9289916, 'joach', "(
~test[0] = {
	var osc = SinOsc.ar(( \\freq.kr(80) + \\fplus.kr(0) ), mul: 1, add: 0);
	var noise = BrownNoise.ar(\\noise.kr(0), (1 - \\noise.kr(0))) * SinOsc.kr(8);
	var sig = osc * noise;
	Pan2.ar( sig * \\amp.kr(0), \\pan.kr(0) );
};
)" ], [ 1981.3091554, 'kof', "(
~ss.ar(2);
~ss.quant=2;
~ss.fadeTime=8.2;
~ss={
  //         |       |       |       |       |  
  var pat = [1,0,0,0,1,0,0,0,1,0,0,0,1,1,1,1].rotate(1);
  var imp = PulseDivider.kr(~tick.kr,1,~counter.kr);
  var hit = Select.kr(PulseCount.kr(imp)/(1..16)%pat.size,pat);
  var env = EnvGen.ar(Env([0.001,1,0.001],[1.002,4.5],[3,-3],curve:'exp'),imp * hit);
  var sig = SinOsc.ar(432.0/2+((1..4)/1600)/(1+(1..80).reciprocal*[1,2,3,4].reciprocal*pi),mul:0.15/(1..4));
  sig = Normalizer.ar(sig);
  sig = sig * env;
  Splay.ar(sig,0.95,0.15);
};
~ss.play;
);" ], [ 1981.0711418, 'joach', "(
~test[1] = \\set -> QuantEnv(\\amp, 2)
.phase(1, [0,1,0.1], [0.05, 0.45], [2,-2], 0, 4)
.phase(2, [0,1!2,0.2], [0.05, 0.25], [2,-2], 0, 1)
.phase(3, [0.2,1,0.2], [0.35, 0.65], [2,-2], 0, 1)
.play([1,2,1,3]);
)" ], [ 1977.0329108, 'joach', "(
~test[0] = {
	var osc = SinOsc.ar(( \\freq.kr(80) + \\fplus.kr(0) ), mul: 1, add: 0);
	var noise = BrownNoise.ar(\\noise.kr(0), (1 - \\noise.kr(0))) * Saw.kr(8);
	var sig = osc * noise;
	Pan2.ar( sig * \\amp.kr(0), \\pan.kr(0) );
};
)" ], [ 1972.5546546, 'joach', "(
~test[0] = {
	var osc = SinOsc.ar(( \\freq.kr(80) + \\fplus.kr(0) ), mul: 1, add: 0);
	var noise = BrownNoise.ar(\\noise.kr(0), (1 - \\noise.kr(0))) * Saw.kr(40);
	var sig = osc * noise;
	Pan2.ar( sig * \\amp.kr(0), \\pan.kr(0) );
};
)" ], [ 1966.9903364, 'joach', "(
~test[0] = {
	var osc = SinOsc.ar(( \\freq.kr(80) + \\fplus.kr(0) ), mul: 1, add: 0);
	var noise = BrownNoise.ar(\\noise.kr(0), (1 - \\noise.kr(0))) * Saw.kr(80);
	var sig = osc * noise;
	Pan2.ar( sig * \\amp.kr(0), \\pan.kr(0) );
};
)" ], [ 1963.2761239, 'joach', "(
~test[0] = {
	var osc = SinOsc.ar(( \\freq.kr(80) + \\fplus.kr(0) ), mul: 1, add: 0);
	var noise = BrownNoise.ar(\\noise.kr(0), (1 - \\noise.kr(0))) * Saw.kr(40);
	var sig = osc * noise;
	Pan2.ar( sig * \\amp.kr(0), \\pan.kr(0) );
};
)" ], [ 1957.9238178, 'joach', "(
~test[0] = {
	var osc = SinOsc.ar(( \\freq.kr(80) + \\fplus.kr(0) ), mul: 1, add: 0);
	var noise = BrownNoise.ar(\\noise.kr(0), (1 - \\noise.kr(0))) * Saw.kr(8);
	var sig = osc * noise;
	Pan2.ar( sig * \\amp.kr(0), \\pan.kr(0) );
};
)" ], [ 1957.419789, 'kof', "~kick.resume;" ], [ 1952.682518, 'joach', "(
~test[0] = {
	var osc = SinOsc.ar(( \\freq.kr(80) + \\fplus.kr(0) ), mul: 1, add: 0);
	var noise = BrownNoise.ar(\\noise.kr(0), (1 - \\noise.kr(0))) * Saw.kr(80);
	var sig = osc * noise;
	Pan2.ar( sig * \\amp.kr(0), \\pan.kr(0) );
};
)" ], [ 1950.9564193, 'kof', "~sw.clear;" ], [ 1948.713291, 'kof', "~slow.clear;" ], [ 1947.6562305, 'joach', "(
~test[0] = {
	var osc = SinOsc.ar(( \\freq.kr(80) + \\fplus.kr(0) ), mul: 1, add: 0);
	var noise = BrownNoise.ar(\\noise.kr(0), (1 - \\noise.kr(0))) * Saw.kr(60);
	var sig = osc * noise;
	Pan2.ar( sig * \\amp.kr(0), \\pan.kr(0) );
};
)" ], [ 1947.3772146, 'kof', "~slow.clear;" ], [ 1944.0530244, 'joach', "(
~test[0] = {
	var osc = SinOsc.ar(( \\freq.kr(80) + \\fplus.kr(0) ), mul: 1, add: 0);
	var noise = BrownNoise.ar(\\noise.kr(0), (1 - \\noise.kr(0))) * Saw.kr(80);
	var sig = osc * noise;
	Pan2.ar( sig * \\amp.kr(0), \\pan.kr(0) );
};
)" ], [ 1942.3969297, 'kof', "~kick.pause;" ], [ 1938.3797, 'joach', "(
~test[0] = {
	var osc = SinOsc.ar(( \\freq.kr(80) + \\fplus.kr(0) ), mul: 1, add: 0);
	var noise = BrownNoise.ar(\\noise.kr(0), (1 - \\noise.kr(0))) * Saw.kr(8);
	var sig = osc * noise;
	Pan2.ar( sig * \\amp.kr(0), \\pan.kr(0) );
};
)" ], [ 1932.2623501, 'joach', "(
~test[0] = {
	var osc = SinOsc.ar(( \\freq.kr(80) + \\fplus.kr(0) ), mul: 1, add: 0);
	var noise = BrownNoise.ar(\\noise.kr(0), (1 - \\noise.kr(0))) * Saw.kr(80);
	var sig = osc * noise;
	Pan2.ar( sig * \\amp.kr(0), \\pan.kr(0) );
};
)" ], [ 1926.4730189, 'joach', "(
~test[0] = {
	var osc = SinOsc.ar(( \\freq.kr(80) + \\fplus.kr(0) ), mul: 1, add: 0);
	var noise = BrownNoise.ar(\\noise.kr(0), (1 - \\noise.kr(0))) * Saw.kr(60);
	var sig = osc * noise;
	Pan2.ar( sig * \\amp.kr(0), \\pan.kr(0) );
};
)" ], [ 1925.8249819, 'kof', "~kick.resume;" ], [ 1922.0717672, 'kof', "~kick.pause;" ], [ 1920.1386566, 'joach', "(
~test[0] = {
	var osc = SinOsc.ar(( \\freq.kr(80) + \\fplus.kr(0) ), mul: 1, add: 0);
	var noise = BrownNoise.ar(\\noise.kr(0), (1 - \\noise.kr(0))) * Saw.kr(80);
	var sig = osc * noise;
	Pan2.ar( sig * \\amp.kr(0), \\pan.kr(0) );
};
)" ], [ 1913.4792757, 'joach', "(
~test[0] = {
	var osc = SinOsc.ar(( \\freq.kr(80) + \\fplus.kr(0) ), mul: 1, add: 0);
	var noise = BrownNoise.ar(\\noise.kr(0), (1 - \\noise.kr(0))) * Saw.kr(8);
	var sig = osc * noise;
	Pan2.ar( sig * \\amp.kr(0), \\pan.kr(0) );
};
)" ], [ 1901.0985676, 'kof', "(
~sw.ar(2);
~sw.quant=2;
~sw.fadeTime=0.2;
~sw={
  //         |       |       |       |       |  
  var pat = [1,0,0,0,1,0,0,0,1,0,0,0,1,0,0,0].rotate(3);
  var imp = PulseDivider.kr(~tick.kr,1,~counter.kr);
  var hit = Select.kr(PulseCount.kr(imp)/[1,2,4,8]%pat.size,pat);
  var env = EnvGen.ar(Env([0.001,1,1,0.00001],[0.002,0.05*[1,2,3,4],0.002],[3,1,-3],curve:'exp'),imp * hit);
  var sig = [
    SinOsc.ar(4000,mul:1/(1..4)),
    SinOsc.ar(16000!2) * Pulse.ar(4),
    SinOsc.ar(50,SinOsc.ar(50/4).range(-pi,pi)),
    LFNoise2.ar(15000!2)
  ];
  sig = Select.ar(PulseCount.kr(hit * imp)%sig.size,sig);

  sig = sig * env;
  Splay.ar(sig,0.75,0.5);
};
~sw.play;
);" ], [ 1895.89627, 'joach', "(
~test[1] = \\set -> QuantEnv(\\amp, 1)
.phase(1, [0,1,0.1], [0.05, 0.45], [2,-2], 0, 4)
.phase(2, [0,1!2,0.2], [0.05, 0.25], [2,-2], 0, 1)
.phase(3, [0.2,1,0.2], [0.35, 0.65], [2,-2], 0, 1)
.play([1,2,1,3]);
)" ], [ 1894.0791661, 'kof', "~sw.clear;" ], [ 1893.2721199, 'kof', "~sw.stop(7);" ], [ 1881.7354601, 'kof', "(
~kick.quant=2;
~kick.fadeTime=0.2;
~kick={
  //         |       |       |       |       |  
  var pat = [1,0,0,0,1,0,0,0,1,0,0,0,1,1,0,0].rotate(1);
  var imp = PulseDivider.kr(~tick.kr,2,~counter.kr);
    var hit = Select.kr(PulseCount.kr(imp)/[1,2,3,4]%pat.size,pat);
  var env = EnvGen.ar(Env([0.001,1,0.001],[0.002,1.5],[3,-3],curve:'exp'),imp * hit);
    var sig = SinOsc.ar(50+(env**50*100)) + Pulse.ar(4);
  sig = sig * env;
  Splay.ar(sig,0.75,0.5);
};
~kick.play;
);" ], [ 1878.2082583, 'joach', "(
~test[3] = \\set -> QuantEnv(\\fplus, 1)
.phase(1, [0,170,0], [0.005, 0.1925], [-8,-8], 0, 4)
.phase(2, [0,450,0], [0.007, 0.165], [8,-4], 0, 1)
.play([1,2]);
)" ], [ 1873.1559694, 'kof', "(
~kick.ar(2);
~kick.quant=2;
~kick.fadeTime=0.2;
~kick={
  //         |       |       |       |       |  
  var pat = [1,0,0,0,1,0,0,0,1,0,0,0,1,1,0,0].rotate(1);
  var imp = PulseDivider.kr(~tick.kr,2,~counter.kr);
    var hit = Select.kr(PulseCount.kr(imp)/[1,2,3,4]%pat.size,pat);
  var env = EnvGen.ar(Env([0.001,1,0.001],[0.002,4.5],[3,-3],curve:'exp'),imp * hit);
    var sig = SinOsc.ar(50+(env**50*100)) + Pulse.ar(4);
  sig = sig * env;
  Splay.ar(sig,0.75,0.5);
};
~kick.play;
);" ], [ 1867.5036461, 'joach', "~test.set(\\lpf_freq, 1000);" ], [ 1864.0834505, 'kof', "(
~nn.ar(2);
~nn.quant=2;
~nn.fadeTime=0.2;
~nn={
  //         |       |       |       |       |  
  var pat = [1,0,0,0,1,0,0,0,1,0,0,0,1,0,0,0].rotate(3);
  var imp = PulseDivider.kr(~tick.kr,2,~counter.kr);
  var hit = Select.kr(PulseCount.kr(imp)/[1,2,3,4]%pat.size,pat);
  var env = EnvGen.ar(Env([0.001,1,0.001],[0.002,0.05],[3,-3],curve:'exp'),imp * hit);
  var sig = LFNoise2.ar(15000*[1,2,4,8]);
  sig = sig * env;
  Splay.ar(sig,0.75,0.5);
};
~nn.play;
);" ], [ 1853.0848214, 'joach', "~test[6] = nil" ], [ 1848.7165715, 'joach', "~test[4] = nil" ], [ 1836.923897, 'joach', "~test.play(vol: 0.9, fadeTime: 8);" ], [ 1836.3338633, 'kof', "(
~sw.ar(2);
~sw.quant=2;
~sw.fadeTime=0.2;
~sw={
  //         |       |       |       |       |  
  var pat = [1,0,0,0,1,0,0,0,1,0,0,0,1,0,0,0].rotate(3);
  var imp = PulseDivider.kr(~tick.kr,1,~counter.kr);
  var hit = Select.kr(PulseCount.kr(imp)/[1,2,4,8]%pat.size,pat);
  var env = EnvGen.ar(Env([0.001,1,1,0.00001],[0.002,0.05*[1,2,3,4],0.002],[3,1,-3],curve:'exp'),imp * hit);
  var sig = [
    SinOsc.ar(4000,mul:1/(1..4)),
    SinOsc.ar(16000!2) * Pulse.ar(4),
    SinOsc.ar(50,SinOsc.ar(50/4).range(-pi,pi)),
    LFNoise2.ar(15000!2)
  ];
  sig = Select.ar(PulseCount.kr(hit * imp)%sig.size,sig);

  sig = sig * env;
  Splay.ar(sig,0.75,0.5);
};
~sw.play;
);" ], [ 1834.964785, 'joach', "(
~test[0] = {
	var osc = SinOsc.ar(( \\freq.kr(60) + \\fplus.kr(0) ), mul: 1, add: 0);
	var noise = BrownNoise.ar(\\noise.kr(0), (1 - \\noise.kr(0))) * Saw.kr(8);
	var sig = osc * noise;
	Pan2.ar( sig * \\amp.kr(0), \\pan.kr(0) );
};
)" ], [ 1829.5014725, 'joach', "(
~test[1] = \\set -> QuantEnv(\\amp, 1)
.phase(1, [0,1,0.1], [0.05, 0.45], [2,-2], 0, 4)
.phase(2, [0,1!2,0.2], [0.35, 0.65], [2,-2], 0, 1)
.phase(3, [0.2,1,0.2], [0.35, 0.65], [2,-2], 0, 1)
.play([1,2,1,3]);
)" ], [ 1823.9991578, 'kof', "(
~kick.ar(2);
~kick.quant=2;
~kick.fadeTime=0.2;
~kick={
  //         |       |       |       |       |  
  var pat = [1,0,0,0,1,0,0,0,1,0,0,0,1,1,0,0].rotate(1);
  var imp = PulseDivider.kr(~tick.kr,2,~counter.kr);
    var hit = Select.kr(PulseCount.kr(imp)/[1,2,3,4]%pat.size,pat);
  var env = EnvGen.ar(Env([0.001,1,0.001],[0.002,2.5],[3,-3],curve:'exp'),imp * hit);
    var sig = SinOsc.ar(50+(env**50*100)) + Pulse.ar(4);
  sig = sig * env;
  Splay.ar(sig,0.75,0.5);
};
~kick.play;
);" ], [ 1821.6420229, 'joach', "(
~test[3] = \\set -> QuantEnv(\\fplus, 1)
.phase(1, [0,170,0], [0.005, 0.1925], [-8,-8], 0, 4)
.phase(2, [0,250,0], [0.007, 0.165], [8,-4], 0, 1)
.play([1,2]);
)" ], [ 1818.9108667, 'joach', "(
~test[3] = \\set -> QuantEnv(\\fplus, 0.5)
.phase(1, [0,170,0], [0.005, 0.1925], [-8,-8], 0, 4)
.phase(2, [0,250,0], [0.007, 0.165], [8,-4], 0, 1)
.play([1,2]);
)" ], [ 1806.1291357, 'joach', "~test[2] = nil" ], [ 1787.7580849, 'kof', "(
    ~kick.quant=2;
    ~kick.fadeTime=0.2;
    ~kick={
        //         |       |       |       |       |  
        var pat = [1,0,0,0,1,1,0,0,1,0,0,0,1,1,0,0].rotate(3);
        var imp = PulseDivider.kr(~tick.kr,2,~counter.kr);
        var hit = Select.kr(PulseCount.kr(imp)/[1,2,3,4]%pat.size,pat);
        var env = EnvGen.ar(Env([0.001,1,0.001],[0.002,4.5],[3,-3],curve:'exp'),imp * hit);
        var sig = SinOsc.ar(50+(env**100*100),SinOsc.ar(50/2));
        sig = sig * env;
        Splay.ar(sig,0.25,0.95);
    };
    ~kick.play;
);" ], [ 1779.1395919, 'kof', "(
    ~kick.ar(2);
    ~kick.quant=2;
    ~kick.fadeTime=0.2;
    ~kick={
        //         |       |       |       |       |  
        var pat = [1,0,0,0,1,1,0,0,1,0,0,0,1,1,0,0].rotate(3);
        var imp = PulseDivider.kr(~tick.kr,2,~counter.kr);
        var hit = Select.kr(PulseCount.kr(imp)/[1,2,3,4]%pat.size,pat);
        var env = EnvGen.ar(Env([0.001,1,0.001],[0.002,4.5],[3,-3],curve:'exp'),imp * hit);
        var sig = SinOsc.ar(50+(env**100*100),SinOsc.ar(50/2));
        sig = sig * env;
        Splay.ar(sig,0.75,0.95);
    };
    ~kick.play;
);" ], [ 1771.815173, 'kof', "(
    ~hiss.ar(2);
    ~hiss.quant=2;
    ~hiss.fadeTime=0.2;
    ~hiss={
        //         |       |       |       |       |  
        var pat = [1,0,0,0,1,0,0,0,1,0,0,0,1,0,0,0].rotate(1);
        var imp = PulseDivider.kr(~tick.kr,1,~counter.kr);
        var hit = Select.kr(PulseCount.kr(imp)%pat.size,pat);
        var env = EnvGen.ar(Env([0.001,1,0.001],[0.002,0.15],[3,-3],curve:'exp'),imp * hit);
        var sig = WhiteNoise.ar(1);
        sig = HPF.ar(sig,8000);
        sig = sig * env;
        Splay.ar(sig,0.75,0.95);
    };
    ~hiss.play;
);" ], [ 1764.4597523, 'kof', "(
    ~kick.ar(2);
    ~kick.quant=2;
    ~kick.fadeTime=0.2;
    ~kick={
        //         |       |       |       |       |  
        var pat = [1,0,0,0,1,1,0,0,1,0,0,0,1,1,0,0].rotate(3);
        var imp = PulseDivider.kr(~tick.kr,2,~counter.kr);
        var hit = Select.kr(PulseCount.kr(imp)%pat.size,pat);
        var env = EnvGen.ar(Env([0.001,1,0.001],[0.002,4.5],[3,-3],curve:'exp'),imp * hit);
        var sig = SinOsc.ar(50+(env**100*100),SinOsc.ar(50/2));
        sig = sig * env;
        Splay.ar(sig,0.75,0.95);
    };
    ~kick.play;
);" ], [ 1754.5881877, 'joach', "~test.stop(16);" ], [ 1752.0880447, 'kof', "~hiss.stop(7);" ], [ 1748.561843, 'kof', "~first.clear;" ], [ 1746.2917131, 'joach', "~test[6] = \\filter -> {|in| GVerb.ar(in, \\gverb_size.kr(160), \\gverb_time.kr(8.25), 0.9, mul:\\mulgverb.kr(1)) };" ], [ 1746.1207034, 'kof', "~chaotic.clear;" ], [ 1743.7425673, 'kof', "~ssmp.clear;" ], [ 1739.522326, 'joach', "~test[6] = \\filter -> {|in| GVerb.ar(in, \\gverb_size.kr(6), \\gverb_time.kr(8.25), 0.9, mul:\\mulgverb.kr(1)) };" ], [ 1733.840001, 'joach', "~test.set(\\lpf_freq, 14000);" ], [ 1728.92872, 'joach', "~test.set(\\lpf_freq, 4000);" ], [ 1716.916033, 'joach', "(
~test[1] = \\set -> QuantEnv(\\amp, 4)
.phase(1, [0,1,0.2], [0.05, 0.45], [2,-2], 0, 4)
.phase(2, [0,1!2,0.2], [0.35, 0.65], [2,-2], 0, 1)
.phase(3, [0.2,1,0.2], [0.35, 0.65], [2,-2], 0, 1)
.play([1,2,1,3]);
)" ], [ 1716.1919915, 'kof', "~x={RandSeed.ar(Impulse.ar(8),LFSaw.ar(1/4).range(0,10))};" ], [ 1714.5949002, 'kof', "~x={RandSeed.ar(Impulse.ar(80),LFSaw.ar(1/4).range(0,10))};" ], [ 1712.9578066, 'kof', "~x={RandSeed.ar(Impulse.ar(800),LFSaw.ar(1/4).range(0,10))};" ], [ 1710.727679, 'kof', "~x={RandSeed.ar(Impulse.ar(80),LFSaw.ar(1/4).range(0,10))};" ], [ 1705.5893851, 'kof', "~x={RandSeed.ar(Impulse.ar(8),LFSaw.ar(1/4).range(0,10))};" ], [ 1694.9737779, 'kof', "~x={RandSeed.ar(Impulse.ar(8),500)};" ], [ 1693.4916932, 'kof', "~x={RandSeed.ar(Impulse.ar(8),50)};" ], [ 1692.893659, 'joach', "(
~test[4] = \\set -> QuantEnv(\\noise, 4)
.phase(1, [0,1.3,0], [2.05, 1.95], [2,-2], 0, 1)
.phase(2, [0,0.7,0], [3.35, 0.65], [2,-2], 0, 1)
.play([1,2]);
)" ], [ 1690.831541, 'kof', "~x={RandSeed.ar(Impulse.ar(8),5)};" ], [ 1688.820426, 'kof', "~x={RandSeed.ar(Impulse.ar(8),9)};" ], [ 1686.7763091, 'joach', "~test.play(vol: 0.9, fadeTime: 8);" ], [ 1686.286281, 'kof', "~x={RandSeed.ar(Impulse.ar(8),99)};" ], [ 1684.1631596, 'kof', "~x={RandSeed.ar(Impulse.ar(1),99)};" ], [ 1677.2917666, 'kof', "~x={RandSeed.ar(Impulse.ar(1/4),99)};" ], [ 1674.5176079, 'kof', "~x={RandSeed.ar(Impulse.ar(4),99)};" ], [ 1674.0025784, 'joach', "~test[6] = \\filter -> {|in| GVerb.ar(in, \\gverb_size.kr(6), \\gverb_time.kr(0.25), 0.9, mul:\\mulgverb.kr(1)) };" ], [ 1668.5892688, 'kof', "~x={RandSeed.ar(Impulse.ar(1),99)};" ], [ 1666.6471577, 'kof', "~x={RandSeed.ar(Impulse.ar(16),99)};" ], [ 1664.5030351, 'kof', "~x={RandSeed.ar(Impulse.ar(8),99)};" ], [ 1660.56681, 'joach', "(
~test[2] = \\set -> QuantEnv(\\freq, 16)
.phase(1, [600,56,60], [2.05, 5.325], [8,-8], 0, 4)
.phase(2, [180,188,180], [0.35, 0.65], [2,-2], 0, 1)
.phase(2, [480,88,480], [0.35, 0.65], [2,-2], 0, 2)
.play([1,2,1,3,2]);
)" ], [ 1660.1057836, 'kof', "~x={RandSeed.ar(Impulse.ar(4),99)};" ], [ 1646.9160292, 'joach', "(
~test[2] = \\set -> QuantEnv(\\freq, 16)
.phase(1, [600,56,60], [2.05, 5.325], [8,-8], 0, 4)
.phase(2, [180,188,180], [0.35, 0.65], [2,-2], 0, 1)
.phase(2, [480,488,480], [0.35, 0.65], [2,-2], 0, 2)
.play([1,2,1,3,2]);
)" ], [ 1644.4048856, 'joach', "(
~test[2] = \\set -> QuantEnv(\\freq, 16)
.phase(1, [600,560,60], [2.05, 5.325], [8,-8], 0, 4)
.phase(2, [180,188,180], [0.35, 0.65], [2,-2], 0, 1)
.phase(2, [480,488,480], [0.35, 0.65], [2,-2], 0, 2)
.play([1,2,1,3,2]);
)" ], [ 1639.9306296, 'joach', "(
~test[2] = \\set -> QuantEnv(\\freq, 16)
.phase(1, [60,560,60], [2.05, 5.325], [8,-8], 0, 4)
.phase(2, [180,188,180], [0.35, 0.65], [2,-2], 0, 1)
.phase(2, [480,488,480], [0.35, 0.65], [2,-2], 0, 2)
.play([1,2,1,3,2]);
)" ], [ 1635.4473732, 'joach', "~test.set(\\lpf_freq, 400);" ], [ 1631.8451672, 'joach', "(
~test[4] = \\set -> QuantEnv(\\noise, 4)
.phase(1, [0,0.3,0], [2.05, 1.95], [2,-2], 0, 1)
.phase(2, [0,0.7,0], [3.35, 0.65], [2,-2], 0, 1)
.play([1,2]);
)" ], [ 1626.4948612, 'joach', "(
~test[3] = \\set -> QuantEnv(\\fplus, 0.5)
.phase(1, [0,400,0], [0.005, 0.0925], [-8,-8], 0, 4)
.phase(2, [0,4500,0], [0.007, 0.065], [8,-4], 0, 1)
.play([1,2]);
)" ], [ 1621.6915864, 'joach', "(
~test[1] = \\set -> QuantEnv(\\amp, 1)
.phase(1, [0,1,0.2], [0.05, 0.45], [2,-2], 0, 4)
.phase(2, [0,1!2,0.2], [0.35, 0.65], [2,-2], 0, 1)
.phase(3, [0.2,1,0.2], [0.35, 0.65], [2,-2], 0, 1)
.play([1,2,1,3]);
)" ], [ 1618.2013868, 'joach', "(
~test[1] = \\set -> QuantEnv(\\amp, 2)
.phase(1, [0,1,0.2], [0.05, 0.45], [2,-2], 0, 4)
.phase(2, [0,1!2,0.2], [0.35, 0.65], [2,-2], 0, 1)
.phase(3, [0.2,1,0.2], [0.35, 0.65], [2,-2], 0, 1)
.play([1,2,1,3]);
)" ], [ 1605.2006432, 'joach', "(
~test[2] = \\set -> QuantEnv(\\freq, 16)
.phase(1, [600,560,600], [2.05, 5.325], [8,-8], 0, 4)
.phase(2, [180,188,180], [0.35, 0.65], [2,-2], 0, 1)
.phase(2, [480,488,480], [0.35, 0.65], [2,-2], 0, 2)
.play([1,2,1,3,2]);
)" ], [ 1589.1537254, 'joach', "(
~test[2] = \\set -> QuantEnv(\\freq, 8)
.phase(1, [600,560,600], [2.05, 5.325], [8,-8], 0, 4)
.phase(2, [180,188,180], [0.35, 0.65], [2,-2], 0, 1)
.phase(2, [480,488,480], [0.35, 0.65], [2,-2], 0, 2)
.play([1,2,1,3,2]);
)" ], [ 1588.605694, 'joach', "Kolektiv.tempo_(480);" ], [ 1581.0762634, 'joach', "~test[6] = \\filter -> {|in| GVerb.ar(in, \\gverb_size.kr(6), \\gverb_time.kr(4.25), 0.9, mul:\\mulgverb.kr(1)) };" ], [ 1576.594007, 'joach', "~test[6] = \\filter -> {|in| GVerb.ar(in, \\gverb_size.kr(60), \\gverb_time.kr(4.25), 0.9, mul:\\mulgverb.kr(1)) };" ], [ 1571.1336947, 'joach', "~test[6] = \\filter -> {|in| GVerb.ar(in, \\gverb_size.kr(2), \\gverb_time.kr(4.25), 0.9, mul:\\mulgverb.kr(1)) };" ], [ 1564.8003324, 'joach', "~test[6] = \\filter -> {|in| GVerb.ar(in, \\gverb_size.kr(2), \\gverb_time.kr(0.25), 0.9, mul:\\mulgverb.kr(1)) };" ], [ 1562.0721764, 'kof', "~x  = {RandSeed.ar(Impulse.ar(50),900)};" ], [ 1560.2760737, 'kof', "~x  = {RandSeed.ar(Impulse.ar(50),90)};" ], [ 1559.5630329, 'joach', "~test[6] = \\filter -> {|in| GVerb.ar(in, \\gverb_size.kr(12), \\gverb_time.kr(0.25), 0.9, mul:\\mulgverb.kr(1)) };" ], [ 1558.271959, 'kof', "~x  = {RandSeed.ar(Impulse.ar(50),9)};" ], [ 1555.246786, 'kof', "~x  = {RandSeed.ar(Impulse.ar(50),99)};" ], [ 1554.1027206, 'joach', "~test[6] = \\filter -> {|in| GVerb.ar(in, \\gverb_size.kr(12), \\gverb_time.kr(1.25), 0.9, mul:\\mulgverb.kr(1)) };" ], [ 1552.0886054, 'kof', "~x  = {RandSeed.ar(Impulse.ar(44),99)};" ], [ 1547.5413453, 'joach', "~test.set(\\lpf_freq, 2400);" ], [ 1547.1553232, 'kof', "~x  = {RandSeed.ar(Impulse.ar(32),99)};" ], [ 1544.1201496, 'kof', "~x  = {RandSeed.ar(Impulse.ar(16),99)};" ], [ 1540.1839245, 'kof', "~x  = {RandSeed.ar(Impulse.ar(8),99)};" ], [ 1537.0627459, 'joach', "(
~test[2] = \\set -> QuantEnv(\\freq, 8)
.phase(1, [600,660,600], [2.05, 5.325], [8,-8], 0, 4)
.phase(2, [180,188,180], [0.35, 0.65], [2,-2], 0, 1)
.phase(2, [480,488,480], [0.35, 0.65], [2,-2], 0, 2)
.play([1,2,1,3,2]);
)" ], [ 1535.3186462, 'joach', "(
~test[2] = \\set -> QuantEnv(\\freq, 8)
.phase(1, [600,660,600], [2.05, 5.325], [8,-8], 0, 4)
.phase(2, [180,188,180], [0.35, 0.65], [2,-2], 0, 1)
.phase(2, [480,488,480], [0.35, 0.65], [2,-2], 0, 2)
.play([1,2,1,3]);
)" ], [ 1535.0566312, 'kof', "~x  = {RandSeed.ar(Impulse.ar(80),99)};" ], [ 1522.5079134, 'kof', "~x  = {RandSeed.ar(Impulse.ar(800),99)};" ], [ 1513.0683735, 'kof', "~x  = {RandSeed.ar(Impulse.ar(80),99)};" ], [ 1510.5282282, 'joach', "(
~test[2] = \\set -> QuantEnv(\\freq, 8)
.phase(1, [600,660,600], [2.05, 5.325], [8,-8], 0, 8)
.phase(2, [180,188,180], [0.35, 0.65], [2,-2], 0, 1)
.play([1,2]);
)" ], [ 1502.009741, 'kof', "~x  = {RandSeed.ar(Impulse.ar(44),99)};" ], [ 1500.9146784, 'joach', "~test.set(\\lpf_freq, 1400);" ], [ 1499.9906255, 'kof', "(
    ~hiss.ar(2);
    ~hiss.quant=2;
    ~hiss.fadeTime=0.2;
    ~hiss={
        //         |       |       |       |       |  
        var pat = [1,0,0,0,1,0,0,0,1,0,0,0,1,0,0,0].rotate(1);
        var imp = PulseDivider.kr(~tick.kr,1,~counter.kr);
        var hit = Select.kr(PulseCount.kr(imp)%pat.size,pat);
        var env = EnvGen.ar(Env([0.001,1,0.001],[1.002,0.15],[3,-3],curve:'exp'),imp * hit);
        var sig = WhiteNoise.ar(1);
        sig = HPF.ar(sig,8000);
        sig = sig * env;
        Splay.ar(sig,0.75,0.95);
    };
    ~hiss.play;
);" ], [ 1497.6394911, 'joach', "(
~test[3] = \\set -> QuantEnv(\\fplus, 0.5)
.phase(1, [0,100,0], [0.005, 0.0925], [-8,-8], 0, 4)
.phase(2, [0,4500,0], [0.007, 0.065], [8,-4], 0, 1)
.play([1,2]);
)" ], [ 1479.5134543, 'joach', "(
~test[2] = \\set -> QuantEnv(\\freq, 8)
.phase(1, [600,660,600], [2.05, 5.325], [8,-8], 0, 1)
.phase(2, [180,188,180], [0.35, 0.65], [2,-2], 0, 1)
.play([1,2]);
)" ], [ 1471.9420212, 'kof', "(
    ~hiss.ar(2);
    ~hiss.quant=2;
    ~hiss.fadeTime=0.2;
    ~hiss={
        //         |       |       |       |       |  
        var pat = [1,0,0,0,1,0,0,0,1,0,0,0,1,0,0,0].rotate(1);
        var imp = PulseDivider.kr(~tick.kr,1,~counter.kr);
        var hit = Select.kr(PulseCount.kr(imp)%pat.size,pat);
        var env = EnvGen.ar(Env([0.001,1,0.001],[0.002,0.15],[3,-3],curve:'exp'),imp * hit);
        var sig = WhiteNoise.ar(1);
        sig = HPF.ar(sig,8000);
        sig = sig * env;
        Splay.ar(sig,0.75,0.95);
    };
    ~hiss.play;
);" ], [ 1459.6423177, 'joach', "(
~test[7] = \\set -> QuantEnv(\\mulgverb, 8)
.phase(1, [0.1,1,0.1], [0.05, 7.95], [2,-2], 0, 4)
.phase(2, [0,1,0], [2.35, 5.65], [2,-2], 0, 1)
.play([1,2]);
)" ], [ 1449.1557179, 'joach', "(
~test[7] = \\set -> QuantEnv(\\mulgverb, 8)
.phase(1, [0,1,0], [0.05, 7.95], [2,-2], 0, 4)
.phase(2, [0,1,0], [2.35, 5.65], [2,-2], 0, 1)
.play([1,2]);
)" ], [ 1438.0180809, 'joach', "~test.play(vol: 0.5, fadeTime: 8);" ], [ 1435.2849246, 'joach', "(
~test[3] = \\set -> QuantEnv(\\fplus, 0.5)
.phase(1, [0,100,0], [0.005, 0.0925], [-8,-8], 0, 4)
.phase(2, [0,450,0], [0.007, 0.065], [8,-4], 0, 1)
.play([1,2]);
)" ], [ 1423.9682773, 'kof', "(
~kick.quant=2;
~kick.fadeTime=0.2;
~kick={
  //         |       |       |       |       |  
  var pat = [1,0,0,0,1,0,0,0,1,0,0,0,1,0,0,0].rotate(1);
  var imp = PulseDivider.kr(~tick.kr,2,~counter.kr);
  var hit = Select.kr(PulseCount.kr(imp)%pat.size,pat);
  var env = EnvGen.ar(Env([0.001,1,0.001],[0.002,1.5],[1,-1],curve:'exp'),imp * hit);
  var sig = Mix.ar(SinOsc.ar(50+(env**(10..100)*100),mul:0.1));
  sig = sig * env;
  Splay.ar(sig,0.75,0.65);
};
~kick.play;
);" ], [ 1418.3639568, 'joach', "(
~test[1] = \\set -> QuantEnv(\\amp, 8)
.phase(1, [0,1,0.2], [0.05, 7.45], [2,-2], 0, 4)
.phase(2, [0,1!2,0.2], [0.35, 3.65], [2,-2], 0, 1)
.phase(3, [0.2,1,0.2], [3.35, 0.65], [2,-2], 0, 1)
.play([1,2,1,3]);
)" ], [ 1388.157229, 'kof', "(
~sw.ar(2);
~sw.quant=2;
~sw.fadeTime=0.2;
~sw={
  //         |       |       |       |       |  
  var pat = [1,0,0,0,1,0,0,0,1,0,0,0,1,0,0,0].rotate(3);
  var imp = PulseDivider.kr(~tick.kr,4,~counter.kr);
  var hit = Select.kr(PulseCount.kr(imp)/[1,2,4,8]%pat.size,pat);
  var env = EnvGen.ar(Env([0.001,1,1,0.00001],[0.002,0.05*[1,2,3,4],0.002],[3,1,-3],curve:'exp'),imp * hit);
  var sig = [
    SinOsc.ar(4000,mul:1/(1..4)),
    SinOsc.ar(16000!2) * Pulse.ar(4),
    SinOsc.ar(50,SinOsc.ar(50/4).range(-pi,pi)),
    LFNoise2.ar(15000!2)
  ];
  sig = Select.ar(PulseCount.kr(hit * imp)%sig.size,sig);

  sig = sig * env;
  Splay.ar(sig,0.75,0.5);
};
~sw.play;
);" ], [ 1376.4705606, 'kof', "~ff.clear;" ], [ 1374.3114371, 'kof', "~high.clear;" ], [ 1372.2543194, 'kof', "~kick.clear;" ], [ 1366.6309978, 'kof', "~neuKick.clear;" ], [ 1363.3948127, 'kof', "~hat.clear;" ], [ 1360.2916352, 'kof', "~longnoise.clear;" ], [ 1357.9495012, 'kof', "~mld.clear;" ], [ 1342.6026235, 'joach', "~test.stop(16);" ], [ 1322.0284467, 'kof', "(
~slow2.ar(2);
~slow2.quant=2;
~slow2.fadeTime=0.2;
~slow2={
  //         |       |       |       |       |  
  var pat = [1,0,0,0,1,0,0,0,1,0,0,0,1,0,0,0].rotate(3);
  var imp = PulseDivider.kr(~tick.kr,16,~counter.kr);
  var hit = Select.kr(PulseCount.kr(imp)%pat.size,pat);
  var env = EnvGen.ar(Env([0.001,1,0.001],[2.002,2.5],[3,-3],curve:'exp'),imp * hit);
  var sig = Pulse.ar(4);
  sig = sig * env;
  Splay.ar(sig,0.75,0.15);
};
~slow2.play;
);" ], [ 1309.5177311, 'joach', "(
~test[4] = \\set -> QuantEnv(\\noise, 4)
.phase(1, [0,0.3,0], [2.05, 1.95], [2,-2], 0, 1)
.phase(2, [0,0.7,0], [3.35, 0.65], [2,-2], 0, 1)
.play([1,2]);
)" ], [ 1295.2679161, 'kof', "~ssnt.clear;" ], [ 1290.300632, 'joach', "(
~test[0] = {
var osc = SinOsc.ar(( \\freq.kr(60) + \\fplus.kr(0) ), mul: 1, add: 0);
	var noise = BrownNoise.ar(\\noise.kr(0), (1 - \\noise.kr(0))) * Saw.kr(8);
var sig = osc * noise;
Pan2.ar( sig * \\amp.kr(0), \\pan.kr(0) );
};
)" ], [ 1277.3418908, 'kof', "(
  ~mld.quant=2;
  ~mld.fadeTime=0.2;
  ~mld={
    //         |       |       |       |       |  
    var pat = [1,0,0,0,1,0,0,0,1,0,0,0,1,0,0,0].rotate(3);
    var imp = PulseDivider.kr(~tick.kr,[16,32,64]/16,~counter.kr);
    var hit = Select.kr(PulseCount.kr(imp)%pat.size,pat);
    var mod = Select.kr(PulseCount.kr(hit)/2%4,[1,1.5,1.25,2]);
    var mod2 = Select.kr(PulseCount.kr(hit)/8%8,[1,1.5,8,2,4,16,0.5,1]);
    var env = EnvGen.ar(Env([0.001,1,0.001],[0.0052,1.5],[3,-3],curve:'exp'),imp * hit);
    var sig = Mix.ar(LFSaw.ar(432*mod2/mod + SinOsc.ar(1/4/[2,3,4]/(1..8)).range(-2,2),mul:0.5/(1..8)));
    sig = MoogFF.ar(sig,432*[1,1.5,3]/mod,[1,2,2.25]).distort;
    sig = OnePole.ar(sig,0.95*env);
    sig = sig * env;
    Splay.ar(sig,0.75,0.5);
  };
  ~mld.play;
);" ], [ 1262.4820408, 'joach', "(
~test[4] = \\set -> QuantEnv(\\noise, 4)
.phase(1, [0,0.3,0], [2.05, 8.95], [2,-2], 0, 1)
.phase(2, [0,0.7,0], [4.35, 24.65], [2,-2], 0, 1)
.play([1,2]);
)" ], [ 1258.9108366, 'kof', "(
    ~hiss.ar(2);
    ~hiss.quant=2;
    ~hiss.fadeTime=0.2;
    ~hiss={
        //         |       |       |       |       |  
        var pat = [1,0,0,0,1,0,0,0,1,0,0,0,1,0,0,0].rotate(1);
        var imp = PulseDivider.kr(~tick.kr,1,~counter.kr);
        var hit = Select.kr(PulseCount.kr(imp)%pat.size,pat);
        var env = EnvGen.ar(Env([0.001,1,0.001],[1.002,0.15],[3,-3],curve:'exp'),imp * hit);
        var sig = WhiteNoise.ar(1);
        sig = HPF.ar(sig,8000);
        sig = sig * env;
        Splay.ar(sig,0.75,0.95);
    };
    ~hiss.play;
);" ], [ 1254.7325976, 'joach', "(
~test[4] = \\set -> QuantEnv(\\noise, 4)
.phase(1, [0,0.3,0], [12.05, 18.95], [2,-2], 0, 1)
.phase(2, [0,0.7,0], [4.35, 24.65], [2,-2], 0, 1)
.play([1,2]);
)" ], [ 1247.1361631, 'kof', "(
    ~kick.ar(2);
    ~kick.quant=2;
    ~kick.fadeTime=0.2;
    ~kick={
        //         |       |       |       |       |  
        var pat = [1,0,0,0,1,1,0,0,1,0,0,0,1,1,0,0].rotate(3);
        var imp = PulseDivider.kr(~tick.kr,4,~counter.kr);
        var hit = Select.kr(PulseCount.kr(imp)%pat.size,pat);
        var env = EnvGen.ar(Env([0.001,1,0.001],[0.002,4.5],[3,-3],curve:'exp'),imp * hit);
        var sig = SinOsc.ar(50+(env**100*100),SinOsc.ar(50/2));
        sig = sig * env;
        Splay.ar(sig,0.75,0.95);
    };
    ~kick.play;
);" ], [ 1246.2111102, 'joach', "~test.set(\\lpf_freq, 4400);" ], [ 1240.3197732, 'joach', "(
~test[3] = \\set -> QuantEnv(\\fplus, 1)
.phase(1, [0,100,0], [0.005, 0.0925], [-8,-8], 0, 4)
.phase(2, [0,450,0], [0.007, 0.065], [8,-4], 0, 1)
.play([1,2]);
)" ], [ 1230.8152296, 'joach', "~test.set(\\lpf_freq, 1400);" ], [ 1224.4818673, 'joach', "(
~test[3] = \\set -> QuantEnv(\\fplus, 1)
.phase(1, [0,100,0], [0.05, 0.0925], [-8,-8], 0, 4)
.phase(2, [0,450,0], [0.07, 0.065], [8,-4], 0, 1)
.play([1,2]);
)" ], [ 1222.4417506, 'kof', "(
  ~mld.quant=2;
  ~mld.fadeTime=0.2;
  ~mld={
    //         |       |       |       |       |  
    var pat = [1,0,0,0,1,0,0,0,1,0,0,0,1,0,0,0].rotate(3);
    var imp = PulseDivider.kr(~tick.kr,[16,32,64]/8,~counter.kr);
    var hit = Select.kr(PulseCount.kr(imp)%pat.size,pat);
    var mod = Select.kr(PulseCount.kr(hit)/2%4,[1,1.5,1.25,2]);
    var mod2 = Select.kr(PulseCount.kr(hit)/8%8,[1,1.5,8,2,4,16,0.5,1]);
    var env = EnvGen.ar(Env([0.001,1,0.001],[0.0052,1.5],[3,-3],curve:'exp'),imp * hit);
    var sig = Mix.ar(LFSaw.ar(432*mod2/mod + SinOsc.ar(1/4/[2,3,4]/(1..8)).range(-2,2),mul:0.5/(1..8)));
    sig = MoogFF.ar(sig,432*[1,1.5,3]/mod,[1,2,2.25]).distort;
    sig = OnePole.ar(sig,0.95*env);
    sig = sig * env;
    Splay.ar(sig,0.75,0.5);
  };
  ~mld.play;
);" ], [ 1215.4183489, 'joach', "(
~test[1] = \\set -> QuantEnv(\\amp, 1)
.phase(1, [0,1,0.2], [0.05, 3.45], [2,-2], 0, 4)
.phase(2, [0,1,0.2], [0.35, 3.65], [2,-2], 0, 1)
.phase(3, [0.2,1,0.2], [3.35, 0.65], [2,-2], 0, 1)
.play([1,2,1,3]);
)" ], [ 1199.0804145, 'kof', "(
  ~mld.quant=2;
  ~mld.fadeTime=0.2;
  ~mld={
    //         |       |       |       |       |  
    var pat = [1,0,0,0,1,0,0,0,1,0,0,0,1,0,0,0].rotate(3);
    var imp = PulseDivider.kr(~tick.kr,[16,32,64]/8,~counter.kr);
    var hit = Select.kr(PulseCount.kr(imp)%pat.size,pat);
    var mod = Select.kr(PulseCount.kr(hit)/2%4,[1,1.5,1.25,2]);
    var mod2 = Select.kr(PulseCount.kr(hit)/8%8,[1,1.5,8,2,4,16,0.5,1]);
    var env = EnvGen.ar(Env([0.001,1,0.001],[0.0052,1.5],[3,-3],curve:'exp'),imp * hit);
    var sig = Mix.ar(LFSaw.ar(432*mod2/mod + SinOsc.ar(1/4/[2,3,4]/(1..8)).range(-2,2),mul:0.5/(1..8)));
    sig = MoogFF.ar(sig,432*[1,1.5,3]/mod,[1,2,2.25]).distort;
    sig = OnePole.ar(sig,0.95*env);
    sig = sig * env;
    Splay.ar(sig,0.75,0.25);
  };
  ~mld.play;
);" ], [ 1179.7273075, 'kof', "~nn.clear;" ], [ 1179.4892939, 'joach', "(
~test[3] = \\set -> QuantEnv(\\fplus, 1)
.phase(1, [0,100,0], [0.005, 0.0925], [-8,-8], 0, 4)
.phase(2, [0,450,0], [0.007, 0.065], [8,-4], 0, 1)
.play([1,2]);
)" ], [ 1177.7441941, 'joach', "(
~test[3] = \\set -> QuantEnv(\\fplus, 1)
.phase(1, [0,100,0], [0.005, 0.0925], [-8,-8], 0, 4)
.phase(2, [0,450,0], [0.007, 0.65], [8,-4], 0, 1)
.play([1,2]);
)" ], [ 1177.287168, 'kof', "~kick.clear;" ], [ 1174.8650294, 'kof', "~slow.clear;" ], [ 1172.7109062, 'kof', "~slow.clear;" ], [ 1169.6797328, 'kof', "~sw.clear;" ], [ 1165.6255009, 'joach', "(
~test[3] = \\set -> QuantEnv(\\fplus, 1)
.phase(1, [0,100,0], [0.005, 0.925], [-8,-8], 0, 4)
.phase(2, [0,450,0], [0.007, 0.65], [8,-4], 0, 1)
.play([1,2]);
)" ], [ 1156.0129511, 'joach', "(
~test[2] = \\set -> QuantEnv(\\freq, 8)
.phase(1, [60,66,60], [2.05, 5.325], [8,-8], 0, 1)
.phase(2, [80,88,80], [0.35, 0.65], [2,-2], 0, 1)
.play([1,2]);
)" ], [ 1145.8573703, 'joach', "(
~test[2] = \\set -> QuantEnv(\\freq, 8)
.phase(1, [60,66,60], [2.05, 5.325], [8,-8], 0, 1)
.phase(2, [0,1,0], [0.35, 0.65], [2,-2], 0, 1)
.play([1]);
)" ], [ 1139.4160018, 'joach', "(
~test[2] = \\set -> QuantEnv(\\freq, 8)
.phase(1, [100,80,60], [2.05, 5.325], [8,-8], 0, 1)
.phase(2, [0,1,0], [0.35, 0.65], [2,-2], 0, 1)
.play([1]);
)" ], [ 1134.0626957, 'joach', "(
~test[2] = \\set -> QuantEnv(\\freq, 8)
.phase(1, [100,80,60], [2.05, 6.325], [8,-8], 0, 1)
.phase(2, [0,1,0], [0.35, 0.65], [2,-2], 0, 1)
.play([1]);
)" ], [ 1127.1853023, 'joach', "(
~test[2] = \\set -> QuantEnv(\\freq, 8)
.phase(1, [100,80,60], [0.05, 0.325], [8,-8], 0, 1)
.phase(2, [0,1,0], [0.35, 0.65], [2,-2], 0, 1)
.play([1]);
)" ], [ 1101.3088222, 'joach', "~test[6] = \\filter -> {|in| GVerb.ar(in, \\gverb_size.kr(12), \\gverb_time.kr(4.25), 0.9, mul:\\mulgverb.kr(1)) };" ], [ 1093.9894036, 'joach', "(
~test[7] = \\set -> QuantEnv(\\mulgverb, 8)
.phase(1, [0,1,0], [0.05, 7.95], [2,-2], 0, 4)
.phase(2, [0,1,0], [2.35, 5.65], [2,-2], 0, 1)
.play([1,2]);
)" ], [ 1085.4889174, 'kof', "b = Buffer.read(s,Platform.resourceDir ++ \"/sounds/beat2.wav\");" ], [ 1066.057806, 'kof', "(
~sw.ar(2);
~sw.quant=2;
~sw.fadeTime=0.2;
~sw={
  //         |       |       |       |       |  
  var pat = [1,0,0,0,1,0,0,0,1,0,0,0,1,0,0,0].rotate(3);
  var imp = PulseDivider.kr(~tick.kr,4,~counter.kr);
  var hit = Select.kr(PulseCount.kr(imp)/[1,2,4,8]%pat.size,pat);
  var env = EnvGen.ar(Env([0.001,1,1,0.00001],[0.002,0.05*[1,2,3,4],0.002],[3,1,-3],curve:'exp'),imp * hit);
  var sig = [
    SinOsc.ar(4000,mul:1/(1..4)),
    SinOsc.ar(16000!2) * Pulse.ar(4),
    SinOsc.ar(50,SinOsc.ar(50/4).range(-pi,pi)),
    LFNoise2.ar(15000!2)
  ];
  sig = Select.ar(PulseCount.kr(hit * imp)%sig.size,sig);

  sig = sig * env;
  Splay.ar(sig,0.75,0.5);
};
~sw.play;
);" ], [ 1062.5196036, 'kof', "(
~sw.ar(2);
~sw.quant=2;
~sw.fadeTime=0.2;
~sw={
  //         |       |       |       |       |  
  var pat = [1,0,0,0,1,0,0,0,1,0,0,0,1,0,0,0].rotate(3);
  var imp = PulseDivider.kr(~tick.kr,4,~counter.kr);
  var hit = Select.kr(PulseCount.kr(imp)/[1,2,4,8]%pat.size,pat);
  var env = EnvGen.ar(Env([0.001,1,1,0.001],[0.002,0.05*[1,2,3,4],0.002],[3,1,-3],curve:'exp'),imp * hit);
  var sig = [
    SinOsc.ar(4000,mul:1/(1..4)),
    SinOsc.ar(16000!2) * Pulse.ar(4),
    SinOsc.ar(50,SinOsc.ar(50/4).range(-pi,pi)),
    LFNoise2.ar(15000!2)
  ];
  sig = Select.ar(PulseCount.kr(hit * imp)%sig.size,sig);

  sig = sig * env;
  Splay.ar(sig,0.75,0.5);
};
~sw.play;
);" ], [ 1055.9742292, 'kof', "(
~slow2.ar(2);
~slow2.quant=2;
~slow2.fadeTime=0.2;
~slow2={
  //         |       |       |       |       |  
  var pat = [1,0,0,0,1,0,0,0,1,0,0,0,1,0,0,0].rotate(3);
  var imp = PulseDivider.kr(~tick.kr,16,~counter.kr);
  var hit = Select.kr(PulseCount.kr(imp)%pat.size,pat);
  var env = EnvGen.ar(Env([0.001,1,0.001],[2.002,2.5],[3,-3],curve:'exp'),imp * hit);
  var sig = Pulse.ar(4);
  sig = sig * env;
  Splay.ar(sig,0.75,0.15);
};
~slow2.play;
);" ], [ 1048.2327865, 'joach', "~test[6] = \\filter -> {|in| GVerb.ar(in, \\gverb_size.kr(12), \\gverb_time.kr(0.25), 0.9, mul:\\mulgverb.kr(1)) };" ], [ 1046.9937156, 'kof', "(
~slow.ar(2);
~slow.quant=2;
~slow.fadeTime=0.2;
~slow={
  //         |       |       |       |       |  
  var pat = [1,0,0,0,1,0,0,0,1,0,0,0,1,0,0,0].rotate(1);
  var imp = PulseDivider.kr(~tick.kr,16,~counter.kr);
  var hit = Select.kr(PulseCount.kr(imp)%pat.size,pat);
  var env = EnvGen.ar(Env([0.001,1,0.001],[1.002,1.5],[3,-3],curve:'exp'),imp * hit);
  var sig = LFSaw.ar(50,0,SinOsc.ar(4).range(-pi,pi));
  sig = sig * env;
  Splay.ar(sig,0.75,0.15);
};
~slow.play;
);" ], [ 1042.3424496, 'joach', "~test[6] = \\filter -> {|in| GVerb.ar(in, \\gverb_size.kr(12), \\gverb_time.kr(1), 0.9, mul:\\mulgverb.kr(1)) };" ], [ 1032.9709135, 'kof', "(
~kick.ar(2);
~kick.quant=2;
~kick.fadeTime=0.2;
~kick={
  //         |       |       |       |       |  
  var pat = [1,0,0,0,1,0,0,0,1,0,0,0,1,1,0,0].rotate(1);
  var imp = PulseDivider.kr(~tick.kr,2,~counter.kr);
  var hit = Select.kr(PulseCount.kr(imp)%pat.size,pat);
  var env = EnvGen.ar(Env([0.001,1,0.001],[0.002,2.5],[3,-3],curve:'exp'),imp * hit);
    var sig = SinOsc.ar(50+(env**50*100)) + Pulse.ar(4);
  sig = sig * env;
  Splay.ar(sig,0.75,0.5);
};
~kick.play;
);" ], [ 1018.5310876, 'joach', "(
~test[1] = \\set -> QuantEnv(\\amp, 1)
.phase(1, [0,1,0.2], [0.05, 3.45], [2,-2], 0, 4)
.phase(2, [0,1,0.2], [0.35, 3.65], [2,-2], 0, 1)
.phase(3, [0,1,0.2], [3.35, 0.65], [2,-2], 0, 1)
.play([1,2,1,3]);
)" ], [ 1018.2190698, 'kof', "(
~nn.ar(2);
~nn.quant=2;
~nn.fadeTime=0.2;
~nn={
  //         |       |       |       |       |  
  var pat = [1,0,0,0,1,0,0,0,1,0,0,0,1,0,0,0].rotate(3);
  var imp = PulseDivider.kr(~tick.kr,1,~counter.kr);
  var hit = Select.kr(PulseCount.kr(imp)/[1,2,3,4]%pat.size,pat);
  var env = EnvGen.ar(Env([0.001,1,0.001],[0.002,0.05],[3,-3],curve:'exp'),imp * hit);
  var sig = LFNoise2.ar(15000*[1,2,4,8]);
  sig = sig * env;
  Splay.ar(sig,0.75,0.5);
};
~nn.play;
);" ], [ 1011.2096689, 'kof', "(
~nn.ar(2);
~nn.quant=2;
~nn.fadeTime=0.2;
~nn={
  //         |       |       |       |       |  
  var pat = [1,0,0,0,1,0,0,0,1,0,0,0,1,0,0,0].rotate(3);
  var imp = PulseDivider.kr(~tick.kr,2,~counter.kr);
  var hit = Select.kr(PulseCount.kr(imp)/[1,2,3,4]%pat.size,pat);
  var env = EnvGen.ar(Env([0.001,1,0.001],[0.002,0.05],[3,-3],curve:'exp'),imp * hit);
  var sig = LFNoise2.ar(15000*[1,2,4,8]);
  sig = sig * env;
  Splay.ar(sig,0.75,0.5);
};
~nn.play;
);" ], [ 1002.697182, 'joach', "(
~test[2] = \\set -> QuantEnv(\\freq, 4)
.phase(1, [100,80,60], [0.05, 0.325], [8,-8], 0, 1)
.phase(2, [0,1,0], [0.35, 0.65], [2,-2], 0, 1)
.play([1]);
)" ], [ 995.4847694, 'joach', "~test.set(\\lpf_freq, 400);" ], [ 983.3670764, 'joach', "(
~test[1] = \\set -> QuantEnv(\\amp, 2)
.phase(1, [0,1,0.2], [0.05, 3.45], [2,-2], 0, 4)
.phase(2, [0,1,0.2], [0.35, 3.65], [2,-2], 0, 1)
.phase(3, [0,1,0.2], [3.35, 0.65], [2,-2], 0, 1)
.play([1,2,1,3]);
)" ], [ 977.5777452, 'joach', "(
~test[1] = \\set -> QuantEnv(\\amp, 4)
.phase(1, [0,1,0.2], [0.05, 3.45], [2,-2], 0, 4)
.phase(2, [0,1,0.2], [0.35, 3.65], [2,-2], 0, 1)
.phase(3, [0,1,0.2], [3.35, 0.65], [2,-2], 0, 1)
.play([1,2,1,3]);
)" ], [ 973.7565267, 'joach', "(
~test[1] = \\set -> QuantEnv(\\amp, 4)
.phase(1, [0,1,0.2], [0.05, 3.45], [2,-2], 0, 4)
.phase(2, [0,1,0.2], [0.35, 3.65], [2,-2], 0, 1)
.phase(3, [0,1,0.2], [3.35, 0.65], [2,-2], 0, 1)
.play([1,2,3]);
)" ], [ 954.3954193, 'joach', "(
~test[3] = \\set -> QuantEnv(\\fplus, 2)
.phase(1, [0,100,0], [0.005, 0.925], [-8,-8], 0, 4)
.phase(2, [0,450,0], [0.007, 0.65], [8,-4], 0, 1)
.play([1,2]);
)" ], [ 946.4249634, 'joach', "(
~test[3] = \\set -> QuantEnv(\\fplus, 2)
.phase(1, [0,100,0], [0.005, 0.925], [-8,-8], 0, 4)
.phase(2, [0,150,0], [0.007, 0.65], [8,-4], 0, 1)
.play([1,2]);
)" ], [ 925.6767767, 'joach', "(
~test[3] = \\set -> QuantEnv(\\fplus, 2)
.phase(1, [0,100,0], [0.005, 0.925], [-8,-8], 0, 1)
.phase(2, [0,1,0], [0.35, 0.65], [2,-2], 0, 1)
.play([1]);
)" ], [ 917.1612896, 'joach', "(
~test[3] = \\set -> QuantEnv(\\fplus, 2)
.phase(1, [0,400,0], [0.005, 0.925], [-8,-8], 0, 1).plot
.phase(2, [0,1,0], [0.35, 0.65], [2,-2], 0, 1)
.play([1]);
)" ], [ 901.2163776, 'joach', "(
~test[2] = \\set -> QuantEnv(\\freq, 4)
.phase(1, [600,80,60], [0.05, 0.325], [8,-8], 0, 1)
.phase(2, [0,1,0], [0.35, 0.65], [2,-2], 0, 1)
.play([1]);
)" ], [ 891.0107939, 'kof', "(
~nn.ar(2);
~nn.quant=2;
~nn.fadeTime=0.2;
~nn={
  //         |       |       |       |       |  
  var pat = [1,0,0,0,1,0,0,0,1,0,0,0,1,0,0,0].rotate(3);
  var imp = PulseDivider.kr(~tick.kr,2,~counter.kr);
  var hit = Select.kr(PulseCount.kr(imp)/[1,2,3,4]%pat.size,pat);
  var env = EnvGen.ar(Env([0.001,1,0.001],[0.002,0.05],[3,-3],curve:'exp'),imp * hit);
  var sig = LFNoise2.ar(5000*[1,2,4,8]);
  sig = sig * env;
  Splay.ar(sig,0.75,0.5);
};
~nn.play;
);" ], [ 884.9624479, 'kof', "(
~kick.ar(2);
~kick.quant=2;
~kick.fadeTime=0.2;
~kick={
  //         |       |       |       |       |  
  var pat = [1,0,0,0,1,0,0,0,1,0,0,0,1,1,0,0].rotate(1);
  var imp = PulseDivider.kr(~tick.kr,2,~counter.kr);
  var hit = Select.kr(PulseCount.kr(imp)%pat.size,pat);
  var env = EnvGen.ar(Env([0.001,1,0.001],[0.002,2.5],[3,-3],curve:'exp'),imp * hit);
  var sig = SinOsc.ar(50+(env**50*500));
  sig = sig * env;
  Splay.ar(sig,0.75,0.5);
};
~kick.play;
);" ], [ 882.3252971, 'joach', "Kolektiv.tempo = 240;" ], [ 868.8925288, 'joach', "Kolektiv.tempo = 440;" ], [ 859.4249873, 'joach', "Kolektiv.tempo_(240);" ], [ 827.4871605, 'joach', "~test.set(\\lpf_freq, 1800);" ], [ 801.9386992, 'joach', "(
~test[3] = \\set -> QuantEnv(\\fplus, 2)
.phase(1, [0,100,0], [0.005, 0.925], [-8,-8], 0, 1).plot
.phase(2, [0,1,0], [0.35, 0.65], [2,-2], 0, 1)
.play([1]);
)" ], [ 790.361037, 'joach', "(
~test[3] = \\set -> QuantEnv(\\fplus, 1)
.phase(1, [0,100,0], [0.005, 0.925], [-8,-8], 0, 1).plot
.phase(2, [0,1,0], [0.35, 0.65], [2,-2], 0, 1)
.play([1]);
)" ], [ 783.4836437, 'joach', "(
~test[3] = \\set -> QuantEnv(\\fplus, 1)
.phase(1, [0,1000,0], [0.005, 0.925], [-8,-8], 0, 1).plot
.phase(2, [0,1,0], [0.35, 0.65], [2,-2], 0, 1)
.play([1]);
)" ], [ 777.2612878, 'joach', "(
~test[3] = \\set -> QuantEnv(\\fplus, 1)
.phase(1, [0,1000,0], [0.005, 0.925], [-8,-8], 0, 1)
.phase(2, [0,1,0], [0.35, 0.65], [2,-2], 0, 1)
.play([1]);
)" ], [ 774.6401379, 'joach', "(
~test[3] = \\set -> QuantEnv(\\fplus, 1)
.phase(1, [0,1000,0], [0.005, 0.925], [8,-8], 0, 1)
.phase(2, [0,1,0], [0.35, 0.65], [2,-2], 0, 1)
.play([1]);
)" ], [ 766.4476693, 'joach', "(
~test[3] = \\set -> QuantEnv(\\fplus, 1)
.phase(1, [0,1000,0], [0.005, 0.925], [8,-8], 0, 1)
.phase(2, [0,1,0], [0.35, 0.65], [2,-2], 0, 1)
.play([1]);
)" ], [ 761.4233819, 'joach', "(
~test[3] = \\set -> QuantEnv(\\fplus, 1)
.phase(1, [0,1000,0], [0.005, 0.925], [\\step,-8], 0, 1)
.phase(2, [0,1,0], [0.35, 0.65], [2,-2], 0, 1)
.play([1]);
)" ], [ 755.2160269, 'kof', "(
~nn.ar(2);
~nn.quant=2;
~nn.fadeTime=0.2;
~nn={
  //         |       |       |       |       |  
  var pat = [1,0,0,0,1,0,0,0,1,0,0,0,1,0,0,0].rotate(3);
  var imp = PulseDivider.kr(~tick.kr,1,~counter.kr);
  var hit = Select.kr(PulseCount.kr(imp)/[1,2,3,4]%pat.size,pat);
  var env = EnvGen.ar(Env([0.001,1,0.001],[0.002,0.05],[3,-3],curve:'exp'),imp * hit);
  var sig = LFNoise2.ar(5000*[1,2,4,8]);
  sig = sig * env;
  Splay.ar(sig,0.75,0.5);
};
~nn.play;
);" ], [ 746.6595375, 'kof', "(
~kick.ar(2);
~kick.quant=2;
~kick.fadeTime=0.2;
~kick={
  //         |       |       |       |       |  
  var pat = [1,0,0,0,1,0,0,0,1,0,0,0,1,1,0,0].rotate(1);
  var imp = PulseDivider.kr(~tick.kr,1,~counter.kr);
  var hit = Select.kr(PulseCount.kr(imp)%pat.size,pat);
  var env = EnvGen.ar(Env([0.001,1,0.001],[0.002,2.5],[3,-3],curve:'exp'),imp * hit);
  var sig = SinOsc.ar(50+(env**50*500));
  sig = sig * env;
  Splay.ar(sig,0.75,0.5);
};
~kick.play;
);" ], [ 744.2814014, 'joach', "(
~test[3] = \\set -> QuantEnv(\\fplus, 1)
.phase(1, [0,1000,0], [0.005, 0.0925], [8,-8], 0, 1)
.phase(2, [0,1,0], [0.35, 0.65], [2,-2], 0, 1)
.play([1]);
)" ], [ 740.6751952, 'joach', "(
~test[2] = \\set -> QuantEnv(\\freq, 4)
.phase(1, [60,80,60], [0.05, 0.325], [8,-8], 0, 1)
.phase(2, [0,1,0], [0.35, 0.65], [2,-2], 0, 1)
.play([1]);
)" ], [ 731.9926986, 'kof', "(
~sw.ar(2);
~sw.quant=2;
~sw.fadeTime=0.2;
~sw={
  //         |       |       |       |       |  
  var pat = [1,0,0,0,1,0,0,0,1,0,0,0,1,0,0,0].rotate(3);
  var imp = PulseDivider.kr(~tick.kr,2,~counter.kr);
  var hit = Select.kr(PulseCount.kr(imp)/[1,2,4,8]%pat.size,pat);
  var env = EnvGen.ar(Env([0.001,1,1,0.001],[0.002,0.05*[1,2,3,4],0.002],[3,1,-3],curve:'exp'),imp * hit);
  var sig = [
    SinOsc.ar(4000,mul:1/(1..4)),
    SinOsc.ar(16000!2) * Pulse.ar(4),
    SinOsc.ar(50,SinOsc.ar(50/4).range(-pi,pi)),
    LFNoise2.ar(15000!2)
  ];
  sig = Select.ar(PulseCount.kr(hit * imp)%sig.size,sig);

  sig = sig * env;
  Splay.ar(sig,0.75,0.5);
};
~sw.play;
);" ], [ 721.5651021, 'joach', "(
~test[1] = \\set -> QuantEnv(\\amp, 4)
.phase(1, [0,1,0.2], [0.05, 3.45], [2,-2], 0, 4)
.phase(2, [0,1,0.2], [0.35, 3.65], [2,-2], 0, 1)
.play([1,2]);
)" ], [ 713.8136588, 'joach', "(
~test[1] = \\set -> QuantEnv(\\amp, 4)
.phase(1, [0,1,0.2], [0.05, 3.45], [2,-2], 0, 4)
.phase(2, [0,1,0.2], [0.35, 0.65], [2,-2], 0, 1)
.play([1,2]);
)" ], [ 710.5724734, 'kof', "~ss.clear;" ], [ 699.9598664, 'kof', "~ss.stop(10);" ], [ 692.645448, 'kof', "(
~ss.ar(2);
~ss.quant=2;
~ss.fadeTime=8.2;
~ss={
  //         |       |       |       |       |  
  var pat = [1,0,0,0,1,0,0,0,1,0,0,0,1,1,1,1].rotate(1);
  var imp = PulseDivider.kr(~tick.kr,1,~counter.kr);
  var hit = Select.kr(PulseCount.kr(imp)/(1..16)%pat.size,pat);
  var env = EnvGen.ar(Env([0.001,1,0.001],[1.002,4.5],[3,-3],curve:'exp'),imp * hit);
  var sig = SinOsc.ar(432.0*1+((1..4)/1600)/(1+(1..80).reciprocal*[1,2,3,4].reciprocal*pi),mul:0.15/(1..4));
  sig = Normalizer.ar(sig);
  sig = sig * env;
  Splay.ar(sig,0.95,0.15);
};
~ss.play;
);" ], [ 680.2877412, 'joach', "(
~test[1] = \\set -> QuantEnv(\\amp, 0.5)
.phase(1, [0,1,0], [0.05, 0.45], [2,-2], 0, 4)
.phase(2, [0,1,0], [0.35, 0.65], [2,-2], 0, 1)
.play([1,2]);
)" ], [ 669.4821232, 'joach', "~test[5] = \\filter -> {|in| LPF.ar(in, \\lpf_freq.kr(800,8)) };" ], [ 664.9728652, 'kof', "(
~ss.ar(2);
~ss.quant=2;
~ss.fadeTime=8.2;
~ss={
  //         |       |       |       |       |  
  var pat = [1,0,0,0,1,0,0,0,1,0,0,0,1,1,1,1].rotate(1);
  var imp = PulseDivider.kr(~tick.kr,1,~counter.kr);
  var hit = Select.kr(PulseCount.kr(imp)/(1..16)%pat.size,pat);
  var env = EnvGen.ar(Env([0.001,1,0.001],[1.002,4.5],[3,-3],curve:'exp'),imp * hit);
  var sig = SinOsc.ar(432.0*1.25+((1..4)/1600)/(1+(1..80).reciprocal*[1,2,3,4].reciprocal*pi),mul:0.15/(1..4));
  sig = Normalizer.ar(sig);
  sig = sig * env;
  Splay.ar(sig,0.95,0.15);
};
~ss.play;
);" ], [ 649.933005, 'joach', "(
~test[4] = \\set -> QuantEnv(\\noise, 32)
.phase(1, [0,0.3,0], [12.05, 18.95], [2,-2], 0, 1)
.phase(2, [0,0.7,0], [4.35, 24.65], [2,-2], 0, 1)
.play([1,2]);
)" ], [ 646.9838363, 'joach', "(
~test[4] = \\set -> QuantEnv(\\noise, 32)
.phase(1, [0,0.3,0], [12.05, 18.95], [2,-2], 0, 1)
.phase(2, [0,1,0], [4.35, 24.65], [2,-2], 0, 1)
.play([1,2]);
)" ], [ 641.1965053, 'joach', "(
~test[4] = \\set -> QuantEnv(\\noise, 32)
.phase(1, [0,1,0], [12.05, 18.95], [2,-2], 0, 1)
.phase(2, [0,1,0], [4.35, 24.65], [2,-2], 0, 1)
.play([1,2]);
)" ], [ 639.7354217, 'kof', "(
~ss.ar(2);
~ss.fadeTime=8.2;
~ss={
  //         |       |       |       |       |  
  var pat = [1,0,0,0,1,0,0,0,1,0,0,0,1,1,1,1].rotate(1);
  var imp = PulseDivider.kr(~tick.kr,1,~counter.kr);
  var hit = Select.kr(PulseCount.kr(imp)/(1..16)%pat.size,pat);
  var env = EnvGen.ar(Env([0.001,1,0.001],[1.002,4.5],[3,-3],curve:'exp'),imp * hit);
  var sig = SinOsc.ar(432.0*1.5+((1..4)/1600)/(1+(1..80).reciprocal*[1,2,3,4].reciprocal*pi),mul:0.15/(1..4));
  sig = Normalizer.ar(sig);
  sig = sig * env;
  Splay.ar(sig,0.95,0.15);
};
~ss.play;
);" ], [ 603.3013378, 'joach', "(
~test[2] = \\set -> QuantEnv(\\freq, 4)
.phase(1, [60,180,60], [0.05, 0.325], [8,-8], 0, 1)
.phase(2, [0,1,0], [0.35, 0.65], [2,-2], 0, 1)
.play([1]);
)" ], [ 597.5150069, 'joach', "(
~test[3] = \\set -> QuantEnv(\\fplus, 1)
.phase(1, [0,100,0], [0.005, 0.0925], [8,-8], 0, 1)
.phase(2, [0,1,0], [0.35, 0.65], [2,-2], 0, 1)
.play([1]);
)" ], [ 593.8007944, 'joach', "(
~test[3] = \\set -> QuantEnv(\\fplus, 1)
.phase(1, [0,100,0], [0.005, 0.0925], [8,-2], 0, 1)
.phase(2, [0,1,0], [0.35, 0.65], [2,-2], 0, 1)
.play([1,2]);
)" ], [ 591.397657, 'joach', "(
~test[3] = \\set -> QuantEnv(\\fplus, 1)
.phase(1, [0,100,0], [0.005, 0.0925], [2,-2], 0, 1)
.phase(2, [0,1,0], [0.35, 0.65], [2,-2], 0, 1)
.play([1,2]);
)" ], [ 589.7075603, 'kof', "(
~slow2.ar(2);
~slow2.quant=2;
~slow2.fadeTime=0.2;
~slow2={
  //         |       |       |       |       |  
  var pat = [1,0,0,0,1,0,0,0,1,0,0,0,1,0,0,0].rotate(3);
  var imp = PulseDivider.kr(~tick.kr,64,~counter.kr);
  var hit = Select.kr(PulseCount.kr(imp)%pat.size,pat);
  var env = EnvGen.ar(Env([0.001,1,0.001],[2.002,2.5],[3,-3],curve:'exp'),imp * hit);
  var sig = Pulse.ar(4);
  sig = sig * env;
  Splay.ar(sig,0.75,0.15);
};
~slow2.play;
);" ], [ 586.1553571, 'joach', "(
~test[3] = \\set -> QuantEnv(\\fplus, 1)
.phase(1, [0,100,0], [0.005, 0.125], [2,-2], 0, 1)
.phase(2, [0,1,0], [0.35, 0.65], [2,-2], 0, 1)
.play([1,2]);
)" ], [ 582.3381388, 'joach', "(
~test[3] = \\set -> QuantEnv(\\fplus, 1)
.phase(1, [0,1,0], [0.005, 0.125], [2,-2], 0, 1)
.phase(2, [0,1,0], [0.35, 0.65], [2,-2], 0, 1)
.play([1,2]);
)" ], [ 578.4049138, 'joach', "(
~test[2] = \\set -> QuantEnv(\\freq, 1)
.phase(1, [60,180,60], [0.05, 0.325], [8,-8], 0, 1)
.phase(2, [0,1,0], [0.35, 0.65], [2,-2], 0, 1)
.play([1]);
)" ], [ 569.7754203, 'joach', "(
~test[2] = \\set -> QuantEnv(\\freq, 1)
.phase(1, [60,180,60], [0.005, 0.325], [8,-8], 0, 1)
.phase(2, [0,1,0], [0.35, 0.65], [2,-2], 0, 1)
.play([1]);
)" ], [ 545.4240274, 'joach', "(
~test[1] = \\set -> QuantEnv(\\amp, 1)
.phase(1, [0,1,0], [0.05, 0.95], [2,-2], 0, 4)
.phase(2, [0,1,0], [0.35, 0.65], [2,-2], 0, 1)
.play([1,2]);
)" ], [ 540.3237357, 'kof', "(
~ss.ar(2);
~ss.quant=2;
~ss.fadeTime=4.2;
~ss={
  //         |       |       |       |       |  
  var pat = [1,0,0,0,1,0,0,0,1,0,0,0,1,1,1,1].rotate(1);
  var imp = PulseDivider.kr(~tick.kr,1,~counter.kr);
  var hit = Select.kr(PulseCount.kr(imp)/(1..16)%pat.size,pat);
  var env = EnvGen.ar(Env([0.001,1,0.001],[1.002,4.5],[3,-3],curve:'exp'),imp * hit);
  var sig = SinOsc.ar(432.0+((1..4)/1600)/(1+(1..80).reciprocal*[1,2,3,4].reciprocal*pi),mul:0.15/(1..4));
  sig = Normalizer.ar(sig);
  sig = sig * env;
  Splay.ar(sig,0.95,0.15);
};
~ss.play;
);" ], [ 532.3222781, 'joach', "(
~test[2] = \\set -> QuantEnv(\\freq, 1)
.phase(1, [60,180,60], [0.005, 0.125], [8,-8], 0, 1)
.phase(2, [0,1,0], [0.35, 0.65], [2,-2], 0, 1)
.play([1]);
)" ], [ 524.784847, 'joach', "(
~test[2] = \\set -> QuantEnv(\\freq, 1)
.phase(1, [60,80,60], [0.005, 0.125], [8,-8], 0, 1)
.phase(2, [0,1,0], [0.35, 0.65], [2,-2], 0, 1)
.play([1]);
)" ], [ 499.451398, 'joach', "(
~test[2] = \\set -> QuantEnv(\\freq, 1)
.phase(1, [0,1,0], [0.005, 0.125], [8,-8], 0, 1)
.phase(2, [0,1,0], [0.35, 0.65], [2,-2], 0, 1)
.play([1]);
)" ], [ 473.7299268, 'kof', "(
~sw.ar(2);
~sw.quant=2;
~sw.fadeTime=0.2;
~sw={
  //         |       |       |       |       |  
  var pat = [1,0,0,0,1,0,0,0,1,0,0,0,1,0,0,0].rotate(3);
  var imp = PulseDivider.kr(~tick.kr,4,~counter.kr);
  var hit = Select.kr(PulseCount.kr(imp)/[1,2,4,8]%pat.size,pat);
  var env = EnvGen.ar(Env([0.001,1,1,0.001],[0.002,0.05*[1,2,3,4],0.002],[3,1,-3],curve:'exp'),imp * hit);
  var sig = [
    SinOsc.ar(4000,mul:1/(1..4)),
    SinOsc.ar(16000!2) * Pulse.ar(4),
    SinOsc.ar(50,SinOsc.ar(50/4).range(-pi,pi)),
    LFNoise2.ar(15000!2)
  ];
  sig = Select.ar(PulseCount.kr(hit * imp)%sig.size,sig);

  sig = sig * env;
  Splay.ar(sig,0.75,0.5);
};
~sw.play;
);" ], [ 464.397393, 'joach', "Kolektiv.tempo = 120;" ], [ 459.5921181, 'joach', "Kolektiv.tempo = 60;" ], [ 448.2354686, 'joach', "(
~test[1] = \\set -> QuantEnv(\\amp, 1)
.phase(1, [0,1,0], [0.05, 0.95], [2,-2], 0, 1)
.phase(2, [0,1,0], [0.35, 0.65], [2,-2], 0, 1)
.play([1,2]);
)" ], [ 444.0892314, 'joach', "(
~test[0] = {
var osc = SinOsc.ar(( \\freq.kr(60) + \\fplus.kr(0) ), mul: 1, add: 0);
var noise = BrownNoise.ar(\\noise.kr(0), (1 - \\noise.kr(0)));
var sig = osc * noise;
Pan2.ar( sig * \\amp.kr(0), \\pan.kr(0) );
};
)" ], [ 442.9921687, 'joach', "~test.play(vol: 0.2, fadeTime: 8);" ], [ 440.3840195, 'kof', "(
~kick.ar(2);
~kick.quant=2;
~kick.fadeTime=0.2;
~kick={
  //         |       |       |       |       |  
  var pat = [1,0,0,0,1,0,0,0,1,0,0,0,1,1,0,0].rotate(1);
  var imp = PulseDivider.kr(~tick.kr,2,~counter.kr);
  var hit = Select.kr(PulseCount.kr(imp)%pat.size,pat);
  var env = EnvGen.ar(Env([0.001,1,0.001],[0.002,2.5],[3,-3],curve:'exp'),imp * hit);
  var sig = SinOsc.ar(50+(env**50*500));
  sig = sig * env;
  Splay.ar(sig,0.75,0.5);
};
~kick.play;
);" ], [ 436.2757845, 'kof', "  ~tick = {Mix(Impulse.kr( ~tempo / 2 , ~offset ))};" ], [ 435.9197642, 'kof', "  ~tick.quant = 1;" ], [ 435.3327306, 'kof', "  ~offset = (0..7)/8;" ], [ 432.367561, 'kof', "  ~tick = {Mix(Impulse.kr( ~tempo / 2 , ~offset ))};" ], [ 429.4853961, 'kof', "  ~tick.quant = 1;" ], [ 237.8094329, 'joach', "Kolektiv.players" ], [ 14.4610538, 'joach', "(
~test[0] = {
var osc = SinOsc.ar(( \\freq.kr(60) + \\fplus.kr(0) ), mul: 1, add: 0);
var noise = BrownNoise.ar(\\noise.kr(0), (1 - \\noise.kr(0)));
var sig = osc * noise;
Pan2.ar( sig * \\amp.kr(0), \\pan.kr(0) );
};
)" ], [ 13.4780232, 'joach', "~test.play(vol: 0.0, fadeTime: 8);" ], [ 0, 'joach', "Kolektiv.tempo_(120);" ] ]