List[ [ 1785.551051082, 'kof', "Kolektiv.historySave;" ], [ 1741.714633331, 'kof', "~nn.clear;" ], [ 1739.500475054, 'kof', "~kick.clear;" ], [ 1736.850347304, 'kof', "~slow.clear;" ], [ 1733.291707054, 'kof', "~slow.clear;" ], [ 1730.908118979, 'kof', "~sw.clear;" ], [ 1730.098804707, 'kof', "~sw.stop(7);" ], [ 1725.721488892, 'kof', "~ss.clear;" ], [ 1724.270104602, 'kof', "~ff.clear;" ], [ 1719.709615928, 'joach', "~test.stop(6);" ], [ 1719.529228007, 'kof', "~ff.clear;" ], [ 1716.826624168, 'kof', "~hiss.clear;" ], [ 1714.217474188, 'kof', "~kick.clear;" ], [ 1711.679200774, 'kof', "~first.clear;" ], [ 1710.112055337, 'kof', "~chaotic.clear;" ], [ 1708.609743507, 'kof', "~ssmp.clear;" ], [ 1698.084004595, 'kof', "(
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
);" ], [ 1697.917570938, 'kof', "(
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
);" ], [ 1697.760024121, 'kof', "(
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
);" ], [ 1697.569167297, 'kof', "(
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
);" ], [ 1694.097230702, 'kof', "(
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
);" ], [ 1692.633247814, 'kof', "~crackle.clear" ], [ 1687.217402213, 'kof', "~kick.clear;" ], [ 1684.87819067, 'joach', "~test[6] = \\filter -> {|in| GVerb.ar(in, \\gverb_size.kr(160), \\gverb_time.kr(0.25), 0.9, mul:\\mulgverb.kr(1)) };" ], [ 1678.780053011, 'joach', "~test.set(\\lpf_freq, 4000);" ], [ 1675.540091739, 'joach', "(
~test[3] = \\set -> QuantEnv(\\fplus, 1)
.phase(1, [0,1870,0], [0.005, 0.1225], [-8,-8], 0, 4)
.phase(2, [0,1450,0], [0.007, 0.165], [8,-4], 0, 1)
.play([1,2]);
)" ], [ 1663.596396087, 'kof', "(
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
);" ], [ 1659.070449876, 'kof', "(
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
);" ], [ 1655.574344331, 'kof', "(
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
);" ], [ 1653.637124479, 'joach', "(
~test[3] = \\set -> QuantEnv(\\fplus, 1)
.phase(1, [0,1870,0], [0.005, 0.1225], [-8,-8], 0, 4)
.phase(2, [0,450,0], [0.007, 0.165], [8,-4], 0, 1)
.play([1,2]);
)" ], [ 1650.863687634, 'joach', "(
~test[3] = \\set -> QuantEnv(\\fplus, 1)
.phase(1, [0,870,0], [0.005, 0.1225], [-8,-8], 0, 4)
.phase(2, [0,450,0], [0.007, 0.165], [8,-4], 0, 1)
.play([1,2]);
)" ], [ 1645.2964237, 'kof', "(
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
);" ], [ 1643.141676818, 'joach', "(
~test[3] = \\set -> QuantEnv(\\fplus, 1)
.phase(1, [0,870,0], [0.005, 0.1925], [-8,-8], 0, 4)
.phase(2, [0,450,0], [0.007, 0.165], [8,-4], 0, 1)
.play([1,2]);
)" ], [ 1632.537693543, 'kof', "(
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
);" ], [ 1632.340964186, 'joach', "~test[5] = \\filter -> {|in| LPF.ar(in, \\lpf_freq.kr(800,28)) };" ], [ 1628.06013081, 'joach', "~test.set(\\lpf_freq, 2000);" ], [ 1622.384384972, 'joach', "(
~test[3] = \\set -> QuantEnv(\\fplus, 1)
.phase(1, [0,270,0], [0.005, 0.1925], [-8,-8], 0, 4)
.phase(2, [0,450,0], [0.007, 0.165], [8,-4], 0, 1)
.play([1,2]);
)" ], [ 1611.24652303, 'joach', "(
~test[1] = \\set -> QuantEnv(\\amp, 2)
.phase(1, [0,1,0.1], [0.05, 0.95], [2,-2], 0, 4)
.phase(2, [0,1!2,0.2], [0.05, 0.45], [2,-2], 0, 1)
.phase(3, [0.2,1,0.2], [0.85, 0.15], [2,-2], 0, 1)
.play([1,2,1,3]);
)" ], [ 1601.964868035, 'joach', "(
~test[1] = \\set -> QuantEnv(\\amp, 2)
.phase(1, [0,1,0.1], [0.05, 0.95], [2,-2], 0, 4)
.phase(2, [0,1!2,0.2], [0.05, 0.45], [2,-2], 0, 1)
.phase(3, [0.2,1,0.2], [0.35, 0.65], [2,-2], 0, 1)
.play([1,2,1,3]);
)" ], [ 1583.299727213, 'joach', "(
~test[0] = {
	var osc = SinOsc.ar(( \\freq.kr(80) + \\fplus.kr(0) ), mul: 1, add: 0);
	var noise = BrownNoise.ar(\\noise.kr(0), (1 - \\noise.kr(0))) * SinOsc.kr(8);
	var sig = osc * noise;
	Pan2.ar( sig * \\amp.kr(0), \\pan.kr(0) );
};
)" ], [ 1568.521770227, 'kof', "(
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
);" ], [ 1568.433576924, 'joach', "(
~test[1] = \\set -> QuantEnv(\\amp, 2)
.phase(1, [0,1,0.1], [0.05, 0.45], [2,-2], 0, 4)
.phase(2, [0,1!2,0.2], [0.05, 0.25], [2,-2], 0, 1)
.phase(3, [0.2,1,0.2], [0.35, 0.65], [2,-2], 0, 1)
.play([1,2,1,3]);
)" ], [ 1564.398658968, 'joach', "(
~test[0] = {
	var osc = SinOsc.ar(( \\freq.kr(80) + \\fplus.kr(0) ), mul: 1, add: 0);
	var noise = BrownNoise.ar(\\noise.kr(0), (1 - \\noise.kr(0))) * Saw.kr(8);
	var sig = osc * noise;
	Pan2.ar( sig * \\amp.kr(0), \\pan.kr(0) );
};
)" ], [ 1559.923773961, 'joach', "(
~test[0] = {
	var osc = SinOsc.ar(( \\freq.kr(80) + \\fplus.kr(0) ), mul: 1, add: 0);
	var noise = BrownNoise.ar(\\noise.kr(0), (1 - \\noise.kr(0))) * Saw.kr(40);
	var sig = osc * noise;
	Pan2.ar( sig * \\amp.kr(0), \\pan.kr(0) );
};
)" ], [ 1554.361624607, 'joach', "(
~test[0] = {
	var osc = SinOsc.ar(( \\freq.kr(80) + \\fplus.kr(0) ), mul: 1, add: 0);
	var noise = BrownNoise.ar(\\noise.kr(0), (1 - \\noise.kr(0))) * Saw.kr(80);
	var sig = osc * noise;
	Pan2.ar( sig * \\amp.kr(0), \\pan.kr(0) );
};
)" ], [ 1550.647442831, 'joach', "(
~test[0] = {
	var osc = SinOsc.ar(( \\freq.kr(80) + \\fplus.kr(0) ), mul: 1, add: 0);
	var noise = BrownNoise.ar(\\noise.kr(0), (1 - \\noise.kr(0))) * Saw.kr(40);
	var sig = osc * noise;
	Pan2.ar( sig * \\amp.kr(0), \\pan.kr(0) );
};
)" ], [ 1545.293155078, 'joach', "(
~test[0] = {
	var osc = SinOsc.ar(( \\freq.kr(80) + \\fplus.kr(0) ), mul: 1, add: 0);
	var noise = BrownNoise.ar(\\noise.kr(0), (1 - \\noise.kr(0))) * Saw.kr(8);
	var sig = osc * noise;
	Pan2.ar( sig * \\amp.kr(0), \\pan.kr(0) );
};
)" ], [ 1544.743395861, 'kof', "~kick.resume;" ], [ 1540.052249556, 'joach', "(
~test[0] = {
	var osc = SinOsc.ar(( \\freq.kr(80) + \\fplus.kr(0) ), mul: 1, add: 0);
	var noise = BrownNoise.ar(\\noise.kr(0), (1 - \\noise.kr(0))) * Saw.kr(80);
	var sig = osc * noise;
	Pan2.ar( sig * \\amp.kr(0), \\pan.kr(0) );
};
)" ], [ 1538.269197936, 'kof', "~sw.clear;" ], [ 1536.034715991, 'kof', "~slow.clear;" ], [ 1535.022337414, 'joach', "(
~test[0] = {
	var osc = SinOsc.ar(( \\freq.kr(80) + \\fplus.kr(0) ), mul: 1, add: 0);
	var noise = BrownNoise.ar(\\noise.kr(0), (1 - \\noise.kr(0))) * Saw.kr(60);
	var sig = osc * noise;
	Pan2.ar( sig * \\amp.kr(0), \\pan.kr(0) );
};
)" ], [ 1534.66026485, 'kof', "~slow.clear;" ], [ 1531.465857909, 'joach', "(
~test[0] = {
	var osc = SinOsc.ar(( \\freq.kr(80) + \\fplus.kr(0) ), mul: 1, add: 0);
	var noise = BrownNoise.ar(\\noise.kr(0), (1 - \\noise.kr(0))) * Saw.kr(80);
	var sig = osc * noise;
	Pan2.ar( sig * \\amp.kr(0), \\pan.kr(0) );
};
)" ], [ 1529.646920506, 'kof', "~kick.pause;" ], [ 1525.814549242, 'joach', "(
~test[0] = {
	var osc = SinOsc.ar(( \\freq.kr(80) + \\fplus.kr(0) ), mul: 1, add: 0);
	var noise = BrownNoise.ar(\\noise.kr(0), (1 - \\noise.kr(0))) * Saw.kr(8);
	var sig = osc * noise;
	Pan2.ar( sig * \\amp.kr(0), \\pan.kr(0) );
};
)" ], [ 1519.636903793, 'joach', "(
~test[0] = {
	var osc = SinOsc.ar(( \\freq.kr(80) + \\fplus.kr(0) ), mul: 1, add: 0);
	var noise = BrownNoise.ar(\\noise.kr(0), (1 - \\noise.kr(0))) * Saw.kr(80);
	var sig = osc * noise;
	Pan2.ar( sig * \\amp.kr(0), \\pan.kr(0) );
};
)" ], [ 1513.842675416, 'joach', "(
~test[0] = {
	var osc = SinOsc.ar(( \\freq.kr(80) + \\fplus.kr(0) ), mul: 1, add: 0);
	var noise = BrownNoise.ar(\\noise.kr(0), (1 - \\noise.kr(0))) * Saw.kr(60);
	var sig = osc * noise;
	Pan2.ar( sig * \\amp.kr(0), \\pan.kr(0) );
};
)" ], [ 1513.143437837, 'kof', "~kick.resume;" ], [ 1509.393219211, 'kof', "~kick.pause;" ], [ 1507.507249926, 'joach', "(
~test[0] = {
	var osc = SinOsc.ar(( \\freq.kr(80) + \\fplus.kr(0) ), mul: 1, add: 0);
	var noise = BrownNoise.ar(\\noise.kr(0), (1 - \\noise.kr(0))) * Saw.kr(80);
	var sig = osc * noise;
	Pan2.ar( sig * \\amp.kr(0), \\pan.kr(0) );
};
)" ], [ 1500.846667973, 'joach', "(
~test[0] = {
	var osc = SinOsc.ar(( \\freq.kr(80) + \\fplus.kr(0) ), mul: 1, add: 0);
	var noise = BrownNoise.ar(\\noise.kr(0), (1 - \\noise.kr(0))) * Saw.kr(8);
	var sig = osc * noise;
	Pan2.ar( sig * \\amp.kr(0), \\pan.kr(0) );
};
)" ], [ 1488.389498377, 'kof', "(
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
);" ], [ 1483.264001876, 'joach', "(
~test[1] = \\set -> QuantEnv(\\amp, 1)
.phase(1, [0,1,0.1], [0.05, 0.45], [2,-2], 0, 4)
.phase(2, [0,1!2,0.2], [0.05, 0.25], [2,-2], 0, 1)
.phase(3, [0.2,1,0.2], [0.35, 0.65], [2,-2], 0, 1)
.play([1,2,1,3]);
)" ], [ 1481.401087044, 'kof', "~sw.clear;" ], [ 1480.591282059, 'kof', "~sw.stop(7);" ], [ 1469.042101282, 'kof', "(
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
);" ], [ 1465.570732674, 'joach', "(
~test[3] = \\set -> QuantEnv(\\fplus, 1)
.phase(1, [0,170,0], [0.005, 0.1925], [-8,-8], 0, 4)
.phase(2, [0,450,0], [0.007, 0.165], [8,-4], 0, 1)
.play([1,2]);
)" ], [ 1460.449843321, 'kof', "(
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
);" ], [ 1454.862769345, 'joach', "~test.set(\\lpf_freq, 1000);" ], [ 1451.390479111, 'kof', "(
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
);" ], [ 1440.442345391, 'joach', "~test[6] = nil" ], [ 1436.075608031, 'joach', "~test[4] = nil" ], [ 1424.28239128, 'joach', "~test.play(vol: 0.9, fadeTime: 8);" ], [ 1423.637903976, 'kof', "(
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
);" ], [ 1422.333379514, 'joach', "(
~test[0] = {
	var osc = SinOsc.ar(( \\freq.kr(60) + \\fplus.kr(0) ), mul: 1, add: 0);
	var noise = BrownNoise.ar(\\noise.kr(0), (1 - \\noise.kr(0))) * Saw.kr(8);
	var sig = osc * noise;
	Pan2.ar( sig * \\amp.kr(0), \\pan.kr(0) );
};
)" ], [ 1416.864895721, 'joach', "(
~test[1] = \\set -> QuantEnv(\\amp, 1)
.phase(1, [0,1,0.1], [0.05, 0.45], [2,-2], 0, 4)
.phase(2, [0,1!2,0.2], [0.35, 0.65], [2,-2], 0, 1)
.phase(3, [0.2,1,0.2], [0.35, 0.65], [2,-2], 0, 1)
.play([1,2,1,3]);
)" ], [ 1411.303431296, 'kof', "(
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
);" ], [ 1409.093223434, 'joach', "(
~test[3] = \\set -> QuantEnv(\\fplus, 1)
.phase(1, [0,170,0], [0.005, 0.1925], [-8,-8], 0, 4)
.phase(2, [0,250,0], [0.007, 0.165], [8,-4], 0, 1)
.play([1,2]);
)" ], [ 1406.326976278, 'joach', "(
~test[3] = \\set -> QuantEnv(\\fplus, 0.5)
.phase(1, [0,170,0], [0.005, 0.1925], [-8,-8], 0, 4)
.phase(2, [0,250,0], [0.007, 0.165], [8,-4], 0, 1)
.play([1,2]);
)" ], [ 1393.488020135, 'joach', "~test[2] = nil" ], [ 1375.062250302, 'kof', "(
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
);" ], [ 1366.44396892, 'kof', "(
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
);" ], [ 1359.126585043, 'kof', "(
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
);" ], [ 1351.718183072, 'kof', "(
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
);" ], [ 1342.069208086, 'joach', "~test.stop(16);" ], [ 1339.395060511, 'kof', "~hiss.stop(7);" ], [ 1335.839709371, 'kof', "~first.clear;" ], [ 1333.656791993, 'joach', "~test[6] = \\filter -> {|in| GVerb.ar(in, \\gverb_size.kr(160), \\gverb_time.kr(8.25), 0.9, mul:\\mulgverb.kr(1)) };" ], [ 1333.441918384, 'kof', "~chaotic.clear;" ], [ 1331.063209221, 'kof', "~ssmp.clear;" ], [ 1326.88728567, 'joach', "~test[6] = \\filter -> {|in| GVerb.ar(in, \\gverb_size.kr(6), \\gverb_time.kr(8.25), 0.9, mul:\\mulgverb.kr(1)) };" ], [ 1321.197780709, 'joach', "~test.set(\\lpf_freq, 14000);" ], [ 1316.283927987, 'joach', "~test.set(\\lpf_freq, 4000);" ], [ 1304.275675096, 'joach', "(
~test[1] = \\set -> QuantEnv(\\amp, 4)
.phase(1, [0,1,0.2], [0.05, 0.45], [2,-2], 0, 4)
.phase(2, [0,1!2,0.2], [0.35, 0.65], [2,-2], 0, 1)
.phase(3, [0.2,1,0.2], [0.35, 0.65], [2,-2], 0, 1)
.play([1,2,1,3]);
)" ], [ 1303.508306786, 'kof', "~x={RandSeed.ar(Impulse.ar(8),LFSaw.ar(1/4).range(0,10))};" ], [ 1301.886266364, 'kof', "~x={RandSeed.ar(Impulse.ar(80),LFSaw.ar(1/4).range(0,10))};" ], [ 1300.255288792, 'kof', "~x={RandSeed.ar(Impulse.ar(800),LFSaw.ar(1/4).range(0,10))};" ], [ 1298.038307562, 'kof', "~x={RandSeed.ar(Impulse.ar(80),LFSaw.ar(1/4).range(0,10))};" ], [ 1292.896213288, 'kof', "~x={RandSeed.ar(Impulse.ar(8),LFSaw.ar(1/4).range(0,10))};" ], [ 1282.265960874, 'kof', "~x={RandSeed.ar(Impulse.ar(8),500)};" ], [ 1280.807636539, 'kof', "~x={RandSeed.ar(Impulse.ar(8),50)};" ], [ 1280.252490812, 'joach', "(
~test[4] = \\set -> QuantEnv(\\noise, 4)
.phase(1, [0,1.3,0], [2.05, 1.95], [2,-2], 0, 1)
.phase(2, [0,0.7,0], [3.35, 0.65], [2,-2], 0, 1)
.play([1,2]);
)" ], [ 1278.147294202, 'kof', "~x={RandSeed.ar(Impulse.ar(8),5)};" ], [ 1276.128970249, 'kof', "~x={RandSeed.ar(Impulse.ar(8),9)};" ], [ 1274.136236744, 'joach', "~test.play(vol: 0.9, fadeTime: 8);" ], [ 1273.58942129, 'kof', "~x={RandSeed.ar(Impulse.ar(8),99)};" ], [ 1271.477036707, 'kof', "~x={RandSeed.ar(Impulse.ar(1),99)};" ], [ 1264.594846105, 'kof', "~x={RandSeed.ar(Impulse.ar(1/4),99)};" ], [ 1261.831941715, 'kof', "~x={RandSeed.ar(Impulse.ar(4),99)};" ], [ 1261.364823787, 'joach', "~test[6] = \\filter -> {|in| GVerb.ar(in, \\gverb_size.kr(6), \\gverb_time.kr(0.25), 0.9, mul:\\mulgverb.kr(1)) };" ], [ 1255.902805743, 'kof', "~x={RandSeed.ar(Impulse.ar(1),99)};" ], [ 1253.962332913, 'kof', "~x={RandSeed.ar(Impulse.ar(16),99)};" ], [ 1251.817306363, 'kof', "~x={RandSeed.ar(Impulse.ar(8),99)};" ], [ 1247.926340122, 'joach', "(
~test[2] = \\set -> QuantEnv(\\freq, 16)
.phase(1, [600,56,60], [2.05, 5.325], [8,-8], 0, 4)
.phase(2, [180,188,180], [0.35, 0.65], [2,-2], 0, 1)
.phase(2, [480,88,480], [0.35, 0.65], [2,-2], 0, 2)
.play([1,2,1,3,2]);
)" ], [ 1247.417523175, 'kof', "~x={RandSeed.ar(Impulse.ar(4),99)};" ], [ 1234.276546314, 'joach', "(
~test[2] = \\set -> QuantEnv(\\freq, 16)
.phase(1, [600,56,60], [2.05, 5.325], [8,-8], 0, 4)
.phase(2, [180,188,180], [0.35, 0.65], [2,-2], 0, 1)
.phase(2, [480,488,480], [0.35, 0.65], [2,-2], 0, 2)
.play([1,2,1,3,2]);
)" ], [ 1231.762023248, 'joach', "(
~test[2] = \\set -> QuantEnv(\\freq, 16)
.phase(1, [600,560,60], [2.05, 5.325], [8,-8], 0, 4)
.phase(2, [180,188,180], [0.35, 0.65], [2,-2], 0, 1)
.phase(2, [480,488,480], [0.35, 0.65], [2,-2], 0, 2)
.play([1,2,1,3,2]);
)" ], [ 1227.298032365, 'joach', "(
~test[2] = \\set -> QuantEnv(\\freq, 16)
.phase(1, [60,560,60], [2.05, 5.325], [8,-8], 0, 4)
.phase(2, [180,188,180], [0.35, 0.65], [2,-2], 0, 1)
.phase(2, [480,488,480], [0.35, 0.65], [2,-2], 0, 2)
.play([1,2,1,3,2]);
)" ], [ 1222.803327422, 'joach', "~test.set(\\lpf_freq, 400);" ], [ 1219.202378803, 'joach', "(
~test[4] = \\set -> QuantEnv(\\noise, 4)
.phase(1, [0,0.3,0], [2.05, 1.95], [2,-2], 0, 1)
.phase(2, [0,0.7,0], [3.35, 0.65], [2,-2], 0, 1)
.play([1,2]);
)" ], [ 1213.851652373, 'joach', "(
~test[3] = \\set -> QuantEnv(\\fplus, 0.5)
.phase(1, [0,400,0], [0.005, 0.0925], [-8,-8], 0, 4)
.phase(2, [0,4500,0], [0.007, 0.065], [8,-4], 0, 1)
.play([1,2]);
)" ], [ 1209.054653411, 'joach', "(
~test[1] = \\set -> QuantEnv(\\amp, 1)
.phase(1, [0,1,0.2], [0.05, 0.45], [2,-2], 0, 4)
.phase(2, [0,1!2,0.2], [0.35, 0.65], [2,-2], 0, 1)
.phase(3, [0.2,1,0.2], [0.35, 0.65], [2,-2], 0, 1)
.play([1,2,1,3]);
)" ], [ 1205.560706884, 'joach', "(
~test[1] = \\set -> QuantEnv(\\amp, 2)
.phase(1, [0,1,0.2], [0.05, 0.45], [2,-2], 0, 4)
.phase(2, [0,1!2,0.2], [0.35, 0.65], [2,-2], 0, 1)
.phase(3, [0.2,1,0.2], [0.35, 0.65], [2,-2], 0, 1)
.play([1,2,1,3]);
)" ], [ 1192.702222485, 'joach', "(
~test[2] = \\set -> QuantEnv(\\freq, 16)
.phase(1, [600,560,600], [2.05, 5.325], [8,-8], 0, 4)
.phase(2, [180,188,180], [0.35, 0.65], [2,-2], 0, 1)
.phase(2, [480,488,480], [0.35, 0.65], [2,-2], 0, 2)
.play([1,2,1,3,2]);
)" ], [ 1176.512019432, 'joach', "(
~test[2] = \\set -> QuantEnv(\\freq, 8)
.phase(1, [600,560,600], [2.05, 5.325], [8,-8], 0, 4)
.phase(2, [180,188,180], [0.35, 0.65], [2,-2], 0, 1)
.phase(2, [480,488,480], [0.35, 0.65], [2,-2], 0, 2)
.play([1,2,1,3,2]);
)" ], [ 1175.921195556, 'kof', "Kolektiv.tempo = 240*2;" ], [ 1169.079728887, 'kof', "Kolektiv.tempo = 240;" ], [ 1168.453238209, 'joach', "~test[6] = \\filter -> {|in| GVerb.ar(in, \\gverb_size.kr(6), \\gverb_time.kr(4.25), 0.9, mul:\\mulgverb.kr(1)) };" ], [ 1163.95704096, 'joach', "~test[6] = \\filter -> {|in| GVerb.ar(in, \\gverb_size.kr(60), \\gverb_time.kr(4.25), 0.9, mul:\\mulgverb.kr(1)) };" ], [ 1158.491312336, 'joach', "~test[6] = \\filter -> {|in| GVerb.ar(in, \\gverb_size.kr(2), \\gverb_time.kr(4.25), 0.9, mul:\\mulgverb.kr(1)) };" ], [ 1152.162744876, 'joach', "~test[6] = \\filter -> {|in| GVerb.ar(in, \\gverb_size.kr(2), \\gverb_time.kr(0.25), 0.9, mul:\\mulgverb.kr(1)) };" ], [ 1149.374661108, 'kof', "~x  = {RandSeed.ar(Impulse.ar(50),900)};" ], [ 1147.587215323, 'kof', "~x  = {RandSeed.ar(Impulse.ar(50),90)};" ], [ 1146.92317683, 'joach', "~test[6] = \\filter -> {|in| GVerb.ar(in, \\gverb_size.kr(12), \\gverb_time.kr(0.25), 0.9, mul:\\mulgverb.kr(1)) };" ], [ 1145.586233655, 'kof', "~x  = {RandSeed.ar(Impulse.ar(50),9)};" ], [ 1142.540379397, 'kof', "~x  = {RandSeed.ar(Impulse.ar(50),99)};" ], [ 1141.46053707, 'joach', "~test[6] = \\filter -> {|in| GVerb.ar(in, \\gverb_size.kr(12), \\gverb_time.kr(1.25), 0.9, mul:\\mulgverb.kr(1)) };" ], [ 1139.379959607, 'kof', "~x  = {RandSeed.ar(Impulse.ar(44),99)};" ], [ 1134.896311744, 'joach', "~test.set(\\lpf_freq, 2400);" ], [ 1134.470217267, 'kof', "~x  = {RandSeed.ar(Impulse.ar(32),99)};" ], [ 1131.431692919, 'kof', "~x  = {RandSeed.ar(Impulse.ar(16),99)};" ], [ 1127.494996272, 'kof', "~x  = {RandSeed.ar(Impulse.ar(8),99)};" ], [ 1124.418186398, 'joach', "(
~test[2] = \\set -> QuantEnv(\\freq, 8)
.phase(1, [600,660,600], [2.05, 5.325], [8,-8], 0, 4)
.phase(2, [180,188,180], [0.35, 0.65], [2,-2], 0, 1)
.phase(2, [480,488,480], [0.35, 0.65], [2,-2], 0, 2)
.play([1,2,1,3,2]);
)" ], [ 1122.675359692, 'joach', "(
~test[2] = \\set -> QuantEnv(\\freq, 8)
.phase(1, [600,660,600], [2.05, 5.325], [8,-8], 0, 4)
.phase(2, [180,188,180], [0.35, 0.65], [2,-2], 0, 1)
.phase(2, [480,488,480], [0.35, 0.65], [2,-2], 0, 2)
.play([1,2,1,3]);
)" ], [ 1121.890811107, 'kof', "~x  = {RandSeed.ar(Impulse.ar(80),99)};" ], [ 1109.817854472, 'kof', "~x  = {RandSeed.ar(Impulse.ar(800),99)};" ], [ 1100.36911138, 'kof', "~x  = {RandSeed.ar(Impulse.ar(80),99)};" ], [ 1089.321899605, 'kof', "~x  = {RandSeed.ar(Impulse.ar(44),99)};" ], [ 1088.26725169, 'joach', "~test.set(\\lpf_freq, 1400);" ], [ 1087.298346854, 'kof', "(
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
);" ], [ 1084.996068419, 'joach', "(
~test[3] = \\set -> QuantEnv(\\fplus, 0.5)
.phase(1, [0,100,0], [0.005, 0.0925], [-8,-8], 0, 4)
.phase(2, [0,4500,0], [0.007, 0.065], [8,-4], 0, 1)
.play([1,2]);
)" ], [ 1066.869505246, 'joach', "(
~test[2] = \\set -> QuantEnv(\\freq, 8)
.phase(1, [600,660,600], [2.05, 5.325], [8,-8], 0, 1)
.phase(2, [180,188,180], [0.35, 0.65], [2,-2], 0, 1)
.play([1,2]);
)" ], [ 1059.241407166, 'kof', "(
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
);" ], [ 1047.001019443, 'joach', "(
~test[7] = \\set -> QuantEnv(\\mulgverb, 8)
.phase(1, [0.1,1,0.1], [0.05, 7.95], [2,-2], 0, 4)
.phase(2, [0,1,0], [2.35, 5.65], [2,-2], 0, 1)
.play([1,2]);
)" ], [ 1046.582836714, 'kof', "(
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
);" ], [ 1036.509418761, 'joach', "(
~test[7] = \\set -> QuantEnv(\\mulgverb, 8)
.phase(1, [0,1,0], [0.05, 7.95], [2,-2], 0, 4)
.phase(2, [0,1,0], [2.35, 5.65], [2,-2], 0, 1)
.play([1,2]);
)" ], [ 1025.370089034, 'joach', "~test.play(vol: 0.5, fadeTime: 8);" ], [ 1022.640996358, 'joach', "(
~test[3] = \\set -> QuantEnv(\\fplus, 0.5)
.phase(1, [0,100,0], [0.005, 0.0925], [-8,-8], 0, 4)
.phase(2, [0,450,0], [0.007, 0.065], [8,-4], 0, 1)
.play([1,2]);
)" ], [ 1011.140493372, 'kof', "(
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
);" ], [ 1005.719954666, 'joach', "(
~test[1] = \\set -> QuantEnv(\\amp, 8)
.phase(1, [0,1,0.2], [0.05, 7.45], [2,-2], 0, 4)
.phase(2, [0,1!2,0.2], [0.35, 3.65], [2,-2], 0, 1)
.phase(3, [0.2,1,0.2], [3.35, 0.65], [2,-2], 0, 1)
.play([1,2,1,3]);
)" ], [ 975.453582174, 'kof', "(
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
);" ], [ 963.780383188, 'kof', "~ff.clear;" ], [ 961.624853427, 'kof', "~high.clear;" ], [ 959.566902001, 'kof', "~kick.clear;" ], [ 953.912213917, 'kof', "~neuKick.clear;" ], [ 950.709152921, 'kof', "~hat.clear;" ], [ 947.601559521, 'kof', "~longnoise.clear;" ], [ 945.26152911, 'kof', "~mld.clear;" ], [ 929.957514343, 'joach', "~test.stop(16);" ], [ 915.052933451, 'kof', "Kolektiv.tempo = 240;" ], [ 909.321238159, 'kof', "(
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
);" ], [ 896.871731215, 'joach', "(
~test[4] = \\set -> QuantEnv(\\noise, 4)
.phase(1, [0,0.3,0], [2.05, 1.95], [2,-2], 0, 1)
.phase(2, [0,0.7,0], [3.35, 0.65], [2,-2], 0, 1)
.play([1,2]);
)" ], [ 882.579906121, 'kof', "~ssnt.clear;" ], [ 877.825520611, 'joach', "(
~test[0] = {
var osc = SinOsc.ar(( \\freq.kr(60) + \\fplus.kr(0) ), mul: 1, add: 0);
	var noise = BrownNoise.ar(\\noise.kr(0), (1 - \\noise.kr(0))) * Saw.kr(8);
var sig = osc * noise;
Pan2.ar( sig * \\amp.kr(0), \\pan.kr(0) );
};
)" ], [ 864.615842537, 'kof', "(
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
);" ], [ 849.833732467, 'joach', "(
~test[4] = \\set -> QuantEnv(\\noise, 4)
.phase(1, [0,0.3,0], [2.05, 8.95], [2,-2], 0, 1)
.phase(2, [0,0.7,0], [4.35, 24.65], [2,-2], 0, 1)
.play([1,2]);
)" ], [ 846.194483943, 'kof', "(
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
);" ], [ 842.085887389, 'joach', "(
~test[4] = \\set -> QuantEnv(\\noise, 4)
.phase(1, [0,0.3,0], [12.05, 18.95], [2,-2], 0, 1)
.phase(2, [0,0.7,0], [4.35, 24.65], [2,-2], 0, 1)
.play([1,2]);
)" ], [ 834.379217279, 'kof', "(
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
);" ], [ 833.558819295, 'joach', "~test.set(\\lpf_freq, 4400);" ], [ 827.67024892, 'joach', "(
~test[3] = \\set -> QuantEnv(\\fplus, 1)
.phase(1, [0,100,0], [0.005, 0.0925], [-8,-8], 0, 4)
.phase(2, [0,450,0], [0.007, 0.065], [8,-4], 0, 1)
.play([1,2]);
)" ], [ 818.162851917, 'joach', "~test.set(\\lpf_freq, 1400);" ], [ 811.895796365, 'joach', "(
~test[3] = \\set -> QuantEnv(\\fplus, 1)
.phase(1, [0,100,0], [0.05, 0.0925], [-8,-8], 0, 4)
.phase(2, [0,450,0], [0.07, 0.065], [8,-4], 0, 1)
.play([1,2]);
)" ], [ 809.724871305, 'kof', "(
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
);" ], [ 802.771040021, 'joach', "(
~test[1] = \\set -> QuantEnv(\\amp, 1)
.phase(1, [0,1,0.2], [0.05, 3.45], [2,-2], 0, 4)
.phase(2, [0,1,0.2], [0.35, 3.65], [2,-2], 0, 1)
.phase(3, [0.2,1,0.2], [3.35, 0.65], [2,-2], 0, 1)
.play([1,2,1,3]);
)" ], [ 786.363302766, 'kof', "(
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
);" ], [ 767.034292408, 'kof', "~nn.clear;" ], [ 766.839748923, 'joach', "(
~test[3] = \\set -> QuantEnv(\\fplus, 1)
.phase(1, [0,100,0], [0.005, 0.0925], [-8,-8], 0, 4)
.phase(2, [0,450,0], [0.007, 0.065], [8,-4], 0, 1)
.play([1,2]);
)" ], [ 765.093789085, 'joach', "(
~test[3] = \\set -> QuantEnv(\\fplus, 1)
.phase(1, [0,100,0], [0.005, 0.0925], [-8,-8], 0, 4)
.phase(2, [0,450,0], [0.007, 0.65], [8,-4], 0, 1)
.play([1,2]);
)" ], [ 764.595752451, 'kof', "~kick.clear;" ], [ 762.173679554, 'kof', "~slow.clear;" ], [ 760.020179015, 'kof', "~slow.clear;" ], [ 756.980921725, 'kof', "~sw.clear;" ], [ 752.976434878, 'joach', "(
~test[3] = \\set -> QuantEnv(\\fplus, 1)
.phase(1, [0,100,0], [0.005, 0.925], [-8,-8], 0, 4)
.phase(2, [0,450,0], [0.007, 0.65], [8,-4], 0, 1)
.play([1,2]);
)" ], [ 743.364040349, 'joach', "(
~test[2] = \\set -> QuantEnv(\\freq, 8)
.phase(1, [60,66,60], [2.05, 5.325], [8,-8], 0, 1)
.phase(2, [80,88,80], [0.35, 0.65], [2,-2], 0, 1)
.play([1,2]);
)" ], [ 733.208771602, 'joach', "(
~test[2] = \\set -> QuantEnv(\\freq, 8)
.phase(1, [60,66,60], [2.05, 5.325], [8,-8], 0, 1)
.phase(2, [0,1,0], [0.35, 0.65], [2,-2], 0, 1)
.play([1]);
)" ], [ 726.789550019, 'joach', "(
~test[2] = \\set -> QuantEnv(\\freq, 8)
.phase(1, [100,80,60], [2.05, 5.325], [8,-8], 0, 1)
.phase(2, [0,1,0], [0.35, 0.65], [2,-2], 0, 1)
.play([1]);
)" ], [ 721.412433662, 'joach', "(
~test[2] = \\set -> QuantEnv(\\freq, 8)
.phase(1, [100,80,60], [2.05, 6.325], [8,-8], 0, 1)
.phase(2, [0,1,0], [0.35, 0.65], [2,-2], 0, 1)
.play([1]);
)" ], [ 714.534167694, 'joach', "(
~test[2] = \\set -> QuantEnv(\\freq, 8)
.phase(1, [100,80,60], [0.05, 0.325], [8,-8], 0, 1)
.phase(2, [0,1,0], [0.35, 0.65], [2,-2], 0, 1)
.play([1]);
)" ], [ 688.709116109, 'joach', "~test[6] = \\filter -> {|in| GVerb.ar(in, \\gverb_size.kr(12), \\gverb_time.kr(4.25), 0.9, mul:\\mulgverb.kr(1)) };" ], [ 681.442729725, 'joach', "(
~test[7] = \\set -> QuantEnv(\\mulgverb, 8)
.phase(1, [0,1,0], [0.05, 7.95], [2,-2], 0, 4)
.phase(2, [0,1,0], [2.35, 5.65], [2,-2], 0, 1)
.play([1,2]);
)" ], [ 672.785123433, 'kof', "b = Buffer.read(s,Platform.resourceDir ++ \"/sounds/beat2.wav\");" ], [ 653.340038855, 'kof', "(
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
);" ], [ 649.787158321, 'kof', "(
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
);" ], [ 643.274446301, 'kof', "(
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
);" ], [ 635.585770129, 'joach', "~test[6] = \\filter -> {|in| GVerb.ar(in, \\gverb_size.kr(12), \\gverb_time.kr(0.25), 0.9, mul:\\mulgverb.kr(1)) };" ], [ 634.293012997, 'kof', "(
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
);" ], [ 629.696590392, 'joach', "~test[6] = \\filter -> {|in| GVerb.ar(in, \\gverb_size.kr(12), \\gverb_time.kr(1), 0.9, mul:\\mulgverb.kr(1)) };" ], [ 620.253804588, 'kof', "(
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
);" ], [ 605.88061489, 'joach', "(
~test[1] = \\set -> QuantEnv(\\amp, 1)
.phase(1, [0,1,0.2], [0.05, 3.45], [2,-2], 0, 4)
.phase(2, [0,1,0.2], [0.35, 3.65], [2,-2], 0, 1)
.phase(3, [0,1,0.2], [3.35, 0.65], [2,-2], 0, 1)
.play([1,2,1,3]);
)" ], [ 605.50647288, 'kof', "(
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
);" ], [ 598.503496556, 'kof', "(
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
);" ], [ 590.05256455, 'joach', "(
~test[2] = \\set -> QuantEnv(\\freq, 4)
.phase(1, [100,80,60], [0.05, 0.325], [8,-8], 0, 1)
.phase(2, [0,1,0], [0.35, 0.65], [2,-2], 0, 1)
.play([1]);
)" ], [ 582.829947741, 'joach', "~test.set(\\lpf_freq, 400);" ], [ 570.716822038, 'joach', "(
~test[1] = \\set -> QuantEnv(\\amp, 2)
.phase(1, [0,1,0.2], [0.05, 3.45], [2,-2], 0, 4)
.phase(2, [0,1,0.2], [0.35, 3.65], [2,-2], 0, 1)
.phase(3, [0,1,0.2], [3.35, 0.65], [2,-2], 0, 1)
.play([1,2,1,3]);
)" ], [ 564.962532483, 'joach', "(
~test[1] = \\set -> QuantEnv(\\amp, 4)
.phase(1, [0,1,0.2], [0.05, 3.45], [2,-2], 0, 4)
.phase(2, [0,1,0.2], [0.35, 3.65], [2,-2], 0, 1)
.phase(3, [0,1,0.2], [3.35, 0.65], [2,-2], 0, 1)
.play([1,2,1,3]);
)" ], [ 561.103931968, 'joach', "(
~test[1] = \\set -> QuantEnv(\\amp, 4)
.phase(1, [0,1,0.2], [0.05, 3.45], [2,-2], 0, 4)
.phase(2, [0,1,0.2], [0.35, 3.65], [2,-2], 0, 1)
.phase(3, [0,1,0.2], [3.35, 0.65], [2,-2], 0, 1)
.play([1,2,3]);
)" ], [ 541.743231551, 'joach', "(
~test[3] = \\set -> QuantEnv(\\fplus, 2)
.phase(1, [0,100,0], [0.005, 0.925], [-8,-8], 0, 4)
.phase(2, [0,450,0], [0.007, 0.65], [8,-4], 0, 1)
.play([1,2]);
)" ], [ 533.774403892, 'joach', "(
~test[3] = \\set -> QuantEnv(\\fplus, 2)
.phase(1, [0,100,0], [0.005, 0.925], [-8,-8], 0, 4)
.phase(2, [0,150,0], [0.007, 0.65], [8,-4], 0, 1)
.play([1,2]);
)" ], [ 513.023062521, 'joach', "(
~test[3] = \\set -> QuantEnv(\\fplus, 2)
.phase(1, [0,100,0], [0.005, 0.925], [-8,-8], 0, 1)
.phase(2, [0,1,0], [0.35, 0.65], [2,-2], 0, 1)
.play([1]);
)" ], [ 504.506962311, 'joach', "(
~test[3] = \\set -> QuantEnv(\\fplus, 2)
.phase(1, [0,400,0], [0.005, 0.925], [-8,-8], 0, 1)
.phase(2, [0,1,0], [0.35, 0.65], [2,-2], 0, 1)
.play([1]);
)" ], [ 488.561493367, 'joach', "(
~test[2] = \\set -> QuantEnv(\\freq, 4)
.phase(1, [600,80,60], [0.05, 0.325], [8,-8], 0, 1)
.phase(2, [0,1,0], [0.35, 0.65], [2,-2], 0, 1)
.play([1]);
)" ], [ 478.303225267, 'kof', "(
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
);" ], [ 472.2391863, 'kof', "(
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
);" ], [ 469.667367897, 'kof', "Kolektiv.tempo_(240);" ], [ 456.233797071, 'kof', "Kolektiv.tempo_(440);" ], [ 446.677791332, 'kof', "Kolektiv.tempo = 240;" ], [ 414.829758225, 'joach', "~test.set(\\lpf_freq, 1800);" ], [ 389.281913004, 'joach', "(
~test[3] = \\set -> QuantEnv(\\fplus, 2)
.phase(1, [0,100,0], [0.005, 0.925], [-8,-8], 0, 1)
.phase(2, [0,1,0], [0.35, 0.65], [2,-2], 0, 1)
.play([1]);
)" ], [ 377.705588343, 'joach', "(
~test[3] = \\set -> QuantEnv(\\fplus, 1)
.phase(1, [0,100,0], [0.005, 0.925], [-8,-8], 0, 1)
.phase(2, [0,1,0], [0.35, 0.65], [2,-2], 0, 1)
.play([1]);
)" ], [ 370.831218306, 'joach', "(
~test[3] = \\set -> QuantEnv(\\fplus, 1)
.phase(1, [0,1000,0], [0.005, 0.925], [-8,-8], 0, 1)
.phase(2, [0,1,0], [0.35, 0.65], [2,-2], 0, 1)
.play([1]);
)" ], [ 364.606679412, 'joach', "(
~test[3] = \\set -> QuantEnv(\\fplus, 1)
.phase(1, [0,1000,0], [0.005, 0.925], [-8,-8], 0, 1)
.phase(2, [0,1,0], [0.35, 0.65], [2,-2], 0, 1)
.play([1]);
)" ], [ 361.983963041, 'joach', "(
~test[3] = \\set -> QuantEnv(\\fplus, 1)
.phase(1, [0,1000,0], [0.005, 0.925], [8,-8], 0, 1)
.phase(2, [0,1,0], [0.35, 0.65], [2,-2], 0, 1)
.play([1]);
)" ], [ 353.790956824, 'joach', "(
~test[3] = \\set -> QuantEnv(\\fplus, 1)
.phase(1, [0,1000,0], [0.005, 0.925], [8,-8], 0, 1)
.phase(2, [0,1,0], [0.35, 0.65], [2,-2], 0, 1)
.play([1]);
)" ], [ 348.764786161, 'joach', "(
~test[3] = \\set -> QuantEnv(\\fplus, 1)
.phase(1, [0,1000,0], [0.005, 0.925], [\\step,-8], 0, 1)
.phase(2, [0,1,0], [0.35, 0.65], [2,-2], 0, 1)
.play([1]);
)" ], [ 342.506244569, 'kof', "(
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
);" ], [ 333.95560754, 'kof', "(
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
);" ], [ 331.63310072, 'joach', "(
~test[3] = \\set -> QuantEnv(\\fplus, 1)
.phase(1, [0,1000,0], [0.005, 0.0925], [8,-8], 0, 1)
.phase(2, [0,1,0], [0.35, 0.65], [2,-2], 0, 1)
.play([1]);
)" ], [ 328.017785252, 'joach', "(
~test[2] = \\set -> QuantEnv(\\freq, 4)
.phase(1, [60,80,60], [0.05, 0.325], [8,-8], 0, 1)
.phase(2, [0,1,0], [0.35, 0.65], [2,-2], 0, 1)
.play([1]);
)" ], [ 319.259855614, 'kof', "(
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
);" ], [ 308.909324277, 'joach', "(
~test[1] = \\set -> QuantEnv(\\amp, 4)
.phase(1, [0,1,0.2], [0.05, 3.45], [2,-2], 0, 4)
.phase(2, [0,1,0.2], [0.35, 3.65], [2,-2], 0, 1)
.play([1,2]);
)" ], [ 301.156914707, 'joach', "(
~test[1] = \\set -> QuantEnv(\\amp, 4)
.phase(1, [0,1,0.2], [0.05, 3.45], [2,-2], 0, 4)
.phase(2, [0,1,0.2], [0.35, 0.65], [2,-2], 0, 1)
.play([1,2]);
)" ], [ 297.871331892, 'kof', "~ss.clear;" ], [ 287.260224292, 'kof', "~ss.stop(10);" ], [ 279.852887166, 'kof', "(
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
);" ], [ 267.629626995, 'joach', "(
~test[1] = \\set -> QuantEnv(\\amp, 0.5)
.phase(1, [0,1,0], [0.05, 0.45], [2,-2], 0, 4)
.phase(2, [0,1,0], [0.35, 0.65], [2,-2], 0, 1)
.play([1,2]);
)" ], [ 256.827052991, 'joach', "~test[5] = \\filter -> {|in| LPF.ar(in, \\lpf_freq.kr(800,8)) };" ], [ 252.155374162, 'kof', "(
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
);" ], [ 237.273042504, 'joach', "(
~test[4] = \\set -> QuantEnv(\\noise, 32)
.phase(1, [0,0.3,0], [12.05, 18.95], [2,-2], 0, 1)
.phase(2, [0,0.7,0], [4.35, 24.65], [2,-2], 0, 1)
.play([1,2]);
)" ], [ 234.331503013, 'joach', "(
~test[4] = \\set -> QuantEnv(\\noise, 32)
.phase(1, [0,0.3,0], [12.05, 18.95], [2,-2], 0, 1)
.phase(2, [0,1,0], [4.35, 24.65], [2,-2], 0, 1)
.play([1,2]);
)" ], [ 228.536880795, 'joach', "(
~test[4] = \\set -> QuantEnv(\\noise, 32)
.phase(1, [0,1,0], [12.05, 18.95], [2,-2], 0, 1)
.phase(2, [0,1,0], [4.35, 24.65], [2,-2], 0, 1)
.play([1,2]);
)" ], [ 226.942335215, 'kof', "(
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
);" ], [ 190.639924141, 'joach', "(
~test[2] = \\set -> QuantEnv(\\freq, 4)
.phase(1, [60,180,60], [0.05, 0.325], [8,-8], 0, 1)
.phase(2, [0,1,0], [0.35, 0.65], [2,-2], 0, 1)
.play([1]);
)" ], [ 184.855304962, 'joach', "(
~test[3] = \\set -> QuantEnv(\\fplus, 1)
.phase(1, [0,100,0], [0.005, 0.0925], [8,-8], 0, 1)
.phase(2, [0,1,0], [0.35, 0.65], [2,-2], 0, 1)
.play([1]);
)" ], [ 181.142737831, 'joach', "(
~test[3] = \\set -> QuantEnv(\\fplus, 1)
.phase(1, [0,100,0], [0.005, 0.0925], [8,-2], 0, 1)
.phase(2, [0,1,0], [0.35, 0.65], [2,-2], 0, 1)
.play([1,2]);
)" ], [ 178.739819961, 'joach', "(
~test[3] = \\set -> QuantEnv(\\fplus, 1)
.phase(1, [0,100,0], [0.005, 0.0925], [2,-2], 0, 1)
.phase(2, [0,1,0], [0.35, 0.65], [2,-2], 0, 1)
.play([1,2]);
)" ], [ 176.991690781, 'kof', "(
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
);" ], [ 173.494943374, 'joach', "(
~test[3] = \\set -> QuantEnv(\\fplus, 1)
.phase(1, [0,100,0], [0.005, 0.125], [2,-2], 0, 1)
.phase(2, [0,1,0], [0.35, 0.65], [2,-2], 0, 1)
.play([1,2]);
)" ], [ 169.678064884, 'joach', "(
~test[3] = \\set -> QuantEnv(\\fplus, 1)
.phase(1, [0,1,0], [0.005, 0.125], [2,-2], 0, 1)
.phase(2, [0,1,0], [0.35, 0.65], [2,-2], 0, 1)
.play([1,2]);
)" ], [ 165.747922023, 'joach', "(
~test[2] = \\set -> QuantEnv(\\freq, 1)
.phase(1, [60,180,60], [0.05, 0.325], [8,-8], 0, 1)
.phase(2, [0,1,0], [0.35, 0.65], [2,-2], 0, 1)
.play([1]);
)" ], [ 157.112515087, 'joach', "(
~test[2] = \\set -> QuantEnv(\\freq, 1)
.phase(1, [60,180,60], [0.005, 0.325], [8,-8], 0, 1)
.phase(2, [0,1,0], [0.35, 0.65], [2,-2], 0, 1)
.play([1]);
)" ], [ 132.76419003, 'joach', "(
~test[1] = \\set -> QuantEnv(\\amp, 1)
.phase(1, [0,1,0], [0.05, 0.95], [2,-2], 0, 4)
.phase(2, [0,1,0], [0.35, 0.65], [2,-2], 0, 1)
.play([1,2]);
)" ], [ 127.505777695, 'kof', "(
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
);" ], [ 119.66123466, 'joach', "(
~test[2] = \\set -> QuantEnv(\\freq, 1)
.phase(1, [60,180,60], [0.005, 0.125], [8,-8], 0, 1)
.phase(2, [0,1,0], [0.35, 0.65], [2,-2], 0, 1)
.play([1]);
)" ], [ 112.123848557, 'joach', "(
~test[2] = \\set -> QuantEnv(\\freq, 1)
.phase(1, [60,80,60], [0.005, 0.125], [8,-8], 0, 1)
.phase(2, [0,1,0], [0.35, 0.65], [2,-2], 0, 1)
.play([1]);
)" ], [ 86.792585847, 'joach', "(
~test[2] = \\set -> QuantEnv(\\freq, 1)
.phase(1, [0,1,0], [0.005, 0.125], [8,-8], 0, 1)
.phase(2, [0,1,0], [0.35, 0.65], [2,-2], 0, 1)
.play([1]);
)" ], [ 61.004517343, 'kof', "(
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
);" ], [ 51.733065469, 'kof', "Kolektiv.tempo_(120);" ], [ 46.92624376, 'kof', "Kolektiv.tempo_(60);" ], [ 35.572390058, 'joach', "(
~test[1] = \\set -> QuantEnv(\\amp, 1)
.phase(1, [0,1,0], [0.05, 0.95], [2,-2], 0, 1)
.phase(2, [0,1,0], [0.35, 0.65], [2,-2], 0, 1)
.play([1,2]);
)" ], [ 31.445899856, 'joach', "(
~test[0] = {
var osc = SinOsc.ar(( \\freq.kr(60) + \\fplus.kr(0) ), mul: 1, add: 0);
var noise = BrownNoise.ar(\\noise.kr(0), (1 - \\noise.kr(0)));
var sig = osc * noise;
Pan2.ar( sig * \\amp.kr(0), \\pan.kr(0) );
};
)" ], [ 30.330634255, 'joach', "~test.play(vol: 0.2, fadeTime: 8);" ], [ 27.662742174, 'kof', "(
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
);" ], [ 23.57180473, 'kof', "  ~tick = {Mix(Impulse.kr( ~tempo / 2 , ~offset ))};" ], [ 23.215988679, 'kof', "  ~tick.quant = 1;" ], [ 22.630240056, 'kof', "  ~offset = (0..7)/8;" ], [ 19.649585304, 'kof', "  ~tick = {Mix(Impulse.kr( ~tempo / 2 , ~offset ))};" ], [ 16.785281223, 'kof', "  ~tick.quant = 1;" ], [ 0, 'kof', "Kolektiv.tempo_(120);" ] ]