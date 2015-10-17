List[ [ 472.070633042, 'kof', "Kolektiv.historySave" ], [ 459.415101389, 'kof', "~aa.stop(10);" ], [ 449.113485185, 'kof', "~hh.stop(7);" ], [ 447.366508068, 'kof', "~kick.stop(7);" ], [ 443.791830663, 'kof', "~hh.stop(4);" ], [ 440.584079393, 'kof', "~kick2.stop(4);" ], [ 435.489582068, 'kof', "(
~aa.ar(2);
~aa.quant=2;
~aa.fadeTime=4.2;
~aa={
  //         |       |       |       |       |  
  var pat = [1,0,0,0,1,0,0,0,1,0,0,0,1,0,0,0].rotate(1);
  var imp = PulseDivider.kr(~tick.kr,2,~counter.kr);
  var hit = Select.kr(PulseCount.kr(imp)/[1,2,3,4]%pat.size,pat);
  var env = EnvGen.ar(Env([0.001,1,0.001],[1.002,0.5],[3,-3],curve:'exp'),imp * hit);
  var sig = SinOsc.ar(4320/(1+(1..4).reciprocal*1pi));
  sig = sig * env;
  Splay.ar(sig,0.25,0.5);
};
~aa.play;
);" ], [ 427.861557967, 'kof', "(
~aa.quant=2;
~aa.fadeTime=4.2;
~aa={
  //         |       |       |       |       |  
  var pat = [1,0,0,0,1,0,0,0,1,0,0,0,1,0,0,0].rotate(1);
  var imp = PulseDivider.kr(~tick.kr,2,~counter.kr);
  var hit = Select.kr(PulseCount.kr(imp)/[1,2,3,4]%pat.size,pat);
  var env = EnvGen.ar(Env([0.001,1,0.001],[1.002,0.5],[3,-3],curve:'exp'),imp * hit);
  var sig = SinOsc.ar(4320/2/(1+(1..4).reciprocal*1pi));
  sig = sig * env;
  Splay.ar(sig,0.25,0.5);
};
~aa.play;
);" ], [ 420.808086926, 'kof', "(
~aa.ar(2);
~aa.quant=2;
~aa.fadeTime=4.2;
~aa={
  //         |       |       |       |       |  
  var pat = [1,0,0,0,1,0,0,0,1,0,0,0,1,0,0,0].rotate(1);
  var imp = PulseDivider.kr(~tick.kr,2,~counter.kr);
  var hit = Select.kr(PulseCount.kr(imp)/[1,2,3,4]%pat.size,pat);
  var env = EnvGen.ar(Env([0.001,1,0.001],[1.002,0.5],[3,-3],curve:'exp'),imp * hit);
  var sig = SinOsc.ar(4320/2/(1+(1..4).reciprocal*1.5pi));
  sig = sig * env;
  Splay.ar(sig,0.25,0.5);
};
~aa.play;
);" ], [ 414.254538753, 'kof', "(
~aa.ar(2);
~aa.quant=2;
~aa.fadeTime=4.2;
~aa={
  //         |       |       |       |       |  
  var pat = [1,0,0,0,1,0,0,0,1,0,0,0,1,0,0,0].rotate(1);
  var imp = PulseDivider.kr(~tick.kr,2,~counter.kr);
  var hit = Select.kr(PulseCount.kr(imp)/[1,2,3,4]%pat.size,pat);
  var env = EnvGen.ar(Env([0.001,1,0.001],[1.002,0.5],[3,-3],curve:'exp'),imp * hit);
  var sig = SinOsc.ar(4320/2/(1+(1..4).reciprocal*1.25pi));
  sig = sig * env;
  Splay.ar(sig,0.25,0.5);
};
~aa.play;
);" ], [ 408.26987045, 'kof', "(
~aa.ar(2);
~aa.quant=2;
~aa.fadeTime=4.2;
~aa={
  //         |       |       |       |       |  
  var pat = [1,0,0,0,1,0,0,0,1,0,0,0,1,0,0,0].rotate(1);
  var imp = PulseDivider.kr(~tick.kr,2,~counter.kr);
  var hit = Select.kr(PulseCount.kr(imp)/[1,2,3,4]%pat.size,pat);
  var env = EnvGen.ar(Env([0.001,1,0.001],[1.002,0.5],[3,-3],curve:'exp'),imp * hit);
  var sig = SinOsc.ar(4320/1.5/(1+(1..4).reciprocal*1.25pi));
  sig = sig * env;
  Splay.ar(sig,0.25,0.5);
};
~aa.play;
);" ], [ 402.328128562, 'kof', "(
~aa.ar(2);
~aa.quant=2;
~aa.fadeTime=4.2;
~aa={
  //         |       |       |       |       |  
  var pat = [1,0,0,0,1,0,0,0,1,0,0,0,1,0,0,0].rotate(1);
  var imp = PulseDivider.kr(~tick.kr,2,~counter.kr);
  var hit = Select.kr(PulseCount.kr(imp)/[1,2,3,4]%pat.size,pat);
  var env = EnvGen.ar(Env([0.001,1,0.001],[1.002,0.5],[3,-3],curve:'exp'),imp * hit);
  var sig = SinOsc.ar(4320/1.5/(1+(1..4).reciprocal*1.5pi));
  sig = sig * env;
  Splay.ar(sig,0.25,0.5);
};
~aa.play;
);" ], [ 395.583597814, 'kof', "(
~aa.ar(2);
~aa.quant=2;
~aa.fadeTime=4.2;
~aa={
  //         |       |       |       |       |  
  var pat = [1,0,0,0,1,0,0,0,1,0,0,0,1,0,0,0].rotate(1);
  var imp = PulseDivider.kr(~tick.kr,2,~counter.kr);
  var hit = Select.kr(PulseCount.kr(imp)/[1,2,3,4]%pat.size,pat);
  var env = EnvGen.ar(Env([0.001,1,0.001],[1.002,0.5],[3,-3],curve:'exp'),imp * hit);
  var sig = SinOsc.ar(4320/1.5/(1+(1..4).reciprocal*2pi));
  sig = sig * env;
  Splay.ar(sig,0.25,0.5);
};
~aa.play;
);" ], [ 387.504574411, 'kof', "(
~aa.ar(2);
~aa.quant=2;
~aa.fadeTime=4.2;
~aa={
  //         |       |       |       |       |  
  var pat = [1,0,0,0,1,0,0,0,1,0,0,0,1,0,0,0].rotate(1);
  var imp = PulseDivider.kr(~tick.kr,2,~counter.kr);
  var hit = Select.kr(PulseCount.kr(imp)/[1,2,3,4]%pat.size,pat);
  var env = EnvGen.ar(Env([0.001,1,0.001],[1.002,0.5],[3,-3],curve:'exp'),imp * hit);
  var sig = SinOsc.ar(4320/1.25/(1+(1..4).reciprocal*2pi));
  sig = sig * env;
  Splay.ar(sig,0.25,0.5);
};
~aa.play;
);" ], [ 379.614556125, 'kof', "(
~aa.ar(2);
~aa.quant=2;
~aa.fadeTime=4.2;
~aa={
  //         |       |       |       |       |  
  var pat = [1,0,0,0,1,0,0,0,1,0,0,0,1,0,0,0].rotate(1);
  var imp = PulseDivider.kr(~tick.kr,2,~counter.kr);
  var hit = Select.kr(PulseCount.kr(imp)/[1,2,3,4]%pat.size,pat);
  var env = EnvGen.ar(Env([0.001,1,0.001],[1.002,0.5],[3,-3],curve:'exp'),imp * hit);
  var sig = SinOsc.ar(4320/1.5/(1+(1..4).reciprocal*2pi));
  sig = sig * env;
  Splay.ar(sig,0.25,0.5);
};
~aa.play;
);" ], [ 368.009387382, 'kof', "(
~aa.ar(2);
~aa.quant=2;
~aa.fadeTime=4.2;
~aa={
  //         |       |       |       |       |  
  var pat = [1,0,0,0,1,0,0,0,1,0,0,0,1,0,0,0].rotate(1);
  var imp = PulseDivider.kr(~tick.kr,2,~counter.kr);
  var hit = Select.kr(PulseCount.kr(imp)/[1,2,3,4]%pat.size,pat);
  var env = EnvGen.ar(Env([0.001,1,0.001],[1.002,0.5],[3,-3],curve:'exp'),imp * hit);
  var sig = SinOsc.ar(4320/1.5/(1+(1..4).reciprocal*pi));
  sig = sig * env;
  Splay.ar(sig,0.25,0.5);
};
~aa.play;
);" ], [ 357.954325062, 'kof', "(
~aa.ar(2);
~aa.quant=2;
~aa.fadeTime=2.2;
~aa={
  //         |       |       |       |       |  
  var pat = [1,0,0,0,1,0,0,0,1,0,0,0,1,0,0,0].rotate(1);
  var imp = PulseDivider.kr(~tick.kr,2,~counter.kr);
  var hit = Select.kr(PulseCount.kr(imp)/[1,2,3,4]%pat.size,pat);
  var env = EnvGen.ar(Env([0.001,1,0.001],[1.002,0.5],[3,-3],curve:'exp'),imp * hit);
  var sig = SinOsc.ar(4320/1.25/(1+(1..4).reciprocal*pi));
  sig = sig * env;
  Splay.ar(sig,0.25,0.5);
};
~aa.play;
);" ], [ 342.560358392, 'kof', "(
~hh2.ar(2);
~hh2.quant=2;
~hh2.fadeTime=0.2;
~hh2={
  //         |       |       |       |       |  
  var pat = [1,0,0,0,1,0,0,0,1,0,0,0,1,0,0,0].rotate(1);
  var imp = PulseDivider.kr(~tick.kr,1,~counter.kr);
  var hit = Select.kr(PulseCount.kr(imp)/[1,2,3,4]%pat.size,pat);
  var env = EnvGen.ar(Env([0.001,1,0.001],[0.002,0.15],[3,-3],curve:'exp'),imp * hit);
  var sig = LFNoise1.ar(15000!2);
  sig = sig * env;
  Splay.ar(sig,0.15,0.25);
};
~hh2.play;
);" ], [ 334.997360476, 'kof', "(
~kick2.ar(2);
~kick2.quant=2;
~kick2.fadeTime=0.2;
~kick2={
  //         |       |       |       |       |  
  var pat = [1,0,0,0,1,0,0,0,1,0,0,0,1,0,0,0].rotate(3);
  var imp = PulseDivider.kr(~tick.kr,1,~counter.kr);
  var hit = Select.kr(PulseCount.kr(imp)%pat.size,pat);
  var env = EnvGen.ar(Env([0.001,1,0.001],[0.002,1.5],[3,-3],curve:'exp'),imp * hit);
  var sig = SinOsc.ar(50+(env**100*100));
  sig = sig * env;
  Splay.ar(sig,0.75,0.5);
};
~kick2.play;
);" ], [ 319.065936626, 'kof', "(
~aa.ar(2);
~aa.quant=2;
~aa.fadeTime=4.2;
~aa={
  //         |       |       |       |       |  
  var pat = [1,0,0,0,1,0,0,0,1,0,0,0,1,0,0,0].rotate(1);
  var imp = PulseDivider.kr(~tick.kr,2,~counter.kr);
  var hit = Select.kr(PulseCount.kr(imp)/[1,2,3,4]%pat.size,pat);
  var env = EnvGen.ar(Env([0.001,1,0.001],[1.002,0.5],[3,-3],curve:'exp'),imp * hit);
  var sig = SinOsc.ar(4320/1.5/(1+(1..4).reciprocal*pi));
  sig = sig * env;
  Splay.ar(sig,0.25,0.5);
};
~aa.play;
);" ], [ 259.104961441, 'kof', "(
~hh.quant=4;
~hh.fadeTime=0.2;
~hh={
  //         |       |       |       |       |  
  var pat = [1,0,0,0,1,0,0,0,1,0,0,0,1,1,0,0].rotate(3);
  var imp = PulseDivider.kr(~tick.kr,1,~counter.kr);
  var hit = Select.kr(PulseCount.kr(imp)%pat.size,pat);
  var env = EnvGen.ar(Env([0.0001,1,0.0001],[0.002,0.15],[3,-3],curve:'exp'),imp * hit);
  var sig = WhiteNoise.ar(1);
  sig = RHPF.ar(sig,[12000,3000]+(env**5*5400),0.4);
  sig = sig * env;
  sig = CompanderD.ar(sig,3/4,1/2,1/2);
  Splay.ar(sig,0.75,0.5);
};
~hh.play;
);" ], [ 236.835029809, 'kof', "(
~hh.quant=4;
~hh.fadeTime=0.2;
~hh={
  //         |       |       |       |       |  
  var pat = [1,0,0,0,1,0,0,0,1,0,0,0,1,1,0,0].rotate(3);
  var imp = PulseDivider.kr(~tick.kr,1,~counter.kr);
  var hit = Select.kr(PulseCount.kr(imp)%pat.size,pat);
  var env = EnvGen.ar(Env([0.001,1,0.001],[0.002,0.15],[3,-3],curve:'exp'),imp * hit);
  var sig = WhiteNoise.ar(1);
  sig = RHPF.ar(sig,[12000,3000]+(env**5*5400),0.4);
  sig = sig * env;
  sig = CompanderD.ar(sig,3/4,1/2,1/2);
  Splay.ar(sig,0.75,0.5);
};
~hh.play;
);" ], [ 232.44397623, 'kof', "(
~kick.quant=4;
~kick.fadeTime=0.2;
~kick={
  //         |       |       |       |       |  
  var pat = [1,0,0,0,1,0,0,0,1,0,0,0,1,1,0,0].rotate(1);
  var imp = PulseDivider.kr(~tick.kr,1,~counter.kr);
  var hit = Select.kr(PulseCount.kr(imp)%pat.size,pat);
  var env = EnvGen.ar(Env([0.001,1,0.001],[0.002,2.0],[3,-3],curve:'exp'),imp * hit);
  var sig = Mix.fill(16,{|i| SinOsc.ar(50+i+(env**(50+i)*500),i,mul:0.95).tanh + BrownNoise.ar(env**5/16)});
  sig = sig * env;
  sig = CompanderD.ar(sig,3/4,1/2,1/2);
  Splay.ar(sig.flat,0.75,0.5);
};
~kick.play;
);" ], [ 227.163645106, 'kof', "(
~kick.quant=4;
~kick.fadeTime=0.2;
~kick={
  //         |       |       |       |       |  
  var pat = [1,0,0,0,1,0,0,0,1,0,0,0,1,1,0,0].rotate(1);
  var imp = PulseDivider.kr(~tick.kr,2,~counter.kr);
  var hit = Select.kr(PulseCount.kr(imp)%pat.size,pat);
  var env = EnvGen.ar(Env([0.001,1,0.001],[0.002,2.0],[3,-3],curve:'exp'),imp * hit);
  var sig = Mix.fill(16,{|i| SinOsc.ar(50+i+(env**(50+i)*500),i,mul:0.95).tanh + BrownNoise.ar(env**5/16)});
  sig = sig * env;
  sig = CompanderD.ar(sig,3/4,1/2,1/2);
  Splay.ar(sig.flat,0.75,0.5);
};
~kick.play;
);" ], [ 219.823458109, 'kof', "(
~hh.quant=4;
~hh.fadeTime=0.2;
~hh={
  //         |       |       |       |       |  
  var pat = [1,0,0,0,1,0,0,0,1,0,0,0,1,1,0,0].rotate(3);
  var imp = PulseDivider.kr(~tick.kr,2,~counter.kr);
  var hit = Select.kr(PulseCount.kr(imp)%pat.size,pat);
  var env = EnvGen.ar(Env([0.001,1,0.001],[0.002,0.15],[3,-3],curve:'exp'),imp * hit);
  var sig = WhiteNoise.ar(1);
  sig = RHPF.ar(sig,[12000,3000]+(env**5*5400),0.4);
  sig = sig * env;
  sig = CompanderD.ar(sig,3/4,1/2,1/2);
  Splay.ar(sig,0.75,0.5);
};
~hh.play;
);" ], [ 219.345417397, 'kof', "(
~hh.fadeTime=0.2;
~hh={
  //         |       |       |       |       |  
  var pat = [1,0,0,0,1,0,0,0,1,0,0,0,1,1,0,0].rotate(3);
  var imp = PulseDivider.kr(~tick.kr,2,~counter.kr);
  var hit = Select.kr(PulseCount.kr(imp)%pat.size,pat);
  var env = EnvGen.ar(Env([0.001,1,0.001],[0.002,0.15],[3,-3],curve:'exp'),imp * hit);
  var sig = WhiteNoise.ar(1);
  sig = RHPF.ar(sig,[12000,3000]+(env**5*5400),0.4);
  sig = sig * env;
  sig = CompanderD.ar(sig,3/4,1/2,1/2);
  Splay.ar(sig,0.75,0.5);
};
~hh.play;
);" ], [ 210.056553254, 'kof', "(
~hh.quant=4;
~hh.fadeTime=0.2;
~hh={
  //         |       |       |       |       |  
  var pat = [1,0,0,0,1,0,0,0,1,0,0,0,1,1,0,0].rotate(3);
  var imp = PulseDivider.kr(~tick.kr,4,~counter.kr);
  var hit = Select.kr(PulseCount.kr(imp)%pat.size,pat);
  var env = EnvGen.ar(Env([0.001,1,0.001],[0.002,0.15],[3,-3],curve:'exp'),imp * hit);
  var sig = WhiteNoise.ar(1);
  sig = RHPF.ar(sig,[12000,3000]+(env**5*5400),0.4);
  sig = sig * env;
  sig = CompanderD.ar(sig,3/4,1/2,1/2);
  Splay.ar(sig,0.75,0.5);
};
~hh.play;
);" ], [ 198.607935126, 'kof', "(
~kick.quant=4;
~kick.fadeTime=0.2;
~kick={
  //         |       |       |       |       |  
  var pat = [1,0,0,0,1,0,0,0,1,0,0,0,1,1,0,0].rotate(1);
  var imp = PulseDivider.kr(~tick.kr,4,~counter.kr);
  var hit = Select.kr(PulseCount.kr(imp)%pat.size,pat);
  var env = EnvGen.ar(Env([0.001,1,0.001],[0.002,4.0],[3,-3],curve:'exp'),imp * hit);
  var sig = Mix.fill(16,{|i| SinOsc.ar(50+i+(env**(50+i)*500),i,mul:0.95).tanh + BrownNoise.ar(env**5/16)});
  sig = sig * env;
  sig = CompanderD.ar(sig,3/4,1/2,1/2);
  Splay.ar(sig.flat,0.75,0.5);
};
~kick.play;
);" ], [ 150.670881823, 'kof', "(
~aa.ar(2);
~aa.quant=2;
~aa.fadeTime=0.2;
~aa={
  //         |       |       |       |       |  
  var pat = [1,0,0,0,1,0,0,0,1,0,0,0,1,0,0,0].rotate(1);
  var imp = PulseDivider.kr(~tick.kr,2,~counter.kr);
  var hit = Select.kr(PulseCount.kr(imp)/[1,2,3,4]%pat.size,pat);
  var env = EnvGen.ar(Env([0.001,1,0.001],[1.002,0.5],[3,-3],curve:'exp'),imp * hit);
  var sig = SinOsc.ar(4320/(1+(1..4).reciprocal*pi));
  sig = sig * env;
  Splay.ar(sig,0.25,0.5);
};
~aa.play;
);" ], [ 134.373693878, 'kof', "(
~aa.ar(2);
~aa.quant=2;
~aa.fadeTime=0.2;
~aa={
  //         |       |       |       |       |  
  var pat = [1,0,0,0,1,0,0,0,1,0,0,0,1,0,0,0].rotate(1);
  var imp = PulseDivider.kr(~tick.kr,2,~counter.kr);
  var hit = Select.kr(PulseCount.kr(imp)/[1,2,3,4]%pat.size,pat);
  var env = EnvGen.ar(Env([0.001,1,0.001],[1.002,0.5],[3,-3],curve:'exp'),imp * hit);
  var sig = SinOsc.ar(432*(1+(1..4).reciprocal));
  sig = sig * env;
  Splay.ar(sig,0.25,0.5);
};
~aa.play;
);" ], [ 126.24418969, 'kof', "(
~hh.ar(2);
~hh.quant=2;
~hh.fadeTime=0.2;
~hh={
  //         |       |       |       |       |  
  var pat = [1,0,0,0,1,0,0,0,1,0,0,0,1,0,0,0].rotate(1);
  var imp = PulseDivider.kr(~tick.kr,1,~counter.kr);
  var hit = Select.kr(PulseCount.kr(imp)/[1,2,3,4]%pat.size,pat);
  var env = EnvGen.ar(Env([0.001,1,0.001],[0.002,0.15],[3,-3],curve:'exp'),imp * hit);
  var sig = LFNoise1.ar(15000!2);
  sig = sig * env;
  Splay.ar(sig,0.15,0.25);
};
~hh.play;
);" ], [ 118.259481328, 'kof', "(
~hh.ar(2);
~hh.quant=2;
~hh.fadeTime=0.2;
~hh={
  //         |       |       |       |       |  
  var pat = [1,0,0,0,1,0,0,0,1,0,0,0,1,0,0,0].rotate(1);
  var imp = PulseDivider.kr(~tick.kr,1,~counter.kr);
  var hit = Select.kr(PulseCount.kr(imp)/[1,2,3,4]%pat.size,pat);
  var env = EnvGen.ar(Env([0.001,1,0.001],[0.002,0.15],[3,-3],curve:'exp'),imp * hit);
  var sig = LFNoise1.ar(15000!2);
  sig = sig * env;
  Splay.ar(sig,0.75,0.5);
};
~hh.play;
);" ], [ 92.503818733, 'kof', "(
~aa.quant=2;
~aa.fadeTime=0.2;
~aa={
  //         |       |       |       |       |  
  var pat = [1,0,0,0,1,0,0,0,1,0,0,0,1,0,0,0].rotate(1);
  var imp = PulseDivider.kr(~tick.kr,1,~counter.kr);
  var hit = Select.kr(PulseCount.kr(imp)/[1,2,3,4]%pat.size,pat);
  var env = EnvGen.ar(Env([0.001,1,0.001],[1.002,0.5],[3,-3],curve:'exp'),imp * hit);
  var sig = SinOsc.ar(432*(1+(1..4).reciprocal));
  sig = sig * env;
  Splay.ar(sig,0.25,0.5);
};
~aa.play;
);" ], [ 87.763014777, 'kof', "(
~kick.ar(2);
~kick.quant=2;
~kick.fadeTime=0.2;
~kick={
  //         |       |       |       |       |  
  var pat = [1,0,0,0,1,0,0,0,1,0,0,0,1,0,0,0].rotate(3);
  var imp = PulseDivider.kr(~tick.kr,1,~counter.kr);
  var hit = Select.kr(PulseCount.kr(imp)%pat.size,pat);
  var env = EnvGen.ar(Env([0.001,1,0.001],[0.002,1.5],[3,-3],curve:'exp'),imp * hit);
  var sig = SinOsc.ar(50+(env**100*100));
  sig = sig * env;
  Splay.ar(sig,0.75,0.5);
};
~kick.play;
);" ], [ 77.969084882, 'kof', "(
~kick.ar(2);
~kick.quant=2;
~kick.fadeTime=0.2;
~kick={
  //         |       |       |       |       |  
  var pat = [1,0,0,0,1,0,0,0,1,0,0,0,1,0,0,0].rotate(3);
  var imp = PulseDivider.kr(~tick.kr,2,~counter.kr);
  var hit = Select.kr(PulseCount.kr(imp)%pat.size,pat);
  var env = EnvGen.ar(Env([0.001,1,0.001],[0.002,0.5],[3,-3],curve:'exp'),imp * hit);
  var sig = SinOsc.ar(50+(env**100*100));
  sig = sig * env;
  Splay.ar(sig,0.75,0.5);
};
~kick.play;
);" ], [ 58.252563376, 'kof', "(
~aa.ar(2);
~aa.quant=2;
~aa.fadeTime=0.2;
~aa={
  //         |       |       |       |       |  
  var pat = [1,0,0,0,1,0,0,0,1,0,0,0,1,0,0,0].rotate(1);
  var imp = PulseDivider.kr(~tick.kr,1,~counter.kr);
  var hit = Select.kr(PulseCount.kr(imp)/[1,2,3,4]%pat.size,pat);
  var env = EnvGen.ar(Env([0.001,1,0.001],[1.002,0.5],[3,-3],curve:'exp'),imp * hit);
  var sig = SinOsc.ar(432*(1+(1..4).reciprocal));
  sig = sig * env;
  Splay.ar(sig,0.75,0.5);
};
~aa.play;
);" ], [ 37.463703527, 'kof', "(
~aa.ar(2);
~aa.quant=2;
~aa.fadeTime=0.2;
~aa={
  //         |       |       |       |       |  
  var pat = [1,0,0,0,1,0,0,0,1,0,0,0,1,0,0,0].rotate(1);
  var imp = PulseDivider.kr(~tick.kr,1,~counter.kr);
  var hit = Select.kr(PulseCount.kr(imp)/[1,2,3,4]%pat.size,pat);
  var env = EnvGen.ar(Env([0.001,1,0.001],[0.002,0.5],[3,-3],curve:'exp'),imp * hit);
  var sig = SinOsc.ar(50*(1+(1..4).reciprocal));
  sig = sig * env;
  Splay.ar(sig,0.75,0.5);
};
~aa.play;
);" ], [ 29.281240864, 'kof', "(
~aa.ar(2);
~aa.quant=2;
~aa.fadeTime=0.2;
~aa={
  //         |       |       |       |       |  
  var pat = [1,0,0,0,1,0,0,0,1,0,0,0,1,0,0,0].rotate(1);
  var imp = PulseDivider.kr(~tick.kr,1,~counter.kr);
  var hit = Select.kr(PulseCount.kr(imp)%pat.size,pat);
  var env = EnvGen.ar(Env([0.001,1,0.001],[0.002,0.5],[3,-3],curve:'exp'),imp * hit);
  var sig = SinOsc.ar(50*(1+(1..4).reciprocal));
  sig = sig * env;
  Splay.ar(sig,0.75,0.5);
};
~aa.play;
);" ], [ 11.591455634, 'kof', "(
~aa.ar(2);
~aa.quant=2;
~aa.fadeTime=0.2;
~aa={
  //         |       |       |       |       |  
  var pat = [1,0,0,0,1,0,0,0,1,0,0,0,1,0,0,0].rotate(1);
  var imp = PulseDivider.kr(~tick.kr,1,~counter.kr);
  var hit = Select.kr(PulseCount.kr(imp)%pat.size,pat);
  var env = EnvGen.ar(Env([0.001,1,0.001],[0.002,0.5],[3,-3],curve:'exp'),imp * hit);
  var sig = SinOsc.ar(50!2);
  sig = sig * env;
  Splay.ar(sig,0.75,0.5);
};
~aa.play;
);" ], [ 5.712163673, 'kof', "(
  p.clock.tempo_(60/60);
  
  ~offset = (0..7)/8;
  
  ~tick.quant = 1;
  ~tick = {Mix(Impulse.kr( ~tempo / 2 , ~offset ))};
  
  ~counter = {PulseCount.kr(~tick.kr)};
);" ], [ 2.573721559, 'kof', "(
  p=ProxySpace.push(s.boot);
  p.makeTempoClock;
);" ], [ 0, 'kof', "Kolektiv.tempo_(120);" ] ]