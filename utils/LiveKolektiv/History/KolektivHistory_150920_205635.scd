List[ [ 3169.1339409, 'alex', "~d.clear;" ], [ 3165.4668533, 'joach', "~jDrum.play(vol: 0.0, fadeTime: 8);" ], [ 3162.7931054, 'alex', "~d.play(vol:0, fadeTime:2);" ], [ 3161.8562811, 'joach', "~jDrum.play(vol: 0.0, fadeTime: 18);" ], [ 3159.7311106, 'kof', "~weirdo.clear;" ], [ 3158.0120799, 'kof', "~kick.clear;" ], [ 3156.1184745, 'alex', "~d.play(vol:0.21, fadeTime:2);" ], [ 3153.855558, 'kof', "~ssm.clear;" ], [ 3151.9959972, 'kof', "~crack.clear;" ], [ 3149.0114067, 'kof', "~ff.clear;" ], [ 3145.7301929, 'alex', "~d[31]=\\filter-> {arg in; LPF.ar(in,\\lpf.kr(200))};" ], [ 3141.9767691, 'joach', "~jDrum[7] = nil" ], [ 3141.4692713, 'alex', "~d[31]=\\filter-> {arg in; LPF.ar(in,\\lpf.kr(600))};" ], [ 3140.8854579, 'kof', "~ff.stop(7);" ], [ 3136.9441484, 'kof', "~kick.stop(7);" ], [ 3136.420894, 'alex', "~d[31]=\\filter-> {arg in; LPF.ar(in,\\lpf.kr(1000))};" ], [ 3133.955019, 'joach', "~jDrum[2] = nil;" ], [ 3133.903368, 'alex', "~d[31]=\\filter-> {arg in; LPF.ar(in,\\lpf.kr(1200))};" ], [ 3128.0004726, 'alex', "~d[31]=\\filter-> {arg in; LPF.ar(in,\\lpf.kr(1400))};" ], [ 3127.9022386, 'joach', "~jDrum.stop(36);" ], [ 3123.7965918, 'alex', "~d[31]=\\filter-> {arg in; LPF.ar(in,\\lpf.kr(4000))};" ], [ 3123.4486362, 'kof', "~weirdo.clear;" ], [ 3121.9397061, 'alex', "~d[30]=\\filter-> {arg in; Limiter.ar(GVerb.ar(in,[10,40],10),0.7)};" ], [ 3117.987141, 'joach', "(
~jDrum[6] = \\set -> QuantEnv(\\mulgverb, 8)
.phase(1, [0.5,1,0.5], [0.15, 0.85], [2,-2], 0, 16)
.phase(2, [0,(1,0.9..0.6),0], [0.35, 8.65], [8,\\sin], 0, 1)
.play([1,2]);
)" ], [ 3116.5761921, 'alex', "(~d[2]=\\set-> Pbind(\\args, [\\freq], \\dur, 4, \\octave, Pseq([[2,3],[3,2],[1,2,3]],inf), 
\\degree, Pseq([[1,4,2], [5,1,2]],inf) );)" ], [ 3113.0950239, 'kof', "(
~weirdo.quant=2;
~weirdo.fadeTime=0.2;
~weirdo={
  //         |       |       |       |       |  
  var pat = [1,0,0,0,1,0,0,0,1,0,0,0,1,0,0,0].rotate(3);
  var imp = PulseDivider.kr(~tick.kr,64*fib(4),~counter.kr);
  var hit = Select.kr(PulseCount.kr(imp)%pat.size,pat);
  var env = EnvGen.ar(Env([0.001,1,0.001],[1.002,1.5],[3,-3],curve:'exp'),imp * hit);
  var sig = SinOsc.ar(SinOsc.ar([1,2,3,4]*40*env).range(40,4000).round(50)*2/([1,2,4,8]*pi));
  sig = sig * env;
  Splay.ar(sig,0.75,0.55);
};
~weirdo.play;
);" ], [ 3111.5011055, 'joach', "(
~jDrum[2] = \\set -> QuantEnv(\\fplus, 2)
.phase(1, [0,200,0], [0.005, 0.135], [8,-8], 0, 16)
.phase(2, [0,[220,120],0], [0.035, 0.065], [8,-2], 0, 1)
.phase(3, [0,[70!3,120],0], [0.035, 0.065], [8,-2], 0, 1)
.play([1,2,1,3]);
)" ], [ 3101.042897, 'alex', "(~d[2]=\\set-> Pbind(\\args, [\\freq], \\dur, 4, \\octave, Pseq([[2,3],[3,2],[1,2,3]],inf), 
\\degree, Pseq([[6,4,2], [5,7,2]],inf) );)" ], [ 3100.0528285, 'joach', "(
~jDrum[2] = \\set -> QuantEnv(\\fplus, 4)
.phase(1, [0,200,0], [0.005, 0.135], [8,-8], 0, 16)
.phase(2, [0,[220,120],0], [0.035, 0.065], [8,-2], 0, 1)
.phase(3, [0,[70!3,120],0], [0.035, 0.065], [8,-2], 0, 1)
.play([1,2,1,3]);
)" ], [ 3099.0840688, 'kof', "(
~kick.quant=2;
~kick.fadeTime=0.2;
~kick={
  //         |       |       |       |       |  
  var pat = [1,0,0,0,1,1,0,0,1,0,0,0,1,1,0,0].rotate(1);
  var imp = PulseDivider.kr(~tick.kr,4,~counter.kr);
  var hit = Select.kr(PulseCount.kr(imp)%pat.size,pat);
  var env = EnvGen.ar(Env([0.001,1,0.001],[0.002,4.75],[3,-3],curve:'exp'),imp * hit);
  var sig = SinOsc.ar(50+(env**100*400));
  sig = sig * env;
  Splay.ar(sig,0.75,0.65);
};
~kick.play;
);" ], [ 3093.4741834, 'kof', "(
~kick.quant=2;
~kick.fadeTime=0.2;
~kick={
  //         |       |       |       |       |  
  var pat = [1,0,0,0,1,1,0,0,1,0,0,0,1,1,0,0].rotate(1);
  var imp = PulseDivider.kr(~tick.kr,4,~counter.kr);
  var hit = Select.kr(PulseCount.kr(imp)%pat.size,pat);
  var env = EnvGen.ar(Env([0.001,1,0.001],[0.002,4.75],[3,-3],curve:'exp'),imp * hit);
  var sig = SinOsc.ar(50+(env**10*400));
  sig = sig * env;
  Splay.ar(sig,0.75,0.65);
};
~kick.play;
);" ], [ 3093.2710547, 'joach', "(
~jDrum[2] = \\set -> QuantEnv(\\fplus, 4)
.phase(1, [0,700,0], [0.005, 0.135], [8,-8], 0, 16)
.phase(2, [0,[220,120],0], [0.035, 0.065], [8,-2], 0, 1)
.phase(3, [0,[70!3,120],0], [0.035, 0.065], [8,-2], 0, 1)
.play([1,2,1,3]);
)" ], [ 3084.7391535, 'joach', "(
~jDrum[2] = \\set -> QuantEnv(\\fplus, 4)
.phase(1, [0,1700,0], [0.005, 0.135], [8,-8], 0, 16)
.phase(2, [0,[220,120],0], [0.035, 0.065], [8,-2], 0, 1)
.phase(3, [0,[70!3,120],0], [0.035, 0.065], [8,-2], 0, 1)
.play([1,2,1,3]);
)" ], [ 3083.4857972, 'alex', "~d[31]=\\filter-> {arg in; LPF.ar(in,\\lpf.kr(4000))};" ], [ 3077.4728039, 'joach', "(
~jDrum[1] = \\set -> QuantEnv(\\amp, 2)
.phase(1, [0.2,1,0.6,0.2], [0.05, 0.15, 0.25], [8,-2, -8], 0, 16)
.phase(2, [0.2,1,0.2], [1.35, 0.65], [2,-2], 0, 1)
.phase(3, [0.2,1,0.2], [8.35, 1.65], [8,-2], 0, 1)
.play([1,2,1,3]);
)" ], [ 3073.0974419, 'joach', "(
~jDrum[1] = \\set -> QuantEnv(\\amp, 0.5)
.phase(1, [0.2,1,0.6,0.2], [0.05, 0.15, 0.25], [8,-2, -8], 0, 16)
.phase(2, [0.2,1,0.2], [1.35, 0.65], [2,-2], 0, 1)
.phase(3, [0.2,1,0.2], [8.35, 1.65], [8,-2], 0, 1)
.play([1,2,1,3]);
)" ], [ 3067.7873671, 'kof', "~crack.clear;" ], [ 3055.7553286, 'joach', "(
~jDrum[2] = \\set -> QuantEnv(\\fplus, 0.5)
.phase(1, [0,1700,0], [0.005, 0.135], [8,-8], 0, 16)
.phase(2, [0,[220,120],0], [0.035, 0.065], [8,-2], 0, 1)
.phase(3, [0,[70!3,120],0], [0.035, 0.065], [8,-2], 0, 1)
.play([1,2,1,3]);
)" ], [ 3052.3644522, 'kof', "~weirdo.clear;" ], [ 3049.2704234, 'joach', "(
~jDrum[2] = \\set -> QuantEnv(\\fplus, 0.5)
.phase(1, [0,700,0], [0.005, 0.135], [8,-8], 0, 16)
.phase(2, [0,[220,120],0], [0.035, 0.065], [8,-2], 0, 1)
.phase(3, [0,[70!3,120],0], [0.035, 0.065], [8,-2], 0, 1)
.play([1,2,1,3]);
)" ], [ 3048.3753517, 'alex', "~d[31]=\\filter-> {arg in; LPF.ar(in,\\lpf.kr(400))};" ], [ 3040.5503268, 'joach', "(
~jDrum[2] = \\set -> QuantEnv(\\fplus, 0.5)
.phase(1, [0,700,0], [0.005, 0.35], [8,-8], 0, 16)
.phase(2, [0,[220,120],0], [0.035, 0.065], [8,-2], 0, 1)
.phase(3, [0,[70!3,120],0], [0.035, 0.065], [8,-2], 0, 1)
.play([1,2,1,3]);
)" ], [ 3036.441335, 'kof', "(
~kick.quant=2;
~kick.fadeTime=0.2;
~kick={
  //         |       |       |       |       |  
  var pat = [1,0,0,0,1,1,0,0,1,0,0,0,1,1,0,0].rotate(1);
  var imp = PulseDivider.kr(~tick.kr,4,~counter.kr);
  var hit = Select.kr(PulseCount.kr(imp)%pat.size,pat);
  var env = EnvGen.ar(Env([0.001,1,0.001],[0.002,4.75],[3,-3],curve:'exp'),imp * hit);
  var sig = SinOsc.ar(50+(env**100*400));
  sig = sig * env;
  Splay.ar(sig,0.75,0.65);
};
~kick.play;
);" ], [ 3033.3474229, 'joach', "(
~jDrum[2] = \\set -> QuantEnv(\\fplus, 0.5)
.phase(1, [0,70,0], [0.005, 0.35], [8,-8], 0, 16)
.phase(2, [0,[220,120],0], [0.035, 0.065], [8,-2], 0, 1)
.phase(3, [0,[70!3,120],0], [0.035, 0.065], [8,-2], 0, 1)
.play([1,2,1,3]);
)" ], [ 3033.3474229, 'kof', "(
~kick.quant=2;
~kick.fadeTime=0.2;
~kick={
  //         |       |       |       |       |  
  var pat = [1,0,0,0,1,1,0,0,1,0,0,0,1,1,0,0].rotate(1);
  var imp = PulseDivider.kr(~tick.kr,4,~counter.kr);
  var hit = Select.kr(PulseCount.kr(imp)%pat.size,pat);
  var env = EnvGen.ar(Env([0.001,1,0.001],[0.002,0.75],[3,-3],curve:'exp'),imp * hit);
  var sig = SinOsc.ar(50+(env**100*400));
  sig = sig * env;
  Splay.ar(sig,0.75,0.65);
};
~kick.play;
);" ], [ 3032.2834448, 'alex', "(~d[0]={
	var sig, env, fenv, penv, renv;
	
	env=EnvGen.kr(Env([0,1,0.5,0], [0.01,0.5],[\\welch,\\step]), \\trig.tr);
	fenv=EnvGen.kr(Env([\\freq.kr, \\freq.kr*8, \\freq.kr], [0.01,0.05]), \\trig.tr);
	penv=EnvGen.kr(Env([-1,1,-1,1], [0.1,1,0.5]), \\trig.tr);
	
	sig=Balance2.ar(LFPulse.ar(fenv!2,width:[0.05,0.02,0.2,0.5]).lag([0.001,0.002]),WhiteNoise.ar(0.2)*Decay.ar(Impulse.ar([2,3,1]),0.5),penv);
	sig*env;
};
)" ], [ 3028.6746361, 'kof', "(
~kick.quant=2;
~kick.fadeTime=0.2;
~kick={
  //         |       |       |       |       |  
  var pat = [1,0,0,0,1,1,0,0,1,0,0,0,1,1,0,0].rotate(1);
  var imp = PulseDivider.kr(~tick.kr,2,~counter.kr);
  var hit = Select.kr(PulseCount.kr(imp)%pat.size,pat);
  var env = EnvGen.ar(Env([0.001,1,0.001],[0.002,0.75],[3,-3],curve:'exp'),imp * hit);
  var sig = SinOsc.ar(50+(env**100*400));
  sig = sig * env;
  Splay.ar(sig,0.75,0.65);
};
~kick.play;
);" ], [ 3022.9827011, 'alex', "~d[1]=\\set-> Pbind(\\args, [\\trig], \\dur, Pseq([4,2],inf), \\trig,1);" ], [ 3021.5643278, 'joach', "~jDrum[5] = \\filter -> {|in| GVerb.ar(in, \\gverb_size.kr(4), \\gverb_time.kr(0.5), 0.9, mul:\\mulgverb.kr(1), add:(1-\\mulgverb.kr(1))) };" ], [ 3011.8918699, 'joach', "(
~jDrum[7] = \\set -> QuantEnv(\\lpf_freq, 32)
.phase(1, [800,4100,800], [32.05, 0.95], [2,-2], 0, 1)
.phase(2, [800,8200,1200,800], [10.35, 2, 12.65], \\sin, 0, 1)
.play([1,2]);
)" ], [ 3010.7304098, 'alex', "~d[1]=\\set-> Pbind(\\args, [\\trig], \\dur, 4, \\trig,1);" ], [ 3008.0159012, 'kof', "~ssm.clear;" ], [ 3000.9524134, 'joach', "~jDrum[4] = \\filter -> {|in| LPF.ar(in, \\lpf_freq.kr(4000,8)) };" ], [ 3000.4053515, 'kof', "(
    ~ssm.quant=2;
    ~ssm.fadeTime=2.02;
    ~ssm={
        var mod = [-1,4,-0.25,1/8,16]*0.25;
        var spread = 0.004;
      var pos = [0,0.5,0.75,0.25]+LFNoise2.kr(1/16!4).range(0,0.25);
        //         |       |       |       |       |  
        var pat = [1,0,0,0,1,0,0,0,1,0,0,0,1,0,0,0].rotate(3);
      var imp = PulseDivider.kr(~tick.kr,[8,16,32,64]/4,~counter.kr);
        var hit = Select.kr(PulseCount.kr(imp)%pat.size,pat);
  var env = EnvGen.ar(Env([0.001,1,0.001],[0.402,0.5],[3,-3],curve:'exp'),imp * hit);
        var sig = PlayBuf.ar(b.numChannels,b.bufnum,BufRateScale.kr(b.bufnum)*mod+(env*0.01),imp, (pos + BrownNoise.ar(1!8).range(spread * -1,spread)) * BufFrames.kr(b.bufnum),1);
        
  sig = sig * env;
        Splay.ar(sig.flat,0.5,0.75);
    };
    ~ssm.play;
);" ], [ 2996.8271076, 'joach', "~jDrum[4] = \\filter -> {|in| LPF.ar(in, \\lpf_freq.kr(2000,8)) };" ], [ 2995.2486052, 'kof', "(
    ~ssm.quant=2;
    ~ssm.fadeTime=2.02;
    ~ssm={
        var mod = [-1,8,-0.25,1/8,16]*0.25;
        var spread = 0.004;
      var pos = [0,0.5,0.75,0.25]+LFNoise2.kr(1/16!4).range(0,0.25);
        //         |       |       |       |       |  
        var pat = [1,0,0,0,1,0,0,0,1,0,0,0,1,0,0,0].rotate(3);
      var imp = PulseDivider.kr(~tick.kr,[8,16,32,64]/4,~counter.kr);
        var hit = Select.kr(PulseCount.kr(imp)%pat.size,pat);
  var env = EnvGen.ar(Env([0.001,1,0.001],[0.402,0.5],[3,-3],curve:'exp'),imp * hit);
        var sig = PlayBuf.ar(b.numChannels,b.bufnum,BufRateScale.kr(b.bufnum)*mod+(env*0.01),imp, (pos + BrownNoise.ar(1!8).range(spread * -1,spread)) * BufFrames.kr(b.bufnum),1);
        
  sig = sig * env;
        Splay.ar(sig.flat,0.5,0.75);
    };
    ~ssm.play;
);" ], [ 2992.1530299, 'joach', "(
~jDrum[8] = \\set -> QuantEnv(\\freq, 48)
.phase(1, [100,216,100], [32, 16], [\\sin], 0, 3)
.phase(2, [200,(160,120..80),200], [6, 2], [\\sin], 0, 1)
.play([1,2]);
)" ], [ 2991.314323, 'alex', "~d[30]=\\filter-> {arg in; Limiter.ar(GVerb.ar(in,[10,40],10),0.7)};" ], [ 2984.9807734, 'kof', "(
    ~ssm.quant=2;
    ~ssm.fadeTime=2.02;
    ~ssm={
        var mod = [-1,0.25,-0.25,1/8,16]*0.25;
        var spread = 0.004;
      var pos = [0,0.5,0.75,0.25]+LFNoise2.kr(1/16!4).range(0,0.25);
        //         |       |       |       |       |  
        var pat = [1,0,0,0,1,0,0,0,1,0,0,0,1,0,0,0].rotate(3);
      var imp = PulseDivider.kr(~tick.kr,[8,16,32,64]/4,~counter.kr);
        var hit = Select.kr(PulseCount.kr(imp)%pat.size,pat);
  var env = EnvGen.ar(Env([0.001,1,0.001],[0.402,0.5],[3,-3],curve:'exp'),imp * hit);
        var sig = PlayBuf.ar(b.numChannels,b.bufnum,BufRateScale.kr(b.bufnum)*mod+(env*0.01),imp, (pos + BrownNoise.ar(1!8).range(spread * -1,spread)) * BufFrames.kr(b.bufnum),1);
        
  sig = sig * env;
        Splay.ar(sig.flat,0.5,0.75);
    };
    ~ssm.play;
);" ], [ 2979.1556686, 'alex', "~d[31]=\\filter-> {arg in; LPF.ar(in,\\lpf.kr(4400))};" ], [ 2977.1808566, 'alex', "(~d[2]=\\set-> Pbind(\\args, [\\freq], \\dur, 4, \\octave, Pseq([[2,3],[3,2],[1,2,3]],inf), 
\\degree, Pseq([[4,2,3], [5,3,2]],inf) );)" ], [ 2971.2496619, 'joach', "~jDrum[4] = \\filter -> {|in| LPF.ar(in, \\lpf_freq.kr(200,8)) };" ], [ 2966.8742883, 'kof', "(
    ~ssm.quant=2;
    ~ssm.fadeTime=2.02;
    ~ssm={
        var mod = [-1,0.25,-0.25,1/8,1/16]*0.25;
        var spread = 0.004;
      var pos = [0,0.5,0.75,0.25]+LFNoise2.kr(1/16!4).range(0,0.25);
        //         |       |       |       |       |  
        var pat = [1,0,0,0,1,0,0,0,1,0,0,0,1,0,0,0].rotate(3);
      var imp = PulseDivider.kr(~tick.kr,[8,16,32,64]/4,~counter.kr);
        var hit = Select.kr(PulseCount.kr(imp)%pat.size,pat);
  var env = EnvGen.ar(Env([0.001,1,0.001],[0.402,0.5],[3,-3],curve:'exp'),imp * hit);
        var sig = PlayBuf.ar(b.numChannels,b.bufnum,BufRateScale.kr(b.bufnum)*mod+(env*0.01),imp, (pos + BrownNoise.ar(1!8).range(spread * -1,spread)) * BufFrames.kr(b.bufnum),1);
        
  sig = sig * env;
        Splay.ar(sig.flat,0.5,0.75);
    };
    ~ssm.play;
);" ], [ 2964.310616, 'joach', "~jDrum[4] = \\filter -> {|in| LPF.ar(in, \\lpf_freq.kr(800,8)) };" ], [ 2963.2337294, 'alex', "~d[31]=\\filter-> {arg in; LPF.ar(in,\\lpf.kr(400))};" ], [ 2962.3416113, 'kof', "(
    ~ssm.quant=2;
    ~ssm.fadeTime=2.02;
    ~ssm={
        var mod = [-1,0.25,-0.25,1/8,1/16]*0.75;
        var spread = 0.004;
      var pos = [0,0.5,0.75,0.25]+LFNoise2.kr(1/16!4).range(0,0.25);
        //         |       |       |       |       |  
        var pat = [1,0,0,0,1,0,0,0,1,0,0,0,1,0,0,0].rotate(3);
      var imp = PulseDivider.kr(~tick.kr,[8,16,32,64]/4,~counter.kr);
        var hit = Select.kr(PulseCount.kr(imp)%pat.size,pat);
  var env = EnvGen.ar(Env([0.001,1,0.001],[0.402,0.5],[3,-3],curve:'exp'),imp * hit);
        var sig = PlayBuf.ar(b.numChannels,b.bufnum,BufRateScale.kr(b.bufnum)*mod+(env*0.01),imp, (pos + BrownNoise.ar(1!8).range(spread * -1,spread)) * BufFrames.kr(b.bufnum),1);
        
  sig = sig * env;
        Splay.ar(sig.flat,0.5,0.75);
    };
    ~ssm.play;
);" ], [ 2960.8884391, 'joach', "~jDrum[7] = nil" ], [ 2959.4055059, 'alex', "~d[31]=\\filter-> {arg in; LPF.ar(in,\\lpf.kr(1400))};" ], [ 2948.9088376, 'alex', "(~d[0]={
	var sig, env, fenv, penv, renv;
	
	env=EnvGen.kr(Env([0,1,0.5,0], [0.01,0.5],[\\welch,\\step]), \\trig.tr);
	fenv=EnvGen.kr(Env([\\freq.kr, \\freq.kr*8, \\freq.kr], [0.01,0.05]), \\trig.tr);
	penv=EnvGen.kr(Env([-1,1,-1,1], [0.1,1,0.5]), \\trig.tr);
	
	sig=Balance2.ar(LFPulse.ar(fenv!2,width:[0.05,0.02,0.2,0.5]).lag([0.001,0.002]),WhiteNoise.ar(0.2)*Decay.ar(Impulse.ar([2,3]),0.5),penv);
	sig*env;
};
)" ], [ 2948.4066666, 'joach', "(
~jDrum[2] = \\set -> QuantEnv(\\fplus, 1)
.phase(1, [0,70,0], [0.005, 0.35], [8,-8], 0, 16)
.phase(2, [0,[220,120],0], [0.035, 0.065], [8,-2], 0, 1)
.phase(3, [0,[70!3,120],0], [0.035, 0.065], [8,-2], 0, 1)
.play([1,2,1,3]);
)" ], [ 2939.2282006, 'joach', "(
~jDrum[2] = \\set -> QuantEnv(\\fplus, 4)
.phase(1, [0,70,0], [0.005, 0.35], [8,-8], 0, 16)
.phase(2, [0,[220,120],0], [0.035, 0.065], [8,-2], 0, 1)
.phase(3, [0,[70!3,120],0], [0.035, 0.065], [8,-2], 0, 1)
.play([1,2,1,3]);
)" ], [ 2923.6159956, 'joach', "(
~jDrum[2] = \\set -> QuantEnv(\\fplus, 2)
.phase(1, [0,70,0], [0.005, 0.35], [8,-8], 0, 16)
.phase(2, [0,[220,120],0], [0.035, 0.065], [8,-2], 0, 1)
.phase(3, [0,[70!3,120],0], [0.035, 0.065], [8,-2], 0, 1)
.play([1,2,1,3]);
)" ], [ 2922.4413639, 'alex', "(~d[0]={
	var sig, env, fenv, penv, renv;
	
	env=EnvGen.kr(Env([0,1,0.5,0], [0.01,0.5],[\\welch,\\step]), \\trig.tr);
	fenv=EnvGen.kr(Env([\\freq.kr, \\freq.kr*8, \\freq.kr], [0.01,0.05]), \\trig.tr);
	penv=EnvGen.kr(Env([-1,1,-1], [0.1,2]), \\trig.tr);
	
	sig=Balance2.ar(LFPulse.ar(fenv!2,width:[0.05,0.02,0.2,0.5]).lag([0.001,0.002]),WhiteNoise.ar(0.2)*Decay.ar(Impulse.ar([2,3]),1),penv);
	sig*env;
};
)" ], [ 2921.1297286, 'kof', "(
~crack.quant=2;
~crack.fadeTime=0.2;
~crack={
  //         |       |       |       |       |  
  var pat = [1,0,0,0,1,0,0,0,1,0,0,0,1,1,1,1].rotate(3);
  var imp = PulseDivider.kr(~tick.kr,fib(8)*2,~counter.kr);
  var hit = Select.kr(PulseCount.kr(imp)%pat.size,pat);
  var env = EnvGen.ar(Env([0.001,1,0.001],[0.002,0.15+[0.1,0.2,0.3,0.4]],[3,-3],curve:'exp'),imp * hit);
  var sig = Crackle.ar([0.2,0.3,0.4,0.5]+(env**[10,4,40,2]));
  sig = sig * env;
  Splay.ar(sig,0.75,0.25);
};
~crack.play;
);" ], [ 2910.4876437, 'alex', "(~d[0]={
	var sig, env, fenv, penv, renv;
	
	env=EnvGen.kr(Env([0,1,0.5,0], [0.01,0.5],[\\welch,\\step]), \\trig.tr);
	fenv=EnvGen.kr(Env([\\freq.kr, \\freq.kr*8, \\freq.kr], [0.01,0.05]), \\trig.tr);
	penv=EnvGen.kr(Env([-1,1,-1], [0.1,2]), \\trig.tr);
	
	sig=Balance2.ar(LFPulse.ar(fenv!2,width:[0.05,0.02,0.2,0.5]).lag([0.001,0.002]),WhiteNoise.ar(0.1)*Decay.ar(Impulse.ar([2,3]),1),penv);
	sig*env;
};
)" ], [ 2908.299367, 'joach', "~jDrum.play(vol: 0.8, fadeTime: 18);" ], [ 2900.4982951, 'alex', "~d[31]=\\filter-> {arg in; LPF.ar(in,\\lpf.kr(7400))};" ], [ 2898.5777835, 'joach', "(
~jDrum[0] = {
var osc = SinOsc.ar(( \\freq.kr(200) + \\fplus.kr(0) ), mul: 1, add: 0);
var noise = BrownNoise.ar(\\noise.kr(0), (1 - \\noise.kr(0)));
var sig = osc * noise;
Pan2.ar( sig * \\amp.kr(0), \\pan.kr(0) );
};
)" ], [ 2894.482929, 'alex', "~d[31]=\\filter-> {arg in; LPF.ar(in,\\lpf.kr(6400))};" ], [ 2890.4336232, 'alex', "~d[31]=\\filter-> {arg in; LPF.ar(in,\\lpf.kr(400))};" ], [ 2886.543855, 'kof', "(
    ~ssm.quant=2;
    ~ssm.fadeTime=2.02;
    ~ssm={
        var mod = [-1,0.25,-0.25,1/8,1/16]*0.5;
        var spread = 0.004;
      var pos = [0,0.5,0.75,0.25]+LFNoise2.kr(1/16!4).range(0,0.25);
        //         |       |       |       |       |  
        var pat = [1,0,0,0,1,0,0,0,1,0,0,0,1,0,0,0].rotate(3);
      var imp = PulseDivider.kr(~tick.kr,[8,16,32,64]/4,~counter.kr);
        var hit = Select.kr(PulseCount.kr(imp)%pat.size,pat);
  var env = EnvGen.ar(Env([0.001,1,0.001],[0.402,0.5],[3,-3],curve:'exp'),imp * hit);
        var sig = PlayBuf.ar(b.numChannels,b.bufnum,BufRateScale.kr(b.bufnum)*mod+(env*0.01),imp, (pos + BrownNoise.ar(1!8).range(spread * -1,spread)) * BufFrames.kr(b.bufnum),1);
        
  sig = sig * env;
        Splay.ar(sig.flat,0.5,0.75);
    };
    ~ssm.play;
);" ], [ 2884.9661957, 'alex', "~d[31]=\\filter-> {arg in; LPF.ar(in,\\lpf.kr(1400))};" ], [ 2883.6530134, 'kof', "(
    ~ssm.quant=2;
    ~ssm.fadeTime=2.02;
    ~ssm={
        var mod = [-1,0.25,-0.25,1/8,1/16]*0.5;
        var spread = 0.004;
      var pos = [0,0.5,0.75,0.25]+LFNoise2.kr(1/16!4).range(0,0.25);
        //         |       |       |       |       |  
        var pat = [1,0,0,0,1,0,0,0,1,0,0,0,1,0,0,0].rotate(3);
      var imp = PulseDivider.kr(~tick.kr,[8,16,32,64]/4,~counter.kr);
        var hit = Select.kr(PulseCount.kr(imp)%pat.size,pat);
  var env = EnvGen.ar(Env([0.001,1,0.001],[1.002,0.5],[3,-3],curve:'exp'),imp * hit);
        var sig = PlayBuf.ar(b.numChannels,b.bufnum,BufRateScale.kr(b.bufnum)*mod+(env*0.01),imp, (pos + BrownNoise.ar(1!8).range(spread * -1,spread)) * BufFrames.kr(b.bufnum),1);
        
  sig = sig * env;
        Splay.ar(sig.flat,0.5,0.75);
    };
    ~ssm.play;
);" ], [ 2878.3869683, 'kof', "(
    ~ssm.quant=2;
    ~ssm.fadeTime=2.02;
    ~ssm={
        var mod = [-1,0.25,-0.25,1/8,1/16]*0.5;
        var spread = 0.004;
      var pos = [0,0.5,0.75,0.25]+LFNoise2.kr(1/16!4).range(0,0.25);
        //         |       |       |       |       |  
        var pat = [1,0,0,0,1,0,0,0,1,0,0,0,1,0,0,0].rotate(3);
      var imp = PulseDivider.kr(~tick.kr,[8,16,32,64]/4,~counter.kr);
        var hit = Select.kr(PulseCount.kr(imp)%pat.size,pat);
  var env = EnvGen.ar(Env([0.001,1,0.001],[1.002,1.5],[3,-3],curve:'exp'),imp * hit);
        var sig = PlayBuf.ar(b.numChannels,b.bufnum,BufRateScale.kr(b.bufnum)*mod+(env*0.01),imp, (pos + BrownNoise.ar(1!8).range(spread * -1,spread)) * BufFrames.kr(b.bufnum),1);
        
  sig = sig * env;
        Splay.ar(sig.flat,0.5,0.75);
    };
    ~ssm.play;
);" ], [ 2875.5188798, 'joach', "(
~jDrum[1] = \\set -> QuantEnv(\\amp, 1)
.phase(1, [0.2,1,0.6,0.2], [0.05, 0.15, 0.25], [8,-2, -8], 0, 16)
.phase(2, [0.2,1,0.2], [1.35, 0.65], [2,-2], 0, 1)
.phase(3, [0.2,1,0.2], [8.35, 1.65], [8,-2], 0, 1)
.play([1,2,1,3]);
)" ], [ 2873.7118093, 'alex', "~d[1]=\\set-> Pbind(\\args, [\\trig], \\dur, Pseq([4,2],inf), \\trig,1);" ], [ 2868.689057, 'kof', "(
~kick.quant=2;
~kick.fadeTime=0.2;
~kick={
  //         |       |       |       |       |  
  var pat = [1,0,0,0,1,1,0,0,1,0,0,0,1,1,0,0].rotate(1);
  var imp = PulseDivider.kr(~tick.kr,2,~counter.kr);
  var hit = Select.kr(PulseCount.kr(imp)%pat.size,pat);
  var env = EnvGen.ar(Env([0.001,1,0.001],[0.002,4.75],[3,-3],curve:'exp'),imp * hit);
  var sig = SinOsc.ar(50+(env**100*400));
  sig = sig * env;
  Splay.ar(sig,0.75,0.65);
};
~kick.play;
);" ], [ 2861.3444669, 'joach', "(
~jDrum[1] = \\set -> QuantEnv(\\amp, 2)
.phase(1, [0.2,1,0.6,0.2], [0.05, 0.15, 0.25], [8,-2, -8], 0, 16)
.phase(2, [0.2,1,0.2], [1.35, 0.65], [2,-2], 0, 1)
.phase(3, [0.2,1,0.2], [8.35, 1.65], [8,-2], 0, 1)
.play([1,2,1,3]);
)" ], [ 2858.7347243, 'alex', "~d[31]=\\filter-> {arg in; LPF.ar(in,\\lpf.kr(5400))};" ], [ 2857.0916509, 'alex', "~d[30]=\\filter-> {arg in; Limiter.ar(GVerb.ar(in,[10,20],10),0.7)};" ], [ 2849.3429139, 'kof', "(
    ~ssm.quant=2;
    ~ssm.fadeTime=2.02;
    ~ssm={
        var mod = [-1,0.25,-0.25,1/8,1/16]*0.5;
        var spread = 0.004;
      var pos = [0,0.5,0.75,0.25]+LFNoise2.kr(1/16!4).range(0,0.25);
        //         |       |       |       |       |  
        var pat = [1,0,0,0,1,0,0,0,1,0,0,0,1,0,0,0].rotate(3);
      var imp = PulseDivider.kr(~tick.kr,[8,16,32,64]/2,~counter.kr);
        var hit = Select.kr(PulseCount.kr(imp)%pat.size,pat);
  var env = EnvGen.ar(Env([0.001,1,0.001],[1.002,1.5],[3,-3],curve:'exp'),imp * hit);
        var sig = PlayBuf.ar(b.numChannels,b.bufnum,BufRateScale.kr(b.bufnum)*mod+(env*0.01),imp, (pos + BrownNoise.ar(1!8).range(spread * -1,spread)) * BufFrames.kr(b.bufnum),1);
        
  sig = sig * env;
        Splay.ar(sig.flat,0.5,0.75);
    };
    ~ssm.play;
);" ], [ 2845.5327978, 'kof', "(
    ~ssm.quant=2;
    ~ssm.fadeTime=2.02;
    ~ssm={
        var mod = [-1,0.25,-0.25,1/8,1/16]*0.5;
        var spread = 0.004;
      var pos = [0,0.5,0.75,0.25]+LFNoise2.kr(1/16!4).range(0,0.1);
        //         |       |       |       |       |  
        var pat = [1,0,0,0,1,0,0,0,1,0,0,0,1,0,0,0].rotate(3);
      var imp = PulseDivider.kr(~tick.kr,[8,16,32,64]/2,~counter.kr);
        var hit = Select.kr(PulseCount.kr(imp)%pat.size,pat);
  var env = EnvGen.ar(Env([0.001,1,0.001],[1.002,1.5],[3,-3],curve:'exp'),imp * hit);
        var sig = PlayBuf.ar(b.numChannels,b.bufnum,BufRateScale.kr(b.bufnum)*mod+(env*0.01),imp, (pos + BrownNoise.ar(1!8).range(spread * -1,spread)) * BufFrames.kr(b.bufnum),1);
        
  sig = sig * env;
        Splay.ar(sig.flat,0.5,0.75);
    };
    ~ssm.play;
);" ], [ 2845.0617836, 'alex', "~d[31]=\\filter-> {arg in; LPF.ar(in,\\lpf.kr(5400))};" ], [ 2840.7992226, 'alex', "~d[31]=\\filter-> {arg in; LPF.ar(in,\\lpf.kr(2400))};" ], [ 2834.8907003, 'alex', "~d[31]=\\filter-> {arg in; LPF.ar(in,\\lpf.kr(400))};" ], [ 2830.4100434, 'kof', "(
    ~ssm.quant=2;
    ~ssm.fadeTime=2.02;
    ~ssm={
        var mod = [-1,0.25,-0.25,1/8,1/16]*0.5;
        var spread = 0.004;
      var pos = [0,0.5,0.75,0.25]+LFNoise2.kr(1/16).range(0,0.1);
        //         |       |       |       |       |  
        var pat = [1,0,0,0,1,0,0,0,1,0,0,0,1,0,0,0].rotate(3);
      var imp = PulseDivider.kr(~tick.kr,[8,16,32,64]/2,~counter.kr);
        var hit = Select.kr(PulseCount.kr(imp)%pat.size,pat);
  var env = EnvGen.ar(Env([0.001,1,0.001],[1.002,1.5],[3,-3],curve:'exp'),imp * hit);
        var sig = PlayBuf.ar(b.numChannels,b.bufnum,BufRateScale.kr(b.bufnum)*mod+(env*0.01),imp, (pos + BrownNoise.ar(1!8).range(spread * -1,spread)) * BufFrames.kr(b.bufnum),1);
        
  sig = sig * env;
        Splay.ar(sig.flat,0.5,0.75);
    };
    ~ssm.play;
);" ], [ 2828.9868023, 'alex', "~d[31]=\\filter-> {arg in; LPF.ar(in,\\lpf.kr(1200))};" ], [ 2820.1321312, 'joach', "(
~jDrum[9] = \\set -> QuantEnv(\\pan, 4)
.phase(1, [-0.5,0.5,-0.5], [2.05, 1.95], [\\sin], 0, 4)
.phase(2, [-1,[1!4],-1], [0.35, 0.65], [2,-2], 0, 1)
.play([1,2]);
)" ], [ 2813.2879328, 'kof', "(
    ~ssm.quant=2;
    ~ssm.fadeTime=2.02;
    ~ssm={
        var mod = [-1,0.25,-0.25,1/8,1/16]*0.5;
        var spread = 0.004;
        var pos = [0,0.5,0.75,0.25]+0.03;
        //         |       |       |       |       |  
        var pat = [1,0,0,0,1,0,0,0,1,0,0,0,1,0,0,0].rotate(3);
      var imp = PulseDivider.kr(~tick.kr,[8,16,32,64]/2,~counter.kr);
        var hit = Select.kr(PulseCount.kr(imp)%pat.size,pat);
  var env = EnvGen.ar(Env([0.001,1,0.001],[1.002,1.5],[3,-3],curve:'exp'),imp * hit);
        var sig = PlayBuf.ar(b.numChannels,b.bufnum,BufRateScale.kr(b.bufnum)*mod+(env*0.01),imp, (pos + BrownNoise.ar(1!8).range(spread * -1,spread)) * BufFrames.kr(b.bufnum),1);
        
  sig = sig * env;
        Splay.ar(sig.flat,0.5,0.75);
    };
    ~ssm.play;
);" ], [ 2810.7566554, 'joach', "(
~jDrum[9] = \\set -> QuantEnv(\\pan, 4)
.phase(1, [-0.5,0.5,-0.5], [2.05, 1.95], [\\sin], 0, 1)
.phase(2, [-1,[1!4],-1], [0.35, 0.65], [2,-2], 0, 1)
.play([1]);
)" ], [ 2809.1783513, 'kof', "(
    ~ssm.quant=2;
    ~ssm.fadeTime=2.02;
    ~ssm={
        var mod = [-1,0.25,-0.25,1/8,1/16]*0.5;
        var spread = 0.004;
        var pos = [0,0.5,0.75,0.25]+0.02;
        //         |       |       |       |       |  
        var pat = [1,0,0,0,1,0,0,0,1,0,0,0,1,0,0,0].rotate(3);
      var imp = PulseDivider.kr(~tick.kr,[8,16,32,64]/2,~counter.kr);
        var hit = Select.kr(PulseCount.kr(imp)%pat.size,pat);
  var env = EnvGen.ar(Env([0.001,1,0.001],[1.002,1.5],[3,-3],curve:'exp'),imp * hit);
        var sig = PlayBuf.ar(b.numChannels,b.bufnum,BufRateScale.kr(b.bufnum)*mod+(env*0.01),imp, (pos + BrownNoise.ar(1!8).range(spread * -1,spread)) * BufFrames.kr(b.bufnum),1);
        
  sig = sig * env;
        Splay.ar(sig.flat,0.5,0.75);
    };
    ~ssm.play;
);" ], [ 2803.0618648, 'kof', "(
    ~ssm.fadeTime=2.02;
    ~ssm={
        var mod = [-1,0.25,-0.25,1/8,1/16]*0.5;
        var spread = 0.004;
        var pos = [0,0.5,0.75,0.25]+0.01;
        //         |       |       |       |       |  
        var pat = [1,0,0,0,1,0,0,0,1,0,0,0,1,0,0,0].rotate(3);
      var imp = PulseDivider.kr(~tick.kr,[8,16,32,64]/2,~counter.kr);
        var hit = Select.kr(PulseCount.kr(imp)%pat.size,pat);
  var env = EnvGen.ar(Env([0.001,1,0.001],[1.002,1.5],[3,-3],curve:'exp'),imp * hit);
        var sig = PlayBuf.ar(b.numChannels,b.bufnum,BufRateScale.kr(b.bufnum)*mod+(env*0.01),imp, (pos + BrownNoise.ar(1!8).range(spread * -1,spread)) * BufFrames.kr(b.bufnum),1);
        
  sig = sig * env;
        Splay.ar(sig.flat,0.5,0.75);
    };
    ~ssm.play;
);" ], [ 2795.7799493, 'kof', "(
    ~ssm.quant=2;
    ~ssm.fadeTime=2.02;
    ~ssm={
        var mod = [-1,0.25,-0.25,1/8,1/16]*0.5;
        var spread = 0.004;
        var pos = [0,0.5,0.75,0.25]+0.1;
        //         |       |       |       |       |  
        var pat = [1,0,0,0,1,0,0,0,1,0,0,0,1,0,0,0].rotate(3);
      var imp = PulseDivider.kr(~tick.kr,[8,16,32,64]/2,~counter.kr);
        var hit = Select.kr(PulseCount.kr(imp)%pat.size,pat);
  var env = EnvGen.ar(Env([0.001,1,0.001],[1.002,1.5],[3,-3],curve:'exp'),imp * hit);
        var sig = PlayBuf.ar(b.numChannels,b.bufnum,BufRateScale.kr(b.bufnum)*mod+(env*0.01),imp, (pos + BrownNoise.ar(1!8).range(spread * -1,spread)) * BufFrames.kr(b.bufnum),1);
        
  sig = sig * env;
        Splay.ar(sig.flat,0.5,0.75);
    };
    ~ssm.play;
);" ], [ 2794.4161764, 'alex', "(~d[2]=\\set-> Pbind(\\args, [\\freq], \\dur, 4, \\octave, Pseq([[2,3],[4,2],[2,3]],inf), 
\\degree, Pseq([[4,2,3], [5,3,2]],inf) );)" ], [ 2781.7043574, 'joach', "(
~jDrum[8] = \\set -> QuantEnv(\\freq, 48)
.phase(1, [200,216,200], [32, 16], [\\sin], 0, 3)
.phase(2, [200,(160,120..80),200], [6, 2], [\\sin], 0, 1)
.play([1,2]);
)" ], [ 2781.1854757, 'alex', "~d.play(vol:1, fadeTime:2);" ], [ 2775.2762994, 'alex', "~d.play(vol:0.7, fadeTime:2);" ], [ 2769.2382674, 'kof', "(
    ~ssm.quant=2;
    ~ssm.fadeTime=2.02;
    ~ssm={
        var mod = [-1,0.25,-0.25,1/8,1/16]*0.5;
        var spread = 0.004;
        var pos = [0,0.5,0.75,0.25];
        //         |       |       |       |       |  
        var pat = [1,0,0,0,1,0,0,0,1,0,0,0,1,0,0,0].rotate(3);
      var imp = PulseDivider.kr(~tick.kr,[8,16,32,64]/2,~counter.kr);
        var hit = Select.kr(PulseCount.kr(imp)%pat.size,pat);
  var env = EnvGen.ar(Env([0.001,1,0.001],[0.002,1.5],[3,-3],curve:'exp'),imp * hit);
        var sig = PlayBuf.ar(b.numChannels,b.bufnum,BufRateScale.kr(b.bufnum)*mod+(env*0.01),imp, (pos + BrownNoise.ar(1!8).range(spread * -1,spread)) * BufFrames.kr(b.bufnum),1);
        
  sig = sig * env;
        Splay.ar(sig.flat,0.5,0.75);
    };
    ~ssm.play;
);" ], [ 2762.7516183, 'kof', "(
    ~ssm.quant=2;
    ~ssm.fadeTime=2.02;
    ~ssm={
        var mod = [-1,0.25,-0.25,1/8,1/16]*1.25;
        var spread = 0.004;
        var pos = [0,0.5,0.75,0.25];
        //         |       |       |       |       |  
        var pat = [1,0,0,0,1,0,0,0,1,0,0,0,1,0,0,0].rotate(3);
      var imp = PulseDivider.kr(~tick.kr,[8,16,32,64]/2,~counter.kr);
        var hit = Select.kr(PulseCount.kr(imp)%pat.size,pat);
  var env = EnvGen.ar(Env([0.001,1,0.001],[0.002,1.5],[3,-3],curve:'exp'),imp * hit);
        var sig = PlayBuf.ar(b.numChannels,b.bufnum,BufRateScale.kr(b.bufnum)*mod+(env*0.01),imp, (pos + BrownNoise.ar(1!8).range(spread * -1,spread)) * BufFrames.kr(b.bufnum),1);
        
  sig = sig * env;
        Splay.ar(sig.flat,0.5,0.75);
    };
    ~ssm.play;
);" ], [ 2761.8287988, 'alex', "(~d[0]={
	var sig, env, fenv, penv, renv;
	
	env=EnvGen.kr(Env([0,1,0.5,0], [0.01,0.5],[\\welch,\\step]), \\trig.tr);
	fenv=EnvGen.kr(Env([\\freq.kr, \\freq.kr*8, \\freq.kr], [0.01,0.05]), \\trig.tr);
	penv=EnvGen.kr(Env([-1,1,-1], [0.1,2]), \\trig.tr);
	
	sig=Balance2.ar(LFPulse.ar(fenv!2,width:[0.05,0.02,0.2,0.5]).lag([0.001,0.002]),WhiteNoise.ar(0.01)*Decay.ar(Impulse.ar([2,3]),1),penv);
	sig*env;
};
)" ], [ 2761.1717723, 'joach', "~jDrum[5] = \\filter -> {|in| GVerb.ar(in, \\gverb_size.kr(40), \\gverb_time.kr(0.5), 0.9, mul:\\mulgverb.kr(1), add:(1-\\mulgverb.kr(1))) };" ], [ 2753.0929361, 'joach', "(
~jDrum[8] = \\set -> QuantEnv(\\freq, 48)
.phase(1, [200,216,200], [32, 16], [\\sin], 0, 3)
.phase(2, [20,(160,120..80),60], [6, 2], [\\sin], 0, 1)
.play([1,2]);
)" ], [ 2747.6862056, 'kof', "(
    ~ssm.quant=2;
    ~ssm.fadeTime=2.02;
    ~ssm={
        var mod = [-1,0.25,-0.25,1/8,1/16]*1.5;
        var spread = 0.004;
        var pos = [0,0.5,0.75,0.25];
        //         |       |       |       |       |  
        var pat = [1,0,0,0,1,0,0,0,1,0,0,0,1,0,0,0].rotate(3);
      var imp = PulseDivider.kr(~tick.kr,[8,16,32,64]/2,~counter.kr);
        var hit = Select.kr(PulseCount.kr(imp)%pat.size,pat);
  var env = EnvGen.ar(Env([0.001,1,0.001],[0.002,1.5],[3,-3],curve:'exp'),imp * hit);
        var sig = PlayBuf.ar(b.numChannels,b.bufnum,BufRateScale.kr(b.bufnum)*mod+(env*0.01),imp, (pos + BrownNoise.ar(1!8).range(spread * -1,spread)) * BufFrames.kr(b.bufnum),1);
        
  sig = sig * env;
        Splay.ar(sig.flat,0.5,0.75);
    };
    ~ssm.play;
);" ], [ 2743.2979212, 'joach', "(
~jDrum[8] = \\set -> QuantEnv(\\freq, 48)
.phase(1, [120,146,120], [32, 16], [\\sin], 0, 3)
.phase(2, [20,(160,120..80),60], [6, 2], [\\sin], 0, 1)
.play([1,2]);
)" ], [ 2735.7964715, 'kof', "(
    ~ssm.quant=2;
    ~ssm.fadeTime=2.02;
    ~ssm={
        var mod = [-1,0.25,-0.25,1/8,1/16]/4;
        var spread = 0.004;
        var pos = [0,0.5,0.75,0.25];
        //         |       |       |       |       |  
        var pat = [1,0,0,0,1,0,0,0,1,0,0,0,1,0,0,0].rotate(3);
      var imp = PulseDivider.kr(~tick.kr,[8,16,32,64]/2,~counter.kr);
        var hit = Select.kr(PulseCount.kr(imp)%pat.size,pat);
  var env = EnvGen.ar(Env([0.001,1,0.001],[0.002,1.5],[3,-3],curve:'exp'),imp * hit);
        var sig = PlayBuf.ar(b.numChannels,b.bufnum,BufRateScale.kr(b.bufnum)*mod+(env*0.01),imp, (pos + BrownNoise.ar(1!8).range(spread * -1,spread)) * BufFrames.kr(b.bufnum),1);
        
  sig = sig * env;
        Splay.ar(sig.flat,0.5,0.75);
    };
    ~ssm.play;
);" ], [ 2730.5788024, 'joach', "(
~jDrum[8] = \\set -> QuantEnv(\\freq, 48)
.phase(1, [120,146,180], [32, 16], [\\sin], 0, 3)
.phase(2, [20,(160,120..80),60], [6, 2], [\\sin], 0, 1)
.play([1,2]);
)" ], [ 2726.8127832, 'kof', "(
    ~ssm.quant=2;
    ~ssm.fadeTime=2.02;
    ~ssm={
        var mod = [-1,0.25,-0.25,1/8,1/16];
        var spread = 0.004;
        var pos = [0,0.5,0.75,0.25];
        //         |       |       |       |       |  
        var pat = [1,0,0,0,1,0,0,0,1,0,0,0,1,0,0,0].rotate(3);
      var imp = PulseDivider.kr(~tick.kr,[8,16,32,64]/2,~counter.kr);
        var hit = Select.kr(PulseCount.kr(imp)%pat.size,pat);
  var env = EnvGen.ar(Env([0.001,1,0.001],[0.002,1.5],[3,-3],curve:'exp'),imp * hit);
        var sig = PlayBuf.ar(b.numChannels,b.bufnum,BufRateScale.kr(b.bufnum)*mod+(env*0.01),imp, (pos + BrownNoise.ar(1!8).range(spread * -1,spread)) * BufFrames.kr(b.bufnum),1);
        
  sig = sig * env;
        Splay.ar(sig.flat,0.5,0.75);
    };
    ~ssm.play;
);" ], [ 2723.1249807, 'kof', "b = Buffer.read(s,Platform.resourceDir ++ \"/sounds/violin.wav\");" ], [ 2720.9170803, 'alex', "~d.play(vol:0.5, fadeTime:2);" ], [ 2718.4058078, 'alex', "~d.scope;" ], [ 2715.885799, 'alex', "~d.play(vol:0.3, fadeTime:2);" ], [ 2714.4986716, 'joach', "(
~jDrum[8] = \\set -> QuantEnv(\\freq, 48)
.phase(1, [120,186,180], [32, 16], [\\sin], 0, 3)
.phase(2, [20,(160,120..80),60], [6, 2], [\\sin], 0, 1)
.play([1,2]);
)" ], [ 2711.4644502, 'alex', "~d.play(vol:0.2, fadeTime:2);" ], [ 2705.0969987, 'kof', "~ff.clear;" ], [ 2705.0813373, 'joach', "(
~jDrum[8] = \\set -> QuantEnv(\\freq, 48)
.phase(1, [80,86,80], [32, 16], [\\sin], 0, 3)
.phase(2, [20,(160,120..80),60], [6, 2], [\\sin], 0, 1)
.play([1,2]);
)" ], [ 2703.9253631, 'alex', "(~d[0]={
	var sig, env, fenv, penv, renv;
	
	env=EnvGen.kr(Env([0,1,0.5,0], [0.01,0.5],[\\welch,\\step]), \\trig.tr);
	fenv=EnvGen.kr(Env([\\freq.kr, \\freq.kr*8, \\freq.kr], [0.01,0.05]), \\trig.tr);
	penv=EnvGen.kr(Env([-1,1,-1], [0.1,2]), \\trig.tr);
	
	sig=Balance2.ar(LFPulse.ar(fenv!2,width:[0.05,0.02,0.2,0.5]).lag([0.001,0.002]),WhiteNoise.ar(0.01),penv);
	sig*env;
};
)" ], [ 2697.0472609, 'kof', "(
~crack.quant=2;
~crack.fadeTime=0.2;
~crack={
  //         |       |       |       |       |  
  var pat = [1,0,0,0,1,0,0,0,1,0,0,0,1,1,1,1].rotate(3);
  var imp = PulseDivider.kr(~tick.kr,fib(8)*4,~counter.kr);
  var hit = Select.kr(PulseCount.kr(imp)%pat.size,pat);
  var env = EnvGen.ar(Env([0.001,1,0.001],[0.002,0.15+[0.1,0.2,0.3,0.4]],[3,-3],curve:'exp'),imp * hit);
  var sig = Crackle.ar([0.2,0.3,0.4,0.5]+(env**[10,4,40,2]));
  sig = sig * env;
  Splay.ar(sig,0.75,0.25);
};
~crack.play;
);" ], [ 2694.3282681, 'joach', "(
~jDrum[8] = \\set -> QuantEnv(\\freq, 48)
.phase(1, [60,76,60], [32, 16], [\\sin], 0, 3)
.phase(2, [20,(160,120..80),60], [6, 2], [\\sin], 0, 1)
.play([1,2]);
)" ], [ 2684.9952923, 'joach', "(
~jDrum[8] = \\set -> QuantEnv(\\freq, 48)
.phase(1, [60,26,60], [32, 16], [\\sin], 0, 3)
.phase(2, [20,(160,120..80),60], [6, 2], [\\sin], 0, 1)
.play([1,2]);
)" ], [ 2659.9241986, 'joach', "(
~jDrum[9] = \\set -> QuantEnv(\\pan, 4)
.phase(1, [-0.5,0.5,-0.5], [2.05, 1.95], [\\sin], 0, 1)
.phase(2, [0,1,0], [0.35, 0.65], [2,-2], 0, 1)
.play([1]);
)" ], [ 2653.9719084, 'alex', "(~d[2]=\\set-> Pbind(\\args, [\\freq], \\dur, 4, \\octave, Pseq([[2,3],[5,2],[2,3]],inf), 
\\degree, Pseq([[4,2,3], [5,7,2]],inf) );)" ], [ 2651.6216196, 'alex', "~d[1]=\\set-> Pbind(\\args, [\\trig], \\dur, 4, \\trig,1);" ], [ 2642.4386426, 'alex', "(~d[0]={
	var sig, env, fenv, penv, renv;
	
	env=EnvGen.kr(Env([0,1,0.5,0], [0.01,0.5],[\\welch,\\step]), \\trig.tr);
	fenv=EnvGen.kr(Env([\\freq.kr, \\freq.kr*8, \\freq.kr], [0.01,0.05]), \\trig.tr);
	penv=EnvGen.kr(Env([-1,1,-1], [0.1,2]), \\trig.tr);
	
	sig=Balance2.ar(LFPulse.ar(fenv!2,width:[0.05,0.02,0.2,0.5]),WhiteNoise.ar(0.01),penv);
	sig*env;
};
)" ], [ 2633.0074048, 'kof', "(
~crack.quant=2;
~crack.fadeTime=0.2;
~crack={
  //         |       |       |       |       |  
  var pat = [1,0,0,0,1,0,0,0,1,0,0,0,1,1,1,1].rotate(3);
  var imp = PulseDivider.kr(~tick.kr,fib(8)*4,~counter.kr);
  var hit = Select.kr(PulseCount.kr(imp)%pat.size,pat);
  var env = EnvGen.ar(Env([0.001,1,0.001],[0.002,0.15+[0.1,0.2,0.3,0.4]],[3,-3],curve:'exp'),imp * hit);
  var sig = Crackle.ar([0.2,0.3,0.4,0.5]+(env**[10,4,40,2]));
  sig = sig * env;
  Splay.ar(sig,0.75,0.5);
};
~crack.play;
);" ], [ 2628.256958, 'kof', "(
~crack.quant=2;
~crack.fadeTime=0.2;
~crack={
  //         |       |       |       |       |  
  var pat = [1,0,0,0,1,0,0,0,1,0,0,0,1,1,1,1].rotate(3);
  var imp = PulseDivider.kr(~tick.kr,fib(8)*4,~counter.kr);
  var hit = Select.kr(PulseCount.kr(imp)%pat.size,pat);
  var env = EnvGen.ar(Env([0.001,1,0.001],[0.002,0.15+[0.1,0.2,0.3,0.4]],[3,-3],curve:'exp'),imp * hit);
  var sig = Crackle.ar([0.2,0.3,0.4,0.5]+(env**[10,4,40,2]));
  sig = sig * env;
  Splay.ar(sig,0.75,0.35);
};
~crack.play;
);" ], [ 2618.9157903, 'alex', "~d.play(vol:0.1, fadeTime:2);" ], [ 2612.4674472, 'alex', "~d[30]=\\filter-> {arg in; Limiter.ar(GVerb.ar(in,[40,20],10),0.7)};" ], [ 2608.1259534, 'kof', "(
    ~ssm.quant=2;
    ~ssm.fadeTime=2.02;
    ~ssm={
        var mod = [-1,0.25,-0.25,1/8,1/16];
        var spread = 0.004;
        var pos = [0,0.5,0.75,0.25];
        //         |       |       |       |       |  
        var pat = [1,0,0,0,1,0,0,0,1,0,0,0,1,0,0,0].rotate(3);
      var imp = PulseDivider.kr(~tick.kr,[8,16,32,64]/2,~counter.kr);
        var hit = Select.kr(PulseCount.kr(imp)%pat.size,pat);
  var env = EnvGen.ar(Env([0.001,1,0.001],[0.002,1.5],[3,-3],curve:'exp'),imp * hit);
        var sig = PlayBuf.ar(b.numChannels,b.bufnum,BufRateScale.kr(b.bufnum)*mod+(env*0.01),imp, (pos + BrownNoise.ar(1!8).range(spread * -1,spread)) * BufFrames.kr(b.bufnum),1);
        
  sig = sig * env;
        Splay.ar(sig.flat,0.5,0.75);
    };
    ~ssm.play;
);" ], [ 2607.1103611, 'joach', "(
~jDrum[7] = \\set -> QuantEnv(\\lpf_freq, 32)
.phase(1, [800,4100,80], [32.05, 0.95], [2,-2], 0, 1)
.phase(2, [800,8200,1200,800], [10.35, 2, 12.65], \\sin, 0, 1)
.play([1,2]);
)" ], [ 2599.8128201, 'kof', "(
    ~ssm.quant=2;
    ~ssm.fadeTime=2.02;
    ~ssm={
        var mod = [-1,0.25,-0.25,1/8,1/16];
        var spread = 0.004;
        var pos = [0,0.5,0.75,0.25]/3;
        //         |       |       |       |       |  
        var pat = [1,0,0,0,1,0,0,0,1,0,0,0,1,0,0,0].rotate(3);
      var imp = PulseDivider.kr(~tick.kr,[8,16,32,64]/2,~counter.kr);
        var hit = Select.kr(PulseCount.kr(imp)%pat.size,pat);
  var env = EnvGen.ar(Env([0.001,1,0.001],[0.002,1.5],[3,-3],curve:'exp'),imp * hit);
        var sig = PlayBuf.ar(b.numChannels,b.bufnum,BufRateScale.kr(b.bufnum)*mod+(env*0.01),imp, (pos + BrownNoise.ar(1!8).range(spread * -1,spread)) * BufFrames.kr(b.bufnum),1);
        
  sig = sig * env;
        Splay.ar(sig.flat,0.5,0.75);
    };
    ~ssm.play;
);" ], [ 2593.9817615, 'alex', "~d.play(vol:1, fadeTime:2);" ], [ 2593.0764429, 'joach', "(
~jDrum[3] = \\set -> QuantEnv(\\noise, 2)
.phase(1, [0.1,0.7,0.1], [3.05, 0.95], [2,-2], 0, 4)
.phase(2, [0,1,0.1], [1.35, 2.65], [2,-2], 0, 1)
.play([1,2]);
)" ], [ 2588.8730002, 'kof', "(
    ~ssm.quant=2;
    ~ssm.fadeTime=2.02;
    ~ssm={
        var mod = [-1,0.25,-0.25,1/8,1/16];
        var spread = 0.004;
        var pos = [0,0.5,0.75,0.25]/3;
        //         |       |       |       |       |  
        var pat = [1,0,0,0,1,0,0,0,1,0,0,0,1,0,0,0].rotate(3);
      var imp = PulseDivider.kr(~tick.kr,[8,16,32,64],~counter.kr);
        var hit = Select.kr(PulseCount.kr(imp)%pat.size,pat);
  var env = EnvGen.ar(Env([0.001,1,0.001],[0.002,1.5],[3,-3],curve:'exp'),imp * hit);
        var sig = PlayBuf.ar(b.numChannels,b.bufnum,BufRateScale.kr(b.bufnum)*mod+(env*0.01),imp, (pos + BrownNoise.ar(1!8).range(spread * -1,spread)) * BufFrames.kr(b.bufnum),1);
        
  sig = sig * env;
        Splay.ar(sig.flat,0.5,0.75);
    };
    ~ssm.play;
);" ], [ 2585.4292234, 'kof', "b = Buffer.read(s,Platform.resourceDir ++ \"/sounds/beat.wav\");" ], [ 2583.9177339, 'alex', "~d.play(vol:0.7, fadeTime:2);" ], [ 2577.5811658, 'alex', "~d[30]=\\filter-> {arg in; Limiter.ar(GVerb.ar(in!2,[40,20],10),0.7)};" ], [ 2576.1346463, 'alex', "(~d[2]=\\set-> Pbind(\\args, [\\freq], \\dur, 4, \\octave, Pseq([[2,3],[5,2],[2,3]],inf), 
\\degree, Pseq([[4,2,3], [5,7,2]],inf) );)" ], [ 2575.1520997, 'alex', "~d[1]=\\set-> Pbind(\\args, [\\trig], \\dur, 4, \\trig,1);" ], [ 2573.6185764, 'joach', "(
~jDrum[3] = \\set -> QuantEnv(\\noise, 2)
.phase(1, [0.1,0.5,0.1], [3.05, 0.95], [2,-2], 0, 4)
.phase(2, [0,1,0.1], [1.35, 2.65], [2,-2], 0, 1)
.play([1,2]);
)" ], [ 2570.6706473, 'alex', "(~d[0]={
	var sig, env, fenv, penv, renv;
	
	env=EnvGen.kr(Env([0,1,0.5,0], [0.01,0.5],[\\welch,\\step]), \\trig.tr);
	fenv=EnvGen.kr(Env([\\freq.kr, \\freq.kr*8, \\freq.kr], [0.01,0.05]), \\trig.tr);
	penv=EnvGen.kr(Env([-1,1,-1], [0.1,0.5]), \\trig.tr);
	
	sig=Balance2.ar(LFPulse.ar(fenv!2,width:[0.05,0.02,0.2,0.5]),WhiteNoise.ar(0.01),penv);
	sig*env;
};
)" ], [ 2566.4014466, 'alex', "~d.play(vol:0.1, fadeTime:2);" ], [ 2561.3224836, 'kof', "(
~weirdo.quant=2;
~weirdo.fadeTime=0.2;
~weirdo={
  //         |       |       |       |       |  
  var pat = [1,0,0,0,1,0,0,0,1,0,0,0,1,0,0,0].rotate(3);
  var imp = PulseDivider.kr(~tick.kr,64*fib(4),~counter.kr);
  var hit = Select.kr(PulseCount.kr(imp)%pat.size,pat);
  var env = EnvGen.ar(Env([0.001,1,0.001],[1.002,1.5],[3,-3],curve:'exp'),imp * hit);
  var sig = SinOsc.ar(SinOsc.ar([1,2,3,4]*40*env).range(40,4000).round(50)*2/([1,2,4,8]*pi));
  sig = sig * env;
  Splay.ar(sig,0.75,0.35);
};
~weirdo.play;
);" ], [ 2560.8338144, 'alex', "~d[30]=\\filter-> {arg in; Limiter.ar(GVerb.ar(in!2,[40,20],10),0.7)};" ], [ 2555.4119534, 'kof', "(
~weirdo.quant=2;
~weirdo.fadeTime=0.2;
~weirdo={
  //         |       |       |       |       |  
  var pat = [1,0,0,0,1,0,0,0,1,0,0,0,1,0,0,0].rotate(3);
  var imp = PulseDivider.kr(~tick.kr,64*fib(4),~counter.kr);
  var hit = Select.kr(PulseCount.kr(imp)%pat.size,pat);
  var env = EnvGen.ar(Env([0.001,1,0.001],[1.002,1.5],[3,-3],curve:'exp'),imp * hit);
  var sig = SinOsc.ar(SinOsc.ar([1,2,3,4]*4).range(40,4000).round(50)*2/([1,2,4,8]*pi));
  sig = sig * env;
  Splay.ar(sig,0.75,0.35);
};
~weirdo.play;
);" ], [ 2545.837354, 'alex', "~d.play(vol:0.1, fadeTime:2);" ], [ 2539.9060175, 'alex', "~d[30]=\\filter-> {arg in; Limiter.ar(GVerb.ar(in,[40,20],10),0.7)};" ], [ 2539.4325516, 'joach', "(
~jDrum[2] = \\set -> QuantEnv(\\fplus, 1)
.phase(1, [0,70,0], [0.005, 0.35], [8,-8], 0, 16)
.phase(2, [0,[220,120],0], [0.035, 0.065], [8,-2], 0, 1)
.phase(3, [0,[70!3,120],0], [0.035, 0.065], [8,-2], 0, 1)
.play([1,2,1,3]);
)" ], [ 2537.9480071, 'kof', "(
~kick.quant=2;
~kick.fadeTime=0.2;
~kick={
  //         |       |       |       |       |  
  var pat = [1,0,0,0,1,1,0,0,1,0,0,0,1,1,0,0].rotate(1);
  var imp = PulseDivider.kr(~tick.kr,4,~counter.kr);
  var hit = Select.kr(PulseCount.kr(imp)%pat.size,pat);
  var env = EnvGen.ar(Env([0.001,1,0.001],[0.002,4.75],[3,-3],curve:'exp'),imp * hit);
  var sig = SinOsc.ar(50+(env**100*400));
  sig = sig * env;
  Splay.ar(sig,0.75,0.65);
};
~kick.play;
);" ], [ 2532.197188, 'joach', "(
~jDrum[2] = \\set -> QuantEnv(\\fplus, 1)
.phase(1, [0,70,0], [0.005, 0.35], [8,-8], 0, 16)
.phase(2, [0,[120,120],0], [0.035, 0.065], [8,-2], 0, 1)
.phase(3, [0,[70!3,120],0], [0.035, 0.065], [8,-2], 0, 1)
.play([1,2,1,3]);
)" ], [ 2531.37178, 'alex', "~d.scope;" ], [ 2530.1192307, 'joach', "(
~jDrum[2] = \\set -> QuantEnv(\\fplus, 1)
.phase(1, [0,70,0], [0.005, 0.35], [8,-8], 0, 16)
.phase(2, [0,[120,120],0], [0.035, 0.065], [8,-2], 0, 1)
.phase(3, [0,[470!3,120],0], [0.035, 0.065], [8,-2], 0, 1)
.play([1,2,1,3]);
)" ], [ 2524.6992657, 'alex', "~d.play(vol:1, fadeTime:2);" ], [ 2521.8570831, 'alex', "~f[30]=\\filter-> {arg in; Limiter.ar(GVerb.ar(in,[40,20],10),0.7)};" ], [ 2519.5577003, 'alex', "(~d[2]=\\set-> Pbind(\\args, [\\freq], \\dur, 4, \\octave, Pseq([[2,3],[5,2],[2,3]],inf), 
\\degree, Pseq([[4,2,3], [5,7,2]],inf) );)" ], [ 2518.5723283, 'alex', "~d[1]=\\set-> Pbind(\\args, [\\trig], \\dur, 4, \\trig,1);" ], [ 2514.6662638, 'joach', "~jDrum.play(vol: 0.4, fadeTime: 18);" ], [ 2514.5309909, 'alex', "(~d[0]={
	var sig, env, fenv, penv, renv;
	
	env=EnvGen.kr(Env([0,1,0.5,0], [0.01,0.5],[\\welch,\\step]), \\trig.tr);
	fenv=EnvGen.kr(Env([\\freq.kr, \\freq.kr*8, \\freq.kr], [0.01,0.05]), \\trig.tr);
	penv=EnvGen.kr(Env([-1,1,-1], [0.1,0.5]), \\trig.tr);
	
	sig=Balance2.ar(LFPulse.ar(fenv!2,width:[0.05,0.02,0.2,0.5]),WhiteNoise.ar(0.01),penv);
	sig*env;
};
)" ], [ 2506.2137405, 'joach', "~jDrum[4] = \\filter -> {|in| LPF.ar(in, \\lpf_freq.kr(800,8)) };" ], [ 2504.6664648, 'kof', "(
~crack.quant=2;
~crack.fadeTime=0.2;
~crack={
  //         |       |       |       |       |  
  var pat = [1,0,0,0,1,0,0,0,1,0,0,0,1,1,1,1].rotate(3);
  var imp = PulseDivider.kr(~tick.kr,fib(8)*64,~counter.kr);
  var hit = Select.kr(PulseCount.kr(imp)%pat.size,pat);
  var env = EnvGen.ar(Env([0.001,1,0.001],[0.002,0.15+[0.1,0.2,0.3,0.4]],[3,-3],curve:'exp'),imp * hit);
  var sig = Crackle.ar([0.2,0.3,0.4,0.5]+(env**[10,4,40,2]));
  sig = sig * env;
  Splay.ar(sig,0.75,0.35);
};
~crack.play;
);" ], [ 2499.6818529, 'joach', "~jDrum.play(vol: 0.1, fadeTime: 18);" ], [ 2497.9317308, 'joach', "(
~jDrum[0] = {
var osc = LFSaw.ar(( \\freq.kr(200) + \\fplus.kr(0) ), mul: 1, add: 0);
var noise = BrownNoise.ar(\\noise.kr(0), (1 - \\noise.kr(0)));
var sig = osc * noise;
Pan2.ar( sig * \\amp.kr(0), \\pan.kr(0) );
};
)" ], [ 2492.0417937, 'kof', "b = Buffer.read(s,Platform.resourceDir ++ \"/sounds/beat3.wav\");" ], [ 2485.2108498, 'kof', "(
    ~ssm.quant=2;
    ~ssm.fadeTime=2.02;
    ~ssm={
        var mod = [-1,0.25,-0.25,1/8,1/16];
        var spread = 0.004;
        var pos = [0,0.5,0.75,0.25]/3;
        //         |       |       |       |       |  
        var pat = [1,0,0,0,1,0,0,0,1,0,0,0,1,0,0,0].rotate(3);
      var imp = PulseDivider.kr(~tick.kr,[8,16,32,64],~counter.kr);
        var hit = Select.kr(PulseCount.kr(imp)%pat.size,pat);
  var env = EnvGen.ar(Env([0.001,1,0.001],[0.002,1.5],[3,-3],curve:'exp'),imp * hit);
        var sig = PlayBuf.ar(b.numChannels,b.bufnum,BufRateScale.kr(b.bufnum)*mod+(env*0.01),imp, (pos + BrownNoise.ar(1!8).range(spread * -1,spread)) * BufFrames.kr(b.bufnum),1);
        
  sig = sig * env;
        Splay.ar(sig.flat,0.5,0.75);
    };
    ~ssm.play;
);" ], [ 2483.8854369, 'kof', "b = Buffer.read(s,Platform.resourceDir ++ \"/sounds/beat2.wav\");" ], [ 2482.8502909, 'joach', "(
~jDrum[1] = \\set -> QuantEnv(\\amp, 8)
.phase(1, [0.2,1,0.6,0.2], [0.05, 0.15, 0.25], [8,-2, -8], 0, 16)
.phase(2, [0.2,1,0.2], [1.35, 0.65], [2,-2], 0, 1)
.phase(3, [0.2,1,0.2], [8.35, 1.65], [8,-2], 0, 1)
.play([1,2,1,3]);
)" ], [ 2473.856841, 'kof', "(
    ~ssm.quant=2;
    ~ssm.fadeTime=2.02;
    ~ssm={
        var mod = [-1,0.25,-0.25,1/8,1/16];
        var spread = 0.004;
        var pos = [0,0.5,0.75,0.25]/3;
        //         |       |       |       |       |  
        var pat = [1,0,0,0,1,0,0,0,1,0,0,0,1,0,0,0].rotate(3);
      var imp = PulseDivider.kr(~tick.kr,[8,16,32,64],~counter.kr);
        var hit = Select.kr(PulseCount.kr(imp)%pat.size,pat);
  var env = EnvGen.ar(Env([0.001,1,0.001],[0.002,1.5],[3,-3],curve:'exp'),imp * hit);
        var sig = PlayBuf.ar(b.numChannels,b.bufnum,BufRateScale.kr(b.bufnum)*mod+(env*0.01),imp, (pos + BrownNoise.ar(1!8).range(spread * -1,spread)) * BufFrames.kr(b.bufnum),1);
        
  sig = sig * env;
        Splay.ar(sig.flat,0.5,0.75);
    };
    ~ssm.play;
);" ], [ 2469.1379213, 'kof', "b = Buffer.read(s,Platform.resourceDir ++ \"/sounds/beat.wav\");" ], [ 2466.4657051, 'joach', "(amp:0.8, sustain:1, octave:[7,3]).play" ], [ 2466.4188646, 'joach', "(amp:0.8, sustain:1, octave:[7,3]).play" ], [ 2466.3094916, 'joach', "(amp:0.8, sustain:1, octave:[7,3]).play" ], [ 2466.2157377, 'joach', "(amp:0.8, sustain:1, octave:[7,3]).play" ], [ 2466.1062201, 'joach', "(amp:0.8, sustain:1, octave:[7,3]).play" ], [ 2465.8561878, 'joach', "(amp:0.8, sustain:1, octave:[7,3]).play" ], [ 2465.6218043, 'joach', "(amp:0.8, sustain:1, octave:[7,3]).play" ], [ 2465.2937112, 'joach', "(amp:0.8, sustain:1, octave:[7,3]).play" ], [ 2464.9030858, 'joach', "(amp:0.8, sustain:1, octave:[7,3]).play" ], [ 2460.1370834, 'joach', "(amp:0.8, sustain:5, octave:[7,3]).play" ], [ 2460.1370834, 'kof', "(
~kick.quant=2;
~kick.fadeTime=0.2;
~kick={
  //         |       |       |       |       |  
  var pat = [1,0,0,0,1,1,0,0,1,0,0,0,1,1,0,0].rotate(1);
  var imp = PulseDivider.kr(~tick.kr,32,~counter.kr);
  var hit = Select.kr(PulseCount.kr(imp)%pat.size,pat);
  var env = EnvGen.ar(Env([0.001,1,0.001],[0.002,4.75],[3,-3],curve:'exp'),imp * hit);
  var sig = SinOsc.ar(50+(env**100*400));
  sig = sig * env;
  Splay.ar(sig,0.75,0.65);
};
~kick.play;
);" ], [ 2458.6535321, 'alex', "(octave: [2,1] ,dur: 10).play;" ], [ 2455.1520731, 'alex', "(octave: [2,1,4] ,dur: 10).play;" ], [ 2454.2610336, 'joach', "(amp:0.8, sustain:5, octave:[2,3]).play" ], [ 2454.2454081, 'kof', "(
  p.clock.tempo_(240/60);
  
  ~offset = (0..7)/8;
  
  ~tick.quant = 1;
  ~tick = {Mix(Impulse.kr( ~tempo / 2 , ~offset ))};
  
  ~counter = {PulseCount.kr(~tick.kr)};
);" ], [ 2446.9522959, 'alex', "(octave: [2,1,3] ,dur: 10).play;" ], [ 2445.9988645, 'kof', "(
~weirdo.quant=2;
~weirdo.fadeTime=0.2;
~weirdo={
  //         |       |       |       |       |  
  var pat = [1,0,0,0,1,0,0,0,1,0,0,0,1,0,0,0].rotate(3);
  var imp = PulseDivider.kr(~tick.kr,64*fib(4),~counter.kr);
  var hit = Select.kr(PulseCount.kr(imp)%pat.size,pat);
  var env = EnvGen.ar(Env([0.001,1,0.001],[1.002,1.5],[3,-3],curve:'exp'),imp * hit);
  var sig = SinOsc.ar(SinOsc.ar([1,2,3,4]*4).range(40,4000).round(50)*2/([1,2,4,8]*pi));
  sig = sig * env;
  Splay.ar(sig,0.75,0.15);
};
~weirdo.play;
);" ], [ 2443.0770415, 'kof', "(
  p.clock.tempo_(240/60);
  
  ~offset = (0..7)/8;
  
  ~tick.quant = 1;
  ~tick = {Mix(Impulse.kr( ~tempo / 2 , ~offset ))};
  
  ~counter = {PulseCount.kr(~tick.kr)};
);" ], [ 2440.4668808, 'kof', "(
  p=ProxySpace.push(s.boot);
  p.makeTempoClock;
);" ], [ 2424.2152366, 'joach', "(amp:0.8, sustain:5, octave:[2,3]).play" ], [ 2419.5069007, 'joach', "p.clock.tempo_(240/60);" ], [ 2419.1685822, 'alex', "().play;" ], [ 2418.7613534, 'joach', "p = ProxySpace.push(s).makeTempoClock;" ], [ 2395.8537698, 'joach', "~jDrum[2] = nil;" ], [ 2394.5596774, 'alex', "~g.clear;" ], [ 2378.6012569, 'joach', "~jDrum.stop(36);" ], [ 2360.5401424, 'alex', "~g.play(vol:0.06, fadeTime:2);" ], [ 2354.9884142, 'joach', "(
~jDrum[8] = \\set -> QuantEnv(\\freq, 48)
.phase(1, [60,26,60], [32, 16], [\\sin], 0, 3)
.phase(2, [20,(160,120..80),60], [6, 2], [\\sin], 0, 1)
.play([1,2]);
)" ], [ 2354.8631391, 'alex', "(~g[0]={
	var sig, env, fenv, penv, renv;
	
	env=EnvGen.kr(Env([0,1,0.5,0], [0.1,0.5,3.5],[\\welch,\\step]), \\trig.tr);
	fenv=EnvGen.kr(Env([\\freq.kr, \\freq.kr*3, \\freq.kr], [0.01,1]), \\trig.tr);
	penv=EnvGen.kr(Env([-1,1,-1], [0.1,0.5]), \\trig.tr);
	renv=EnvGen.kr(Env([1,0.001,0.1], [1,0.5]), \\trig.tr);
	
	sig=LFSaw.ar([\\freq.kr,\\freq.kr+2,\\freq.kr+4,\\freq.kr+6],add:
		BPF.ar(GrayNoise.ar(1),\\freq.kr,renv)
	).lag([0.001, 0.002, 0.003,0.004]);
	sig=Balance2.ar(sig*LFSaw.ar([0.125,0.05]), sig+Dust.ar(LFNoise0.kr(2).range(200,1500)),SinOsc.kr(1));
	sig*env;
};
)" ], [ 2337.5577021, 'alex', "~g[31]=\\filter->{arg in; LPF.ar(in, \\lpf.kr(2400))};" ], [ 2337.0606256, 'joach', "(
~jDrum[8] = \\set -> QuantEnv(\\freq, 48)
.phase(1, [60,26,60], [32, 16], [\\sin], 0, 3)
.phase(2, [20,(160,120..80),20], [6, 2], [\\sin], 0, 1)
.play([1,2]);
)" ], [ 2334.8246261, 'alex', "~g[31]=\\filter->{arg in; LPF.ar(in, \\lpf.kr(1400))};" ], [ 2332.2023133, 'alex', "~g[30]=\\filter-> {arg in; Limiter.ar(GVerb.ar(in,[40,20],10,add:in*0.2),0.7)};" ], [ 2330.6842508, 'joach', "(
~jDrum[8] = \\set -> QuantEnv(\\freq, 48)
.phase(1, [60,26,60], [32, 16], [\\sin], 0, 3)
.phase(2, [20,(160,120..80),20], [6, 2], [\\step], 0, 1)
.play([1,2]);
)" ], [ 2329.2466868, 'alex', "(~g[2]=\\set-> Pbind(\\args, [\\freq], \\dur, 8, \\octave, Pseq([[2,3],[1,3],[2,3]],inf), 
\\degree, Pseq([[4,2,7], [2,5,3],[7,2,3]],inf) );)" ], [ 2320.1695656, 'alex', "~g[1]=\\set-> Pbind(\\args, [\\trig], \\dur, 10, \\trig,1);" ], [ 2317.4224573, 'joach', "(
~jDrum[8] = \\set -> QuantEnv(\\freq, 48)
.phase(1, [60,26,60], [32, 16], [\\sin], 0, 3)
.phase(2, [120,(260,220..180),120], [6, 2], [\\step], 0, 1)
.play([1,2]);
)" ], [ 2306.1709046, 'alex', "~g[31]=\\filter->{arg in; LPF.ar(in, \\lpf.kr(1400))};" ], [ 2306.1547747, 'kof', "(
    ~ssm.quant=2;
    ~ssm.fadeTime=2.02;
    ~ssm={
        var mod = [-1,0.25,-0.25,1/8,1/16];
        var spread = 0.004;
        var pos = [0,0.5,0.75,0.25]/3;
        //         |       |       |       |       |  
        var pat = [1,0,0,0,1,0,0,0,1,0,0,0,1,0,0,0].rotate(3);
      var imp = PulseDivider.kr(~tick.kr,[8,16,32,64],~counter.kr);
        var hit = Select.kr(PulseCount.kr(imp)%pat.size,pat);
  var env = EnvGen.ar(Env([0.001,1,0.001],[0.002,1.5],[3,-3],curve:'exp'),imp * hit);
        var sig = PlayBuf.ar(b.numChannels,b.bufnum,BufRateScale.kr(b.bufnum)*mod+(env*0.01),imp, (pos + BrownNoise.ar(1!8).range(spread * -1,spread)) * BufFrames.kr(b.bufnum),1);
        
  sig = sig * env;
        Splay.ar(sig.flat,0.5,0.75);
    };
    ~ssm.play;
);" ], [ 2304.8872657, 'kof', "b = Buffer.read(s,Platform.resourceDir ++ \"/sounds/beat.wav\");" ], [ 2304.6372605, 'joach', "(
~jDrum[3] = \\set -> QuantEnv(\\noise, 4)
.phase(1, [0.1,0.5,0.1], [3.05, 0.95], [2,-2], 0, 4)
.phase(2, [0,1,0.1], [1.35, 2.65], [2,-2], 0, 1)
.play([1,2]);
)" ], [ 2300.5889429, 'alex', "(~g[2]=\\set-> Pbind(\\args, [\\freq], \\dur, 8, \\octave, Pseq([[2,3],[1,3],[2,3]],inf), 
\\degree, Pseq([[4,2,7], [2,5,3],[7,2,3]],inf) );)" ], [ 2299.1681007, 'alex', "(~g[2]=\\set-> Pbind(\\args, [\\freq], \\dur, 8, \\octave, Pseq([[2,3],[1,3],[2,3,]],inf), 
\\degree, Pseq([[4,2,7], [2,5,3],[7,2,3]],inf) );)" ], [ 2277.1002252, 'joach', "(
~jDrum[3] = \\set -> QuantEnv(\\noise, 4)
.phase(1, [0,0.3,0], [3.05, 0.95], [2,-2], 0, 1)
.phase(2, [0,1,0], [1.35, 2.65], [2,-2], 0, 1)
.play([1,2]);
)" ], [ 2276.6626626, 'kof', "(
~weirdo.quant=2;
~weirdo.fadeTime=0.2;
~weirdo={
  //         |       |       |       |       |  
  var pat = [1,0,0,0,1,0,0,0,1,0,0,0,1,0,0,0].rotate(3);
  var imp = PulseDivider.kr(~tick.kr,64*fib(4),~counter.kr);
  var hit = Select.kr(PulseCount.kr(imp)%pat.size,pat);
  var env = EnvGen.ar(Env([0.001,1,0.001],[1.002,1.5],[3,-3],curve:'exp'),imp * hit);
  var sig = SinOsc.ar(SinOsc.ar([1,2,3,4]*4).range(40,4000).round(50)*2/([1,2,4,8]*pi));
  sig = sig * env;
  Splay.ar(sig,0.75,0.15);
};
~weirdo.play;
);" ], [ 2272.3498432, 'joach', "(
~jDrum[3] = \\set -> QuantEnv(\\noise, 4)
.phase(1, [0,0.3,0], [3.05, 0.95], [2,-2], 0, 1)
.phase(2, [0,1,0], [1.35, 2.65], [2,-2], 0, 1)
.play([1]);
)" ], [ 2269.3965233, 'kof', "(
~weirdo.quant=2;
~weirdo.fadeTime=0.2;
~weirdo={
  //         |       |       |       |       |  
  var pat = [1,0,0,0,1,0,0,0,1,0,0,0,1,0,0,0].rotate(3);
  var imp = PulseDivider.kr(~tick.kr,4*fib(4),~counter.kr);
  var hit = Select.kr(PulseCount.kr(imp)%pat.size,pat);
  var env = EnvGen.ar(Env([0.001,1,0.001],[0.002,1.5],[3,-3],curve:'exp'),imp * hit);
  var sig = SinOsc.ar(SinOsc.ar([1,2,3,4]*4).range(40,4000).round(50)*2/([1,2,4,8]*pi));
  sig = sig * env;
  Splay.ar(sig,0.75,0.15);
};
~weirdo.play;
);" ], [ 2266.6619241, 'kof', "(
~weirdo.quant=2;
~weirdo.fadeTime=0.2;
~weirdo={
  //         |       |       |       |       |  
  var pat = [1,0,0,0,1,0,0,0,1,0,0,0,1,0,0,0].rotate(3);
  var imp = PulseDivider.kr(~tick.kr,4*fib(4),~counter.kr);
  var hit = Select.kr(PulseCount.kr(imp)%pat.size,pat);
  var env = EnvGen.ar(Env([0.001,1,0.001],[0.002,1.5],[3,-3],curve:'exp'),imp * hit);
  var sig = SinOsc.ar(SinOsc.ar([1,2,3,4]*4).range(40,4000).round(50)*2/([1,2,4,8]*pi));
  sig = sig * env;
  Splay.ar(sig,0.75,0.25);
};
~weirdo.play;
);" ], [ 2263.3490138, 'kof', "(
~weirdo.quant=2;
~weirdo.fadeTime=0.2;
~weirdo={
  //         |       |       |       |       |  
  var pat = [1,0,0,0,1,0,0,0,1,0,0,0,1,0,0,0].rotate(3);
  var imp = PulseDivider.kr(~tick.kr,4*fib(4),~counter.kr);
  var hit = Select.kr(PulseCount.kr(imp)%pat.size,pat);
  var env = EnvGen.ar(Env([0.001,1,0.001],[0.002,1.5],[3,-3],curve:'exp'),imp * hit);
  var sig = SinOsc.ar(SinOsc.ar([1,2,3,4]*4).range(40,4000).round(50)*2/([1,2,4,8]*pi));
  sig = sig * env;
  Splay.ar(sig,0.75,0.5);
};
~weirdo.play;
);" ], [ 2254.3638471, 'kof', "~kick.clear;" ], [ 2249.7878859, 'joach', "(
~jDrum[8] = \\set -> QuantEnv(\\freq, 48)
.phase(1, [60,86,60], [32, 16], [\\sin], 0, 3)
.phase(2, [120,(260,220..180),120], [6, 2], [\\step], 0, 1)
.play([1,2]);
)" ], [ 2241.3339905, 'kof', "(
~kick.quant=2;
~kick.fadeTime=0.2;
~kick={
  //         |       |       |       |       |  
  var pat = [1,0,0,0,1,1,0,0,1,0,0,0,1,1,0,0].rotate(1);
  var imp = PulseDivider.kr(~tick.kr,4,~counter.kr);
  var hit = Select.kr(PulseCount.kr(imp)%pat.size,pat);
  var env = EnvGen.ar(Env([0.001,1,0.001],[0.002,1.75],[3,-3],curve:'exp'),imp * hit);
  var sig = SinOsc.ar(50+(env**100*400));
  sig = sig * env;
  Splay.ar(sig,0.75,0.65);
};
~kick.play;
);" ], [ 2239.1151019, 'joach', "(
~jDrum[8] = \\set -> QuantEnv(\\freq, 48)
.phase(1, [60,86,60], [32, 16], [\\sin], 0, 1)
.phase(2, [120,(260,220..180),120], [6, 2], [\\step], 0, 1)
.play([1,2]);
)" ], [ 2235.5679882, 'kof', "(
~weirdo.quant=2;
~weirdo.fadeTime=0.2;
~weirdo={
  //         |       |       |       |       |  
  var pat = [1,0,0,0,1,0,0,0,1,0,0,0,1,0,0,0].rotate(3);
  var imp = PulseDivider.kr(~tick.kr,4*fib(4),~counter.kr);
  var hit = Select.kr(PulseCount.kr(imp)%pat.size,pat);
  var env = EnvGen.ar(Env([0.001,1,0.001],[0.002,1.5],[3,-3],curve:'exp'),imp * hit);
  var sig = SinOsc.ar(SinOsc.ar([1,2,3,4]*4).range(40,400).round(50)*2/([1,2,4,8]*pi));
  sig = sig * env;
  Splay.ar(sig,0.75,0.5);
};
~weirdo.play;
);" ], [ 2226.8795951, 'kof', "(
~weirdo.quant=2;
~weirdo.fadeTime=0.2;
~weirdo={
  //         |       |       |       |       |  
  var pat = [1,0,0,0,1,0,0,0,1,0,0,0,1,0,0,0].rotate(1);
  var imp = PulseDivider.kr(~tick.kr,4*fib(4),~counter.kr);
  var hit = Select.kr(PulseCount.kr(imp)%pat.size,pat);
  var env = EnvGen.ar(Env([0.001,1,0.001],[0.002,1.5],[3,-3],curve:'exp'),imp * hit);
  var sig = SinOsc.ar(SinOsc.ar([1,2,3,4]*4).range(40,400).round(50)*2/([1,2,4,8]*pi));
  sig = sig * env;
  Splay.ar(sig,0.75,0.5);
};
~weirdo.play;
);" ], [ 2222.9168671, 'alex', "~g[31]=\\filter->{arg in; LPF.ar(in, \\lpf.kr(400))};" ], [ 2215.3637449, 'kof', "(
~ff.quant=1;
~ff.fadeTime=1;
~ff={
  var high,mid,low;
  //var sig = ~crack + ~ssm + ~kick;
  var sig = ~weirdo;
  
  sig = GVerb.ar(LPF.ar(sig,5000)+HPF.ar(sig,500),40,[3,4,5,6],spread:[40,90])/8 + sig;
  low = CompanderD.ar(LPF.ar(sig,400),3/4,1/2.5,1/2);
  mid = CompanderD.ar(BPF.ar(sig,600,2),3/4,1/2,1/2);
  high = CompanderD.ar(HPF.ar(sig,900),3/4,1/1.5,1/2);
  sig = CompanderD.ar((high+mid+low).flat,3/4,1/1.1,1/1.1);
  Splay.ar(sig,0.75,0.15);
};
~ff.play;
);" ], [ 2213.3632476, 'joach', "(
~jDrum[1] = \\set -> QuantEnv(\\amp, 1)
.phase(1, [0.2,1,0.6,0.2], [0.05, 0.15, 0.25], [8,-2, -8], 0, 16)
.phase(2, [0.2,1,0.2], [1.35, 0.65], [2,-2], 0, 1)
.phase(3, [0.2,1,0.2], [8.35, 1.65], [8,-2], 0, 1)
.play([1,2,1,3]);
)" ], [ 2212.1034956, 'alex', "(~g[0]={
	var sig, env, fenv, penv, renv;
	
	env=EnvGen.kr(Env([0,1,0.5,0], [0.1,0.5,3.5],[\\welch,\\step]), \\trig.tr);
	fenv=EnvGen.kr(Env([\\freq.kr, \\freq.kr*3, \\freq.kr], [0.01,1]), \\trig.tr);
	penv=EnvGen.kr(Env([-1,1,-1], [0.1,0.5]), \\trig.tr);
	renv=EnvGen.kr(Env([1,0.001,0.1], [1,0.5]), \\trig.tr);
	
	sig=LFSaw.ar([\\freq.kr,\\freq.kr+2,\\freq.kr+4,\\freq.kr+6],add:
		BPF.ar(GrayNoise.ar(1),\\freq.kr,renv)
	).lag([0.001, 0.002, 0.003,0.004]);
	sig=Balance2.ar(sig*LFSaw.ar([0.25,0.5]), sig+Dust.ar(LFNoise0.kr(2).range(200,1500)),SinOsc.kr(1));
	sig*env;
};
)" ], [ 2211.7209509, 'joach', "(
~jDrum[2] = \\set -> QuantEnv(\\fplus, 1)
.phase(1, [0,470,0], [0.005, 0.35], [8,-8], 0, 16)
.phase(2, [0,[270,820],0], [0.035, 0.065], [8,-2], 0, 1)
.phase(3, [0,[470!3,120],0], [0.035, 0.065], [8,-2], 0, 1)
.play([1,2,1,3]);
)" ], [ 2209.8849811, 'alex', "~g.play(vol:0.06, fadeTime:2);" ], [ 2208.4862175, 'joach', "(
~jDrum[2] = \\set -> QuantEnv(\\fplus, 2)
.phase(1, [0,470,0], [0.005, 0.35], [8,-8], 0, 16)
.phase(2, [0,[270,820],0], [0.035, 0.065], [8,-2], 0, 1)
.phase(3, [0,[470!3,120],0], [0.035, 0.065], [8,-2], 0, 1)
.play([1,2,1,3]);
)" ], [ 2207.0464898, 'alex', "~g[1]=\\set-> Pbind(\\args, [\\trig], \\dur, 10, \\trig,1);" ], [ 2201.6863232, 'alex', "~g[1]=\\set-> Pbind(\\args, [\\trig], \\dur, 10, \\trig,1);" ], [ 2200.1596542, 'joach', "(
~jDrum[2] = \\set -> QuantEnv(\\fplus, 4)
.phase(1, [0,470,0], [0.005, 0.35], [8,-8], 0, 16)
.phase(2, [0,[270,820],0], [0.035, 0.065], [8,-2], 0, 1)
.phase(3, [0,[470!3,120],0], [0.035, 0.065], [8,-2], 0, 1)
.play([1,2,1,3]);
)" ], [ 2196.0812939, 'joach', "(
~jDrum[2] = \\set -> QuantEnv(\\fplus, 4)
.phase(1, [0,470,0], [0.005, 0.35], [8,-8], 0, 16)
.phase(2, [0,[270,820],0], [0.0035, 0.065], [8,-2], 0, 1)
.phase(3, [0,[470!3,120],0], [0.035, 0.065], [8,-2], 0, 1)
.play([1,2,1,3]);
)" ], [ 2190.9715715, 'kof', "(
~weirdo.quant=2;
~weirdo.fadeTime=0.2;
~weirdo={
  //         |       |       |       |       |  
  var pat = [1,0,0,0,1,0,0,0,1,0,0,0,1,0,0,0].rotate(1);
  var imp = PulseDivider.kr(~tick.kr,4*fib(4),~counter.kr);
  var hit = Select.kr(PulseCount.kr(imp)%pat.size,pat);
  var env = EnvGen.ar(Env([0.001,1,0.001],[0.002,1.5],[3,-3],curve:'exp'),imp * hit);
  var sig = SinOsc.ar(SinOsc.ar([1,2,3,4]*4).range(40,400).round(50)*2/([1,2,4,8]*pi));
  sig = sig * env;
  Splay.ar(sig,0.75,0.15);
};
~weirdo.play;
);" ], [ 2190.2683805, 'joach', "(
~jDrum[2] = \\set -> QuantEnv(\\fplus, 4)
.phase(1, [0,470,0], [0.005, 0.05], [8,-2], 0, 16)
.phase(2, [0,[270,820],0], [0.0035, 0.065], [8,-2], 0, 1)
.phase(3, [0,[470!3,120],0], [0.035, 0.065], [8,-2], 0, 1)
.play([1,2,1,3]);
)" ], [ 2185.3878585, 'kof', "(
~weirdo.quant=2;
~weirdo.fadeTime=0.2;
~weirdo={
  //         |       |       |       |       |  
  var pat = [1,0,0,0,1,0,0,0,1,0,0,0,1,0,0,0].rotate(1);
  var imp = PulseDivider.kr(~tick.kr,4*fib(4),~counter.kr);
  var hit = Select.kr(PulseCount.kr(imp)%pat.size,pat);
  var env = EnvGen.ar(Env([0.001,1,0.001],[0.002,1.5],[3,-3],curve:'exp'),imp * hit);
  var sig = SinOsc.ar(SinOsc.ar([1,2,3,4]*4).range(40,400).round(50)*2/([1,2,4,8]*pi));
  sig = sig * env;
  Splay.ar(sig,0.75,0.05);
};
~weirdo.play;
);" ], [ 2179.8911384, 'joach', "(
~jDrum[2] = \\set -> QuantEnv(\\fplus, 4)
.phase(1, [0,470,0], [0.005, 0.15], [8,-2], 0, 16)
.phase(2, [0,[270,820],0], [0.0035, 0.065], [8,-2], 0, 1)
.phase(3, [0,[470!3,120],0], [0.035, 0.065], [8,-2], 0, 1)
.play([1,2,1,3]);
)" ], [ 2175.0157249, 'kof', "(
~weirdo.quant=2;
~weirdo.fadeTime=0.2;
~weirdo={
  //         |       |       |       |       |  
  var pat = [1,0,0,0,1,0,0,0,1,0,0,0,1,0,0,0].rotate(1);
  var imp = PulseDivider.kr(~tick.kr,4*fib(4),~counter.kr);
  var hit = Select.kr(PulseCount.kr(imp)%pat.size,pat);
  var env = EnvGen.ar(Env([0.001,1,0.001],[0.002,1.5],[3,-3],curve:'exp'),imp * hit);
  var sig = SinOsc.ar(SinOsc.ar([1,2,3,4]*4).range(40,400).round(50)/[1,2,4,8]);
  sig = sig * env;
  Splay.ar(sig,0.75,0.05);
};
~weirdo.play;
);" ], [ 2169.9371169, 'joach', "(
~jDrum[2] = \\set -> QuantEnv(\\fplus, 4)
.phase(1, [0,470,0], [0.005, 0.015], [8,-2], 0, 16)
.phase(2, [0,[270,820],0], [0.0035, 0.065], [8,-2], 0, 1)
.phase(3, [0,[470!3,120],0], [0.035, 0.065], [8,-2], 0, 1)
.play([1,2,1,3]);
)" ], [ 2169.2027042, 'kof', "(
~weirdo.quant=2;
~weirdo.fadeTime=0.2;
~weirdo={
  //         |       |       |       |       |  
  var pat = [1,0,0,0,1,0,0,0,1,0,0,0,1,0,0,0].rotate(1);
  var imp = PulseDivider.kr(~tick.kr,4*fib(4),~counter.kr);
  var hit = Select.kr(PulseCount.kr(imp)%pat.size,pat);
  var env = EnvGen.ar(Env([0.001,1,0.001],[0.002,1.5],[3,-3],curve:'exp'),imp * hit);
  var sig = SinOsc.ar(SinOsc.ar([1,2,3,4]*4).range(40,400)/[1,2,4,8]);
  sig = sig * env;
  Splay.ar(sig,0.75,0.05);
};
~weirdo.play;
);" ], [ 2165.1868221, 'kof', "(
~weirdo.quant=2;
~weirdo.fadeTime=0.2;
~weirdo={
  //         |       |       |       |       |  
  var pat = [1,0,0,0,1,0,0,0,1,0,0,0,1,0,0,0].rotate(1);
  var imp = PulseDivider.kr(~tick.kr,4*fib(4),~counter.kr);
  var hit = Select.kr(PulseCount.kr(imp)%pat.size,pat);
  var env = EnvGen.ar(Env([0.001,1,0.001],[0.002,1.5],[3,-3],curve:'exp'),imp * hit);
  var sig = SinOsc.ar(SinOsc.ar([1,2,3,4]).range(40,400)/[1,2,4,8]);
  sig = sig * env;
  Splay.ar(sig,0.75,0.05);
};
~weirdo.play;
);" ], [ 2159.3270556, 'joach', "(
~jDrum[2] = \\set -> QuantEnv(\\fplus, 4)
.phase(1, [0,470,0], [0.005, 0.015], [8,-2], 0, 16)
.phase(2, [0,[170,220],0], [0.0035, 0.065], [8,-2], 0, 1)
.phase(3, [0,[470!3,120],0], [0.035, 0.065], [8,-2], 0, 1)
.play([1,2,1,3]);
)" ], [ 2155.7278854, 'kof', "(
~weirdo.quant=2;
~weirdo.fadeTime=0.2;
~weirdo={
  //         |       |       |       |       |  
  var pat = [1,0,0,0,1,0,0,0,1,0,0,0,1,0,0,0].rotate(1);
  var imp = PulseDivider.kr(~tick.kr,4*fib(4),~counter.kr);
  var hit = Select.kr(PulseCount.kr(imp)%pat.size,pat);
  var env = EnvGen.ar(Env([0.001,1,0.001],[0.002,1.5],[3,-3],curve:'exp'),imp * hit);
  var sig = SinOsc.ar(SinOsc.ar(4).range(40,400)/[1,2,4,8]);
  sig = sig * env;
  Splay.ar(sig,0.75,0.05);
};
~weirdo.play;
);" ], [ 2154.6925667, 'joach', "(
~jDrum[2] = \\set -> QuantEnv(\\fplus, 4)
.phase(1, [0,270,0], [0.005, 0.015], [8,-2], 0, 16)
.phase(2, [0,[170,220],0], [0.0035, 0.065], [8,-2], 0, 1)
.phase(3, [0,[470!3,120],0], [0.035, 0.065], [8,-2], 0, 1)
.play([1,2,1,3]);
)" ], [ 2147.135333, 'kof', "(
~weirdo.quant=2;
~weirdo.fadeTime=0.2;
~weirdo={
  //         |       |       |       |       |  
  var pat = [1,0,0,0,1,0,0,0,1,0,0,0,1,0,0,0].rotate(1);
  var imp = PulseDivider.kr(~tick.kr,4,~counter.kr);
  var hit = Select.kr(PulseCount.kr(imp)%pat.size,pat);
  var env = EnvGen.ar(Env([0.001,1,0.001],[0.002,1.5],[3,-3],curve:'exp'),imp * hit);
  var sig = SinOsc.ar(SinOsc.ar(4).range(40,400)/[1,2,4,8]);
  sig = sig * env;
  Splay.ar(sig,0.75,0.05);
};
~weirdo.play;
);" ], [ 2146.9166152, 'joach', "(
~jDrum[1] = \\set -> QuantEnv(\\amp, 4)
.phase(1, [0.2,1,0.6,0.2], [0.05, 0.15, 0.25], [8,-2, -8], 0, 16)
.phase(2, [0.2,1,0.2], [1.35, 0.65], [2,-2], 0, 1)
.phase(3, [0.2,1,0.2], [8.35, 1.65], [8,-2], 0, 1)
.play([1,2,1,3]);
)" ], [ 2140.7129821, 'kof', "(
~weirdo.quant=2;
~weirdo.fadeTime=0.2;
~weirdo={
  //         |       |       |       |       |  
  var pat = [1,0,0,0,1,0,0,0,1,0,0,0,1,0,0,0].rotate(1);
  var imp = PulseDivider.kr(~tick.kr,4,~counter.kr);
  var hit = Select.kr(PulseCount.kr(imp)%pat.size,pat);
  var env = EnvGen.ar(Env([0.001,1,0.001],[0.002,0.5],[3,-3],curve:'exp'),imp * hit);
  var sig = SinOsc.ar(SinOsc.ar(4).range(40,400)/[1,2,4,8]);
  sig = sig * env;
  Splay.ar(sig,0.75,0.05);
};
~weirdo.play;
);" ], [ 2132.9624294, 'kof', "(
~weirdo.quant=2;
~weirdo.fadeTime=0.2;
~weirdo={
  //         |       |       |       |       |  
  var pat = [1,0,0,0,1,0,0,0,1,0,0,0,1,0,0,0].rotate(1);
  var imp = PulseDivider.kr(~tick.kr,1,~counter.kr);
  var hit = Select.kr(PulseCount.kr(imp)%pat.size,pat);
  var env = EnvGen.ar(Env([0.001,1,0.001],[0.002,0.5],[3,-3],curve:'exp'),imp * hit);
  var sig = SinOsc.ar(SinOsc.ar(4).range(40,400)/[1,2,4,8]);
  sig = sig * env;
  Splay.ar(sig,0.75,0.05);
};
~weirdo.play;
);" ], [ 2118.2186535, 'alex', "~g[31]=\\filter->{arg in; LPF.ar(in, \\lpf.kr(1400))};" ], [ 2117.849321, 'joach', "(
~jDrum[1] = \\set -> QuantEnv(\\amp, 4)
.phase(1, [0.2,1,0.6,0.2], [0.05, 0.15, 0.25], [8,-2, -8], 0, 16)
.phase(2, [0.2,1,0.2], [1.35, 0.65], [2,-2], 0, 1)
.phase(3, [0.2,1,0.7], [0.35, 1.65], [8,-2], 0, 1)
.play([1,2,1,3]);
)" ], [ 2115.5991599, 'joach', "(
~jDrum[2] = \\set -> QuantEnv(\\fplus, 4)
.phase(1, [0,270,0], [0.005, 0.015], [8,-2], 0, 16)
.phase(2, [0,[170,220],0], [0.0035, 0.065], [8,-2], 0, 1)
.phase(3, [0,[470!3,4020],0], [0.035, 0.065], [8,-2], 0, 1)
.play([1,2,1,3]);
)" ], [ 2105.8537185, 'alex', "(~g[2]=\\set-> Pbind(\\args, [\\freq], \\dur, 8, \\octave, Pseq([[7,3,4],[5,6,4],[2,3,4]],inf), 
\\degree, Pseq([[4,2,7], [2,5,3],[7,2,3]],inf) );)" ], [ 2104.2050938, 'joach', "(
~jDrum[1] = \\set -> QuantEnv(\\amp, 2)
.phase(1, [0.2,1,0.6,0.2], [0.05, 0.15, 0.25], [8,-2, -8], 0, 16)
.phase(2, [0.2,1,0.2], [1.35, 0.65], [2,-2], 0, 1)
.phase(3, [0.2,1,0.7], [0.35, 1.65], [8,-2], 0, 1)
.play([1,2,1,3]);
)" ], [ 2102.8152418, 'joach', "~jDrum[5] = \\filter -> {|in| GVerb.ar(in, \\gverb_size.kr(40), \\gverb_time.kr(0.5), 0.9, mul:\\mulgverb.kr(1), add:(1-\\mulgverb.kr(1))) };" ], [ 2102.8017652, 'alex', "~g[30]=\\filter-> {arg in; Limiter.ar(GVerb.ar(in,[40,20],10,add:in*0.2),0.7)};" ], [ 2096.8290945, 'kof', "~crack.clear;" ], [ 2092.9694166, 'kof', "~kick.clear;" ], [ 2091.206031, 'alex', "~g[31]=\\filter->{arg in; LPF.ar(in, \\lpf.kr(400))};" ], [ 2089.3252865, 'joach', "(
~jDrum[1] = \\set -> QuantEnv(\\amp, 0.5)
.phase(1, [0.2,1,0.6,0.2], [0.05, 0.15, 0.25], [8,-2, -8], 0, 16)
.phase(2, [0.2,1,0.2], [1.35, 0.65], [2,-2], 0, 1)
.phase(3, [0.2,1,0.7], [0.35, 1.65], [8,-2], 0, 1)
.play([1,2,1,3]);
)" ], [ 2088.6065194, 'kof', "~ssm.clear;" ], [ 2076.1643965, 'joach', "(
~jDrum[6] = \\set -> QuantEnv(\\mulgverb, 1)
.phase(1, [0.5,1,0.5], [0.15, 0.85], [2,-2], 0, 16)
.phase(2, [0,(1,0.9..0.6),0], [0.35, 8.65], [8,\\sin], 0, 1)
.play([1,2]);
)" ], [ 2075.5535677, 'alex', "(~g[0]={
	var sig, env, fenv, penv, renv;
	
	env=EnvGen.kr(Env([0,1,0.5,0], [0.1,0.5,3.5],[\\welch,\\step]), \\trig.tr);
	fenv=EnvGen.kr(Env([\\freq.kr, \\freq.kr*3, \\freq.kr], [0.01,1]), \\trig.tr);
	penv=EnvGen.kr(Env([-1,1,-1], [0.1,0.5]), \\trig.tr);
	renv=EnvGen.kr(Env([1,0.001,0.1], [1,0.5]), \\trig.tr);
	
	sig=LFSaw.ar([\\freq.kr,\\freq.kr+2,\\freq.kr+4,\\freq.kr+6],add:
		BPF.ar(GrayNoise.ar(1),\\freq.kr,renv)
	).lag([0.001, 0.002, 0.003,0.004]);
	sig=Balance2.ar(sig*LFSaw.ar([0.25,0.5]), sig+Dust.ar(LFNoise0.kr(2).range(200,1500)),SinOsc.kr(1));
	sig*env;
};
)" ], [ 2074.506367, 'kof', "~ff.stop(7);" ], [ 2071.6622735, 'kof', "~ssm.stop(7);" ], [ 2069.7089634, 'kof', "~kick.stop(7);" ], [ 2064.2083427, 'joach', "(
~jDrum[6] = \\set -> QuantEnv(\\mulgverb, 1)
.phase(1, [0.5,1,0.5], [0.15, 0.85], [2,-2], 0, 16)
.phase(2, [0,(1,0.9..0.6),0], [0.35, 0.65], [8,\\sin], 0, 1)
.play([1,2]);
)" ], [ 2062.8802608, 'kof', "(
~kick.quant=2;
~kick.fadeTime=0.2;
~kick={
  //         |       |       |       |       |  
  var pat = [1,0,0,0,1,1,0,0,1,0,0,0,1,1,0,0].rotate(1);
  var imp = PulseDivider.kr(~tick.kr,4,~counter.kr);
  var hit = Select.kr(PulseCount.kr(imp)%pat.size,pat);
  var env = EnvGen.ar(Env([0.001,1,0.001],[0.002,1.75],[3,-3],curve:'exp'),imp * hit);
  var sig = SinOsc.ar(50+(env**100*400));
  sig = sig * env;
  Splay.ar(sig,0.75,0.65);
};
~kick.play;
);" ], [ 2060.4485252, 'alex', "~g[31]=\\filter->{arg in; LPF.ar(in, \\lpf.kr(200))};" ], [ 2050.6523467, 'kof', "(
~kick.quant=2;
~kick.fadeTime=0.2;
~kick={
  //         |       |       |       |       |  
  var pat = [1,0,0,0,1,1,0,0,1,0,0,0,1,1,0,0].rotate(1);
  var imp = PulseDivider.kr(~tick.kr,8,~counter.kr);
  var hit = Select.kr(PulseCount.kr(imp)%pat.size,pat);
  var env = EnvGen.ar(Env([0.001,1,0.001],[0.002,1.75],[3,-3],curve:'exp'),imp * hit);
  var sig = SinOsc.ar(50+(env**100*400));
  sig = sig * env;
  Splay.ar(sig,0.75,0.65);
};
~kick.play;
);" ], [ 2049.4190908, 'kof', "(
    ~ssm.quant=2;
    ~ssm.fadeTime=2.02;
    ~ssm={
        var mod = [-1,0.25,-0.25,1/8,1/16];
        var spread = 0.004;
        var pos = [0,0.5,0.75,0.25]/3;
        //         |       |       |       |       |  
        var pat = [1,0,0,0,1,0,0,0,1,0,0,0,1,0,0,0].rotate(3);
      var imp = PulseDivider.kr(~tick.kr,[8,16,32,64],~counter.kr);
        var hit = Select.kr(PulseCount.kr(imp)%pat.size,pat);
  var env = EnvGen.ar(Env([0.001,1,0.001],[0.002,1.5],[3,-3],curve:'exp'),imp * hit);
        var sig = PlayBuf.ar(b.numChannels,b.bufnum,BufRateScale.kr(b.bufnum)*mod+(env*0.01),imp, (pos + BrownNoise.ar(1!8).range(spread * -1,spread)) * BufFrames.kr(b.bufnum),1);
        
  sig = sig * env;
        Splay.ar(sig.flat,0.5,0.75);
    };
    ~ssm.play;
);" ], [ 2049.0742927, 'joach', "(
~jDrum[6] = \\set -> QuantEnv(\\mulgverb, 1)
.phase(1, [0.5,1,0.5], [0.15, 0.85], [2,-2], 0, 4)
.phase(2, [0,(1,0.9..0.6),0], [0.35, 0.65], [8,\\sin], 0, 1)
.play([1,2]);
)" ], [ 2048.9687751, 'alex', "~g[31]=\\filter->{arg in; LPF.ar(in, \\lpf.kr(500))};" ], [ 2038.088771, 'joach', "(
~jDrum[2] = \\set -> QuantEnv(\\fplus, 1)
.phase(1, [0,270,0], [0.005, 0.015], [8,-2], 0, 16)
.phase(2, [0,[170,220],0], [0.0035, 0.065], [8,-2], 0, 1)
.phase(3, [0,[470!3,4020],0], [0.035, 0.065], [8,-2], 0, 1)
.play([1,2,1,3]);
)" ], [ 2037.3715565, 'alex', "(~g[2]=\\set-> Pbind(\\args, [\\freq], \\dur, 8, \\octave, Pseq([[2,3,4],[5,2,4],[2,3,4]],inf), 
\\degree, Pseq([[4,2,7], [2,5,3],[7,2,3]],inf) );)" ], [ 2037.3025077, 'kof', "b = Buffer.read(s,Platform.resourceDir ++ \"/sounds/beat.wav\");" ], [ 2032.2595486, 'joach', "(
~jDrum[2] = \\set -> QuantEnv(\\fplus, 1)
.phase(1, [0,70,0], [0.005, 0.015], [8,-2], 0, 16)
.phase(2, [0,[170,220],0], [0.0035, 0.065], [8,-2], 0, 1)
.phase(3, [0,[470!3,4020],0], [0.035, 0.065], [8,-2], 0, 1)
.play([1,2,1,3]);
)" ], [ 2029.6062306, 'alex', "(~g[2]=\\set-> Pbind(\\args, [\\freq], \\dur, 12, \\octave, Pseq([[2,3,4],[5,2,4],[2,3,4]],inf), 
\\degree, Pseq([[4,2,7], [2,5,3],[7,2,3]],inf) );)" ], [ 2024.0442588, 'joach', "(
~jDrum[2] = \\set -> QuantEnv(\\fplus, 1)
.phase(1, [0,70,0], [0.005, 0.015], [8,-2], 0, 4)
.phase(2, [0,[170,220],0], [0.0035, 0.065], [8,-2], 0, 1)
.phase(3, [0,[470!3,4020],0], [0.035, 0.065], [8,-2], 0, 1)
.play([1,2,1,3]);
)" ], [ 2023.3796419, 'alex', "~g[30]=\\filter-> {arg in; Limiter.ar(GVerb.ar(in,[40,20],10,add:in*0.2),0.7)};" ], [ 2022.947931, 'kof', "(
    ~ssm.quant=2;
    ~ssm.fadeTime=2.02;
    ~ssm={
        var mod = [-1,0.25,-0.25,1/8,1/16];
        var spread = 0.004;
        var pos = [0,0.5,0.75,0.25]/3;
        //         |       |       |       |       |  
        var pat = [1,0,0,0,1,0,0,0,1,0,0,0,1,0,0,0].rotate(3);
      var imp = PulseDivider.kr(~tick.kr,[8,16,32,64],~counter.kr);
        var hit = Select.kr(PulseCount.kr(imp)%pat.size,pat);
  var env = EnvGen.ar(Env([0.001,1,0.001],[1.002,0.5],[3,-3],curve:'exp'),imp * hit);
        var sig = PlayBuf.ar(b.numChannels,b.bufnum,BufRateScale.kr(b.bufnum)*mod+(env*0.01),imp, (pos + BrownNoise.ar(1!8).range(spread * -1,spread)) * BufFrames.kr(b.bufnum),1);
        
  sig = sig * env;
        Splay.ar(sig.flat,0.5,0.75);
    };
    ~ssm.play;
);" ], [ 2021.7446651, 'kof', "b = Buffer.read(s,Platform.resourceDir ++ \"/sounds/beat4.wav\");" ], [ 2020.9790313, 'joach', "(
~jDrum[2] = \\set -> QuantEnv(\\fplus, 1)
.phase(1, [0,70,0], [0.05, 0.015], [8,-2], 0, 4)
.phase(2, [0,[170,220],0], [0.0035, 0.065], [8,-2], 0, 1)
.phase(3, [0,[470!3,4020],0], [0.035, 0.065], [8,-2], 0, 1)
.play([1,2,1,3]);
)" ], [ 2015.2902174, 'joach', "(
~jDrum[2] = \\set -> QuantEnv(\\fplus, 1)
.phase(1, [0,70,0], [0.05, 0.015], [8,-2], 0, 4)
.phase(2, [0,[170,220],0], [0.035, 0.065], [8,-2], 0, 1)
.phase(3, [0,[470!3,4020],0], [0.035, 0.065], [8,-2], 0, 1)
.play([1,2,1,3]);
)" ], [ 2007.1686484, 'kof', "(
~kick.quant=2;
~kick.fadeTime=0.2;
~kick={
  //         |       |       |       |       |  
  var pat = [1,0,0,0,1,1,0,0,1,0,0,0,1,1,0,0].rotate(1);
  var imp = PulseDivider.kr(~tick.kr,8,~counter.kr);
  var hit = Select.kr(PulseCount.kr(imp)%pat.size,pat);
  var env = EnvGen.ar(Env([0.001,1,0.001],[0.002,1.75],[3,-3],curve:'exp'),imp * hit);
  var sig = SinOsc.ar(50+(env**100*400));
  sig = sig * env;
  Splay.ar(sig,0.75,0.65);
};
~kick.play;
);" ], [ 2004.3246693, 'kof', "(
~kick.quant=2;
~kick.fadeTime=0.2;
~kick={
  //         |       |       |       |       |  
  var pat = [1,0,0,0,1,1,0,0,1,0,0,0,1,1,0,0].rotate(1);
  var imp = PulseDivider.kr(~tick.kr,4,~counter.kr);
  var hit = Select.kr(PulseCount.kr(imp)%pat.size,pat);
  var env = EnvGen.ar(Env([0.001,1,0.001],[0.002,1.75],[3,-3],curve:'exp'),imp * hit);
  var sig = SinOsc.ar(50+(env**100*400));
  sig = sig * env;
  Splay.ar(sig,0.75,0.65);
};
~kick.play;
);" ], [ 2003.475283, 'alex', "(~g[0]={
	var sig, env, fenv, penv, renv;
	
	env=EnvGen.kr(Env([0,1,0.5,0], [0.1,0.5,3.5],[\\welch,\\step]), \\trig.tr);
	fenv=EnvGen.kr(Env([\\freq.kr, \\freq.kr*3, \\freq.kr], [0.01,1]), \\trig.tr);
	penv=EnvGen.kr(Env([-1,1,-1], [0.1,0.5]), \\trig.tr);
	renv=EnvGen.kr(Env([1,0.001,0.1], [1,0.5]), \\trig.tr);
	
	sig=LFSaw.ar([\\freq.kr,\\freq.kr+2,\\freq.kr+4,\\freq.kr+6],add:
		BPF.ar(GrayNoise.ar(1),\\freq.kr,renv)
	).lag([0.001, 0.002, 0.003,0.004]);
	sig=Balance2.ar(sig*LFSaw.ar([2,3]), sig+Dust.ar(LFNoise0.kr(2).range(200,1500)),SinOsc.kr(1));
	sig*env;
};
)" ], [ 1997.4942675, 'joach', "(
~jDrum[1] = \\set -> QuantEnv(\\amp, 1)
.phase(1, [0.2,1,0.6,0.2], [0.05, 0.15, 0.25], [8,-2, -8], 0, 16)
.phase(2, [0.2,1,0.2], [1.35, 0.65], [2,-2], 0, 1)
.phase(3, [0.2,1,0.7], [0.35, 1.65], [8,-2], 0, 1)
.play([1,2,1,3]);
)" ], [ 1995.6495466, 'kof', "~ssm.clear;" ], [ 1991.0085613, 'kof', "~crack.clear;" ], [ 1984.7299788, 'joach', "(
~jDrum[2] = \\set -> QuantEnv(\\fplus, 4)
.phase(1, [0,70,0], [0.05, 0.015], [8,-2], 0, 4)
.phase(2, [0,[1700,2200],0], [0.035, 0.065], [8,-2], 0, 1)
.phase(3, [0,[470!3,4020],0], [0.035, 0.065], [8,-2], 0, 1)
.play([1,2,1,3]);
)" ], [ 1978.7542486, 'alex', "(~g[0]={
	var sig, env, fenv, penv, renv;
	
	env=EnvGen.kr(Env([0,1,0.5,0], [0.1,0.5,3.5],[\\welch,\\step]), \\trig.tr);
	fenv=EnvGen.kr(Env([\\freq.kr, \\freq.kr*3, \\freq.kr], [0.01,1]), \\trig.tr);
	penv=EnvGen.kr(Env([-1,1,-1], [0.1,0.5]), \\trig.tr);
	renv=EnvGen.kr(Env([1,0.001,0.1], [1,0.5]), \\trig.tr);
	
	sig=LFSaw.ar([\\freq.kr,\\freq.kr+2,\\freq.kr+4,\\freq.kr+6],add:
		BPF.ar(GrayNoise.ar(1),\\freq.kr,renv)
	).lag([0.001, 0.002, 0.003,0.004]);
	sig=Balance2.ar(sig*LFSaw.ar([2,3]), sig+Dust.ar(LFNoise0.kr(2).range(200,1500)),SinOsc.kr(0.25));
	sig*env;
};
)" ], [ 1978.0879531, 'joach', "(
~jDrum[2] = \\set -> QuantEnv(\\fplus, 0.5)
.phase(1, [0,70,0], [0.05, 0.015], [8,-2], 0, 4)
.phase(2, [0,[1700,2200],0], [0.035, 0.065], [8,-2], 0, 1)
.phase(3, [0,[470!3,4020],0], [0.035, 0.065], [8,-2], 0, 1)
.play([1,2,1,3]);
)" ], [ 1973.0248871, 'joach', "(
~jDrum[2] = \\set -> QuantEnv(\\fplus, 0.5)
.phase(1, [0,170,0], [0.05, 0.015], [8,-2], 0, 4)
.phase(2, [0,[1700,2200],0], [0.035, 0.065], [8,-2], 0, 1)
.phase(3, [0,[470!3,4020],0], [0.035, 0.065], [8,-2], 0, 1)
.play([1,2,1,3]);
)" ], [ 1963.8456335, 'joach', "~jDrum.play(vol: 0.8, fadeTime: 18);" ], [ 1962.2225028, 'joach', "(
~jDrum[1] = \\set -> QuantEnv(\\amp, 8)
.phase(1, [0.2,1,0.6,0.2], [0.05, 0.15, 0.25], [8,-2, -8], 0, 16)
.phase(2, [0.2,1,0.2], [1.35, 0.65], [2,-2], 0, 1)
.phase(3, [0.2,1,0.7], [0.35, 1.65], [8,-2], 0, 1)
.play([1,2,1,3]);
)" ], [ 1960.2438485, 'alex', "(~g[2]=\\set-> Pbind(\\args, [\\freq], \\dur, 12, \\octave, Pseq([[2,3,4],[5,2,4],[2,3,4]],inf), 
\\degree, Pseq([[4,2,7], [2,5,3],[7,2,3]],inf) );)" ], [ 1943.7081498, 'kof', "(
~crack.quant=2;
~crack.fadeTime=0.2;
~crack={
  //         |       |       |       |       |  
  var pat = [1,0,0,0,1,0,0,0,1,0,0,0,1,1,1,1].rotate(3);
  var imp = PulseDivider.kr(~tick.kr,fib(8)+4,~counter.kr);
  var hit = Select.kr(PulseCount.kr(imp)%pat.size,pat);
  var env = EnvGen.ar(Env([0.001,1,0.001],[0.002,0.15+[0.1,0.2,0.3,0.4]],[3,-3],curve:'exp'),imp * hit);
  var sig = Crackle.ar([0.2,0.3,0.4,0.5]+(env**[10,4,40,2]));
  sig = sig * env;
  Splay.ar(sig,0.75,0.35);
};
~crack.play;
);" ], [ 1933.1447705, 'kof', "(
~kick.quant=2;
~kick.fadeTime=0.2;
~kick={
  //         |       |       |       |       |  
  var pat = [1,0,0,0,1,1,0,0,1,0,0,0,1,1,0,0].rotate(1);
  var imp = PulseDivider.kr(~tick.kr,2,~counter.kr);
  var hit = Select.kr(PulseCount.kr(imp)%pat.size,pat);
  var env = EnvGen.ar(Env([0.001,1,0.001],[0.002,1.75],[3,-3],curve:'exp'),imp * hit);
  var sig = SinOsc.ar(50+(env**100*400));
  sig = sig * env;
  Splay.ar(sig,0.75,0.65);
};
~kick.play;
);" ], [ 1917.2024103, 'kof', "(
    ~ssm.quant=2;
    ~ssm.fadeTime=2.02;
    ~ssm={
        var mod = [-1,0.25,-0.25,1/8,1/16];
        var spread = 0.004;
        var pos = [0,0.5,0.75,0.25]/3;
        //         |       |       |       |       |  
        var pat = [1,0,0,0,1,0,0,0,1,0,0,0,1,0,0,0].rotate(3);
      var imp = PulseDivider.kr(~tick.kr,[8,16,32,64],~counter.kr);
        var hit = Select.kr(PulseCount.kr(imp)%pat.size,pat);
  var env = EnvGen.ar(Env([0.001,1,0.001],[1.002,0.5],[3,-3],curve:'exp'),imp * hit);
        var sig = PlayBuf.ar(b.numChannels,b.bufnum,BufRateScale.kr(b.bufnum)*mod+(env*0.01),imp, (pos + BrownNoise.ar(1!8).range(spread * -1,spread)) * BufFrames.kr(b.bufnum),1);
        
  sig = sig * env;
        Splay.ar(sig.flat,0.5,0.75);
    };
    ~ssm.play;
);" ], [ 1914.2501452, 'kof', "b = Buffer.read(s,Platform.resourceDir ++ \"/sounds/beat.wav\");" ], [ 1909.8168584, 'alex', "(~g[0]={
	var sig, env, fenv, penv, renv;
	
	env=EnvGen.kr(Env([0,1,0.5,0], [0.1,0.5,3.5],[\\welch,\\step]), \\trig.tr);
	fenv=EnvGen.kr(Env([\\freq.kr, \\freq.kr*3, \\freq.kr], [0.01,1]), \\trig.tr);
	penv=EnvGen.kr(Env([-1,1,-1], [0.1,0.5]), \\trig.tr);
	renv=EnvGen.kr(Env([1,0.001,0.1], [1,0.5]), \\trig.tr);
	
	sig=LFSaw.ar([\\freq.kr,\\freq.kr+2,\\freq.kr+4,\\freq.kr+6],add:
		BPF.ar(GrayNoise.ar(1),\\freq.kr,renv)
	).lag([0.001, 0.002, 0.003]);
	sig=Balance2.ar(sig*LFSaw.ar([2,3]), sig+Dust.ar(LFNoise0.kr(2).range(200,1500)),SinOsc.kr(0.25));
	sig*env;
};
)" ], [ 1902.0138541, 'kof', "~crack.clear;" ], [ 1896.3583206, 'alex', "~g[31]=\\filter->{arg in; LPF.ar(in, \\lpf.kr(2500))};" ], [ 1892.9698449, 'alex', "~g[31]=\\filter->{arg in; LPF.ar(in, \\lpf.kr(1500))};" ], [ 1889.5611885, 'alex', "~g[1]=\\set-> Pbind(\\args, [\\trig], \\dur, 4, \\trig,1);" ], [ 1889.0755803, 'kof', "(
    ~ssm.quant=2;
    ~ssm.fadeTime=2.02;
    ~ssm={
        var mod = [-1,0.25,-0.25,1/8,1/16];
        var spread = 0.004;
        var pos = [0,0.5,0.75,0.25]/3;
        //         |       |       |       |       |  
        var pat = [1,0,0,0,1,0,0,0,1,0,0,0,1,0,0,0].rotate(3);
      var imp = PulseDivider.kr(~tick.kr,[8,16,32,64],~counter.kr);
        var hit = Select.kr(PulseCount.kr(imp)%pat.size,pat);
  var env = EnvGen.ar(Env([0.001,1,0.001],[1.002,0.5],[3,-3],curve:'exp'),imp * hit);
        var sig = PlayBuf.ar(b.numChannels,b.bufnum,BufRateScale.kr(b.bufnum)*mod+(env*0.01),imp, (pos + BrownNoise.ar(1!8).range(spread * -1,spread)) * BufFrames.kr(b.bufnum),1);
        
  sig = sig * env;
        Splay.ar(sig.flat,0.5,0.75);
    };
    ~ssm.play;
);" ], [ 1879.1604506, 'alex', "(~g[2]=\\set-> Pbind(\\args, [\\freq], \\dur, 12, \\octave, Pseq([[2,3,4],[5,2,4],[2,3,4]],inf), 
\\degree, Pseq([[4,2,3], [5,7,2]],inf) );)" ], [ 1863.8400893, 'alex', "~g[31]=\\filter->{arg in; LPF.ar(in, \\lpf.kr(1500))};" ], [ 1863.0809291, 'kof', "(
~kick.quant=2;
~kick.fadeTime=0.2;
~kick={
  //         |       |       |       |       |  
  var pat = [1,0,0,0,1,1,0,0,1,0,0,0,1,0,0,0].rotate(1);
  var imp = PulseDivider.kr(~tick.kr,4,~counter.kr);
  var hit = Select.kr(PulseCount.kr(imp)%pat.size,pat);
  var env = EnvGen.ar(Env([0.001,1,0.001],[0.002,3.75],[3,-3],curve:'exp'),imp * hit);
  var sig = SinOsc.ar(50+(env**100*400));
  sig = sig * env;
  Splay.ar(sig,0.75,0.65);
};
~kick.play;
);" ], [ 1858.2311845, 'kof', "(
    ~ssm.quant=2;
    ~ssm.fadeTime=2.02;
    ~ssm={
        var mod = [-1,0.25,-0.25,1/8,1/16];
        var spread = 0.004;
        var pos = [0,0.5,0.75,0.25]/3;
        //         |       |       |       |       |  
        var pat = [1,0,0,0,1,0,0,0,1,0,0,0,1,0,0,0].rotate(3);
      var imp = PulseDivider.kr(~tick.kr,[8,16,32,64]/4,~counter.kr);
        var hit = Select.kr(PulseCount.kr(imp)%pat.size,pat);
  var env = EnvGen.ar(Env([0.001,1,0.001],[0.002,0.5],[3,-3],curve:'exp'),imp * hit);
        var sig = PlayBuf.ar(b.numChannels,b.bufnum,BufRateScale.kr(b.bufnum)*mod+(env*0.01),imp, (pos + BrownNoise.ar(1!8).range(spread * -1,spread)) * BufFrames.kr(b.bufnum),1);
        
  sig = sig * env;
        Splay.ar(sig.flat,0.5,0.75);
    };
    ~ssm.play;
);" ], [ 1852.5740526, 'alex', "~g[31]=\\filter->{arg in; LPF.ar(in, \\lpf.kr(500))};" ], [ 1851.9180222, 'kof', "(
    ~ssm.quant=2;
    ~ssm.fadeTime=2.02;
    ~ssm={
        var mod = [-1,0.25,-0.25,1/8,1/16];
        var spread = 0.004;
        var pos = [0,0.5,0.75,0.25]/3;
        //         |       |       |       |       |  
        var pat = [1,0,0,0,1,0,0,0,1,0,0,0,1,0,0,0].rotate(3);
      var imp = PulseDivider.kr(~tick.kr,[8,16,32,64]/4,~counter.kr);
        var hit = Select.kr(PulseCount.kr(imp)%pat.size,pat);
  var env = EnvGen.ar(Env([0.001,1,0.001],[0.002,0.5],[3,-3],curve:'exp'),imp * hit);
        var sig = PlayBuf.ar(b.numChannels,b.bufnum,BufRateScale.kr(b.bufnum)*mod+(env*0.01),imp, (pos + BrownNoise.ar(1!8).range(spread * -1,spread)) * BufFrames.kr(b.bufnum),1);
        
  sig = sig * env;
        Splay.ar(sig.flat,0.5,0.5);
    };
    ~ssm.play;
);" ], [ 1850.8711896, 'joach', "~jDrum.stop(36);" ], [ 1846.7458576, 'kof', "(
    ~ssm.quant=2;
    ~ssm.fadeTime=2.02;
    ~ssm={
        var mod = [-1,0.25,-0.25,1/8,1/16];
        var spread = 0.004;
        var pos = [0,0.5,0.75,0.25]/2;
        //         |       |       |       |       |  
        var pat = [1,0,0,0,1,0,0,0,1,0,0,0,1,0,0,0].rotate(3);
      var imp = PulseDivider.kr(~tick.kr,[8,16,32,64]/4,~counter.kr);
        var hit = Select.kr(PulseCount.kr(imp)%pat.size,pat);
  var env = EnvGen.ar(Env([0.001,1,0.001],[0.002,0.5],[3,-3],curve:'exp'),imp * hit);
        var sig = PlayBuf.ar(b.numChannels,b.bufnum,BufRateScale.kr(b.bufnum)*mod+(env*0.01),imp, (pos + BrownNoise.ar(1!8).range(spread * -1,spread)) * BufFrames.kr(b.bufnum),1);
        
  sig = sig * env;
        Splay.ar(sig.flat,0.5,0.5);
    };
    ~ssm.play;
);" ], [ 1839.4638997, 'kof', "~kick.clear;" ], [ 1838.6182816, 'joach', "(
~jDrum[1] = \\set -> QuantEnv(\\amp, 0.5)
.phase(1, [0.2,1,0.6,0.2], [0.05, 0.15, 0.25], [8,-2, -8], 0, 16)
.phase(2, [0.2,1,0.2], [1.35, 0.65], [2,-2], 0, 1)
.phase(3, [0.2,1,0.7], [0.35, 1.65], [8,-2], 0, 1)
.play([1,2,1,3]);
)" ], [ 1838.4669993, 'alex', "~g[31]=\\filter->{arg in; LPF.ar(in, \\lpf.kr(1200))};" ], [ 1837.4013781, 'kof', "(
    ~ssm.quant=2;
    ~ssm.fadeTime=2.02;
    ~ssm={
        var mod = [-1,0.25,-0.25,1/8,1/16];
        var spread = 0.004;
        var pos = [0,0.5,0.75,0.25];
        //         |       |       |       |       |  
        var pat = [1,0,0,0,1,0,0,0,1,0,0,0,1,0,0,0].rotate(3);
      var imp = PulseDivider.kr(~tick.kr,[8,16,32,64]/4,~counter.kr);
        var hit = Select.kr(PulseCount.kr(imp)%pat.size,pat);
  var env = EnvGen.ar(Env([0.001,1,0.001],[0.002,0.5],[3,-3],curve:'exp'),imp * hit);
        var sig = PlayBuf.ar(b.numChannels,b.bufnum,BufRateScale.kr(b.bufnum)*mod+(env*0.01),imp, (pos + BrownNoise.ar(1!8).range(spread * -1,spread)) * BufFrames.kr(b.bufnum),1);
        
  sig = sig * env;
        Splay.ar(sig.flat,0.5,0.5);
    };
    ~ssm.play;
);" ], [ 1835.3636483, 'joach', "(
~jDrum[1] = \\set -> QuantEnv(\\amp, 0.5)
.phase(1, [0.2,1,0.6,0.2], [0.05, 0.15, 0.35], [8,-2, -8], 0, 16)
.phase(2, [0.2,1,0.2], [1.35, 0.65], [2,-2], 0, 1)
.phase(3, [0.2,1,0.7], [0.35, 1.65], [8,-2], 0, 1)
.play([1,2,1,3]);
)" ], [ 1832.9416301, 'kof', "b = Buffer.read(s,Platform.resourceDir ++ \"/sounds/beat3.wav\");" ], [ 1827.5644295, 'kof', "(
    ~ssm.quant=2;
    ~ssm.fadeTime=2.02;
    ~ssm={
        var mod = [-1,0.25,-0.25,1/8,1/16];
        var spread = 0.004;
        var pos = [0,0.5,0.75,0.25];
        //         |       |       |       |       |  
        var pat = [1,0,0,0,1,0,0,0,1,0,0,0,1,0,0,0].rotate(3);
      var imp = PulseDivider.kr(~tick.kr,[8,16,32,64]/4,~counter.kr);
        var hit = Select.kr(PulseCount.kr(imp)%pat.size,pat);
  var env = EnvGen.ar(Env([0.001,1,0.001],[0.002,0.5],[3,-3],curve:'exp'),imp * hit);
        var sig = PlayBuf.ar(b.numChannels,b.bufnum,BufRateScale.kr(b.bufnum)*mod+(env*0.01),imp, (pos + BrownNoise.ar(1!8).range(spread * -1,spread)) * BufFrames.kr(b.bufnum),1);
        
  sig = sig * env;
        Splay.ar(sig.flat,0.5,0.5);
    };
    ~ssm.play;
);" ], [ 1824.3414144, 'kof', "(
    ~ssm.quant=2;
    ~ssm.fadeTime=2.02;
    ~ssm={
        var mod = [-1,0.25,-0.25,1/8,1/16];
        var spread = 0.04;
        var pos = [0,0.5,0.75,0.25];
        //         |       |       |       |       |  
        var pat = [1,0,0,0,1,0,0,0,1,0,0,0,1,0,0,0].rotate(3);
      var imp = PulseDivider.kr(~tick.kr,[8,16,32,64]/4,~counter.kr);
        var hit = Select.kr(PulseCount.kr(imp)%pat.size,pat);
  var env = EnvGen.ar(Env([0.001,1,0.001],[0.002,0.5],[3,-3],curve:'exp'),imp * hit);
        var sig = PlayBuf.ar(b.numChannels,b.bufnum,BufRateScale.kr(b.bufnum)*mod+(env*0.01),imp, (pos + BrownNoise.ar(1!8).range(spread * -1,spread)) * BufFrames.kr(b.bufnum),1);
        
  sig = sig * env;
        Splay.ar(sig.flat,0.5,0.5);
    };
    ~ssm.play;
);" ], [ 1820.3621816, 'kof', "(
    ~ssm.quant=2;
    ~ssm.fadeTime=2.02;
    ~ssm={
        var mod = [-1,0.25,-0.25,1/8,1/16]*1.25;
        var spread = 0.04;
        var pos = [0,0.5,0.75,0.25];
        //         |       |       |       |       |  
        var pat = [1,0,0,0,1,0,0,0,1,0,0,0,1,0,0,0].rotate(3);
      var imp = PulseDivider.kr(~tick.kr,[8,16,32,64]/4,~counter.kr);
        var hit = Select.kr(PulseCount.kr(imp)%pat.size,pat);
  var env = EnvGen.ar(Env([0.001,1,0.001],[0.002,0.5],[3,-3],curve:'exp'),imp * hit);
        var sig = PlayBuf.ar(b.numChannels,b.bufnum,BufRateScale.kr(b.bufnum)*mod+(env*0.01),imp, (pos + BrownNoise.ar(1!8).range(spread * -1,spread)) * BufFrames.kr(b.bufnum),1);
        
  sig = sig * env;
        Splay.ar(sig.flat,0.5,0.5);
    };
    ~ssm.play;
);" ], [ 1815.4059892, 'joach', "(
~jDrum[1] = \\set -> QuantEnv(\\amp, 1)
.phase(1, [0.2,1,0.6,0.2], [0.05, 0.25, 0.65], [8,-2, -8], 0, 16)
.phase(2, [0.2,1,0.2], [1.35, 0.65], [2,-2], 0, 1)
.phase(3, [0.2,1,0.7], [0.35, 1.65], [8,-2], 0, 1)
.play([1,2,1,3]);
)" ], [ 1815.2809722, 'kof', "(
    ~ssm.quant=2;
    ~ssm.fadeTime=2.02;
    ~ssm={
        var mod = [-1,0.25,-0.25,1/8,1/16]*1.5;
        var spread = 0.04;
        var pos = [0,0.5,0.75,0.25];
        //         |       |       |       |       |  
        var pat = [1,0,0,0,1,0,0,0,1,0,0,0,1,0,0,0].rotate(3);
      var imp = PulseDivider.kr(~tick.kr,[8,16,32,64]/4,~counter.kr);
        var hit = Select.kr(PulseCount.kr(imp)%pat.size,pat);
  var env = EnvGen.ar(Env([0.001,1,0.001],[0.002,0.5],[3,-3],curve:'exp'),imp * hit);
        var sig = PlayBuf.ar(b.numChannels,b.bufnum,BufRateScale.kr(b.bufnum)*mod+(env*0.01),imp, (pos + BrownNoise.ar(1!8).range(spread * -1,spread)) * BufFrames.kr(b.bufnum),1);
        
  sig = sig * env;
        Splay.ar(sig.flat,0.5,0.5);
    };
    ~ssm.play;
);" ], [ 1809.7485238, 'kof', "(
~crack.quant=2;
~crack.fadeTime=0.2;
~crack={
  //         |       |       |       |       |  
  var pat = [1,0,0,0,1,0,0,0,1,0,0,0,1,1,1,1].rotate(3);
  var imp = PulseDivider.kr(~tick.kr,fib(8)+4,~counter.kr);
  var hit = Select.kr(PulseCount.kr(imp)%pat.size,pat);
  var env = EnvGen.ar(Env([0.001,1,0.001],[0.002,0.15+[0.1,0.2,0.3,0.4]],[3,-3],curve:'exp'),imp * hit);
  var sig = Crackle.ar([0.2,0.3,0.4,0.5]+(env**[10,4,40,2]));
  sig = sig * env;
  Splay.ar(sig,0.75,0.35);
};
~crack.play;
);" ], [ 1807.8419759, 'kof', "(
~kick.quant=2;
~kick.fadeTime=0.2;
~kick={
  //         |       |       |       |       |  
  var pat = [1,0,0,0,1,1,0,0,1,0,0,0,1,0,0,0].rotate(1);
  var imp = PulseDivider.kr(~tick.kr,4,~counter.kr);
  var hit = Select.kr(PulseCount.kr(imp)%pat.size,pat);
  var env = EnvGen.ar(Env([0.001,1,0.001],[0.002,3.75],[3,-3],curve:'exp'),imp * hit);
  var sig = SinOsc.ar(50+(env**100*400));
  sig = sig * env;
  Splay.ar(sig,0.75,0.65);
};
~kick.play;
);" ], [ 1806.3732369, 'kof', "(
    ~ssm.quant=2;
    ~ssm.fadeTime=2.02;
    ~ssm={
        var mod = [-1,0.25,-0.25,1/8,1/16];
        var spread = 0.04;
        var pos = [0,0.5,0.75,0.25];
        //         |       |       |       |       |  
        var pat = [1,0,0,0,1,0,0,0,1,0,0,0,1,0,0,0].rotate(3);
      var imp = PulseDivider.kr(~tick.kr,[8,16,32,64]/4,~counter.kr);
        var hit = Select.kr(PulseCount.kr(imp)%pat.size,pat);
  var env = EnvGen.ar(Env([0.001,1,0.001],[0.002,0.5],[3,-3],curve:'exp'),imp * hit);
        var sig = PlayBuf.ar(b.numChannels,b.bufnum,BufRateScale.kr(b.bufnum)*mod+(env*0.01),imp, (pos + BrownNoise.ar(1!8).range(spread * -1,spread)) * BufFrames.kr(b.bufnum),1);
        
  sig = sig * env;
        Splay.ar(sig.flat,0.5,0.5);
    };
    ~ssm.play;
);" ], [ 1805.9513978, 'joach', "(
~jDrum[1] = \\set -> QuantEnv(\\amp, 8)
.phase(1, [0.2,1,0.6,0.2], [0.05, 0.25, 0.65], [8,-2, -8], 0, 16)
.phase(2, [0.2,1,0.2], [1.35, 0.65], [2,-2], 0, 1)
.phase(3, [0.2,1,0.7], [0.35, 1.65], [8,-2], 0, 1)
.play([1,2,1,3]);
)" ], [ 1804.0606023, 'kof', "~ssm.clear;" ], [ 1802.0659026, 'joach', "(
~jDrum[1] = \\set -> QuantEnv(\\amp, 2)
.phase(1, [0.2,1,0.6,0.2], [0.05, 0.25, 0.65], [8,-2, -8], 0, 16)
.phase(2, [0.2,1,0.2], [1.35, 0.65], [2,-2], 0, 1)
.phase(3, [0.2,1,0.7], [0.35, 1.65], [8,-2], 0, 1)
.play([1,2,1,3]);
)" ], [ 1796.960031, 'kof', "(
~crack.quant=2;
~crack.fadeTime=0.2;
~crack={
  //         |       |       |       |       |  
  var pat = [1,0,0,0,1,0,0,0,1,0,0,0,1,1,1,1].rotate(3);
  var imp = PulseDivider.kr(~tick.kr,fib(8)+4,~counter.kr);
  var hit = Select.kr(PulseCount.kr(imp)%pat.size,pat);
  var env = EnvGen.ar(Env([0.001,1,0.001],[0.002,0.15+[0.1,0.2,0.3,0.4]],[3,-3],curve:'exp'),imp * hit);
  var sig = Crackle.ar([0.2,0.3,0.4,0.5]+(env**[10,4,40,2]));
  sig = sig * env;
  Splay.ar(sig,0.75,0.35);
};
~crack.play;
);" ], [ 1789.8657671, 'kof', "(
~kick.quant=2;
~kick.fadeTime=0.2;
~kick={
  //         |       |       |       |       |  
  var pat = [1,0,0,0,1,1,0,0,1,0,0,0,1,0,0,0].rotate(1);
  var imp = PulseDivider.kr(~tick.kr,4,~counter.kr);
  var hit = Select.kr(PulseCount.kr(imp)%pat.size,pat);
  var env = EnvGen.ar(Env([0.001,1,0.001],[0.002,3.75],[3,-3],curve:'exp'),imp * hit);
  var sig = SinOsc.ar(50+(env**100*400));
  sig = sig * env;
  Splay.ar(sig,0.75,0.65);
};
~kick.play;
);" ], [ 1786.2716957, 'kof', "~kick.clear;" ], [ 1784.7090479, 'joach', "(
~jDrum[2] = \\set -> QuantEnv(\\fplus, 2)
.phase(1, [0,170,0], [0.05, 0.015], [8,-2], 0, 4)
.phase(2, [0,[1700,2200],0], [0.035, 0.065], [8,-2], 0, 1)
.phase(3, [0,[470!3,4020],0], [0.035, 0.065], [8,-2], 0, 1)
.play([1,2,1,3]);
)" ], [ 1784.0527963, 'kof', "(
~kick.quant=2;
~kick.fadeTime=0.2;
~kick={
  //         |       |       |       |       |  
  var pat = [1,0,0,0,1,1,0,0,1,0,0,0,1,0,0,0].rotate(1);
  var imp = PulseDivider.kr(~tick.kr,4,~counter.kr);
  var hit = Select.kr(PulseCount.kr(imp)%pat.size,pat);
  var env = EnvGen.ar(Env([0.001,1,0.001],[0.002,3.75],[3,-3],curve:'exp'),imp * hit);
  var sig = SinOsc.ar(50+(env**100*400));
  sig = sig * env;
  Splay.ar(sig,0.75,0.65);
};
~kick.play;
);" ], [ 1783.0526083, 'joach', "(
~jDrum[7] = \\set -> QuantEnv(\\lpf_freq, 32)
.phase(1, [800,4100,80], [32.05, 0.95], [2,-2], 0, 1)
.phase(2, [800,8200,1200,800], [10.35, 2, 12.65], \\sin, 0, 1)
.play([1,2]);
)" ], [ 1774.783564, 'kof', "(
    ~ssm.quant=2;
    ~ssm.fadeTime=2.02;
    ~ssm={
        var mod = [-1,0.25,-0.25,1/8,1/16];
        var spread = 0.04;
        var pos = [0,0.5,0.75,0.25];
        //         |       |       |       |       |  
        var pat = [1,0,0,0,1,0,0,0,1,0,0,0,1,0,0,0].rotate(3);
      var imp = PulseDivider.kr(~tick.kr,[8,16,32,64]/4,~counter.kr);
        var hit = Select.kr(PulseCount.kr(imp)%pat.size,pat);
  var env = EnvGen.ar(Env([0.001,1,0.001],[0.002,0.5],[3,-3],curve:'exp'),imp * hit);
        var sig = PlayBuf.ar(b.numChannels,b.bufnum,BufRateScale.kr(b.bufnum)*mod+(env*0.01),imp, (pos + BrownNoise.ar(1!8).range(spread * -1,spread)) * BufFrames.kr(b.bufnum),1);
        
  sig = sig * env;
        Splay.ar(sig.flat,0.5,0.5);
    };
    ~ssm.play;
);" ], [ 1773.7210899, 'kof', "b = Buffer.read(s,Platform.resourceDir ++ \"/sounds/beat.wav\");" ], [ 1757.6307958, 'alex', "(~g[0]={
	var sig, env, fenv, penv, renv;
	
	env=EnvGen.kr(Env([0,1,0.5,0], [0.1,0.5,3.5],[\\welch,\\step]), \\trig.tr);
	fenv=EnvGen.kr(Env([\\freq.kr, \\freq.kr*3, \\freq.kr], [0.01,1]), \\trig.tr);
	penv=EnvGen.kr(Env([-1,1,-1], [0.1,0.5]), \\trig.tr);
	renv=EnvGen.kr(Env([1,0.001,0.1], [1,0.5]), \\trig.tr);
	
	sig=LFSaw.ar([\\freq.kr,\\freq.kr+2,\\freq.kr+4,\\freq.kr+6],add:
		BPF.ar(GrayNoise.ar(1),\\freq.kr,renv)
	).lag([0.001, 0.002, 0.003]);
	sig=Balance2.ar(sig*LFSaw.ar([2,3]), sig+Dust.ar(LFNoise0.kr(2).range(20,500)),SinOsc.kr(0.25));
	sig*env;
};
)" ], [ 1748.5461, 'alex', "~g.play(vol:0.06, fadeTime:2);" ], [ 1740.4659953, 'joach', "~jDrum[2] = nil" ], [ 1736.1330092, 'kof', "(
~crack.quant=2;
~crack.fadeTime=0.2;
~crack={
  //         |       |       |       |       |  
  var pat = [1,0,0,0,1,0,0,0,1,0,0,0,1,1,1,1].rotate(3);
  var imp = PulseDivider.kr(~tick.kr,fib(8)+2,~counter.kr);
  var hit = Select.kr(PulseCount.kr(imp)%pat.size,pat);
  var env = EnvGen.ar(Env([0.001,1,0.001],[0.002,0.15+[0.1,0.2,0.3,0.4]],[3,-3],curve:'exp'),imp * hit);
  var sig = Crackle.ar([0.2,0.3,0.4,0.5]+(env**[10,4,40,2]));
  sig = sig * env;
  Splay.ar(sig,0.75,0.35);
};
~crack.play;
);" ], [ 1729.9240032, 'joach', "(
~jDrum[8] = \\set -> QuantEnv(\\freq, 48)
.phase(1, [120,126,120], [32, 16], [\\sin], 0, 1)
.phase(2, [120,(260,220..180),120], [6, 2], [\\step], 0, 1)
.play([1,2]);
)" ], [ 1715.6661303, 'kof', "(
~kick.quant=2;
~kick.fadeTime=0.2;
~kick={
  //         |       |       |       |       |  
  var pat = [1,0,0,0,1,1,0,0,1,0,0,0,1,0,0,0].rotate(1);
  var imp = PulseDivider.kr(~tick.kr,2,~counter.kr);
  var hit = Select.kr(PulseCount.kr(imp)%pat.size,pat);
  var env = EnvGen.ar(Env([0.001,1,0.001],[0.002,3.75],[3,-3],curve:'exp'),imp * hit);
  var sig = SinOsc.ar(50+(env**100*400));
  sig = sig * env;
  Splay.ar(sig,0.75,0.65);
};
~kick.play;
);" ], [ 1709.0291848, 'alex', "(~g[2]=\\set-> Pbind(\\args, [\\freq], \\dur, 12, \\octave, Pseq([[2,3],[5,2],[2,3]],inf), 
\\degree, Pseq([[4,2,3], [5,7,2]],inf) );)" ], [ 1707.7970378, 'kof', "~kick.clear;" ], [ 1700.7409739, 'kof', "(
    ~ssm.quant=2;
    ~ssm.fadeTime=2.02;
    ~ssm={
        var mod = [-1,0.25,-0.25,1/8,1/16];
        var spread = 0.04;
        var pos = [0,0.5,0.75,0.25];
        //         |       |       |       |       |  
        var pat = [1,0,0,0,1,0,0,0,1,0,0,0,1,0,0,0].rotate(3);
      var imp = PulseDivider.kr(~tick.kr,[8,16,32,64]/4,~counter.kr);
        var hit = Select.kr(PulseCount.kr(imp)%pat.size,pat);
  var env = EnvGen.ar(Env([0.001,1,0.001],[0.002,0.5],[3,-3],curve:'exp'),imp * hit);
        var sig = PlayBuf.ar(b.numChannels,b.bufnum,BufRateScale.kr(b.bufnum)*mod+(env*0.01),imp, (pos + BrownNoise.ar(1!8).range(spread * -1,spread)) * BufFrames.kr(b.bufnum),1);
        
  sig = sig * env;
        Splay.ar(sig.flat,0.5,0.5);
    };
    ~ssm.play;
);" ], [ 1699.8502498, 'kof', "b = Buffer.read(s,Platform.resourceDir ++ \"/sounds/beat2.wav\");" ], [ 1699.0064904, 'kof', "b = Buffer.read(s,Platform.resourceDir ++ \"/sounds/beat2.wav\");" ], [ 1695.7921421, 'alex', "~g.play(vol:0.04, fadeTime:2);" ], [ 1690.8733935, 'alex', "~g.play(vol:0.01, fadeTime:2);" ], [ 1686.8999526, 'kof', "(
    ~ssm.quant=2;
    ~ssm.fadeTime=2.02;
    ~ssm={
        var mod = [-1,0.25,-0.25,1/8,1/16];
        var spread = 0.04;
        var pos = [0,0.5,0.75,0.25];
        //         |       |       |       |       |  
        var pat = [1,0,0,0,1,0,0,0,1,0,0,0,1,0,0,0].rotate(3);
      var imp = PulseDivider.kr(~tick.kr,[8,16,32,64]/4,~counter.kr);
        var hit = Select.kr(PulseCount.kr(imp)%pat.size,pat);
  var env = EnvGen.ar(Env([0.001,1,0.001],[0.002,0.5],[3,-3],curve:'exp'),imp * hit);
        var sig = PlayBuf.ar(b.numChannels,b.bufnum,BufRateScale.kr(b.bufnum)*mod+(env*0.01),imp, (pos + BrownNoise.ar(1!8).range(spread * -1,spread)) * BufFrames.kr(b.bufnum),1);
        
  sig = sig * env;
        Splay.ar(sig.flat,0.5,0.5);
    };
    ~ssm.play;
);" ], [ 1686.6067839, 'alex', "~g.scope;" ], [ 1684.4191239, 'alex', "~g.play(vol:0.1, fadeTime:2);" ], [ 1678.0769598, 'alex', "~g[30]=\\filter-> {arg in; Limiter.ar(GVerb.ar(in,[40,20],10),0.7)};" ], [ 1677.255299, 'kof', "~crack.clear;" ], [ 1672.3488836, 'joach', "(
~jDrum[8] = \\set -> QuantEnv(\\freq, 48)
.phase(1, [120,126,120], [32, 16], [\\sin], 0, 1)
.phase(2, [0,1,0], [0.35, 0.65], [2,-2], 0, 1)
.play([1]);
)" ], [ 1662.0003, 'alex', "(~g[2]=\\set-> Pbind(\\args, [\\freq], \\dur, 4, \\octave, Pseq([[2,3],[5,2],[2,3]],inf), 
\\degree, Pseq([[4,2,3], [5,7,2]],inf) );)" ], [ 1658.8426081, 'kof', "(
    ~ssm.quant=2;
    ~ssm.fadeTime=2.02;
    ~ssm={
        var mod = [-1,0.25,-0.25,1/8,1/16];
        var spread = 0.0;
        var pos = [0,0.5,0.75,0.25];
        //         |       |       |       |       |  
        var pat = [1,0,0,0,1,0,0,0,1,0,0,0,1,0,0,0].rotate(3);
      var imp = PulseDivider.kr(~tick.kr,[8,16,32,64]/4,~counter.kr);
        var hit = Select.kr(PulseCount.kr(imp)%pat.size,pat);
  var env = EnvGen.ar(Env([0.001,1,0.001],[0.002,0.5],[3,-3],curve:'exp'),imp * hit);
        var sig = PlayBuf.ar(b.numChannels,b.bufnum,BufRateScale.kr(b.bufnum)*mod+(env*0.01),imp, (pos + BrownNoise.ar(1!8).range(spread * -1,spread)) * BufFrames.kr(b.bufnum),1);
        
  sig = sig * env;
        Splay.ar(sig.flat,0.5,0.5);
    };
    ~ssm.play;
);" ], [ 1656.4575353, 'kof', "~ssm.clear;" ], [ 1656.0925195, 'alex', "(~g[2]=\\set-> Pbind(\\args, [\\freq], \\dur, 4, \\octave, Pseq([[2,3],[5,2],[2,3]],inf), 
\\degree, Pseq([[4,2,3], [5,7,2]],inf) );)" ], [ 1653.8110081, 'kof', "(
~crack.quant=2;
~crack.fadeTime=0.2;
~crack={
  //         |       |       |       |       |  
  var pat = [1,0,0,0,1,0,0,0,1,0,0,0,1,1,1,1].rotate(3);
  var imp = PulseDivider.kr(~tick.kr,fib(8)+4,~counter.kr);
  var hit = Select.kr(PulseCount.kr(imp)%pat.size,pat);
  var env = EnvGen.ar(Env([0.001,1,0.001],[0.002,0.15+[0.1,0.2,0.3,0.4]],[3,-3],curve:'exp'),imp * hit);
  var sig = Crackle.ar([0.2,0.3,0.4,0.5]+(env**[10,4,40,2]));
  sig = sig * env;
  Splay.ar(sig,0.75,0.15);
};
~crack.play;
);" ], [ 1652.8838139, 'alex', "~g[1]=\\set-> Pbind(\\args, [\\trig], \\dur, 4, \\trig,1);" ], [ 1647.0934769, 'alex', "(~g[0]={
	var sig, env, fenv, penv, renv;
	
	env=EnvGen.kr(Env([0,1,0.5,0], [0.1,0.5,3.5],[\\welch,\\step]), \\trig.tr);
	fenv=EnvGen.kr(Env([\\freq.kr, \\freq.kr*3, \\freq.kr], [0.01,1]), \\trig.tr);
	penv=EnvGen.kr(Env([-1,1,-1], [0.1,0.5]), \\trig.tr);
	renv=EnvGen.kr(Env([1,0.001,0.1], [1,0.5]), \\trig.tr);
	
	sig=LFSaw.ar([\\freq.kr,\\freq.kr+2,\\freq.kr+4,\\freq.kr+6],add:
		BPF.ar(GrayNoise.ar(1),\\freq.kr,renv)
	).lag([0.001, 0.002, 0.003]);
	sig=Balance2.ar(sig, sig+Dust.ar(LFNoise0.kr(2).range(20,500)),SinOsc.kr(0.25));
	sig*env;
};
)" ], [ 1641.1328133, 'kof', "(
    ~ssm.quant=2;
    ~ssm.fadeTime=2.02;
    ~ssm={
        var mod = [-1,0.25,-0.25,1/8,1/16];
        var spread = 0.0;
        var pos = [0,0.5,0.75,0.25];
        //         |       |       |       |       |  
        var pat = [1,0,0,0,1,0,0,0,1,0,0,0,1,0,0,0].rotate(3);
      var imp = PulseDivider.kr(~tick.kr,[8,16,32,64]/4,~counter.kr);
        var hit = Select.kr(PulseCount.kr(imp)%pat.size,pat);
  var env = EnvGen.ar(Env([0.001,1,0.001],[0.002,0.5],[3,-3],curve:'exp'),imp * hit);
        var sig = PlayBuf.ar(b.numChannels,b.bufnum,BufRateScale.kr(b.bufnum)*mod+(env*0.01),imp, (pos + BrownNoise.ar(1!8).range(spread * -1,spread)) * BufFrames.kr(b.bufnum),1);
        
  sig = sig * env;
        Splay.ar(sig.flat,0.5,0.5);
    };
    ~ssm.play;
);" ], [ 1637.7263445, 'kof', "(
    ~ssm.quant=2;
    ~ssm.fadeTime=2.02;
    ~ssm={
        var mod = [-1,0.25,-0.25,1/8,1/16];
        var spread = 0.0;
        var pos = [0,0.5,0.75,0.25];
        //         |       |       |       |       |  
        var pat = [1,0,0,0,1,0,0,0,1,0,0,0,1,0,0,0].rotate(1);
      var imp = PulseDivider.kr(~tick.kr,[8,16,32,64]/4,~counter.kr);
        var hit = Select.kr(PulseCount.kr(imp)%pat.size,pat);
  var env = EnvGen.ar(Env([0.001,1,0.001],[0.002,0.5],[3,-3],curve:'exp'),imp * hit);
        var sig = PlayBuf.ar(b.numChannels,b.bufnum,BufRateScale.kr(b.bufnum)*mod+(env*0.01),imp, (pos + BrownNoise.ar(1!8).range(spread * -1,spread)) * BufFrames.kr(b.bufnum),1);
        
  sig = sig * env;
        Splay.ar(sig.flat,0.5,0.5);
    };
    ~ssm.play;
);" ], [ 1630.404146, 'kof', "(
    ~ssm.quant=2;
    ~ssm.fadeTime=2.02;
    ~ssm={
        var mod = [-1,0.25,-0.25,1/8,1/16];
        var spread = 0.0;
        var pos = [0,0.5,0.75,0.25];
        //         |       |       |       |       |  
        var pat = [1,0,0,0,1,0,0,0,1,0,0,0,1,0,0,0].rotate(1);
      var imp = PulseDivider.kr(~tick.kr,[8,16,32,64]/2,~counter.kr);
        var hit = Select.kr(PulseCount.kr(imp)%pat.size,pat);
  var env = EnvGen.ar(Env([0.001,1,0.001],[0.002,0.5],[3,-3],curve:'exp'),imp * hit);
        var sig = PlayBuf.ar(b.numChannels,b.bufnum,BufRateScale.kr(b.bufnum)*mod+(env*0.01),imp, (pos + BrownNoise.ar(1!8).range(spread * -1,spread)) * BufFrames.kr(b.bufnum),1);
        
  sig = sig * env;
        Splay.ar(sig.flat,0.5,0.5);
    };
    ~ssm.play;
);" ], [ 1625.2197107, 'joach', "(
~jDrum[0] = {
var osc = SinOsc.ar(( \\freq.kr(200) + \\fplus.kr(0) ), mul: 1, add: 0);
var noise = BrownNoise.ar(\\noise.kr(0), (1 - \\noise.kr(0)));
var sig = osc * noise;
Pan2.ar( sig * \\amp.kr(0), \\pan.kr(0) );
};
)" ], [ 1615.9532, 'joach', "(
~jDrum[0] = {
var osc = SinOsc.ar(( \\freq.kr(60) + \\fplus.kr(0) ), mul: 1, add: 0);
var noise = BrownNoise.ar(\\noise.kr(0), (1 - \\noise.kr(0)));
var sig = osc * noise;
Pan2.ar( sig * \\amp.kr(0), \\pan.kr(0) );
};
)" ], [ 1610.1336801, 'kof', "(
~crack.quant=2;
~crack.fadeTime=0.2;
~crack={
  //         |       |       |       |       |  
  var pat = [1,0,0,0,1,0,0,0,1,0,0,0,1,1,1,1].rotate(3);
  var imp = PulseDivider.kr(~tick.kr,fib(8)+4,~counter.kr);
  var hit = Select.kr(PulseCount.kr(imp)%pat.size,pat);
  var env = EnvGen.ar(Env([0.001,1,0.001],[0.002,0.05+[0.1,0.2,0.3,0.4]],[3,-3],curve:'exp'),imp * hit);
  var sig = Crackle.ar([0.2,0.3,0.4,0.5]+(env**[10,4,40,2]));
  sig = sig * env;
  Splay.ar(sig,0.75,0.15);
};
~crack.play;
);" ], [ 1607.0708576, 'kof', "(
~crack.quant=2;
~crack.fadeTime=0.2;
~crack={
  //         |       |       |       |       |  
  var pat = [1,0,0,0,1,0,0,0,1,0,0,0,1,1,1,1].rotate(3);
  var imp = PulseDivider.kr(~tick.kr,fib(8)+2,~counter.kr);
  var hit = Select.kr(PulseCount.kr(imp)%pat.size,pat);
  var env = EnvGen.ar(Env([0.001,1,0.001],[0.002,0.05+[0.1,0.2,0.3,0.4]],[3,-3],curve:'exp'),imp * hit);
  var sig = Crackle.ar([0.2,0.3,0.4,0.5]+(env**[10,4,40,2]));
  sig = sig * env;
  Splay.ar(sig,0.75,0.15);
};
~crack.play;
);" ], [ 1602.5590658, 'joach', "~jDrum[5] = \\filter -> {|in| GVerb.ar(in, \\gverb_size.kr(40), \\gverb_time.kr(3.5), 0.9, mul:\\mulgverb.kr(1), add:(1-\\mulgverb.kr(1))) };" ], [ 1573.8812274, 'kof', "(
    ~ssm.quant=2;
    ~ssm.fadeTime=2.02;
    ~ssm={
        var mod = [-1,0.25,-0.25,1/8,1/16];
        var spread = 0.0;
        var pos = [0,0.5,0.75,0.25];
        //         |       |       |       |       |  
        var pat = [1,0,0,0,1,0,0,0,1,0,0,0,1,0,0,0].rotate(1);
      var imp = PulseDivider.kr(~tick.kr,[8,16,32,64],~counter.kr);
        var hit = Select.kr(PulseCount.kr(imp)%pat.size,pat);
  var env = EnvGen.ar(Env([0.001,1,0.001],[0.002,0.5],[3,-3],curve:'exp'),imp * hit);
        var sig = PlayBuf.ar(b.numChannels,b.bufnum,BufRateScale.kr(b.bufnum)*mod+(env*0.01),imp, (pos + BrownNoise.ar(1!8).range(spread * -1,spread)) * BufFrames.kr(b.bufnum),1);
        
  sig = sig * env;
        Splay.ar(sig.flat,0.5,0.5);
    };
    ~ssm.play;
);" ], [ 1568.5358998, 'joach', "~jDrum[4] = \\filter -> {|in| LPF.ar(in, \\lpf_freq.kr(800,8)) };" ], [ 1565.6293337, 'joach', "(
~jDrum[7] = \\set -> QuantEnv(\\lpf_freq, 32)
.phase(1, [800,2100,80], [32.05, 0.95], [2,-2], 0, 1)
.phase(2, [800,3200,1200,800], [10.35, 2, 12.65], \\sin, 0, 1)
.play([1,2]);
)" ], [ 1559.1444458, 'kof', "(
    ~ssm.quant=2;
    ~ssm.fadeTime=2.02;
    ~ssm={
        var mod = [-1,0.25,-0.25,1/8,1/16];
        var spread = 0.0;
        var pos = [0,0.5];
        //         |       |       |       |       |  
        var pat = [1,0,0,0,1,0,0,0,1,0,0,0,1,0,0,0].rotate(1);
      var imp = PulseDivider.kr(~tick.kr,[8,16,32,64],~counter.kr);
        var hit = Select.kr(PulseCount.kr(imp)%pat.size,pat);
  var env = EnvGen.ar(Env([0.001,1,0.001],[0.002,0.5],[3,-3],curve:'exp'),imp * hit);
        var sig = PlayBuf.ar(b.numChannels,b.bufnum,BufRateScale.kr(b.bufnum)*mod+(env*0.01),imp, (pos + BrownNoise.ar(1!8).range(spread * -1,spread)) * BufFrames.kr(b.bufnum),1);
        
  sig = sig * env;
        Splay.ar(sig.flat,0.5,0.5);
    };
    ~ssm.play;
);" ], [ 1545.0340493, 'joach', "(
~jDrum[3] = \\set -> QuantEnv(\\noise, 16)
.phase(1, [0,0.3,0], [15.05, 0.95], [2,-2], 0, 1)
.phase(2, [0,1,0], [0.35, 0.65], [2,-2], 0, 1)
.play([1]);
)" ], [ 1541.2776066, 'kof', "(
    ~ssm.quant=2;
    ~ssm.fadeTime=2.02;
    ~ssm={
        var mod = 1;//[-1,0.25,-0.25,1/8,1/16];
        var spread = 0.0;
        var pos = [0,0.5];
        //         |       |       |       |       |  
        var pat = [1,0,0,0,1,0,0,0,1,0,0,0,1,0,0,0].rotate(1);
      var imp = PulseDivider.kr(~tick.kr,[8,16],~counter.kr);
        var hit = Select.kr(PulseCount.kr(imp)%pat.size,pat);
  var env = EnvGen.ar(Env([0.001,1,0.001],[0.002,0.5],[3,-3],curve:'exp'),imp * hit);
        var sig = PlayBuf.ar(b.numChannels,b.bufnum,BufRateScale.kr(b.bufnum)*mod+(env*0.01),imp, (pos + BrownNoise.ar(1!8).range(spread * -1,spread)) * BufFrames.kr(b.bufnum),1);
        
  sig = sig * env;
        Splay.ar(sig.flat,0.5,0.5);
    };
    ~ssm.play;
);" ], [ 1526.4552521, 'joach', "(
~jDrum[2] = \\set -> QuantEnv(\\fplus, 1)
.phase(1, [0,170,0], [0.05, 0.015], [8,-2], 0, 4)
.phase(2, [0,[170,220],0], [0.035, 0.065], [8,-2], 0, 1)
.phase(3, [0,[470!3,2020],0], [0.035, 0.065], [8,-2], 0, 1)
.play([1,2,1,3]);
)" ], [ 1526.377125, 'kof', "(
    ~ssm.quant=2;
    ~ssm.fadeTime=2.02;
    ~ssm={
        var mod = 1;//[-1,0.25,-0.25,1/8,1/16];
        var spread = 0.0;
        var pos = [0,0.5];
        //         |       |       |       |       |  
        var pat = [1,0,0,0,1,0,0,0,1,0,0,0,1,0,0,0].rotate(1);
      var imp = PulseDivider.kr(~tick.kr,[8,16],~counter.kr);
        var hit = Select.kr(PulseCount.kr(imp)%pat.size,pat);
  var env = EnvGen.ar(Env([0.001,1,0.001],[0.002,0.25],[3,-3],curve:'exp'),imp * hit);
        var sig = PlayBuf.ar(b.numChannels,b.bufnum,BufRateScale.kr(b.bufnum)*mod+(env*0.01),imp, (pos + BrownNoise.ar(1!8).range(spread * -1,spread)) * BufFrames.kr(b.bufnum),1);
        
  sig = sig * env;
        Splay.ar(sig.flat,0.5,0.5);
    };
    ~ssm.play;
);" ], [ 1523.8611984, 'joach', "(
~jDrum[1] = \\set -> QuantEnv(\\amp, 1)
.phase(1, [0.2,1,0.6,0.2], [0.05, 0.25, 0.65], [8,-2, -8], 0, 16)
.phase(2, [0.2,1,0.2], [1.35, 0.65], [2,-2], 0, 1)
.phase(3, [0.2,1,0.7], [0.35, 1.65], [8,-2], 0, 1)
.play([1,2,1,3]);
)" ], [ 1519.81402, 'joach', "(
~jDrum[1] = \\set -> QuantEnv(\\amp, 1)
.phase(1, [0.2,1,0.6,0.2], [0.05, 0.25, 0.65], [8,-2, -8], 0, 4)
.phase(2, [0.2,1,0.2], [1.35, 0.65], [2,-2], 0, 1)
.phase(3, [0.2,1,0.7], [0.35, 1.65], [8,-2], 0, 1)
.play([1,2,1,3]);
)" ], [ 1515.5126264, 'joach', "(
~jDrum[1] = \\set -> QuantEnv(\\amp, 1)
.phase(1, [0.2,1,0.6,0.2], [0.05, 0.25, 1.65], [8,-2, -8], 0, 4)
.phase(2, [0.2,1,0.2], [1.35, 0.65], [2,-2], 0, 1)
.phase(3, [0.2,1,0.7], [0.35, 1.65], [8,-2], 0, 1)
.play([1,2,1,3]);
)" ], [ 1509.124357, 'kof', "b = Buffer.read(s,Platform.resourceDir ++ \"/sounds/beat.wav\");" ], [ 1505.4366394, 'joach', "~jDrum[5] = \\filter -> {|in| GVerb.ar(in, \\gverb_size.kr(40), \\gverb_time.kr(3.5), 0.9, mul:\\mulgverb.kr(1)) };" ], [ 1468.3199452, 'joach', "~jDrum.play(vol: 0.4, fadeTime: 8);" ], [ 1466.5541929, 'kof', "~crack.clear;" ], [ 1466.3510138, 'joach', "(
~jDrum[2] = \\set -> QuantEnv(\\fplus, 0.5)
.phase(1, [0,170,0], [0.05, 0.015], [8,-2], 0, 4)
.phase(2, [0,[170,220],0], [0.035, 0.065], [8,-2], 0, 1)
.phase(3, [0,[470!3,2020],0], [0.035, 0.065], [8,-2], 0, 1)
.play([1,2,1,3]);
)" ], [ 1462.4910415, 'kof', "(
~crack.quant=2;
~crack.fadeTime=0.2;
~crack={
  //         |       |       |       |       |  
  var pat = [1,0,0,0,1,0,0,0,1,0,0,0,1,1,1,1].rotate(3);
  var imp = PulseDivider.kr(~tick.kr,fib(8),~counter.kr);
  var hit = Select.kr(PulseCount.kr(imp)%pat.size,pat);
  var env = EnvGen.ar(Env([0.001,1,0.001],[0.002,0.05+[0.1,0.2,0.7]],[3,-3],curve:'exp'),imp * hit);
  var sig = Crackle.ar([0.2,0.3,0.4,0.5]+(env**[10,4,40,2]));
  sig = sig * env;
  Splay.ar(sig,0.75,0.15);
};
~crack.play;
);" ], [ 1456.1781848, 'kof', "(
~crack={
  //         |       |       |       |       |  
  var pat = [1,0,0,0,1,0,0,0,1,0,0,0,1,1,1,1].rotate(3);
  var imp = PulseDivider.kr(~tick.kr,fib(8),~counter.kr);
  var hit = Select.kr(PulseCount.kr(imp)%pat.size,pat);
  var env = EnvGen.ar(Env([0.001,1,0.001],[0.002,0.05+[0.1,0.2]],[3,-3],curve:'exp'),imp * hit);
  var sig = Crackle.ar([0.2,0.3,0.4,0.5]+(env**[10,4,40,2]));
  sig = sig * env;
  Splay.ar(sig,0.75,0.15);
};
~crack.play;
);" ], [ 1455.7405811, 'joach', "(
~jDrum[6] = \\set -> QuantEnv(\\mulgverb, 1)
.phase(1, [0.5,1,0.5], [0.05, 0.95], [2,-2], 0, 4)
.phase(2, [0,(1,0.9..0.6),0], [0.35, 0.65], [8,\\sin], 0, 1)
.play([1,2]);
)" ], [ 1448.3680837, 'kof', "(
~crack.quant=2;
~crack.fadeTime=0.2;
~crack={
  //         |       |       |       |       |  
  var pat = [1,0,0,0,1,0,0,0,1,0,0,0,1,1,1,1].rotate(3);
  var imp = PulseDivider.kr(~tick.kr,fib(4),~counter.kr);
  var hit = Select.kr(PulseCount.kr(imp)%pat.size,pat);
  var env = EnvGen.ar(Env([0.001,1,0.001],[0.002,0.05+[0.1,0.2]],[3,-3],curve:'exp'),imp * hit);
  var sig = Crackle.ar([0.2,0.3,0.4,0.5]+(env**[10,4,40,2]));
  sig = sig * env;
  Splay.ar(sig,0.75,0.15);
};
~crack.play;
);" ], [ 1445.323641, 'joach', "~jDrum[5] = \\filter -> {|in| GVerb.ar(in, \\gverb_size.kr(40), \\gverb_time.kr(0.5), 0.9, mul:\\mulgverb.kr(1)) };" ], [ 1441.0790345, 'alex', "~d.clear;" ], [ 1437.9793332, 'joach', "~jDrum[5] = \\filter -> {|in| GVerb.ar(in, \\gverb_size.kr(12), \\gverb_time.kr(0.5), 0.9, mul:\\mulgverb.kr(1)) };" ], [ 1435.0770583, 'kof', "(
~kick.quant=2;
~kick.fadeTime=0.2;
~kick={
  //         |       |       |       |       |  
  var pat = [1,0,0,0,1,1,0,0,1,0,0,0,1,0,0,0].rotate(1);
  var imp = PulseDivider.kr(~tick.kr,2,~counter.kr);
  var hit = Select.kr(PulseCount.kr(imp)%pat.size,pat);
  var env = EnvGen.ar(Env([0.001,1,0.001],[0.002,3.75],[3,-3],curve:'exp'),imp * hit);
  var sig = SinOsc.ar(50+(env**100*400));
  sig = sig * env;
  Splay.ar(sig,0.75,0.65);
};
~kick.play;
);" ], [ 1432.4349141, 'alex', "~d.scope;" ], [ 1431.451559, 'kof', "(
~kick.quant=2;
~kick.fadeTime=0.2;
~kick={
  //         |       |       |       |       |  
  var pat = [1,0,0,0,1,1,0,0,1,0,0,0,1,0,0,0].rotate(1);
  var imp = PulseDivider.kr(~tick.kr,2,~counter.kr);
  var hit = Select.kr(PulseCount.kr(imp)%pat.size,pat);
  var env = EnvGen.ar(Env([0.001,1,0.001],[0.002,1.75],[3,-3],curve:'exp'),imp * hit);
  var sig = SinOsc.ar(50+(env**100*400));
  sig = sig * env;
  Splay.ar(sig,0.75,0.65);
};
~kick.play;
);" ], [ 1431.4203075, 'joach', "~jDrum[5] = \\filter -> {|in| GVerb.ar(in, \\gverb_size.kr(12), \\gverb_time.kr(2.5), 0.9, mul:\\mulgverb.kr(1)) };" ], [ 1424.5916245, 'kof', "(
~kick.quant=2;
~kick.fadeTime=0.2;
~kick={
  //         |       |       |       |       |  
  var pat = [1,0,0,0,1,1,0,0,1,0,0,0,1,0,0,0].rotate(1);
  var imp = PulseDivider.kr(~tick.kr,2,~counter.kr);
  var hit = Select.kr(PulseCount.kr(imp)%pat.size,pat);
  var env = EnvGen.ar(Env([0.001,1,0.001],[0.002,4.75],[3,-3],curve:'exp'),imp * hit);
  var sig = SinOsc.ar(50+(env**100*400));
  sig = sig * env;
  Splay.ar(sig,0.75,0.65);
};
~kick.play;
);" ], [ 1416.8553238, 'joach', "(
~jDrum[6] = \\set -> QuantEnv(\\mulgverb, 4)
.phase(1, [0.5,1,0.5], [0.05, 0.95], [2,-2], 0, 4)
.phase(2, [0,(1,0.9..0.6),0], [0.35, 0.65], [8,\\sin], 0, 1)
.play([1,2]);
)" ], [ 1416.1209415, 'kof', "(
~kick.quant=2;
~kick.fadeTime=0.2;
~kick={
  //         |       |       |       |       |  
  var pat = [1,0,0,0,1,1,0,0,1,0,0,0,1,0,0,0].rotate(1);
  var imp = PulseDivider.kr(~tick.kr,4,~counter.kr);
  var hit = Select.kr(PulseCount.kr(imp)%pat.size,pat);
  var env = EnvGen.ar(Env([0.001,1,0.001],[0.002,4.75],[3,-3],curve:'exp'),imp * hit);
  var sig = SinOsc.ar(50+(env**100*400)) + Pulse.ar(50+(env**4*10),mul:0.1);
  sig = sig * env;
  Splay.ar(sig,0.75,0.65);
};
~kick.play;
);" ], [ 1415.2588255, 'alex', "~d[1]=\\set-> Pbind(\\args, [\\trig], \\dur, 4, \\trig,1);" ], [ 1411.6622441, 'kof', "(
~kick.quant=2;
~kick.fadeTime=0.2;
~kick={
  //         |       |       |       |       |  
  var pat = [1,0,0,0,1,1,0,0,1,0,0,0,1,0,0,0].rotate(1);
  var imp = PulseDivider.kr(~tick.kr,4,~counter.kr);
  var hit = Select.kr(PulseCount.kr(imp)%pat.size,pat);
  var env = EnvGen.ar(Env([0.001,1,0.001],[0.002,4.75],[3,-3],curve:'exp'),imp * hit);
  var sig = SinOsc.ar(50+(env**100*400)) + Pulse.ar(50+(env*10),mul:0.1);
  sig = sig * env;
  Splay.ar(sig,0.75,0.65);
};
~kick.play;
);" ], [ 1406.7397306, 'kof', "(
~kick.quant=2;
~kick.fadeTime=0.2;
~kick={
  //         |       |       |       |       |  
  var pat = [1,0,0,0,1,1,0,0,1,0,0,0,1,0,0,0].rotate(1);
  var imp = PulseDivider.kr(~tick.kr,4,~counter.kr);
  var hit = Select.kr(PulseCount.kr(imp)%pat.size,pat);
  var env = EnvGen.ar(Env([0.001,1,0.001],[0.002,4.75],[3,-3],curve:'exp'),imp * hit);
  var sig = SinOsc.ar(50+(env**100*400)) + Pulse.ar(50+(env*5),mul:0.1);
  sig = sig * env;
  Splay.ar(sig,0.75,0.65);
};
~kick.play;
);" ], [ 1404.8691947, 'alex', "(~d[2]=\\set-> Pbind(\\args, [\\freq], \\dur, 4, \\octave, Pseq([[2,3],[5,2],[2,3]],inf), 
\\degree, Pseq([[4,2,3], [5,7,2]],inf) );)" ], [ 1401.9263848, 'joach', "~jDrum[5] = \\filter -> {|in| GVerb.ar(in, \\gverb_size.kr(12), \\gverb_time.kr(0.5), 0.9, mul:\\mulgverb.kr(1)) };" ], [ 1400.4954768, 'alex', "(~d[2]=\\set-> Pbind(\\args, [\\freq], \\dur, 4, \\octave, Pseq([[2,3],[5,2],[6,3]],inf), 
\\degree, Pseq([[4,2,3], [5,7,2]],inf) );)" ], [ 1400.1753781, 'kof', "(
~kick.quant=2;
~kick.fadeTime=0.2;
~kick={
  //         |       |       |       |       |  
  var pat = [1,0,0,0,1,1,0,0,1,0,0,0,1,0,0,0].rotate(1);
  var imp = PulseDivider.kr(~tick.kr,4,~counter.kr);
  var hit = Select.kr(PulseCount.kr(imp)%pat.size,pat);
  var env = EnvGen.ar(Env([0.001,1,0.001],[0.002,4.75],[3,-3],curve:'exp'),imp * hit);
  var sig = SinOsc.ar(50+(env**100*400)) + Pulse.ar(50,mul:0.1);
  sig = sig * env;
  Splay.ar(sig,0.75,0.65);
};
~kick.play;
);" ], [ 1397.3156508, 'kof', "(
~kick.quant=2;
~kick.fadeTime=0.2;
~kick={
  //         |       |       |       |       |  
  var pat = [1,0,0,0,1,1,0,0,1,0,0,0,1,0,0,0].rotate(1);
  var imp = PulseDivider.kr(~tick.kr,4,~counter.kr);
  var hit = Select.kr(PulseCount.kr(imp)%pat.size,pat);
  var env = EnvGen.ar(Env([0.001,1,0.001],[0.002,4.75],[3,-3],curve:'exp'),imp * hit);
  var sig = SinOsc.ar(50+(env**100*400)) + Pulse.ar(50,mul:0.2);
  sig = sig * env;
  Splay.ar(sig,0.75,0.65);
};
~kick.play;
);" ], [ 1387.1375276, 'kof', "(
~kick.quant=2;
~kick.fadeTime=0.2;
~kick={
  //         |       |       |       |       |  
  var pat = [1,0,0,0,1,1,0,0,1,0,0,0,1,0,0,0].rotate(1);
  var imp = PulseDivider.kr(~tick.kr,4,~counter.kr);
  var hit = Select.kr(PulseCount.kr(imp)%pat.size,pat);
  var env = EnvGen.ar(Env([0.001,1,0.001],[0.002,4.75],[3,-3],curve:'exp'),imp * hit);
  var sig = SinOsc.ar(50+(env**100*400));
  sig = sig * env;
  Splay.ar(sig,0.75,0.65);
};
~kick.play;
);" ], [ 1382.8713711, 'joach', "(
~jDrum[2] = \\set -> QuantEnv(\\fplus, 0.5)
.phase(1, [0,170,0], [0.05, 0.015], [8,-2], 0, 4)
.phase(2, [0,[170,220],0], [0.035, 0.065], [8,-2], 0, 1)
.phase(3, [0,[470!3,2020],0], [0.035, 0.065], [8,-2], 0, 1)
.play([1,2,1,3]);
)" ], [ 1378.6809725, 'kof', "(
~kick.quant=2;
~kick.fadeTime=0.2;
~kick={
  //         |       |       |       |       |  
  var pat = [1,0,0,0,1,1,0,0,1,0,0,0,1,0,0,0].rotate(1);
  var imp = PulseDivider.kr(~tick.kr,4,~counter.kr);
  var hit = Select.kr(PulseCount.kr(imp)%pat.size,pat);
  var env = EnvGen.ar(Env([0.001,1,0.001],[0.002,1.75],[3,-3],curve:'exp'),imp * hit);
  var sig = SinOsc.ar(50+(env**100*400));
  sig = sig * env;
  Splay.ar(sig,0.75,0.65);
};
~kick.play;
);" ], [ 1375.8369113, 'joach', "(
~jDrum[2] = \\set -> QuantEnv(\\fplus, 0.5)
.phase(1, [0,100,0], [0.05, 0.015], [8,-2], 0, 4)
.phase(2, [0,[170,220],0], [0.035, 0.065], [8,-2], 0, 1)
.phase(3, [0,[470!3,2020],0], [0.035, 0.065], [8,-2], 0, 1)
.play([1,2,1,3]);
)" ], [ 1369.9252133, 'alex', "(~d[0]={
	var sig, env, fenv, penv, renv;
	
	env=EnvGen.kr(Env([0,1,0.5,0], [0.1,0.5,1.5],[\\welch,\\step]), \\trig.tr);
	fenv=EnvGen.kr(Env([\\freq.kr, \\freq.kr*3, \\freq.kr], [0.01,0.5]), \\trig.tr);
	penv=EnvGen.kr(Env([-1,1,-1], [0.1,0.5]), \\trig.tr);
	renv=EnvGen.kr(Env([1,0.001,0.1], [1,0.5]), \\trig.tr);
	
	sig=BPF.ar(WhiteNoise.ar([1,0.5,2,0.7,0.6])+GrayNoise.ar(0.2),freq:fenv,rq:renv);
	sig*env;
};
)" ], [ 1363.5805449, 'alex', "(~d[0]={
	var sig, env, fenv, penv, renv;
	
	env=EnvGen.kr(Env([0,1,0.5,0], [0.1,0.5,1.5],[\\welch,\\step]), \\trig.tr);
	fenv=EnvGen.kr(Env([\\freq.kr, \\freq.kr*3, \\freq.kr], [0.01,0.5]), \\trig.tr);
	penv=EnvGen.kr(Env([-1,1,-1], [0.1,0.5]), \\trig.tr);
	renv=EnvGen.kr(Env([2,0.001,0.1], [1,0.5]), \\trig.tr);
	
	sig=BPF.ar(WhiteNoise.ar([1,0.5,2,0.7,0.6])+GrayNoise.ar(0.2),freq:fenv,rq:renv);
	sig*env;
};
)" ], [ 1356.3857973, 'joach', "(
~jDrum[1] = \\set -> QuantEnv(\\amp, 2)
.phase(1, [0.2,1,0.6,0.2], [0.05, 0.25, 1.65], [8,-2, -8], 0, 4)
.phase(2, [0.2,1,0.2], [1.35, 0.65], [2,-2], 0, 1)
.phase(3, [0.2,1,0.7], [0.35, 1.65], [8,-2], 0, 1)
.play([1,2,1,3]);
)" ], [ 1353.0720533, 'alex', "~d.play(vol:2, fadeTime:2);" ], [ 1346.16961, 'kof', "~crack.clear;" ], [ 1345.6394411, 'alex', "(~d[2]=\\set-> Pbind(\\args, [\\freq], \\dur, 4, \\octave, Pseq([[4,3],[5,2],[6,3]],inf), 
\\degree, Pseq([[4,2,3], [5,7,2]],inf) );)" ], [ 1343.7756087, 'alex', "~d[1]=\\set-> Pbind(\\args, [\\trig], \\dur, 4, \\trig,1);" ], [ 1343.0436341, 'kof', "(
~crack.quant=2;
~crack.fadeTime=0.2;
~crack={
  //         |       |       |       |       |  
  var pat = [1,0,0,0,1,0,0,0,1,0,0,0,1,1,1,1].rotate(3);
  var imp = PulseDivider.kr(~tick.kr,8,~counter.kr);
  var hit = Select.kr(PulseCount.kr(imp)%pat.size,pat);
  var env = EnvGen.ar(Env([0.001,1,0.001],[0.002,0.05+[0.1,0.2]],[3,-3],curve:'exp'),imp * hit);
  var sig = Crackle.ar([0.2,0.3,0.4,0.5]+(env**[10,4,40,2]));
  sig = sig * env;
  Splay.ar(sig,0.75,0.15);
};
~crack.play;
);" ], [ 1341.3771768, 'alex', "(~d[0]={
	var sig, env, fenv, penv, renv;
	
	env=EnvGen.kr(Env([0,1,0.5,0], [0.1,0.5,1.5],[\\welch,\\step]), \\trig.tr);
	fenv=EnvGen.kr(Env([\\freq.kr, \\freq.kr*3, \\freq.kr], [0.01,0.5]), \\trig.tr);
	penv=EnvGen.kr(Env([-1,1,-1], [0.1,0.5]), \\trig.tr);
	renv=EnvGen.kr(Env([1,0.001,0.1], [1,0.5]), \\trig.tr);
	
	sig=BPF.ar(WhiteNoise.ar([1,0.5,2,0.7,0.6])+GrayNoise.ar(0.2),freq:fenv,rq:renv);
	sig*env;
};
)" ], [ 1339.1878, 'alex', "~d.scope;" ], [ 1338.0884085, 'alex', "~d.play(vol:5, fadeTime:2);" ], [ 1337.5846055, 'kof', "(
~kick.quant=2;
~kick.fadeTime=0.2;
~kick={
  //         |       |       |       |       |  
  var pat = [1,0,0,0,1,1,0,0,1,0,0,0,1,0,0,0].rotate(1);
  var imp = PulseDivider.kr(~tick.kr,2,~counter.kr);
  var hit = Select.kr(PulseCount.kr(imp)%pat.size,pat);
  var env = EnvGen.ar(Env([0.001,1,0.001],[0.002,0.75],[3,-3],curve:'exp'),imp * hit);
  var sig = SinOsc.ar(50+(env**100*400));
  sig = sig * env;
  Splay.ar(sig,0.75,0.65);
};
~kick.play;
);" ], [ 1335.5220107, 'joach', "(
~jDrum[0] = {
var osc = SinOsc.ar(( \\freq.kr(100) + \\fplus.kr(0) ), mul: 1, add: 0);
var noise = BrownNoise.ar(\\noise.kr(0), (1 - \\noise.kr(0)));
var sig = osc * noise;
Pan2.ar( sig * \\amp.kr(0), \\pan.kr(0) );
};
)" ], [ 1333.2249573, 'kof', "(
~kick.quant=2;
~kick.fadeTime=0.2;
~kick={
  //         |       |       |       |       |  
  var pat = [1,0,0,0,1,1,0,0,1,0,0,0,1,0,0,0].rotate(1);
  var imp = PulseDivider.kr(~tick.kr,2,~counter.kr);
  var hit = Select.kr(PulseCount.kr(imp)%pat.size,pat);
  var env = EnvGen.ar(Env([0.001,1,0.001],[0.002,0.75],[3,-3],curve:'exp'),imp * hit);
  var sig = SinOsc.ar(50+(env**100*400));
  sig = sig * env;
  Splay.ar(sig,0.75,0.65);
};
~kick.play;
);" ], [ 1330.6308317, 'kof', "(
  p.clock.tempo_(240/60);
  
  ~offset = (0..7)/8;
  
  ~tick.quant = 1;
  ~tick = {Mix(Impulse.kr( ~tempo / 2 , ~offset ))};
  
  ~counter = {PulseCount.kr(~tick.kr)};
);" ], [ 1329.8339828, 'kof', "(
  p=ProxySpace.push(s.boot);
  p.makeTempoClock;
);" ], [ 1325.0385042, 'joach', "~jDrum.play(vol: 0.4, fadeTime: 8);" ], [ 1323.1634849, 'joach', "p.clock.tempo_(240/60);" ], [ 1322.7101377, 'joach', "p = ProxySpace.push(s).makeTempoClock;" ], [ 1317.070315, 'joach', "AutoIDE.run" ], [ 1310.0064391, 'kof', "(
~crack.quant=2;
~crack.fadeTime=0.2;
~crack={
  //         |       |       |       |       |  
  var pat = [1,0,0,0,1,0,0,0,1,0,0,0,1,1,1,1].rotate(3);
  var imp = PulseDivider.kr(~tick.kr,8,~counter.kr);
  var hit = Select.kr(PulseCount.kr(imp)%pat.size,pat);
  var env = EnvGen.ar(Env([0.001,1,0.001],[0.002,0.05+[0.1,0.2]],[3,-3],curve:'exp'),imp * hit);
  var sig = Crackle.ar([0.2,0.3,0.4,0.5]+(env**[10,4,40,2]));
  sig = sig * env;
  Splay.ar(sig,0.75,0.15);
};
~crack.play;
);" ], [ 1309.8750608, 'alex', "~f[30]=\\filter-> {arg in; Limiter.ar(GVerb.ar(in,[40,20],10),0.7)};" ], [ 1300.7234814, 'kof', "(
~crack.quant=2;
~crack.fadeTime=0.2;
~crack={
  //         |       |       |       |       |  
  var pat = [1,0,0,0,1,0,0,0,1,0,0,0,1,1,1,1].rotate(3);
  var imp = PulseDivider.kr(~tick.kr,[2,3],~counter.kr);
  var hit = Select.kr(PulseCount.kr(imp)%pat.size,pat);
  var env = EnvGen.ar(Env([0.001,1,0.001],[0.002,0.05+[0.1,0.2]],[3,-3],curve:'exp'),imp * hit);
  var sig = Crackle.ar([0.2,0.3,0.4,0.5]+(env**[10,4,40,2]));
  sig = sig * env;
  Splay.ar(sig,0.75,0.15);
};
~crack.play;
);" ], [ 1299.1542709, 'alex', "~f[30]=\\filter-> {arg in; Limiter.ar(GVerb.ar(in,[40,20],10,add:in*0.2),0.7)};" ], [ 1297.8794206, 'kof', "(
~crack.quant=2;
~crack.fadeTime=0.2;
~crack={
  //         |       |       |       |       |  
  var pat = [1,0,0,0,1,0,0,0,1,0,0,0,1,1,1,1].rotate(3);
  var imp = PulseDivider.kr(~tick.kr,[2,3],~counter.kr);
  var hit = Select.kr(PulseCount.kr(imp)%pat.size,pat);
  var env = EnvGen.ar(Env([0.001,1,0.001],[0.002,0.05+[0.1,0.2]],[3,-3],curve:'exp'),imp * hit);
  var sig = Crackle.ar([0.2,0.3,0.4,0.5]+(env**[10,4,40,2]));
  sig = sig * env;
  Splay.ar(sig,0.75,0.25);
};
~crack.play;
);" ], [ 1294.6759592, 'joach', "~jDrum.stop(6);" ], [ 1293.7812439, 'kof', "(
~ff.quant=1;
~ff.fadeTime=1;
~ff={
  var high,mid,low;
  var sig = ~crack;
  
  sig = GVerb.ar(LPF.ar(sig,5000)+HPF.ar(sig,500),40,[3,4,5,6],spread:[40,90])/8 + sig;
  low = CompanderD.ar(LPF.ar(sig,400),3/4,1/2,1/2);
  mid = CompanderD.ar(BPF.ar(sig,600,2),3/4,1/2,1/2);
  high = CompanderD.ar(HPF.ar(sig,900),3/4,1/2,1/2);
  sig = CompanderD.ar((high+mid+low).flat,3/4,1/1.1,1/1.1);
  Splay.ar(sig,0.75,0.25);
};
~ff.play;
);" ], [ 1292.8141315, 'alex', "~f[30]=\\filter-> {arg in; Limiter.ar(GVerb.ar(in,[40,20],10,add:in),0.7)};" ], [ 1284.3879355, 'alex', "(~f[2]=\\set-> Pbind(\\args, [\\freq], \\dur, 4, \\octave, Pseq([[4,6,5],[5,3,7],[6,3]],inf), 
\\degree, Pseq([[4,2,8], [5,7,2]],inf) );)" ], [ 1283.8153128, 'joach', "(
~jDrum[1] = \\set -> QuantEnv(\\amp, 8)
.phase(1, [0.2,1,0.6,0.2], [0.05, 0.25, 7.65], [8,-2, -8], 0, 4)
.phase(2, [0.2,1,0.2], [3.35, 4.65], [2,-2], 0, 1)
.phase(3, [0.2,1,0.7], [0.35, 6.65], [8,-2], 0, 1)
.play([1,2,1,3]);
)" ], [ 1281.6118318, 'joach', "(
~jDrum[1] = \\set -> QuantEnv(\\amp, 8)
.phase(1, [0.2,1,0.6,0.2], [0.05, 0.25, 7.65], [8,-2, -8], 0, 4)
.phase(2, [0.2,1,0.2], [3.35, 4.65], [2,-2], 0, 1)
.phase(3, [0.2,1,0.7], [0.35, 6.65], [2,-2], 0, 1)
.play([1,2,1,3]);
)" ], [ 1280.6743212, 'kof', "~kick.clear;" ], [ 1277.4707908, 'joach', "(
~jDrum[1] = \\set -> QuantEnv(\\amp, 8)
.phase(1, [0.2,1,0.6,0.2], [0.05, 0.25, 7.65], [8,-2, -8], 0, 4)
.phase(2, [0.2,1,0.2], [3.35, 4.65], [2,-2], 0, 1)
.phase(3, [0.2,1,0.7], [0.35, 7.65], [2,-2], 0, 1)
.play([1,2,1,3]);
)" ], [ 1274.3261141, 'alex', "(~f[0]={
	var sig, env, fenv, penv, renv;
	
	env=EnvGen.kr(Env([0,1,0.5,0], [0.1,0.5,1.5],[\\welch,\\step]), \\trig.tr);
	fenv=EnvGen.kr(Env([\\freq.kr, \\freq.kr*3, \\freq.kr], [0.1,1]), \\trig.tr);
	penv=EnvGen.kr(Env([-1,1,-1], [0.1,0.5]), \\trig.tr);
	renv=EnvGen.kr(Env([0.01,0.001,0.3], [1,0.5]), \\trig.tr);

	
	sig=BPF.ar(GrayNoise.ar([0.1,0.2,0.5,0.7]),fenv,renv)+LFPulse.ar([2,3,1]);
	sig*env;
};
)" ], [ 1270.156994, 'kof', "(
~kick.quant=2;
~kick.fadeTime=0.2;
~kick={
  //         |       |       |       |       |  
  var pat = [1,0,0,0,1,1,0,0,1,0,0,0,1,0,0,0].rotate(1);
  var imp = PulseDivider.kr(~tick.kr,2,~counter.kr);
  var hit = Select.kr(PulseCount.kr(imp)%pat.size,pat);
  var env = EnvGen.ar(Env([0.001,1,0.001],[0.002,0.75],[3,-3],curve:'exp'),imp * hit);
  var sig = SinOsc.ar(50+(env**100*400));
  sig = sig * env;
  Splay.ar(sig,0.75,0.65);
};
~kick.play;
);" ], [ 1260.3290463, 'alex', "(~f[0]={
	var sig, env, fenv, penv, renv;
	
	env=EnvGen.kr(Env([0,1,0.5,0], [0.1,0.5,1.5],[\\welch,\\step]), \\trig.tr);
	fenv=EnvGen.kr(Env([\\freq.kr, \\freq.kr*3, \\freq.kr], [0.1,1]), \\trig.tr);
	penv=EnvGen.kr(Env([-1,1,-1], [0.1,0.5]), \\trig.tr);
	renv=EnvGen.kr(Env([0.01,0.001,0.1], [1,0.5]), \\trig.tr);

	
	sig=BPF.ar(GrayNoise.ar([0.1,0.2,0.5,0.7]),fenv,renv)+LFPulse.ar([2,3,1]);
	sig*env;
};
)" ], [ 1259.3671338, 'kof', "(
~crack.quant=2;
~crack.fadeTime=0.2;
~crack={
  //         |       |       |       |       |  
  var pat = [1,0,0,0,1,0,0,0,1,0,0,0,1,1,1,1].rotate(3);
  var imp = PulseDivider.kr(~tick.kr,[2,3],~counter.kr);
  var hit = Select.kr(PulseCount.kr(imp)%pat.size,pat);
  var env = EnvGen.ar(Env([0.001,1,0.001],[0.002,0.05+[0.1,0.2]],[3,-3],curve:'exp'),imp * hit);
  var sig = Crackle.ar([0.2,0.3,0.4,0.5]+(env**[10,4,40,2]));
  sig = sig * env;
  Splay.ar(sig,0.75,0.5);
};
~crack.play;
);" ], [ 1250.3912791, 'joach', "(
~jDrum[7] = \\set -> QuantEnv(\\lpf_freq, 32)
.phase(1, [800,2100,80], [32.05, 0.95], [2,-2], 0, 1)
.phase(2, [800,3200,1200,800], [10.35, 2, 12.65], \\sin, 0, 1)
.play([1,2]);
)" ], [ 1246.3408317, 'kof', "(
~crack.quant=2;
~crack.fadeTime=0.2;
~crack={
  //         |       |       |       |       |  
  var pat = [1,0,0,0,1,0,0,0,1,0,0,0,1,1,1,1].rotate(3);
  var imp = PulseDivider.kr(~tick.kr,[2,3,4,8],~counter.kr);
  var hit = Select.kr(PulseCount.kr(imp)%pat.size,pat);
  var env = EnvGen.ar(Env([0.001,1,0.001],[0.002,0.05+[0.1,0.2]],[3,-3],curve:'exp'),imp * hit);
  var sig = Crackle.ar([0.2,0.3,0.4,0.5]+(env**[10,4,40,2]));
  sig = sig * env;
  Splay.ar(sig,0.75,0.5);
};
~crack.play;
);" ], [ 1244.69025, 'alex', "(~f[0]={
	var sig, env, fenv, penv, renv;
	
	env=EnvGen.kr(Env([0,1,0.5,0], [0.1,0.5,1.5],[\\welch,\\step]), \\trig.tr);
	fenv=EnvGen.kr(Env([\\freq.kr, \\freq.kr*3, \\freq.kr], [0.1,1]), \\trig.tr);
	penv=EnvGen.kr(Env([-1,1,-1], [0.1,0.5]), \\trig.tr);
	renv=EnvGen.kr(Env([0.01,0.001,0.1], [1,0.5]), \\trig.tr);

	
	sig=BPF.ar(GrayNoise.ar([0.1,0.2,0.5,0.7]),fenv,renv)+LFPulse.ar([2,3]);
	sig*env;
};
)" ], [ 1240.7924355, 'kof', "(
~crack.quant=2;
~crack.fadeTime=0.2;
~crack={
  //         |       |       |       |       |  
  var pat = [1,0,0,0,1,0,0,0,1,0,0,0,1,0,0,0].rotate(3);
  var imp = PulseDivider.kr(~tick.kr,[2,3,4,8],~counter.kr);
  var hit = Select.kr(PulseCount.kr(imp)%pat.size,pat);
  var env = EnvGen.ar(Env([0.001,1,0.001],[0.002,0.05+[0.1,0.2]],[3,-3],curve:'exp'),imp * hit);
  var sig = Crackle.ar([0.2,0.3,0.4,0.5]+(env**[10,4,40,2]));
  sig = sig * env;
  Splay.ar(sig,0.75,0.5);
};
~crack.play;
);" ], [ 1237.1198069, 'kof', "(
~crack.quant=2;
~crack.fadeTime=0.2;
~crack={
  //         |       |       |       |       |  
  var pat = [1,0,0,0,1,0,0,0,1,0,0,0,1,0,0,0].rotate(3);
  var imp = PulseDivider.kr(~tick.kr,[2,3,4],~counter.kr);
  var hit = Select.kr(PulseCount.kr(imp)%pat.size,pat);
  var env = EnvGen.ar(Env([0.001,1,0.001],[0.002,0.05+[0.1,0.2]],[3,-3],curve:'exp'),imp * hit);
  var sig = Crackle.ar([0.2,0.3,0.4,0.5]+(env**[10,4,40,2]));
  sig = sig * env;
  Splay.ar(sig,0.75,0.5);
};
~crack.play;
);" ], [ 1233.9664481, 'alex', "(~f[2]=\\set-> Pbind(\\args, [\\freq], \\dur, 4, \\octave, Pseq([[4,6,5],[5,3,7],[6,3]],inf), 
\\degree, Pseq([[4,2,3], [5,7,2]],inf) );)" ], [ 1229.8563147, 'kof', "(
~crack.quant=2;
~crack.fadeTime=0.2;
~crack={
  //         |       |       |       |       |  
  var pat = [1,0,0,0,1,0,0,0,1,0,0,0,1,0,0,0].rotate(3);
  var imp = PulseDivider.kr(~tick.kr,[2,3,4],~counter.kr);
  var hit = Select.kr(PulseCount.kr(imp)%pat.size,pat);
  var env = EnvGen.ar(Env([0.001,1,0.001],[0.002,0.05+[0.1,0.2]],[3,-3],curve:'exp'),imp * hit);
  var sig = Crackle.ar([0.2,0.3,0.4,0.5]+(env**40));
  sig = sig * env;
  Splay.ar(sig,0.75,0.5);
};
~crack.play;
);" ], [ 1222.1448465, 'kof', "(
~crack.quant=2;
~crack.fadeTime=0.2;
~crack={
  //         |       |       |       |       |  
  var pat = [1,0,0,0,1,0,0,0,1,0,0,0,1,0,0,0].rotate(3);
  var imp = PulseDivider.kr(~tick.kr,[2,3,4],~counter.kr);
  var hit = Select.kr(PulseCount.kr(imp)%pat.size,pat);
  var env = EnvGen.ar(Env([0.001,1,0.001],[0.002,0.05+[0.1,0.2]],[3,-3],curve:'exp'),imp * hit);
  var sig = Crackle.ar([0.2,0.3,0.4,0.5]+(env**4));
  sig = sig * env;
  Splay.ar(sig,0.75,0.5);
};
~crack.play;
);" ], [ 1221.6095757, 'alex', "(~f[0]={
	var sig, env, fenv, penv, renv;
	
	env=EnvGen.kr(Env([0,1,0.5,0], [0.1,0.5,1.5],[\\welch,\\step]), \\trig.tr);
	fenv=EnvGen.kr(Env([\\freq.kr, \\freq.kr*3, \\freq.kr], [0.01,0.5]), \\trig.tr);
	penv=EnvGen.kr(Env([-1,1,-1], [0.1,0.5]), \\trig.tr);
	renv=EnvGen.kr(Env([0.01,0.001,0.1], [1,0.5]), \\trig.tr);

	
	sig=BPF.ar(GrayNoise.ar([0.1,0.2,0.5,0.7]),fenv,renv)+LFPulse.ar([2,3]);
	sig*env;
};
)" ], [ 1218.1030207, 'alex', "~f.play(vol:0.1, fadeTime:2);" ], [ 1215.0409231, 'alex', "(~f[2]=\\set-> Pbind(\\args, [\\freq], \\dur, 4, \\octave, Pseq([[4,6],[5,3,7],[6,3]],inf), 
\\degree, Pseq([[4,2,3], [5,7,2]],inf) );)" ], [ 1208.1264176, 'kof', "(
~kick.quant=2;
~kick.fadeTime=0.2;
~kick={
  //         |       |       |       |       |  
  var pat = [1,0,0,0,1,1,0,0,1,0,0,0,1,1,0,0].rotate(1);
  var imp = PulseDivider.kr(~tick.kr,2,~counter.kr);
  var hit = Select.kr(PulseCount.kr(imp)%pat.size,pat);
  var env = EnvGen.ar(Env([0.001,1,0.001],[0.002,0.75],[3,-3],curve:'exp'),imp * hit);
  var sig = SinOsc.ar(50+(env**100*400));
  sig = sig * env;
  Splay.ar(sig,0.75,0.65);
};
~kick.play;
);" ], [ 1200.2509239, 'kof', "(
~kick.quant=2;
~kick.fadeTime=0.2;
~kick={
  //         |       |       |       |       |  
  var pat = [1,0,0,0,1,1,0,0,1,0,0,0,1,1,0,0].rotate(1);
  var imp = PulseDivider.kr(~tick.kr,4,~counter.kr);
  var hit = Select.kr(PulseCount.kr(imp)%pat.size,pat);
  var env = EnvGen.ar(Env([0.001,1,0.001],[0.002,0.75],[3,-3],curve:'exp'),imp * hit);
  var sig = SinOsc.ar(50+(env**100*400));
  sig = sig * env;
  Splay.ar(sig,0.75,0.65);
};
~kick.play;
);" ], [ 1194.2655669, 'alex', "~f[30]=\\filter-> {arg in; Limiter.ar(GVerb.ar(in,[40,20],10),0.7)};" ], [ 1192.1596099, 'kof', "(
~crack.quant=2;
~crack.fadeTime=0.2;
~crack={
  //         |       |       |       |       |  
  var pat = [1,0,0,0,1,0,0,0,1,0,0,0,1,0,0,0].rotate(3);
  var imp = PulseDivider.kr(~tick.kr,[2,3,4],~counter.kr);
  var hit = Select.kr(PulseCount.kr(imp)%pat.size,pat);
  var env = EnvGen.ar(Env([0.001,1,0.001],[0.002,0.05+[0.1,0.2]],[3,-3],curve:'exp'),imp * hit);
  var sig = Crackle.ar([0.2,0.3,0.4,0.5]+(env**40));
  sig = sig * env;
  Splay.ar(sig,0.75,0.5);
};
~crack.play;
);" ], [ 1188.7219764, 'kof', "~crack.clear;" ], [ 1175.8145948, 'kof', "(
~kick.quant=2;
~kick.fadeTime=0.2;
~kick={
  //         |       |       |       |       |  
  var pat = [1,0,0,0,1,1,0,0,1,0,0,0,1,1,0,0].rotate(1);
  var imp = PulseDivider.kr(~tick.kr,4,~counter.kr);
  var hit = Select.kr(PulseCount.kr(imp)%pat.size,pat);
  var env = EnvGen.ar(Env([0.001,1,0.001],[0.002,0.75],[3,-3],curve:'exp'),imp * hit);
  var sig = SinOsc.ar(50+(env**100*400));
  sig = sig * env;
  Splay.ar(sig,0.75,0.75);
};
~kick.play;
);" ], [ 1169.6584629, 'alex', "(~f[0]={
	var sig, env, fenv, penv, renv;
	
	env=EnvGen.kr(Env([0,1,0.5,0], [0.1,0.5,1.5],[\\welch,\\step]), \\trig.tr);
	fenv=EnvGen.kr(Env([\\freq.kr, \\freq.kr*3, \\freq.kr], [0.01,0.5]), \\trig.tr);
	penv=EnvGen.kr(Env([-1,1,-1], [0.1,0.5]), \\trig.tr);
	renv=EnvGen.kr(Env([0.01,0.001,0.1], [1,0.5]), \\trig.tr);

	
	sig=BPF.ar(GrayNoise.ar([0.1,0.2,0.5,0.7]),fenv,renv)+LFPulse.ar([2,3]);
	sig*env;
};
)" ], [ 1168.6096937, 'kof', "~kick.clear;" ], [ 1159.5171924, 'kof', "(
~crack.quant=2;
~crack.fadeTime=0.2;
~crack={
  //         |       |       |       |       |  
  var pat = [1,0,0,0,1,0,0,0,1,0,0,0,1,0,0,0].rotate(3);
  var imp = PulseDivider.kr(~tick.kr,[2,3,4],~counter.kr);
  var hit = Select.kr(PulseCount.kr(imp)%pat.size,pat);
  var env = EnvGen.ar(Env([0.001,1,0.001],[0.002,0.05+[0.1,0.2]],[3,-3],curve:'exp'),imp * hit);
  var sig = Crackle.ar([0.2,0.3,0.4,0.5]+(env**40));
  sig = sig * env;
  Splay.ar(sig,0.75,0.5);
};
~crack.play;
);" ], [ 1156.9692953, 'joach', "(
~jDrum[6] = \\set -> QuantEnv(\\mulgverb, 4)
.phase(1, [0.5,1,0.5], [0.05, 0.95], [2,-2], 0, 1)
.phase(2, [0,1,0], [0.35, 0.65], [2,-2], 0, 1)
.play([1]);
)" ], [ 1156.7464631, 'alex', "(~f[2]=\\set-> Pbind(\\args, [\\freq], \\dur, 4, \\octave, Pseq([[4,3],[5,3],[6,3]],inf), 
\\degree, Pseq([[4,2,3], [5,7,2]],inf) );)" ], [ 1153.0092732, 'kof', "(
~crack.quant=2;
~crack.fadeTime=0.2;
~crack={
  //         |       |       |       |       |  
  var pat = [1,0,0,0,1,0,0,0,1,0,0,0,1,0,0,0].rotate(3);
  var imp = PulseDivider.kr(~tick.kr,2,~counter.kr);
  var hit = Select.kr(PulseCount.kr(imp)%pat.size,pat);
  var env = EnvGen.ar(Env([0.001,1,0.001],[0.002,0.05+[0.1,0.2]],[3,-3],curve:'exp'),imp * hit);
  var sig = Crackle.ar([0.2,0.3,0.4,0.5]+(env**40));
  sig = sig * env;
  Splay.ar(sig,0.75,0.5);
};
~crack.play;
);" ], [ 1151.2764561, 'alex', "(~f[2]=\\set-> Pbind(\\args, [\\freq], \\dur, 4, \\octave, Pseq([[4,3],[5,3],[2,3]],inf), 
\\degree, Pseq([[4,2,3], [5,7,2]],inf) );)" ], [ 1147.5608302, 'alex', "(~f[2]=\\set-> Pbind(\\args, [\\freq], \\dur, 4, \\octave, Pseq([[4,3],[5,3],[2,3,1]],inf), 
\\degree, Pseq([[4,2,3], [5,7,2]],inf) );)" ], [ 1145.6804878, 'joach', "(
~jDrum[6] = \\set -> QuantEnv(\\mulgverb, 1)
.phase(1, [0.5,1,0.5], [0.05, 0.95], [2,-2], 0, 1)
.phase(2, [0,1,0], [0.35, 0.65], [2,-2], 0, 1)
.play([1]);
)" ], [ 1142.8677512, 'kof', "(
~crack.quant=2;
~crack.fadeTime=0.2;
~crack={
  //         |       |       |       |       |  
  var pat = [1,0,0,0,1,0,0,0,1,0,0,0,1,0,0,0].rotate(3);
  var imp = PulseDivider.kr(~tick.kr,2,~counter.kr);
  var hit = Select.kr(PulseCount.kr(imp)%pat.size,pat);
  var env = EnvGen.ar(Env([0.001,1,0.001],[0.002,0.05],[3,-3],curve:'exp'),imp * hit);
  var sig = Crackle.ar([0.2,0.3,0.4,0.5]+(env**40));
  sig = sig * env;
  Splay.ar(sig,0.75,0.5);
};
~crack.play;
);" ], [ 1140.0394489, 'kof', "(
~crack.quant=2;
~crack.fadeTime=0.2;
~crack={
  //         |       |       |       |       |  
  var pat = [1,0,0,0,1,0,0,0,1,0,0,0,1,0,0,0].rotate(3);
  var imp = PulseDivider.kr(~tick.kr,2,~counter.kr);
  var hit = Select.kr(PulseCount.kr(imp)%pat.size,pat);
  var env = EnvGen.ar(Env([0.001,1,0.001],[0.002,0.25],[3,-3],curve:'exp'),imp * hit);
  var sig = Crackle.ar([0.2,0.3,0.4,0.5]+(env**40));
  sig = sig * env;
  Splay.ar(sig,0.75,0.5);
};
~crack.play;
);" ], [ 1139.9143287, 'joach', "~jDrum[5] = \\filter -> {|in| GVerb.ar(in, \\gverb_size.kr(12), \\gverb_time.kr(2), 0.9, mul:\\mulgverb.kr(1)) };" ], [ 1137.1651896, 'alex', "(~f[2]=\\set-> Pbind(\\args, [\\freq], \\dur, 4, \\octave, Pseq([[4,3],[5,1,3],[2,3,1]],inf), 
\\degree, Pseq([[4,2,3], [5,7,2]],inf) );)" ], [ 1135.7791128, 'kof', "(
~crack.quant=2;
~crack.fadeTime=0.2;
~crack={
  //         |       |       |       |       |  
  var pat = [1,0,0,0,1,0,0,0,1,0,0,0,1,0,0,0].rotate(3);
  var imp = PulseDivider.kr(~tick.kr,2,~counter.kr);
  var hit = Select.kr(PulseCount.kr(imp)%pat.size,pat);
  var env = EnvGen.ar(Env([0.001,1,0.001],[0.002,0.15],[3,-3],curve:'exp'),imp * hit);
  var sig = Crackle.ar([0.2,0.3,0.4,0.5]+(env**40));
  sig = sig * env;
  Splay.ar(sig,0.75,0.5);
};
~crack.play;
);" ], [ 1125.2135622, 'kof', "(
~crack.quant=2;
~crack.fadeTime=0.2;
~crack={
  //         |       |       |       |       |  
  var pat = [1,0,0,0,1,0,0,0,1,0,0,0,1,0,0,0].rotate(3);
  var imp = PulseDivider.kr(~tick.kr,2,~counter.kr);
  var hit = Select.kr(PulseCount.kr(imp)%pat.size,pat);
  var env = EnvGen.ar(Env([0.001,1,0.001],[0.002,0.05],[3,-3],curve:'exp'),imp * hit);
  var sig = Crackle.ar([0.2,0.3,0.4,0.5]+(env**40));
  sig = sig * env;
  Splay.ar(sig,0.75,0.5);
};
~crack.play;
);" ], [ 1119.7288134, 'joach', "(
~jDrum[7] = \\set -> QuantEnv(\\lpf_freq, 32)
.phase(1, [800,2100,80], [32.05, 0.95], [2,-2], 0, 1)
.phase(2, [0,1,0], [0.35, 0.65], [2,-2], 0, 1)
.play([1]);
)" ], [ 1118.688625, 'alex', "(~f[0]={
	var sig, env, fenv, penv, renv;
	
	env=EnvGen.kr(Env([0,1,0.5,0], [0.1,0.5,1.5],[\\welch,\\step]), \\trig.tr);
	fenv=EnvGen.kr(Env([\\freq.kr, \\freq.kr*3, \\freq.kr], [0.01,0.5]), \\trig.tr);
	penv=EnvGen.kr(Env([-1,1,-1], [0.1,0.5]), \\trig.tr);
	renv=EnvGen.kr(Env([1,0.001,0.1], [1,0.5]), \\trig.tr);

	
	sig=BPF.ar(GrayNoise.ar([0.1,0.2,0.5,0.7]),fenv,renv)+LFPulse.ar([2,3]);
	sig*env;
};
)" ], [ 1118.3530917, 'kof', "~crack.clear;" ], [ 1115.0402957, 'kof', "(
~crack.quant=2;
~crack.fadeTime=0.2;
~crack={
  //         |       |       |       |       |  
  var pat = [1,0,0,0,1,0,0,0,1,0,0,0,1,0,0,0].rotate(3);
  var imp = PulseDivider.kr(~tick.kr,2,~counter.kr);
  var hit = Select.kr(PulseCount.kr(imp)%pat.size,pat);
  var env = EnvGen.ar(Env([0.001,1,0.001],[0.002,0.05+LFSaw.kr(~tempo/4)],[3,-3],curve:'exp'),imp * hit);
  var sig = Crackle.ar([0.2,0.3,0.4,0.5]+(env**40));
  sig = sig * env;
  Splay.ar(sig,0.75,0.5);
};
~crack.play;
);" ], [ 1114.5869872, 'joach', "(
~jDrum[7] = \\set -> QuantEnv(\\lpf_freq, 32)
.phase(1, [800,2100,80], [32.05, 0.95], [2,-2], 0, 1)
.phase(2, [0,1,0], [0.35, 0.65], [2,-2], 0, 1)
.play([1]);
)" ], [ 1104.0319387, 'alex', "(~f[0]={
	var sig, env, fenv, penv, renv;
	
	env=EnvGen.kr(Env([0,1,0.5,0], [0.1,0.5,1.5],[\\welch,\\step]), \\trig.tr);
	fenv=EnvGen.kr(Env([\\freq.kr, \\freq.kr*3, \\freq.kr], [0.01,0.5]), \\trig.tr);
	penv=EnvGen.kr(Env([-1,1,-1], [0.1,0.5]), \\trig.tr);
	renv=EnvGen.kr(Env([1,0.001,0.1], [1,0.5]), \\trig.tr);

	
	sig=BPF.ar(GrayNoise.ar([0.1,0.2,0.5,0.7]),fenv,renv)+LFPulse.ar([2,3]).lag([0.001,0.002,0.003]);
	sig*env;
};
)" ], [ 1094.5260061, 'kof', "(
~crack.quant=2;
~crack.fadeTime=0.2;
~crack={
  //         |       |       |       |       |  
  var pat = [1,0,0,0,1,0,0,0,1,0,0,0,1,0,0,0].rotate(3);
  var imp = PulseDivider.kr(~tick.kr,2,~counter.kr);
  var hit = Select.kr(PulseCount.kr(imp)%pat.size,pat);
  var env = EnvGen.ar(Env([0.001,1,0.001],[0.002,0.05],[3,-3],curve:'exp'),imp * hit);
  var sig = Crackle.ar([0.2,0.3,0.4,0.5]+(env**40));
  sig = sig * env;
  Splay.ar(sig,0.75,0.5);
};
~crack.play;
);" ], [ 1080.5401681, 'kof', "(
~crack.quant=2;
~crack.fadeTime=0.2;
~crack={
  //         |       |       |       |       |  
  var pat = [1,0,0,0,1,0,0,0,1,0,0,0,1,0,0,0].rotate(3);
  var imp = PulseDivider.kr(~tick.kr,4,~counter.kr);
  var hit = Select.kr(PulseCount.kr(imp)%pat.size,pat);
  var env = EnvGen.ar(Env([0.001,1,0.001],[0.002,0.05],[3,-3],curve:'exp'),imp * hit);
  var sig = Crackle.ar([0.2,0.3,0.4,0.5]+(env**40));
  sig = sig * env;
  Splay.ar(sig,0.75,0.5);
};
~crack.play;
);" ], [ 1076.7071146, 'alex', "(~f[0]={
	var sig, env, fenv, penv, renv;
	
	env=EnvGen.kr(Env([0,1,0.5,0], [0.1,0.5,1.5],[\\welch,\\step]), \\trig.tr);
	fenv=EnvGen.kr(Env([\\freq.kr, \\freq.kr*3, \\freq.kr], [0.01,0.5]), \\trig.tr);
	penv=EnvGen.kr(Env([-1,1,-1], [0.1,0.5]), \\trig.tr);
	renv=EnvGen.kr(Env([1,0.001,0.1], [1,0.5]), \\trig.tr);

	
	sig=BPF.ar(GrayNoise.ar([0.1,0.2,0.5,0.7]),fenv,renv)+LFPulse.ar(fenv!4).lag([0.001,0.002,0.003]);
	sig*env;
};
)" ], [ 1075.1595782, 'joach', "~jDrum[4] = \\filter -> {|in| LPF.ar(in, \\lpf_freq.kr(800,8)) };" ], [ 1051.3808713, 'joach', "(
~jDrum[3] = \\set -> QuantEnv(\\noise, 16)
.phase(1, [0,0.3,0], [15.05, 0.95], [2,-2], 0, 1)
.phase(2, [0,1,0], [0.35, 0.65], [2,-2], 0, 1)
.play([1]);
)" ], [ 1032.0905018, 'kof', "(
~kick.quant=2;
~kick.fadeTime=0.2;
~kick={
  //         |       |       |       |       |  
  var pat = [1,0,0,0,1,1,0,0,1,0,0,0,1,1,0,0].rotate(1);
  var imp = PulseDivider.kr(~tick.kr,4,~counter.kr);
  var hit = Select.kr(PulseCount.kr(imp)%pat.size,pat);
  var env = EnvGen.ar(Env([0.001,1,0.001],[0.002,0.75],[3,-3],curve:'exp'),imp * hit);
  var sig = SinOsc.ar(50+(env**100*400));
  sig = sig * env;
  Splay.ar(sig,0.75,0.75);
};
~kick.play;
);" ], [ 1031.5262832, 'alex', "(~f[2]=\\set-> Pbind(\\args, [\\freq], \\dur, 4, \\octave, Pseq([[2,3],[1,3],[2,3,1]],inf), 
\\degree, Pseq([[4,2,3], [5,7,2]],inf) );)" ], [ 1009.8751238, 'kof', "(
~kick.quant=2;
~kick.fadeTime=0.2;
~kick={
  //         |       |       |       |       |  
  var pat = [1,0,0,0,1,1,0,0,1,0,0,0,1,1,0,0].rotate(1);
  var imp = PulseDivider.kr(~tick.kr,4,~counter.kr);
  var hit = Select.kr(PulseCount.kr(imp)%pat.size,pat);
  var env = EnvGen.ar(Env([0.001,1,0.001],[0.002,0.75],[3,-3],curve:'exp'),imp * hit);
  var sig = SinOsc.ar(50+(env**100*400));
  sig = sig * env;
  Splay.ar(sig,0.75,0.5);
};
~kick.play;
);" ], [ 954.4286127, 'kof', "(
~kick.quant=2;
~kick.fadeTime=0.2;
~kick={
  //         |       |       |       |       |  
  var pat = [1,0,0,0,1,0,0,0,1,0,0,0,1,0,0,0].rotate(1);
  var imp = PulseDivider.kr(~tick.kr,4,~counter.kr);
  var hit = Select.kr(PulseCount.kr(imp)%pat.size,pat);
  var env = EnvGen.ar(Env([0.001,1,0.001],[0.002,0.75],[3,-3],curve:'exp'),imp * hit);
  var sig = SinOsc.ar(50+(env**100*400));
  sig = sig * env;
  Splay.ar(sig,0.75,0.5);
};
~kick.play;
);" ], [ 942.1255373, 'kof', "(
~kick.quant=2;
~kick.fadeTime=0.2;
~kick={
  //         |       |       |       |       |  
  var pat = [1,0,0,0,1,0,0,0,1,0,0,0,1,0,0,0].rotate(1);
  var imp = PulseDivider.kr(~tick.kr,4,~counter.kr);
  var hit = Select.kr(PulseCount.kr(imp)%pat.size,pat);
  var env = EnvGen.ar(Env([0.001,1,0.001],[0.002,0.75],[3,-3],curve:'exp'),imp * hit);
  var sig = SinOsc.ar(50*(env**100*400));
  sig = sig * env;
  Splay.ar(sig,0.75,0.5);
};
~kick.play;
);" ], [ 937.5608638, 'alex', "~f.scope;" ], [ 921.5502824, 'joach', "(
~jDrum[2] = \\set -> QuantEnv(\\fplus, 2)
.phase(1, [0,100,0], [0.05, 0.015], [8,-2], 0, 4)
.phase(2, [0,[170,220],0], [0.035, 0.065], [8,-2], 0, 1)
.phase(3, [0,[470!3,2020],0], [0.035, 0.065], [8,-2], 0, 1)
.play([1,2,1,3]);
)" ], [ 918.0895491, 'alex', "~f.play(vol:0.1, fadeTime:2);" ], [ 914.813442, 'alex', "~f[30]=\\filter-> {arg in; Limiter.ar(GVerb.ar(in,40),0.5)};" ], [ 913.3834432, 'alex', "(~f[2]=\\set-> Pbind(\\args, [\\freq], \\dur, 4, \\octave, Pseq([[4,3],[5,2],[6,3]],inf), 
\\degree, Pseq([[4,2,3], [5,7,2]],inf) );)" ], [ 912.293771, 'alex', "~f[1]=\\set-> Pbind(\\args, [\\trig], \\dur, 4, \\trig,1);" ], [ 909.7701993, 'joach', "(
~jDrum[1] = \\set -> QuantEnv(\\amp, 8)
.phase(1, [0.2,1,0.6,0.2], [0.05, 0.25, 7.65], [8,-2, -8], 0, 4)
.phase(2, [0.2,1,0.2], [3.35, 4.65], [2,-2], 0, 1)
.play([1,2]);
)" ], [ 909.5630836, 'alex', "(~f[0]={
	var sig, env, fenv, penv, renv;
	
	env=EnvGen.kr(Env([0,1,0.5,0], [0.1,0.5,1.5],[\\welch,\\step]), \\trig.tr);
	fenv=EnvGen.kr(Env([\\freq.kr, \\freq.kr*3, \\freq.kr], [0.01,0.5]), \\trig.tr);
	penv=EnvGen.kr(Env([-1,1,-1], [0.1,0.5]), \\trig.tr);
	
	sig=HPF.ar(GrayNoise.ar([0.1,0.2,0.5,0.7]),fenv)+LFPulse.ar(fenv!4).lag([0.001,0.002,0.003]);
	sig*env;
};
)" ], [ 908.4667908, 'joach', "(
~jDrum[0] = {
var osc = SinOsc.ar(( \\freq.kr(100) + \\fplus.kr(0) ), mul: 1, add: 0);
var noise = BrownNoise.ar(\\noise.kr(0), (1 - \\noise.kr(0)));
var sig = osc * noise;
Pan2.ar( sig * \\amp.kr(0), \\pan.kr(0) );
};
)" ], [ 907.5761837, 'joach', "~jDrum.play(vol: 0.4, fadeTime: 8);" ], [ 906.2752156, 'alex', "~f.clear;" ], [ 903.3412064, 'kof', "(
  p.clock.tempo_(240/60);
  
  ~offset = (0..7)/8;
  
  ~tick.quant = 1;
  ~tick = {Mix(Impulse.kr( ~tempo / 2 , ~offset ))};
  
  ~counter = {PulseCount.kr(~tick.kr)};
);" ], [ 902.4818163, 'joach', "(
~jDrum[1] = \\set -> QuantEnv(\\amp, 8)
.phase(1, [0.2,1,0.6,0.2], [0.05, 0.25, 7.65], [8,-2, -8], 0, 4)
.phase(2, [0.2,1,0.2], [3.35, 4.65], [2,-2], 0, 1)
.play([1,2]);
)" ], [ 901.9025526, 'alex', "~f[1]=\\set-> Pbind(\\args, [\\trig], \\dur, 4, \\trig,1);" ], [ 899.9329983, 'alex', "(~f[2]=\\set-> Pbind(\\args, [\\freq], \\dur, 4, \\octave, Pseq([[4,3],[5,2],[6,3]],inf), 
\\degree, Pseq([[4,2,3], [5,7,2]],inf) );)" ], [ 899.7146775, 'kof', "(
  p=ProxySpace.push(s.boot);
  p.makeTempoClock;
);" ], [ 897.3563789, 'alex', "~f[30]=\\filter-> {arg in; Limiter.ar(GVerb.ar(in,40),0.5)};" ], [ 893.9796873, 'joach', "(
~jDrum[1] = \\set -> QuantEnv(\\amp, 8)
.phase(1, [0.2,1,0.6,0.2], [0.05, 0.25, 7.65], [8,-2, -8], 0, 4)
.phase(2, [0.2,1,0.2], [3.35, 4.65], [2,-2], 0, 1)
.play([1,2]);
)" ], [ 892.4013972, 'joach', "(
~jDrum[0] = {
var osc = SinOsc.ar(( \\freq.kr(100) + \\fplus.kr(0) ), mul: 1, add: 0);
var noise = BrownNoise.ar(\\noise.kr(0), (1 - \\noise.kr(0)));
var sig = osc * noise;
Pan2.ar( sig * \\amp.kr(0), \\pan.kr(0) );
};
)" ], [ 891.3232636, 'joach', "~jDrum.play(vol: 0.4, fadeTime: 8);" ], [ 890.0730592, 'joach', "p.clock.tempo_(240/60);" ], [ 889.7290779, 'joach', "p = ProxySpace.push(s).makeTempoClock;" ], [ 886.4818247, 'joach', "(
~jDrum[1] = \\set -> QuantEnv(\\amp, 8)
.phase(1, [0.2,1,0.6,0.2], [0.05, 0.25, 7.65], [8,-2, -8], 0, 4)
.phase(2, [0.2,1,0.2], [3.35, 4.65], [2,-2], 0, 1)
.play([1,2]);
)" ], [ 885.9974005, 'kof', "  ~offset = (0..7)/8;" ], [ 859.8265963, 'alex', "~f.clear;" ], [ 855.8069488, 'alex', "~f[1]=\\set-> Pbind(\\args, [\\trig], \\dur, 4, \\trig,1);" ], [ 852.5623423, 'alex', "(~f[0]={
	var sig, env, fenv, penv, renv;
	
	env=EnvGen.kr(Env([0,1,0.5,0], [0.1,0.5,1.5],[\\welch,\\step]), \\trig.tr);
	fenv=EnvGen.kr(Env([\\freq.kr, \\freq.kr*3, \\freq.kr], [0.01,0.5]), \\trig.tr);
	penv=EnvGen.kr(Env([-1,1,-1], [0.1,0.5]), \\trig.tr);
	
	sig=HPF.ar(GrayNoise.ar([1,2,0.5,0.7]),fenv)+LFPulse.ar(fenv!4).lag([0.001,0.002,0.003]);
	sig*env;
};
)" ], [ 848.6241113, 'alex', "~f.play(vol:0.1, fadeTime:2);" ], [ 807.4327975, 'alex', "~f.clear;" ], [ 799.2165928, 'alex', "~f[1]=\\set-> Pbind(\\args, [\\trig], \\dur, 4, \\trig,1);" ], [ 789.3727877, 'joach', "(
~jDrum[2] = \\set -> QuantEnv(\\fplus, 2)
.phase(1, [0,100,0], [0.05, 0.015], [8,-2], 0, 4)
.phase(2, [0,[170,220],0], [0.035, 0.065], [8,-2], 0, 1)
.phase(3, [0,[470!3,2020],0], [0.035, 0.065], [8,-2], 0, 1)
.play([1,2,1,3]);
)" ], [ 779.8282944, 'joach', "(
~jDrum[2] = \\set -> QuantEnv(\\fplus, 1)
.phase(1, [0,100,0], [0.05, 0.015], [8,-2], 0, 4)
.phase(2, [0,[170,220],0], [0.035, 0.065], [8,-2], 0, 1)
.phase(3, [0,[470!3,2020],0], [0.035, 0.065], [8,-2], 0, 1)
.play([1,2,1,3]);
)" ], [ 760.3563537, 'alex', "~f[30]=\\filter-> {arg in; GVerb.ar(in,40)};" ], [ 758.6175953, 'alex', "(~f[2]=\\set-> Pbind(\\args, \\freq, \\dur, 4, \\octave, Pseq([[4,3],[5,2],[6,3]],inf), 
\\degree, Pseq([[4,2,3], [5,7,2]],inf) );)" ], [ 756.8530947, 'alex', "~f[1]=\\set-> Pbind(\\args, \\trig, \\dur, 4, \\trig,1);" ], [ 754.2338265, 'alex', "(~f[0]={
	var sig, env, fenv, penv, renv;
	
	env=EnvGen.kr(Env([0,1,0.5,0], [0.1,0.5,1.5],[\\welch,\\step]), \\trig.tr);
	fenv=EnvGen.kr(Env([\\freq.kr, \\freq.kr*3, \\freq.kr], [0.01,0.5]), \\trig.tr);
	penv=EnvGen.kr(Env([-1,1,-1], [0.1,0.5]), \\trig.tr);
	
	sig=HPF.ar(GrayNoise.ar([1,2,0.5,0.7]),fenv)+LFPulse.ar(fenv!4).lag([0.001,0.002,0.003]);
	sig*env;
};
)" ], [ 753.2477309, 'alex', "~f.scope;" ], [ 752.0434573, 'alex', "~f.play(vol:5, fadeTime:2);" ], [ 751.0603985, 'alex', "~f.scope;" ], [ 639.9091264, 'joach', "~jDrum.stop(16);" ], [ 619.0475693, 'joach', "~jDrum.play(vol: 0.4, fadeTime: 8);" ], [ 607.311787, 'joach', "(
~jDrum[6] = \\set -> QuantEnv(\\mulgverb, 1)
.phase(1, [0.5,1,0.5], [0.05, 0.95], [2,-2], 0, 1)
.phase(2, [0,1,0], [0.35, 0.65], [2,-2], 0, 1)
.play([1]);
)" ], [ 606.092855, 'joach', "(
~jDrum[6] = \\set -> QuantEnv(\\mulgverb, 1)
.phase(1, [0.5,1,0.5], [0.05, 0.95], [2,-2], 0, 1)
.phase(2, [0,1,0], [0.35, 0.65], [2,-2], 0, 1)
.play([1,2]);
)" ], [ 601.8737354, 'kof', "(
~high.quant=2;
~high.fadeTime=0.2;
~high={
  //         |       |       |       |       |  
  var pat = [1,0,0,0,1,0,0,0,1,0,0,0,1,1,1,1].rotate(1);
  var imp = PulseDivider.kr(~tick.kr,fib(4),~counter.kr);
  var hit = Select.kr(PulseCount.kr(imp)%pat.size,pat);
  var env = EnvGen.ar(Env([0.001,1,0.001],[0.002,0.05+[0.1,0.2,0.3,0.5]],[3,-3],curve:'exp'),imp * hit);
  var sig = Crackle.ar([0.2,0.3,0.4,0.7]*(env**8+1));
  sig = sig * env;
  Splay.ar(sig,0.75,0.25);
};
~high.play;
);" ], [ 583.3744229, 'kof', "(
~test.quant=2;
~test.fadeTime=0.2;
~test={
  //         |       |       |       |       |  
  var pat = [1,0,0,0,1,0,0,0,1,0,0,0,1,0,0,0].rotate(1);
  var imp = PulseDivider.kr(~tick.kr,32*fib(4),~counter.kr);
  var hit = Select.kr(PulseCount.kr(imp)%pat.size,pat);
  var env = EnvGen.ar(Env([0.001,1,0.001],[~tempo/400,1.5*~tempo],[3,-3],curve:'exp'),imp * hit);
  var sig = SinOsc.ar([50,100,150,200]/4+LFSaw.ar(~tempo/4).exprange(0.01,10),(1..8)/16*env**4*8pi);
  sig = LPF.ar(sig,1800);
  sig = sig * env;
  Splay.ar(sig,0.75,0.5);
};
~test.play;
);" ], [ 577.393684, 'kof', "(
~test.quant=2;
~test.fadeTime=0.2;
~test={
  //         |       |       |       |       |  
  var pat = [1,0,0,0,1,0,0,0,1,0,0,0,1,0,0,0].rotate(1);
  var imp = PulseDivider.kr(~tick.kr,32*fib(4),~counter.kr);
  var hit = Select.kr(PulseCount.kr(imp)%pat.size,pat);
  var env = EnvGen.ar(Env([0.001,1,0.001],[~tempo/400,3.5*~tempo],[3,-3],curve:'exp'),imp * hit);
  var sig = SinOsc.ar([50,100,150,200]/4+LFSaw.ar(~tempo/4).exprange(0.01,10),(1..8)/16*env**4*8pi);
  sig = LPF.ar(sig,1800);
  sig = sig * env;
  Splay.ar(sig,0.75,0.5);
};
~test.play;
);" ], [ 576.0654095, 'joach', "~jDrum[5] = \\filter -> {|in| GVerb.ar(in, \\gverb_size.kr(12), \\gverb_time.kr(2), 0.9, mul:\\mulgverb.kr(1)) };" ], [ 576.049762, 'kof', "(
~test.quant=2;
~test.fadeTime=0.2;
~test={
  //         |       |       |       |       |  
  var pat = [1,0,0,0,1,0,0,0,1,0,0,0,1,0,0,0].rotate(1);
  var imp = PulseDivider.kr(~tick.kr,32*fib(4),~counter.kr);
  var hit = Select.kr(PulseCount.kr(imp)%pat.size,pat);
  var env = EnvGen.ar(Env([0.001,1,0.001],[~tempo/4,3.5*~tempo],[3,-3],curve:'exp'),imp * hit);
  var sig = SinOsc.ar([50,100,150,200]/4+LFSaw.ar(~tempo/4).exprange(0.01,10),(1..8)/16*env**4*8pi);
  sig = LPF.ar(sig,1800);
  sig = sig * env;
  Splay.ar(sig,0.75,0.5);
};
~test.play;
);" ], [ 575.6435629, 'joach', "(
~jDrum[6] = \\set -> QuantEnv(\\mulgverb, 1)
.phase(1, [0,1,0], [0.05, 0.95], [2,-2], 0, 1)
.phase(2, [0,1,0], [0.35, 0.65], [2,-2], 0, 1)
.play([1,2]);
)" ], [ 566.3486102, 'kof', "(
~test.quant=2;
~test.fadeTime=0.2;
~test={
  //         |       |       |       |       |  
  var pat = [1,0,0,0,1,0,0,0,1,0,0,0,1,0,0,0].rotate(1);
  var imp = PulseDivider.kr(~tick.kr,32*fib(4),~counter.kr);
  var hit = Select.kr(PulseCount.kr(imp)%pat.size,pat);
  var env = EnvGen.ar(Env([0.001,1,0.001],[~tempo,3.5*~tempo],[3,-3],curve:'exp'),imp * hit);
  var sig = SinOsc.ar([50,100,150,200]/4+LFSaw.ar(~tempo/4).exprange(0.01,10),(1..8)/16*env**4*8pi);
  sig = LPF.ar(sig,1800);
  sig = sig * env;
  Splay.ar(sig,0.75,0.5);
};
~test.play;
);" ], [ 559.5668718, 'kof', "(
~test.quant=2;
~test.fadeTime=0.2;
~test={
  //         |       |       |       |       |  
  var pat = [1,0,0,0,1,0,0,0,1,0,0,0,1,0,0,0].rotate(1);
  var imp = PulseDivider.kr(~tick.kr,32*fib(4),~counter.kr);
  var hit = Select.kr(PulseCount.kr(imp)%pat.size,pat);
  var env = EnvGen.ar(Env([0.001,1,0.001],[~tempo,3.5*~tempo],[3,-3],curve:'exp'),imp * hit);
  var sig = Pulse.ar([50,100,150,200]/4+LFSaw.ar(~tempo/4).exprange(0.01,10),(1..8)/16*env**4*8pi);
  sig = LPF.ar(sig,1800);
  sig = sig * env;
  Splay.ar(sig,0.75,0.5);
};
~test.play;
);" ], [ 554.8165621, 'kof', "(
~test.quant=2;
~test.fadeTime=0.2;
~test={
  //         |       |       |       |       |  
  var pat = [1,0,0,0,1,0,0,0,1,0,0,0,1,0,0,0].rotate(1);
  var imp = PulseDivider.kr(~tick.kr,32*fib(4),~counter.kr);
  var hit = Select.kr(PulseCount.kr(imp)%pat.size,pat);
  var env = EnvGen.ar(Env([0.001,1,0.001],[~tempo,3.5*~tempo],[3,-3],curve:'exp'),imp * hit);
  var sig = Pulse.ar([50,100,150,200]/2+LFSaw.ar(~tempo/4).exprange(0.01,10),(1..8)/16*env**4*8pi);
  sig = LPF.ar(sig,1800);
  sig = sig * env;
  Splay.ar(sig,0.75,0.5);
};
~test.play;
);" ], [ 544.014086, 'kof', "(
~high.quant=2;
~high.fadeTime=0.2;
~high={
  //         |       |       |       |       |  
  var pat = [1,0,0,0,1,0,0,0,1,0,0,0,1,1,1,1].rotate(1);
  var imp = PulseDivider.kr(~tick.kr,fib(4),~counter.kr);
  var hit = Select.kr(PulseCount.kr(imp)%pat.size,pat);
  var env = EnvGen.ar(Env([0.001,1,0.001],[0.002,0.05+[0.1,0.2,0.3,0.5]],[3,-3],curve:'exp'),imp * hit);
  var sig = Crackle.ar([0.2,0.3,0.4,0.7]+(env**8));
  sig = sig * env;
  Splay.ar(sig,0.75,0.25);
};
~high.play;
);" ], [ 540.0605893, 'kof', "(
~ff.quant=1;
~ff.fadeTime=1;
~ff={
  var high,mid,low;
  var sig = ~high + ~test;
  
  sig = GVerb.ar(LPF.ar(sig,500)+HPF.ar(sig,500),40,[3,4,5,6],spread:[40,90])/8 + sig;
  low = CompanderD.ar(LPF.ar(sig,400),3/4,1/3,1/2);
  mid = CompanderD.ar(BPF.ar(sig,600,2),3/4,1/2,1/2);
  high = CompanderD.ar(HPF.ar(sig,900),3/4,1/3,1/2);
  sig = CompanderD.ar((high+mid+low).flat,3/4,1/1.1,1/1.1);
  Splay.ar(sig,0.75,0.25);
};
~ff.play;
);" ], [ 538.0269697, 'kof', "(
~ff.quant=1;
~ff.fadeTime=1;
~ff={
  var high,mid,low;
  var sig = ~high + ~test;
  
  sig = GVerb.ar(LPF.ar(sig,500)+HPF.ar(sig,500),40,[3,4,5,6],spread:[40,90])/8 + sig;
  low = CompanderD.ar(LPF.ar(sig,400),3/4,1/3,1/2);
  mid = CompanderD.ar(BPF.ar(sig,600,2),3/4,1/2,1/2);
  high = CompanderD.ar(HPF.ar(sig,900),3/4,1/2,1/2);
  sig = CompanderD.ar((high+mid+low).flat,3/4,1/1.1,1/1.1);
  Splay.ar(sig,0.75,0.25);
};
~ff.play;
);" ], [ 537.6534272, 'alex', "(~d[2]=\\set-> Pbind(\\args, \\freq, \\dur, 4, \\octave, Pseq([[4,3],[5,2],[6,3]],inf), 
\\degree, Pseq([[4,2,3], [5,7,2]],inf) );)" ], [ 535.0187961, 'alex', "~d[1]=\\set-> Pbind(\\args, \\trig, \\dur, 4, \\trig,1);" ], [ 533.4768883, 'kof', "(
~ff.quant=1;
~ff.fadeTime=1;
~ff={
  var high,mid,low;
  var sig = ~high + ~test;
  
  sig = GVerb.ar(LPF.ar(sig,500)+HPF.ar(sig,500),40,[3,4,5,6],spread:[40,90])/8 + sig;
  low = CompanderD.ar(LPF.ar(sig,400),3/4,1/2,1/2);
  mid = CompanderD.ar(BPF.ar(sig,600,2),3/4,1/2,1/2);
  high = CompanderD.ar(HPF.ar(sig,900),3/4,1/2,1/2);
  sig = CompanderD.ar((high+mid+low).flat,3/4,1/1.1,1/1.1);
  Splay.ar(sig,0.75,0.25);
};
~ff.play;
);" ], [ 532.269022, 'alex', "(~d[0]={
	var sig, env, fenv, penv, renv;
	
	env=EnvGen.kr(Env([0,1,0.5,0], [0.1,0.5,1.5],[\\welch,\\step]), \\trig.tr);
	fenv=EnvGen.kr(Env([\\freq.kr, \\freq.kr*3, \\freq.kr], [0.01,0.5]), \\trig.tr);
	penv=EnvGen.kr(Env([-1,1,-1], [0.1,0.5]), \\trig.tr);
	renv=EnvGen.kr(Env([1,0.001,0.1], [1,0.5]), \\trig.tr);
	
	sig=BPF.ar(WhiteNoise.ar([1,0.5,2,0.7,0.6])+GrayNoise.ar(0.2),freq:fenv,rq:renv);
	sig*env;
};
)" ], [ 527.4530547, 'alex', "~d.play(vol:5, fadeTime:2);" ], [ 526.4911497, 'kof', "(
~test.quant=2;
~test.fadeTime=0.2;
~test={
  //         |       |       |       |       |  
  var pat = [1,0,0,0,1,0,0,0,1,0,0,0,1,0,0,0].rotate(1);
  var imp = PulseDivider.kr(~tick.kr,32*fib(4),~counter.kr);
  var hit = Select.kr(PulseCount.kr(imp)%pat.size,pat);
  var env = EnvGen.ar(Env([0.001,1,0.001],[~tempo,3.5*~tempo],[3,-3],curve:'exp'),imp * hit);
  var sig = Pulse.ar([50,100,150,200]/2+LFSaw.ar(~tempo/4).exprange(0.01,100),(1..8)/16*env**4*8pi);
  sig = LPF.ar(sig,1800);
  sig = sig * env;
  Splay.ar(sig,0.75,0.5);
};
~test.play;
);" ], [ 523.6197068, 'alex', "~d.scope;" ], [ 519.3027209, 'kof', "(
~test.quant=2;
~test.fadeTime=0.2;
~test={
  //         |       |       |       |       |  
  var pat = [1,0,0,0,1,0,0,0,1,0,0,0,1,0,0,0].rotate(1);
  var imp = PulseDivider.kr(~tick.kr,32*fib(4),~counter.kr);
  var hit = Select.kr(PulseCount.kr(imp)%pat.size,pat);
  var env = EnvGen.ar(Env([0.001,1,0.001],[~tempo,3.5*~tempo],[3,-3],curve:'exp'),imp * hit);
  var sig = Pulse.ar([50,100,150,200]/2+LFSaw.ar(~tempo/4).exprange(0.01,1000),(1..8)/16*env**4*8pi);
  sig = LPF.ar(sig,1800);
  sig = sig * env;
  Splay.ar(sig,0.75,0.5);
};
~test.play;
);" ], [ 512.3369208, 'alex', "~d.play(vol:45, fadeTime:2);" ], [ 511.3958105, 'kof', "(
~ff.quant=1;
~ff.fadeTime=1;
~ff={
  var high,mid,low;
  var sig = ~high + ~test;
  
  sig = GVerb.ar(LPF.ar(sig,500)+HPF.ar(sig,500),20,[3,4,5,6],spread:[40,90])/8 + sig;
  low = CompanderD.ar(LPF.ar(sig,400),3/4,1/2,1/2);
  mid = CompanderD.ar(BPF.ar(sig,600,2),3/4,1/2,1/2);
  high = CompanderD.ar(HPF.ar(sig,900),3/4,1/2,1/2);
  sig = CompanderD.ar((high+mid+low).flat,3/4,1/1.1,1/1.1);
  Splay.ar(sig,0.75,0.25);
};
~ff.play;
);" ], [ 505.2236202, 'kof', "(
~high.quant=2;
~high.fadeTime=0.2;
~high={
  //         |       |       |       |       |  
  var pat = [1,0,0,0,1,0,0,0,1,0,0,0,1,1,1,1].rotate(1);
  var imp = PulseDivider.kr(~tick.kr,fib(4),~counter.kr);
  var hit = Select.kr(PulseCount.kr(imp)%pat.size,pat);
  var env = EnvGen.ar(Env([0.001,1,0.001],[0.002,0.05+[0.1,0.2,0.3,0.5]],[3,-3],curve:'exp'),imp * hit);
  var sig = Crackle.ar([0.2,0.3,0.4,0.7]+(env**8));
  sig = sig * env;
  Splay.ar(sig,0.75,0.5);
};
~high.play;
);" ], [ 504.4671924, 'alex', "(~d[2]=\\set-> Pbind(\\args, \\freq, \\dur, 4, \\octave, Pseq([[4,3],[5,2],[6,3]],inf), 
\\degree, Pseq([[4,2,3], [5,7,2]],inf) );)" ], [ 503.2640693, 'alex', "~d[1]=\\set-> Pbind(\\args, \\trig, \\dur, 4, \\trig,1);" ], [ 499.9802807, 'alex', "~d.play(vol:15, fadeTime:2);" ], [ 496.4868348, 'alex', "(~d[0]={
	var sig, env, fenv, penv, renv;
	
	env=EnvGen.kr(Env([0,1,0.5,0], [0.1,0.5,1.5],[\\welch,\\step]), \\trig.tr);
	fenv=EnvGen.kr(Env([\\freq.kr, \\freq.kr*3, \\freq.kr], [0.01,0.5]), \\trig.tr);
	penv=EnvGen.kr(Env([-1,1,-1], [0.1,0.5]), \\trig.tr);
	renv=EnvGen.kr(Env([1,0.001,0.1], [1,0.5]), \\trig.tr);
	
	sig=BPF.ar(WhiteNoise.ar([1,0.5,2,0.7,0.6])+GrayNoise.ar(0.2),freq:fenv,rq:renv);
	sig*env;
};
)" ], [ 495.9240825, 'kof', "~ff.clear;" ], [ 492.1114033, 'kof', "~high.clear;" ], [ 490.3136792, 'kof', "(
~high.quant=2;
~high.fadeTime=0.2;
~high={
  //         |       |       |       |       |  
  var pat = [1,0,0,0,1,0,0,0,1,0,0,0,1,1,1,1].rotate(1);
  var imp = PulseDivider.kr(~tick.kr,fib(4),~counter.kr);
  var hit = Select.kr(PulseCount.kr(imp)%pat.size,pat);
  var env = EnvGen.ar(Env([0.001,1,0.001],[0.002,0.05+[0.1,0.2,0.3,0.5]],[3,-3],curve:'exp'),imp * hit);
  var sig = Crackle.ar([0.2,0.3,0.4,0.7]+(env**4*1));
  sig = sig * env;
  Splay.ar(sig,0.75,0.5);
};
~high.play;
);" ], [ 486.8484957, 'kof', "(
~high.quant=2;
~high.fadeTime=0.2;
~high={
  //         |       |       |       |       |  
  var pat = [1,0,0,0,1,0,0,0,1,0,0,0,1,1,1,1].rotate(1);
  var imp = PulseDivider.kr(~tick.kr,fib(4),~counter.kr);
  var hit = Select.kr(PulseCount.kr(imp)%pat.size,pat);
  var env = EnvGen.ar(Env([0.001,1,0.001],[0.002,0.05+[0.1,0.2,0.3,0.5]],[3,-3],curve:'exp'),imp * hit);
  var sig = Crackle.ar([0.2,0.3,0.4,0.7]+(env**4*2));
  sig = sig * env;
  Splay.ar(sig,0.75,0.5);
};
~high.play;
);" ], [ 486.2101263, 'alex', "~d.play(vol:15, fadeTime:2);" ], [ 479.8253441, 'alex', "~d.play(vol:4, fadeTime:2);" ], [ 478.9262364, 'kof', "(
~high.quant=2;
~high.fadeTime=0.2;
~high={
  //         |       |       |       |       |  
  var pat = [1,0,0,0,1,0,0,0,1,0,0,0,1,1,1,1].rotate(1);
  var imp = PulseDivider.kr(~tick.kr,fib(4),~counter.kr);
  var hit = Select.kr(PulseCount.kr(imp)%pat.size,pat);
  var env = EnvGen.ar(Env([0.001,1,0.001],[0.002,0.05+[0.1,0.2,0.3,0.5]],[3,-3],curve:'exp'),imp * hit);
  var sig = Crackle.ar([0.2,0.3,0.4,0.7]+(env**4));
  sig = sig * env;
  Splay.ar(sig,0.75,0.5);
};
~high.play;
);" ], [ 478.0198033, 'joach', "(
~jDrum[2] = \\set -> QuantEnv(\\fplus, 1)
.phase(1, [0,100,0], [0.05, 0.015], [8,-2], 0, 4)
.phase(2, [0,[170,220],0], [0.035, 0.065], [8,-2], 0, 1)
.phase(3, [0,[470!3,220],0], [0.035, 0.065], [8,-2], 0, 1)
.play([1,2,1,3]);
)" ], [ 474.1914781, 'joach', "(
~jDrum[2] = \\set -> QuantEnv(\\fplus, 1)
.phase(1, [0,100,0], [0.05, 0.015], [8,-2], 0, 4)
.phase(2, [0,[170,220],0], [0.035, 0.065], [8,-2], 0, 1)
.phase(3, [0,[470!3,220],0], [0.035, 0.065], [8,-2], 0, 1)
.play([1,2,1,3]);
)" ], [ 473.5884502, 'alex', "(~d[2]=\\set-> Pbind(\\args, \\freq, \\dur, 4, \\octave, Pseq([[4,3],[5,2],[6,3]],inf), 
\\degree, Pseq([[4,2,3], [5,7,2]],inf) );)" ], [ 453.8936227, 'kof', "(
~ff.quant=1;
~ff.fadeTime=1;
~ff={
  var high,mid,low;
  var sig = ~high + ~test;
  
  sig = GVerb.ar(LPF.ar(sig,500)+HPF.ar(sig,500),20,[3,4,5,6],spread:[40,90])/8 + sig;
  low = CompanderD.ar(LPF.ar(sig,400),3/4,1/2,1/2);
  mid = CompanderD.ar(BPF.ar(sig,600,2),3/4,1/2,1/2);
  high = CompanderD.ar(HPF.ar(sig,900),3/4,1/2,1/2);
  sig = CompanderD.ar((high+mid+low).flat,3/4,1/1.1,1/1.1);
  Splay.ar(sig,0.75,0.25);
};
~ff.play;
);" ], [ 446.6899066, 'kof', "(
~ff.quant=1;
~ff.fadeTime=1;
~ff={
  var high,mid,low;
  var sig = ~high;
  
  sig = GVerb.ar(LPF.ar(sig,500)+HPF.ar(sig,500),20,[3,4,5,6],spread:[40,90])/8 + sig;
  low = CompanderD.ar(LPF.ar(sig,400),3/4,1/2,1/2);
  mid = CompanderD.ar(BPF.ar(sig,600,2),3/4,1/2,1/2);
  high = CompanderD.ar(HPF.ar(sig,900),3/4,1/2,1/2);
  sig = CompanderD.ar((high+mid+low).flat,3/4,1/1.1,1/1.1);
  Splay.ar(sig,0.75,0.25);
};
~ff.play;
);" ], [ 443.5047855, 'joach', "(
~jDrum[2] = \\set -> QuantEnv(\\fplus, 1)
.phase(1, [0,100,0], [0.05, 0.015], [2,-2], 0, 4)
.phase(2, [0,[170,220],0], [0.035, 0.065], [2,-2], 0, 1)
.play([1,2]);
)" ], [ 437.6176378, 'joach', "~jDrum[4] = \\filter -> {|in| LPF.ar(in, \\lpf_freq.kr(800,8)) };" ], [ 428.2755931, 'alex', "~d[1]=\\set-> Pbind(\\args, \\trig, \\dur, 4, \\trig,1);" ], [ 425.8809676, 'joach', "(
~jDrum[2] = \\set -> QuantEnv(\\fplus, 0.5)
.phase(1, [0,100,0], [0.05, 0.015], [2,-2], 0, 4)
.phase(2, [0,[170,220],0], [0.035, 0.065], [2,-2], 0, 1)
.play([1,2]);
)" ], [ 425.5461527, 'alex', "(~d[0]={
	var sig, env, fenv, penv, renv;
	
	env=EnvGen.kr(Env([0,1,0.5,0], [0.1,0.5,1.5],[\\welch,\\step]), \\trig.tr);
	fenv=EnvGen.kr(Env([\\freq.kr, \\freq.kr*3, \\freq.kr], [0.01,0.5]), \\trig.tr);
	penv=EnvGen.kr(Env([-1,1,-1], [0.1,0.5]), \\trig.tr);
	renv=EnvGen.kr(Env([1,0.001,0.1], [1,0.5]), \\trig.tr);
	
	sig=BPF.ar(WhiteNoise.ar([1,0.5,2,0.7,0.6])+GrayNoise.ar(0.2),freq:fenv,rq:renv);
	sig*env;
};
)" ], [ 424.3344296, 'kof', "(
~high.quant=2;
~high.fadeTime=0.2;
~high={
  //         |       |       |       |       |  
  var pat = [1,0,0,0,1,0,0,0,1,0,0,0,1,1,1,1].rotate(1);
  var imp = PulseDivider.kr(~tick.kr,fib(4),~counter.kr);
  var hit = Select.kr(PulseCount.kr(imp)%pat.size,pat);
  var env = EnvGen.ar(Env([0.001,1,0.001],[0.002,0.05],[3,-3],curve:'exp'),imp * hit);
  var sig = Crackle.ar(1+(env**4));
  sig = sig * env;
  Splay.ar(sig,0.75,0.5);
};
~high.play;
);" ], [ 417.4350303, 'alex', "~d.scope;" ], [ 415.7902834, 'alex', "~d.play(vol:0.7, fadeTime:2);" ], [ 412.2648465, 'kof', "(
~high.quant=2;
~high.fadeTime=0.2;
~high={
  //         |       |       |       |       |  
  var pat = [1,0,0,0,1,0,0,0,1,0,0,0,1,1,1,1].rotate(1);
  var imp = PulseDivider.kr(~tick.kr,4,~counter.kr);
  var hit = Select.kr(PulseCount.kr(imp)%pat.size,pat);
  var env = EnvGen.ar(Env([0.001,1,0.001],[0.002,0.05],[3,-3],curve:'exp'),imp * hit);
  var sig = Crackle.ar(1+(env**4));
  sig = sig * env;
  Splay.ar(sig,0.75,0.5);
};
~high.play;
);" ], [ 411.0880082, 'alex', "~d.scope;" ], [ 407.0042436, 'kof', "(
~high.quant=2;
~high.fadeTime=0.2;
~high={
  //         |       |       |       |       |  
  var pat = [1,0,0,0,1,0,0,0,1,0,0,0,1,1,1,1].rotate(1);
  var imp = PulseDivider.kr(~tick.kr,4,~counter.kr);
  var hit = Select.kr(PulseCount.kr(imp)%pat.size,pat);
  var env = EnvGen.ar(Env([0.001,1,0.001],[0.002,0.5],[3,-3],curve:'exp'),imp * hit);
  var sig = Crackle.ar(1+(env**4));
  sig = sig * env;
  Splay.ar(sig,0.75,0.5);
};
~high.play;
);" ], [ 406.207412, 'joach', "(
~jDrum[1] = \\set -> QuantEnv(\\amp, 4)
.phase(1, [0.2,1,0.6,0.2], [0.05, 0.95, 1], [8,-2, -8], 0, 4)
.phase(2, [0.2,1,0.2], [3.35, 0.65], [2,-2], 0, 1)
.play([1,2]);
)" ], [ 401.6130961, 'kof', "(
~high.quant=2;
~high.fadeTime=0.2;
~high={
  //         |       |       |       |       |  
  var pat = [1,0,0,0,1,0,0,0,1,0,0,0,1,1,1,1].rotate(1);
  var imp = PulseDivider.kr(~tick.kr,1,~counter.kr);
  var hit = Select.kr(PulseCount.kr(imp)%pat.size,pat);
  var env = EnvGen.ar(Env([0.001,1,0.001],[0.002,0.5],[3,-3],curve:'exp'),imp * hit);
  var sig = Crackle.ar(1+(env**4));
  sig = sig * env;
  Splay.ar(sig,0.75,0.5);
};
~high.play;
);" ], [ 390.4258728, 'kof', "(
~high.quant=2;
~high.fadeTime=0.2;
~high={
  //         |       |       |       |       |  
  var pat = [1,0,0,0,1,0,0,0,1,0,0,0,1,0,0,0].rotate(1);
  var imp = PulseDivider.kr(~tick.kr,1,~counter.kr);
  var hit = Select.kr(PulseCount.kr(imp)%pat.size,pat);
  var env = EnvGen.ar(Env([0.001,1,0.001],[0.002,0.5],[3,-3],curve:'exp'),imp * hit);
  var sig = Crackle.ar(1+(env**4));
  sig = sig * env;
  Splay.ar(sig,0.75,0.5);
};
~high.play;
);" ], [ 379.3179788, 'joach', "(
~jDrum[3] = \\set -> QuantEnv(\\noise, 32)
.phase(1, [0,0.3,0], [31.05, 0.95], [2,-2], 0, 1)
.phase(2, [0,1,0], [0.35, 0.65], [2,-2], 0, 1)
.play([1]);
)" ], [ 346.3968648, 'kof', "(
~test.quant=2;
~test.fadeTime=0.2;
~test={
  //         |       |       |       |       |  
  var pat = [1,0,0,0,1,0,0,0,1,0,0,0,1,0,0,0].rotate(1);
  var imp = PulseDivider.kr(~tick.kr,32*fib(4),~counter.kr);
  var hit = Select.kr(PulseCount.kr(imp)%pat.size,pat);
  var env = EnvGen.ar(Env([0.001,1,0.001],[~tempo,3.5*~tempo],[3,-3],curve:'exp'),imp * hit);
  var sig = Pulse.ar([50,100,150,200]+LFSaw.ar(~tempo/4).exprange(0.01,1000),(1..8)/16*env**4*8pi);
  sig = LPF.ar(sig,1800);
  sig = sig * env;
  Splay.ar(sig,0.75,0.5);
};
~test.play;
);" ], [ 342.3593376, 'kof', "(
~test.quant=2;
~test.fadeTime=0.2;
~test={
  //         |       |       |       |       |  
  var pat = [1,0,0,0,1,0,0,0,1,0,0,0,1,0,0,0].rotate(1);
  var imp = PulseDivider.kr(~tick.kr,16*fib(4),~counter.kr);
  var hit = Select.kr(PulseCount.kr(imp)%pat.size,pat);
  var env = EnvGen.ar(Env([0.001,1,0.001],[~tempo,3.5*~tempo],[3,-3],curve:'exp'),imp * hit);
  var sig = Pulse.ar([50,100,150,200]+LFSaw.ar(~tempo/4).exprange(0.01,1000),(1..8)/16*env**4*8pi);
  sig = LPF.ar(sig,1800);
  sig = sig * env;
  Splay.ar(sig,0.75,0.5);
};
~test.play;
);" ], [ 334.6711059, 'joach', "(
~jDrum[1] = \\set -> QuantEnv(\\amp, 4)
.phase(1, [0.2,1,0.6,0.2], [0.05, 0.95, 2], [8,-2, -8], 0, 4)
.phase(2, [0.2,1,0.2], [3.35, 0.65], [2,-2], 0, 1)
.play([1,2]);
)" ], [ 334.3585683, 'kof', "(
~test.quant=2;
~test.fadeTime=0.2;
~test={
  //         |       |       |       |       |  
  var pat = [1,0,0,0,1,0,0,0,1,0,0,0,1,0,0,0].rotate(1);
  var imp = PulseDivider.kr(~tick.kr,16*fib(4),~counter.kr);
  var hit = Select.kr(PulseCount.kr(imp)%pat.size,pat);
  var env = EnvGen.ar(Env([0.001,1,0.001],[~tempo,3.5],[3,-3],curve:'exp'),imp * hit);
  var sig = Pulse.ar([50,100,150,200]+LFSaw.ar(~tempo/4).exprange(0.01,1000),(1..8)/16*env**4*8pi);
  sig = LPF.ar(sig,1800);
  sig = sig * env;
  Splay.ar(sig,0.75,0.5);
};
~test.play;
);" ], [ 318.6113765, 'kof', "(
~test.quant=2;
~test.fadeTime=0.2;
~test={
  //         |       |       |       |       |  
  var pat = [1,0,0,0,1,0,0,0,1,0,0,0,1,0,0,0].rotate(1);
  var imp = PulseDivider.kr(~tick.kr,16*fib(4),~counter.kr);
  var hit = Select.kr(PulseCount.kr(imp)%pat.size,pat);
  var env = EnvGen.ar(Env([0.001,1,0.001],[1.002,3.5],[3,-3],curve:'exp'),imp * hit);
  var sig = Pulse.ar([50,100,150,200]+LFSaw.ar(~tempo/4).exprange(0.01,1000),(1..8)/16*env**4*8pi);
  sig = LPF.ar(sig,1800);
  sig = sig * env;
  Splay.ar(sig,0.75,0.5);
};
~test.play;
);" ], [ 306.2178077, 'joach', "(
~jDrum[2] = \\set -> QuantEnv(\\fplus, 1)
.phase(1, [0,100,0], [0.05, 0.015], [2,-2], 0, 4)
.phase(2, [0,[170,220],0], [0.035, 0.065], [2,-2], 0, 1)
.play([1,2]);
)" ], [ 306.0302508, 'kof', "(
~test.quant=2;
~test.fadeTime=0.2;
~test={
  //         |       |       |       |       |  
  var pat = [1,0,0,0,1,0,0,0,1,0,0,0,1,0,0,0].rotate(1);
  var imp = PulseDivider.kr(~tick.kr,16*fib(4),~counter.kr);
  var hit = Select.kr(PulseCount.kr(imp)%pat.size,pat);
  var env = EnvGen.ar(Env([0.001,1,0.001],[1.002,3.5],[3,-3],curve:'exp'),imp * hit);
  var sig = Pulse.ar([50,100,150,200]+LFSaw.ar(~tempo/4).range(0,1000),(1..8)/16*env**4*8pi);
  sig = LPF.ar(sig,1800);
  sig = sig * env;
  Splay.ar(sig,0.75,0.5);
};
~test.play;
);" ], [ 299.4827974, 'kof', "(
~test.quant=2;
~test.fadeTime=0.2;
~test={
  //         |       |       |       |       |  
  var pat = [1,0,0,0,1,0,0,0,1,0,0,0,1,0,0,0].rotate(1);
  var imp = PulseDivider.kr(~tick.kr,16*fib(4),~counter.kr);
  var hit = Select.kr(PulseCount.kr(imp)%pat.size,pat);
  var env = EnvGen.ar(Env([0.001,1,0.001],[1.002,3.5],[3,-3],curve:'exp'),imp * hit);
  var sig = Pulse.ar([50,100,150,200]+LFSaw.ar(~tempo/4).range(0,10),(1..8)/16*env**4*8pi);
  sig = LPF.ar(sig,1800);
  sig = sig * env;
  Splay.ar(sig,0.75,0.5);
};
~test.play;
);" ], [ 297.7618591, 'joach', "(
~jDrum[2] = \\set -> QuantEnv(\\fplus, 1)
.phase(1, [0,100,0], [0.05, 0.015], [2,-2], 0, 1)
.phase(2, [0,[170,220],0], [0.035, 0.065], [2,-2], 0, 1)
.play([1]);
)" ], [ 278.0944267, 'joach', "~jDrum.play(vol: 0.8, fadeTime: 8);" ], [ 266.828907, 'kof', "(
~test.quant=2;
~test.fadeTime=0.2;
~test={
  //         |       |       |       |       |  
  var pat = [1,0,0,0,1,0,0,0,1,0,0,0,1,0,0,0].rotate(1);
  var imp = PulseDivider.kr(~tick.kr,16*fib(4),~counter.kr);
  var hit = Select.kr(PulseCount.kr(imp)%pat.size,pat);
  var env = EnvGen.ar(Env([0.001,1,0.001],[1.002,3.5],[3,-3],curve:'exp'),imp * hit);
  var sig = SinOsc.ar([50,100,150,200]+LFSaw.ar(~tempo/4).range(0,10),(1..8)/16*env**4*8pi);
  sig = LPF.ar(sig,1800);
  sig = sig * env;
  Splay.ar(sig,0.75,0.5);
};
~test.play;
);" ], [ 263.8755554, 'joach', "(
~jDrum[2] = \\set -> QuantEnv(\\fplus, 1)
.phase(1, [0,100,0], [0.05, 0.015], [2,-2], 0, 1)
.phase(2, [0,1,0], [0.35, 0.65], [2,-2], 0, 1)
.play([1]);
)" ], [ 263.6255557, 'kof', "(
~test.quant=2;
~test.fadeTime=0.2;
~test={
  //         |       |       |       |       |  
  var pat = [1,0,0,0,1,0,0,0,1,0,0,0,1,0,0,0].rotate(1);
  var imp = PulseDivider.kr(~tick.kr,16*fib(4),~counter.kr);
  var hit = Select.kr(PulseCount.kr(imp)%pat.size,pat);
  var env = EnvGen.ar(Env([0.001,1,0.001],[1.002,3.5],[3,-3],curve:'exp'),imp * hit);
  var sig = SinOsc.ar([50,100,150,200]+LFSaw.ar(~tempo/4).range(0,10),(1..8)/16*env**4*8pi);
  //sig = LPF.ar(sig,1800);
  sig = sig * env;
  Splay.ar(sig,0.75,0.5);
};
~test.play;
);" ], [ 258.6720124, 'joach', "(
~jDrum[2] = \\set -> QuantEnv(\\fplus, 1)
.phase(1, [0,1,0], [0.05, 0.015], [2,-2], 0, 1)
.phase(2, [0,1,0], [0.35, 0.65], [2,-2], 0, 1)
.play([1]);
)" ], [ 249.9436595, 'kof', "(
  p.clock.tempo_(240/60);
  
  ~offset = (0..7)/8;
  
  ~tick.quant = 1;
  ~tick = {Mix(Impulse.kr( ~tempo / 2 , ~offset ))};
  
  ~counter = {PulseCount.kr(~tick.kr)};
);" ], [ 243.4919708, 'joach', "~jDrum.play(vol: 0.4, fadeTime: 8);" ], [ 240.8478897, 'kof', "(
~test.quant=2;
~test.fadeTime=0.2;
~test={
  //         |       |       |       |       |  
  var pat = [1,0,0,0,1,0,0,0,1,0,0,0,1,0,0,0].rotate(1);
  var imp = PulseDivider.kr(~tick.kr,16*fib(4),~counter.kr);
  var hit = Select.kr(PulseCount.kr(imp)%pat.size,pat);
  var env = EnvGen.ar(Env([0.001,1,0.001],[1.002,3.5],[3,-3],curve:'exp'),imp * hit);
  var sig = SinOsc.ar([50,100,150,200]+LFSaw.ar(~tempo/4).range(0,10),(1..8)/16*env**4*8pi);
  //sig = LPF.ar(sig,1800);
  sig = sig * env;
  Splay.ar(sig,0.75,0.95);
};
~test.play;
);" ], [ 232.0813643, 'kof', "(
~test.quant=2;
~test.fadeTime=0.2;
~test={
  //         |       |       |       |       |  
  var pat = [1,0,0,0,1,0,0,0,1,0,0,0,1,0,0,0].rotate(1);
  var imp = PulseDivider.kr(~tick.kr,16*fib(4),~counter.kr);
  var hit = Select.kr(PulseCount.kr(imp)%pat.size,pat);
  var env = EnvGen.ar(Env([0.001,1,0.001],[1.002,3.5],[3,-3],curve:'exp'),imp * hit);
  var sig = SinOsc.ar([50,100,150,200]+LFSaw.ar(~tempo/4).range(0,10),(1..8)/16*env**4*8pi);
  //sig = LPF.ar(sig,1800);
  sig = sig * env;
  Splay.ar(sig,0.75,0.5);
};
~test.play;
);" ], [ 226.9887137, 'joach', "(
~jDrum[1] = \\set -> QuantEnv(\\amp, 4)
.phase(1, [0,1,0.6,0], [0.05, 0.95, 2], [8,-2, -8], 0, 4)
.phase(2, [0,1,0], [3.35, 0.65], [2,-2], 0, 1)
.play([1,2]);
)" ], [ 226.5354715, 'kof', "(
~test.quant=2;
~test.fadeTime=0.2;
~test={
  //         |       |       |       |       |  
  var pat = [1,0,0,0,1,0,0,0,1,0,0,0,1,0,0,0].rotate(1);
  var imp = PulseDivider.kr(~tick.kr,16*fib(4),~counter.kr);
  var hit = Select.kr(PulseCount.kr(imp)%pat.size,pat);
  var env = EnvGen.ar(Env([0.001,1,0.001],[1.002,1.5],[3,-3],curve:'exp'),imp * hit);
  var sig = SinOsc.ar([50,100,150,200]+LFSaw.ar(~tempo/4).range(0,10),(1..8)/16*env**4*8pi);
  //sig = LPF.ar(sig,1800);
  sig = sig * env;
  Splay.ar(sig,0.75,0.5);
};
~test.play;
);" ], [ 222.3789394, 'kof', "(
~test.quant=2;
~test.fadeTime=0.2;
~test={
  //         |       |       |       |       |  
  var pat = [1,0,0,0,1,0,0,0,1,0,0,0,1,0,0,0].rotate(1);
  var imp = PulseDivider.kr(~tick.kr,16*fib(4),~counter.kr);
  var hit = Select.kr(PulseCount.kr(imp)%pat.size,pat);
  var env = EnvGen.ar(Env([0.001,1,0.001],[1.002,1.5],[3,-3],curve:'exp'),imp * hit);
  var sig = SinOsc.ar([50,100,150,200]+LFSaw.ar(~tempo/4).range(0,100),(1..8)/16*env**4*8pi);
  //sig = LPF.ar(sig,1800);
  sig = sig * env;
  Splay.ar(sig,0.75,0.5);
};
~test.play;
);" ], [ 216.9408897, 'joach', "(
~jDrum[1] = \\set -> QuantEnv(\\amp, 4)
.phase(1, [0,1,0.6,0], [0.05, 0.95, 2], [8,-2, -8], 0, 4)
.phase(2, [0,1,0], [3.35, 0.65], [2,-2], 0, 1)
.play([1,2]);
)" ], [ 199.8016756, 'kof', "(
~test.quant=2;
~test.fadeTime=0.2;
~test={
  //         |       |       |       |       |  
  var pat = [1,0,0,0,1,0,0,0,1,0,0,0,1,0,0,0].rotate(1);
  var imp = PulseDivider.kr(~tick.kr,16*fib(4),~counter.kr);
  var hit = Select.kr(PulseCount.kr(imp)%pat.size,pat);
  var env = EnvGen.ar(Env([0.001,1,0.001],[1.002,1.5],[3,-3],curve:'exp'),imp * hit);
  var sig = SinOsc.ar([50,100,150,200]+LFSaw.ar(~tempo/4).range(0,1000),(1..8)/16*env**4*8pi);
  //sig = LPF.ar(sig,1800);
  sig = sig * env;
  Splay.ar(sig,0.75,0.5);
};
~test.play;
);" ], [ 197.8797798, 'joach', "~jDrum.play(vol: 0.9, fadeTime: 8);" ], [ 185.6131078, 'joach', "(
~jDrum[1] = \\set -> QuantEnv(\\amp, 4)
.phase(1, [0,1,0.6,0], [0.05, 0.95, 2], [8,-2, -8], 0, 4)
.phase(2, [0,1,0], [0.35, 0.65], [2,-2], 0, 1)
.play([1,2]);
)" ], [ 181.5970652, 'kof', "(
~test.quant=2;
~test.fadeTime=0.2;
~test={
  //         |       |       |       |       |  
  var pat = [1,0,0,0,1,0,0,0,1,0,0,0,1,0,0,0].rotate(1);
  var imp = PulseDivider.kr(~tick.kr,16*fib(4),~counter.kr);
  var hit = Select.kr(PulseCount.kr(imp)%pat.size,pat);
  var env = EnvGen.ar(Env([0.001,1,0.001],[1.002,1.5],[3,-3],curve:'exp'),imp * hit);
  var sig = SinOsc.ar([50,100,150,200]+LFSaw.ar(~tempo/4).range(0,1000),(1..8)/16*env**4*8pi);
  sig = LPF.ar(sig,1800);
  sig = sig * env;
  Splay.ar(sig,0.75,0.5);
};
~test.play;
);" ], [ 179.3654459, 'kof', "(
~test.quant=2;
~test.fadeTime=0.2;
~test={
  //         |       |       |       |       |  
  var pat = [1,0,0,0,1,0,0,0,1,0,0,0,1,0,0,0].rotate(1);
  var imp = PulseDivider.kr(~tick.kr,16*fib(4),~counter.kr);
  var hit = Select.kr(PulseCount.kr(imp)%pat.size,pat);
  var env = EnvGen.ar(Env([0.001,1,0.001],[1.002,1.5],[3,-3],curve:'exp'),imp * hit);
  var sig = SinOsc.ar([50,100,150]+LFSaw.ar(~tempo/4).range(0,1000),(1..8)/16*env**4*8pi);
  sig = LPF.ar(sig,1800);
  sig = sig * env;
  Splay.ar(sig,0.75,0.5);
};
~test.play;
);" ], [ 178.459051, 'joach', "(
~jDrum[1] = \\set -> QuantEnv(\\amp, 4)
.phase(1, [0,1,0.6,0], [0.05, 0.95, 2], [8,-2, \\sin], 0, 4)
.phase(2, [0,1,0], [0.35, 0.65], [2,-2], 0, 1)
.play([1,2]);
)" ], [ 168.9581956, 'kof', "(
~test.quant=2;
~test.fadeTime=0.2;
~test={
  //         |       |       |       |       |  
  var pat = [1,0,0,0,1,0,0,0,1,0,0,0,1,0,0,0].rotate(1);
  var imp = PulseDivider.kr(~tick.kr,16*fib(4),~counter.kr);
  var hit = Select.kr(PulseCount.kr(imp)%pat.size,pat);
  var env = EnvGen.ar(Env([0.001,1,0.001],[1.002,1.5],[3,-3],curve:'exp'),imp * hit);
  var sig = SinOsc.ar(50+LFSaw.ar(~tempo/4).range(0,1000),(1..8)/16*env**4*8pi);
  sig = LPF.ar(sig,1800);
  sig = sig * env;
  Splay.ar(sig,0.75,0.5);
};
~test.play;
);" ], [ 167.1612077, 'kof', "(
~test.quant=2;
~test.fadeTime=0.2;
~test={
  //         |       |       |       |       |  
  var pat = [1,0,0,0,1,0,0,0,1,0,0,0,1,0,0,0].rotate(1);
  var imp = PulseDivider.kr(~tick.kr,16*fib(4),~counter.kr);
  var hit = Select.kr(PulseCount.kr(imp)%pat.size,pat);
  var env = EnvGen.ar(Env([0.001,1,0.001],[1.002,1.5],[3,-3],curve:'exp'),imp * hit);
  var sig = SinOsc.ar(50+LFSaw.ar(~tempo/4).range(0,1000),(1..8)/16*env**4*8pi);
  sig = LPF.ar(sig,1800);
  sig = sig * env;
  Splay.ar(sig,0.75,0.95);
};
~test.play;
);" ], [ 147.7392576, 'joach', "(
~jDrum[1] = \\set -> QuantEnv(\\amp, 4)
.phase(1, [0,1,0.6,0], [0.05, 0.95,2], [8,-2], 0, 4)
.phase(2, [0,1,0], [0.35, 0.65], [2,-2], 0, 1)
.play([1,2]);
)" ], [ 145.3328303, 'kof', "(
~test.quant=2;
~test.fadeTime=0.2;
~test={
  //         |       |       |       |       |  
  var pat = [1,0,0,0,1,0,0,0,1,0,0,0,1,0,0,0].rotate(1);
  var imp = PulseDivider.kr(~tick.kr,16*fib(4),~counter.kr);
  var hit = Select.kr(PulseCount.kr(imp)%pat.size,pat);
  var env = EnvGen.ar(Env([0.001,1,0.001],[1.002,1.5],[3,-3],curve:'exp'),imp * hit);
  var sig = SinOsc.ar(50+LFSaw.ar(~tempo/4).range(0,1000),(1..8)/16*env**4*8pi);
  sig = LPF.ar(sig,800);
  sig = sig * env;
  Splay.ar(sig,0.75,0.5);
};
~test.play;
);" ], [ 142.1604912, 'joach', "(
~jDrum[1] = \\set -> QuantEnv(\\amp, 4)
.phase(1, [0,1,0.6,0], [0.05, 0.95], [8,-2], 0, 4)
.phase(2, [0,1,0], [0.35, 0.65], [2,-2], 0, 1)
.play([1,2]);
)" ], [ 139.0353136, 'kof', "(
~test.quant=2;
~test.fadeTime=0.2;
~test={
  //         |       |       |       |       |  
  var pat = [1,0,0,0,1,0,0,0,1,0,0,0,1,0,0,0].rotate(1);
  var imp = PulseDivider.kr(~tick.kr,16*fib(4),~counter.kr);
  var hit = Select.kr(PulseCount.kr(imp)%pat.size,pat);
  var env = EnvGen.ar(Env([0.001,1,0.001],[1.002,1.5],[3,-3],curve:'exp'),imp * hit);
  var sig = SinOsc.ar(50+LFSaw.ar(~tempo/4).range(0,1000),(1..8)/16*env**4*8pi);
  sig = LPF.ar(sig,800);
  sig = sig * env;
  Splay.ar(sig,0.75,0.25);
};
~test.play;
);" ], [ 131.6093009, 'joach', "(
~jDrum[1] = \\set -> QuantEnv(\\amp, 4)
.phase(1, [0,1,0], [0.05, 0.95], [8,-2], 0, 4)
.phase(2, [0,1,0], [0.35, 0.65], [2,-2], 0, 1)
.play([1,2]);
)" ], [ 110.3122894, 'joach', "(
~jDrum[1] = \\set -> QuantEnv(\\amp, 4)
.phase(1, [0,1,0], [0.05, 3.95], [2,-2], 0, 4)
.phase(2, [0,1,0], [0.35, 0.65], [2,-2], 0, 1)
.play([1,2]);
)" ], [ 107.1112185, 'joach', "(
~jDrum[1] = \\set -> QuantEnv(\\amp, 4)
.phase(1, [0,1,0], [0.05, 3.95], [2,-2], 0, 4)
.phase(2, [0,1,0], [0.35, 0.65], [2,-2], 0, 1)
.play([1,2]);
)" ], [ 94.9096933, 'joach', "~jDrum.play(vol: 0.1, fadeTime: 8);" ], [ 91.4561641, 'joach', "(
~jDrum[1] = \\set -> QuantEnv(\\amp, 4)
.phase(1, [0,1,0], [0.05, 3.95], [2,-2], 0, 1)
.phase(2, [0,1,0], [0.35, 0.65], [2,-2], 0, 1)
.play([1,2]);
)" ], [ 79.1113216, 'joach', "(
~jDrum[0] = {
var osc = SinOsc.ar(( \\freq.kr(60) + \\fplus.kr(0) ), mul: 1, add: 0);
var noise = BrownNoise.ar(\\noise.kr(0), (1 - \\noise.kr(0)));
var sig = osc * noise;
Pan2.ar( sig * \\amp.kr(0), \\pan.kr(0) );
};
)" ], [ 69.0527562, 'joach', "~jDrum.play(vol: 0.0, fadeTime: 8);" ], [ 33.0106892, 'alex', "().play;" ], [ 10.8100438, 'alex', "Kolektiv(\\alex);" ], [ 4.2815735, 'joach', "p.clock.tempo_(240/60);" ], [ 3.5158026, 'joach', "p = ProxySpace.push(s).makeTempoClock;" ], [ 0, 'kof', "~bpm.clear;" ] ]