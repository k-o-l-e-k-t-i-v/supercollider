List[ [ 3963.329017, 'alex', "~z.clear(fadeTime:2);" ], [ 3960.0090123, 'kof', "thisProcess.stop;" ], [ 3949.117997, 'alex', "(

~z[0]={
	var sig, env, fenv;

	env=EnvGen.kr(Env([0,1,0], [16,8], [\\welch, \\lin]), \\trig.tr);
	sig=LFSaw.ar(\\freq.kr+[1,2,3,5,8,13].reciprocal).lag([0.01,0.02, 0.003]);
	sig=sig*env;


};
)" ], [ 3941.5879865, 'kof', "(
~chaotic.ar(2);
~chaotic.quant=2;
~chaotic.fadeTime=3.2;
~chaotic={
  //         |       |       |       |       |  
  var pat = [1,0,0,0,1,1,0,0,1,0,0,0,1,1,0,0].rotate(1);
  var imp = PulseDivider.kr(~tick.kr,64,~counter.kr);
  var hit = Select.kr(PulseCount.kr(imp)%pat.size,pat);
  var env = EnvGen.ar(Env([0.001,1,0.001],[0.002,0.15],[3,-3],curve:'exp'),imp * hit);
    var sig = LFNoise0.ar(15000);
    sig = LPF.ar(sig,800 + LFSaw.ar(80).range(0,1000));
  sig = sig * env;
  Splay.ar(sig,0.75,0.15);
};
~chaotic.play;
);" ], [ 3928.2259677, 'alex', "~z[31]=\\filter-> {arg in; Limiter.ar(GVerb.ar(in,[80,40],12,add:in),0.4)};" ], [ 3914.8359489, 'alex', "~z.play(vol:0.001, fadeTime:2).quant_(16);" ], [ 3912.5259457, 'alex', "~z.play(vol:0.01, fadeTime:2).quant_(16);" ], [ 3899.3849272, 'alex', "~z.play(vol:0.1, fadeTime:2).quant_(16);" ], [ 3890.5149148, 'alex', "~z.play(vol:0.01, fadeTime:2).quant_(16);" ], [ 3885.2649075, 'alex', "~z.play(vol:0.001, fadeTime:2).quant_(16);" ], [ 3882.9749043, 'alex', "~z[31]=\\filter-> {arg in; GVerb.ar(in,[80,40],12,add:in)};" ], [ 3881.7649026, 'alex', "~z[2]=\\set->Pbind(\\args, [\\trig], \\dur, 24, \\trig, 1);" ], [ 3880.8849013, 'alex', "~z[1]=\\set->Pbind(\\args, [\\freq], \\dur, 24*2, \\freq,Pseq([220,140,165,85,240,260],inf));" ], [ 3878.494898, 'alex', "(

~z[0]={
	var sig, env, fenv;

	env=EnvGen.kr(Env([0,1,0], [16,8], [\\welch, \\lin]), \\trig.tr);

	sig=LFSaw.ar(\\freq.kr+[1,2,3,5,8,13].reciprocal).lag([0.001,0.002, 0.003]);
	sig=sig*env;


};
)" ], [ 3876.4748952, 'kof', "~kick.clear;" ], [ 3873.5068582, 'joach', "~saw8.set(\\lpf_freq, 200);" ], [ 3872.6438568, 'kof', "(
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
);" ], [ 3871.363855, 'alex', "p.clock.tempo;" ], [ 3868.4038509, 'kof', "~kick.clear;" ], [ 3866.0798167, 'joach', "~saw8.stop(16);" ], [ 3863.6538113, 'kof', "(
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
);" ], [ 3858.8138045, 'kof', "~kick.clear;" ], [ 3857.3417745, 'joach', "~saw8.play(vol: 0.8, fadeTime: 18);" ], [ 3856.3527681, 'kof', "~ff.clear;" ], [ 3854.6027657, 'alex', "~z.play(vol:0.001, fadeTime:2).quant_(16);" ], [ 3850.8927605, 'alex', "~z.clear(fadeTime:2);" ], [ 3844.2417193, 'joach', "(
~saw8[7] = \\set -> QuantEnv(\\fplus, 4)
.phase(1, [0,1660,0], [0.005, 0.135], [8,-8], 0, 8)
.phase(2, [0,880,0], [0.015, 0.165], [8,-8], 0, 1)
.play([1,2]);
)" ], [ 3843.8817177, 'alex', "~z.play(vol:0.001, fadeTime:2).quant_(16);" ], [ 3839.8706791, 'joach', "(
~saw8[7] = \\set -> QuantEnv(\\fplus, 1)
.phase(1, [0,1660,0], [0.005, 0.135], [8,-8], 0, 8)
.phase(2, [0,880,0], [0.015, 0.165], [8,-8], 0, 1)
.play([1,2]);
)" ], [ 3832.1866385, 'alex', "~z.play(vol:0.01, fadeTime:2).quant_(16);" ], [ 3832.1196347, 'joach', "(
~saw8[5] = \\set -> QuantEnv(\\noise, 8)
.phase(1, [0,0.8,0], [0.05, 7.95], [2,-2], 0, 1)
.phase(2, [0,0.4,0], [4.35, 3.65], [2,-2], 0, 1)
.play([1,2]);
)" ], [ 3828.1516287, 'kof', "(
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
);" ], [ 3827.0915965, 'joach', "~saw8.play(vol: 0.3, fadeTime: 18);" ], [ 3821.5265561, 'joach', "~saw8.set(\\lpf_freq, 12400);" ], [ 3819.2615504, 'alex', "~z.play(vol:0.1, fadeTime:2).quant_(16);" ], [ 3813.3615422, 'alex', "~z.play(vol:0.2, fadeTime:2).quant_(16);" ], [ 3809.2915365, 'alex', "~z.play(vol:0.7, fadeTime:2).quant_(16);" ], [ 3806.1335026, 'joach', "(
~saw8[0] = {
var osc = SinOsc.ar(( \\freq.kr(6000) + \\fplus.kr(0) ), mul: 1, add: 0);
var noise = BrownNoise.ar(\\noise.kr(0), (1 - \\noise.kr(0)));
var sig = osc * noise;
Pan2.ar( sig * \\amp.kr(0), \\pan.kr(0) );
};
)" ], [ 3805.4864717, 'alex', "~z[31]=\\filter-> {arg in; GVerb.ar(in,[80,40],12,add:in)};" ], [ 3805.359465, 'joach', "~saw8.play(vol: 0.1, fadeTime: 18);" ], [ 3804.1494633, 'alex', "~z[2]=\\set->Pbind(\\args, [\\trig], \\dur, 24, \\trig, 1);" ], [ 3802.9494616, 'alex', "~z[1]=\\set->Pbind(\\args, [\\freq], \\dur, 24*2, \\freq,Pseq([220,140,165,85,240,260],inf));" ], [ 3800.5594583, 'alex', "(

~z[0]={
	var sig, env, fenv;

	env=EnvGen.kr(Env([0,1,0], [16,8], [\\welch, \\lin]), \\trig.tr);

	sig=LFSaw.ar(\\freq.kr+[1,2,3,5,8,13].reciprocal).lag([0.001,0.002, 0.003]);
	sig=sig*env;


};
)" ], [ 3799.4294567, 'alex', "~z.scope;" ], [ 3789.9894435, 'kof', "(
    ~kick.ar(2);
    ~kick.quant=2;
    ~kick.fadeTime=0.2;
    ~kick={
        //         |       |       |       |       |  
        var pat = [1,0,0,0,1,1,0,0,1,0,0,0,1,1,0,0].rotate(3);
        var imp = PulseDivider.kr(~tick.kr,32,~counter.kr);
        var hit = Select.kr(PulseCount.kr(imp)%pat.size,pat);
        var env = EnvGen.ar(Env([0.001,1,0.001],[0.002,4.5],[3,-3],curve:'exp'),imp * hit);
        var sig = SinOsc.ar(50+(env**100*100),SinOsc.ar(50/2));
        sig = sig * env;
        Splay.ar(sig,0.75,0.95);
    };
    ~kick.play;
);" ], [ 3775.2203911, 'joach', "~saw8.stop(6);" ], [ 3771.6183848, 'kof', "~ff.clear;" ], [ 3768.5683805, 'kof', "~chaotic.clear;" ], [ 3764.9583425, 'joach', "~saw8.stop(6);" ], [ 3758.6183337, 'kof', "(
~chaotic.ar(2);
~chaotic.quant=2;
~chaotic.fadeTime=3.2;
~chaotic={
  //         |       |       |       |       |  
  var pat = [1,0,0,0,1,1,0,0,1,0,0,0,1,1,0,0].rotate(1);
  var imp = PulseDivider.kr(~tick.kr,2,~counter.kr);
  var hit = Select.kr(PulseCount.kr(imp)%pat.size,pat);
  var env = EnvGen.ar(Env([0.001,1,0.001],[0.002,0.15],[3,-3],curve:'exp'),imp * hit);
    var sig = LFNoise0.ar(15000);
    sig = LPF.ar(sig,800 + LFSaw.ar(80).range(0,1000));
  sig = sig * env;
  Splay.ar(sig,0.75,0.5);
};
~chaotic.play;
);" ], [ 3754.9152959, 'joach', "(
~saw8[1] = \\set -> QuantEnv(\\amp, 4)
.phase(1, [0,1,0.2], [0.05, 0.95], [2,-2], 0, 8)
.phase(2, [0,1,0.2], [0.05, 0.25], [2,-2], 0, 2)
.phase(3, [0,1,0.1,0.4,0.8], [0.15, 0.25, 0.1], [2,\\step, -2], 0, 1)
.play([1,2,1,3]);
)" ], [ 3752.0162914, 'kof', "(
~chaotic.ar(2);
~chaotic.quant=2;
~chaotic.fadeTime=3.2;
~chaotic={
  //         |       |       |       |       |  
  var pat = [1,0,0,0,1,1,0,0,1,0,0,0,1,1,0,0].rotate(1);
  var imp = PulseDivider.kr(~tick.kr,4,~counter.kr);
  var hit = Select.kr(PulseCount.kr(imp)%pat.size,pat);
  var env = EnvGen.ar(Env([0.001,1,0.001],[0.002,0.15],[3,-3],curve:'exp'),imp * hit);
    var sig = LFNoise0.ar(15000);
    sig = LPF.ar(sig,800 + LFSaw.ar(80).range(0,1000));
  sig = sig * env;
  Splay.ar(sig,0.75,0.5);
};
~chaotic.play;
);" ], [ 3749.615288, 'kof', "(
~chaotic.ar(2);
~chaotic.quant=2;
~chaotic.fadeTime=3.2;
~chaotic={
  //         |       |       |       |       |  
  var pat = [1,0,0,0,1,1,0,0,1,0,0,0,1,1,0,0].rotate(1);
  var imp = PulseDivider.kr(~tick.kr,4,~counter.kr);
  var hit = Select.kr(PulseCount.kr(imp)%pat.size,pat);
  var env = EnvGen.ar(Env([0.001,1,0.001],[0.002,0.15],[3,-3],curve:'exp'),imp * hit);
    var sig = LFNoise0.ar(15000);
    sig = LPF.ar(sig,800 + LFSaw.ar(8).range(0,1000));
  sig = sig * env;
  Splay.ar(sig,0.75,0.5);
};
~chaotic.play;
);" ], [ 3745.7462541, 'joach', "(
~saw8[1] = \\set -> QuantEnv(\\amp, 4)
.phase(1, [0,1,0.2], [0.05, 0.95], [2,-2], 0, 8)
.phase(2, [0,1,0.2], [0.05, 0.25], [2,-2], 0, 2)
.phase(3, [0,1,0.1,0.4,0], [0.15, 0.25, 0.1], [2,\\step, -2], 0, 1)
.play([1,2,1,3]);
)" ], [ 3741.9732442, 'kof', "(
~chaotic.ar(2);
~chaotic.quant=2;
~chaotic.fadeTime=3.2;
~chaotic={
  //         |       |       |       |       |  
  var pat = [1,0,0,0,1,1,0,0,1,0,0,0,1,1,0,0].rotate(1);
  var imp = PulseDivider.kr(~tick.kr,4,~counter.kr);
  var hit = Select.kr(PulseCount.kr(imp)%pat.size,pat);
  var env = EnvGen.ar(Env([0.001,1,0.001],[0.002,0.15],[3,-3],curve:'exp'),imp * hit);
    var sig = LFNoise0.ar(1500);
    sig = LPF.ar(sig,800 + LFSaw.ar(8).range(0,10000));
  sig = sig * env;
  Splay.ar(sig,0.75,0.5);
};
~chaotic.play;
);" ], [ 3731.967202, 'joach', "~saw8.set(\\lpf_freq, 8400);" ], [ 3726.2701892, 'kof', "(
~chaotic.ar(2);
~chaotic.quant=2;
~chaotic.fadeTime=3.2;
~chaotic={
  //         |       |       |       |       |  
  var pat = [1,0,0,0,1,0,0,0,1,0,0,0,1,0,0,0].rotate(1);
  var imp = PulseDivider.kr(~tick.kr,4,~counter.kr);
  var hit = Select.kr(PulseCount.kr(imp)%pat.size,pat);
  var env = EnvGen.ar(Env([0.001,1,0.001],[0.002,0.15],[3,-3],curve:'exp'),imp * hit);
    var sig = LFNoise0.ar(15000);
    sig = LPF.ar(sig,800 + LFSaw.ar(8).range(0,10000));
  sig = sig * env;
  Splay.ar(sig,0.75,0.5);
};
~chaotic.play;
);" ], [ 3721.8001829, 'kof', "(
~chaotic.ar(2);
~chaotic.quant=2;
~chaotic.fadeTime=3.2;
~chaotic={
  //         |       |       |       |       |  
  var pat = [1,0,0,0,1,0,0,0,1,0,0,0,1,0,0,0].rotate(1);
  var imp = PulseDivider.kr(~tick.kr,4,~counter.kr);
  var hit = Select.kr(PulseCount.kr(imp)%pat.size,pat);
  var env = EnvGen.ar(Env([0.001,1,0.001],[0.002,0.15],[3,-3],curve:'exp'),imp * hit);
    var sig = LFNoise0.ar(15000);
    sig = LPF.ar(sig,800 + LFSaw.ar(8).range(0,10000));
  sig = sig * env;
  Splay.ar(sig,0.75,0.15);
};
~chaotic.play;
);" ], [ 3719.7701801, 'alex', "p.clock.tempo;" ], [ 3719.0601791, 'kof', "(
~chaotic.ar(2);
~chaotic.quant=2;
~chaotic.fadeTime=3.2;
~chaotic={
  //         |       |       |       |       |  
  var pat = [1,0,0,0,1,0,0,0,1,0,0,0,1,0,0,0].rotate(1);
  var imp = PulseDivider.kr(~tick.kr,4,~counter.kr);
  var hit = Select.kr(PulseCount.kr(imp)%pat.size,pat);
  var env = EnvGen.ar(Env([0.001,1,0.001],[0.002,0.15],[3,-3],curve:'exp'),imp * hit);
    var sig = LFNoise0.ar(15000);
    sig = LPF.ar(sig,800 + LFSaw.ar(8).range(0,10000));
  sig = sig * env;
  Splay.ar(sig,0.75,0.015);
};
~chaotic.play;
);" ], [ 3717.9701775, 'kof', "(
~chaotic.ar(2);
~chaotic.quant=2;
~chaotic.fadeTime=3.2;
~chaotic={
  //         |       |       |       |       |  
  var pat = [1,0,0,0,1,0,0,0,1,0,0,0,1,0,0,0].rotate(1);
  var imp = PulseDivider.kr(~tick.kr,4,~counter.kr);
  var hit = Select.kr(PulseCount.kr(imp)%pat.size,pat);
  var env = EnvGen.ar(Env([0.001,1,0.001],[0.002,0.15],[3,-3],curve:'exp'),imp * hit);
    var sig = LFNoise0.ar(15000);
    sig = LPF.ar(sig,800 + LFSaw.ar(8).range(0,10000));
  sig = sig * env;
  Splay.ar(sig,0.75,0.0015);
};
~chaotic.play;
);" ], [ 3715.0191616, 'kof', "(
~chaotic.ar(2);
~chaotic.quant=2;
~chaotic.fadeTime=3.2;
~chaotic={
  //         |       |       |       |       |  
  var pat = [1,0,0,0,1,0,0,0,1,0,0,0,1,0,0,0].rotate(1);
  var imp = PulseDivider.kr(~tick.kr,4,~counter.kr);
  var hit = Select.kr(PulseCount.kr(imp)%pat.size,pat);
  var env = EnvGen.ar(Env([0.001,1,0.001],[0.002,0.15],[3,-3],curve:'exp'),imp * hit);
    var sig = LFNoise0.ar(15000);
    sig = LPF.ar(sig,800 + LFSaw.ar(8).range(0,10000));
  sig = sig * env;
  Splay.ar(sig,0.75,0.00015);
};
~chaotic.play;
);" ], [ 3714.7071438, 'joach', "~saw8.set(\\lpf_freq, 1400);" ], [ 3712.4881368, 'kof', "(
~chaotic.ar(2);
~chaotic.quant=2;
~chaotic.fadeTime=3.2;
~chaotic={
  //         |       |       |       |       |  
  var pat = [1,0,0,0,1,0,0,0,1,0,0,0,1,0,0,0].rotate(1);
  var imp = PulseDivider.kr(~tick.kr,4,~counter.kr);
  var hit = Select.kr(PulseCount.kr(imp)%pat.size,pat);
  var env = EnvGen.ar(Env([0.001,1,0.001],[0.002,0.15],[3,-3],curve:'exp'),imp * hit);
    var sig = LFNoise0.ar(15000/2);
    sig = LPF.ar(sig,800 + LFSaw.ar(8).range(0,10000));
  sig = sig * env;
  Splay.ar(sig,0.75,0.00015);
};
~chaotic.play;
);" ], [ 3709.9281332, 'kof', "(
~chaotic.ar(2);
~chaotic.quant=2;
~chaotic.fadeTime=3.2;
~chaotic={
  //         |       |       |       |       |  
  var pat = [1,0,0,0,1,0,0,0,1,0,0,0,1,0,0,0].rotate(1);
  var imp = PulseDivider.kr(~tick.kr,4,~counter.kr);
  var hit = Select.kr(PulseCount.kr(imp)%pat.size,pat);
  var env = EnvGen.ar(Env([0.001,1,0.001],[0.002,0.15],[3,-3],curve:'exp'),imp * hit);
    var sig = LFNoise0.ar(15000/2);
    sig = LPF.ar(sig,800 + LFSaw.ar(8).range(0,1000));
  sig = sig * env;
  Splay.ar(sig,0.75,0.00015);
};
~chaotic.play;
);" ], [ 3707.8081303, 'kof', "(
~chaotic.ar(2);
~chaotic.quant=2;
~chaotic.fadeTime=3.2;
~chaotic={
  //         |       |       |       |       |  
  var pat = [1,0,0,0,1,0,0,0,1,0,0,0,1,0,0,0].rotate(1);
  var imp = PulseDivider.kr(~tick.kr,4,~counter.kr);
  var hit = Select.kr(PulseCount.kr(imp)%pat.size,pat);
  var env = EnvGen.ar(Env([0.001,1,0.001],[0.002,0.15],[3,-3],curve:'exp'),imp * hit);
    var sig = LFNoise0.ar(15000/2);
    sig = LPF.ar(sig,800 + LFSaw.ar(8).range(0,10000));
  sig = sig * env;
  Splay.ar(sig,0.75,0.00015);
};
~chaotic.play;
);" ], [ 3706.2000952, 'joach', "(
~saw8[8] = \\set -> QuantEnv(\\mulgverb, 4)
.phase(1, [0,1,0.2], [0.05, 0.95], [2,-2], 0, 4)
.phase(2, [0,1,0.5], [0.35, 0.65], [2,-2], 0, 1)
.play([1,2]);
)" ], [ 3704.7160929, 'kof', "(
~chaotic.ar(2);
~chaotic.quant=2;
~chaotic.fadeTime=3.2;
~chaotic={
  //         |       |       |       |       |  
  var pat = [1,0,0,0,1,0,0,0,1,0,0,0,1,0,0,0].rotate(1);
  var imp = PulseDivider.kr(~tick.kr,4,~counter.kr);
  var hit = Select.kr(PulseCount.kr(imp)%pat.size,pat);
  var env = EnvGen.ar(Env([0.001,1,0.001],[0.002,0.15],[3,-3],curve:'exp'),imp * hit);
    var sig = LFNoise0.ar(15000/4);
    sig = LPF.ar(sig,800 + LFSaw.ar(8).range(0,10000));
  sig = sig * env;
  Splay.ar(sig,0.75,0.00015);
};
~chaotic.play;
);" ], [ 3698.9870509, 'joach', "(
~saw8[1] = \\set -> QuantEnv(\\amp, 2)
.phase(1, [0,1,0.0], [0.05, 0.95], [2,-2], 0, 8)
.phase(2, [0,1,0], [0.05, 0.25], [2,-2], 0, 2)
.phase(3, [0,1,0.1,0.4,0], [0.15, 0.25, 0.1], [2,\\step, -2], 0, 1)
.play([1,2,1,3]);
)" ], [ 3697.637049, 'kof', "(
~chaotic.ar(2);
~chaotic.quant=2;
~chaotic.fadeTime=3.2;
~chaotic={
  //         |       |       |       |       |  
  var pat = [1,0,0,0,1,0,0,0,1,0,0,0,1,0,0,0].rotate(1);
  var imp = PulseDivider.kr(~tick.kr,4,~counter.kr);
  var hit = Select.kr(PulseCount.kr(imp)%pat.size,pat);
  var env = EnvGen.ar(Env([0.001,1,0.001],[0.002,0.15],[3,-3],curve:'exp'),imp * hit);
    var sig = LFNoise0.ar(15000/8);
    sig = LPF.ar(sig,800 + LFSaw.ar(8).range(0,10000));
  sig = sig * env;
  Splay.ar(sig,0.75,0.00015);
};
~chaotic.play;
);" ], [ 3693.8270437, 'kof', "(
~chaotic.ar(2);
~chaotic.quant=2;
~chaotic.fadeTime=3.2;
~chaotic={
  //         |       |       |       |       |  
  var pat = [1,0,0,0,1,0,0,0,1,0,0,0,1,0,0,0].rotate(1);
  var imp = PulseDivider.kr(~tick.kr,4,~counter.kr);
  var hit = Select.kr(PulseCount.kr(imp)%pat.size,pat);
  var env = EnvGen.ar(Env([0.001,1,0.001],[0.002,0.15],[3,-3],curve:'exp'),imp * hit);
    var sig = LFNoise0.ar(15000/32);
    sig = LPF.ar(sig,800 + LFSaw.ar(8).range(0,10000));
  sig = sig * env;
  Splay.ar(sig,0.75,0.00015);
};
~chaotic.play;
);" ], [ 3683.406029, 'kof', "(
~chaotic.ar(2);
~chaotic.quant=2;
~chaotic.fadeTime=3.2;
~chaotic={
  //         |       |       |       |       |  
  var pat = [1,0,0,0,1,0,0,0,1,0,0,0,1,0,0,0].rotate(1);
  var imp = PulseDivider.kr(~tick.kr,4,~counter.kr);
  var hit = Select.kr(PulseCount.kr(imp)%pat.size,pat);
  var env = EnvGen.ar(Env([0.001,1,0.001],[0.002,0.05],[3,-3],curve:'exp'),imp * hit);
    var sig = LFNoise0.ar(15000/32);
    sig = LPF.ar(sig,800 + LFSaw.ar(8).range(0,10000));
  sig = sig * env;
  Splay.ar(sig,0.75,0.00015);
};
~chaotic.play;
);" ], [ 3680.0929919, 'joach', "(
~saw8[7] = \\set -> QuantEnv(\\fplus, 0.5)
.phase(1, [0,1660,0], [0.005, 0.135], [8,-8], 0, 8)
.phase(2, [0,880,0], [0.015, 0.165], [8,-8], 0, 1)
.play([1,2]);
)" ], [ 3676.7099563, 'joach', "(
~saw8[7] = \\set -> QuantEnv(\\fplus, 0.5)
.phase(1, [0,1660,0], [0.005, 0.135], [2,-8], 0, 8)
.phase(2, [0,880,0], [0.015, 0.165], [8,-8], 0, 1)
.play([1,2]);
)" ], [ 3676.5649525, 'kof', "(
~chaotic.ar(2);
~chaotic.quant=2;
~chaotic.fadeTime=30.2;
~chaotic={
  //         |       |       |       |       |  
  var pat = [1,0,0,0,1,0,0,0,1,0,0,0,1,0,0,0].rotate(1);
  var imp = PulseDivider.kr(~tick.kr,4,~counter.kr);
  var hit = Select.kr(PulseCount.kr(imp)%pat.size,pat);
  var env = EnvGen.ar(Env([0.001,1,0.001],[0.002,0.05],[3,-3],curve:'exp'),imp * hit);
    var sig = LFNoise0.ar(15000/32);
    sig = LPF.ar(sig,800 + LFSaw.ar(8).range(0,10000));
  sig = sig * env;
  Splay.ar(sig,0.75,0.00015);
};
~chaotic.play;
);" ], [ 3672.327916, 'joach', "(
~saw8[7] = \\set -> QuantEnv(\\fplus, 0.5)
.phase(1, [0,460,0], [0.005, 0.135], [2,-8], 0, 8)
.phase(2, [0,880,0], [0.015, 0.165], [8,-8], 0, 1)
.play([1,2]);
)" ], [ 3662.8268692, 'joach', "(
~saw8[8] = \\set -> QuantEnv(\\mulgverb, 1)
.phase(1, [0,1,0.2], [0.05, 0.95], [2,-2], 0, 4)
.phase(2, [0,1,0.5], [0.35, 0.65], [2,-2], 0, 1)
.play([1,2]);
)" ], [ 3658.0248288, 'joach', "(
~saw8[8] = \\set -> QuantEnv(\\mulgverb, 1)
.phase(1, [0,1,0.2], [0.05, 1.95], [2,-2], 0, 4)
.phase(2, [0,1,0.5], [0.35, 1.65], [2,-2], 0, 1)
.play([1,2]);
)" ], [ 3656.5428244, 'kof', "(
~chaotic.ar(2);
~chaotic.quant=2;
~chaotic.fadeTime=30.2;
~chaotic={
  //         |       |       |       |       |  
  var pat = [1,0,0,0,1,0,0,0,1,0,0,0,1,0,0,0].rotate(1);
  var imp = PulseDivider.kr(~tick.kr,4,~counter.kr);
  var hit = Select.kr(PulseCount.kr(imp)%pat.size,pat);
  var env = EnvGen.ar(Env([0.001,1,0.001],[1.002,1.5],[3,-3],curve:'exp'),imp * hit);
    var sig = LFNoise0.ar(15000/32);
    sig = LPF.ar(sig,800 + LFSaw.ar(8).range(0,10000));
  sig = sig * env;
  Splay.ar(sig,0.75,0.00015);
};
~chaotic.play;
);" ], [ 3653.2167915, 'joach', "~saw8[6] = nil" ], [ 3649.1607504, 'joach', "(
~saw8[6] = \\set -> QuantEnv(\\pan, 1)
.phase(1, [-0.2,0.2,0.2], [0.45, 0.45], [2,-2], 0, 1)
.phase(2, [-0.8,0.8,-0.8], [0.35, 0.65], [2,-2], 0, 1)
.play([1,2]);
)" ], [ 3645.0147414, 'kof', "(
~chaotic.ar(2);
~chaotic.quant=2;
~chaotic.fadeTime=0.2;
~chaotic={
  //         |       |       |       |       |  
  var pat = [1,0,0,0,1,0,0,0,1,0,0,0,1,0,0,0].rotate(1);
  var imp = PulseDivider.kr(~tick.kr,4,~counter.kr);
  var hit = Select.kr(PulseCount.kr(imp)%pat.size,pat);
  var env = EnvGen.ar(Env([0.001,1,0.001],[1.002,1.5],[3,-3],curve:'exp'),imp * hit);
    var sig = LFNoise0.ar(15000/32);
    sig = LPF.ar(sig,800 + LFSaw.ar(8).range(0,10000));
  sig = sig * env;
  Splay.ar(sig,0.75,0.5);
};
~chaotic.play;
);" ], [ 3641.2347361, 'kof', "(
~chaotic.ar(2);
~chaotic.quant=2;
~chaotic.fadeTime=0.2;
~chaotic={
  //         |       |       |       |       |  
  var pat = [1,0,0,0,1,0,0,0,1,0,0,0,1,0,0,0].rotate(1);
  var imp = PulseDivider.kr(~tick.kr,4,~counter.kr);
  var hit = Select.kr(PulseCount.kr(imp)%pat.size,pat);
  var env = EnvGen.ar(Env([0.001,1,0.001],[1.002,1.5],[3,-3],curve:'exp'),imp * hit);
    var sig = LFNoise0.ar(15000/16);
    sig = LPF.ar(sig,800 + LFSaw.ar(8).range(0,10000));
  sig = sig * env;
  Splay.ar(sig,0.75,0.5);
};
~chaotic.play;
);" ], [ 3637.7347312, 'kof', "(
~chaotic.ar(2);
~chaotic.quant=2;
~chaotic.fadeTime=0.2;
~chaotic={
  //         |       |       |       |       |  
  var pat = [1,0,0,0,1,0,0,0,1,0,0,0,1,0,0,0].rotate(1);
  var imp = PulseDivider.kr(~tick.kr,4,~counter.kr);
  var hit = Select.kr(PulseCount.kr(imp)%pat.size,pat);
  var env = EnvGen.ar(Env([0.001,1,0.001],[1.002,1.5],[3,-3],curve:'exp'),imp * hit);
    var sig = LFNoise0.ar(15000/8);
    sig = LPF.ar(sig,800 + LFSaw.ar(8).range(0,10000));
  sig = sig * env;
  Splay.ar(sig,0.75,0.5);
};
~chaotic.play;
);" ], [ 3634.3747265, 'kof', "(
~chaotic.ar(2);
~chaotic.quant=2;
~chaotic.fadeTime=0.2;
~chaotic={
  //         |       |       |       |       |  
  var pat = [1,0,0,0,1,0,0,0,1,0,0,0,1,0,0,0].rotate(1);
  var imp = PulseDivider.kr(~tick.kr,4,~counter.kr);
  var hit = Select.kr(PulseCount.kr(imp)%pat.size,pat);
  var env = EnvGen.ar(Env([0.001,1,0.001],[1.002,1.5],[3,-3],curve:'exp'),imp * hit);
    var sig = LFNoise0.ar(15000/4);
    sig = LPF.ar(sig,800 + LFSaw.ar(8).range(0,10000));
  sig = sig * env;
  Splay.ar(sig,0.75,0.5);
};
~chaotic.play;
);" ], [ 3628.1737139, 'kof', "(
~chaotic.ar(2);
~chaotic.quant=2;
~chaotic.fadeTime=0.2;
~chaotic={
  //         |       |       |       |       |  
  var pat = [1,0,0,0,1,0,0,0,1,0,0,0,1,0,0,0].rotate(1);
  var imp = PulseDivider.kr(~tick.kr,4,~counter.kr);
  var hit = Select.kr(PulseCount.kr(imp)%pat.size,pat);
  var env = EnvGen.ar(Env([0.001,1,0.001],[1.002,1.5],[3,-3],curve:'exp'),imp * hit);
    var sig = LFNoise0.ar(15000);
    sig = LPF.ar(sig,800 + LFSaw.ar(8).range(0,10000));
  sig = sig * env;
  Splay.ar(sig,0.75,0.5);
};
~chaotic.play;
);" ], [ 3627.6446842, 'joach', "~saw8[3] = nil" ], [ 3623.6346786, 'kof', "(
~chaotic.ar(2);
~chaotic.quant=2;
~chaotic.fadeTime=0.2;
~chaotic={
  //         |       |       |       |       |  
  var pat = [1,0,0,0,1,0,0,0,1,0,0,0,1,0,0,0].rotate(1);
  var imp = PulseDivider.kr(~tick.kr,4,~counter.kr);
  var hit = Select.kr(PulseCount.kr(imp)%pat.size,pat);
  var env = EnvGen.ar(Env([0.001,1,0.001],[1.002,1.5],[3,-3],curve:'exp'),imp * hit);
    var sig = LFNoise0.ar(15000);
    sig = LPF.ar(sig,800 + LFSaw.ar(8).range(0,1000));
  sig = sig * env;
  Splay.ar(sig,0.75,0.5);
};
~chaotic.play;
);" ], [ 3621.2016421, 'joach', "(
~saw8[7] = \\set -> QuantEnv(\\fplus, 0.5)
.phase(1, [0,460,0], [0.005, 0.195], [2,-8], 0, 8)
.phase(2, [0,880,0], [0.015, 0.165], [8,-8], 0, 1)
.play([1,2]);
)" ], [ 3619.2516394, 'kof', "(
~chaotic.ar(2);
~chaotic.quant=2;
~chaotic.fadeTime=0.2;
~chaotic={
  //         |       |       |       |       |  
  var pat = [1,0,0,0,1,0,0,0,1,0,0,0,1,0,0,0].rotate(1);
  var imp = PulseDivider.kr(~tick.kr,4,~counter.kr);
  var hit = Select.kr(PulseCount.kr(imp)%pat.size,pat);
  var env = EnvGen.ar(Env([0.001,1,0.001],[1.002,1.5],[3,-3],curve:'exp'),imp * hit);
    var sig = LFNoise0.ar(15000);
    sig = LPF.ar(sig,800 + LFSaw.ar(8).range(0,10000));
  sig = sig * env;
  Splay.ar(sig,0.75,0.5);
};
~chaotic.play;
);" ], [ 3617.3806066, 'joach', "~saw8.set(\\lpf_freq, 8400);" ], [ 3614.2255985, 'kof', "(
~chaotic.ar(2);
~chaotic.quant=2;
~chaotic.fadeTime=0.2;
~chaotic={
  //         |       |       |       |       |  
  var pat = [1,0,0,0,1,0,0,0,1,0,0,0,1,0,0,0].rotate(1);
  var imp = PulseDivider.kr(~tick.kr,4,~counter.kr);
  var hit = Select.kr(PulseCount.kr(imp)%pat.size,pat);
  var env = EnvGen.ar(Env([0.001,1,0.001],[1.002,1.5],[3,-3],curve:'exp'),imp * hit);
    var sig = LFNoise0.ar(15000);
    sig = LPF.ar(sig,800 + LFSaw.ar(8).range(0,1000));
  sig = sig * env;
  Splay.ar(sig,0.75,0.5);
};
~chaotic.play;
);" ], [ 3611.5945618, 'joach', "(
~saw8[7] = \\set -> QuantEnv(\\fplus, 0.5)
.phase(1, [0,460,0], [0.005, 0.195], [2,-8], 0, 8)
.phase(2, [0,280,0], [0.015, 0.165], [8,-8], 0, 1)
.play([1,2]);
)" ], [ 3609.6545591, 'kof', "(
~chaotic.ar(2);
~chaotic.quant=2;
~chaotic.fadeTime=0.2;
~chaotic={
  //         |       |       |       |       |  
  var pat = [1,0,0,0,1,0,0,0,1,0,0,0,1,0,0,0].rotate(1);
  var imp = PulseDivider.kr(~tick.kr,4,~counter.kr);
  var hit = Select.kr(PulseCount.kr(imp)%pat.size,pat);
  var env = EnvGen.ar(Env([0.001,1,0.001],[1.002,1.5],[3,-3],curve:'exp'),imp * hit);
    var sig = LFNoise0.ar(15000);
    sig = LPF.ar(sig,800 + LFSaw.ar(8).range(0,10000));
  sig = sig * env;
  Splay.ar(sig,0.75,0.5);
};
~chaotic.play;
);" ], [ 3606.9075225, 'joach', "(
~saw8[7] = \\set -> QuantEnv(\\fplus, 0.25)
.phase(1, [0,460,0], [0.005, 0.195], [2,-8], 0, 8)
.phase(2, [0,280,0], [0.015, 0.165], [8,-8], 0, 1)
.play([1,2]);
)" ], [ 3605.0325196, 'kof', "(
~chaotic.ar(2);
~chaotic.quant=2;
~chaotic.fadeTime=0.2;
~chaotic={
  //         |       |       |       |       |  
  var pat = [1,0,0,0,1,0,0,0,1,0,0,0,1,0,0,0].rotate(1);
  var imp = PulseDivider.kr(~tick.kr,4,~counter.kr);
  var hit = Select.kr(PulseCount.kr(imp)%pat.size,pat);
  var env = EnvGen.ar(Env([0.001,1,0.001],[1.002,1.5],[3,-3],curve:'exp'),imp * hit);
    var sig = LFNoise0.ar(15000);
    sig = LPF.ar(sig,800 + LFSaw.ar(8).range(0,1000));
  sig = sig * env;
  Splay.ar(sig,0.75,0.5);
};
~chaotic.play;
);" ], [ 3601.9904823, 'joach', "(
~saw8[6] = \\set -> QuantEnv(\\pan, 1)
.phase(1, [-0.2,0.2,0.2], [0.45, 0.45], [2,-2], 0, 1)
.phase(2, [-0.8,0.8,-0.8], [0.35, 0.65], [2,-2], 0, 1)
.play([1,2]);
)" ], [ 3598.7104443, 'joach', "~saw8[5] = nil;" ], [ 3597.0044415, 'kof', "(
~chaotic.ar(2);
~chaotic.quant=2;
~chaotic.fadeTime=0.2;
~chaotic={
  //         |       |       |       |       |  
  var pat = [1,0,0,0,1,0,0,0,1,0,0,0,1,0,0,0].rotate(1);
  var imp = PulseDivider.kr(~tick.kr,4,~counter.kr);
  var hit = Select.kr(PulseCount.kr(imp)%pat.size,pat);
  var env = EnvGen.ar(Env([0.001,1,0.001],[1.002,1.5],[3,-3],curve:'exp'),imp * hit);
    var sig = LFNoise0.ar(15000);
    sig = LPF.ar(sig,800 + LFSaw.ar(8).range(0,10000));
  sig = sig * env;
  Splay.ar(sig,0.75,0.5);
};
~chaotic.play;
);" ], [ 3589.3194009, 'joach', "(
~saw8[1] = \\set -> QuantEnv(\\amp, 1)
.phase(1, [0,1,0.0], [0.05, 0.95], [2,-2], 0, 8)
.phase(2, [0,1,0], [0.05, 0.25], [2,-2], 0, 2)
.phase(3, [0,1,0.1,0.4,0], [0.15, 0.25, 0.1], [2,\\step, -2], 0, 1)
.play([1,2,1,3]);
)" ], [ 3583.1723891, 'kof', "(
~chaotic.ar(2);
~chaotic.quant=2;
~chaotic.fadeTime=0.2;
~chaotic={
  //         |       |       |       |       |  
  var pat = [1,0,0,0,1,0,0,0,1,0,0,0,1,0,0,0].rotate(1);
  var imp = PulseDivider.kr(~tick.kr,8,~counter.kr);
  var hit = Select.kr(PulseCount.kr(imp)%pat.size,pat);
  var env = EnvGen.ar(Env([0.001,1,0.001],[1.002,1.5],[3,-3],curve:'exp'),imp * hit);
    var sig = LFNoise0.ar(1500);
    sig = LPF.ar(sig,800 + LFSaw.ar(8).range(0,10000));
  sig = sig * env;
  Splay.ar(sig,0.75,0.5);
};
~chaotic.play;
);" ], [ 3577.2623809, 'kof', "(
~chaotic.ar(2);
~chaotic.quant=2;
~chaotic.fadeTime=0.2;
~chaotic={
  //         |       |       |       |       |  
  var pat = [1,0,0,0,1,0,0,0,1,0,0,0,1,0,0,0].rotate(1);
  var imp = PulseDivider.kr(~tick.kr,8,~counter.kr);
  var hit = Select.kr(PulseCount.kr(imp)%pat.size,pat);
  var env = EnvGen.ar(Env([0.001,1,0.001],[1.002,1.5],[3,-3],curve:'exp'),imp * hit);
    var sig = LFNoise0.ar(15000);
    sig = LPF.ar(sig,800 + LFSaw.ar(8).range(0,10000));
  sig = sig * env;
  Splay.ar(sig,0.75,0.5);
};
~chaotic.play;
);" ], [ 3572.6223744, 'alex', "~g.clear(fadeTime:20);" ], [ 3569.665338, 'joach', "(
~saw8[0] = {
var osc = SinOsc.ar(( \\freq.kr(80) + \\fplus.kr(0) ), mul: 1, add: 0);
var noise = BrownNoise.ar(\\noise.kr(0), (1 - \\noise.kr(0)));
var sig = osc * noise;
Pan2.ar( sig * \\amp.kr(0), \\pan.kr(0) );
};
)" ], [ 3569.4023358, 'kof', "(
~chaotic.ar(2);
~chaotic.quant=2;
~chaotic.fadeTime=0.2;
~chaotic={
  //         |       |       |       |       |  
  var pat = [1,0,0,0,1,0,0,0,1,0,0,0,1,0,0,0].rotate(1);
  var imp = PulseDivider.kr(~tick.kr,8,~counter.kr);
  var hit = Select.kr(PulseCount.kr(imp)%pat.size,pat);
  var env = EnvGen.ar(Env([0.001,1,0.001],[1.002,1.5],[3,-3],curve:'exp'),imp * hit);
    var sig = LFNoise0.ar(5000);
    sig = LPF.ar(sig,800 + LFSaw.ar(8).range(0,10000));
  sig = sig * env;
  Splay.ar(sig,0.75,0.5);
};
~chaotic.play;
);" ], [ 3564.1923285, 'kof', "(
~chaotic.ar(2);
~chaotic.quant=2;
~chaotic.fadeTime=0.2;
~chaotic={
  //         |       |       |       |       |  
  var pat = [1,0,0,0,1,0,0,0,1,0,0,0,1,0,0,0].rotate(1);
  var imp = PulseDivider.kr(~tick.kr,8,~counter.kr);
  var hit = Select.kr(PulseCount.kr(imp)%pat.size,pat);
  var env = EnvGen.ar(Env([0.001,1,0.001],[1.002,1.5],[3,-3],curve:'exp'),imp * hit);
    var sig = LFNoise0.ar(5000);
    sig = LPF.ar(sig,800 + LFSaw.ar(8).range(0,1000));
  sig = sig * env;
  Splay.ar(sig,0.75,0.5);
};
~chaotic.play;
);" ], [ 3561.9423254, 'kof', "(
~chaotic.ar(2);
~chaotic.quant=2;
~chaotic.fadeTime=0.2;
~chaotic={
  //         |       |       |       |       |  
  var pat = [1,0,0,0,1,0,0,0,1,0,0,0,1,0,0,0].rotate(1);
  var imp = PulseDivider.kr(~tick.kr,8,~counter.kr);
  var hit = Select.kr(PulseCount.kr(imp)%pat.size,pat);
  var env = EnvGen.ar(Env([0.001,1,0.001],[1.002,1.5],[3,-3],curve:'exp'),imp * hit);
    var sig = LFNoise0.ar(500);
    sig = LPF.ar(sig,800 + LFSaw.ar(8).range(0,1000));
  sig = sig * env;
  Splay.ar(sig,0.75,0.5);
};
~chaotic.play;
);" ], [ 3559.8182921, 'joach', "(
~saw8[8] = \\set -> QuantEnv(\\mulgverb, 2)
.phase(1, [0,1,0.2], [0.05, 1.95], [2,-2], 0, 4)
.phase(2, [0,1,0.5], [0.35, 1.65], [2,-2], 0, 1)
.play([1,2]);
)" ], [ 3557.6902864, 'kof', "(
~chaotic.ar(2);
~chaotic.quant=2;
~chaotic.fadeTime=0.2;
~chaotic={
  //         |       |       |       |       |  
  var pat = [1,0,0,0,1,0,0,0,1,0,0,0,1,0,0,0].rotate(1);
  var imp = PulseDivider.kr(~tick.kr,8,~counter.kr);
  var hit = Select.kr(PulseCount.kr(imp)%pat.size,pat);
  var env = EnvGen.ar(Env([0.001,1,0.001],[1.002,1.5],[3,-3],curve:'exp'),imp * hit);
    var sig = LFNoise0.ar(500*1.25);
    sig = LPF.ar(sig,800 + LFSaw.ar(8).range(0,1000));
  sig = sig * env;
  Splay.ar(sig,0.75,0.5);
};
~chaotic.play;
);" ], [ 3552.8002795, 'kof', "(
~chaotic.ar(2);
~chaotic.quant=2;
~chaotic.fadeTime=0.2;
~chaotic={
  //         |       |       |       |       |  
  var pat = [1,0,0,0,1,0,0,0,1,0,0,0,1,0,0,0].rotate(1);
  var imp = PulseDivider.kr(~tick.kr,8,~counter.kr);
  var hit = Select.kr(PulseCount.kr(imp)%pat.size,pat);
  var env = EnvGen.ar(Env([0.001,1,0.001],[1.002,1.5],[3,-3],curve:'exp'),imp * hit);
    var sig = LFNoise0.ar(500*1.5);
    sig = LPF.ar(sig,800 + LFSaw.ar(8).range(0,1000));
  sig = sig * env;
  Splay.ar(sig,0.75,0.5);
};
~chaotic.play;
);" ], [ 3548.6692737, 'kof', "(
~chaotic.ar(2);
~chaotic.quant=2;
~chaotic.fadeTime=0.2;
~chaotic={
  //         |       |       |       |       |  
  var pat = [1,0,0,0,1,0,0,0,1,0,0,0,1,0,0,0].rotate(1);
  var imp = PulseDivider.kr(~tick.kr,8,~counter.kr);
  var hit = Select.kr(PulseCount.kr(imp)%pat.size,pat);
  var env = EnvGen.ar(Env([0.001,1,0.001],[1.002,1.5],[3,-3],curve:'exp'),imp * hit);
    var sig = LFNoise0.ar(500);
    sig = LPF.ar(sig,800 + LFSaw.ar(8).range(0,1000));
  sig = sig * env;
  Splay.ar(sig,0.75,0.5);
};
~chaotic.play;
);" ], [ 3547.4652422, 'joach', "(
~saw8[8] = \\set -> QuantEnv(\\mulgverb, 1)
.phase(1, [0,1,0.2], [0.05, 0.95], [2,-2], 0, 4)
.phase(2, [0,1,0.5], [0.35, 0.65], [2,-2], 0, 1)
.play([1,2]);
)" ], [ 3545.0372356, 'kof', "(
~chaotic.ar(2);
~chaotic.quant=2;
~chaotic.fadeTime=0.2;
~chaotic={
  //         |       |       |       |       |  
  var pat = [1,0,0,0,1,0,0,0,1,0,0,0,1,0,0,0].rotate(1);
  var imp = PulseDivider.kr(~tick.kr,8,~counter.kr);
  var hit = Select.kr(PulseCount.kr(imp)%pat.size,pat);
  var env = EnvGen.ar(Env([0.001,1,0.001],[1.002,1.5],[3,-3],curve:'exp'),imp * hit);
    var sig = LFNoise0.ar(500);
    sig = LPF.ar(sig,800 + LFSaw.ar(4).range(0,1000));
  sig = sig * env;
  Splay.ar(sig,0.75,0.5);
};
~chaotic.play;
);" ], [ 3540.8902104, 'kof', "(
~chaotic.ar(2);
~chaotic.quant=2;
~chaotic.fadeTime=0.2;
~chaotic={
  //         |       |       |       |       |  
  var pat = [1,0,0,0,1,0,0,0,1,0,0,0,1,0,0,0].rotate(1);
  var imp = PulseDivider.kr(~tick.kr,8,~counter.kr);
  var hit = Select.kr(PulseCount.kr(imp)%pat.size,pat);
  var env = EnvGen.ar(Env([0.001,1,0.001],[1.002,1.5],[3,-3],curve:'exp'),imp * hit);
    var sig = LFNoise0.ar(500);
    sig = LPF.ar(sig,800 + LFSaw.ar(4).range(0,10000));
  sig = sig * env;
  Splay.ar(sig,0.75,0.5);
};
~chaotic.play;
);" ], [ 3540.6921991, 'joach', "(
~saw8[1] = \\set -> QuantEnv(\\amp, 1)
.phase(1, [0,1,0.0], [0.05, 0.45], [2,-2], 0, 8)
.phase(2, [0,1,0], [0.05, 0.25], [2,-2], 0, 2)
.phase(3, [0,1,0.1,0.4,0], [0.15, 0.25, 0.1], [2,\\step, -2], 0, 1)
.play([1,2,1,3]);
)" ], [ 3534.2541874, 'kof', "(
~chaotic.ar(2);
~chaotic.quant=2;
~chaotic.fadeTime=0.2;
~chaotic={
  //         |       |       |       |       |  
  var pat = [1,0,0,0,1,0,0,0,1,0,0,0,1,0,0,0].rotate(1);
  var imp = PulseDivider.kr(~tick.kr,8,~counter.kr);
  var hit = Select.kr(PulseCount.kr(imp)%pat.size,pat);
  var env = EnvGen.ar(Env([0.001,1,0.001],[1.002,1.5],[3,-3],curve:'exp'),imp * hit);
    var sig = LFNoise0.ar(500);
    sig = LPF.ar(sig,800 + LFSaw.ar(4).range(0,1000));
  sig = sig * env;
  Splay.ar(sig,0.75,0.5);
};
~chaotic.play;
);" ], [ 3530.7961654, 'kof', "(
~chaotic.ar(2);
~chaotic.quant=2;
~chaotic.fadeTime=0.2;
~chaotic={
  //         |       |       |       |       |  
  var pat = [1,0,0,0,1,0,0,0,1,0,0,0,1,0,0,0].rotate(1);
  var imp = PulseDivider.kr(~tick.kr,8,~counter.kr);
  var hit = Select.kr(PulseCount.kr(imp)%pat.size,pat);
  var env = EnvGen.ar(Env([0.001,1,0.001],[1.002,1.5],[3,-3],curve:'exp'),imp * hit);
    var sig = LFNoise0.ar(50);
    sig = LPF.ar(sig,800 + LFSaw.ar(4).range(0,1000));
  sig = sig * env;
  Splay.ar(sig,0.75,0.5);
};
~chaotic.play;
);" ], [ 3530.5391507, 'joach', "(
~saw8[1] = \\set -> QuantEnv(\\amp, 0.5)
.phase(1, [0,1,0.0], [0.05, 0.45], [2,-2], 0, 8)
.phase(2, [0,1,0], [0.05, 0.25], [2,-2], 0, 2)
.phase(3, [0,1,0.1,0.4,0], [0.15, 0.25, 0.1], [2,\\step, -2], 0, 1)
.play([1,2,1,3]);
)" ], [ 3528.4121462, 'kof', "(
~chaotic.ar(2);
~chaotic.quant=2;
~chaotic.fadeTime=0.2;
~chaotic={
  //         |       |       |       |       |  
  var pat = [1,0,0,0,1,0,0,0,1,0,0,0,1,0,0,0].rotate(1);
  var imp = PulseDivider.kr(~tick.kr,8,~counter.kr);
  var hit = Select.kr(PulseCount.kr(imp)%pat.size,pat);
  var env = EnvGen.ar(Env([0.001,1,0.001],[1.002,1.5],[3,-3],curve:'exp'),imp * hit);
    var sig = LFNoise0.ar(50);
    sig = LPF.ar(sig,800 + LFSaw.ar(4).range(0,10000));
  sig = sig * env;
  Splay.ar(sig,0.75,0.5);
};
~chaotic.play;
);" ], [ 3523.5501064, 'joach', "(
~saw8[1] = \\set -> QuantEnv(\\amp, 0.5)
.phase(1, [0,1,0.2], [0.05, 0.45], [2,-2], 0, 8)
.phase(2, [0,1,0], [0.05, 0.25], [2,-2], 0, 2)
.phase(3, [0,1,0.1,0.4,0], [0.15, 0.25, 0.1], [2,\\step, -2], 0, 1)
.play([1,2,1,3]);
)" ], [ 3522.8271052, 'kof', "(
~chaotic.ar(2);
~chaotic.quant=2;
~chaotic.fadeTime=0.2;
~chaotic={
  //         |       |       |       |       |  
  var pat = [1,0,0,0,1,0,0,0,1,0,0,0,1,0,0,0].rotate(1);
  var imp = PulseDivider.kr(~tick.kr,8,~counter.kr);
  var hit = Select.kr(PulseCount.kr(imp)%pat.size,pat);
  var env = EnvGen.ar(Env([0.001,1,0.001],[1.002,1.5],[3,-3],curve:'exp'),imp * hit);
    var sig = LFNoise0.ar(50);
    sig = LPF.ar(sig,800 + LFSaw.ar(4).range(0,1000));
  sig = sig * env;
  Splay.ar(sig,0.75,0.5);
};
~chaotic.play;
);" ], [ 3517.3250683, 'joach', "(
~saw8[1] = \\set -> QuantEnv(\\amp, 0.5)
.phase(1, [0,1,0.2], [0.05, 0.45], [2,-2], 0, 1)
.phase(2, [0,1,0], [0.05, 0.25], [2,-2], 0, 8)
.phase(3, [0,1,0.1,0.4,0], [0.15, 0.25, 0.1], [2,\\step, -2], 0, 1)
.play([1,2,1,3]);
)" ], [ 3515.643062, 'alex', "~g[31]=\\filter-> {arg in; LPF.ar(in,\\lpf.kr(200))};" ], [ 3512.6030577, 'kof', "(
~chaotic.ar(2);
~chaotic.quant=2;
~chaotic.fadeTime=0.2;
~chaotic={
  //         |       |       |       |       |  
  var pat = [1,0,0,0,1,0,0,0,1,0,0,0,1,0,0,0].rotate(1);
  var imp = PulseDivider.kr(~tick.kr,32,~counter.kr);
  var hit = Select.kr(PulseCount.kr(imp)%pat.size,pat);
  var env = EnvGen.ar(Env([0.001,1,0.001],[1.002,1.5],[3,-3],curve:'exp'),imp * hit);
    var sig = LFNoise0.ar(50);
    sig = LPF.ar(sig,800 + LFSaw.ar(4).range(0,1000));
  sig = sig * env;
  Splay.ar(sig,0.75,0.5);
};
~chaotic.play;
);" ], [ 3503.3930448, 'alex', "~g[31]=\\filter-> {arg in; LPF.ar(in,\\lpf.kr(800))};" ], [ 3501.8170116, 'joach', "(
~saw8[5] = \\set -> QuantEnv(\\noise, 8)
.phase(1, [0,0.8,0], [0.05, 7.95], [2,-2], 0, 1)
.phase(2, [0,0.4,0], [4.35, 3.65], [2,-2], 0, 1)
.play([1,2]);
)" ], [ 3486.7329584, 'joach', "~saw8.set(\\lpf_freq, 8400);" ], [ 3482.0379164, 'joach', "(
~saw8[7] = \\set -> QuantEnv(\\fplus, 0.25)
.phase(1, [0,160,0], [0.005, 0.195], [2,-8], 0, 8)
.phase(2, [0,280,0], [0.015, 0.165], [8,-8], 0, 1)
.play([1,2]);
)" ], [ 3474.0648722, 'joach', "~saw8.set(\\lpf_freq, 1400);" ], [ 3467.1908322, 'joach', "~saw8[3] = \\filter -> {|in| GVerb.ar(in, \\gverb_size.kr(6), \\gverb_time.kr(0.26), 0.9, mul:\\mulgverb.kr(1)) };" ], [ 3465.9838257, 'alex', "~g[30]=\\filter-> {arg in; GVerb.ar(in,[20,10],[2,5],add:in)};" ], [ 3459.0877855, 'joach', "(
~saw8[7] = \\set -> QuantEnv(\\fplus, 0.25)
.phase(1, [0,1600,0], [0.005, 0.195], [2,-8], 0, 8)
.phase(2, [0,280,0], [0.015, 0.165], [8,-8], 0, 1)
.play([1,2]);
)" ], [ 3452.9707571, 'alex', "~g.play(vol:0.7, fadeTime:2).quant_(16);" ], [ 3452.7537446, 'joach', "(
~saw8[7] = \\set -> QuantEnv(\\fplus, 0.25)
.phase(1, [0,160,0], [0.005, 0.195], [2,-8], 0, 8)
.phase(2, [0,280,0], [0.015, 0.165], [8,-8], 0, 1)
.play([1,2]);
)" ], [ 3447.9577019, 'joach', "(
~saw8[1] = \\set -> QuantEnv(\\amp, 0.5)
.phase(1, [0,1,0.2], [0.05, 0.45], [2,-2], 0, 1)
.phase(2, [0,1,0], [0.05, 0.95], [2,-2], 0, 8)
.phase(3, [0,1,0.1,0.4,0], [0.15, 0.25, 0.1], [2,\\step, -2], 0, 1)
.play([1,2,1,3]);
)" ], [ 3442.8156611, 'joach', "(
~saw8[8] = \\set -> QuantEnv(\\mulgverb, 0.5)
.phase(1, [0,1,0.2], [0.05, 0.95], [2,-2], 0, 4)
.phase(2, [0,1,0.5], [0.35, 0.65], [2,-2], 0, 1)
.play([1,2]);
)" ], [ 3441.0256586, 'alex', "~g.play(vol:0.3, fadeTime:2).quant_(16);" ], [ 3436.4356522, 'kof', "(
~chaotic.ar(2);
~chaotic.quant=2;
~chaotic.fadeTime=0.2;
~chaotic={
  //         |       |       |       |       |  
  var pat = [1,0,0,0,1,0,0,0,1,0,0,0,1,0,0,0].rotate(1);
  var imp = PulseDivider.kr(~tick.kr,32,~counter.kr);
  var hit = Select.kr(PulseCount.kr(imp)%pat.size,pat);
  var env = EnvGen.ar(Env([0.001,1,0.001],[1.002,1.5],[3,-3],curve:'exp'),imp * hit);
    var sig = LFNoise0.ar(50);
    sig = LPF.ar(sig,800);
  sig = sig * env;
  Splay.ar(sig,0.75,0.5);
};
~chaotic.play;
);" ], [ 3427.6476104, 'joach', "(
~saw8[0] = {
var osc = SinOsc.ar(( \\freq.kr(60) + \\fplus.kr(0) ), mul: 1, add: 0);
var noise = BrownNoise.ar(\\noise.kr(0), (1 - \\noise.kr(0)));
var sig = osc * noise;
Pan2.ar( sig * \\amp.kr(0), \\pan.kr(0) );
};
)" ], [ 3424.5815728, 'joach', "~saw8[4]=nil" ], [ 3422.8695653, 'alex', "~g.play(vol:0.1, fadeTime:2).quant_(16);" ], [ 3417.2995447, 'alex', "~g[30]=\\filter-> {arg in; GVerb.ar(in,[20,10],[7,5],add:in)};" ], [ 3416.9465245, 'joach', "(
~saw8[8] = \\set -> QuantEnv(\\mulgverb, 4)
.phase(1, [0,1,0.2], [0.05, 0.95], [2,-2], 0, 4)
.phase(2, [0,1,0.5], [0.35, 0.65], [2,-2], 0, 1)
.play([1,2]);
)" ], [ 3416.7575237, 'kof', "(
~chaotic.ar(2);
~chaotic.quant=2;
~chaotic.fadeTime=0.2;
~chaotic={
  //         |       |       |       |       |  
  var pat = [1,0,0,0,1,0,0,0,1,0,0,0,1,0,0,0].rotate(1);
  var imp = PulseDivider.kr(~tick.kr,32,~counter.kr);
  var hit = Select.kr(PulseCount.kr(imp)%pat.size,pat);
  var env = EnvGen.ar(Env([0.001,1,0.001],[1.002,1.5],[3,-3],curve:'exp'),imp * hit);
    var sig = LFNoise0.ar(50);
  sig = sig * env;
  Splay.ar(sig,0.75,0.5);
};
~chaotic.play;
);" ], [ 3415.6375222, 'alex', "~g[3]=\\set->Pbind(\\args, [\\top], \\dur, Pseq([Pn(0.5,3),Pn(0.25,8),6],inf), \\top, Pseq([4,8,4,4,4],inf) );" ], [ 3414.7475209, 'alex', "~g[2]=\\set->Pbind(\\args, [\\trig], \\dur, Pseq([Pn(0.5,3),Pn(0.25,2),6],inf), \\trig, 1);" ], [ 3413.5465136, 'alex', "~g[1]=\\set->Pbind(\\args, [\\freq], \\dur, 8, \\freq,Pseq([Pseq([65,45,47,42,32],4), Pn(65,4)],inf));" ], [ 3413.1154889, 'joach', "(
~saw8[1] = \\set -> QuantEnv(\\amp, 1)
.phase(1, [0,1,0.2], [0.05, 0.45], [2,-2], 0, 1)
.phase(2, [0,1,0], [0.05, 0.95], [2,-2], 0, 8)
.phase(3, [0,1,0.1,0.4,0], [0.15, 0.25, 0.1], [2,\\step, -2], 0, 1)
.play([1,2,1,3]);
)" ], [ 3410.6094812, 'alex', "(
~g[0]={
	var sig, env, fenv;

	env=EnvGen.kr(Env([0,1,0], [0.01,0.25], [\\welch, \\step]), \\trig.tr);
	fenv=EnvGen.kr(Env([\\freq.kr,\\freq.kr*\\top.kr(4),\\freq.kr], [0.01,0.04], \\welch), \\trig.tr);

	sig=SinOsc.ar(fenv!2)*env;


};
)" ], [ 3408.4174484, 'joach', "~saw8.play(vol: 0.9, fadeTime: 18);" ], [ 3404.7974322, 'alex', "~y.clear(fadeTime:2);" ], [ 3404.3814084, 'joach', "(
~saw8[0] = {
var osc = SinOsc.ar(( \\freq.kr(60) + \\fplus.kr(0) ), mul: 1, add: 0);
var noise = BrownNoise.ar(\\noise.kr(0), (1 - \\noise.kr(0)));
var sig = osc * noise;
Pan2.ar( sig * \\amp.kr(0), \\pan.kr(0) );
};
)" ], [ 3402.0853725, 'joach', "(
~saw8[7] = \\set -> QuantEnv(\\fplus, 1)
.phase(1, [0,160,0], [0.005, 0.195], [2,-8], 0, 8)
.phase(2, [0,280,0], [0.015, 0.165], [8,-8], 0, 1)
.play([1,2]);
)" ], [ 3400.4203671, 'alex', "~y[2]=\\set->Pbind(\\args, [\\trig], \\dur, 8, \\trig, 1);" ], [ 3398.4503643, 'alex', "~y[1]=\\set->Pbind(\\args, [\\freq], \\dur, 8, \\freq,Pseq([450,650,750],inf));" ], [ 3394.0803582, 'alex', "(
~y[0]={
	var sig, env, fenv,f2env;

	env=EnvGen.kr(Env([0,1,0], [2,0.01], [\\welch, \\step]), \\trig.tr);
	fenv=EnvGen.kr(Env([\\freq.kr,\\freq.kr*4], [2], \\welch), \\trig.tr);
	f2env=EnvGen.kr(Env([\\f2.kr(10),\\f2.kr(10)*4], [2], \\welch), \\trig.tr);

	sig=HPF.ar(GrayNoise.ar([0.5,0.7])*LFSaw.ar(f2env!2),fenv)*env;
	};
)" ], [ 3384.5013147, 'joach', "p.clock.tempo_(240/60);" ], [ 3376.8733003, 'alex', "(\"change the tempo to high\").postln;" ], [ 3376.7533001, 'alex', "(\"change the tempo to high\").postln;" ], [ 3376.6533, 'alex', "(\"change the tempo to high\").postln;" ], [ 3376.1032992, 'alex', "(\"change the tempo to high\").postln;" ], [ 3375.8832989, 'alex', "(\"change the tempo to high\").postln;" ], [ 3375.7732987, 'alex', "(\"change the tempo to high\").postln;" ], [ 3375.5532984, 'alex', "(\"change the tempo to high\").postln;" ], [ 3375.1132978, 'alex', "(\"change the tempo to high\").postln;" ], [ 3374.8932975, 'alex', "(\"change the tempo to high\").postln;" ], [ 3373.2582614, 'joach', "(
~saw8[5] = \\set -> QuantEnv(\\noise, 8)
.phase(1, [0,0.8,0], [0.05, 0.95], [2,-2], 0, 1)
.phase(2, [0,0.4,0], [0.35, 3.65], [2,-2], 0, 1)
.play([1,2]);
)" ], [ 3371.0722251, 'joach', "~saw8.set(\\lpf_freq, 400);" ], [ 3364.4011839, 'joach', "(
~saw8[7] = \\set -> QuantEnv(\\fplus, 1)
.phase(1, [0,-460,0], [0.005, 0.195], [2,-8], 0, 8)
.phase(2, [0,-1808,0], [0.015, 0.165], [8,-8], 0, 1)
.play([1,2]);
)" ], [ 3355.4441364, 'joach', "(
~saw8[8] = \\set -> QuantEnv(\\mulgverb, 4)
.phase(1, [0,1,0.2], [0.05, 0.95], [2,-2], 0, 4)
.phase(2, [0,1,0.5], [0.35, 0.65], [2,-2], 0, 1)
.play([1,2]);
)" ], [ 3353.6511337, 'alex', "(\"change the tempo to high\").postln;" ], [ 3352.5611322, 'alex', "(\"change the tempo to high\").postln;" ], [ 3350.9211299, 'kof', "~ssmp.clear;" ], [ 3348.9511271, 'alex', "(\"change the tempo\").postln;" ], [ 3347.6890923, 'joach', "(
~saw8[8] = \\set -> QuantEnv(\\mulgverb, 4)
.phase(1, [0,1,0.2], [0.05, 0.95], [2,-2], 0, 1)
.phase(2, [0,1,0.5], [0.35, 0.65], [2,-2], 0, 1)
.play([1,2]);
)" ], [ 3346.5490907, 'kof', "~kick.clear;" ], [ 3341.9290843, 'alex', "p.clock.tempo;" ], [ 3336.5350441, 'joach', "(
~saw8[8] = \\set -> QuantEnv(\\mulgverb, 4)
.phase(1, [0,1,0], [0.05, 0.95], [2,-2], 0, 1)
.phase(2, [0,1,0], [0.35, 0.65], [2,-2], 0, 1)
.play([1,2]);
)" ], [ 3334.7870412, 'alex', "~r.clear(fadeTime:2);" ], [ 3324.9699947, 'joach', "~saw8[3] = \\filter -> {|in| GVerb.ar(in, \\gverb_size.kr(6), \\gverb_time.kr(1.26), 0.9, mul:\\mulgverb.kr(1)) };" ], [ 3322.8759615, 'joach', "~saw8[3] = \\filter -> {|in| GVerb.ar(in, \\gverb_size.kr(6), \\gverb_time.kr(0.26), 0.9, mul:\\mulgverb.kr(1)) };" ], [ 3317.8449198, 'joach', "~saw8.play(vol: 0.4, fadeTime: 18);" ], [ 3309.0178897, 'alex', "~r.play(vol:0.12, fadeTime:2).quant_(16);" ], [ 3308.7828763, 'joach', "(
~saw8[1] = \\set -> QuantEnv(\\amp, 0.5)
.phase(1, [0,1,0.2], [0.05, 0.45], [2,-2], 0, 1)
.phase(2, [0,1,0], [0.05, 0.95], [2,-2], 0, 8)
.phase(3, [0,1,0.1,0.4,0], [0.15, 0.25, 0.1], [2,\\step, -2], 0, 1)
.play([1,2,1,3]);
)" ], [ 3303.5408644, 'alex', "~r[30]=\\filter-> {arg in; GVerb.ar(in,[60,40],[4,6],add:in)};" ], [ 3303.1808639, 'kof', "(
    ~ssmp.ar(2);
    ~ssmp.quant=2;
    ~ssmp.fadeTime=2.02;
    ~ssmp={
        var mod = [-1,0.25,-0.25,8,16]/8;
        var spread = 0.001;
        var pos = [0,0.5,0.25] + MouseX.kr(0,1);
        //         |       |       |       |       |  
        var pat = [1,0,0,0,1,1,0,0,1,0,0,0,1,1,0,0].rotate(1);
        var imp = PulseDivider.kr(~tick.kr,8*fib(8),~counter.kr);
        var hit = Select.kr(PulseCount.kr(imp)%pat.size,pat);
  var env = EnvGen.ar(Env([0.001,1,0.001],[1.002,0.5],[3,-3],curve:'exp'),imp * hit);
        var sig = PlayBuf.ar(b.numChannels,b.bufnum,BufRateScale.kr(b.bufnum)*mod+(env*0.01),imp, (pos + BrownNoise.ar(1!8).range(spread * -1,spread)) * BufFrames.kr(b.bufnum),1);
        
  sig = sig * env;
        Splay.ar(sig.flat,0.5,0.5);
    };
    ~ssmp.play;
);" ], [ 3302.0008622, 'alex', "~r[3]=\\set->Pbind(\\args, [\\top], \\dur, 16, \\top, 8 );" ], [ 3300.9048525, 'alex', "~r[2]=\\set->Pbind(\\args, [\\trig], \\dur, Pseq([Pn(0.5,4),8],inf), \\trig, 1);" ], [ 3300.4808283, 'joach', "(
~saw8[5] = \\set -> QuantEnv(\\noise, 8)
.phase(1, [0,0.8,0], [0.05, 0.95], [2,-2], 0, 1)
.phase(2, [0,0.4,0], [0.35, 3.65], [2,-2], 0, 1)
.play([1,2]);
)" ], [ 3299.9088262, 'alex', "~r[1]=\\set->Pbind(\\args, [\\freq], \\dur, 16, \\freq,Pseq([Pseq([65,45,47,42,32],4), Pn(65,4)],inf));" ], [ 3296.9388221, 'kof', "(
    ~ssmp.ar(2);
    ~ssmp.quant=2;
    ~ssmp.fadeTime=2.02;
    ~ssmp={
        var mod = [-1,0.25,-0.25,8,16]/8;
        var spread = 0.001;
        var pos = [0,0.5,0.25] + MouseX.kr(0,1);
        //         |       |       |       |       |  
        var pat = [1,0,0,0,1,1,0,0,1,0,0,0,1,1,0,0].rotate(1);
        var imp = PulseDivider.kr(~tick.kr,4*fib(8),~counter.kr);
        var hit = Select.kr(PulseCount.kr(imp)%pat.size,pat);
  var env = EnvGen.ar(Env([0.001,1,0.001],[0.002,0.5],[3,-3],curve:'exp'),imp * hit);
        var sig = PlayBuf.ar(b.numChannels,b.bufnum,BufRateScale.kr(b.bufnum)*mod+(env*0.01),imp, (pos + BrownNoise.ar(1!8).range(spread * -1,spread)) * BufFrames.kr(b.bufnum),1);
        
  sig = sig * env;
        Splay.ar(sig.flat,0.5,0.5);
    };
    ~ssmp.play;
);" ], [ 3296.5488215, 'alex', "(
~r[0]={
	var sig, env, fenv;

	env=EnvGen.kr(Env([0,1,0], [0.01,0.25], [\\welch, \\step]), \\trig.tr);
	fenv=EnvGen.kr(Env([\\freq.kr,\\freq.kr*\\top.kr(4),\\freq.kr], [0.01,0.04], \\welch), \\trig.tr);

	sig=SinOsc.ar(fenv!2,add:LPF.ar(GrayNoise.ar(0.7)*Decay.kr(Impulse.kr([12,16]),0.1),14700))*env;


};
)" ], [ 3293.6888175, 'alex', "~r.play(vol:0.12, fadeTime:2).quant_(16);" ], [ 3290.1488126, 'kof', "(
    ~ssmp.ar(2);
    ~ssmp.quant=2;
    ~ssmp.fadeTime=2.02;
    ~ssmp={
        var mod = [-1,0.25,-0.25,8,16]/4;
        var spread = 0.001;
        var pos = [0,0.5,0.25] + MouseX.kr(0,1);
        //         |       |       |       |       |  
        var pat = [1,0,0,0,1,1,0,0,1,0,0,0,1,1,0,0].rotate(1);
        var imp = PulseDivider.kr(~tick.kr,4*fib(8),~counter.kr);
        var hit = Select.kr(PulseCount.kr(imp)%pat.size,pat);
  var env = EnvGen.ar(Env([0.001,1,0.001],[0.002,0.5],[3,-3],curve:'exp'),imp * hit);
        var sig = PlayBuf.ar(b.numChannels,b.bufnum,BufRateScale.kr(b.bufnum)*mod+(env*0.01),imp, (pos + BrownNoise.ar(1!8).range(spread * -1,spread)) * BufFrames.kr(b.bufnum),1);
        
  sig = sig * env;
        Splay.ar(sig.flat,0.5,0.5);
    };
    ~ssmp.play;
);" ], [ 3287.0487748, 'joach', "~saw8.play(vol: 0.1, fadeTime: 18);" ], [ 3280.5697652, 'alex', "~h.clear(fadeTime:12);" ], [ 3275.6697583, 'kof', "~kick.clear;" ], [ 3275.1457289, 'joach', "(
~saw8[7] = \\set -> QuantEnv(\\fplus, 0.5)
.phase(1, [0,-460,0], [0.005, 0.195], [2,-8], 0, 8)
.phase(2, [0,-1808,0], [0.015, 0.165], [8,-8], 0, 1)
.play([1,2]);
)" ], [ 3271.88772, 'kof', "(
    ~ssmp.ar(2);
    ~ssmp.quant=2;
    ~ssmp.fadeTime=2.02;
    ~ssmp={
        var mod = [-1,0.25,-0.25,8,16];
        var spread = 0.001;
        var pos = [0,0.5,0.25] + MouseX.kr(0,1);
        //         |       |       |       |       |  
        var pat = [1,0,0,0,1,1,0,0,1,0,0,0,1,1,0,0].rotate(1);
        var imp = PulseDivider.kr(~tick.kr,4*fib(8),~counter.kr);
        var hit = Select.kr(PulseCount.kr(imp)%pat.size,pat);
  var env = EnvGen.ar(Env([0.001,1,0.001],[0.002,0.5],[3,-3],curve:'exp'),imp * hit);
        var sig = PlayBuf.ar(b.numChannels,b.bufnum,BufRateScale.kr(b.bufnum)*mod+(env*0.01),imp, (pos + BrownNoise.ar(1!8).range(spread * -1,spread)) * BufFrames.kr(b.bufnum),1);
        
  sig = sig * env;
        Splay.ar(sig.flat,0.5,0.5);
    };
    ~ssmp.play;
);" ], [ 3259.9877033, 'alex', "~h[30]=\\set->Pbind(\\args, [\\del], \\dur,4, \\del, Pseq([0.5,0.25,1],inf) );" ], [ 3256.1656979, 'kof', "(
    ~ssmp.ar(2);
    ~ssmp.quant=2;
    ~ssmp.fadeTime=2.02;
    ~ssmp={
        var mod = [-1,0.25,-0.25,8,16];
        var spread = 0.001;
        var pos = [0,0.5,0.25] + MouseX.kr(0,1);
        //         |       |       |       |       |  
        var pat = [1,0,0,0,1,1,0,0,1,0,0,0,1,1,0,0].rotate(1);
        var imp = PulseDivider.kr(~tick.kr,fib(8),~counter.kr);
        var hit = Select.kr(PulseCount.kr(imp)%pat.size,pat);
  var env = EnvGen.ar(Env([0.001,1,0.001],[0.002,0.5],[3,-3],curve:'exp'),imp * hit);
        var sig = PlayBuf.ar(b.numChannels,b.bufnum,BufRateScale.kr(b.bufnum)*mod+(env*0.01),imp, (pos + BrownNoise.ar(1!8).range(spread * -1,spread)) * BufFrames.kr(b.bufnum),1);
        
  sig = sig * env;
        Splay.ar(sig.flat,0.5,0.5);
    };
    ~ssmp.play;
);" ], [ 3248.7356875, 'alex', "~h[29]=\\filter-> {arg in; CombN.ar(in,4,\\del.kr(0.5),2)};" ], [ 3241.9556451, 'joach', "p.clock.tempo" ], [ 3241.5156444, 'alex', "~h[30]=\\set->Pbind(\\args, [\\del], \\dur, 2, \\del, Pseq([0.5,0.25,1],inf) );" ], [ 3238.2346069, 'joach', "~saw8.set(\\lpf_freq, 800);" ], [ 3237.1746054, 'kof', "(
    ~ssmp.ar(2);
    ~ssmp.quant=2;
    ~ssmp.fadeTime=2.02;
    ~ssmp={
        var mod = [-1,0.25,-0.25,8,16];
        var spread = 0.001;
        var pos = [0,0.5,0.25];
        //         |       |       |       |       |  
        var pat = [1,0,0,0,1,1,0,0,1,0,0,0,1,1,0,0].rotate(1);
        var imp = PulseDivider.kr(~tick.kr,fib(8),~counter.kr);
        var hit = Select.kr(PulseCount.kr(imp)%pat.size,pat);
  var env = EnvGen.ar(Env([0.001,1,0.001],[0.002,0.5],[3,-3],curve:'exp'),imp * hit);
        var sig = PlayBuf.ar(b.numChannels,b.bufnum,BufRateScale.kr(b.bufnum)*mod+(env*0.01),imp, (pos + BrownNoise.ar(1!8).range(spread * -1,spread)) * BufFrames.kr(b.bufnum),1);
        
  sig = sig * env;
        Splay.ar(sig.flat,0.5,0.5);
    };
    ~ssmp.play;
);" ], [ 3237.0246052, 'alex', "~h[30]=\\set->Pbind(\\args, [\\del], \\dur, 4, \\del, Pseq([0.5,0.25,1],inf) );" ], [ 3232.1845984, 'kof', "(
    ~ssmp.ar(2);
    ~ssmp.quant=2;
    ~ssmp.fadeTime=2.02;
    ~ssmp={
        var mod = [-1,0.25,-0.25,8,16];
        var spread = 0.001;
        var pos = [0,0.5,0.25];
        //         |       |       |       |       |  
        var pat = [1,0,0,0,1,1,0,0,1,0,0,0,1,1,0,0].rotate(1);
        var imp = PulseDivider.kr(~tick.kr,fib(8),~counter.kr);
        var hit = Select.kr(PulseCount.kr(imp)%pat.size,pat);
  var env = EnvGen.ar(Env([0.001,1,0.001],[0.002,0.25],[3,-3],curve:'exp'),imp * hit);
        var sig = PlayBuf.ar(b.numChannels,b.bufnum,BufRateScale.kr(b.bufnum)*mod+(env*0.01),imp, (pos + BrownNoise.ar(1!8).range(spread * -1,spread)) * BufFrames.kr(b.bufnum),1);
        
  sig = sig * env;
        Splay.ar(sig.flat,0.5,0.5);
    };
    ~ssmp.play;
);" ], [ 3224.774588, 'alex', "~h[31]=\\filter-> {arg in; GVerb.ar(in,[80,40],9,add:in)};" ], [ 3222.7145851, 'kof', "(
    ~ssmp.ar(2);
    ~ssmp.quant=2;
    ~ssmp.fadeTime=2.02;
    ~ssmp={
        var mod = [-1,0.25,-0.25,8,16];
        var spread = 0.01;
        var pos = [0,0.5,0.25];
        //         |       |       |       |       |  
        var pat = [1,0,0,0,1,1,0,0,1,0,0,0,1,1,0,0].rotate(1);
        var imp = PulseDivider.kr(~tick.kr,fib(8),~counter.kr);
        var hit = Select.kr(PulseCount.kr(imp)%pat.size,pat);
  var env = EnvGen.ar(Env([0.001,1,0.001],[0.002,0.25],[3,-3],curve:'exp'),imp * hit);
        var sig = PlayBuf.ar(b.numChannels,b.bufnum,BufRateScale.kr(b.bufnum)*mod+(env*0.01),imp, (pos + BrownNoise.ar(1!8).range(spread * -1,spread)) * BufFrames.kr(b.bufnum),1);
        
  sig = sig * env;
        Splay.ar(sig.flat,0.5,0.5);
    };
    ~ssmp.play;
);" ], [ 3221.864584, 'kof', "b = Buffer.read(s,Platform.resourceDir ++ \"/sounds/beat2.wav\");" ], [ 3215.6845753, 'alex', "~h.play(vol:0.7, fadeTime:2).quant_(2);" ], [ 3214.5375443, 'joach', "~saw8.stop(6);" ], [ 3209.2035332, 'alex', "~h[1]=\\set->Pbind(\\args, [\\freq], \\dur, 16, \\freq,Pseq([14000,9000,7000,2000,11000],inf));" ], [ 3195.7594852, 'joach', "~saw8.play(vol: 0.7, fadeTime: 1);" ], [ 3192.7024772, 'kof', "(
    ~ssmp.ar(2);
    ~ssmp.quant=2;
    ~ssmp.fadeTime=2.02;
    ~ssmp={
        var mod = [-1,0.25,-0.25,8,16];
        var spread = 0.01;
        var pos = [0,0.5,0.25];
        //         |       |       |       |       |  
        var pat = [1,0,0,0,1,1,0,0,1,0,0,0,1,1,0,0].rotate(1);
        var imp = PulseDivider.kr(~tick.kr,fib(8),~counter.kr);
        var hit = Select.kr(PulseCount.kr(imp)%pat.size,pat);
  var env = EnvGen.ar(Env([0.001,1,0.001],[0.002,0.25],[3,-3],curve:'exp'),imp * hit);
        var sig = PlayBuf.ar(b.numChannels,b.bufnum,BufRateScale.kr(b.bufnum)*mod+(env*0.01),imp, (pos + BrownNoise.ar(1!8).range(spread * -1,spread)) * BufFrames.kr(b.bufnum),1);
        
  sig = sig * env;
        Splay.ar(sig.flat,0.5,0.5);
    };
    ~ssmp.play;
);" ], [ 3188.6424715, 'alex', "~h[30]=\\set->Pbind(\\args, [\\del], \\dur, 4, \\del, Pseq([0.5,0.25,1],inf) );" ], [ 3187.8324704, 'kof', "(
    ~ssmp.ar(2);
    ~ssmp.quant=2;
    ~ssmp.fadeTime=2.02;
    ~ssmp={
        var mod = [-1,0.25,-0.25,8,16];
        var spread = 0.01;
        var pos = [0,0.5,0.25];
        //         |       |       |       |       |  
        var pat = [1,0,0,0,1,1,0,0,1,0,0,0,1,1,0,0].rotate(1);
        var imp = PulseDivider.kr(~tick.kr,2*fib(8),~counter.kr);
        var hit = Select.kr(PulseCount.kr(imp)%pat.size,pat);
  var env = EnvGen.ar(Env([0.001,1,0.001],[0.002,0.25],[3,-3],curve:'exp'),imp * hit);
        var sig = PlayBuf.ar(b.numChannels,b.bufnum,BufRateScale.kr(b.bufnum)*mod+(env*0.01),imp, (pos + BrownNoise.ar(1!8).range(spread * -1,spread)) * BufFrames.kr(b.bufnum),1);
        
  sig = sig * env;
        Splay.ar(sig.flat,0.5,0.5);
    };
    ~ssmp.play;
);" ], [ 3183.992465, 'kof', "(
    ~ssmp.ar(2);
    ~ssmp.quant=2;
    ~ssmp.fadeTime=2.02;
    ~ssmp={
        var mod = [-1,0.25,-0.25,8,16];
        var spread = 0.0;
        var pos = [0,0.5,0.25];
        //         |       |       |       |       |  
        var pat = [1,0,0,0,1,1,0,0,1,0,0,0,1,1,0,0].rotate(1);
        var imp = PulseDivider.kr(~tick.kr,2*fib(8),~counter.kr);
        var hit = Select.kr(PulseCount.kr(imp)%pat.size,pat);
  var env = EnvGen.ar(Env([0.001,1,0.001],[0.002,0.25],[3,-3],curve:'exp'),imp * hit);
        var sig = PlayBuf.ar(b.numChannels,b.bufnum,BufRateScale.kr(b.bufnum)*mod+(env*0.01),imp, (pos + BrownNoise.ar(1!8).range(spread * -1,spread)) * BufFrames.kr(b.bufnum),1);
        
  sig = sig * env;
        Splay.ar(sig.flat,0.5,0.5);
    };
    ~ssmp.play;
);" ], [ 3179.2814583, 'kof', "(
    ~ssmp.ar(2);
    ~ssmp.quant=2;
    ~ssmp.fadeTime=2.02;
    ~ssmp={
        var mod = [-1,0.25,-0.25,8,16];
        var spread = 0.0;
        var pos = [0,0.5,0.25]+0.4;
        //         |       |       |       |       |  
        var pat = [1,0,0,0,1,1,0,0,1,0,0,0,1,1,0,0].rotate(1);
        var imp = PulseDivider.kr(~tick.kr,2*fib(8),~counter.kr);
        var hit = Select.kr(PulseCount.kr(imp)%pat.size,pat);
  var env = EnvGen.ar(Env([0.001,1,0.001],[0.002,0.25],[3,-3],curve:'exp'),imp * hit);
        var sig = PlayBuf.ar(b.numChannels,b.bufnum,BufRateScale.kr(b.bufnum)*mod+(env*0.01),imp, (pos + BrownNoise.ar(1!8).range(spread * -1,spread)) * BufFrames.kr(b.bufnum),1);
        
  sig = sig * env;
        Splay.ar(sig.flat,0.5,0.5);
    };
    ~ssmp.play;
);" ], [ 3175.0814524, 'alex', "~h[31]=\\filter-> {arg in; GVerb.ar(in,[80,40],8,add:in)};" ], [ 3167.631442, 'alex', "~h.play(vol:1, fadeTime:2).quant_(2);" ], [ 3156.3353963, 'joach', "~saw8.stop(16);" ], [ 3152.8393883, 'kof', "(
    ~ssmp.ar(2);
    ~ssmp.quant=2;
    ~ssmp.fadeTime=2.02;
    ~ssmp={
        var mod = [-1,0.25,-0.25,8,16];
        var spread = 0.0;
        var pos = [0,0.5,0.25]+0.4;
        //         |       |       |       |       |  
        var pat = [1,0,0,0,1,0,0,0,1,0,0,0,1,0,0,0].rotate(1);
        var imp = PulseDivider.kr(~tick.kr,2*fib(8),~counter.kr);
        var hit = Select.kr(PulseCount.kr(imp)%pat.size,pat);
  var env = EnvGen.ar(Env([0.001,1,0.001],[0.002,0.25],[3,-3],curve:'exp'),imp * hit);
        var sig = PlayBuf.ar(b.numChannels,b.bufnum,BufRateScale.kr(b.bufnum)*mod+(env*0.01),imp, (pos + BrownNoise.ar(1!8).range(spread * -1,spread)) * BufFrames.kr(b.bufnum),1);
        
  sig = sig * env;
        Splay.ar(sig.flat,0.5,0.5);
    };
    ~ssmp.play;
);" ], [ 3149.5893837, 'alex', "~h[30]=\\set->Pbind(\\args, [\\del], \\dur, 2, \\del, Pseq([0.5,0.25,1],inf) );" ], [ 3147.8183511, 'joach', "(
~saw8[1] = \\set -> QuantEnv(\\amp, 0.5)
.phase(1, [0,1,0.2], [0.05, 0.45], [2,-2], 0, 8)
.phase(2, [0,1,0], [0.05, 0.95], [2,-2], 0, 4)
.phase(3, [0,1,0.1,0.4,0], [0.15, 0.25, 0.1], [2,\\step, -2], 0, 1)
.play([1,2,1,3]);
)" ], [ 3147.647348, 'kof', "(
    ~ssmp.ar(2);
    ~ssmp.quant=2;
    ~ssmp.fadeTime=2.02;
    ~ssmp={
        var mod = [-1,0.25,-0.25,8,16];
        var spread = 0.0;
        var pos = [0,0.5,0.25]+0.1;
        //         |       |       |       |       |  
        var pat = [1,0,0,0,1,0,0,0,1,0,0,0,1,0,0,0].rotate(1);
        var imp = PulseDivider.kr(~tick.kr,2*fib(8),~counter.kr);
        var hit = Select.kr(PulseCount.kr(imp)%pat.size,pat);
  var env = EnvGen.ar(Env([0.001,1,0.001],[0.002,0.25],[3,-3],curve:'exp'),imp * hit);
        var sig = PlayBuf.ar(b.numChannels,b.bufnum,BufRateScale.kr(b.bufnum)*mod+(env*0.01),imp, (pos + BrownNoise.ar(1!8).range(spread * -1,spread)) * BufFrames.kr(b.bufnum),1);
        
  sig = sig * env;
        Splay.ar(sig.flat,0.5,0.5);
    };
    ~ssmp.play;
);" ], [ 3140.1743083, 'joach', "(
~saw8[1] = \\set -> QuantEnv(\\amp, 1)
.phase(1, [0,1,0.2], [0.05, 0.45], [2,-2], 0, 8)
.phase(2, [0,1,0], [0.05, 0.95], [2,-2], 0, 4)
.phase(3, [0,1,0.1,0.4,0], [0.15, 0.25, 0.1], [2,\\step, -2], 0, 1)
.play([1,2,1,3]);
)" ], [ 3140.0243042, 'alex', "~h[29]=\\filter-> {arg in; CombN.ar(in,4,\\del.kr(0.5),4)};" ], [ 3129.3602561, 'joach', "(
~saw8[1] = \\set -> QuantEnv(\\amp, 0.5)
.phase(1, [0,1,0.2], [0.05, 0.45], [2,-2], 0, 8)
.phase(2, [0,1,0], [0.05, 0.95], [2,-2], 0, 4)
.phase(3, [0,1,0.1,0.4,0], [0.15, 0.25, 0.1], [2,\\step, -2], 0, 1)
.play([1,2,1,3]);
)" ], [ 3124.9962208, 'joach', "(
~saw8[1] = \\set -> QuantEnv(\\amp, 1)
.phase(1, [0,1,0.2], [0.05, 0.45], [2,-2], 0, 8)
.phase(2, [0,1,0], [0.05, 0.95], [2,-2], 0, 4)
.phase(3, [0,1,0.1,0.4,0], [0.15, 0.25, 0.1], [2,\\step, -2], 0, 1)
.play([1,2,1,3]);
)" ], [ 3124.8772168, 'alex', "~h.play(vol:0.7, fadeTime:2).quant_(2);" ], [ 3118.6572081, 'alex', "~h[29]=\\filter-> {arg in; CombN.ar(in,4,\\del.kr(0.5),2)};" ], [ 3113.3651989, 'alex', "~h[30]=\\set->Pbind(\\args, [\\del], \\dur, Pseq([4,1,5],inf), \\del, Pseq([0.5,0.25,1],inf) );" ], [ 3112.878171, 'joach', "(
~saw8[7] = \\set -> QuantEnv(\\fplus, 2)
.phase(1, [0,460,0], [0.005, 0.195], [2,-8], 0, 8)
.phase(2, [0,1808,0], [0.015, 0.165], [8,-8], 0, 1)
.play([1,2]);
)" ], [ 3106.1071263, 'joach', "(
~saw8[5] = \\set -> QuantEnv(\\noise, 1)
.phase(1, [0,0.8,0], [0.05, 0.95], [2,-2], 0, 1)
.phase(2, [0,0.4,0], [0.35, 3.65], [2,-2], 0, 1)
.play([1,2]);
)" ], [ 3104.139093, 'joach', "~saw8.set(\\lpf_freq, 4800);" ], [ 3099.7800825, 'kof', "(
    ~ssmp.ar(2);
    ~ssmp.quant=2;
    ~ssmp.fadeTime=2.02;
    ~ssmp={
        var mod = [-1,0.25,-0.25,8,16];
        var spread = 0.0;
        var pos = [0,0.5,0.25]+0.1;
        //         |       |       |       |       |  
        var pat = [1,0,0,0,1,0,0,0,1,0,0,0,1,0,0,0].rotate(1);
        var imp = PulseDivider.kr(~tick.kr,4*fib(8),~counter.kr);
        var hit = Select.kr(PulseCount.kr(imp)%pat.size,pat);
  var env = EnvGen.ar(Env([0.001,1,0.001],[0.002,0.25],[3,-3],curve:'exp'),imp * hit);
        var sig = PlayBuf.ar(b.numChannels,b.bufnum,BufRateScale.kr(b.bufnum)*mod+(env*0.01),imp, (pos + BrownNoise.ar(1!8).range(spread * -1,spread)) * BufFrames.kr(b.bufnum),1);
        
  sig = sig * env;
        Splay.ar(sig.flat,0.5,0.5);
    };
    ~ssmp.play;
);" ], [ 3098.3480474, 'joach', "(
~saw8[4] = \\set -> QuantEnv(\\freq, 16)
.phase(1, [800,816,800], [0.5, 0.25], [\\sin,\\sin], 0, 2)
.phase(2, [780,786,780], [0.25, 0.25], [2,-2], 0, 1)
.play([1,2]);
)" ], [ 3092.7080395, 'kof', "(
    ~ssmp.ar(2);
    ~ssmp.quant=2;
    ~ssmp.fadeTime=2.02;
    ~ssmp={
        var mod = [-1,0.25,-0.25,8,16];
        var spread = 0.0;
        var pos = [0,0.5,0.25]+0.1;
        //         |       |       |       |       |  
        var pat = [1,0,0,0,1,0,0,0,1,0,0,0,1,0,0,0].rotate(1);
        var imp = PulseDivider.kr(~tick.kr,4*fib(8),~counter.kr);
        var hit = Select.kr(PulseCount.kr(imp)%pat.size,pat);
  var env = EnvGen.ar(Env([0.001,1,0.001],[0.002,0.15],[3,-3],curve:'exp'),imp * hit);
        var sig = PlayBuf.ar(b.numChannels,b.bufnum,BufRateScale.kr(b.bufnum)*mod+(env*0.01),imp, (pos + BrownNoise.ar(1!8).range(spread * -1,spread)) * BufFrames.kr(b.bufnum),1);
        
  sig = sig * env;
        Splay.ar(sig.flat,0.5,0.5);
    };
    ~ssmp.play;
);" ], [ 3081.617024, 'kof', "(
    ~ssmp.ar(2);
    ~ssmp.quant=2;
    ~ssmp.fadeTime=2.02;
    ~ssmp={
        var mod = [-1,0.25,-0.25,8,16];
        var spread = 0.0;
        var pos = [0,0.5,0.25];
        //         |       |       |       |       |  
        var pat = [1,0,0,0,1,0,0,0,1,0,0,0,1,0,0,0].rotate(1);
        var imp = PulseDivider.kr(~tick.kr,4*fib(8),~counter.kr);
        var hit = Select.kr(PulseCount.kr(imp)%pat.size,pat);
  var env = EnvGen.ar(Env([0.001,1,0.001],[0.002,0.15],[3,-3],curve:'exp'),imp * hit);
        var sig = PlayBuf.ar(b.numChannels,b.bufnum,BufRateScale.kr(b.bufnum)*mod+(env*0.01),imp, (pos + BrownNoise.ar(1!8).range(spread * -1,spread)) * BufFrames.kr(b.bufnum),1);
        
  sig = sig * env;
        Splay.ar(sig.flat,0.5,0.5);
    };
    ~ssmp.play;
);" ], [ 3059.1929689, 'kof', "(
    ~ssmp.ar(2);
    ~ssmp.quant=2;
    ~ssmp.fadeTime=2.02;
    ~ssmp={
        var mod = [-1,0.25,-0.25,1/8,16];
        var spread = 0.0;
        var pos = [0,0.5];
        //         |       |       |       |       |  
        var pat = [1,0,0,0,1,0,0,0,1,0,0,0,1,0,0,0].rotate(1);
        var imp = PulseDivider.kr(~tick.kr,4*fib(8),~counter.kr);
        var hit = Select.kr(PulseCount.kr(imp)%pat.size,pat);
  var env = EnvGen.ar(Env([0.001,1,0.001],[0.002,0.15],[3,-3],curve:'exp'),imp * hit);
        var sig = PlayBuf.ar(b.numChannels,b.bufnum,BufRateScale.kr(b.bufnum)*mod+(env*0.01),imp, (pos + BrownNoise.ar(1!8).range(spread * -1,spread)) * BufFrames.kr(b.bufnum),1);
        
  sig = sig * env;
        Splay.ar(sig.flat,0.5,0.5);
    };
    ~ssmp.play;
);" ], [ 3059.03696, 'joach', "~saw8.play(vol: 0.5, fadeTime: 8);" ], [ 3054.2389205, 'joach', "(
~saw8[5] = \\set -> QuantEnv(\\noise, 1)
.phase(1, [0,0.8,0], [0.05, 0.95], [2,-2], 0, 1)
.phase(2, [0,0.4,0], [0.35, 3.65], [2,-2], 0, 1)
.play([1,2]);
)" ], [ 3051.0729151, 'kof', "(
    ~ssmp.ar(2);
    ~ssmp.quant=2;
    ~ssmp.fadeTime=2.02;
    ~ssmp={
        var mod = [-1,0.25,-0.25,1/8,1/16];
        var spread = 0.0;
        var pos = [0,0.5];
        //         |       |       |       |       |  
        var pat = [1,0,0,0,1,0,0,0,1,0,0,0,1,0,0,0].rotate(1);
        var imp = PulseDivider.kr(~tick.kr,4*fib(8),~counter.kr);
        var hit = Select.kr(PulseCount.kr(imp)%pat.size,pat);
  var env = EnvGen.ar(Env([0.001,1,0.001],[0.002,0.15],[3,-3],curve:'exp'),imp * hit);
        var sig = PlayBuf.ar(b.numChannels,b.bufnum,BufRateScale.kr(b.bufnum)*mod+(env*0.01),imp, (pos + BrownNoise.ar(1!8).range(spread * -1,spread)) * BufFrames.kr(b.bufnum),1);
        
  sig = sig * env;
        Splay.ar(sig.flat,0.5,0.5);
    };
    ~ssmp.play;
);" ], [ 3049.3929128, 'alex', "~h[29]=\\filter-> {arg in; CombN.ar(in,4,0.5,2)};" ], [ 3048.5608786, 'joach', "(
~saw8[5] = \\set -> QuantEnv(\\noise, 0.5)
.phase(1, [0,0.8,0], [0.05, 2.95], [2,-2], 0, 1)
.phase(2, [0,0.4,0], [0.35, 3.65], [2,-2], 0, 1)
.play([1,2]);
)" ], [ 3044.1208724, 'alex', "~c[29]=\\filter-> {arg in; CombN.ar(in,4,0.5,2)};" ], [ 3040.8478498, 'alex', "~c[29]=\\filter-> {arg in; CombN.ar(in,4,0.5,4)};" ], [ 3040.5878349, 'joach', "~saw8.set(\\lpf_freq, 800);" ], [ 3033.9598252, 'kof', "(
    ~ssmp.ar(2);
    ~ssmp.quant=2;
    ~ssmp.fadeTime=2.02;
    ~ssmp={
        var mod = [-1,0.25,-0.25,1/8,1/16];
        var spread = 0.0;
        var pos = [0,0.5];
        //         |       |       |       |       |  
        var pat = [1,0,0,0,1,0,0,0,1,0,0,0,1,0,0,0].rotate(1);
        var imp = PulseDivider.kr(~tick.kr,8*fib(8),~counter.kr);
        var hit = Select.kr(PulseCount.kr(imp)%pat.size,pat);
  var env = EnvGen.ar(Env([0.001,1,0.001],[0.002,0.15],[3,-3],curve:'exp'),imp * hit);
        var sig = PlayBuf.ar(b.numChannels,b.bufnum,BufRateScale.kr(b.bufnum)*mod+(env*0.01),imp, (pos + BrownNoise.ar(1!8).range(spread * -1,spread)) * BufFrames.kr(b.bufnum),1);
        
  sig = sig * env;
        Splay.ar(sig.flat,0.5,0.5);
    };
    ~ssmp.play;
);" ], [ 3028.3557853, 'joach', "(
~saw8[4] = \\set -> QuantEnv(\\freq, 16)
.phase(1, [800,816,800], [0.5, 0.25], [\\sin,\\sin], 0, 4)
.phase(2, [170,176,170], [0.25, 0.25], [2,-2], 0, 1)
.play([1,2]);
)" ], [ 3022.6757433, 'joach', "(
~saw8[4] = \\set -> QuantEnv(\\freq, 16)
.phase(1, [800,806,800], [0.5, 0.25], [\\sin,\\sin], 0, 4)
.phase(2, [170,176,170], [0.25, 0.25], [2,-2], 0, 1)
.play([1,2]);
)" ], [ 3020.2757399, 'kof', "(
    ~ssmp.ar(2);
    ~ssmp.quant=2;
    ~ssmp.fadeTime=2.02;
    ~ssmp={
        var mod = [-1,0.25,-0.25,1/8,1/16];
        var spread = 0.0;
        var pos = [0,0.5];
        //         |       |       |       |       |  
        var pat = [1,0,0,0,1,0,0,0,1,0,0,0,1,0,0,0].rotate(1);
        var imp = PulseDivider.kr(~tick.kr,32*fib(8),~counter.kr);
        var hit = Select.kr(PulseCount.kr(imp)%pat.size,pat);
  var env = EnvGen.ar(Env([0.001,1,0.001],[0.002,0.15],[3,-3],curve:'exp'),imp * hit);
        var sig = PlayBuf.ar(b.numChannels,b.bufnum,BufRateScale.kr(b.bufnum)*mod+(env*0.01),imp, (pos + BrownNoise.ar(1!8).range(spread * -1,spread)) * BufFrames.kr(b.bufnum),1);
        
  sig = sig * env;
        Splay.ar(sig.flat,0.5,0.5);
    };
    ~ssmp.play;
);" ], [ 3009.664725, 'alex', "~h.play(vol:0.2, fadeTime:2).quant_(2);" ], [ 3009.3747246, 'kof', "b = Buffer.read(s,Platform.resourceDir ++ \"/sounds/beat.wav\");" ], [ 3007.1547215, 'alex', "~h[30]=\\filter-> {arg in; GVerb.ar(in,[20,40],8,add:in)};" ], [ 3004.8676872, 'joach', "(
~saw8[0] = {
var osc = SinOsc.ar(( \\freq.kr(800) + \\fplus.kr(0) ), mul: 1, add: 0);
var noise = BrownNoise.ar(\\noise.kr(0), (1 - \\noise.kr(0)));
var sig = osc * noise;
Pan2.ar( sig * \\amp.kr(0), \\pan.kr(0) );
};
)" ], [ 3003.6336825, 'alex', "~h[3]=\\set->Pbind(\\args, [\\top], \\dur, 4, \\top, 3 );" ], [ 3002.4136808, 'alex', "~h[2]=\\set->Pbind(\\args, [\\trig], \\dur, 4, \\trig, 1);" ], [ 3000.8286487, 'joach', "(
~saw8[0] = {
var osc = SinOsc.ar(( \\freq.kr(880) + \\fplus.kr(0) ), mul: 1, add: 0);
var noise = BrownNoise.ar(\\noise.kr(0), (1 - \\noise.kr(0)));
var sig = osc * noise;
Pan2.ar( sig * \\amp.kr(0), \\pan.kr(0) );
};
)" ], [ 3000.2296446, 'alex', "~h[1]=\\set->Pbind(\\args, [\\freq], \\dur, 16, \\freq,Pseq([14000,9000,7000,11000],inf));" ], [ 2995.5806052, 'joach', "~saw8.set(\\lpf_freq, 4800);" ], [ 2992.8976013, 'alex', "(

~h[0]={
	var sig, env, fenv;

	env=EnvGen.kr(Env([0,1,0], [0.01,0.15], [\\welch, \\step]), \\trig.tr);
	fenv=EnvGen.kr(Env([\\freq.kr,\\freq.kr*\\top.kr(4),\\freq.kr], [0.01,0.04], \\welch), \\trig.tr);

	sig=HPF.ar(ClipNoise.ar([0.7,0.9]),\\freq.kr)*env;


};
)" ], [ 2990.5375651, 'joach', "(
~saw8[5] = \\set -> QuantEnv(\\noise, 4)
.phase(1, [0,0.8,0], [0.05, 2.95], [2,-2], 0, 1)
.phase(2, [0,0.4,0], [0.35, 3.65], [2,-2], 0, 1)
.play([1,2]);
)" ], [ 2986.7145266, 'joach', "(
~saw8[5] = \\set -> QuantEnv(\\noise, 4)
.phase(1, [0,0.8,0], [0.05, 2.95], [2,-2], 0, 1)
.phase(2, [0,0.4,0], [7.35, 0.65], [2,-2], 0, 1)
.play([1,2]);
)" ], [ 2983.0074903, 'joach', "(
~saw8[5] = \\set -> QuantEnv(\\noise, 16)
.phase(1, [0,0.8,0], [0.05, 2.95], [2,-2], 0, 1)
.phase(2, [0,0.4,0], [7.35, 0.65], [2,-2], 0, 1)
.play([1,2]);
)" ], [ 2971.6154626, 'kof', "~bb.clear;" ], [ 2971.2074392, 'joach', "(
~saw8[5] = \\set -> QuantEnv(\\noise, 16)
.phase(1, [0,0.8,0], [6.05, 2.95], [2,-2], 0, 1)
.phase(2, [0,0.4,0], [7.35, 0.65], [2,-2], 0, 1)
.play([1,2]);
)" ], [ 2967.8104341, 'kof', "~ff.clear;" ], [ 2966.0764013, 'joach', "(
~saw8[7] = \\set -> QuantEnv(\\fplus, 0.25)
.phase(1, [0,460,0], [0.005, 0.195], [2,-8], 0, 8)
.phase(2, [0,1808,0], [0.015, 0.165], [8,-8], 0, 1)
.play([1,2]);
)" ], [ 2961.3423911, 'kof', "~ff.stop(7);" ], [ 2957.1723853, 'kof', "~first.stop(7);" ], [ 2954.2673519, 'joach', "~saw8.set(\\lpf_freq, 1800);" ], [ 2949.6123418, 'kof', "(
    ~first.ar(2);
    ~first.quant=4;
    ~first.fadeTime=2.2;
    ~first={
        //         |       |       |       |       |  
        var pat = [1,0,0,0,1,0,0,0,1,0,0,0,1,1,1,1].rotate(3);
        var imp = PulseDivider.kr(~tick.kr,8*fib(4),~counter.kr);
        var hit = Select.kr(PulseCount.kr(imp)%pat.size,pat);
        var env = EnvGen.ar(Env([0.0001,1,0.0001],[1.002,0.5],[3,-3],curve:'exp'),imp * hit);
        var sig = Mix.ar(SinOsc.ar(15000/[1,2,4,8],SinOsc.ar(50/1.25).range(-pi,pi)));
        sig = sig * env;
        Splay.ar(sig,0.75,0.15);
    };
    ~first.play;
);" ], [ 2947.4923388, 'alex', "p.clock.tempo;" ], [ 2946.4113049, 'joach', "(
~saw8[1] = \\set -> QuantEnv(\\amp, 0.5)
.phase(1, [0,1,0.2], [0.05, 0.45], [2,-2], 0, 8)
.phase(2, [0,1,0], [0.05, 0.95], [2,-2], 0, 4)
.phase(3, [0,1,0.1,0.4,0], [0.15, 0.25, 0.1], [2,\\step, -2], 0, 1)
.play([1,2,1,3]);
)" ], [ 2946.2903041, 'alex', "p.clock.tempo;" ], [ 2944.8762734, 'joach', "~saw8.play(vol: 0.3, fadeTime: 8);" ], [ 2937.7692296, 'joach', "(
~saw8[0] = {
var osc = SinOsc.ar(( \\freq.kr(800) + \\fplus.kr(0) ), mul: 1, add: 0);
var noise = BrownNoise.ar(\\noise.kr(0), (1 - \\noise.kr(0)));
var sig = osc * noise;
Pan2.ar( sig * \\amp.kr(0), \\pan.kr(0) );
};
)" ], [ 2936.2361955, 'joach', "~saw8.play(vol: 0.1, fadeTime: 8);" ], [ 2930.1371825, 'kof', "(
    ~first.ar(2);
    ~first.quant=4;
    ~first.fadeTime=2.2;
    ~first={
        //         |       |       |       |       |  
        var pat = [1,0,0,0,1,0,0,0,1,0,0,0,1,1,1,1].rotate(3);
        var imp = PulseDivider.kr(~tick.kr,8*fib(4),~counter.kr);
        var hit = Select.kr(PulseCount.kr(imp)%pat.size,pat);
        var env = EnvGen.ar(Env([0.0001,1,0.0001],[1.002,0.5],[3,-3],curve:'exp'),imp * hit);
        var sig = Mix.ar(SinOsc.ar(15000/[1,2,4,8],SinOsc.ar(50/1.5).range(-pi,pi)));
        sig = sig * env;
        Splay.ar(sig,0.75,0.15);
    };
    ~first.play;
);" ], [ 2928.1611476, 'joach', "(
~saw8[0] = {
var osc = SinOsc.ar(( \\freq.kr(800) + \\fplus.kr(0) ), mul: 1, add: 0);
var noise = BrownNoise.ar(\\noise.kr(0), (1 - \\noise.kr(0)));
var sig = osc * noise;
Pan2.ar( sig * \\amp.kr(0), \\pan.kr(0) );
};
)" ], [ 2915.0081274, 'kof', "(
    ~first.ar(2);
    ~first.quant=4;
    ~first.fadeTime=2.2;
    ~first={
        //         |       |       |       |       |  
        var pat = [1,0,0,0,1,0,0,0,1,0,0,0,1,1,1,1].rotate(3);
        var imp = PulseDivider.kr(~tick.kr,8*fib(4),~counter.kr);
        var hit = Select.kr(PulseCount.kr(imp)%pat.size,pat);
        var env = EnvGen.ar(Env([0.001,1,0.001],[0.002,0.5],[3,-3],curve:'exp'),imp * hit);
        var sig = Mix.ar(SinOsc.ar(15000/[1,2,4,8],SinOsc.ar(50/1.5).range(-pi,pi)));
        sig = sig * env;
        Splay.ar(sig,0.75,0.15);
    };
    ~first.play;
);" ], [ 2912.7580935, 'joach', "~saw8.stop(1);" ], [ 2904.3170794, 'kof', "(
    ~first.ar(2);
    ~first.quant=4;
    ~first.fadeTime=2.2;
    ~first={
        //         |       |       |       |       |  
        var pat = [1,0,0,0,1,0,0,0,1,0,0,0,1,1,1,1].rotate(3);
        var imp = PulseDivider.kr(~tick.kr,8*fib(4),~counter.kr);
        var hit = Select.kr(PulseCount.kr(imp)%pat.size,pat);
        var env = EnvGen.ar(Env([0.001,1,0.001],[0.002,0.5],[3,-3],curve:'exp'),imp * hit);
        var sig = Mix.ar(SinOsc.ar(15000/[1,2,4,8],SinOsc.ar(50/4).range(-pi,pi)));
        sig = sig * env;
        Splay.ar(sig,0.75,0.15);
    };
    ~first.play;
);" ], [ 2901.6600714, 'kof', "(
    ~first.ar(2);
    ~first.quant=4;
    ~first.fadeTime=2.2;
    ~first={
        //         |       |       |       |       |  
        var pat = [1,0,0,0,1,0,0,0,1,0,0,0,1,1,1,1].rotate(3);
        var imp = PulseDivider.kr(~tick.kr,8*fib(4),~counter.kr);
        var hit = Select.kr(PulseCount.kr(imp)%pat.size,pat);
        var env = EnvGen.ar(Env([0.001,1,0.001],[0.002,0.5],[3,-3],curve:'exp'),imp * hit);
        var sig = Mix.ar(SinOsc.ar(15000/[1,2,4,8],SinOsc.ar(50).range(-pi,pi)));
        sig = sig * env;
        Splay.ar(sig,0.75,0.15);
    };
    ~first.play;
);" ], [ 2901.1790439, 'joach', "~saw8.stop(1);" ], [ 2897.8770375, 'kof', "(
    ~first.ar(2);
    ~first.quant=4;
    ~first.fadeTime=2.2;
    ~first={
        //         |       |       |       |       |  
        var pat = [1,0,0,0,1,0,0,0,1,0,0,0,1,1,1,1].rotate(3);
        var imp = PulseDivider.kr(~tick.kr,8*fib(4),~counter.kr);
        var hit = Select.kr(PulseCount.kr(imp)%pat.size,pat);
        var env = EnvGen.ar(Env([0.001,1,0.001],[0.002,0.5],[3,-3],curve:'exp'),imp * hit);
        var sig = Mix.ar(SinOsc.ar(15000/[1,2,4,8],SinOsc.ar(500).range(-pi,pi)));
        sig = sig * env;
        Splay.ar(sig,0.75,0.15);
    };
    ~first.play;
);" ], [ 2878.5739774, 'joach', "(
~saw8[1] = \\set -> QuantEnv(\\amp, 0.5)
.phase(1, [0,1,0.2], [0.05, 0.45], [2,-2], 0, 8)
.phase(2, [0,1,0], [0.05, 0.95], [2,-2], 0, 4)
.phase(3, [0,1,0.1,0.4,0], [0.15, 0.25, 0.1], [2,\\step, -2], 0, 1)
.play([1,2,1,3]);
)" ], [ 2875.7339734, 'kof', "(
    ~first.ar(2);
    ~first.quant=4;
    ~first.fadeTime=2.2;
    ~first={
        //         |       |       |       |       |  
        var pat = [1,0,0,0,1,0,0,0,1,0,0,0,1,1,1,1].rotate(3);
        var imp = PulseDivider.kr(~tick.kr,8*fib(4),~counter.kr);
        var hit = Select.kr(PulseCount.kr(imp)%pat.size,pat);
        var env = EnvGen.ar(Env([0.001,1,0.001],[0.002,0.5],[3,-3],curve:'exp'),imp * hit);
        var sig = Mix.ar(SinOsc.ar(15000/[1,2,4,8],SinOsc.ar(50).range(-pi,pi)));
        sig = sig * env;
        Splay.ar(sig,0.75,0.15);
    };
    ~first.play;
);" ], [ 2873.2239699, 'kof', "(
    ~first.ar(2);
    ~first.quant=4;
    ~first.fadeTime=2.2;
    ~first={
        //         |       |       |       |       |  
        var pat = [1,0,0,0,1,0,0,0,1,0,0,0,1,1,1,1].rotate(3);
        var imp = PulseDivider.kr(~tick.kr,8*fib(4),~counter.kr);
        var hit = Select.kr(PulseCount.kr(imp)%pat.size,pat);
        var env = EnvGen.ar(Env([0.001,1,0.001],[0.002,0.15],[3,-3],curve:'exp'),imp * hit);
        var sig = Mix.ar(SinOsc.ar(15000/[1,2,4,8],SinOsc.ar(50).range(-pi,pi)));
        sig = sig * env;
        Splay.ar(sig,0.75,0.15);
    };
    ~first.play;
);" ], [ 2862.1839544, 'kof', "(
    ~first.ar(2);
    ~first.quant=4;
    ~first.fadeTime=2.2;
    ~first={
        //         |       |       |       |       |  
        var pat = [1,0,0,0,1,0,0,0,1,0,0,0,1,1,1,1].rotate(3);
        var imp = PulseDivider.kr(~tick.kr,4*fib(4),~counter.kr);
        var hit = Select.kr(PulseCount.kr(imp)%pat.size,pat);
        var env = EnvGen.ar(Env([0.001,1,0.001],[0.002,0.15],[3,-3],curve:'exp'),imp * hit);
        var sig = Mix.ar(SinOsc.ar(15000/[1,2,4,8],SinOsc.ar(50).range(-pi,pi)));
        sig = sig * env;
        Splay.ar(sig,0.75,0.15);
    };
    ~first.play;
);" ], [ 2858.1569183, 'joach', "(
~saw8[8] = \\set -> QuantEnv(\\mulgverb, 1)
.phase(1, [0,1,0], [0.05, 0.95], [2,-2], 0, 1)
.phase(2, [0,1,0], [0.35, 0.65], [2,-2], 0, 1)
.play([1,2]);
)" ], [ 2850.3429049, 'kof', "(
    ~ff.quant=1;
    ~ff.fadeTime=1;
    ~ff={
        var high,mid,low;
        var sig = ~first;

        sig = GVerb.ar(LPF.ar(sig,5000)+HPF.ar(sig,500),40,[3,4,5,6],spread:[40,90])/8 + sig;
        low = CompanderD.ar(LPF.ar(sig,400),3/4,1/3,1/2);
        mid = CompanderD.ar(BPF.ar(sig,600,2),3/4,1/2,1/2);
        high = CompanderD.ar(HPF.ar(sig,900),3/4,1/2,1/2);
        sig = CompanderD.ar((high+mid+low).flat,3/4,1/1.1,1/1.1);
        Splay.ar(sig,0.75,0.25);
    };
    ~ff.play;
);" ], [ 2838.2828567, 'joach', "~saw8.set(\\lpf_freq, 4800);" ], [ 2823.7578043, 'joach', "(
~saw8[7] = \\set -> QuantEnv(\\fplus, 0.5)
.phase(1, [0,460,0], [0.005, 0.195], [2,-8], 0, 8)
.phase(2, [0,1808,0], [0.015, 0.165], [8,-8], 0, 1)
.play([1,2]);
)" ], [ 2823.2308009, 'kof', "(
    ~first.ar(2);
    ~first.quant=4;
    ~first.fadeTime=2.2;
    ~first={
        //         |       |       |       |       |  
        var pat = [1,0,0,0,1,0,0,0,1,0,0,0,1,1,1,1].rotate(3);
        var imp = PulseDivider.kr(~tick.kr,2*fib(4),~counter.kr);
        var hit = Select.kr(PulseCount.kr(imp)%pat.size,pat);
        var env = EnvGen.ar(Env([0.001,1,0.001],[0.002,0.15],[3,-3],curve:'exp'),imp * hit);
        var sig = Mix.ar(SinOsc.ar(15000/[1,2,4,8],SinOsc.ar(50).range(-pi,pi)));
        sig = sig * env;
        Splay.ar(sig,0.75,0.05);
    };
    ~first.play;
);" ], [ 2818.8307948, 'kof', "(
    ~first.ar(2);
    ~first.quant=4;
    ~first.fadeTime=2.2;
    ~first={
        //         |       |       |       |       |  
        var pat = [1,0,0,0,1,0,0,0,1,0,0,0,1,1,1,1].rotate(3);
        var imp = PulseDivider.kr(~tick.kr,2*fib(4),~counter.kr);
        var hit = Select.kr(PulseCount.kr(imp)%pat.size,pat);
        var env = EnvGen.ar(Env([0.001,1,0.001],[1.002,1.15],[3,-3],curve:'exp'),imp * hit);
        var sig = Mix.ar(SinOsc.ar(15000/[1,2,4,8],SinOsc.ar(50).range(-pi,pi)));
        sig = sig * env;
        Splay.ar(sig,0.75,0.05);
    };
    ~first.play;
);" ], [ 2815.4587587, 'joach', "(
~saw8[7] = \\set -> QuantEnv(\\fplus, 0.5)
.phase(1, [0,460,0], [0.005, 0.195], [8,-8], 0, 8)
.phase(2, [0,1808,0], [0.015, 0.165], [8,-8], 0, 1)
.play([1,2]);
)" ], [ 2810.7657213, 'joach', "(
~saw8[7] = \\set -> QuantEnv(\\fplus, 0.5)
.phase(1, [0,460,0], [0.005, 0.095], [8,-8], 0, 8)
.phase(2, [0,1808,0], [0.015, 0.165], [8,-8], 0, 1)
.play([1,2]);
)" ], [ 2806.6707108, 'kof', "(
    ~first.ar(2);
    ~first.quant=4;
    ~first.fadeTime=2.2;
    ~first={
        //         |       |       |       |       |  
        var pat = [1,0,0,0,1,0,0,0,1,0,0,0,1,1,1,1].rotate(3);
        var imp = PulseDivider.kr(~tick.kr,2*fib(8),~counter.kr);
        var hit = Select.kr(PulseCount.kr(imp)%pat.size,pat);
        var env = EnvGen.ar(Env([0.001,1,0.001],[1.002,1.15],[3,-3],curve:'exp'),imp * hit);
        var sig = Mix.ar(SinOsc.ar(15000/((1..8).reciprocal*1500),SinOsc.ar(50).range(-pi,pi)));
        sig = sig * env;
        Splay.ar(sig,0.75,0.05);
    };
    ~first.play;
);" ], [ 2798.2146668, 'joach', "~saw8[3] = \\filter -> {|in| GVerb.ar(in, \\gverb_size.kr(16), \\gverb_time.kr(0.26), 0.9, mul:\\mulgverb.kr(1)) };" ], [ 2796.9296642, 'alex', "~c.clear(fadeTime:12);" ], [ 2790.9186557, 'alex', "~c[1]=\\set->Pbind(\\args, [\\freq], \\dur, 0.25, \\freq,Pseq([Pseq([220,240,260,220,240,220,260]-40,4), Pn(65,4)],inf));" ], [ 2788.1886519, 'kof', "~kick.clear;" ], [ 2786.138649, 'kof', "(
    ~kick.ar(2);
    ~kick.quant=2;
    ~kick.fadeTime=0.2;
    ~kick={
        //         |       |       |       |       |  
        var pat = [1,0,0,0,1,1,0,0,1,0,0,0,1,1,0,0].rotate(1);
        var imp = PulseDivider.kr(~tick.kr,16,~counter.kr);
        var hit = Select.kr(PulseCount.kr(imp)%pat.size,pat);
        var env = EnvGen.ar(Env([0.001,1,0.001],[0.002,4.5],[3,-3],curve:'exp'),imp * hit);
        var sig = SinOsc.ar(50+(env**100*100),SinOsc.ar(50/2));
        sig = sig * env;
        Splay.ar(sig,0.75,0.95);
    };
    ~kick.play;
);" ], [ 2778.1186378, 'alex', "~g.clear(fadeTime:10);" ], [ 2777.0246042, 'joach', "(
~saw8[7] = \\set -> QuantEnv(\\fplus, 0.25)
.phase(1, [0,460,0], [0.005, 0.095], [8,-8], 0, 8)
.phase(2, [0,1808,0], [0.015, 0.165], [8,-8], 0, 1)
.play([1,2]);
)" ], [ 2776.6966028, 'kof', "(
    ~kick.ar(2);
    ~kick.quant=2;
    ~kick.fadeTime=0.2;
    ~kick={
        //         |       |       |       |       |  
        var pat = [1,0,0,0,1,1,0,0,1,0,0,0,1,1,0,0].rotate(1);
        var imp = PulseDivider.kr(~tick.kr,8,~counter.kr);
        var hit = Select.kr(PulseCount.kr(imp)%pat.size,pat);
        var env = EnvGen.ar(Env([0.001,1,0.001],[0.002,4.5],[3,-3],curve:'exp'),imp * hit);
        var sig = SinOsc.ar(50+(env**100*100),SinOsc.ar(50/2));
        sig = sig * env;
        Splay.ar(sig,0.75,0.95);
    };
    ~kick.play;
);" ], [ 2776.3766023, 'alex', "~g.play(vol:0.2, fadeTime:2).quant_(8);" ], [ 2772.2565966, 'kof', "(
    ~kick.ar(2);
    ~kick.quant=2;
    ~kick.fadeTime=0.2;
    ~kick={
        //         |       |       |       |       |  
        var pat = [1,0,0,0,1,1,0,0,1,0,0,0,1,1,0,0].rotate(1);
        var imp = PulseDivider.kr(~tick.kr,8,~counter.kr);
        var hit = Select.kr(PulseCount.kr(imp)%pat.size,pat);
        var env = EnvGen.ar(Env([0.001,1,0.001],[0.002,1.5],[3,-3],curve:'exp'),imp * hit);
        var sig = SinOsc.ar(50+(env**100*100),SinOsc.ar(50/2));
        sig = sig * env;
        Splay.ar(sig,0.75,0.95);
    };
    ~kick.play;
);" ], [ 2769.696593, 'alex', "~g.clear(fadeTime:10);" ], [ 2768.940562, 'joach', "~saw8.set(\\lpf_freq, 1800);" ], [ 2763.8035332, 'alex', "~g[30]=\\filter-> {arg in; GVerb.ar(in,[80,40], [25,18],add:in)};" ], [ 2763.5925211, 'joach', "(
~saw8[7] = \\set -> QuantEnv(\\fplus, 0.25)
.phase(1, [0,460,0], [0.005, 0.095], [8,-8], 0, 8)
.phase(2, [0,188,0], [0.015, 0.165], [8,-8], 0, 1)
.play([1,2]);
)" ], [ 2762.3675158, 'alex', "~g[3]=\\set->Pbind(\\args, [\\f2], \\dur, 8, \\f2,Pseq([14,17,12,15],inf));" ], [ 2761.4975146, 'alex', "~g[2]=\\set->Pbind(\\args, [\\trig], \\dur, 2, \\trig, 1);" ], [ 2760.397513, 'alex', "~g[1]=\\set->Pbind(\\args, [\\freq], \\dur, 8, \\freq,Pseq([45,65,750],inf));" ], [ 2754.8375053, 'alex', "(
~g[0]={
	var sig2,sig1, env, fenv,f2env;

	env=EnvGen.kr(Env([0,1,0], [0.5,0.01], [\\welch, \\step]), \\trig.tr);
	fenv=EnvGen.kr(Env([\\freq.kr,\\freq.kr*4], [2], \\welch), \\trig.tr);
	f2env=EnvGen.kr(Env([\\f2.kr(4),\\f2.kr(4)*4], [1], \\welch), \\trig.tr);
	
	// sig1=
	sig2=HPF.ar(GrayNoise.ar([0.5,0.7])*LFSaw.ar(f2env!2),fenv)*env;
	};
)" ], [ 2753.5424719, 'joach', "(
~saw8[6] = \\set -> QuantEnv(\\pan, 1)
.phase(1, [-0.2,0.2,0.2], [0.45, 0.45], [2,-2], 0, 1)
.phase(2, [-0.8,0.8,-0.8], [0.35, 0.65], [2,-2], 0, 1)
.play([1,2]);
)" ], [ 2752.1044683, 'alex', "~c[1]=\\set->Pbind(\\args, [\\freq], \\dur, 0.25, \\freq,Pseq([Pseq([220,240,260,220,240,220,260]-140,4), Pn(65,4)],inf));" ], [ 2751.2944672, 'kof', "~kick.clear;" ], [ 2739.1964448, 'alex', "(

~c[0]={
	var sig, env, fenv;

	env=EnvGen.kr(Env([0,1,0], [0.01,0.15], [\\welch, \\step]), \\trig.tr);
	fenv=EnvGen.kr(Env([\\freq.kr,\\freq.kr*\\top.kr(4),\\freq.kr], [0.01,0.04], \\welch), \\trig.tr);

	sig=LFPulse.ar(\\freq.kr!2).lag([0.0001,0.0002])*env;


};
)" ], [ 2738.6954162, 'joach', "(
~saw8[1] = \\set -> QuantEnv(\\amp, 4)
.phase(1, [0,1,0.2], [0.05, 0.45], [2,-2], 0, 8)
.phase(2, [0,1,0], [0.05, 0.95], [2,-2], 0, 4)
.phase(3, [0,1,0.1,0.4,0], [0.15, 0.25, 0.1], [2,\\step, -2], 0, 1)
.play([1,2,1,3]);
)" ], [ 2727.9223931, 'alex', "~c[2]=\\set->Pbind(\\args, [\\trig], \\dur, Pseq([Pn(0.5,2),Rest(0.5),Pn(0.25,3), Rest(2)],inf), \\trig, 1);" ], [ 2727.4433668, 'joach', "(
~saw8[7] = \\set -> QuantEnv(\\fplus, 0.25)
.phase(1, [0,260,0], [0.005, 0.095], [8,-8], 0, 8)
.phase(2, [0,188,0], [0.015, 0.165], [8,-8], 0, 1)
.play([1,2]);
)" ], [ 2721.5723585, 'alex', "~c[2]=\\set->Pbind(\\args, [\\trig], \\dur, Pseq([Pn(0.5,2),Rest(0.5),Pn(0.25,2), Rest(2)],inf), \\trig, 1);" ], [ 2720.7903244, 'joach', "(
~saw8[0] = {
var osc = SinOsc.ar(( \\freq.kr(80) + \\fplus.kr(0) ), mul: 1, add: 0);
var noise = BrownNoise.ar(\\noise.kr(0), (1 - \\noise.kr(0)));
var sig = osc * noise;
Pan2.ar( sig * \\amp.kr(0), \\pan.kr(0) );
};
)" ], [ 2714.9972871, 'joach', "(
~saw8[0] = {
var osc = SinOsc.ar(( \\freq.kr(180) + \\fplus.kr(0) ), mul: 1, add: 0);
var noise = BrownNoise.ar(\\noise.kr(0), (1 - \\noise.kr(0)));
var sig = osc * noise;
Pan2.ar( sig * \\amp.kr(0), \\pan.kr(0) );
};
)" ], [ 2709.3122415, 'joach', "(
~saw8[0] = {
var osc = SinOsc.ar(( \\freq.kr(480) + \\fplus.kr(0) ), mul: 1, add: 0);
var noise = BrownNoise.ar(\\noise.kr(0), (1 - \\noise.kr(0)));
var sig = osc * noise;
Pan2.ar( sig * \\amp.kr(0), \\pan.kr(0) );
};
)" ], [ 2705.2772071, 'joach', "(
~saw8[1] = \\set -> QuantEnv(\\amp, 0.5)
.phase(1, [0,1,0.2], [0.05, 0.45], [2,-2], 0, 8)
.phase(2, [0,1,0], [0.05, 0.95], [2,-2], 0, 4)
.phase(3, [0,1,0.1,0.4,0], [0.15, 0.25, 0.1], [2,\\step, -2], 0, 1)
.play([1,2,1,3]);
)" ], [ 2698.2811931, 'alex', "~c[3]=\\set->Pbind(\\args, [\\top], \\dur, 4, \\top, 8 );" ], [ 2696.9811589, 'joach', "(
~saw8[0] = {
var osc = SinOsc.ar(( \\freq.kr(280) + \\fplus.kr(0) ), mul: 1, add: 0);
var noise = BrownNoise.ar(\\noise.kr(0), (1 - \\noise.kr(0)));
var sig = osc * noise;
Pan2.ar( sig * \\amp.kr(0), \\pan.kr(0) );
};
)" ], [ 2695.1101556, 'alex', "~c[3]=\\set->Pbind(\\args, [\\top], \\dur, 4, \\top, 6 );" ], [ 2692.2601517, 'kof', "(
~kick.ar(2);
~kick.quant=2;
~kick.fadeTime=0.2;
~kick={
  //         |       |       |       |       |  
  var pat = [1,0,0,0,1,1,0,0,1,0,0,0,1,1,0,0].rotate(1);
  var imp = PulseDivider.kr(~tick.kr,4,~counter.kr);
  var hit = Select.kr(PulseCount.kr(imp)%pat.size,pat);
  var env = EnvGen.ar(Env([0.001,1,0.001],[0.002,1.5],[3,-3],curve:'exp'),imp * hit);
    var sig = SinOsc.ar(50+(env**100*100),SinOsc.ar(50/2));
  sig = sig * env;
  Splay.ar(sig,0.75,0.95);
};
~kick.play;
);" ], [ 2690.8671183, 'joach', "(
~saw8[0] = {
var osc = SinOsc.ar(( \\freq.kr(180) + \\fplus.kr(0) ), mul: 1, add: 0);
var noise = BrownNoise.ar(\\noise.kr(0), (1 - \\noise.kr(0)));
var sig = osc * noise;
Pan2.ar( sig * \\amp.kr(0), \\pan.kr(0) );
};
)" ], [ 2684.643077, 'joach', "(
~saw8[0] = {
var osc = SinOsc.ar(( \\freq.kr(280) + \\fplus.kr(0) ), mul: 1, add: 0);
var noise = BrownNoise.ar(\\noise.kr(0), (1 - \\noise.kr(0)));
var sig = osc * noise;
Pan2.ar( sig * \\amp.kr(0), \\pan.kr(0) );
};
)" ], [ 2681.1730699, 'kof', "(
~kick.ar(2);
~kick.quant=2;
~kick.fadeTime=0.2;
~kick={
  //         |       |       |       |       |  
  var pat = [1,0,0,0,1,1,0,0,1,0,0,0,1,1,0,0].rotate(1);
  var imp = PulseDivider.kr(~tick.kr,1,~counter.kr);
  var hit = Select.kr(PulseCount.kr(imp)%pat.size,pat);
  var env = EnvGen.ar(Env([0.001,1,0.001],[0.002,1.5],[3,-3],curve:'exp'),imp * hit);
    var sig = SinOsc.ar(50+(env**100*100),SinOsc.ar(50/2));
  sig = sig * env;
  Splay.ar(sig,0.75,0.95);
};
~kick.play;
);" ], [ 2680.9930697, 'alex', "~c[1]=\\set->Pbind(\\args, [\\freq], \\dur, 0.25, \\freq,Pseq([Pseq([220,240,260,220,240,220,260]-140,4), Pn(65,4)],inf));" ], [ 2674.6530608, 'alex', "~c[1]=\\set->Pbind(\\args, [\\freq], \\dur, 0.25, \\freq,Pseq([Pseq([220,240,260,220,240,220,260]+210,4), Pn(65,4)],inf));" ], [ 2673.2410587, 'kof', "(
~kick.ar(2);
~kick.quant=2;
~kick.fadeTime=0.2;
~kick={
  //         |       |       |       |       |  
  var pat = [1,0,0,0,1,1,0,0,1,0,0,0,1,1,0,0].rotate(1);
  var imp = PulseDivider.kr(~tick.kr,1,~counter.kr);
  var hit = Select.kr(PulseCount.kr(imp)%pat.size,pat);
  var env = EnvGen.ar(Env([0.001,1,0.001],[0.002,0.5],[3,-3],curve:'exp'),imp * hit);
    var sig = SinOsc.ar(50+(env**100*100),SinOsc.ar(50/2));
  sig = sig * env;
  Splay.ar(sig,0.75,0.95);
};
~kick.play;
);" ], [ 2669.9570472, 'alex', "~c.play(vol:0.7, fadeTime:2).quant_(2);" ], [ 2669.5680249, 'joach', "~saw8.set(\\lpf_freq, 800);" ], [ 2662.2700103, 'alex', "~c[1]=\\set->Pbind(\\args, [\\freq], \\dur, 0.25, \\freq,Pseq([Pseq([220,240,260,220,240,220,260]+180,4), Pn(65,4)],inf));" ], [ 2657.6729991, 'alex', "~c[1]=\\set->Pbind(\\args, [\\freq], \\dur, 0.25, \\freq,Pseq([Pseq([220,240,260,220,240,220,260]+80,4), Pn(65,4)],inf));" ], [ 2657.2259735, 'joach', "(
~saw8[6] = \\set -> QuantEnv(\\pan, 1)
.phase(1, [-0.2,0.2,0.2], [0.45, 0.45], [2,-2], 0, 1)
.phase(2, [-0.8,0.8,-0.8], [0.35, 0.65], [2,-2], 0, 1)
.play([1,2]);
)" ], [ 2655.3589677, 'kof', "(
~kick.ar(2);
~kick.quant=2;
~kick.fadeTime=0.2;
~kick={
  //         |       |       |       |       |  
  var pat = [1,0,0,0,1,1,0,0,1,0,0,0,1,1,0,0].rotate(1);
  var imp = PulseDivider.kr(~tick.kr,2,~counter.kr);
  var hit = Select.kr(PulseCount.kr(imp)%pat.size,pat);
  var env = EnvGen.ar(Env([0.001,1,0.001],[0.002,1.5],[3,-3],curve:'exp'),imp * hit);
    var sig = SinOsc.ar(50+(env**100*100),SinOsc.ar(50/1.5)) + Pulse.ar(40);
  sig = sig * env;
  Splay.ar(sig,0.75,0.95);
};
~kick.play;
);" ], [ 2651.5689624, 'kof', "(
~kick.ar(2);
~kick.quant=2;
~kick.fadeTime=0.2;
~kick={
  //         |       |       |       |       |  
  var pat = [1,0,0,0,1,1,0,0,1,0,0,0,1,1,0,0].rotate(1);
  var imp = PulseDivider.kr(~tick.kr,2,~counter.kr);
  var hit = Select.kr(PulseCount.kr(imp)%pat.size,pat);
  var env = EnvGen.ar(Env([0.001,1,0.001],[0.002,2.5],[3,-3],curve:'exp'),imp * hit);
    var sig = SinOsc.ar(50+(env**100*100),SinOsc.ar(50/1.5)) + Pulse.ar(40);
  sig = sig * env;
  Splay.ar(sig,0.75,0.95);
};
~kick.play;
);" ], [ 2648.3689579, 'alex', "~c[1]=\\set->Pbind(\\args, [\\freq], \\dur, 0.25, \\freq,Pseq([Pseq([220,240,260,220,240,220,260]+50,4), Pn(65,4)],inf));" ], [ 2643.6389513, 'kof', "(
~kick.ar(2);
~kick.quant=2;
~kick.fadeTime=0.2;
~kick={
  //         |       |       |       |       |  
  var pat = [1,0,0,0,1,0,0,0,1,0,0,0,1,0,0,0].rotate(1);
  var imp = PulseDivider.kr(~tick.kr,4,~counter.kr);
  var hit = Select.kr(PulseCount.kr(imp)%pat.size,pat);
  var env = EnvGen.ar(Env([0.001,1,0.001],[0.002,2.5],[3,-3],curve:'exp'),imp * hit);
    var sig = SinOsc.ar(50+(env**100*100),SinOsc.ar(50/1.5)) + Pulse.ar(40);
  sig = sig * env;
  Splay.ar(sig,0.75,0.95);
};
~kick.play;
);" ], [ 2641.8269202, 'joach', "~saw8.set(\\lpf_freq, 4800);" ], [ 2641.2279149, 'alex', "~c[1]=\\set->Pbind(\\args, [\\freq], \\dur, 0.25, \\freq,Pseq([Pseq([220,240,260,220,240,220,260]-10,4), Pn(65,4)],inf));" ], [ 2637.8279102, 'alex', "~c[1]=\\set->Pbind(\\args, [\\freq], \\dur, 0.25, \\freq,Pseq([Pseq([220,240,260,220,240,220,260]-50,4), Pn(65,4)],inf));" ], [ 2637.2458791, 'joach', "(
~saw8[5] = \\set -> QuantEnv(\\noise, 16)
.phase(1, [0,0.8,0], [6.05, 2.95], [2,-2], 0, 1)
.phase(2, [0,0.4,0], [7.35, 0.65], [2,-2], 0, 1)
.play([1,2]);
)" ], [ 2635.9408737, 'kof', "(
~kick.ar(2);
~kick.quant=2;
~kick.fadeTime=0.2;
~kick={
  //         |       |       |       |       |  
  var pat = [1,0,0,0,1,0,0,0,1,0,0,0,1,0,0,0].rotate(1);
  var imp = PulseDivider.kr(~tick.kr,4,~counter.kr);
  var hit = Select.kr(PulseCount.kr(imp)%pat.size,pat);
  var env = EnvGen.ar(Env([0.001,1,0.001],[0.002,2.5],[3,-3],curve:'exp'),imp * hit);
    var sig = SinOsc.ar(50+(env**100*100),SinOsc.ar(50/2)) + Pulse.ar(40);
  sig = sig * env;
  Splay.ar(sig,0.75,0.95);
};
~kick.play;
);" ], [ 2633.8808708, 'alex', "~c[1]=\\set->Pbind(\\args, [\\freq], \\dur, 0.25, \\freq,Pseq([Pseq([220,240,260,220,240,220,260]-80,4), Pn(65,4)],inf));" ], [ 2630.799834, 'joach', "(
~saw8[1] = \\set -> QuantEnv(\\amp, 1)
.phase(1, [0,1,0.2], [0.05, 0.45], [2,-2], 0, 8)
.phase(2, [0,1,0], [0.05, 0.95], [2,-2], 0, 4)
.phase(3, [0,1,0.1,0.4,0], [0.15, 0.25, 0.1], [2,\\step, -2], 0, 1)
.play([1,2,1,3]);
)" ], [ 2628.5088302, 'alex', "~c[1]=\\set->Pbind(\\args, [\\freq], \\dur, 0.25, \\freq,Pseq([Pseq([220,240,260,220,240,220,260]-100,4), Pn(65,4)],inf));" ], [ 2623.5937935, 'joach', "(
~saw8[1] = \\set -> QuantEnv(\\amp, 1)
.phase(1, [0,1,0], [0.05, 0.45], [2,-2], 0, 8)
.phase(2, [0,1,0], [0.05, 0.95], [2,-2], 0, 4)
.phase(3, [0,1,0.1,0.4,0], [0.15, 0.25, 0.1], [2,\\step, -2], 0, 1)
.play([1,2,1,3]);
)" ], [ 2623.5587915, 'alex', "~c[1]=\\set->Pbind(\\args, [\\freq], \\dur, 0.25, \\freq,Pseq([Pseq([220,240,260,220,240,220,260]-120,4), Pn(65,4)],inf));" ], [ 2619.115784, 'kof', "(
~ff.quant=1;
~ff.fadeTime=1;
~ff={
  var high,mid,low;
  var sig = ~kick;
  
  sig = GVerb.ar(LPF.ar(sig,5000)+HPF.ar(sig,500),40,[3,4,5,6],spread:[40,90])/8 + sig;
  low = CompanderD.ar(LPF.ar(sig,400),3/4,1/3,1/2);
  mid = CompanderD.ar(BPF.ar(sig,600,2),3/4,1/2,1/2);
  high = CompanderD.ar(HPF.ar(sig,900),3/4,1/2,1/2);
  sig = CompanderD.ar((high+mid+low).flat,3/4,1/1.1,1/1.1);
  Splay.ar(sig,0.75,0.25);
};
~ff.play;
);" ], [ 2617.9187496, 'joach', "(
~saw8[1] = \\set -> QuantEnv(\\amp, 1)
.phase(1, [0,1,0], [0.05, 0.95], [2,-2], 0, 8)
.phase(2, [0,1,0], [0.05, 0.95], [2,-2], 0, 4)
.phase(3, [0,1,0.1,0.4,0], [0.15, 0.25, 0.1], [2,\\step, -2], 0, 1)
.play([1,2,1,3]);
)" ], [ 2611.5247404, 'kof', "(
~ff.quant=1;
~ff.fadeTime=1;
~ff={
  var high,mid,low;
  var sig = ~kick;
  
  sig = GVerb.ar(LPF.ar(sig,5000)+HPF.ar(sig,500),40,[3,4,5,6],spread:[40,90])/8 + sig;
  low = CompanderD.ar(LPF.ar(sig,400),3/4,1/3,1/2);
  mid = CompanderD.ar(BPF.ar(sig,600,2),3/4,1/2,1/2);
  high = CompanderD.ar(HPF.ar(sig,900),3/4,1/3,1/2);
  sig = CompanderD.ar((high+mid+low).flat,3/4,1/1.1,1/1.1);
  Splay.ar(sig,0.75,0.25);
};
~ff.play;
);" ], [ 2607.1097004, 'joach', "(
~saw8[1] = \\set -> QuantEnv(\\amp, 1)
.phase(1, [0,1,0], [0.05, 0.95], [2,-2], 0, 8)
.phase(2, [0,1,0], [0.05, 0.95], [2,-2], 0, 4)
.phase(3, [0,1,0.1,0.4,0], [0.15, 0.25, 0.1], [2,\\step, -2], 0, 1)
.play([1,2]);
)" ], [ 2603.0946945, 'alex', "~c[2]=\\set->Pbind(\\args, [\\trig], \\dur, Pseq([Pn(0.5,2),Rest(0.5),Pn(0.5,1), Rest(2)],inf), \\trig, 1);" ], [ 2602.1826932, 'kof', "(
~kick.ar(2);
~kick.quant=2;
~kick.fadeTime=0.2;
~kick={
  //         |       |       |       |       |  
  var pat = [1,0,0,0,1,0,0,0,1,0,0,0,1,0,0,0].rotate(1);
  var imp = PulseDivider.kr(~tick.kr,4,~counter.kr);
  var hit = Select.kr(PulseCount.kr(imp)%pat.size,pat);
  var env = EnvGen.ar(Env([0.001,1,0.001],[0.002,2.5],[3,-3],curve:'exp'),imp * hit);
    var sig = SinOsc.ar(50+(env**100*100),SinOsc.ar(50)) + Pulse.ar(40);
  sig = sig * env;
  Splay.ar(sig,0.75,0.95);
};
~kick.play;
);" ], [ 2599.202689, 'kof', "(
~kick.ar(2);
~kick.quant=2;
~kick.fadeTime=0.2;
~kick={
  //         |       |       |       |       |  
  var pat = [1,0,0,0,1,0,0,0,1,0,0,0,1,0,0,0].rotate(1);
  var imp = PulseDivider.kr(~tick.kr,4,~counter.kr);
  var hit = Select.kr(PulseCount.kr(imp)%pat.size,pat);
  var env = EnvGen.ar(Env([0.001,1,0.001],[0.002,2.5],[3,-3],curve:'exp'),imp * hit);
    var sig = SinOsc.ar(50+(env**100*100),SinOsc.ar(50)) + Pulse.ar(8);
  sig = sig * env;
  Splay.ar(sig,0.75,0.95);
};
~kick.play;
);" ], [ 2591.9226447, 'joach', "(
~saw8[1] = \\set -> QuantEnv(\\amp, 1)
.phase(1, [0,1,0], [0.05, 0.95], [2,-2], 0, 4)
.phase(2, [0,1,0.1,0.4,0], [0.15, 0.25, 0.1], [2,\\step, -2], 0, 1)
.play([1,2]);
)" ], [ 2590.4926427, 'kof', "(
~kick.ar(2);
~kick.quant=2;
~kick.fadeTime=0.2;
~kick={
  //         |       |       |       |       |  
  var pat = [1,0,0,0,1,0,0,0,1,0,0,0,1,0,0,0].rotate(1);
  var imp = PulseDivider.kr(~tick.kr,4,~counter.kr);
  var hit = Select.kr(PulseCount.kr(imp)%pat.size,pat);
  var env = EnvGen.ar(Env([0.001,1,0.001],[0.002,2.5],[3,-3],curve:'exp'),imp * hit);
    var sig = SinOsc.ar(50+(env**100*100),SinOsc.ar(50)) + Pulse.ar(4);
  sig = sig * env;
  Splay.ar(sig,0.75,0.95);
};
~kick.play;
);" ], [ 2586.1406332, 'alex', "~c[2]=\\set->Pbind(\\args, [\\trig], \\dur, Pseq([Pn(0.5,2),Rest(4),Pn(0.5,2), Rest(2)],inf), \\trig, 1);" ], [ 2585.5896028, 'joach', "(
~saw8[1] = \\set -> QuantEnv(\\amp, 1)
.phase(1, [0,1,0], [0.05, 0.45], [2,-2], 0, 4)
.phase(2, [0,1,0.1,0.4,0], [0.15, 0.25, 0.1], [2,\\step, -2], 0, 1)
.play([1,2]);
)" ], [ 2582.0295978, 'kof', "(
~kick.ar(2);
~kick.quant=2;
~kick.fadeTime=0.2;
~kick={
  //         |       |       |       |       |  
  var pat = [1,0,0,0,1,0,0,0,1,0,0,0,1,0,0,0].rotate(1);
  var imp = PulseDivider.kr(~tick.kr,16,~counter.kr);
  var hit = Select.kr(PulseCount.kr(imp)%pat.size,pat);
  var env = EnvGen.ar(Env([0.001,1,0.001],[0.002,2.5],[3,-3],curve:'exp'),imp * hit);
    var sig = SinOsc.ar(50+(env**100*100),SinOsc.ar(50)) + Pulse.ar(4);
  sig = sig * env;
  Splay.ar(sig,0.75,0.95);
};
~kick.play;
);" ], [ 2579.2295939, 'alex', "~c.play(vol:1, fadeTime:2).quant_(2);" ], [ 2577.187558, 'joach', "(
~saw8[7] = \\set -> QuantEnv(\\fplus, 0.25)
.phase(1, [0,2600,0], [0.005, 0.095], [8,-8], 0, 8)
.phase(2, [0,188,0], [0.015, 0.165], [8,-8], 0, 1)
.play([1,2]);
)" ], [ 2573.1315202, 'joach', "(
~saw8[7] = \\set -> QuantEnv(\\fplus, 0.5)
.phase(1, [0,2600,0], [0.005, 0.095], [8,-8], 0, 8)
.phase(2, [0,188,0], [0.015, 0.165], [8,-8], 0, 1)
.play([1,2]);
)" ], [ 2569.6364854, 'joach', "(
~saw8[7] = \\set -> QuantEnv(\\fplus, 2)
.phase(1, [0,2600,0], [0.005, 0.095], [8,-8], 0, 8)
.phase(2, [0,188,0], [0.015, 0.165], [8,-8], 0, 1)
.play([1,2]);
)" ], [ 2564.480474, 'kof', "(
~kick.ar(2);
~kick.quant=2;
~kick.fadeTime=0.2;
~kick={
  //         |       |       |       |       |  
  var pat = [1,0,0,0,1,0,0,0,1,0,0,0,1,0,0,0].rotate(1);
  var imp = PulseDivider.kr(~tick.kr,16,~counter.kr);
  var hit = Select.kr(PulseCount.kr(imp)%pat.size,pat);
  var env = EnvGen.ar(Env([0.001,1,0.001],[4.002,4.5],[3,-3],curve:'exp'),imp * hit);
    var sig = SinOsc.ar(50+(env**100*100),SinOsc.ar(50)) + Pulse.ar(4);
  sig = sig * env;
};
~kick.play;
);" ], [ 2563.0514581, 'alex', "(

~c[0]={
	var sig, env, fenv;

	env=EnvGen.kr(Env([0,1,0], [0.01,0.25], [\\welch, \\step]), \\trig.tr);
	fenv=EnvGen.kr(Env([\\freq.kr,\\freq.kr*\\top.kr(4),\\freq.kr], [0.01,0.04], \\welch), \\trig.tr);

	sig=LFPulse.ar(\\freq.kr!2).lag([0.0001,0.0002])*env;


};
)" ], [ 2562.752441, 'joach', "~saw8.play(vol: 0.9, fadeTime: 8);" ], [ 2556.5363996, 'joach', "~saw8[3] = \\filter -> {|in| GVerb.ar(in, \\gverb_size.kr(16), \\gverb_time.kr(2.26), 0.9, mul:\\mulgverb.kr(1)) };" ], [ 2548.8873554, 'joach', "~saw8[3] = \\filter -> {|in| GVerb.ar(in, \\gverb_size.kr(16), \\gverb_time.kr(0.26), 0.9, mul:\\mulgverb.kr(1)) };" ], [ 2546.8383504, 'alex', "~c[2]=\\set->Pbind(\\args, [\\trig], \\dur, Pseq([Pn(0.5,2),Rest(4),Pn(0.5,2)],inf), \\trig, 1);" ], [ 2540.9143106, 'joach', "p.clock.tempo" ], [ 2533.0562668, 'joach', "(
~saw8[1] = \\set -> QuantEnv(\\amp, 0.5)
.phase(1, [0,1,0], [0.05, 0.45], [2,-2], 0, 4)
.phase(2, [0,1,0.1,0.4,0], [0.15, 0.25, 0.1], [2,\\step, -2], 0, 1)
.play([1,2]);
)" ], [ 2527.3772561, 'alex', "~c[1]=\\set->Pbind(\\args, [\\freq], \\dur, 0.25, \\freq,Pseq([Pseq([220,240,260,220,240,220,260]-140,4), Pn(65,4)],inf));" ], [ 2520.9252163, 'joach', "~saw8.play(vol: 0.5, fadeTime: 1);" ], [ 2519.1262116, 'alex', "~c[1]=\\set->Pbind(\\args, [\\freq], \\dur, 0.25, \\freq,Pseq([Pseq([220,240,260,220,240,220,260]-180,4), Pn(65,4)],inf));" ], [ 2513.1052031, 'alex', "~c[1]=\\set->Pbind(\\args, [\\freq], \\dur, 0.25, \\freq,Pseq([Pseq([220,240,260,220,240,220,260]+180,4), Pn(65,4)],inf));" ], [ 2512.3011694, 'joach', "~saw8.play(vol: 0.1, fadeTime: 1);" ], [ 2509.6861365, 'joach', "(
~saw8[0] = {
var osc = SinOsc.ar(( \\freq.kr(260) + \\fplus.kr(0) ), mul: 1, add: 0);
var noise = BrownNoise.ar(\\noise.kr(0), (1 - \\noise.kr(0)));
var sig = osc * noise;
Pan2.ar( sig * \\amp.kr(0), \\pan.kr(0) );
};
)" ], [ 2502.0641218, 'alex', "~c[2]=\\set->Pbind(\\args, [\\trig], \\dur, Pseq([Pn(0.5,3),Rest(4.5)],inf), \\trig, 1);" ], [ 2498.9810838, 'joach', "~saw8[4]=nil" ], [ 2488.6040689, 'alex', "~c[1]=\\set->Pbind(\\args, [\\freq], \\dur, 0.25, \\freq,Pseq([Pseq([220,240,260,220,240,220,260]-180,4), Pn(65,4)],inf));" ], [ 2477.6740536, 'alex', "~c[30]=\\filter-> {arg in; GVerb.ar(in,[20,40],8,add:in)};" ], [ 2471.8740455, 'alex', "~c[1]=\\set->Pbind(\\args, [\\freq], \\dur, 0.25, \\freq,Pseq([Pseq([220,240,260,220,240,220,260]-150,4), Pn(65,4)],inf));" ], [ 2466.4230378, 'kof', "(
~ff.quant=1;
~ff.fadeTime=1;
~ff={
  var high,mid,low;
  var sig = ~kick;
  
  sig = GVerb.ar(LPF.ar(sig,5000)+HPF.ar(sig,500),40,[3,4,5,6],spread:[40,90])/8 + sig;
  low = CompanderD.ar(LPF.ar(sig,400),3/4,1/3,1/2);
  mid = CompanderD.ar(BPF.ar(sig,600,2),3/4,1/2,1/2);
  high = CompanderD.ar(HPF.ar(sig,900),3/4,1/2,1/2);
  sig = CompanderD.ar((high+mid+low).flat,3/4,1/1.1,1/1.1);
  Splay.ar(sig,0.75,0.25);
};
~ff.play;
);" ], [ 2460.4930295, 'alex', "~c[1]=\\set->Pbind(\\args, [\\freq], \\dur, 0.25, \\freq,Pseq([Pseq([220,240,260,220,240,220,260]-100,4), Pn(65,4)],inf));" ], [ 2458.703027, 'kof', "(
~ff.quant=1;
~ff.fadeTime=1;
~ff={
  var high,mid,low;
  var sig = ~kick;
  
  sig = GVerb.ar(LPF.ar(sig,5000)+HPF.ar(sig,500),40,[3,4,5,6],spread:[40,90])/8 + sig;
  low = CompanderD.ar(LPF.ar(sig,400),3/4,1/2,1/2);
  mid = CompanderD.ar(BPF.ar(sig,600,2),3/4,1/2,1/2);
  high = CompanderD.ar(HPF.ar(sig,900),3/4,1/2,1/2);
  sig = CompanderD.ar((high+mid+low).flat,3/4,1/1.1,1/1.1);
  Splay.ar(sig,0.75,0.25);
};
~ff.play;
);" ], [ 2449.2320136, 'alex', "~c[1]=\\set->Pbind(\\args, [\\freq], \\dur, 0.25, \\freq,Pseq([Pseq([220,240,260,220,240,220,260]+200,4), Pn(65,4)],inf));" ], [ 2446.4539809, 'joach', "~saw8.stop(8);" ], [ 2441.7919703, 'alex', "~c[1]=\\set->Pbind(\\args, [\\freq], \\dur, 2, \\freq,Pseq([Pseq([220,240,260,220,240,220,260]+200,4), Pn(65,4)],inf));" ], [ 2438.1509322, 'joach', "~saw8[3] = \\filter -> {|in| GVerb.ar(in, \\gverb_size.kr(16), \\gverb_time.kr(0.26), 0.9, mul:\\mulgverb.kr(1)) };" ], [ 2436.8709304, 'alex', "~c[1]=\\set->Pbind(\\args, [\\freq], \\dur, 4, \\freq,Pseq([Pseq([220,240,260,220,240,220,260]+200,4), Pn(65,4)],inf));" ], [ 2435.6538988, 'joach', "~saw8[3] = \\filter -> {|in| GVerb.ar(in, \\gverb_size.kr(6), \\gverb_time.kr(0.26), 0.9, mul:\\mulgverb.kr(1)) };" ], [ 2432.0528898, 'alex', "~c[1]=\\set->Pbind(\\args, [\\freq], \\dur, 4, \\freq,Pseq([Pseq([220,240,260,220,240,220,260]+1600,4), Pn(65,4)],inf));" ], [ 2427.8528839, 'kof', "(
~kick.ar(2);
~kick.quant=2;
~kick.fadeTime=0.2;
~kick={
  //         |       |       |       |       |  
  var pat = [1,0,0,0,1,0,0,0,1,0,0,0,1,0,0,0].rotate(1);
  var imp = PulseDivider.kr(~tick.kr,32,~counter.kr);
  var hit = Select.kr(PulseCount.kr(imp)%pat.size,pat);
  var env = EnvGen.ar(Env([0.001,1,0.001],[4.002,4.5],[3,-3],curve:'exp'),imp * hit);
    var sig = SinOsc.ar(50+(env**100*100),SinOsc.ar(50)) + Pulse.ar(4);
  sig = sig * env;
  Splay.ar(sig,0.75,0.95);
};
~kick.play;
);" ], [ 2421.6528456, 'joach', "~saw8.set(\\lpf_freq, 1800);" ], [ 2419.2618389, 'alex', "~c[1]=\\set->Pbind(\\args, [\\freq], \\dur, 4, \\freq,Pseq([Pseq([220,240,260,220,240,220,260]+600,4), Pn(65,4)],inf));" ], [ 2416.6328023, 'joach', "(
~saw8[8] = \\set -> QuantEnv(\\mulgverb, 4)
.phase(1, [0,1,0], [0.05, 0.95], [2,-2], 0, 1)
.phase(2, [0,1,0], [0.35, 0.65], [2,-2], 0, 1)
.play([1,2]);
)" ], [ 2414.7797996, 'alex', "~c[1]=\\set->Pbind(\\args, [\\freq], \\dur, 4, \\freq,Pseq([Pseq([220,240,260,220,240,220,260]+200,4), Pn(65,4)],inf));" ], [ 2407.8897615, 'joach', "(
~saw8[7] = \\set -> QuantEnv(\\fplus, 2)
.phase(1, [0,260,0], [0.005, 0.095], [8,-8], 0, 8)
.phase(2, [0,188,0], [0.015, 0.165], [8,-8], 0, 1)
.play([1,2]);
)" ], [ 2403.8487513, 'alex', "~c[30]=\\filter-> {arg in; GVerb.ar(in,[20,40],8,add:in)};" ], [ 2399.9207163, 'joach', "(
~saw8[1] = \\set -> QuantEnv(\\amp, 4)
.phase(1, [0,1,0], [0.05, 0.45], [2,-2], 0, 4)
.phase(2, [0,1,0.1,0.4,0], [0.15, 0.25, 0.1], [2,\\step, -2], 0, 1)
.play([1,2]);
)" ], [ 2399.2567118, 'alex', "~c[30]=\\filter-> {arg in; GVerb.ar(in,[20,40],2,add:in)};" ], [ 2396.9767086, 'kof', "~hiss.clear;" ], [ 2393.8067042, 'kof', "~kick.clear;" ], [ 2388.1866963, 'alex', "~c[1]=\\set->Pbind(\\args, [\\freq], \\dur, 4, \\freq,Pseq([Pseq([220,240,260,220,240,220,260],4), Pn(65,4)],inf));" ], [ 2388.1266963, 'kof', "~first.clear;" ], [ 2383.4166897, 'kof', "(
~first.ar(2);
~first.quant=4;
~first.fadeTime=2.2;
~first={
  //         |       |       |       |       |  
  var pat = [1,0,0,0,1,0,0,0,1,0,0,0,1,1,1,1].rotate(3);
  var imp = PulseDivider.kr(~tick.kr,fib(16),~counter.kr);
  var hit = Select.kr(PulseCount.kr(imp)%pat.size,pat);
  var env = EnvGen.ar(Env([0.001,1,0.001],[0.002,0.15],[3,-3],curve:'exp'),imp * hit);
    var sig = Mix.ar(SinOsc.ar(16000/[1,2,4,8,16,32,64]-(env*10000)+(1..8),SinOsc.ar(500))) * LFPulse.ar(8000*fib(4));
  sig = sig * env;
  Splay.ar(sig,0.75,0.95);
};
~first.play;
);" ], [ 2382.224655, 'joach', "(
~saw8[1] = \\set -> QuantEnv(\\amp, 0.5)
.phase(1, [0,1,0], [0.05, 0.45], [2,-2], 0, 4)
.phase(2, [0,1,0.1,0.4,0], [0.15, 0.25, 0.1], [2,\\step, -2], 0, 1)
.play([1,2]);
)" ], [ 2382.1846549, 'kof', "(
~first.ar(2);
~first.quant=4;
~first.fadeTime=2.2;
~first={
  //         |       |       |       |       |  
  var pat = [1,0,0,0,1,0,0,0,1,0,0,0,1,1,1,1].rotate(3);
  var imp = PulseDivider.kr(~tick.kr,fib(16),~counter.kr);
  var hit = Select.kr(PulseCount.kr(imp)%pat.size,pat);
  var env = EnvGen.ar(Env([0.001,1,0.001],[0.002,0.15],[3,-3],curve:'exp'),imp * hit);
    var sig = Mix.ar(SinOsc.ar(16000/[1,2,4,8,16,32,64]-(env*10000)+(1..8),SinOsc.ar(50))) * LFPulse.ar(8000*fib(4));
  sig = sig * env;
  Splay.ar(sig,0.75,0.95);
};
~first.play;
);" ], [ 2381.7336542, 'alex', "~c[1]=\\set->Pbind(\\args, [\\freq], \\dur, 4, \\freq,Pseq([Pseq([220,240,260,220,240,220,260],4), Pn(650,4)],inf));" ], [ 2375.3426452, 'kof', "(
~first.ar(2);
~first.quant=4;
~first.fadeTime=2.2;
~first={
  //         |       |       |       |       |  
  var pat = [1,0,0,0,1,0,0,0,1,0,0,0,1,1,1,1].rotate(3);
  var imp = PulseDivider.kr(~tick.kr,fib(16),~counter.kr);
  var hit = Select.kr(PulseCount.kr(imp)%pat.size,pat);
  var env = EnvGen.ar(Env([0.001,1,0.001],[0.002,0.15],[3,-3],curve:'exp'),imp * hit);
    var sig = Mix.ar(SinOsc.ar(16000/[1,2,4,8,16,32,64]-(env*10000)+(1..8),SinOsc.ar(5))) * LFPulse.ar(8000*fib(4));
  sig = sig * env;
  Splay.ar(sig,0.75,0.95);
};
~first.play;
);" ], [ 2371.3226396, 'alex', "~c[1]=\\set->Pbind(\\args, [\\freq], \\dur, 4, \\freq,Pseq([Pseq([220,240,260,220,240,220,260]+1800,4), Pn(650,4)],inf));" ], [ 2367.2666023, 'joach', "(
~saw8[8] = \\set -> QuantEnv(\\mulgverb, 1)
.phase(1, [0,1,0], [0.05, 0.95], [2,-2], 0, 1)
.phase(2, [0,1,0], [0.35, 0.65], [2,-2], 0, 1)
.play([1,2]);
)" ], [ 2365.1305979, 'kof', "(
~first.ar(2);
~first.quant=4;
~first.fadeTime=2.2;
~first={
  //         |       |       |       |       |  
  var pat = [1,0,0,0,1,0,0,0,1,0,0,0,1,1,1,1].rotate(3);
  var imp = PulseDivider.kr(~tick.kr,fib(16),~counter.kr);
  var hit = Select.kr(PulseCount.kr(imp)%pat.size,pat);
  var env = EnvGen.ar(Env([0.001,1,0.001],[0.002,0.15],[3,-3],curve:'exp'),imp * hit);
    var sig = Mix.ar(SinOsc.ar(16000/[1,2,4,8,16,32,64]-(env*100)+(1..8),SinOsc.ar(5))) * LFPulse.ar(8000*fib(4));
  sig = sig * env;
  Splay.ar(sig,0.75,0.95);
};
~first.play;
);" ], [ 2360.7895917, 'kof', "(
~first.ar(2);
~first.quant=4;
~first.fadeTime=2.2;
~first={
  //         |       |       |       |       |  
  var pat = [1,0,0,0,1,0,0,0,1,0,0,0,1,1,1,1].rotate(3);
  var imp = PulseDivider.kr(~tick.kr,fib(16)*4,~counter.kr);
  var hit = Select.kr(PulseCount.kr(imp)%pat.size,pat);
  var env = EnvGen.ar(Env([0.001,1,0.001],[0.002,0.5],[3,-3],curve:'exp'),imp * hit);
    var sig = Mix.ar(SinOsc.ar(16000/[1,2,4,8,16,32,64]-(env*100)+(1..8),SinOsc.ar(5))) * LFPulse.ar(8000*fib(4));
  sig = sig * env;
  Splay.ar(sig,0.75,0.95);
};
~first.play;
);" ], [ 2358.6285585, 'joach', "(
~saw8[8] = \\set -> QuantEnv(\\mulgverb, 0.5)
.phase(1, [0,1,0], [0.05, 0.95], [2,-2], 0, 1)
.phase(2, [0,1,0], [0.35, 0.65], [2,-2], 0, 1)
.play([1,2]);
)" ], [ 2353.9425483, 'alex', "~c[1]=\\set->Pbind(\\args, [\\freq], \\dur, 4, \\freq,Pseq([Pseq([220,240,260,220,240,220,260]+800,4), Pn(650,4)],inf));" ], [ 2353.3875165, 'joach', "(
~saw8[4] = \\set -> QuantEnv(\\freq, 16)
.phase(1, [60,66,60], [0.5, 0.25], [\\sin,\\sin], 0, 4)
.phase(2, [170,176,170], [0.25, 0.25], [2,-2], 0, 1)
.play([1,2]);
)" ], [ 2351.2535122, 'kof', "(
~first.ar(2);
~first.quant=4;
~first.fadeTime=2.2;
~first={
  //         |       |       |       |       |  
  var pat = [1,0,0,0,1,0,0,0,1,0,0,0,1,1,1,1].rotate(3);
  var imp = PulseDivider.kr(~tick.kr,fib(16)*4,~counter.kr);
  var hit = Select.kr(PulseCount.kr(imp)%pat.size,pat);
  var env = EnvGen.ar(Env([0.001,1,0.001],[0.002,0.15],[3,-3],curve:'exp'),imp * hit);
    var sig = Mix.ar(SinOsc.ar(16000/[1,2,4,8,16,32,64]-(env*100)+(1..8),SinOsc.ar(5))) * LFPulse.ar(8000*fib(4));
  sig = sig * env;
  Splay.ar(sig,0.75,0.95);
};
~first.play;
);" ], [ 2347.8035074, 'alex', "~c[1]=\\set->Pbind(\\args, [\\freq], \\dur, 4, \\freq,Pseq([Pseq([220,240,260,220,240,220,260]+2000,4), Pn(650,4)],inf));" ], [ 2346.5054767, 'joach', "(
~saw8[4] = \\set -> QuantEnv(\\freq, 16)
.phase(1, [60,66,60], [0.5, 0.25], [\\sin,\\sin], 0, 4)
.phase(2, [170,176,170], [0.25, 0.25], [2,-2], 0, 1)
.play([1,2]);
)" ], [ 2342.1214664, 'alex', "~c[1]=\\set->Pbind(\\args, [\\freq], \\dur, 4, \\freq,Pseq([Pseq([220,240,260,220,240,220,260],4), Pn(650,4)],inf));" ], [ 2336.4304584, 'alex', "~c[1]=\\set->Pbind(\\args, [\\freq], \\dur, 4, \\freq,Pseq([Pseq([220,240,260,220,240,220,260]+1800,4), Pn(650,4)],inf));" ], [ 2333.6304545, 'kof', "(
~first.ar(2);
~first.quant=4;
~first.fadeTime=2.2;
~first={
  //         |       |       |       |       |  
  var pat = [1,0,0,0,1,0,0,0,1,0,0,0,1,1,1,1].rotate(3);
  var imp = PulseDivider.kr(~tick.kr,fib(16),~counter.kr);
  var hit = Select.kr(PulseCount.kr(imp)%pat.size,pat);
  var env = EnvGen.ar(Env([0.001,1,0.001],[0.002,0.15],[3,-3],curve:'exp'),imp * hit);
    var sig = Mix.ar(SinOsc.ar(16000/[1,2,4,8,16,32,64]-(env*100)+(1..8),SinOsc.ar(5))) * LFPulse.ar(8000*fib(4));
  sig = sig * env;
  Splay.ar(sig,0.75,0.95);
};
~first.play;
);" ], [ 2331.0684474, 'alex', "~c[1]=\\set->Pbind(\\args, [\\freq], \\dur, 4, \\freq,Pseq([Pseq([220,240,260,220,240,220,260]+800,4), Pn(650,4)],inf));" ], [ 2330.5624185, 'joach', "(
~saw8[4] = \\set -> QuantEnv(\\freq, 8)
.phase(1, [60,66,60], [0.5, 0.25], [\\sin,\\sin], 0, 4)
.phase(2, [170,176,170], [0.25, 0.25], [2,-2], 0, 1)
.play([1,2]);
)" ], [ 2328.6494145, 'alex', "~c[1]=\\set->Pbind(\\args, [\\freq], \\dur, 4, \\freq,Pseq([Pseq([220,240,260,220,240,220,260]+600,4), Pn(650,4)],inf));" ], [ 2328.0493802, 'joach', "(
~saw8[4] = \\set -> QuantEnv(\\freq, 4)
.phase(1, [60,66,60], [0.5, 0.25], [\\sin,\\sin], 0, 4)
.phase(2, [170,176,170], [0.25, 0.25], [2,-2], 0, 1)
.play([1,2]);
)" ], [ 2326.2223772, 'kof', "(
~first.ar(2);
~first.quant=4;
~first.fadeTime=2.2;
~first={
  //         |       |       |       |       |  
  var pat = [1,0,0,0,1,0,0,0,1,0,0,0,1,1,1,1].rotate(3);
  var imp = PulseDivider.kr(~tick.kr,fib(16),~counter.kr);
  var hit = Select.kr(PulseCount.kr(imp)%pat.size,pat);
  var env = EnvGen.ar(Env([0.001,1,0.001],[0.002,0.15],[3,-3],curve:'exp'),imp * hit);
    var sig = Mix.ar(SinOsc.ar(16000/[1,2,4,8,16,32,64]/1.25-(env*100)+(1..8),SinOsc.ar(5))) * LFPulse.ar(8000*fib(4));
  sig = sig * env;
  Splay.ar(sig,0.75,0.95);
};
~first.play;
);" ], [ 2322.4123719, 'alex', "~c[1]=\\set->Pbind(\\args, [\\freq], \\dur, 4, \\freq,Pseq([Pseq([220,240,260,220,240,220,260]+400,4), Pn(650,4)],inf));" ], [ 2320.2623689, 'kof', "(
~first.ar(2);
~first.quant=4;
~first.fadeTime=2.2;
~first={
  //         |       |       |       |       |  
  var pat = [1,0,0,0,1,0,0,0,1,0,0,0,1,1,1,1].rotate(3);
  var imp = PulseDivider.kr(~tick.kr,fib(16),~counter.kr);
  var hit = Select.kr(PulseCount.kr(imp)%pat.size,pat);
  var env = EnvGen.ar(Env([0.001,1,0.001],[0.002,0.15],[3,-3],curve:'exp'),imp * hit);
    var sig = Mix.ar(SinOsc.ar(16000/[1,2,4,8,16,32,64]/1.5-(env*100)+(1..8),SinOsc.ar(5))) * LFPulse.ar(8000*fib(4));
  sig = sig * env;
  Splay.ar(sig,0.75,0.95);
};
~first.play;
);" ], [ 2315.8263289, 'joach', "(
~saw8[4] = \\set -> QuantEnv(\\freq, 4)
.phase(1, [60,66,60], [0.5, 0.25], [\\sin,\\sin], 0, 4)
.phase(2, [170,176,170], [2, 6], [2,-2], 0, 1)
.play([1,2]);
)" ], [ 2314.7423271, 'kof', "(
~first.ar(2);
~first.quant=4;
~first.fadeTime=2.2;
~first={
  //         |       |       |       |       |  
  var pat = [1,0,0,0,1,0,0,0,1,0,0,0,1,1,1,1].rotate(3);
  var imp = PulseDivider.kr(~tick.kr,fib(16),~counter.kr);
  var hit = Select.kr(PulseCount.kr(imp)%pat.size,pat);
  var env = EnvGen.ar(Env([0.001,1,0.001],[0.002,0.15],[3,-3],curve:'exp'),imp * hit);
    var sig = Mix.ar(SinOsc.ar(16000/[1,2,4,8,16,32,64]-(env*100)+(1..8),SinOsc.ar(5))) * LFPulse.ar(8000*fib(4));
  sig = sig * env;
  Splay.ar(sig,0.75,0.95);
};
~first.play;
);" ], [ 2313.9923261, 'alex', "~c[1]=\\set->Pbind(\\args, [\\freq], \\dur, 4, \\freq,Pseq([Pseq([220,240,260,220,240,220,260]+100,4), Pn(650,4)],inf));" ], [ 2308.6913186, 'kof', "(
~first.ar(2);
~first.quant=4;
~first.fadeTime=2.2;
~first={
  //         |       |       |       |       |  
  var pat = [1,0,0,0,1,0,0,0,1,0,0,0,1,1,1,1].rotate(3);
  var imp = PulseDivider.kr(~tick.kr,fib(16),~counter.kr);
  var hit = Select.kr(PulseCount.kr(imp)%pat.size,pat);
  var env = EnvGen.ar(Env([0.001,1,0.001],[0.002,0.15],[3,-3],curve:'exp'),imp * hit);
    var sig = Mix.ar(SinOsc.ar(16000/[1,2,4,8,16,32,64]-(env*100)+(1..8),SinOsc.ar(50))) * LFPulse.ar(8000*fib(4));
  sig = sig * env;
  Splay.ar(sig,0.75,0.95);
};
~first.play;
);" ], [ 2305.7313145, 'kof', "(
~first.ar(2);
~first.quant=4;
~first.fadeTime=2.2;
~first={
  //         |       |       |       |       |  
  var pat = [1,0,0,0,1,0,0,0,1,0,0,0,1,1,1,1].rotate(3);
  var imp = PulseDivider.kr(~tick.kr,fib(16),~counter.kr);
  var hit = Select.kr(PulseCount.kr(imp)%pat.size,pat);
  var env = EnvGen.ar(Env([0.001,1,0.001],[0.002,0.15],[3,-3],curve:'exp'),imp * hit);
    var sig = Mix.ar(SinOsc.ar(16000/[1,2,4,8,16,32,64]-(env*100)+(1..8),SinOsc.ar(500))) * LFPulse.ar(8000*fib(4));
  sig = sig * env;
  Splay.ar(sig,0.75,0.95);
};
~first.play;
);" ], [ 2303.3803111, 'alex', "~c[1]=\\set->Pbind(\\args, [\\freq], \\dur, 4, \\freq,Pseq([Pseq([220,240,260,220,240,220,260]+100,4), Pn(65,4)],inf));" ], [ 2300.8403076, 'alex', "~c[1]=\\set->Pbind(\\args, [\\freq], \\dur, 4, \\freq,Pseq([Pseq([220,240,260,220,240,220,260]+10,4), Pn(65,4)],inf));" ], [ 2292.7492644, 'joach', "(
~saw8[8] = \\set -> QuantEnv(\\mulgverb, 2)
.phase(1, [0,1,0], [0.05, 0.95], [2,-2], 0, 1)
.phase(2, [0,1,0], [0.35, 0.65], [2,-2], 0, 1)
.play([1,2]);
)" ], [ 2284.6382518, 'kof', "(
~first.ar(2);
~first.quant=4;
~first.fadeTime=2.2;
~first={
  //         |       |       |       |       |  
  var pat = [1,0,0,0,1,0,0,0,1,0,0,0,1,1,1,1].rotate(3);
  var imp = PulseDivider.kr(~tick.kr,fib(16),~counter.kr);
  var hit = Select.kr(PulseCount.kr(imp)%pat.size,pat);
  var env = EnvGen.ar(Env([0.001,1,0.001],[0.002,0.15],[3,-3],curve:'exp'),imp * hit);
    var sig = Mix.ar(SinOsc.ar(16000/[1,2,4,8,16,32,64]-(env*1000)+(1..8),SinOsc.ar(500))) * LFPulse.ar(8000*fib(4));
  sig = sig * env;
  Splay.ar(sig,0.75,0.95);
};
~first.play;
);" ], [ 2283.9882509, 'alex', "~c[1]=\\set->Pbind(\\args, [\\freq], \\dur, 4, \\freq,Pseq([Pseq([220,240,260,220,240,220,260],4), Pn(65,4)],inf));" ], [ 2276.801212, 'joach', "(
~saw8[8] = \\set -> QuantEnv(\\mulgverb, 1)
.phase(1, [0,1,0], [0.05, 0.95], [2,-2], 0, 1)
.phase(2, [0,1,0], [0.35, 0.65], [2,-2], 0, 1)
.play([1,2]);
)" ], [ 2272.0052011, 'kof', "(
~first.ar(2);
~first.quant=4;
~first.fadeTime=2.2;
~first={
  //         |       |       |       |       |  
  var pat = [1,0,0,0,1,0,0,0,1,0,0,0,1,1,1,1].rotate(3);
  var imp = PulseDivider.kr(~tick.kr,fib(16),~counter.kr);
  var hit = Select.kr(PulseCount.kr(imp)%pat.size,pat);
  var env = EnvGen.ar(Env([0.001,1,0.001],[0.002,0.15],[3,-3],curve:'exp'),imp * hit);
    var sig = Mix.ar(SinOsc.ar(16000/[1,2,4,8]-(env*1000)+(1..8),SinOsc.ar(500))) * LFPulse.ar(8000*fib(4));
  sig = sig * env;
  Splay.ar(sig,0.75,0.95);
};
~first.play;
);" ], [ 2262.675188, 'kof', "(
~first.ar(2);
~first.quant=4;
~first.fadeTime=2.2;
~first={
  //         |       |       |       |       |  
  var pat = [1,0,0,0,1,0,0,0,1,0,0,0,1,1,1,1].rotate(3);
  var imp = PulseDivider.kr(~tick.kr,fib(16),~counter.kr);
  var hit = Select.kr(PulseCount.kr(imp)%pat.size,pat);
  var env = EnvGen.ar(Env([0.001,1,0.001],[0.002,0.15],[3,-3],curve:'exp'),imp * hit);
    var sig = Mix.ar(SinOsc.ar(16000/[1]-(env*1000)+(1..8),SinOsc.ar(500))) * LFPulse.ar(8000*fib(4));
  sig = sig * env;
  Splay.ar(sig,0.75,0.95);
};
~first.play;
);" ], [ 2261.1751552, 'joach', "~saw8[3] = \\filter -> {|in| GVerb.ar(in, \\gverb_size.kr(6), \\gverb_time.kr(0.26), 0.9, mul:\\mulgverb.kr(1)) };" ], [ 2259.3161192, 'joach', "~saw8[3] = \\filter -> {|in| GVerb.ar(in, \\gverb_size.kr(16), \\gverb_time.kr(0.26), 0.9, mul:\\mulgverb.kr(1)) };" ], [ 2257.7091143, 'alex', "~c[30]=\\filter-> {arg in; GVerb.ar(in,[20,10],2,add:in)};" ], [ 2252.7391073, 'kof', "(
~first.ar(2);
~first.quant=4;
~first.fadeTime=2.2;
~first={
  //         |       |       |       |       |  
  var pat = [1,0,0,0,1,0,0,0,1,0,0,0,1,1,1,1].rotate(3);
  var imp = PulseDivider.kr(~tick.kr,fib(16),~counter.kr);
  var hit = Select.kr(PulseCount.kr(imp)%pat.size,pat);
  var env = EnvGen.ar(Env([0.001,1,0.001],[0.002,0.15],[3,-3],curve:'exp'),imp * hit);
  var sig = Mix.ar(SinOsc.ar(16000/2-(env*1000)+(1..8),SinOsc.ar(500))) * LFPulse.ar(8000*fib(4));
  sig = sig * env;
  Splay.ar(sig,0.75,0.95);
};
~first.play;
);" ], [ 2248.7290688, 'joach', "~saw8.set(\\lpf_freq, 8800);" ], [ 2248.5170684, 'alex', "~c.play(vol:1.5, fadeTime:2).quant_(2);" ], [ 2237.4670529, 'alex', "~c.play(vol:1, fadeTime:2).quant_(2);" ], [ 2232.3270457, 'alex', "~c.play(vol:0.7, fadeTime:2).quant_(2);" ], [ 2219.5260278, 'alex', "~c.play(vol:0.5, fadeTime:2).quant_(2);" ], [ 2214.4950207, 'alex', "~c.play(vol:0.1, fadeTime:2).quant_(2);" ], [ 2213.4509877, 'joach', "(
~saw8[1] = \\set -> QuantEnv(\\amp, 1)
.phase(1, [0,1,0], [0.05, 0.45], [2,-2], 0, 4)
.phase(2, [0,1,0.1,0.4,0], [0.15, 0.25, 0.1], [2,\\step, -2], 0, 1)
.play([1,2]);
)" ], [ 2211.5539836, 'alex', "~c[30]=\\filter-> {arg in; GVerb.ar(in,[20,10],[4,6],add:in)};" ], [ 2209.4109486, 'joach', "(
~saw8[1] = \\set -> QuantEnv(\\amp, 0.5)
.phase(1, [0,1,0], [0.05, 0.45], [2,-2], 0, 4)
.phase(2, [0,1,0.1,0.4,0], [0.15, 0.25, 0.1], [2,\\step, -2], 0, 1)
.play([1,2]);
)" ], [ 2209.139947, 'alex', "~c[3]=\\set->Pbind(\\args, [\\top], \\dur, 4, \\top, 4 );" ], [ 2208.369946, 'alex', "~c[2]=\\set->Pbind(\\args, [\\trig], \\dur, Pseq([Pn(0.5,4),Rest(4)],inf), \\trig, 1);" ], [ 2207.1699443, 'alex', "~c[1]=\\set->Pbind(\\args, [\\freq], \\dur, 4, \\freq,Pseq([Pseq([165,145,147,142,132],4), Pn(65,4)],inf));" ], [ 2204.7299409, 'kof', "(
~kick.ar(2);
~kick.quant=2;
~kick.fadeTime=0.2;
~kick={
  //         |       |       |       |       |  
  var pat = [1,0,0,0,1,0,0,0,1,0,0,0,1,0,0,0].rotate(1);
  var imp = PulseDivider.kr(~tick.kr,1,~counter.kr);
  var hit = Select.kr(PulseCount.kr(imp)%pat.size,pat);
  var env = EnvGen.ar(Env([0.001,1,0.001],[0.002,1.5],[3,-3],curve:'exp'),imp * hit);
    var sig = SinOsc.ar(50+(env**100*100)) + Pulse.ar(4);
  sig = sig * env;
  Splay.ar(sig,0.75,0.95);
};
~kick.play;
);" ], [ 2203.8999397, 'alex', "(

~c[0]={
	var sig, env, fenv;

	env=EnvGen.kr(Env([0,1,0], [0.01,0.25], [\\welch, \\step]), \\trig.tr);
	fenv=EnvGen.kr(Env([\\freq.kr,\\freq.kr*\\top.kr(4),\\freq.kr], [0.01,0.04], \\welch), \\trig.tr);

	sig=LFPulse.ar(\\freq.kr!2).lag([0.001,0.002])*env;


};
)" ], [ 2201.8099368, 'alex', "~c[2]=\\set->Pbind(\\args, [\\trig], \\dur, Pseq([Pn(0.5,4),Rest(4)],inf), \\trig, 1);" ], [ 2200.6809023, 'joach', "~saw8.set(\\lpf_freq, 4800);" ], [ 2188.4788851, 'kof', "(
~first.ar(2);
~first.quant=4;
~first.fadeTime=2.2;
~first={
  //         |       |       |       |       |  
  var pat = [1,0,0,0,1,0,0,0,1,0,0,0,1,0,0,0].rotate(3);
  var imp = PulseDivider.kr(~tick.kr,fib(16),~counter.kr);
  var hit = Select.kr(PulseCount.kr(imp)%pat.size,pat);
  var env = EnvGen.ar(Env([0.001,1,0.001],[0.002,0.15],[3,-3],curve:'exp'),imp * hit);
  var sig = Mix.ar(SinOsc.ar(16000-(env*1000)+(1..8),SinOsc.ar(500))) * LFPulse.ar(8000*fib(4));
  sig = sig * env;
  Splay.ar(sig,0.75,0.95);
};
~first.play;
);" ], [ 2183.7458454, 'joach', "(
~saw8[1] = \\set -> QuantEnv(\\amp, 1)
.phase(1, [0,1,0], [0.05, 0.45], [2,-2], 0, 4)
.phase(2, [0,1,0.1,0.4,0], [0.15, 0.25, 0.1], [2,\\step, -2], 0, 1)
.play([1,2]);
)" ], [ 2170.7858273, 'kof', "(
  p.clock.tempo_(120/60);
  
  ~offset = (0..7)/8;
  
  ~tick.quant = 1;
  ~tick = {Mix(Impulse.kr( ~tempo / 2 , ~offset ))};
  
  ~counter = {PulseCount.kr(~tick.kr)};
);" ], [ 2169.7458258, 'alex', "(\"change the tempo\").postln;" ], [ 2161.1558138, 'kof', "(
~first.ar(2);
~first.quant=4;
~first.fadeTime=2.2;
~first={
  //         |       |       |       |       |  
  var pat = [1,0,0,0,1,0,0,0,1,0,0,0,1,0,0,0].rotate(3);
  var imp = PulseDivider.kr(~tick.kr,fib(4),~counter.kr);
  var hit = Select.kr(PulseCount.kr(imp)%pat.size,pat);
  var env = EnvGen.ar(Env([0.001,1,0.001],[0.002,0.15],[3,-3],curve:'exp'),imp * hit);
  var sig = Mix.ar(SinOsc.ar(16000-(env*1000)+(1..8),SinOsc.ar(500))) * LFPulse.ar(8000*fib(4));
  sig = sig * env;
  Splay.ar(sig,0.75,0.95);
};
~first.play;
);" ], [ 2160.1058123, 'alex', "(\"change the tempo\").postln;" ], [ 2153.0627716, 'joach', "(
~saw8[7] = \\set -> QuantEnv(\\fplus, 0.25)
.phase(1, [0,260,0], [0.005, 0.095], [8,-8], 0, 8)
.phase(2, [0,188,0], [0.015, 0.165], [8,-8], 0, 1)
.play([1,2]);
)" ], [ 2152.7087681, 'kof', "(
~first.ar(2);
~first.quant=4;
~first.fadeTime=2.2;
~first={
  //         |       |       |       |       |  
  var pat = [1,0,0,0,1,0,0,0,1,0,0,0,1,0,0,0].rotate(3);
  var imp = PulseDivider.kr(~tick.kr,fib(4),~counter.kr);
  var hit = Select.kr(PulseCount.kr(imp)%pat.size,pat);
  var env = EnvGen.ar(Env([0.001,1,0.001],[0.002,0.05],[3,-3],curve:'exp'),imp * hit);
  var sig = Mix.ar(SinOsc.ar(16000-(env*1000)+(1..8),SinOsc.ar(500))) * LFPulse.ar(8000*fib(4));
  sig = sig * env;
  Splay.ar(sig,0.75,0.95);
};
~first.play;
);" ], [ 2148.7687626, 'kof', "(
~first.ar(2);
~first.quant=4;
~first.fadeTime=2.2;
~first={
  //         |       |       |       |       |  
  var pat = [1,0,0,0,1,0,0,0,1,0,0,0,1,0,0,0].rotate(3);
  var imp = PulseDivider.kr(~tick.kr,fib(4),~counter.kr);
  var hit = Select.kr(PulseCount.kr(imp)%pat.size,pat);
  var env = EnvGen.ar(Env([0.001,1,0.001],[0.002,1.5],[3,-3],curve:'exp'),imp * hit);
  var sig = Mix.ar(SinOsc.ar(16000-(env*1000)+(1..8),SinOsc.ar(500))) * LFPulse.ar(8000*fib(4));
  sig = sig * env;
  Splay.ar(sig,0.75,0.95);
};
~first.play;
);" ], [ 2148.0417322, 'joach', "~saw8[3] = \\filter -> {|in| GVerb.ar(in, \\gverb_size.kr(6), \\gverb_time.kr(0.26), 0.9, mul:\\mulgverb.kr(1)) };" ], [ 2146.2887262, 'kof', "(
~first.ar(2);
~first.quant=4;
~first.fadeTime=2.2;
~first={
  //         |       |       |       |       |  
  var pat = [1,0,0,0,1,0,0,0,1,0,0,0,1,0,0,0].rotate(3);
  var imp = PulseDivider.kr(~tick.kr,fib(4),~counter.kr);
  var hit = Select.kr(PulseCount.kr(imp)%pat.size,pat);
  var env = EnvGen.ar(Env([0.001,1,0.001],[0.002,1.5],[3,-3],curve:'exp'),imp * hit);
  var sig = Mix.ar(SinOsc.ar(16000-(env*1000)+(1..8),SinOsc.ar(500))) * LFPulse.ar(800*fib(4));
  sig = sig * env;
  Splay.ar(sig,0.75,0.95);
};
~first.play;
);" ], [ 2142.6487211, 'kof', "(
~first.ar(2);
~first.quant=4;
~first.fadeTime=2.2;
~first={
  //         |       |       |       |       |  
  var pat = [1,0,0,0,1,0,0,0,1,0,0,0,1,0,0,0].rotate(3);
  var imp = PulseDivider.kr(~tick.kr,fib(4),~counter.kr);
  var hit = Select.kr(PulseCount.kr(imp)%pat.size,pat);
  var env = EnvGen.ar(Env([0.001,1,0.001],[0.002,1.5],[3,-3],curve:'exp'),imp * hit);
  var sig = Mix.ar(SinOsc.ar(16000-(env*1000)+(1..8),SinOsc.ar(500))) * LFPulse.ar(8000*fib(4));
  sig = sig * env;
  Splay.ar(sig,0.75,0.95);
};
~first.play;
);" ], [ 2141.178719, 'alex', "(\"change the tempo\").postln;" ], [ 2141.0687189, 'alex', "(\"change the tempo\").postln;" ], [ 2140.8587186, 'alex', "(\"change the tempo\").postln;" ], [ 2140.747715, 'alex', "(\"change the tempo\").postln;" ], [ 2140.5317027, 'alex', "(\"change the tempo\").postln;" ], [ 2140.2866887, 'joach', "~saw8[3] = \\filter -> {|in| GVerb.ar(in, \\gverb_size.kr(16), \\gverb_time.kr(0.26), 0.9, mul:\\mulgverb.kr(1)) };" ], [ 2140.2086848, 'alex', "(\"change the tempo\").postln;" ], [ 2139.5386838, 'alex', "(\"change the tempo\").postln;" ], [ 2139.3486836, 'kof', "(
~first.ar(2);
~first.quant=4;
~first.fadeTime=2.2;
~first={
  //         |       |       |       |       |  
  var pat = [1,0,0,0,1,0,0,0,1,0,0,0,1,0,0,0].rotate(3);
  var imp = PulseDivider.kr(~tick.kr,fib(4),~counter.kr);
  var hit = Select.kr(PulseCount.kr(imp)%pat.size,pat);
  var env = EnvGen.ar(Env([0.001,1,0.001],[0.002,1.5],[3,-3],curve:'exp'),imp * hit);
  var sig = Mix.ar(SinOsc.ar(16000-(env*1000)+(1..8),SinOsc.ar(500))) * LFPulse.ar(800*fib(4));
  sig = sig * env;
  Splay.ar(sig,0.75,0.95);
};
~first.play;
);" ], [ 2139.1186832, 'alex', "(\"change the tempo\").postln;" ], [ 2138.6686826, 'alex', "(\"change the tempo\").postln;" ], [ 2138.1186818, 'alex', "(\"change the tempo\").postln;" ], [ 2137.3586808, 'alex', "(\"change the tempo\").postln;" ], [ 2136.3886794, 'kof', "(
~first.ar(2);
~first.quant=4;
~first.fadeTime=2.2;
~first={
  //         |       |       |       |       |  
  var pat = [1,0,0,0,1,0,0,0,1,0,0,0,1,0,0,0].rotate(3);
  var imp = PulseDivider.kr(~tick.kr,fib(4),~counter.kr);
  var hit = Select.kr(PulseCount.kr(imp)%pat.size,pat);
  var env = EnvGen.ar(Env([0.001,1,0.001],[0.002,1.5],[3,-3],curve:'exp'),imp * hit);
  var sig = Mix.ar(SinOsc.ar(16000-(env*1000)+(1..8),SinOsc.ar(500))) * LFPulse.ar(80*fib(4));
  sig = sig * env;
  Splay.ar(sig,0.75,0.95);
};
~first.play;
);" ], [ 2133.9546462, 'joach', "(
~saw8[7] = \\set -> QuantEnv(\\fplus, 0.25)
.phase(1, [0,160,0], [0.005, 0.095], [8,-8], 0, 8)
.phase(2, [0,188,0], [0.015, 0.165], [8,-8], 0, 1)
.play([1,2]);
)" ], [ 2132.1076404, 'kof', "(
~first.ar(2);
~first.quant=4;
~first.fadeTime=2.2;
~first={
  //         |       |       |       |       |  
  var pat = [1,0,0,0,1,0,0,0,1,0,0,0,1,0,0,0].rotate(3);
  var imp = PulseDivider.kr(~tick.kr,fib(4),~counter.kr);
  var hit = Select.kr(PulseCount.kr(imp)%pat.size,pat);
  var env = EnvGen.ar(Env([0.001,1,0.001],[0.002,1.5],[3,-3],curve:'exp'),imp * hit);
  var sig = Mix.ar(SinOsc.ar(16000-(env*1000)+(1..8),SinOsc.ar(500))) * LFPulse.ar(8*fib(4));
  sig = sig * env;
  Splay.ar(sig,0.75,0.95);
};
~first.play;
);" ], [ 2128.6046047, 'joach', "(
~saw8[7] = \\set -> QuantEnv(\\fplus, 0.25)
.phase(1, [0,460,0], [0.005, 0.095], [8,-8], 0, 8)
.phase(2, [0,188,0], [0.015, 0.165], [8,-8], 0, 1)
.play([1,2]);
)" ], [ 2127.3946008, 'kof', "(
~first.ar(2);
~first.quant=4;
~first.fadeTime=2.2;
~first={
  //         |       |       |       |       |  
  var pat = [1,0,0,0,1,0,0,0,1,0,0,0,1,0,0,0].rotate(3);
  var imp = PulseDivider.kr(~tick.kr,fib(4),~counter.kr);
  var hit = Select.kr(PulseCount.kr(imp)%pat.size,pat);
  var env = EnvGen.ar(Env([0.001,1,0.001],[0.002,1.5],[3,-3],curve:'exp'),imp * hit);
  var sig = Mix.ar(SinOsc.ar(16000-(env*1000)+(1..8),SinOsc.ar(50))) * LFPulse.ar(8*fib(4));
  sig = sig * env;
  Splay.ar(sig,0.75,0.95);
};
~first.play;
);" ], [ 2125.5245981, 'alex', "~c.clear(fadeTime:2);" ], [ 2123.5545954, 'kof', "(
~first.ar(2);
~first.quant=4;
~first.fadeTime=2.2;
~first={
  //         |       |       |       |       |  
  var pat = [1,0,0,0,1,0,0,0,1,0,0,0,1,0,0,0].rotate(3);
  var imp = PulseDivider.kr(~tick.kr,fib(4),~counter.kr);
  var hit = Select.kr(PulseCount.kr(imp)%pat.size,pat);
  var env = EnvGen.ar(Env([0.001,1,0.001],[0.002,1.5],[3,-3],curve:'exp'),imp * hit);
  var sig = Mix.ar(SinOsc.ar(16000-(env*1000)+(1..8),SinOsc.ar(50))) * LFPulse.ar(8*fib(4));
  sig = sig * env;
  Splay.ar(sig,0.75,0.95);
};
~first.play;
);" ], [ 2123.4545952, 'alex', "~c.play(vol:0.1, fadeTime:2).quant_(2);" ], [ 2121.0645629, 'joach', "~saw8[5] = nil;" ], [ 2119.7375562, 'alex', "~c.play(vol:0.2, fadeTime:2).quant_(2);" ], [ 2118.7975548, 'kof', "(
~first.ar(2);
~first.quant=4;
~first.fadeTime=2.2;
~first={
  //         |       |       |       |       |  
  var pat = [1,0,0,0,1,0,0,0,1,0,0,0,1,0,0,0].rotate(3);
  var imp = PulseDivider.kr(~tick.kr,fib(4),~counter.kr);
  var hit = Select.kr(PulseCount.kr(imp)%pat.size,pat);
  var env = EnvGen.ar(Env([0.001,1,0.001],[0.002,1.5],[3,-3],curve:'exp'),imp * hit);
  var sig = Mix.ar(SinOsc.ar(16000-(env*1000)+(1..80),SinOsc.ar(50))) * LFPulse.ar(8*fib(4));
  sig = sig * env;
  Splay.ar(sig,0.75,0.95);
};
~first.play;
);" ], [ 2113.3875473, 'alex', "~c.play(vol:0.5, fadeTime:2).quant_(2);" ], [ 2111.1075441, 'kof', "(
~first.ar(2);
~first.quant=4;
~first.fadeTime=2.2;
~first={
  //         |       |       |       |       |  
  var pat = [1,0,0,0,1,0,0,0,1,0,0,0,1,0,0,0].rotate(3);
  var imp = PulseDivider.kr(~tick.kr,fib(4),~counter.kr);
  var hit = Select.kr(PulseCount.kr(imp)%pat.size,pat);
  var env = EnvGen.ar(Env([0.001,1,0.001],[0.002,1.5],[3,-3],curve:'exp'),imp * hit);
  var sig = Mix.ar(SinOsc.ar(16000-(env*1000)+(1..8),SinOsc.ar(50))) * LFPulse.ar(8*fib(4));
  sig = sig * env;
  Splay.ar(sig,0.75,0.95);
};
~first.play;
);" ], [ 2107.5275391, 'kof', "(
~first.ar(2);
~first.quant=4;
~first.fadeTime=2.2;
~first={
  //         |       |       |       |       |  
  var pat = [1,0,0,0,1,0,0,0,1,0,0,0,1,0,0,0].rotate(3);
  var imp = PulseDivider.kr(~tick.kr,fib(4),~counter.kr);
  var hit = Select.kr(PulseCount.kr(imp)%pat.size,pat);
  var env = EnvGen.ar(Env([0.001,1,0.001],[0.002,1.5],[3,-3],curve:'exp'),imp * hit);
  var sig = Mix.ar(SinOsc.ar(16000-(env*10000)+(1..8),SinOsc.ar(50))) * LFPulse.ar(8*fib(4));
  sig = sig * env;
  Splay.ar(sig,0.75,0.95);
};
~first.play;
);" ], [ 2105.8475367, 'alex', "~c.play(vol:0.5, fadeTime:2).quant_(16);" ], [ 2103.5175335, 'alex', "~c[30]=\\filter-> {arg in; GVerb.ar(in,[20,10],[4,6],add:in)};" ], [ 2103.3275332, 'kof', "(
~first.ar(2);
~first.quant=4;
~first.fadeTime=2.2;
~first={
  //         |       |       |       |       |  
  var pat = [1,0,0,0,1,0,0,0,1,0,0,0,1,0,0,0].rotate(3);
  var imp = PulseDivider.kr(~tick.kr,fib(4),~counter.kr);
  var hit = Select.kr(PulseCount.kr(imp)%pat.size,pat);
  var env = EnvGen.ar(Env([0.001,1,0.001],[0.002,1.5],[3,-3],curve:'exp'),imp * hit);
  var sig = Mix.ar(SinOsc.ar(18000-(env*10000)+(1..8),SinOsc.ar(50))) * LFPulse.ar(8*fib(4));
  sig = sig * env;
  Splay.ar(sig,0.75,0.95);
};
~first.play;
);" ], [ 2101.4475306, 'alex', "~c[3]=\\set->Pbind(\\args, [\\top], \\dur, 16, \\top, 4 );" ], [ 2100.6675295, 'alex', "~c[2]=\\set->Pbind(\\args, [\\trig], \\dur, Pseq([Pn(0.5,4),0.25],inf), \\trig, 1);" ], [ 2099.6875281, 'alex', "~c[1]=\\set->Pbind(\\args, [\\freq], \\dur, 16, \\freq,Pseq([Pseq([165,145,147,142,132],4), Pn(65,4)],inf));" ], [ 2097.507525, 'alex', "(

~c[0]={
	var sig, env, fenv;

	env=EnvGen.kr(Env([0,1,0], [0.01,0.25], [\\welch, \\step]), \\trig.tr);
	fenv=EnvGen.kr(Env([\\freq.kr,\\freq.kr*\\top.kr(4),\\freq.kr], [0.01,0.04], \\welch), \\trig.tr);

	sig=LFPulse.ar(\\freq.kr!2).lag([0.001,0.002])*env;


};
)" ], [ 2097.1975246, 'kof', "(
~first.ar(2);
~first.quant=4;
~first.fadeTime=2.2;
~first={
  //         |       |       |       |       |  
  var pat = [1,0,0,0,1,0,0,0,1,0,0,0,1,0,0,0].rotate(3);
  var imp = PulseDivider.kr(~tick.kr,fib(4),~counter.kr);
  var hit = Select.kr(PulseCount.kr(imp)%pat.size,pat);
  var env = EnvGen.ar(Env([0.001,1,0.001],[0.002,1.5],[3,-3],curve:'exp'),imp * hit);
  var sig = Mix.ar(SinOsc.ar(18000-(env*10000)+(1..8),SinOsc.ar(5))) * LFPulse.ar(8*fib(4));
  sig = sig * env;
  Splay.ar(sig,0.75,0.95);
};
~first.play;
);" ], [ 2095.307522, 'alex', "~c.play(vol:0.5, fadeTime:2).quant_(16);" ], [ 2092.7975184, 'alex', "~c[30]=\\filter-> {arg in; GVerb.ar(in,[20,10],[4,6],add:in)};" ], [ 2091.6964839, 'joach', "(
~saw8[7] = \\set -> QuantEnv(\\fplus, 0.25)
.phase(1, [0,160,0], [0.005, 0.095], [8,-8], 0, 8)
.phase(2, [0,188,0], [0.015, 0.165], [8,-8], 0, 1)
.play([1,2]);
)" ], [ 2089.2894489, 'joach', "(
~saw8[7] = \\set -> QuantEnv(\\fplus, 0.25)
.phase(1, [0,160,0], [0.005, 0.095], [8,-8], 0, 8)
.phase(2, [0,1880,0], [0.015, 0.165], [8,-8], 0, 1)
.play([1,2]);
)" ], [ 2088.4654464, 'kof', "(
~first.ar(2);
~first.quant=4;
~first.fadeTime=2.2;
~first={
  //         |       |       |       |       |  
  var pat = [1,0,0,0,1,0,0,0,1,0,0,0,1,0,0,0].rotate(3);
  var imp = PulseDivider.kr(~tick.kr,fib(4),~counter.kr);
  var hit = Select.kr(PulseCount.kr(imp)%pat.size,pat);
  var env = EnvGen.ar(Env([0.001,1,0.001],[0.002,1.5],[3,-3],curve:'exp'),imp * hit);
  var sig = Mix.ar(SinOsc.ar(18000-(env*10000)+(1..8),SinOsc.ar(5))) * LFPulse.ar(8*fib(4));
  sig = sig * env;
  Splay.ar(sig,0.75,0.95);
};
~first.play;
);" ], [ 2080.2554349, 'kof', "(
~first.ar(2);
~first.quant=4;
~first.fadeTime=2.2;
~first={
  //         |       |       |       |       |  
  var pat = [1,0,0,0,1,0,0,0,1,0,0,0,1,0,0,0].rotate(3);
  var imp = PulseDivider.kr(~tick.kr,fib(4),~counter.kr);
  var hit = Select.kr(PulseCount.kr(imp)%pat.size,pat);
  var env = EnvGen.ar(Env([0.001,1,0.001],[0.002,1.5],[3,-3],curve:'exp'),imp * hit);
  var sig = Mix.ar(SinOsc.ar(18000-(env*1000)+(1..8),SinOsc.ar(5))) * LFPulse.ar(8*fib(4));
  sig = sig * env;
  Splay.ar(sig,0.75,0.95);
};
~first.play;
);" ], [ 2078.895433, 'alex', "~c.clear(fadeTime:2);" ], [ 2076.4063989, 'joach', "~saw8.play(vol: 0.9, fadeTime: 16);" ], [ 2074.5323816, 'alex', "~c.play(vol:0.5, fadeTime:2).quant_(16);" ], [ 2074.2233639, 'joach', "(
~saw8[7] = \\set -> QuantEnv(\\fplus, 0.5)
.phase(1, [0,1600,0], [0.005, 0.095], [8,-8], 0, 8)
.phase(2, [0,1880,0], [0.015, 0.165], [8,-8], 0, 1)
.play([1,2]);
)" ], [ 2070.1533548, 'kof', "(
~first.ar(2);
~first.quant=4;
~first.fadeTime=2.2;
~first={
  //         |       |       |       |       |  
  var pat = [1,0,0,0,1,0,0,0,1,0,0,0,1,0,0,0].rotate(3);
  var imp = PulseDivider.kr(~tick.kr,fib(4),~counter.kr);
  var hit = Select.kr(PulseCount.kr(imp)%pat.size,pat);
  var env = EnvGen.ar(Env([0.001,1,0.001],[0.002,1.5],[3,-3],curve:'exp'),imp * hit);
  var sig = Mix.ar(SinOsc.ar(18000-(env*1000)+(1..8),SinOsc.ar(50))) * LFPulse.ar(8*fib(4));
  sig = sig * env;
  Splay.ar(sig,0.75,0.95);
};
~first.play;
);" ], [ 2068.21832, 'joach', "(
~saw8[6] = \\set -> QuantEnv(\\pan, 1)
.phase(1, [-0.2,0.2,0.2], [0.45, 0.45], [2,-2], 0, 1)
.phase(2, [-0.8,0.8,0.8], [0.35, 0.65], [2,-2], 0, 1)
.play([1]);
)" ], [ 2060.7902802, 'joach', "~saw8[5] = nil;" ], [ 2059.2152727, 'kof', "(
~first.ar(2);
~first.quant=4;
~first.fadeTime=2.2;
~first={
  //         |       |       |       |       |  
  var pat = [1,0,0,0,1,0,0,0,1,0,0,0,1,0,0,0].rotate(3);
  var imp = PulseDivider.kr(~tick.kr,2*fib(4),~counter.kr);
  var hit = Select.kr(PulseCount.kr(imp)%pat.size,pat);
  var env = EnvGen.ar(Env([0.001,1,0.001],[0.002,1.5],[3,-3],curve:'exp'),imp * hit);
  var sig = Mix.ar(SinOsc.ar(18000-(env*1000)+(1..8),SinOsc.ar(50))) * LFPulse.ar(8*fib(4));
  sig = sig * env;
  Splay.ar(sig,0.75,0.95);
};
~first.play;
);" ], [ 2055.9882365, 'joach', "~saw8[3] = \\filter -> {|in| GVerb.ar(in, \\gverb_size.kr(16), \\gverb_time.kr(0.66), 0.9, mul:\\mulgverb.kr(1)) };" ], [ 2053.5842011, 'joach', "~saw8.set(\\lpf_freq, 800);" ], [ 2049.4321623, 'joach', "(
~saw8[1] = \\set -> QuantEnv(\\amp, 0.5)
.phase(1, [0,1,0], [0.05, 0.45], [2,-2], 0, 4)
.phase(2, [0,1,0.1,0.4,0], [0.15, 0.25, 0.1], [2,\\step, -2], 0, 1)
.play([1,2]);
)" ], [ 2047.5141575, 'alex', "currentEnvironment.postln;" ], [ 2045.9441553, 'kof', "(
~first.ar(2);
~first.quant=4;
~first.fadeTime=2.2;
~first={
  //         |       |       |       |       |  
  var pat = [1,0,0,0,1,0,0,0,1,0,0,0,1,0,0,0].rotate(3);
  var imp = PulseDivider.kr(~tick.kr,2*fib(4),~counter.kr);
  var hit = Select.kr(PulseCount.kr(imp)%pat.size,pat);
  var env = EnvGen.ar(Env([0.001,1,0.001],[0.002,1.5],[3,-3],curve:'exp'),imp * hit);
  var sig = Mix.ar(SinOsc.ar(18000+(env*100)+(1..8),SinOsc.ar(50))) * LFPulse.ar(8*fib(4));
  sig = sig * env;
  Splay.ar(sig,0.75,0.95);
};
~first.play;
);" ], [ 2034.6121393, 'alex', "~c[30]=\\filter-> {arg in; GVerb.ar(in,[20,40],[4,6],add:in)};" ], [ 2031.8721355, 'alex', "~c[29]=nil;" ], [ 2026.7210953, 'joach', "(
~saw8[1] = \\set -> QuantEnv(\\amp, 0.5)
.phase(1, [0,1,0], [0.05, 0.45], [2,-2], 0, 4)
.phase(2, [0,1,0.1,0.4,0], [0.25, 0.75], [2,\\step, -2], 0, 1)
.play([1,2]);
)" ], [ 2025.1710931, 'kof', "(
~first.ar(2);
~first.quant=4;
~first.fadeTime=2.2;
~first={
  //         |       |       |       |       |  
  var pat = [1,0,0,0,1,0,0,0,1,0,0,0,1,0,0,0].rotate(3);
    var imp = PulseDivider.kr(~tick.kr,2*fib(4),~counter.kr);
  var hit = Select.kr(PulseCount.kr(imp)%pat.size,pat);
  var env = EnvGen.ar(Env([0.001,1,0.001],[0.002,1.5],[3,-3],curve:'exp'),imp * hit);
    var sig = Mix.ar(SinOsc.ar(18000+(env*100)+(1..8),SinOsc.ar(50))) * LFPulse.ar(8*fib(4));
  sig = sig * env;
  Splay.ar(sig,0.75,0.5);
};
~first.play;
);" ], [ 2021.4900879, 'alex', "~c[30]=\\filter-> {arg in; GVerb.ar(in,[20,40],[4,6],add:in)};" ], [ 2021.3000876, 'kof', "~kick.clear;" ], [ 2015.0300788, 'alex', "~c.play(vol:1, fadeTime:2).quant_(16);" ], [ 2009.2900708, 'kof', "(
~kick.ar(2);
~kick.quant=2;
~kick.fadeTime=0.2;
~kick={
  //         |       |       |       |       |  
  var pat = [1,0,0,0,1,0,0,0,1,0,0,0,1,0,0,0].rotate(1);
  var imp = PulseDivider.kr(~tick.kr,2,~counter.kr);
  var hit = Select.kr(PulseCount.kr(imp)%pat.size,pat);
  var env = EnvGen.ar(Env([0.001,1,0.001],[0.002,1.5],[3,-3],curve:'exp'),imp * hit);
    var sig = SinOsc.ar(50+(env**10*100)) + Pulse.ar(4);
  sig = sig * env;
  Splay.ar(sig,0.75,0.95);
};
~kick.play;
);" ], [ 2003.2900624, 'kof', "(
~kick.ar(2);
~kick.quant=2;
~kick.fadeTime=0.2;
~kick={
  //         |       |       |       |       |  
  var pat = [1,0,0,0,1,0,0,0,1,0,0,0,1,0,0,0].rotate(1);
  var imp = PulseDivider.kr(~tick.kr,8,~counter.kr);
  var hit = Select.kr(PulseCount.kr(imp)%pat.size,pat);
  var env = EnvGen.ar(Env([0.001,1,0.001],[0.002,1.5],[3,-3],curve:'exp'),imp * hit);
    var sig = SinOsc.ar(50+(env**10*100)) + Pulse.ar(4);
  sig = sig * env;
  Splay.ar(sig,0.75,0.95);
};
~kick.play;
);" ], [ 1998.1070232, 'joach', "~saw8.stop(8);" ], [ 1994.8680176, 'alex', "~c.play(vol:0.8, fadeTime:2).quant_(16);" ], [ 1992.5980038, 'kof', "~bb.clear;" ], [ 1992.2129818, 'joach', "(
~saw8[7] = \\set -> QuantEnv(\\fplus, 0.5)
.phase(1, [0,1600,0], [0.005, 0.095], [8,-8], 0, 8)
.phase(2, [0,1880,0], [0.015, 0.165], [8,-8], 0, 1)
.play([1,2]);
)" ], [ 1990.0659778, 'alex', "~c[30]=\\filter-> {arg in; GVerb.ar(in,[60,40],[4,6],add:in)};" ], [ 1989.1859766, 'alex', "~c[29]=\\filter-> {arg in; CombN.ar(in,4,\\del.kr(0.5),2)};" ], [ 1987.6359744, 'alex', "~c[3]=\\set->Pbind(\\args, [\\top], \\dur, 16, \\top, 4 );" ], [ 1986.7559732, 'alex', "~c[2]=\\set->Pbind(\\args, [\\trig], \\dur, Pseq([Pn(0.5,4),0.25],inf), \\trig, 1);" ], [ 1985.7759718, 'alex', "~c[1]=\\set->Pbind(\\args, [\\freq], \\dur, 16, \\freq,Pseq([Pseq([165,145,147,142,132],4), Pn(65,4)],inf));" ], [ 1981.1949654, 'alex', "(
~c[0]={
	var sig, env, fenv;

	env=EnvGen.kr(Env([0,1,0], [0.01,0.25], [\\welch, \\step]), \\trig.tr);
	fenv=EnvGen.kr(Env([\\freq.kr,\\freq.kr*\\top.kr(4),\\freq.kr], [0.01,0.04], \\welch), \\trig.tr);

	sig=LFPulse.ar(\\freq.kr!2).lag([0.001,0.002])*env;


};
)" ], [ 1979.7739633, 'kof', "(
~bb.ar(2);
~bb.quant=2;
~bb.fadeTime=0.2;
~bb={
  //         |       |       |       |       |  
  var pat = [1,0,0,0,1,0,0,0,1,0,0,0,1,0,0,0].rotate(1);
  var imp = PulseDivider.kr(~tick.kr,1,~counter.kr);
  var hit = Select.kr(PulseCount.kr(~heart)%pat.size,pat);
  var env = EnvGen.ar(Env([0.001,1,0.001],[0.002,0.5],[3,-3],curve:'exp'),imp * hit);
  var sig = SinOsc.ar(5000!2);
  sig = sig * env;
  Splay.ar(sig,0.75,0.15);
};
~bb.play;
);" ], [ 1979.1079313, 'joach', "(
~saw8[7] = \\set -> QuantEnv(\\fplus, 0.5)
.phase(1, [0,1600,0], [0.005, 0.095], [8,-8], 0, 8)
.phase(2, [0,2880,0], [0.015, 0.165], [8,-8], 0, 1)
.play([1,2]);
)" ], [ 1976.0518955, 'joach', "(
~saw8[7] = \\set -> QuantEnv(\\fplus, 0.5)
.phase(1, [0,4600,0], [0.005, 0.095], [8,-8], 0, 8)
.phase(2, [0,2880,0], [0.015, 0.165], [8,-8], 0, 1)
.play([1,2]);
)" ], [ 1975.0468905, 'alex', "~c.play(vol:0.2, fadeTime:2).quant_(16);" ], [ 1970.8948845, 'alex', "~c[30]=\\filter-> {arg in; GVerb.ar(in,[60,40],[4,6],add:in)};" ], [ 1965.8978487, 'joach', "(
~saw8[7] = \\set -> QuantEnv(\\fplus, 0.5)
.phase(1, [0,1600,0], [0.005, 0.095], [8,-8], 0, 8)
.phase(2, [0,2880,0], [0.015, 0.165], [8,-8], 0, 1)
.play([1,2]);
)" ], [ 1965.3628438, 'alex', "~c[29]=\\filter-> {arg in; CombN.ar(in,4,\\del.kr(0.5),2)};" ], [ 1959.776806, 'joach', "(
~saw8[7] = \\set -> QuantEnv(\\fplus, 0.5)
.phase(1, [0,1600,0], [0.005, 0.145], [8,-8], 0, 8)
.phase(2, [0,2880,0], [0.015, 0.165], [8,-8], 0, 1)
.play([1,2]);
)" ], [ 1949.840789, 'kof', "~ff.clear;" ], [ 1947.7897861, 'kof', "~hiss.clear;" ], [ 1944.7107494, 'joach', "(
~saw8[7] = \\set -> QuantEnv(\\fplus, 0.5)
.phase(1, [0,1600,0], [0.005, 0.145], [2,-8], 0, 8)
.phase(2, [0,2880,0], [0.015, 0.165], [8,-8], 0, 1)
.play([1,2]);
)" ], [ 1944.0987479, 'kof', "~kick.clear;" ], [ 1941.4757441, 'kof', "(
~kick.ar(2);
~kick.quant=2;
~kick.fadeTime=0.2;
~kick={
  //         |       |       |       |       |  
  var pat = [1,0,0,0,1,0,0,0,1,0,0,0,1,0,0,0].rotate(1);
  var imp = PulseDivider.kr(~tick.kr,8,~counter.kr);
  var hit = Select.kr(PulseCount.kr(imp)%pat.size,pat);
  var env = EnvGen.ar(Env([0.001,1,0.001],[0.002,1.5],[3,-3],curve:'exp'),imp * hit);
    var sig = SinOsc.ar(50+(env**10*100)) + Pulse.ar(4);
  sig = sig * env;
  Splay.ar(sig,0.75,0.95);
};
~kick.play;
);" ], [ 1938.5937092, 'joach', "(
~saw8[7] = \\set -> QuantEnv(\\fplus, 0.5)
.phase(1, [0,1600,0], [0.005, 0.145], [2,-8], 0, 8)
.phase(2, [0,880,0], [0.015, 0.165], [8,-8], 0, 1)
.play([1,2]);
)" ], [ 1937.4187045, 'kof', "(
~kick.ar(2);
~kick.quant=2;
~kick.fadeTime=0.2;
~kick={
  //         |       |       |       |       |  
  var pat = [1,0,0,0,1,0,0,0,1,0,0,0,1,0,0,0].rotate(1);
  var imp = PulseDivider.kr(~tick.kr,2,~counter.kr);
  var hit = Select.kr(PulseCount.kr(imp)%pat.size,pat);
  var env = EnvGen.ar(Env([0.001,1,0.001],[0.002,1.5],[3,-3],curve:'exp'),imp * hit);
    var sig = SinOsc.ar(50+(env**10*100)) + Pulse.ar(4);
  sig = sig * env;
  Splay.ar(sig,0.75,0.95);
};
~kick.play;
);" ], [ 1932.6886979, 'kof', "(
~kick.ar(2);
~kick.quant=2;
~kick.fadeTime=0.2;
~kick={
  //         |       |       |       |       |  
  var pat = [1,0,0,0,1,0,0,0,1,0,0,0,1,0,0,0].rotate(1);
  var imp = PulseDivider.kr(~tick.kr,4,~counter.kr);
  var hit = Select.kr(PulseCount.kr(imp)%pat.size,pat);
  var env = EnvGen.ar(Env([0.001,1,0.001],[0.002,1.5],[3,-3],curve:'exp'),imp * hit);
    var sig = SinOsc.ar(50+(env**10*100)) + Pulse.ar(4);
  sig = sig * env;
  Splay.ar(sig,0.75,0.95);
};
~kick.play;
);" ], [ 1923.066672, 'kof', "(
  p.clock.tempo_(60/60);
  
  ~offset = (0..7)/8;
  
  ~tick.quant = 1;
  ~tick = {Mix(Impulse.kr( ~tempo / 2 , ~offset ))};
  
  ~counter = {PulseCount.kr(~tick.kr)};
);" ], [ 1922.7606545, 'joach', "(
~saw8[7] = \\set -> QuantEnv(\\fplus, 1)
.phase(1, [0,1600,0], [0.005, 0.145], [2,-8], 0, 8)
.phase(2, [0,880,0], [0.015, 0.165], [8,-8], 0, 1)
.play([1,2]);
)" ], [ 1911.6646353, 'kof', "(
~kick.ar(2);
~kick.quant=2;
~kick.fadeTime=0.2;
~kick={
  //         |       |       |       |       |  
  var pat = [1,0,0,0,1,0,0,0,1,0,0,0,1,0,0,0].rotate(1);
  var imp = PulseDivider.kr(~tick.kr,4,~counter.kr);
  var hit = Select.kr(PulseCount.kr(imp)%pat.size,pat);
  var env = EnvGen.ar(Env([0.001,1,0.001],[0.002,1.5],[3,-3],curve:'exp'),imp * hit);
    var sig = SinOsc.ar(50+(env**10*100)) + Pulse.ar(4);
  sig = sig * env;
  Splay.ar(sig,0.75,0.75);
};
~kick.play;
);" ], [ 1907.3546293, 'kof', "(
~kick.ar(2);
~kick.quant=2;
~kick.fadeTime=0.2;
~kick={
  //         |       |       |       |       |  
  var pat = [1,0,0,0,1,0,0,0,1,0,0,0,1,0,0,0].rotate(1);
  var imp = PulseDivider.kr(~tick.kr,4,~counter.kr);
  var hit = Select.kr(PulseCount.kr(imp)%pat.size,pat);
  var env = EnvGen.ar(Env([0.001,1,0.001],[0.002,1.5],[3,-3],curve:'exp'),imp * hit);
    var sig = SinOsc.ar(50+(env**10*100)) + Pulse.ar(4);
  sig = sig * env;
  Splay.ar(sig,0.75,0.5);
};
~kick.play;
);" ], [ 1905.092626, 'alex', "~c.play(vol:0.2, fadeTime:2).quant_(16);" ], [ 1900.9225917, 'joach', "(
~saw8[4] = \\set -> QuantEnv(\\freq, 4)
.phase(1, [60,66,60], [8, 4], [\\sin,\\sin], 0, 4)
.phase(2, [170,176,170], [2, 6], [2,-2], 0, 1)
.play([1,2]);
)" ], [ 1899.7005854, 'kof', "~first.clear;" ], [ 1896.0105803, 'alex', "~c.play(vol:0.5, fadeTime:2).quant_(16);" ], [ 1884.2305638, 'kof', "(
~first.ar(2);
~first.quant=4;
~first.fadeTime=2.2;
~first={
  //         |       |       |       |       |  
  var pat = [1,0,0,0,1,0,0,0,1,0,0,0,1,0,0,0].rotate(3);
    var imp = PulseDivider.kr(~tick.kr,2*fib(4),~counter.kr);
  var hit = Select.kr(PulseCount.kr(imp)%pat.size,pat);
  var env = EnvGen.ar(Env([0.001,1,0.001],[0.002,1.5],[3,-3],curve:'exp'),imp * hit);
    var sig = Mix.ar(SinOsc.ar(18000+(env*100)+(1..8),SinOsc.ar(50))) * LFPulse.ar(8*fib(4));
  sig = sig * env;
  Splay.ar(sig,0.75,0.5);
};
~first.play;
);" ], [ 1882.142528, 'joach', "(
~saw8[1] = \\set -> QuantEnv(\\amp, 1)
.phase(1, [0.25,1,0.45], [0.05, 0.45], [8,-2], 0, 4)
.phase(2, [0,1,0.1,0.4,0], [0.25, 0.75], [2,-2], 0, 1)
.play([1,2]);
)" ], [ 1881.6895272, 'kof', "(
~first.ar(2);
~first.quant=4;
~first.fadeTime=2.2;
~first={
  //         |       |       |       |       |  
  var pat = [1,0,0,0,1,0,0,0,1,0,0,0,1,0,0,0].rotate(3);
    var imp = PulseDivider.kr(~tick.kr,2*fib(4),~counter.kr);
  var hit = Select.kr(PulseCount.kr(imp)%pat.size,pat);
  var env = EnvGen.ar(Env([0.001,1,0.001],[0.002,3.5],[3,-3],curve:'exp'),imp * hit);
    var sig = Mix.ar(SinOsc.ar(18000+(env*100)+(1..8),SinOsc.ar(50))) * LFPulse.ar(8*fib(4));
  sig = sig * env;
  Splay.ar(sig,0.75,0.5);
};
~first.play;
);" ], [ 1879.1695237, 'alex', "~c[2]=\\set->Pbind(\\args, [\\trig], \\dur, Pseq([Pn(0.5,4),0.25],inf), \\trig, 1);" ], [ 1877.2895211, 'kof', "(
~first.ar(2);
~first.quant=4;
~first.fadeTime=2.2;
~first={
  //         |       |       |       |       |  
  var pat = [1,0,0,0,1,0,0,0,1,0,0,0,1,0,0,0].rotate(3);
    var imp = PulseDivider.kr(~tick.kr,4*fib(4),~counter.kr);
  var hit = Select.kr(PulseCount.kr(imp)%pat.size,pat);
  var env = EnvGen.ar(Env([0.001,1,0.001],[0.002,3.5],[3,-3],curve:'exp'),imp * hit);
    var sig = Mix.ar(SinOsc.ar(18000+(env*100)+(1..8),SinOsc.ar(50))) * LFPulse.ar(8*fib(4));
  sig = sig * env;
  Splay.ar(sig,0.75,0.5);
};
~first.play;
);" ], [ 1873.9495164, 'kof', "(
~first.ar(2);
~first.quant=4;
~first.fadeTime=2.2;
~first={
  //         |       |       |       |       |  
  var pat = [1,0,0,0,1,0,0,0,1,0,0,0,1,0,0,0].rotate(3);
    var imp = PulseDivider.kr(~tick.kr,4*fib(4),~counter.kr);
  var hit = Select.kr(PulseCount.kr(imp)%pat.size,pat);
  var env = EnvGen.ar(Env([0.001,1,0.001],[0.002,3.5],[3,-3],curve:'exp'),imp * hit);
    var sig = Mix.ar(SinOsc.ar(18000+(env*100)+(1..8),SinOsc.ar(50))) * LFPulse.ar(8*fib(4));
  sig = sig * env;
  Splay.ar(sig,0.75,0.25);
};
~first.play;
);" ], [ 1871.509513, 'alex', "~c[1]=\\set->Pbind(\\args, [\\freq], \\dur, 16, \\freq,Pseq([Pseq([165,145,147,142,132],4), Pn(65,4)],inf));" ], [ 1870.8895121, 'kof', "(
~first.ar(2);
~first.quant=4;
~first.fadeTime=2.2;
~first={
  //         |       |       |       |       |  
  var pat = [1,0,0,0,1,0,0,0,1,0,0,0,1,0,0,0].rotate(3);
    var imp = PulseDivider.kr(~tick.kr,4*fib(4),~counter.kr);
  var hit = Select.kr(PulseCount.kr(imp)%pat.size,pat);
  var env = EnvGen.ar(Env([0.001,1,0.001],[0.002,3.5],[3,-3],curve:'exp'),imp * hit);
    var sig = Mix.ar(SinOsc.ar(18000+(env*100)+(1..8),SinOsc.ar(50))) * LFPulse.ar(8*fib(4));
  sig = sig * env;
  Splay.ar(sig,0.75,0.25);
};
~first.play;
);" ], [ 1868.0474751, 'joach', "(
~saw8[1] = \\set -> QuantEnv(\\amp, 0.5)
.phase(1, [0.25,1,0.45], [0.05, 0.45], [8,-2], 0, 4)
.phase(2, [0,1,0.1,0.4,0], [0.35, 0.65], [2,-2], 0, 1)
.play([1,2]);
)" ], [ 1863.2774684, 'kof', "(
~first.ar(2);
~first.quant=4;
~first.fadeTime=2.2;
~first={
  //         |       |       |       |       |  
  var pat = [1,0,0,0,1,0,0,0,1,0,0,0,1,0,0,0].rotate(3);
    var imp = PulseDivider.kr(~tick.kr,4*fib(4),~counter.kr);
  var hit = Select.kr(PulseCount.kr(imp)%pat.size,pat);
  var env = EnvGen.ar(Env([0.001,1,0.001],[0.002,3.5],[3,-3],curve:'exp'),imp * hit);
    var sig = Mix.ar(SinOsc.ar(18000+(env*100)+(1..8),SinOsc.ar(50))) * LFPulse.ar(4*fib(4));
  sig = sig * env;
  Splay.ar(sig,0.75,0.25);
};
~first.play;
);" ], [ 1855.275427, 'joach', "(
~saw8[1] = \\set -> QuantEnv(\\amp, 0.5)
.phase(1, [0.45,1,0.45], [0.05, 0.45], [8,-2], 0, 4)
.phase(2, [0,1,0.1,0.4,0], [0.35, 0.65], [2,-2], 0, 1)
.play([1,2]);
)" ], [ 1855.105424, 'kof', "(
~first.ar(2);
~first.quant=4;
~first.fadeTime=2.2;
~first={
  //         |       |       |       |       |  
  var pat = [1,0,0,0,1,0,0,0,1,0,0,0,1,0,0,0].rotate(3);
    var imp = PulseDivider.kr(~tick.kr,4*fib(4),~counter.kr);
  var hit = Select.kr(PulseCount.kr(imp)%pat.size,pat);
  var env = EnvGen.ar(Env([0.001,1,0.001],[0.002,3.5],[3,-3],curve:'exp'),imp * hit);
    var sig = Mix.ar(SinOsc.ar(18000+(1..8),SinOsc.ar(50))) * LFPulse.ar(4*fib(4));
  sig = sig * env;
  Splay.ar(sig,0.75,0.25);
};
~first.play;
);" ], [ 1853.2013909, 'joach', "(
~saw8[1] = \\set -> QuantEnv(\\amp, 0.5)
.phase(1, [0.15,1,0.45], [0.05, 0.45], [8,-2], 0, 4)
.phase(2, [0,1,0.1,0.4,0], [0.35, 0.65], [2,-2], 0, 1)
.play([1,2]);
)" ], [ 1853.0243881, 'alex', "~c.play(vol:1, fadeTime:2).quant_(16);" ], [ 1849.4863542, 'joach', "~saw8.set(\\lpf_freq, 4800);" ], [ 1843.0833412, 'alex', "~c[30]=\\filter-> {arg in; GVerb.ar(in,[60,40],[4,6],add:in)};" ], [ 1838.4333347, 'kof', "(
~first.ar(2);
~first.quant=4;
~first.fadeTime=2.2;
~first={
  //         |       |       |       |       |  
  var pat = [1,0,0,0,1,0,0,0,1,0,0,0,1,0,0,0].rotate(3);
    var imp = PulseDivider.kr(~tick.kr,4*fib(4),~counter.kr);
  var hit = Select.kr(PulseCount.kr(imp)%pat.size,pat);
  var env = EnvGen.ar(Env([0.001,1,0.001],[0.002,3.5],[3,-3],curve:'exp'),imp * hit);
    var sig = Mix.ar(SinOsc.ar(18000+(1..8),SinOsc.ar(50))) * LFPulse.ar(4*fib(4));
  sig = sig * env;
  Splay.ar(sig,0.75,0.15);
};
~first.play;
);" ], [ 1834.963298, 'joach', "(
~saw8[7] = \\set -> QuantEnv(\\fplus, 1)
.phase(1, [0,260,0], [0.005, 0.145], [2,-8], 0, 8)
.phase(2, [0,880,0], [0.015, 0.165], [8,-8], 0, 1)
.play([1,2]);
)" ], [ 1833.5412948, 'alex', "~c.play(vol:1, fadeTime:2).quant_(16);" ], [ 1829.6092607, 'joach', "(
~saw8[5] = \\set -> QuantEnv(\\noise, 16)
.phase(1, [0,0.8,0], [0.05, 3.95], [2,-2], 0, 1)
.phase(2, [0,0.4,0], [0.35, 2.65], [2,-2], 0, 1)
.play([1,2]);
)" ], [ 1829.2782557, 'alex', "~c[3]=\\set->Pbind(\\args, [\\top], \\dur, 16, \\top, 4 );" ], [ 1826.8682523, 'alex', "~c[2]=\\set->Pbind(\\args, [\\trig], \\dur, Pseq([Pn(0.5,4),8],inf), \\trig, 1);" ], [ 1825.4482504, 'alex', "~c[1]=\\set->Pbind(\\args, [\\freq], \\dur, 16, \\freq,Pseq([Pseq([65,45,47,42,32],4), Pn(65,4)],inf));" ], [ 1820.6542272, 'alex', "(
~c[0]={
	var sig, env, fenv;

	env=EnvGen.kr(Env([0,1,0], [0.01,0.25], [\\welch, \\step]), \\trig.tr);
	fenv=EnvGen.kr(Env([\\freq.kr,\\freq.kr*\\top.kr(4),\\freq.kr], [0.01,0.04], \\welch), \\trig.tr);

	sig=LFPulse.ar(\\freq.kr!2).lag([0.001,0.002])*env;


};
)" ], [ 1820.422214, 'joach', "(
~saw8[4] = \\set -> QuantEnv(\\freq, 4)
.phase(1, [60,66,60], [8, 4], [\\sin,\\sin], 0, 4)
.phase(2, [70,76,50], [2, 6], [2,-2], 0, 1)
.play([1,2]);
)" ], [ 1807.8651608, 'joach', "~saw8.play(vol: 0.9, fadeTime: 16);" ], [ 1805.0841558, 'kof', "~first.clear;" ], [ 1802.5941523, 'kof', "~kick.clear;" ], [ 1800.7681209, 'joach', "(
~saw8[1] = \\set -> QuantEnv(\\amp, 0.5)
.phase(1, [0.15,1,0.15], [0.05, 0.45], [8,-2], 0, 4)
.phase(2, [0,1,0.1,0.4,0], [0.35, 0.65], [2,-2], 0, 1)
.play([1,2]);
)" ], [ 1798.5901135, 'kof', "~hiss.clear;" ], [ 1796.2930787, 'joach', "(
~saw8[0] = {
var osc = SinOsc.ar(( \\freq.kr(50) + \\fplus.kr(0) ), mul: 1, add: 0);
var noise = BrownNoise.ar(\\noise.kr(0), (1 - \\noise.kr(0)));
var sig = osc * noise;
Pan2.ar( sig * \\amp.kr(0), \\pan.kr(0) );
};
)" ], [ 1795.8370766, 'kof', "~hiss.ar(2);" ], [ 1794.2870744, 'kof', "~hiss.clear;" ], [ 1791.886071, 'kof', "~hiss.ar(2);" ], [ 1790.5860692, 'kof', "~hiss.clear;" ], [ 1787.7960653, 'kof', "~hiss.ar(2);" ], [ 1786.4450304, 'joach', "~saw8.stop(1);" ], [ 1786.16503, 'kof', "~hiss.clear;" ], [ 1783.6750265, 'kof', "(
~hiss.ar(2);
~hiss.quant=2;
~hiss.fadeTime=0.2;
~hiss={
  //         |       |       |       |       |  
  var pat = [1,0,0,0,1,0,0,0,1,0,0,0,1,0,0,0].rotate(1);
  var imp = PulseDivider.kr(~tick.kr,64,~counter.kr);
  var hit = Select.kr(PulseCount.kr(imp)%pat.size,pat);
  var env = EnvGen.ar(Env([0.001,1,0.001],[4.002,8.5],[3,-3],curve:'exp'),imp * hit);
    var sig = WhiteNoise.ar(1) * Pulse.ar(40);
    sig = HPF.ar(sig,800);
  sig = sig * env;
  Splay.ar(sig,0.75,0.5);
};
~hiss.play;
);" ], [ 1782.126996, 'alex', "~r.clear(fadeTime:2);" ], [ 1782.0819934, 'joach', "(
~saw8[7] = \\set -> QuantEnv(\\fplus, 0.5)
.phase(1, [0,260,0], [0.005, 0.145], [2,-8], 0, 8)
.phase(2, [0,880,0], [0.015, 0.165], [8,-8], 0, 1)
.play([1,2]);
)" ], [ 1777.8219557, 'joach', "(
~saw8[7] = \\set -> QuantEnv(\\fplus, 0.5)
.phase(1, [0,260,0], [0.005, 0.245], [2,-8], 0, 8)
.phase(2, [0,880,0], [0.015, 0.165], [8,-8], 0, 1)
.play([1,2]);
)" ], [ 1775.3409488, 'alex', "~r.play(vol:2, fadeTime:2).quant_(16);" ], [ 1771.2509431, 'kof', "(
~ff.quant=1;
~ff.fadeTime=1;
~ff={
  var high,mid,low;
  var sig = ~first + ~kick + ~hiss;
  
  sig = GVerb.ar(LPF.ar(sig,5000)+HPF.ar(sig,500),40,[3,4,5,6],spread:[40,90])/8 + sig;
  low = CompanderD.ar(LPF.ar(sig,400),3/4,1/2,1/2);
  mid = CompanderD.ar(BPF.ar(sig,600,2),3/4,1/2,1/2);
  high = CompanderD.ar(HPF.ar(sig,900),3/4,1/2,1/2);
  sig = CompanderD.ar((high+mid+low).flat,3/4,1/1.1,1/1.1);
  Splay.ar(sig,0.75,0.25);
};
~ff.play;
);" ], [ 1770.3109418, 'alex', "~r[2]=\\set->Pbind(\\args, [\\trig], \\dur, Pseq([Pn(0.5,4),8],inf), \\trig, 1);" ], [ 1766.8009368, 'alex', "~r[3]=\\set->Pbind(\\args, [\\top], \\dur, 16, \\top, 8 );" ], [ 1763.6089021, 'joach', "(
~saw8[1] = \\set -> QuantEnv(\\amp, 0.5)
.phase(1, [0.15,1,0.15], [0.05, 0.45], [8,-2], 0, 4)
.phase(2, [0,1,0.1,0.4,0], [0.35, 0.65], [2,-2], 0, 1)
.play([1,2]);
)" ], [ 1760.1388945, 'alex', "~r[30]=\\filter-> {arg in; GVerb.ar(in,[60,40],[4,6],add:in)};" ], [ 1755.3138584, 'joach', "~saw8[3] = \\filter -> {|in| GVerb.ar(in, \\gverb_size.kr(16), \\gverb_time.kr(0.66), 0.9, mul:\\mulgverb.kr(1)) };" ], [ 1742.6388058, 'joach', "(
~saw8[1] = \\set -> QuantEnv(\\amp, 1)
.phase(1, [0.15,1,0.15], [0.05, 0.45], [8,-2], 0, 4)
.phase(2, [0,1,0.1,0.4,0], [0.35, 0.65], [2,-2], 0, 1)
.play([1,2]);
)" ], [ 1731.4897562, 'joach', "(
~saw8[4] = \\set -> QuantEnv(\\freq, 36)
.phase(1, [60,66,60], [8, 4], [\\sin,\\sin], 0, 4)
.phase(2, [70,76,50], [2, 6], [2,-2], 0, 1)
.play([1,2]);
)" ], [ 1728.9427506, 'alex', "~r.play(vol:1, fadeTime:2).quant_(16);" ], [ 1724.6927446, 'alex', "~r.play(vol:0.8, fadeTime:2).quant_(16);" ], [ 1720.4617102, 'joach', "(
~saw8[7] = \\set -> QuantEnv(\\fplus, 0.25)
.phase(1, [0,260,0], [0.005, 0.245], [2,-8], 0, 8)
.phase(2, [0,880,0], [0.015, 0.165], [8,-8], 0, 1)
.play([1,2]);
)" ], [ 1718.0107023, 'alex', "~r.play(vol:0.6, fadeTime:2).quant_(16);" ], [ 1712.6506948, 'alex', "~r.play(vol:0.1, fadeTime:2).quant_(16);" ], [ 1707.5696876, 'kof', "(
~kick.ar(2);
~kick.quant=2;
~kick.fadeTime=0.2;
~kick={
  //         |       |       |       |       |  
  var pat = [1,0,0,0,1,0,0,0,1,0,0,0,1,0,0,0].rotate(1);
  var imp = PulseDivider.kr(~tick.kr,4,~counter.kr);
  var hit = Select.kr(PulseCount.kr(imp)%pat.size,pat);
  var env = EnvGen.ar(Env([0.001,1,0.001],[0.002,1.5],[3,-3],curve:'exp'),imp * hit);
    var sig = SinOsc.ar(50+(env**100*100)) + Pulse.ar(4);
  sig = sig * env;
  Splay.ar(sig,0.75,0.5);
};
~kick.play;
);" ], [ 1707.0796869, 'alex', "~r[30]=\\filter-> {arg in; GVerb.ar(in,[60,40],[4,6],add:in)};" ], [ 1706.3696558, 'joach', "(
~saw8[7] = \\set -> QuantEnv(\\fplus, 0.25)
.phase(1, [0,260,0], [0.005, 0.245], [8,-8], 0, 8)
.phase(2, [0,880,0], [0.015, 0.165], [8,-8], 0, 1)
.play([1,2]);
)" ], [ 1704.5576503, 'alex', "~r[3]=\\set->Pbind(\\args, [\\top], \\dur, 16, \\top, 4 );" ], [ 1702.6176476, 'kof', "(
~kick.ar(2);
~kick.quant=2;
~kick.fadeTime=0.2;
~kick={
  //         |       |       |       |       |  
  var pat = [1,0,0,0,1,0,0,0,1,0,0,0,1,0,0,0].rotate(1);
  var imp = PulseDivider.kr(~tick.kr,4,~counter.kr);
  var hit = Select.kr(PulseCount.kr(imp)%pat.size,pat);
  var env = EnvGen.ar(Env([0.001,1,0.001],[0.002,2.5],[3,-3],curve:'exp'),imp * hit);
    var sig = SinOsc.ar(50+(env**100*100)) + Pulse.ar(4);
  sig = sig * env;
  Splay.ar(sig,0.75,0.5);
};
~kick.play;
);" ], [ 1699.0866426, 'alex', "~r[2]=\\set->Pbind(\\args, [\\trig], \\dur, Pseq([Pn(0.5,4),8],inf), \\trig, 1);" ], [ 1695.4536044, 'joach', "(
~saw8[7] = \\set -> QuantEnv(\\fplus, 0.25)
.phase(1, [0,260,0], [0.005, 0.145], [8,-8], 0, 8)
.phase(2, [0,880,0], [0.015, 0.165], [8,-8], 0, 1)
.play([1,2]);
)" ], [ 1693.8086013, 'kof', "(
~kick.ar(2);
~kick.quant=2;
~kick.fadeTime=0.2;
~kick={
  //         |       |       |       |       |  
  var pat = [1,0,0,0,1,0,0,0,1,0,0,0,1,0,0,0].rotate(1);
  var imp = PulseDivider.kr(~tick.kr,4,~counter.kr);
  var hit = Select.kr(PulseCount.kr(imp)%pat.size,pat);
  var env = EnvGen.ar(Env([0.001,1,0.001],[0.002,2.5],[3,-3],curve:'exp'),imp * hit);
    var sig = SinOsc.ar(50+(env**100*100));
  sig = sig * env;
  Splay.ar(sig,0.75,0.5);
};
~kick.play;
);" ], [ 1691.1085975, 'alex', "~r[1]=\\set->Pbind(\\args, [\\freq], \\dur, 16, \\freq,Pseq([Pseq([65,45,47,42,32],4), Pn(65,4)],inf));" ], [ 1684.4775882, 'alex', "(
~r[0]={
	var sig, env, fenv;

	env=EnvGen.kr(Env([0,1,0], [0.01,0.25], [\\welch, \\step]), \\trig.tr);
	fenv=EnvGen.kr(Env([\\freq.kr,\\freq.kr*\\top.kr(4),\\freq.kr], [0.01,0.04], \\welch), \\trig.tr);

	sig=SinOsc.ar(fenv!2,add:LPF.ar(GrayNoise.ar(0.7)*Decay.kr(Impulse.kr([12,16]),0.1),14700))*env;


};
)" ], [ 1681.5845522, 'joach', "~saw8[5] =nil;" ], [ 1676.1315427, 'kof', "(
~first.ar(2);
~first.quant=4;
~first.fadeTime=2.2;
~first={
  //         |       |       |       |       |  
  var pat = [1,0,0,0,1,0,0,0,1,0,0,0,1,0,0,0].rotate(3);
    var imp = PulseDivider.kr(~tick.kr,4*fib(4),~counter.kr);
  var hit = Select.kr(PulseCount.kr(imp)%pat.size,pat);
  var env = EnvGen.ar(Env([0.001,1,0.001],[0.002,3.5],[3,-3],curve:'exp'),imp * hit);
    var sig = Mix.ar(SinOsc.ar(50+(1..8),SinOsc.ar(50)));
  sig = sig * env;
  Splay.ar(sig,0.75,0.5);
};
~first.play;
);" ], [ 1667.1534984, 'joach', "~saw8.set(\\lpf_freq, 2800);" ], [ 1650.1214393, 'joach', "(
~saw8[4] = \\set -> QuantEnv(\\freq, 36)
.phase(1, [60,66,50], [8, 4], [\\sin,\\sin], 0, 4)
.phase(2, [70,76,50], [2, 6], [2,-2], 0, 1)
.play([1,2]);
)" ], [ 1648.2584365, 'kof', "(
~ff.quant=1;
~ff.fadeTime=1;
~ff={
  var high,mid,low;
  var sig = ~first + ~kick;
  
  sig = GVerb.ar(LPF.ar(sig,5000)+HPF.ar(sig,500),40,[3,4,5,6],spread:[40,90])/8 + sig;
  low = CompanderD.ar(LPF.ar(sig,400),3/4,1/2,1/2);
  mid = CompanderD.ar(BPF.ar(sig,600,2),3/4,1/2,1/2);
  high = CompanderD.ar(HPF.ar(sig,900),3/4,1/2,1/2);
  sig = CompanderD.ar((high+mid+low).flat,3/4,1/1.1,1/1.1);
  Splay.ar(sig,0.75,0.25);
};
~ff.play;
);" ], [ 1647.6034063, 'joach', "(
~saw8[4] = \\set -> QuantEnv(\\freq, 36)
.phase(1, [60,56,50], [8, 4], [\\sin,\\sin], 0, 4)
.phase(2, [70,76,50], [2, 6], [2,-2], 0, 1)
.play([1,2]);
)" ], [ 1646.5964012, 'alex', "p.clock.tempo;" ], [ 1641.1593636, 'joach', "~saw8.play(vol: 0.9, fadeTime: 16);" ], [ 1637.8053559, 'kof', "(
~kick.ar(2);
~kick.quant=2;
~kick.fadeTime=0.2;
~kick={
  //         |       |       |       |       |  
  var pat = [1,0,0,0,1,0,0,0,1,0,0,0,1,0,0,0].rotate(1);
  var imp = PulseDivider.kr(~tick.kr,8,~counter.kr);
  var hit = Select.kr(PulseCount.kr(imp)%pat.size,pat);
  var env = EnvGen.ar(Env([0.001,1,0.001],[0.002,2.5],[3,-3],curve:'exp'),imp * hit);
    var sig = SinOsc.ar(50+(env**100*100));
  sig = sig * env;
  Splay.ar(sig,0.75,0.5);
};
~kick.play;
);" ], [ 1627.0543408, 'kof', "(
~first.ar(2);
~first.quant=4;
~first.fadeTime=2.2;
~first={
  //         |       |       |       |       |  
  var pat = [1,0,0,0,1,0,0,0,1,0,0,0,1,0,0,0].rotate(1);
    var imp = PulseDivider.kr(~tick.kr,8*fib(4),~counter.kr);
  var hit = Select.kr(PulseCount.kr(imp)%pat.size,pat);
  var env = EnvGen.ar(Env([0.001,1,0.001],[4.002,4.5],[3,-3],curve:'exp'),imp * hit);
    var sig = Mix.ar(SinOsc.ar(50+(1..8),SinOsc.ar(50)));
  sig = sig * env;
  Splay.ar(sig,0.75,0.5);
};
~first.play;
);" ], [ 1625.764339, 'kof', "(
~first.ar(2);
~first.quant=4;
~first.fadeTime=2.2;
~first={
  //         |       |       |       |       |  
  var pat = [1,0,0,0,1,0,0,0,1,0,0,0,1,0,0,0].rotate(1);
    var imp = PulseDivider.kr(~tick.kr,8*fib(4),~counter.kr);
  var hit = Select.kr(PulseCount.kr(imp)%pat.size,pat);
  var env = EnvGen.ar(Env([0.001,1,0.001],[4.002,4.5],[3,-3],curve:'exp'),imp * hit);
    var sig = Mix.ar(SinOsc.ar(50+(1..8),SinOsc.ar(50)));
  sig = sig * env;
  Splay.ar(sig,0.75,0.25);
};
~first.play;
);" ], [ 1616.1633255, 'kof', "(
~first.ar(2);
~first.quant=4;
~first.fadeTime=2.2;
~first={
  //         |       |       |       |       |  
  var pat = [1,0,0,0,1,0,0,0,1,0,0,0,1,0,0,0].rotate(1);
    var imp = PulseDivider.kr(~tick.kr,8*fib(4),~counter.kr);
  var hit = Select.kr(PulseCount.kr(imp)%pat.size,pat);
  var env = EnvGen.ar(Env([0.001,1,0.001],[4.002,4.5],[3,-3],curve:'exp'),imp * hit);
    var sig = Mix.ar(SinOsc.ar(50+(1..8),SinOsc.ar(50)));
  sig = sig * env;
  Splay.ar(sig,0.75,0.75);
};
~first.play;
);" ], [ 1615.390293, 'joach', "(
~saw8[7] = \\set -> QuantEnv(\\fplus, 0.25)
.phase(1, [0,460,0], [0.005, 0.145], [8,-8], 0, 8)
.phase(2, [0,280,0], [0.015, 0.165], [8,-8], 0, 1)
.play([1,2]);
)" ], [ 1610.3862835, 'alex', "~b.clear;" ], [ 1602.832242, 'joach', "(
~saw8[1] = \\set -> QuantEnv(\\amp, 0.5)
.phase(1, [0.15,1,0.15], [0.05, 0.45], [8,-2], 0, 4)
.phase(2, [0,1,0.1,0.4,0], [0.35, 0.65], [2,-2], 0, 1)
.play([1,2]);
)" ], [ 1593.4842268, 'kof', "(
~first.ar(2);
~first.quant=4;
~first.fadeTime=2.2;
~first={
  //         |       |       |       |       |  
  var pat = [1,0,0,0,1,0,0,0,1,0,0,0,1,0,0,0].rotate(1);
    var imp = PulseDivider.kr(~tick.kr,8*fib(4),~counter.kr);
  var hit = Select.kr(PulseCount.kr(imp)%pat.size,pat);
  var env = EnvGen.ar(Env([0.001,1,0.001],[4.002,4.5],[3,-3],curve:'exp'),imp * hit);
    var sig = SinOsc.ar(50,SinOsc.ar(50));
  sig = sig * env;
  Splay.ar(sig,0.75,0.75);
};
~first.play;
);" ], [ 1588.965191, 'joach', "(
~saw8[7] = \\set -> QuantEnv(\\fplus, 0.25)
.phase(1, [0,160,0], [0.005, 0.145], [8,-8], 0, 8)
.phase(2, [0,280,0], [0.015, 0.165], [8,-8], 0, 1)
.play([1,2]);
)" ], [ 1585.5781535, 'joach', "(
~saw8[7] = \\set -> QuantEnv(\\fplus, 0.25)
.phase(1, [0,160,0], [0.005, 0.145], [8,-8], 0, 1)
.phase(2, [0,280,0], [0.015, 0.165], [8,-8], 0, 1)
.play([1,2]);
)" ], [ 1584.9601488, 'kof', "~kick.clear;" ], [ 1583.4201467, 'kof', "~ff.clear;" ], [ 1578.4871078, 'joach', "~saw8.set(\\lpf_freq, 1800);" ], [ 1578.4841076, 'kof', "(
~ff.quant=1;
~ff.fadeTime=1;
~ff={
  var high,mid,low;
  var sig = ~first + ~kick;
  
  sig = GVerb.ar(LPF.ar(sig,5000)+HPF.ar(sig,500),40,[3,4,5,6],spread:[40,90])/8 + sig;
  low = CompanderD.ar(LPF.ar(sig,400),3/4,1/2,1/2);
  mid = CompanderD.ar(BPF.ar(sig,600,2),3/4,1/2,1/2);
  high = CompanderD.ar(HPF.ar(sig,900),3/4,1/2,1/2);
  sig = CompanderD.ar((high+mid+low).flat,3/4,1/1.1,1/1.1);
  Splay.ar(sig,0.75,0.25);
};
~ff.play;
);" ], [ 1574.4420695, 'joach', "(
~saw8[5] = \\set -> QuantEnv(\\noise, 4)
.phase(1, [0,0.8,0], [0.05, 3.95], [2,-2], 0, 1)
.phase(2, [0,0.4,0], [0.35, 2.65], [2,-2], 0, 1)
.play([1,2]);
)" ], [ 1571.2750306, 'joach', "(
~saw8[5] = \\set -> QuantEnv(\\noise, 4)
.phase(1, [0,0.2,0], [0.05, 3.95], [2,-2], 0, 1)
.phase(2, [0,0.4,0], [0.35, 2.65], [2,-2], 0, 1)
.play([1,2]);
)" ], [ 1565.322021, 'alex', "~b.play(vol:1, fadeTime:2).quant_(8);" ], [ 1562.2720167, 'alex', "~b[31]=\\filter-> {arg in; LPF.ar(in,\\lpf.kr(16800))};" ], [ 1557.5620101, 'alex', "~b[30]=\\filter-> {arg in; GVerb.ar(in,2, [6,8],add:in)};" ], [ 1556.8620092, 'kof', "~kick.ar(2);" ], [ 1555.5920074, 'kof', "~kick.clear;" ], [ 1554.4920058, 'alex', "~b[2]=\\set->Pbind(\\args, [\\trig], \\dur, 8, \\trig, 1);" ], [ 1553.0720038, 'alex', "~b[1]=\\set->Pbind(\\args, [\\freq], \\dur, 2, \\freq,Prand([440,220,85,98,165,750],inf));" ], [ 1549.8019993, 'alex', "(
~b[0]={
	var sig, env, fenv,f2env;

	env=EnvGen.kr(Env([0,1,0], [2,8], [\\welch, \\lin]), \\trig.tr);
	
	sig=BPF.ar(PinkNoise.ar([0.2,0.7]),\\freq.kr,rq:LFNoise0.kr(20).range(0.0001,2));
	sig-sig*env;
	};
)" ], [ 1546.363965, 'joach', "(
~saw8[6] = \\set -> QuantEnv(\\pan, 8)
.phase(1, [-0.2,0.2,0.2], [0.45, 0.45], [2,-2], 0, 1)
.phase(2, [-0.8,0.8,0.8], [0.35, 0.65], [2,-2], 0, 1)
.play([1]);
)" ], [ 1539.9789524, 'kof', "(
~kick.ar(2);
~kick.quant=2;
~kick.fadeTime=0.2;
~kick={
  //         |       |       |       |       |  
  var pat = [1,0,0,0,1,0,0,0,1,0,0,0,1,0,0,0].rotate(1);
  var imp = PulseDivider.kr(~tick.kr,4,~counter.kr);
  var hit = Select.kr(PulseCount.kr(imp)%pat.size,pat);
  var env = EnvGen.ar(Env([0.001,1,0.001],[0.002,4.5],[3,-3],curve:'exp'),imp * hit);
    var sig = SinOsc.ar(50+(env**100*100));
  sig = sig * env;
  Splay.ar(sig,0.75,0.5);
};
~kick.play;
);" ], [ 1536.5789477, 'alex', "(
~b[0]={
	var sig, env, fenv,f2env;

	env=EnvGen.kr(Env([0,1,0], [2,8], [\\welch, \\lin]), \\trig.tr);
	
	sig=BPF.ar(PinkNoise.ar([0.2,0.7]),\\freq.kr+[1,2,3,5].reciprocal,rq:LFNoise0.kr(20).range(0.0001,2));
	sig-sig*env;
	};
)" ], [ 1533.218943, 'kof', "(
~kick.ar(2);
~kick.quant=2;
~kick.fadeTime=0.2;
~kick={
  //         |       |       |       |       |  
  var pat = [1,0,0,0,1,0,0,0,1,0,0,0,1,0,0,0].rotate(1);
  var imp = PulseDivider.kr(~tick.kr,4,~counter.kr);
  var hit = Select.kr(PulseCount.kr(imp)%pat.size,pat);
  var env = EnvGen.ar(Env([0.001,1,0.001],[0.002,4.5],[3,-3],curve:'exp'),imp * hit);
    var sig = SinOsc.ar(50+(env**100*100)) + Pulse.ar(5);
  sig = sig * env;
  Splay.ar(sig,0.75,0.5);
};
~kick.play;
);" ], [ 1524.7679311, 'kof', "(
~first.ar(2);
~first.quant=4;
~first.fadeTime=2.2;
~first={
  //         |       |       |       |       |  
  var pat = [1,0,0,0,1,0,0,0,1,0,0,0,1,0,0,0].rotate(1);
    var imp = PulseDivider.kr(~tick.kr,8*fib(4),~counter.kr);
  var hit = Select.kr(PulseCount.kr(imp)%pat.size,pat);
  var env = EnvGen.ar(Env([0.001,1,0.001],[4.002,4.5],[3,-3],curve:'exp'),imp * hit);
    var sig = SinOsc.ar(50,SinOsc.ar(50/[2,4,8,16]));
  sig = sig * env;
  Splay.ar(sig,0.75,0.75);
};
~first.play;
);" ], [ 1520.3679249, 'alex', "~g.clear(fadeTime:10);" ], [ 1516.0679189, 'kof', "(
~first.ar(2);
~first.quant=4;
~first.fadeTime=2.2;
~first={
  //         |       |       |       |       |  
  var pat = [1,0,0,0,1,0,0,0,1,0,0,0,1,0,0,0].rotate(1);
    var imp = PulseDivider.kr(~tick.kr,8*fib(4),~counter.kr);
  var hit = Select.kr(PulseCount.kr(imp)%pat.size,pat);
  var env = EnvGen.ar(Env([0.001,1,0.001],[4.002,4.5],[3,-3],curve:'exp'),imp * hit);
    var sig = SinOsc.ar(50,SinOsc.ar(50/[2,4,8,16])) + SinOsc.ar(16000/[1,2,4,8]+SinOsc.ar(44).range(-2,2),mul:0.1);
  sig = sig * env;
  Splay.ar(sig,0.75,0.75);
};
~first.play;
);" ], [ 1511.3079122, 'kof', "(
~first.ar(2);
~first.quant=4;
~first.fadeTime=2.2;
~first={
  //         |       |       |       |       |  
  var pat = [1,0,0,0,1,0,0,0,1,0,0,0,1,0,0,0].rotate(1);
    var imp = PulseDivider.kr(~tick.kr,8*fib(4),~counter.kr);
  var hit = Select.kr(PulseCount.kr(imp)%pat.size,pat);
  var env = EnvGen.ar(Env([0.001,1,0.001],[4.002,4.5],[3,-3],curve:'exp'),imp * hit);
    var sig = SinOsc.ar(50,SinOsc.ar(50/[2,4,8,16])) + SinOsc.ar(16000/[1,2,4,8]+SinOsc.ar(4).range(-2,2),mul:0.1);
  sig = sig * env;
  Splay.ar(sig,0.75,0.75);
};
~first.play;
);" ], [ 1509.180896, 'kof', "(
~first.ar(2);
~first.quant=4;
~first.fadeTime=2.2;
~first={
  //         |       |       |       |       |  
  var pat = [1,0,0,0,1,0,0,0,1,0,0,0,1,0,0,0].rotate(1);
    var imp = PulseDivider.kr(~tick.kr,8*fib(4),~counter.kr);
  var hit = Select.kr(PulseCount.kr(imp)%pat.size,pat);
  var env = EnvGen.ar(Env([0.001,1,0.001],[4.002,4.5],[3,-3],curve:'exp'),imp * hit);
    var sig = SinOsc.ar(50,SinOsc.ar(50/[2,4,8,16])) + SinOsc.ar(16000/[1,2,4,8]+SinOsc.ar(4).range(-2,20),mul:0.1);
  sig = sig * env;
  Splay.ar(sig,0.75,0.75);
};
~first.play;
);" ], [ 1508.9028801, 'joach', "(
~saw8[7] = \\set -> QuantEnv(\\fplus, 0.25)
.phase(1, [0,160,0], [0.005, 0.145], [8,-8], 0, 1)
.phase(2, [0,280,0], [0.015, 0.165], [8,-8], 0, 1)
.play([1,2]);
)" ], [ 1502.4758668, 'alex', "~g[31]=\\filter-> {arg in; LPF.ar(in,\\lpf.kr(400))};" ], [ 1499.5958628, 'kof', "(
~first.ar(2);
~first.quant=4;
~first.fadeTime=2.2;
~first={
  //         |       |       |       |       |  
  var pat = [1,0,0,0,1,0,0,0,1,0,0,0,1,0,0,0].rotate(1);
    var imp = PulseDivider.kr(~tick.kr,8*fib(4),~counter.kr);
  var hit = Select.kr(PulseCount.kr(imp)%pat.size,pat);
  var env = EnvGen.ar(Env([0.001,1,0.001],[4.002,4.5],[3,-3],curve:'exp'),imp * hit);
    var sig = SinOsc.ar(50,SinOsc.ar(50/[2,4,8,16])) + SinOsc.ar(16000/[1,2,4,8]+SinOsc.ar(4).range(-20,20),mul:0.1);
  sig = sig * env;
  Splay.ar(sig,0.75,0.75);
};
~first.play;
);" ], [ 1497.7058602, 'kof', "(
~first.ar(2);
~first.quant=4;
~first.fadeTime=2.2;
~first={
  //         |       |       |       |       |  
  var pat = [1,0,0,0,1,0,0,0,1,0,0,0,1,0,0,0].rotate(1);
    var imp = PulseDivider.kr(~tick.kr,8*fib(4),~counter.kr);
  var hit = Select.kr(PulseCount.kr(imp)%pat.size,pat);
  var env = EnvGen.ar(Env([0.001,1,0.001],[4.002,4.5],[3,-3],curve:'exp'),imp * hit);
    var sig = SinOsc.ar(50,SinOsc.ar(50/[2,4,8,16])) + SinOsc.ar(16000/[1,2,4,8]+SinOsc.ar(4).range(-200,20),mul:0.1);
  sig = sig * env;
  Splay.ar(sig,0.75,0.75);
};
~first.play;
);" ], [ 1497.0028584, 'alex', "~g[31]=\\filter-> {arg in; LPF.ar(in,\\lpf.kr(400))};" ], [ 1496.4408263, 'joach', "(
~saw8[1] = \\set -> QuantEnv(\\amp, 0.5)
.phase(1, [0,1,0.05], [0.05, 0.45], [8,-2], 0, 4)
.phase(2, [0,1,0.1,0.4,0], [0.35, 0.65], [2,-2], 0, 1)
.play([1,2]);
)" ], [ 1494.8548232, 'kof', "(
~first.ar(2);
~first.quant=4;
~first.fadeTime=2.2;
~first={
  //         |       |       |       |       |  
  var pat = [1,0,0,0,1,0,0,0,1,0,0,0,1,0,0,0].rotate(1);
    var imp = PulseDivider.kr(~tick.kr,8*fib(4),~counter.kr);
  var hit = Select.kr(PulseCount.kr(imp)%pat.size,pat);
  var env = EnvGen.ar(Env([0.001,1,0.001],[4.002,4.5],[3,-3],curve:'exp'),imp * hit);
    var sig = SinOsc.ar(50,SinOsc.ar(50/[2,4,8,16])) + SinOsc.ar(16000/[1,2,4,8]+SinOsc.ar(4).range(-200,2000),mul:0.1);
  sig = sig * env;
  Splay.ar(sig,0.75,0.75);
};
~first.play;
);" ], [ 1491.3067854, 'joach', "(
~saw8[1] = \\set -> QuantEnv(\\amp, 0.5)
.phase(1, [0,1,0.05], [1.05, 0.95], [8,-2], 0, 4)
.phase(2, [0,1,0.1,0.4,0], [0.35, 0.65], [2,-2], 0, 1)
.play([1,2]);
)" ], [ 1486.5067474, 'joach', "(
~saw8[7] = \\set -> QuantEnv(\\fplus, 0.25)
.phase(1, [0,160,0], [0.005, 0.095], [8,-8], 0, 1)
.phase(2, [0,280,0], [0.015, 0.165], [8,-8], 0, 1)
.play([1,2]);
)" ], [ 1486.5037473, 'alex', "~g[31]=\\filter-> {arg in; LPF.ar(in,\\lpf.kr(2400))};" ], [ 1485.9607447, 'kof', "(
~first.ar(2);
~first.quant=4;
~first.fadeTime=2.2;
~first={
  //         |       |       |       |       |  
  var pat = [1,0,0,0,1,0,0,0,1,0,0,0,1,0,0,0].rotate(1);
    var imp = PulseDivider.kr(~tick.kr,8*fib(4),~counter.kr);
  var hit = Select.kr(PulseCount.kr(imp)%pat.size,pat);
  var env = EnvGen.ar(Env([0.001,1,0.001],[4.002,4.5],[3,-3],curve:'exp'),imp * hit);
    var sig = SinOsc.ar(50,SinOsc.ar(50/[2,4,8,16])) + SinOsc.ar(16000/[1,2,4,8]+SinOsc.ar(40).range(-200,2000),mul:0.1);
  sig = sig * env;
  Splay.ar(sig,0.75,0.75);
};
~first.play;
);" ], [ 1473.1816615, 'joach', "(
~saw8[4] = \\set -> QuantEnv(\\freq, 36)
.phase(1, [50,56,50], [8, 4], [\\sin,\\sin], 0, 4)
.phase(2, [70,76,50], [2, 6], [2,-2], 0, 1)
.play([1,2]);
)" ], [ 1472.609659, 'alex', "~g.play(vol:0.7, fadeTime:2).quant_(8);" ], [ 1472.4696588, 'kof', "(
~kick.ar(2);
~kick.quant=2;
~kick.fadeTime=0.2;
~kick={
  //         |       |       |       |       |  
  var pat = [1,0,0,0,1,0,0,0,1,0,0,0,1,0,0,0].rotate(1);
  var imp = PulseDivider.kr(~tick.kr,8,~counter.kr);
  var hit = Select.kr(PulseCount.kr(imp)%pat.size,pat);
  var env = EnvGen.ar(Env([0.001,1,0.001],[0.002,4.5],[3,-3],curve:'exp'),imp * hit);
    var sig = SinOsc.ar(50+(env**100*100)) + Pulse.ar(5);
  sig = sig * env;
  Splay.ar(sig,0.75,0.5);
};
~kick.play;
);" ], [ 1467.6386519, 'kof', "(
~kick.ar(2);
~kick.quant=2;
~kick.fadeTime=0.2;
~kick={
  //         |       |       |       |       |  
  var pat = [1,0,0,0,1,0,0,0,1,0,0,0,1,0,0,0].rotate(1);
  var imp = PulseDivider.kr(~tick.kr,8,~counter.kr);
  var hit = Select.kr(PulseCount.kr(imp)%pat.size,pat);
  var env = EnvGen.ar(Env([0.001,1,0.001],[0.002,4.5],[3,-3],curve:'exp'),imp * hit);
    var sig = SinOsc.ar(50+(env**100*100)) + Pulse.ar(50);
  sig = sig * env;
  Splay.ar(sig,0.75,0.5);
};
~kick.play;
);" ], [ 1467.5786519, 'alex', "~g.play(vol:0.6, fadeTime:2).quant_(8);" ], [ 1462.5386448, 'alex', "~g[3]=\\set->Pbind(\\args, [\\f2], \\dur, 8, \\f2,Pseq([14,17,12,15],inf));" ], [ 1459.808641, 'alex', "~g[2]=\\set->Pbind(\\args, [\\trig], \\dur, 2, \\trig, 1);" ], [ 1458.388639, 'alex', "~g[1]=\\set->Pbind(\\args, [\\freq], \\dur, 8, \\freq,Pseq([45,65,750],inf));" ], [ 1457.3776375, 'kof', "(
~kick.ar(2);
~kick.quant=2;
~kick.fadeTime=0.2;
~kick={
  //         |       |       |       |       |  
  var pat = [1,0,0,0,1,0,0,0,1,0,0,0,1,0,0,0].rotate(1);
  var imp = PulseDivider.kr(~tick.kr,8,~counter.kr);
  var hit = Select.kr(PulseCount.kr(imp)%pat.size,pat);
  var env = EnvGen.ar(Env([0.001,1,0.001],[0.002,4.5],[3,-3],curve:'exp'),imp * hit);
    var sig = SinOsc.ar(50+(env**100*100)) + Pulse.ar(4);
  sig = sig * env;
  Splay.ar(sig,0.75,0.5);
};
~kick.play;
);" ], [ 1455.557635, 'alex', "(
~g[0]={
	var sig2,sig1, env, fenv,f2env;

	env=EnvGen.kr(Env([0,1,0], [0.5,0.01], [\\welch, \\step]), \\trig.tr);
	fenv=EnvGen.kr(Env([\\freq.kr,\\freq.kr*4], [2], \\welch), \\trig.tr);
	f2env=EnvGen.kr(Env([\\f2.kr(4),\\f2.kr(4)*4], [1], \\welch), \\trig.tr);
	
	// sig1=
	sig2=HPF.ar(GrayNoise.ar([0.5,0.7])*LFSaw.ar(f2env!2),fenv)*env;
	};
)" ], [ 1451.1255996, 'joach', "~saw8[3] = \\filter -> {|in| GVerb.ar(in, \\gverb_size.kr(6), \\gverb_time.kr(0.66), 0.9, mul:\\mulgverb.kr(1)) };" ], [ 1451.0065956, 'kof', "(
~ff.quant=1;
~ff.fadeTime=1;
~ff={
  var high,mid,low;
  var sig = ~first + ~kick;
  
  sig = GVerb.ar(LPF.ar(sig,5000)+HPF.ar(sig,500),40,[3,4,5,6],spread:[40,90])/8 + sig;
  low = CompanderD.ar(LPF.ar(sig,400),3/4,1/2,1/2);
  mid = CompanderD.ar(BPF.ar(sig,600,2),3/4,1/2,1/2);
  high = CompanderD.ar(HPF.ar(sig,900),3/4,1/2,1/2);
  sig = CompanderD.ar((high+mid+low).flat,3/4,1/1.1,1/1.1);
  Splay.ar(sig,0.75,0.25);
};
~ff.play;
);" ], [ 1441.1965819, 'kof', "(
~ff.quant=1;
~ff.fadeTime=1;
~ff={
  var high,mid,low;
  var sig = ~first + ~kick;
  
  sig = GVerb.ar(LPF.ar(sig,5000)+HPF.ar(sig,500),40,[3,4,5,6],spread:[40,90])/8 + sig;
  low = CompanderD.ar(LPF.ar(sig,400),3/4,1/3,1/2);
  mid = CompanderD.ar(BPF.ar(sig,600,2),3/4,1/2,1/2);
  high = CompanderD.ar(HPF.ar(sig,900),3/4,1/3,1/2);
  sig = CompanderD.ar((high+mid+low).flat,3/4,1/1.1,1/1.1);
  Splay.ar(sig,0.75,0.25);
};
~ff.play;
);" ], [ 1436.5065753, 'kof', "(
~ff.quant=1;
~ff.fadeTime=1;
~ff={
  var high,mid,low;
  var sig = ~first + ~kick;
  
  sig = GVerb.ar(LPF.ar(sig,5000)+HPF.ar(sig,500),40,[3,4,5,6],spread:[40,90])/8 + sig;
  low = CompanderD.ar(LPF.ar(sig,400),3/4,1/3,1/2);
  mid = CompanderD.ar(BPF.ar(sig,600,2),3/4,1/2,1/2);
  high = CompanderD.ar(HPF.ar(sig,900),3/4,1/2,1/2);
  sig = CompanderD.ar((high+mid+low).flat,3/4,1/1.1,1/1.1);
  Splay.ar(sig,0.75,0.25);
};
~ff.play;
);" ], [ 1429.6045656, 'alex', "~b.play(vol:1, fadeTime:2).quant_(8);" ], [ 1428.504564, 'kof', "(
~ff.quant=1;
~ff.fadeTime=1;
~ff={
  var high,mid,low;
  var sig = ~first + ~kick;
  
  sig = GVerb.ar(LPF.ar(sig,5000)+HPF.ar(sig,500),40,[3,4,5,6],spread:[40,90])/8 + sig;
  low = CompanderD.ar(LPF.ar(sig,400),3/4,1/2,1/2);
  mid = CompanderD.ar(BPF.ar(sig,600,2),3/4,1/2,1/2);
  high = CompanderD.ar(HPF.ar(sig,900),3/4,1/2,1/2);
  sig = CompanderD.ar((high+mid+low).flat,3/4,1/1.1,1/1.1);
  Splay.ar(sig,0.75,0.25);
};
~ff.play;
);" ], [ 1424.5745585, 'alex', "~b[31]=\\filter-> {arg in; LPF.ar(in,\\lpf.kr(16800))};" ], [ 1423.0545564, 'alex', "~b[30]=\\filter-> {arg in; GVerb.ar(in,2, [6,8],add:in)};" ], [ 1421.6245544, 'alex', "~b[2]=\\set->Pbind(\\args, [\\trig], \\dur, 8, \\trig, 1);" ], [ 1420.4245449, 'alex', "~b[1]=\\set->Pbind(\\args, [\\freq], \\dur, 2, \\freq,Prand([440,220,85,98,165,750],inf));" ], [ 1419.9975205, 'joach', "~saw8.stop(16);" ], [ 1417.3645155, 'alex', "(
~b[0]={
	var sig, env, fenv,f2env;

	env=EnvGen.kr(Env([0,1,0], [2,8], [\\welch, \\lin]), \\trig.tr);
	
	sig=BPF.ar(PinkNoise.ar([0.2,0.7]),\\freq.kr+[1,2,3,5].reciprocal,rq:LFNoise0.kr(20).range(0.0001,2));
	sig-sig*env;
	};
)" ], [ 1416.1045137, 'kof', "(
~first.ar(2);
~first.quant=4;
~first.fadeTime=2.2;
~first={
  //         |       |       |       |       |  
  var pat = [1,0,0,0,1,0,0,0,1,0,0,0,1,0,0,0].rotate(1);
    var imp = PulseDivider.kr(~tick.kr,8*fib(4),~counter.kr);
  var hit = Select.kr(PulseCount.kr(imp)%pat.size,pat);
  var env = EnvGen.ar(Env([0.001,1,0.001],[4.002,4.5],[3,-3],curve:'exp'),imp * hit);
    var sig = SinOsc.ar(50,SinOsc.ar(50/[2,4,8,16])) + Pulse.ar(50/(fib(4))) + SinOsc.ar(16000/[1,2,4,8]+SinOsc.ar(40).range(-200,2000),mul:0.1);
  sig = sig * env;
  Splay.ar(sig,0.75,0.75);
};
~first.play;
);" ], [ 1411.1574729, 'joach', "(
~saw8[7] = \\set -> QuantEnv(\\fplus, 0.5)
.phase(1, [0,160,0], [0.005, 0.095], [8,-8], 0, 1)
.phase(2, [0,280,0], [0.015, 0.165], [8,-8], 0, 1)
.play([1,2]);
)" ], [ 1403.2554618, 'alex', "~b[31]=\\filter-> {arg in; LPF.ar(in,\\lpf.kr(16800))};" ], [ 1400.0754573, 'kof', "(
~ff.quant=1;
~ff.fadeTime=1;
~ff={
  var high,mid,low;
  var sig = ~first + ~kick;
  
  sig = GVerb.ar(LPF.ar(sig,5000)+HPF.ar(sig,500),40,[3,4,5,6],spread:[40,90])/8 + sig;
  low = CompanderD.ar(LPF.ar(sig,400),3/4,1/2,1/2);
  mid = CompanderD.ar(BPF.ar(sig,600,2),3/4,1/2,1/2);
  high = CompanderD.ar(HPF.ar(sig,900),3/4,1/2,1/2);
  sig = CompanderD.ar((high+mid+low).flat,3/4,1/1.1,1/1.1);
  Splay.ar(sig,0.75,0.125);
};
~ff.play;
);" ], [ 1398.268422, 'joach', "(
~saw8[7] = \\set -> QuantEnv(\\fplus, 0.5)
.phase(1, [0,160,0], [0.005, 0.095], [8,-8], 0, 1)
.phase(2, [0,80,0], [0.015, 0.165], [8,-8], 0, 1)
.play([1,2]);
)" ], [ 1397.1284193, 'alex', "~b[31]=\\filter-> {arg in; LPF.ar(in,\\lpf.kr(6800))};" ], [ 1396.8084189, 'kof', "(
~ff.quant=1;
~ff.fadeTime=1;
~ff={
  var high,mid,low;
  var sig = ~first + ~kick;
  
  sig = GVerb.ar(LPF.ar(sig,5000)+HPF.ar(sig,500),40,[3,4,5,6],spread:[40,90])/8 + sig;
  low = CompanderD.ar(LPF.ar(sig,400),3/4,1/2,1/2);
  mid = CompanderD.ar(BPF.ar(sig,600,2),3/4,1/2,1/2);
  high = CompanderD.ar(HPF.ar(sig,900),3/4,1/2,1/2);
  sig = CompanderD.ar((high+mid+low).flat,3/4,1/1.1,1/1.1);
  Splay.ar(sig,0.75,0.025);
};
~ff.play;
);" ], [ 1394.0143813, 'joach', "(
~saw8[7] = \\set -> QuantEnv(\\fplus, 0.5)
.phase(1, [0,60,0], [0.005, 0.095], [8,-8], 0, 1)
.phase(2, [0,80,0], [0.015, 0.165], [8,-8], 0, 1)
.play([1,2]);
)" ], [ 1393.931381, 'alex', "	" ], [ 1389.191342, 'joach', "(
~saw8[7] = \\set -> QuantEnv(\\fplus, 1)
.phase(1, [0,60,0], [0.005, 0.095], [8,-8], 0, 1)
.phase(2, [0,80,0], [0.015, 0.165], [8,-8], 0, 1)
.play([1,2]);
)" ], [ 1388.9093409, 'alex', "~b[31]=\\filter-> {arg in; LPF.ar(in,\\lpf.kr(1800))};" ], [ 1387.5993391, 'alex', "~b[30]=\\filter-> {arg in; GVerb.ar(in,2, [6,8],add:in)};" ], [ 1385.7093364, 'alex', "~b[2]=\\set->Pbind(\\args, [\\trig], \\dur, 8, \\trig, 1);" ], [ 1384.6193349, 'alex', "~b[1]=\\set->Pbind(\\args, [\\freq], \\dur, 2, \\freq,Prand([440,220,85,98,165,750],inf));" ], [ 1382.6373036, 'joach', "(
~saw8[6] = \\set -> QuantEnv(\\pan, 1)
.phase(1, [-0.8,0.8,0.8], [0.45, 0.45], [2,-2], 0, 1)
.phase(2, [0,1,0], [0.35, 0.65], [2,-2], 0, 1)
.play([1]);
)" ], [ 1380.6782964, 'alex', "(
~b[0]={
	var sig, env, fenv,f2env;

	env=EnvGen.kr(Env([0,1,0], [2,8], [\\welch, \\lin]), \\trig.tr);
	
	sig=BPF.ar(PinkNoise.ar([0.2,0.7]),\\freq.kr+[1,2,3,5].reciprocal,rq:LFNoise0.kr(20).range(0.0001,2));
	sig-sig*env;
	};
)" ], [ 1376.9482912, 'alex', "~b.play(vol:1, fadeTime:2).quant_(8);" ], [ 1374.1082872, 'alex', "~b.play(vol:0.7, fadeTime:2).quant_(8);" ], [ 1369.1932482, 'joach', "(
~saw8[6] = \\set -> QuantEnv(\\pan, 8)
.phase(1, [-0.8,0.8,0.8], [4.05, 3.95], [2,-2], 0, 1)
.phase(2, [0,1,0], [0.35, 0.65], [2,-2], 0, 1)
.play([1]);
)" ], [ 1362.9982376, 'alex', "~b.play(vol:0.3, fadeTime:2).quant_(8);" ], [ 1361.8722061, 'joach', "~saw8.set(\\lpf_freq, 800);" ], [ 1359.592199, 'alex', "~b[31]=\\filter-> {arg in; LPF.ar(in,\\lpf.kr(1800))};" ], [ 1357.412196, 'alex', "~b[30]=\\filter-> {arg in; GVerb.ar(in,2, [6,8],add:in)};" ], [ 1354.2281634, 'joach', "~saw8.set(\\lpf_freq, 400);" ], [ 1351.0121541, 'kof', "(
~first.ar(2);
~first.quant=4;
~first.fadeTime=2.2;
~first={
  //         |       |       |       |       |  
  var pat = [1,0,0,0,1,0,0,0,1,0,0,0,1,0,0,0].rotate(1);
    var imp = PulseDivider.kr(~tick.kr,8*fib(4),~counter.kr);
  var hit = Select.kr(PulseCount.kr(imp)%pat.size,pat);
  var env = EnvGen.ar(Env([0.001,1,0.001],[4.002,4.5],[3,-3],curve:'exp'),imp * hit);
    var sig = SinOsc.ar(50,SinOsc.ar(50/[2,4,8,16])) + Pulse.ar(50/(fib(4))+SinOsc.ar(1/4).range(-4,4)) + SinOsc.ar(16000/[1,2,4,8]+SinOsc.ar(40).range(-200,2000),mul:0.1);
  sig = sig * env;
  Splay.ar(sig,0.75,0.75);
};
~first.play;
);" ], [ 1344.1611444, 'alex', "~b[2]=\\set->Pbind(\\args, [\\trig], \\dur, 8, \\trig, 1);" ], [ 1343.0811429, 'alex', "~b[1]=\\set->Pbind(\\args, [\\freq], \\dur, 2, \\freq,Prand([440,220,85,98,165,750],inf));" ], [ 1340.2311389, 'alex', "(
~b[0]={
	var sig, env, fenv,f2env;

	env=EnvGen.kr(Env([0,1,0], [2,8], [\\welch, \\lin]), \\trig.tr);
	
	sig=BPF.ar(PinkNoise.ar([0.2,0.7]),\\freq.kr+[1,2,3,5].reciprocal,rq:LFNoise0.kr(20).range(0.0001,2));
	sig-sig*env;
	};
)" ], [ 1340.1811389, 'kof', "(
~first.ar(2);
~first.quant=4;
~first.fadeTime=2.2;
~first={
  //         |       |       |       |       |  
  var pat = [1,0,0,0,1,0,0,0,1,0,0,0,1,0,0,0].rotate(1);
    var imp = PulseDivider.kr(~tick.kr,8*fib(4),~counter.kr);
  var hit = Select.kr(PulseCount.kr(imp)%pat.size,pat);
  var env = EnvGen.ar(Env([0.001,1,0.001],[4.002,4.5],[3,-3],curve:'exp'),imp * hit);
    var sig = SinOsc.ar(50,SinOsc.ar(50/4)) + Pulse.ar(50/(fib(4))+SinOsc.ar(1/4).range(-4,40)) + SinOsc.ar(16000/[1,2,4,8]+SinOsc.ar(40).range(-200,2000),mul:0.1);
  sig = sig * env;
  Splay.ar(sig,0.75,0.75);
};
~first.play;
);" ], [ 1339.2721064, 'joach', "(
~saw8[4] = \\set -> QuantEnv(\\freq, 16)
.phase(1, [50,56,50], [8, 4], [\\sin,\\sin], 0, 4)
.phase(2, [70,76,50], [2, 6], [2,-2], 0, 1)
.play([1,2]);
)" ], [ 1331.0880752, 'kof', "(
~first.ar(2);
~first.quant=4;
~first.fadeTime=2.2;
~first={
  //         |       |       |       |       |  
  var pat = [1,0,0,0,1,0,0,0,1,0,0,0,1,0,0,0].rotate(1);
    var imp = PulseDivider.kr(~tick.kr,8*fib(4),~counter.kr);
  var hit = Select.kr(PulseCount.kr(imp)%pat.size,pat);
  var env = EnvGen.ar(Env([0.001,1,0.001],[4.002,4.5],[3,-3],curve:'exp'),imp * hit);
    var sig = SinOsc.ar(50,SinOsc.ar(50/4)) + Pulse.ar(50/(fib(4))+SinOsc.ar(1/4).range(-4,4)) + SinOsc.ar(16000/[1,2,4,8]+SinOsc.ar(40).range(-200,2000),mul:0.1);
  sig = sig * env;
  Splay.ar(sig,0.75,0.75);
};
~first.play;
);" ], [ 1330.8600622, 'joach', "(
~saw8[1] = \\set -> QuantEnv(\\amp, 2)
.phase(1, [0,1,0.05], [1.05, 0.95], [8,-2], 0, 4)
.phase(2, [0,1,0.1,0.4,0], [0.35, 0.65], [2,-2], 0, 1)
.play([1,2]);
)" ], [ 1328.818057, 'alex', "(
~b[0]={
	var sig,sig1, env, fenv,f2env;

	env=EnvGen.kr(Env([0,1,0], [2,8], [\\welch, \\lin]), \\trig.tr);
	
	sig=BPF.ar(PinkNoise.ar([0.2,0.7]),\\freq.kr+[1,2,3,5].reciprocal,rq:LFNoise0.kr(20).range(0.0001,2));
	sig-sig*env;
	};
)" ], [ 1311.8980333, 'kof', "(
~first.ar(2);
~first.quant=4;
~first.fadeTime=2.2;
~first={
  //         |       |       |       |       |  
  var pat = [1,0,0,0,1,0,0,0,1,0,0,0,1,0,0,0].rotate(1);
    var imp = PulseDivider.kr(~tick.kr,8*fib(4),~counter.kr);
  var hit = Select.kr(PulseCount.kr(imp)%pat.size,pat);
  var env = EnvGen.ar(Env([0.001,1,0.001],[4.002,4.5],[3,-3],curve:'exp'),imp * hit);
    var sig = SinOsc.ar(50,SinOsc.ar(50/4)) + Pulse.ar(50/(fib(4))) + SinOsc.ar(16000/[1,2,4,8]+SinOsc.ar(40).range(-200,2000),mul:0.1);
  sig = sig * env;
  Splay.ar(sig,0.75,0.75);
};
~first.play;
);" ], [ 1303.828022, 'kof', "(
~first.ar(2);
~first.quant=4;
~first.fadeTime=2.2;
~first={
  //         |       |       |       |       |  
  var pat = [1,0,0,0,1,0,0,0,1,0,0,0,1,0,0,0].rotate(1);
    var imp = PulseDivider.kr(~tick.kr,8*fib(4),~counter.kr);
  var hit = Select.kr(PulseCount.kr(imp)%pat.size,pat);
  var env = EnvGen.ar(Env([0.001,1,0.001],[4.002,4.5],[3,-3],curve:'exp'),imp * hit);
    var sig = SinOsc.ar(50,SinOsc.ar(50/4)) + Pulse.ar(500/(fib(4))) + SinOsc.ar(16000/[1,2,4,8]+SinOsc.ar(40).range(-200,2000),mul:0.1);
  sig = sig * env;
  Splay.ar(sig,0.75,0.75);
};
~first.play;
);" ], [ 1301.4859901, 'joach', "(
~saw8[1] = \\set -> QuantEnv(\\amp, 2)
.phase(1, [0,1,0], [1.05, 0.95], [8,-2], 0, 4)
.phase(2, [0,1,0.1,0.4,0], [0.35, 0.65], [2,-2], 0, 1)
.play([1,2]);
)" ], [ 1296.755979, 'kof', "(
~first.ar(2);
~first.quant=4;
~first.fadeTime=2.2;
~first={
  //         |       |       |       |       |  
  var pat = [1,0,0,0,1,0,0,0,1,0,0,0,1,0,0,0].rotate(1);
    var imp = PulseDivider.kr(~tick.kr,8*fib(4),~counter.kr);
  var hit = Select.kr(PulseCount.kr(imp)%pat.size,pat);
  var env = EnvGen.ar(Env([0.001,1,0.001],[4.002,4.5],[3,-3],curve:'exp'),imp * hit);
    var sig = SinOsc.ar(50,SinOsc.ar(50/4)) + Pulse.ar(50/(fib(4))) + SinOsc.ar(16000/[1,2,4,8]+SinOsc.ar(40).range(-200,2000),mul:0.1);
  sig = sig * env;
  Splay.ar(sig,0.75,0.75);
};
~first.play;
);" ], [ 1290.6959706, 'kof', "(
~first.ar(2);
~first.quant=4;
~first.fadeTime=2.2;
~first={
  //         |       |       |       |       |  
  var pat = [1,0,0,0,1,0,0,0,1,0,0,0,1,0,0,0].rotate(1);
    var imp = PulseDivider.kr(~tick.kr,8*fib(4),~counter.kr);
  var hit = Select.kr(PulseCount.kr(imp)%pat.size,pat);
  var env = EnvGen.ar(Env([0.001,1,0.001],[4.002,4.5],[3,-3],curve:'exp'),imp * hit);
    var sig = SinOsc.ar(50,SinOsc.ar(50/4)) + Pulse.ar(50/(fib(4))) + SinOsc.ar(1600/[1,2,4,8]+SinOsc.ar(40).range(-200,2000),mul:0.1);
  sig = sig * env;
  Splay.ar(sig,0.75,0.75);
};
~first.play;
);" ], [ 1284.1189319, 'joach', "~saw8.set(\\lpf_freq, 2400);" ], [ 1282.2628955, 'joach', "~saw8.set(\\lpf_freq, 1400);" ], [ 1272.8948797, 'kof', "(
~ff.quant=1;
~ff.fadeTime=1;
~ff={
  var high,mid,low;
  var sig = ~first;
  
  sig = GVerb.ar(LPF.ar(sig,5000)+HPF.ar(sig,500),40,[3,4,5,6],spread:[40,90])/8 + sig;
  low = CompanderD.ar(LPF.ar(sig,400),3/4,1/2,1/2);
  mid = CompanderD.ar(BPF.ar(sig,600,2),3/4,1/2,1/2);
  high = CompanderD.ar(HPF.ar(sig,900),3/4,1/2,1/2);
  sig = CompanderD.ar((high+mid+low).flat,3/4,1/1.1,1/1.1);
  Splay.ar(sig,0.75,0.025);
};
~ff.play;
);" ], [ 1268.18184, 'joach', "(
~saw8[1] = \\set -> QuantEnv(\\amp, 2)
.phase(1, [0,0.2,0], [1.05, 0.95], [8,-2], 0, 4)
.phase(2, [0,0.8,0.1,0.4,0], [0.35, 0.65], [2,-2], 0, 1)
.play([1,2]);
)" ], [ 1259.6477994, 'joach', "(
~saw8[7] = \\set -> QuantEnv(\\fplus, 2)
.phase(1, [0,60,0], [0.005, 0.095], [8,-8], 0, 1)
.phase(2, [0,80,0], [0.015, 0.165], [8,-8], 0, 1)
.play([1,2]);
)" ], [ 1257.2427584, 'joach', "(
~saw8[7] = \\set -> QuantEnv(\\fplus, 2)
.phase(1, [0,60,0], [0.005, 0.095], [8,-8], 0, 1)
.phase(2, [0,80,0], [0.015, 0.165], [2,-8], 0, 1)
.play([1,2]);
)" ], [ 1255.7167275, 'joach', "(
~saw8[7] = \\set -> QuantEnv(\\fplus, 2)
.phase(1, [0,60,0], [0.005, 0.095], [8,-8], 0, 1)
.phase(2, [0,80,0], [0.015, 0.165], [2,-2], 0, 1)
.play([1,2]);
)" ], [ 1254.0766889, 'joach', "(
~saw8[7] = \\set -> QuantEnv(\\fplus, 2)
.phase(1, [0,60,0], [0.005, 0.095], [8,-2], 0, 1)
.phase(2, [0,80,0], [0.015, 0.165], [2,-2], 0, 1)
.play([1,2]);
)" ], [ 1250.1476483, 'joach', "(
~saw8[7] = \\set -> QuantEnv(\\fplus, 2)
.phase(1, [0,60,0], [0.005, 0.095], [2,-2], 0, 1)
.phase(2, [0,80,0], [0.015, 0.165], [2,-2], 0, 1)
.play([1,2]);
)" ], [ 1248.4696455, 'kof', "(
~first.ar(2);
~first.quant=4;
~first.fadeTime=2.2;
~first={
  //         |       |       |       |       |  
  var pat = [1,0,0,0,1,0,0,0,1,0,0,0,1,0,0,0].rotate(1);
    var imp = PulseDivider.kr(~tick.kr,8*fib(4),~counter.kr);
  var hit = Select.kr(PulseCount.kr(imp)%pat.size,pat);
  var env = EnvGen.ar(Env([0.001,1,0.001],[4.002,4.5],[3,-3],curve:'exp'),imp * hit);
    var sig = SinOsc.ar(50,SinOsc.ar(50/4)) + Pulse.ar(50/(fib(4))) + SinOsc.ar(16000/[1,2,4,8]+SinOsc.ar(40).range(-200,2000),mul:0.1);
  sig = sig * env;
  Splay.ar(sig,0.75,0.75);
};
~first.play;
);" ], [ 1248.2696452, 'alex', "~g.play(vol:0.3, fadeTime:2).quant_(8);" ], [ 1245.1786408, 'alex', "~g.play(vol:0.2, fadeTime:2).quant_(8);" ], [ 1243.7046073, 'joach', "(
~saw8[7] = \\set -> QuantEnv(\\fplus, 2)
.phase(1, [0,60,0], [0.005, 0.095], [2,-2], 0, 1)
.phase(2, [0,80,0], [0.35, 0.65], [2,-2], 0, 1)
.play([1,2]);
)" ], [ 1233.0435906, 'alex', "~g[31]=\\filter-> {arg in; LPF.ar(in,\\lpf.kr(1400))};" ], [ 1225.3935799, 'alex', "~g[30]=\\filter-> {arg in; GVerb.ar(in,[80,40], [25,18],add:in)};" ], [ 1222.0835446, 'joach', "(
~saw8[7] = \\set -> QuantEnv(\\fplus, 2)
.phase(1, [0,60,0], [0.05, 0.95], [2,-2], 0, 1)
.phase(2, [0,80,0], [0.35, 0.65], [2,-2], 0, 1)
.play([1,2]);
)" ], [ 1212.0515282, 'kof', "(
~first.ar(2);
~first.quant=4;
~first.fadeTime=2.2;
~first={
  //         |       |       |       |       |  
  var pat = [1,0,0,0,1,0,0,0,1,0,0,0,1,0,0,0].rotate(1);
    var imp = PulseDivider.kr(~tick.kr,8*fib(4),~counter.kr);
  var hit = Select.kr(PulseCount.kr(imp)%pat.size,pat);
  var env = EnvGen.ar(Env([0.001,1,0.001],[4.002,4.5],[3,-3],curve:'exp'),imp * hit);
    var sig = SinOsc.ar(50,SinOsc.ar(50/4)) + Pulse.ar(4*(fib(4))) + SinOsc.ar(15000/[1,2,4,8]+SinOsc.ar(40).range(-200,2000),mul:0.1);
  sig = sig * env;
  Splay.ar(sig,0.75,0.75);
};
~first.play;
);" ], [ 1206.24052, 'kof', "(
~first.ar(2);
~first.quant=4;
~first.fadeTime=2.2;
~first={
  //         |       |       |       |       |  
  var pat = [1,0,0,0,1,0,0,0,1,0,0,0,1,0,0,0].rotate(1);
    var imp = PulseDivider.kr(~tick.kr,8*fib(4),~counter.kr);
  var hit = Select.kr(PulseCount.kr(imp)%pat.size,pat);
  var env = EnvGen.ar(Env([0.001,1,0.001],[4.002,4.5],[3,-3],curve:'exp'),imp * hit);
    var sig = SinOsc.ar(50,SinOsc.ar(50/4)) + Pulse.ar(16) + SinOsc.ar(15000/[1,2,4,8]+SinOsc.ar(40).range(-200,2000),mul:0.1);
  sig = sig * env;
  Splay.ar(sig,0.75,0.75);
};
~first.play;
);" ], [ 1202.9905155, 'alex', "~g[31]=\\filter-> {arg in; LPF.ar(in,\\lpf.kr(400))};" ], [ 1198.6895094, 'kof', "(
~first.ar(2);
~first.quant=4;
~first.fadeTime=2.2;
~first={
  //         |       |       |       |       |  
  var pat = [1,0,0,0,1,0,0,0,1,0,0,0,1,0,0,0].rotate(1);
    var imp = PulseDivider.kr(~tick.kr,8*fib(4),~counter.kr);
  var hit = Select.kr(PulseCount.kr(imp)%pat.size,pat);
  var env = EnvGen.ar(Env([0.001,1,0.001],[4.002,4.5],[3,-3],curve:'exp'),imp * hit);
    var sig = SinOsc.ar(50,SinOsc.ar(50/4)) + Pulse.ar(8) + SinOsc.ar(15000/[1,2,4,8]+SinOsc.ar(40).range(-200,2000),mul:0.1);
  sig = sig * env;
  Splay.ar(sig,0.75,0.75);
};
~first.play;
);" ], [ 1197.6164793, 'joach', "(
~saw8[1] = \\set -> QuantEnv(\\amp, 4)
.phase(1, [0,0.2,0], [1.05, 0.95], [8,-2], 0, 4)
.phase(2, [0,0.8,0.1,0.4,0], [0.35, 0.65], [2,-2], 0, 1)
.play([1,2]);
)" ], [ 1190.0784644, 'kof', "(
~first.ar(2);
~first.quant=4;
~first.fadeTime=2.2;
~first={
  //         |       |       |       |       |  
  var pat = [1,0,0,0,1,0,0,0,1,0,0,0,1,0,0,0].rotate(1);
    var imp = PulseDivider.kr(~tick.kr,8*fib(4),~counter.kr);
  var hit = Select.kr(PulseCount.kr(imp)%pat.size,pat);
  var env = EnvGen.ar(Env([0.001,1,0.001],[4.002,4.5],[3,-3],curve:'exp'),imp * hit);
    var sig = SinOsc.ar(50,SinOsc.ar(50/4)) + Pulse.ar(2) + SinOsc.ar(15000/[1,2,4,8]+SinOsc.ar(40).range(-200,2000),mul:0.1);
  sig = sig * env;
  Splay.ar(sig,0.75,0.75);
};
~first.play;
);" ], [ 1179.0484489, 'kof', "(
~first.ar(2);
~first.quant=2;
~first.fadeTime=2.2;
~first={
  //         |       |       |       |       |  
  var pat = [1,0,0,0,1,0,0,0,1,0,0,0,1,0,0,0].rotate(1);
    var imp = PulseDivider.kr(~tick.kr,8*fib(4),~counter.kr);
  var hit = Select.kr(PulseCount.kr(imp)%pat.size,pat);
  var env = EnvGen.ar(Env([0.001,1,0.001],[4.002,4.5],[3,-3],curve:'exp'),imp * hit);
    var sig = SinOsc.ar(50,SinOsc.ar(50/2)) + Pulse.ar(2) + SinOsc.ar(15000/[1,2,4,8]+SinOsc.ar(40).range(-200,2000),mul:0.1);
  sig = sig * env;
  Splay.ar(sig,0.75,0.75);
};
~first.play;
);" ], [ 1176.6524162, 'joach', "(
~saw8[6] = \\set -> QuantEnv(\\pan, 8)
.phase(1, [-0.8,0.8,0.8], [0.05, 7.95], [2,-2], 0, 1)
.phase(2, [0,1,0], [0.35, 0.65], [2,-2], 0, 1)
.play([1]);
)" ], [ 1171.0064046, 'kof', "(
~first.ar(2);
~first.quant=2;
~first.fadeTime=2.2;
~first={
  //         |       |       |       |       |  
  var pat = [1,0,0,0,1,0,0,0,1,0,0,0,1,0,0,0].rotate(1);
    var imp = PulseDivider.kr(~tick.kr,8*fib(4),~counter.kr);
  var hit = Select.kr(PulseCount.kr(imp)%pat.size,pat);
  var env = EnvGen.ar(Env([0.001,1,0.001],[4.002,4.5],[3,-3],curve:'exp'),imp * hit);
    var sig = SinOsc.ar(50,SinOsc.ar(50)) + Pulse.ar(2) + SinOsc.ar(15000/[1,2,4,8]+SinOsc.ar(40).range(-200,2000),mul:0.1);
  sig = sig * env;
  Splay.ar(sig,0.75,0.75);
};
~first.play;
);" ], [ 1156.1553838, 'kof', "(
~first.ar(2);
~first.quant=2;
~first.fadeTime=2.2;
~first={
  //         |       |       |       |       |  
  var pat = [1,0,0,0,1,0,0,0,1,0,0,0,1,0,0,0].rotate(1);
  var imp = PulseDivider.kr(~tick.kr,8,~counter.kr);
  var hit = Select.kr(PulseCount.kr(imp)%pat.size,pat);
  var env = EnvGen.ar(Env([0.001,1,0.001],[4.002,4.5],[3,-3],curve:'exp'),imp * hit);
    var sig = SinOsc.ar(50,SinOsc.ar(50)) + Pulse.ar(2) + SinOsc.ar(15000/[1,2,4,8]+SinOsc.ar(40).range(-200,2000),mul:0.1);
  sig = sig * env;
  Splay.ar(sig,0.75,0.75);
};
~first.play;
);" ], [ 1155.0133821, 'alex', "(
~g[0]={
	var sig2,sig1, env, fenv,f2env;

	env=EnvGen.kr(Env([0,1,0], [1,0.01], [\\welch, \\step]), \\trig.tr);
	fenv=EnvGen.kr(Env([\\freq.kr,\\freq.kr*4], [2], \\welch), \\trig.tr);
	f2env=EnvGen.kr(Env([\\f2.kr(4),\\f2.kr(4)*4], [1], \\welch), \\trig.tr);
	
	// sig1=
	sig2=HPF.ar(GrayNoise.ar([0.5,0.7])*LFSaw.ar(f2env!2),fenv)*env;
	};
)" ], [ 1152.1733781, 'alex', "(
~g[0]={
	var sig2,sig1, env, fenv,f2env;

	env=EnvGen.kr(Env([0,1,0], [1,0.01], [\\welch, \\step]), \\trig.tr);
	fenv=EnvGen.kr(Env([\\freq.kr,\\freq.kr*4], [2], \\welch), \\trig.tr);
	f2env=EnvGen.kr(Env([\\f2.kr(4),\\f2.kr(4)*10], [1], \\welch), \\trig.tr);
	
	// sig1=
	sig2=HPF.ar(GrayNoise.ar([0.5,0.7])*LFSaw.ar(f2env!2),fenv)*env;
	};
)" ], [ 1147.0233709, 'alex', "(
~g[0]={
	var sig2,sig1, env, fenv,f2env;

	env=EnvGen.kr(Env([0,1,0], [1,0.01], [\\welch, \\step]), \\trig.tr);
	fenv=EnvGen.kr(Env([\\freq.kr,\\freq.kr*4], [2], \\welch), \\trig.tr);
	f2env=EnvGen.kr(Env([\\f2.kr(4),\\f2.kr(4)*10], [2], \\welch), \\trig.tr);
	
	// sig1=
	sig2=HPF.ar(GrayNoise.ar([0.5,0.7])*LFSaw.ar(f2env!2),fenv)*env;
	};
)" ], [ 1140.8923622, 'kof', "(
~first.ar(2);
~first.quant=2;
~first.fadeTime=2.2;
~first={
  //         |       |       |       |       |  
  var pat = [1,0,0,0,1,0,0,0,1,0,0,0,1,0,0,0].rotate(1);
  var imp = PulseDivider.kr(~tick.kr,8,~counter.kr);
  var hit = Select.kr(PulseCount.kr(imp)%pat.size,pat);
  var env = EnvGen.ar(Env([0.001,1,0.001],[4.002,4.5],[3,-3],curve:'exp'),imp * hit);
    var sig = SinOsc.ar(50,SinOsc.ar(50)) + Pulse.ar(2) + SinOsc.ar(15000/[1,2,4,8]+SinOsc.ar(400).range(-200,2000),mul:0.1);
  sig = sig * env;
  Splay.ar(sig,0.75,0.75);
};
~first.play;
);" ], [ 1133.4023518, 'kof', "(
~first.ar(2);
~first.quant=2;
~first.fadeTime=2.2;
~first={
  //         |       |       |       |       |  
  var pat = [1,0,0,0,1,0,0,0,1,0,0,0,1,0,0,0].rotate(1);
  var imp = PulseDivider.kr(~tick.kr,8,~counter.kr);
  var hit = Select.kr(PulseCount.kr(imp)%pat.size,pat);
  var env = EnvGen.ar(Env([0.001,1,0.001],[4.002,4.5],[3,-3],curve:'exp'),imp * hit);
    var sig = SinOsc.ar(50,SinOsc.ar(50)) + Pulse.ar(2) + SinOsc.ar(15000/[1,2,4,8]+SinOsc.ar(400).range(-200,200),mul:0.1);
  sig = sig * env;
  Splay.ar(sig,0.75,0.75);
};
~first.play;
);" ], [ 1133.2223515, 'alex', "~g[30]=\\filter-> {arg in; GVerb.ar(in,[80,40], [15,18],add:in)};" ], [ 1122.8203368, 'alex', "~g[3]=\\set->Pbind(\\args, [\\f2], \\dur, 8, \\f2,Pseq([14,17,12,15],inf));" ], [ 1109.8993187, 'kof', "(
~first.ar(2);
~first.quant=2;
~first.fadeTime=2.2;
~first={
  //         |       |       |       |       |  
  var pat = [1,0,0,0,1,0,0,0,1,0,0,0,1,0,0,0].rotate(1);
  var imp = PulseDivider.kr(~tick.kr,8,~counter.kr);
  var hit = Select.kr(PulseCount.kr(imp)%pat.size,pat);
  var env = EnvGen.ar(Env([0.001,1,0.001],[4.002,4.5],[3,-3],curve:'exp'),imp * hit);
    var sig = SinOsc.ar(50,SinOsc.ar(50)) + Pulse.ar(2) + SinOsc.ar(15000/[1,2,4,8]+SinOsc.ar(40).range(-200,200),mul:0.1);
  sig = sig * env;
  Splay.ar(sig,0.75,0.75);
};
~first.play;
);" ], [ 1108.709317, 'alex', "~g[31]=\\filter-> {arg in; LPF.ar(in,\\lpf.kr(1800))};" ], [ 1105.3282793, 'joach', "(
~saw8[4] = \\set -> QuantEnv(\\freq, 16)
.phase(1, [50,66,50], [8, 4], [\\sin,\\sin], 0, 4)
.phase(2, [70,76,50], [2, 6], [2,-2], 0, 1)
.play([1,2]);
)" ], [ 1097.2082679, 'alex', "(
~g[0]={
	var sig2,sig1, env, fenv,f2env;

	env=EnvGen.kr(Env([0,1,0], [1,0.01], [\\welch, \\step]), \\trig.tr);
	fenv=EnvGen.kr(Env([\\freq.kr,\\freq.kr*4], [2], \\welch), \\trig.tr);
	f2env=EnvGen.kr(Env([\\f2.kr(4),\\f2.kr(4)*4], [2], \\welch), \\trig.tr);
	
	// sig1=
	sig2=HPF.ar(GrayNoise.ar([0.5,0.7])*LFSaw.ar(f2env!2),fenv)*env;
	};
)" ], [ 1095.3382653, 'alex', "~g[2]=\\set->Pbind(\\args, [\\trig], \\dur, 4, \\trig, 1);" ], [ 1094.5782643, 'alex', "~g[1]=\\set->Pbind(\\args, [\\freq], \\dur, 8, \\freq,Pseq([45,65,750],inf));" ], [ 1091.2582596, 'kof', "(
~first.ar(2);
~first.quant=2;
~first.fadeTime=2.2;
~first={
  //         |       |       |       |       |  
  var pat = [1,0,0,0,1,0,0,0,1,0,0,0,1,0,0,0].rotate(1);
  var imp = PulseDivider.kr(~tick.kr,8,~counter.kr);
  var hit = Select.kr(PulseCount.kr(imp)%pat.size,pat);
  var env = EnvGen.ar(Env([0.001,1,0.001],[4.002,4.5],[3,-3],curve:'exp'),imp * hit);
    var sig = SinOsc.ar(50,SinOsc.ar(50)) + Pulse.ar(4) + SinOsc.ar(15000/[1,2,4,8]+SinOsc.ar(40).range(-200,200),mul:0.1);
  sig = sig * env;
  Splay.ar(sig,0.75,0.75);
};
~first.play;
);" ], [ 1081.4272458, 'kof', "(
~first.ar(2);
~first.quant=2;
~first.fadeTime=2.2;
~first={
  //         |       |       |       |       |  
  var pat = [1,0,0,0,1,0,0,0,1,0,0,0,1,0,0,0].rotate(1);
  var imp = PulseDivider.kr(~tick.kr,8,~counter.kr);
  var hit = Select.kr(PulseCount.kr(imp)%pat.size,pat);
  var env = EnvGen.ar(Env([0.001,1,0.001],[4.002,4.5],[3,-3],curve:'exp'),imp * hit);
    var sig = SinOsc.ar(50,SinOsc.ar(50)) + Pulse.ar(4) + SinOsc.ar(5000/[1,2,4,8]+SinOsc.ar(40).range(-200,200),mul:0.1);
  sig = sig * env;
  Splay.ar(sig,0.75,0.75);
};
~first.play;
);" ], [ 1073.3162344, 'alex', "~g[31]=\\filter-> {arg in; LPF.ar(in,\\lpf.kr(5800))};" ], [ 1065.8462239, 'kof', "(
~first.ar(2);
~first.quant=2;
~first.fadeTime=2.2;
~first={
  //         |       |       |       |       |  
  var pat = [1,0,0,0,1,0,0,0,1,0,0,0,1,0,0,0].rotate(1);
  var imp = PulseDivider.kr(~tick.kr,8,~counter.kr);
  var hit = Select.kr(PulseCount.kr(imp)%pat.size,pat);
  var env = EnvGen.ar(Env([0.001,1,0.001],[1.002,4.5],[3,-3],curve:'exp'),imp * hit);
    var sig = SinOsc.ar(50,SinOsc.ar(50)) + Pulse.ar(4) + SinOsc.ar(5000/[1,2,4,8]+SinOsc.ar(4).range(-200,200),mul:0.1);
  sig = sig * env;
  Splay.ar(sig,0.75,0.75);
};
~first.play;
);" ], [ 1056.0821805, 'joach', "(
~saw8[5] = \\set -> QuantEnv(\\noise, 32)
.phase(1, [0,0.2,0], [0.05, 15.95], [2,-2], 0, 1)
.phase(2, [0,0.4,0], [0.35, 7.65], [2,-2], 0, 1)
.play([1,2]);
)" ], [ 1031.4671418, 'kof', "(
~first.ar(2);
~first.quant=2;
~first.fadeTime=2.2;
~first={
  //         |       |       |       |       |  
  var pat = [1,0,0,0,1,0,0,0,1,0,0,0,1,0,0,0].rotate(1);
  var imp = PulseDivider.kr(~tick.kr,8,~counter.kr);
  var hit = Select.kr(PulseCount.kr(imp)%pat.size,pat);
  var env = EnvGen.ar(Env([0.001,1,0.001],[1.002,4.5],[3,-3],curve:'exp'),imp * hit);
    var sig = SinOsc.ar(50,SinOsc.ar(50)) + Pulse.ar(4) + SinOsc.ar(5000+SinOsc.ar(4).range(-200,200),mul:0.1);
  sig = sig * env;
  Splay.ar(sig,0.75,0.75);
};
~first.play;
);" ], [ 1015.1270871, 'joach', "~saw8.set(\\lpf_freq, 400);" ], [ 1009.7240783, 'kof', "(
~first.ar(2);
~first.quant=2;
~first.fadeTime=0.2;
~first={
  //         |       |       |       |       |  
  var pat = [1,0,0,0,1,0,0,0,1,0,0,0,1,0,0,0].rotate(1);
  var imp = PulseDivider.kr(~tick.kr,8,~counter.kr);
  var hit = Select.kr(PulseCount.kr(imp)%pat.size,pat);
  var env = EnvGen.ar(Env([0.001,1,0.001],[1.002,4.5],[3,-3],curve:'exp'),imp * hit);
    var sig = SinOsc.ar(50,SinOsc.ar(50)) + Pulse.ar(4) + SinOsc.ar(5000+SinOsc.ar(4).range(-20,20),mul:0.1);
  sig = sig * env;
  Splay.ar(sig,0.75,0.75);
};
~first.play;
);" ], [ 988.2230481, 'kof', "(
~first.ar(2);
~first.quant=2;
~first.fadeTime=0.2;
~first={
  //         |       |       |       |       |  
  var pat = [1,0,0,0,1,0,0,0,1,0,0,0,1,0,0,0].rotate(1);
  var imp = PulseDivider.kr(~tick.kr,8,~counter.kr);
  var hit = Select.kr(PulseCount.kr(imp)%pat.size,pat);
  var env = EnvGen.ar(Env([0.001,1,0.001],[1.002,4.5],[3,-3],curve:'exp'),imp * hit);
    var sig = SinOsc.ar(50,SinOsc.ar(50)) + Pulse.ar(4) + SinOsc.ar(5000,mul:0.1);
  sig = sig * env;
  Splay.ar(sig,0.75,0.75);
};
~first.play;
);" ], [ 983.4660115, 'joach', "~saw8[3] = \\filter -> {|in| GVerb.ar(in, \\gverb_size.kr(12), \\gverb_time.kr(6), 0.9, mul:\\mulgverb.kr(1)) };" ], [ 975.2689673, 'joach', "(
~saw8[4] = \\set -> QuantEnv(\\freq, 16)
.phase(1, [50,66,50], [8, 4], [\\sin,\\sin], 0, 1)
.phase(2, [0,1,0], [0.35, 0.65], [2,-2], 0, 1)
.play([1]);
)" ], [ 975.1709639, 'kof', "(
~first.ar(2);
~first.quant=2;
~first.fadeTime=0.2;
~first={
  //         |       |       |       |       |  
  var pat = [1,0,0,0,1,0,0,0,1,0,0,0,1,0,0,0].rotate(1);
  var imp = PulseDivider.kr(~tick.kr,8,~counter.kr);
  var hit = Select.kr(PulseCount.kr(imp)%pat.size,pat);
  var env = EnvGen.ar(Env([0.001,1,0.001],[1.002,4.5],[3,-3],curve:'exp'),imp * hit);
    var sig = SinOsc.ar(50,SinOsc.ar(50)) + Pulse.ar(4) + SinOsc.ar(5000,mul:0.01);
  sig = sig * env;
  Splay.ar(sig,0.75,0.75);
};
~first.play;
);" ], [ 965.1199168, 'joach', "(
~saw8[4] = \\set -> QuantEnv(\\freq, 16)
.phase(1, [60,66,60], [8, 4], [\\sin,\\sin], 0, 1)
.phase(2, [0,1,0], [0.35, 0.65], [2,-2], 0, 1)
.play([1]);
)" ], [ 962.6299134, 'kof', "(
~first.ar(2);
~first.quant=2;
~first.fadeTime=0.2;
~first={
  //         |       |       |       |       |  
  var pat = [1,0,0,0,1,0,0,0,1,0,0,0,1,0,0,0].rotate(1);
  var imp = PulseDivider.kr(~tick.kr,8,~counter.kr);
  var hit = Select.kr(PulseCount.kr(imp)%pat.size,pat);
  var env = EnvGen.ar(Env([0.001,1,0.001],[1.002,4.5],[3,-3],curve:'exp'),imp * hit);
    var sig = SinOsc.ar(50,SinOsc.ar(50)) + SinOsc.ar(5000,mul:0.01);
  sig = sig * env;
  Splay.ar(sig,0.75,0.75);
};
~first.play;
);" ], [ 956.1499043, 'kof', "(
~first.ar(2);
~first.quant=2;
~first.fadeTime=0.2;
~first={
  //         |       |       |       |       |  
  var pat = [1,0,0,0,1,0,0,0,1,0,0,0,1,0,0,0].rotate(1);
  var imp = PulseDivider.kr(~tick.kr,8,~counter.kr);
  var hit = Select.kr(PulseCount.kr(imp)%pat.size,pat);
  var env = EnvGen.ar(Env([0.001,1,0.001],[1.002,0.5],[3,-3],curve:'exp'),imp * hit);
    var sig = SinOsc.ar(50,SinOsc.ar(50)) + SinOsc.ar(5000,mul:0.01);
  sig = sig * env;
  Splay.ar(sig,0.75,0.75);
};
~first.play;
);" ], [ 950.969897, 'alex', "~g[31]=\\filter-> {arg in; LPF.ar(in,\\lpf.kr(1800))};" ], [ 947.2088917, 'alex', "~g.play(vol:0.6, fadeTime:2).quant_(8);" ], [ 941.3688835, 'kof', "(
~first.ar(2);
~first.quant=2;
~first.fadeTime=0.2;
~first={
  //         |       |       |       |       |  
  var pat = [1,0,0,0,1,0,0,0,1,0,0,0,1,0,0,0].rotate(1);
  var imp = PulseDivider.kr(~tick.kr,8,~counter.kr);
  var hit = Select.kr(PulseCount.kr(imp)%pat.size,pat);
  var env = EnvGen.ar(Env([0.001,1,0.001],[1.002,0.5],[3,-3],curve:'exp'),imp * hit);
    var sig = SinOsc.ar(50,SinOsc.ar(50)) + SinOsc.ar(5000,mul:0.01);
  sig = sig * env;
  Splay.ar(sig,0.75,0.5);
};
~first.play;
);" ], [ 936.718877, 'alex', "~g[31]=\\filter-> {arg in; LPF.ar(in,\\lpf.kr(800))};" ], [ 922.7428276, 'joach', "~saw8.set(\\lpf_freq, 800);" ], [ 921.686823, 'alex', "~g[31]=\\filter-> {arg in; LPF.ar(in,\\lpf.kr(400))};" ], [ 903.126797, 'kof', "(
~first.ar(2);
~first.quant=2;
~first.fadeTime=0.2;
~first={
  //         |       |       |       |       |  
  var pat = [1,0,0,0,1,0,0,0,1,0,0,0,1,0,0,0].rotate(1);
  var imp = PulseDivider.kr(~tick.kr,8,~counter.kr);
  var hit = Select.kr(PulseCount.kr(imp)%pat.size,pat);
  var env = EnvGen.ar(Env([0.001,1,0.001],[1.002,0.5],[3,-3],curve:'exp'),imp * hit);
    var sig = SinOsc.ar(50,SinOsc.ar(50));
  sig = sig * env;
  Splay.ar(sig,0.75,0.5);
};
~first.play;
);" ], [ 897.6327567, 'joach', "~saw8[3] = \\filter -> {|in| GVerb.ar(in, \\gverb_size.kr(12), \\gverb_time.kr(3), 0.9, mul:\\mulgverb.kr(1)) };" ], [ 896.0457541, 'alex', "~g.play(vol:0.3, fadeTime:2).quant_(8);" ], [ 887.6347422, 'kof', "(
~first.ar(2);
~first.quant=2;
~first.fadeTime=0.2;
~first={
  //         |       |       |       |       |  
  var pat = [1,0,0,0,1,0,0,0,1,0,0,0,1,0,0,0].rotate(1);
  var imp = PulseDivider.kr(~tick.kr,8,~counter.kr);
  var hit = Select.kr(PulseCount.kr(imp)%pat.size,pat);
  var env = EnvGen.ar(Env([0.001,1,0.001],[1.002,0.5],[3,-3],curve:'exp'),imp * hit);
    var sig = SinOsc.ar(50,SinOsc.ar(50));
  sig = sig * env;
  Splay.ar(sig,0.75,0.15);
};
~first.play;
);" ], [ 886.6147408, 'kof', "(
  p.clock.tempo_(60/60);
  
  ~offset = (0..7)/8;
  
  ~tick.quant = 1;
  ~tick = {Mix(Impulse.kr( ~tempo / 2 , ~offset ))};
  
  ~counter = {PulseCount.kr(~tick.kr)};
);" ], [ 883.6747367, 'alex', "~g[3]=\\set->Pbind(\\args, [\\f2], \\dur, 8, \\f2,Pseq([4,7,2,5],inf));" ], [ 878.9576985, 'joach', "~saw8.set(\\lpf_freq, 1800);" ], [ 877.8646672, 'joach', "~saw8[2] = \\filter -> {|in| LPF.ar(in, \\lpf_freq.kr(800,28)) };" ], [ 874.1486248, 'joach', "~saw8.set(\\lpf_freq, 1800);" ], [ 860.5005735, 'joach', "~saw8.play(vol: 0.8, fadeTime: 16);" ], [ 843.1445159, 'joach', "~saw8[2] = \\filter -> {|in| LPF.ar(in, \\lpf_freq.kr(800,8)) };" ], [ 839.7835095, 'alex', "~g.play(vol:0.2, fadeTime:2).quant_(8);" ], [ 836.0625042, 'alex', "~g[30]=\\filter-> {arg in; GVerb.ar(in,[80,40], [10,18],add:in)};" ], [ 833.4325005, 'alex', "~g[2]=\\set->Pbind(\\args, [\\trig], \\dur, 8, \\trig, 1);" ], [ 832.6724995, 'alex', "~g[1]=\\set->Pbind(\\args, [\\freq], \\dur, 8, \\freq,Pseq([450,650,750],inf));" ], [ 829.9224956, 'alex', "(
~g[0]={
	var sig2,sig1, env, fenv,f2env;

	env=EnvGen.kr(Env([0,1,0], [2,0.01], [\\welch, \\step]), \\trig.tr);
	fenv=EnvGen.kr(Env([\\freq.kr,\\freq.kr*4], [2], \\welch), \\trig.tr);
	f2env=EnvGen.kr(Env([\\f2.kr(4),\\f2.kr(4)*4], [2], \\welch), \\trig.tr);
	
	// sig1=
	sig2=HPF.ar(GrayNoise.ar([0.5,0.7])*LFSaw.ar(f2env!2),fenv)*env;
	};
)" ], [ 828.398462, 'joach', "~saw8.play(vol: 0.5, fadeTime: 16);" ], [ 818.6304468, 'kof', "~beat.clear;" ], [ 804.9794276, 'kof', "(
~beat.ar(2);
~beat.quant=2;
~beat.fadeTime=0.2;
~beat={
  //         |       |       |       |       |  
  var pat = [1,0,0,0,1,0,0,0,1,0,0,0,1,0,0,0].rotate(1);
  var imp = PulseDivider.kr(~tick.kr,1,~counter.kr);
  var hit = Select.kr(PulseCount.kr(~heart.kr)%pat.size,pat);
  var env = EnvGen.ar(Env([0.001,1,0.001],[0.002,0.5],[3,-3],curve:'exp'),imp * hit);
  var sig = SinOsc.ar(50!2);
  sig = sig * env;
  Splay.ar(sig,0.75,0.15);
};
~beat.play;
);" ], [ 802.7363914, 'joach', "(
~saw8[1] = \\set -> QuantEnv(\\amp, 8)
.phase(1, [0,0.2,0], [1.05, 0.95], [8,-2], 0, 4)
.phase(2, [0,0.8,0.1,0.4,0], [0.35, 0.65], [2,-2], 0, 1)
.play([1,2]);
)" ], [ 801.5343589, 'joach', "~saw8.play(vol: 0.1, fadeTime: 16);" ], [ 797.6083218, 'joach', "(
~saw8[0] = {
var osc = LFSaw.ar(( \\freq.kr(50) + \\fplus.kr(0) ), mul: 1, add: 0);
var noise = BrownNoise.ar(\\noise.kr(0), (1 - \\noise.kr(0)));
var sig = osc * noise;
Pan2.ar( sig * \\amp.kr(0), \\pan.kr(0) );
};
)" ], [ 771.8402808, 'kof', "(
~heart.quant=2;
~heart.fadeTime=0.2;
~heart={
  //         |       |       |       |       |  
  var z = Buffer.alloc(s, 512);
  var sig = AudioIn.ar([0,1]);
  
  var chain = FFT(z,LPF.ar(sig,150,2));

  var imp = PulseDivider.ar(Onsets.kr(chain, 0.5 , \\rcomplex), 2);
  
  Splay.ar(imp,0.75,0.75);
};
~bpm.play;
);" ], [ 761.0102657, 'kof', "(
~heart.quant=2;
~heart.fadeTime=0.2;
~heart={
  //         |       |       |       |       |  
  var z = Buffer.alloc(s, 512);
  var sig = AudioIn.ar([0,1]);
  
  var chain = FFT(z,LPF.ar(sig,150,2));

  var imp = PulseDivider.ar(Onsets.kr(chain, 0.5 , \\rcomplex), 2);
  
  Splay.ar(imp,0.75,0.75);
};
~bpm.play;
);" ], [ 647.6741067, 'kof', "~heart=0;" ], [ 602.6330435, 'alex', "currentEnvironment.postln;" ], [ 302.1536224, 'alex', "(\"whatever you used for when we tested the sensors for piksel\").postln;" ], [ 250.6275175, 'joach', "(
~saw8[0] = {
var osc = LFSaw.ar(( \\freq.kr(60) + \\fplus.kr(0) ), mul: 1, add: 0);
var noise = BrownNoise.ar(\\noise.kr(0), (1 - \\noise.kr(0)));
var sig = osc * noise;
Pan2.ar( sig * \\amp.kr(0), \\pan.kr(0) );
};
)" ], [ 146.9083718, 'kof', "(
  p.clock.tempo_(60/60);
  
  ~offset = (0..7)/8;
  
  ~tick.quant = 1;
  ~tick = {Mix(Impulse.kr( ~tempo / 2 , ~offset ))};
  
  ~counter = {PulseCount.kr(~tick.kr)};
);" ], [ 142.807366, 'kof', "(
  p=ProxySpace.push(s.boot);
  p.makeTempoClock;
);" ], [ 128.6363461, 'alex', "(\"what about the sesor input?\").postln;" ], [ 97.542302400001, 'alex', "~g.play(vol:0.6, fadeTime:2).quant_(16);" ], [ 78.732275999999, 'alex', "(\"what about the sesor input?\").postln;" ], [ 73.1522682, 'alex', "(\"what about the sesor input\").postln;" ], [ 67.380230999999, 'joach', "(
~saw8[0] = {
var osc = LFSaw.ar(( \\freq.kr(60) + \\fplus.kr(0) ), mul: 1, add: 0);
var noise = BrownNoise.ar(\\noise.kr(0), (1 - \\noise.kr(0)));
var sig = osc * noise;
Pan2.ar( sig * \\amp.kr(0), \\pan.kr(0) );
};
)" ], [ 59.6301833, 'joach', "~saw8.play(vol: 0.0, fadeTime: 8);" ], [ 36.2871505, 'alex', "~g.play(vol:0.1, fadeTime:2).quant_(16);" ], [ 33.9961472, 'alex', "~g[30]=\\filter-> {arg in; GVerb.ar(in,[20,10],[7,5],add:in)};" ], [ 32.246144799999, 'alex', "~g[3]=\\set->Pbind(\\args, [\\top], \\dur, Pseq([Pn(0.5,3),Pn(0.25,8),6],inf), \\top, Pseq([4,8,4,4,4],inf) );" ], [ 30.596142499999, 'alex', "~g[2]=\\set->Pbind(\\args, [\\trig], \\dur, Pseq([Pn(0.5,3),Pn(0.25,2),6],inf), \\trig, 1);" ], [ 28.9561402, 'alex', "~g[1]=\\set->Pbind(\\args, [\\freq], \\dur, 8, \\freq,Pseq([Pseq([65,45,47,42,32],4), Pn(65,4)],inf));" ], [ 25.366135200002, 'alex', "(
~g[0]={
	var sig, env, fenv;

	env=EnvGen.kr(Env([0,1,0], [0.01,0.25], [\\welch, \\step]), \\trig.tr);
	fenv=EnvGen.kr(Env([\\freq.kr,\\freq.kr*\\top.kr(4),\\freq.kr], [0.01,0.04], \\welch), \\trig.tr);

	sig=SinOsc.ar(fenv!2)*env;


};
)" ], [ 19.886127500002, 'alex', "p.clock.tempo;" ], [ 17.254092399999, 'joach', "p.clock.tempo_(60/60);" ], [ 14.516087, 'alex', "p.clock.tempo;" ], [ 10.159048199999, 'joach', "p = ProxySpace.push(s).makeTempoClock;" ], [ 0, 'joach', "AutoIDE.run" ] ]