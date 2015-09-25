List[ [ 3596.8010038, 'alex', "~b.clear;" ], [ 3593.0009985, 'alex', "~b.play(vol:0.1, fadeTime:2);" ], [ 3586.3209892, 'alex', "~b[1]=\\set-> Pbind(\\args, [\\trig], \\dur, 1, \\trig, 1);" ], [ 3579.0489789, 'kof', "~ff.clear;" ], [ 3576.8779479, 'joach', "~jsin.stop(8);" ], [ 3574.5089396, 'kof', "~ss.clear;" ], [ 3574.078939, 'alex', "~b[31]=\\filter-> {arg in; LPF.ar(in,1400)};" ], [ 3572.7239056, 'joach', "~jsin.set(\\noise, 0);" ], [ 3570.8768725, 'joach', "(
~jsin[2] = \\set -> QuantEnv(\\fplus, 0.25)
.phase(1, [0,170,0], [0.005, 0.125], [8,-8], 0, 16)
.phase(2, [0,260,0], [0.035, 0.165], [8,-8], 0, 1)
.phase(3, [0,460,40], [0.075, 0.195], [8,-8], 0, 1)
.play([1, 2,3,1,3,2]);
)" ], [ 3570.6758682, 'kof', "~hiss.clear;" ], [ 3566.1858619, 'kof', "(
    ~hiss.quant=2;
~hiss.fadeTime=0.2;
~hiss={
  //         |       |       |       |       |  
  var pat = [1,0,1,0,1,0,1,0,1,0,1,0,1,1,1,1].rotate(3);
    var imp = PulseDivider.kr(~tick.kr,4,~counter.kr);
  var hit = Select.kr(PulseCount.kr(imp)%pat.size,pat);
  var env = EnvGen.ar(Env([0.001,1,0.001],[0.002,0.15],[3,-3],curve:'exp'),imp * hit);
    var sig = Crackle.ar([0.1,0.2,0.4,0.7]+env);
  sig = sig * env;
  Splay.ar(sig,0.75,0.45);
};
~hiss.play;
);" ], [ 3563.4958582, 'kof', "~kick.clear;" ], [ 3562.7958572, 'alex', "(
~b[0]={
	var sig, sig1, env, fenv, penv;
	
	env=EnvGen.kr(Env([0,1,0],[0.05,3],[\\step, \\step]),\\trig.tr);
	fenv=EnvGen.kr(Env([\\freq.kr,\\freq.kr*\\top.kr(4),\\freq.kr],[0.01,4],[\\step, \\welch]),\\trig.tr);
	penv=EnvGen.kr(Env([0,1,-1],[1,3],[\\lin, \\lin]),\\trig.tr);


	sig1=LFSaw.ar([6,3])*LFPulse.ar([\\freq.kr,\\freq.kr+2],mul:0.5).lag(0.0002)*env;
	sig=sig1+(HPF.ar(WhiteNoise.ar(0.1),11000)*Decay2.ar(Impulse.ar([2,3]),decayTime:0.15));
	
};)" ], [ 3560.4888212, 'joach', "(
~jsin[2] = \\set -> QuantEnv(\\fplus, 0.25)
.phase(1, [0,170,0], [0.005, 0.05], [8,-8], 0, 16)
.phase(2, [0,260,0], [0.035, 0.165], [8,-8], 0, 1)
.phase(3, [0,460,40], [0.075, 0.195], [8,-8], 0, 1)
.play([1, 2,3,1,3,2]);
)" ], [ 3558.7538185, 'kof', "(
    ~kick.ar(2);
    ~kick.quant=2;
    ~kick.fadeTime=0.2;
    ~kick={
        //         |       |       |       |       |  
        var pat = [1,0,1,0,1,1,0,0,1,0,1,0,1,1,0,0].rotate(1);
        var imp = PulseDivider.kr(~tick.kr,1,~counter.kr);
        var hit = Select.kr(PulseCount.kr(imp)%pat.size,pat);
        var env = EnvGen.ar(Env([0.001,1,0.001],[0.002,0.5],[3,-3],curve:'exp'),imp * hit);
        var sig = SinOsc.ar(44+(env**10*100)) + Pulse.ar([4,8,12,24]);
        sig = sig * env;
        Splay.ar(sig,0.75,0.95);
    };
    ~kick.play;
);" ], [ 3554.4128124, 'alex', "(
~b[0]={
	var sig, sig1, env, fenv, penv;
	
	env=EnvGen.kr(Env([0,1,0],[0.05,3],[\\step, \\step]),\\trig.tr);
	fenv=EnvGen.kr(Env([\\freq.kr,\\freq.kr*\\top.kr(4),\\freq.kr],[0.01,4],[\\step, \\welch]),\\trig.tr);
	penv=EnvGen.kr(Env([0,1,-1],[1,3],[\\lin, \\lin]),\\trig.tr);


	sig1=LFSaw.ar([6,3])*LFPulse.ar([\\freq.kr,\\freq.kr+2],mul:0.5).lag(0.0002)*env;
	sig=sig1+(HPF.ar(WhiteNoise.ar(0.1),11000)*Decay2.ar(Impulse.ar([4,3]),decayTime:0.5));
	
};)" ], [ 3552.6227808, 'joach', "(
~jsin[1] = \\set -> QuantEnv(\\amp, 0.5)
.phase(1, [0.5,1,0.0], [0.05, 0.15], [2,-8], 0, 16)
.phase(2, [0.5,1,0.5], [0.35, 0.65], [2,-2], 0, 1)
.phase(3, [0.0,1,0.2], [0.35, 1.65], [\\step,-2], 0, 1)
.play([1,2,1,1,3]);
)" ], [ 3550.1857726, 'kof', "(
    ~kick.ar(2);
    ~kick.quant=2;
    ~kick.fadeTime=0.2;
    ~kick={
        //         |       |       |       |       |  
        var pat = [1,0,1,0,1,1,0,0,1,0,1,0,1,1,0,0].rotate(1);
        var imp = PulseDivider.kr(~tick.kr,1,~counter.kr);
        var hit = Select.kr(PulseCount.kr(imp)%pat.size,pat);
        var env = EnvGen.ar(Env([0.001,1,0.001],[0.002,0.5],[3,-3],curve:'exp'),imp * hit);
        var sig = SinOsc.ar(44+(env**100*1000)) + Pulse.ar([4,8,12,24]);
        sig = sig * env;
        Splay.ar(sig,0.75,0.95);
    };
    ~kick.play;
);" ], [ 3546.1797343, 'joach', "(
~jsin[3] = \\set -> QuantEnv(\\noise, 8)
.phase(1, [0.0,0.4,0.2], [0.05, 2.45], [2,-2], 0, 1)
.phase(2, [0,0.5,0.2], [0.35, 0.05], [2,-2], 0, 1)
.play([1,2]);
)" ], [ 3544.5747317, 'kof', "(
    ~kick.ar(2);
    ~kick.quant=2;
    ~kick.fadeTime=0.2;
    ~kick={
        //         |       |       |       |       |  
        var pat = [1,0,1,0,1,1,0,0,1,0,1,0,1,1,0,0].rotate(1);
        var imp = PulseDivider.kr(~tick.kr,4,~counter.kr);
        var hit = Select.kr(PulseCount.kr(imp)%pat.size,pat);
        var env = EnvGen.ar(Env([0.001,1,0.001],[0.002,1.5],[3,-3],curve:'exp'),imp * hit);
        var sig = SinOsc.ar(44+(env**100*1000)) + Pulse.ar([4,8,12,24]);
        sig = sig * env;
        Splay.ar(sig,0.75,0.95);
    };
    ~kick.play;
);" ], [ 3537.7766894, 'joach', "(
~jsin[3] = \\set -> QuantEnv(\\noise, 4)
.phase(1, [0.0,0.4,0.2], [0.05, 2.45], [2,-2], 0, 1)
.phase(2, [0,0.5,0.2], [0.35, 0.05], [2,-2], 0, 1)
.play([1,2]);
)" ], [ 3537.1226883, 'kof', "(
    ~kick.ar(2);
    ~kick.quant=2;
    ~kick.fadeTime=0.2;
    ~kick={
        //         |       |       |       |       |  
        var pat = [1,0,1,0,1,1,0,0,1,0,1,0,1,1,0,0].rotate(1);
        var imp = PulseDivider.kr(~tick.kr,fib(4)*4,~counter.kr);
        var hit = Select.kr(PulseCount.kr(imp)%pat.size,pat);
        var env = EnvGen.ar(Env([0.001,1,0.001],[0.002,1.5],[3,-3],curve:'exp'),imp * hit);
        var sig = SinOsc.ar(44+(env**100*1000)) + Pulse.ar([4,8,12,24]);
        sig = sig * env;
        Splay.ar(sig,0.75,0.95);
    };
    ~kick.play;
);" ], [ 3535.2226856, 'kof', "~test.clear;" ], [ 3531.0026797, 'kof', "~kick.clear;" ], [ 3527.1026742, 'kof', "~hiss.clear;" ], [ 3527.0006684, 'alex', "~b[1]=\\set-> Pbind(\\args, [\\trig], \\dur, 2, \\trig, 1);" ], [ 3526.5136406, 'joach', "(
~jsin[2] = \\set -> QuantEnv(\\fplus, 0.25)
.phase(1, [0,170,0], [0.005, 0.15], [8,-8], 0, 16)
.phase(2, [0,260,0], [0.035, 0.165], [8,-8], 0, 1)
.phase(3, [0,460,40], [0.075, 0.195], [8,-8], 0, 1)
.play([1, 2,3,1,3,2]);
)" ], [ 3522.9106353, 'kof', "~ss.clear;" ], [ 3522.3576059, 'joach', "(
~jsin[2] = \\set -> QuantEnv(\\fplus, 0.25)
.phase(1, [20,170,0], [0.005, 0.15], [8,-8], 0, 16)
.phase(2, [0,260,0], [0.035, 0.165], [8,-8], 0, 1)
.phase(3, [0,460,40], [0.075, 0.195], [8,-8], 0, 1)
.play([1, 2,3,1,3,2]);
)" ], [ 3513.7285593, 'joach', "(
~jsin[2] = \\set -> QuantEnv(\\fplus, 0.25)
.phase(1, [20,170,0], [0.005, 0.15], [8,-8], 0, 16)
.phase(2, [50,260,0], [0.035, 0.165], [8,-8], 0, 1)
.phase(3, [0,460,40], [0.075, 0.195], [8,-8], 0, 1)
.play([1, 2,3,1,3,2]);
)" ], [ 3508.0535143, 'joach', "~jsin.play(vol: 0.9, fadeTime: 8);" ], [ 3505.9935114, 'kof', "b = Buffer.read(s,Platform.resourceDir ++ \"/sounds/violin.wav\");" ], [ 3503.6844798, 'joach', "(
~jsin[0] = {
var osc = SinOsc.ar(( \\freq.kr(80) + \\fplus.kr(0) ), mul: 1, add: 0);
var noise = BrownNoise.ar(\\noise.kr(0), (1 - \\noise.kr(0)));
var sig = osc * noise;
Pan2.ar( sig * \\amp.kr(0), \\pan.kr(0) );
};
)" ], [ 3498.9414685, 'kof', "(
    ~hiss.ar(2);
    ~hiss.quant=2;
~hiss.fadeTime=0.2;
~hiss={
  //         |       |       |       |       |  
  var pat = [1,0,1,0,1,0,1,0,1,0,1,0,1,1,1,1].rotate(3);
    var imp = PulseDivider.kr(~tick.kr,4,~counter.kr);
  var hit = Select.kr(PulseCount.kr(imp)%pat.size,pat);
  var env = EnvGen.ar(Env([0.001,1,0.001],[0.002,0.15],[3,-3],curve:'exp'),imp * hit);
    var sig = Crackle.ar([0.1,0.2,0.4,0.7]+env);
  sig = sig * env;
  Splay.ar(sig,0.75,0.45);
};
~hiss.play;
);" ], [ 3496.2584322, 'joach', "(
~jsin[0] = {
var osc = SinOsc.ar(( \\freq.kr(40) + \\fplus.kr(0) ), mul: 1, add: 0);
var noise = BrownNoise.ar(\\noise.kr(0), (1 - \\noise.kr(0)));
var sig = osc * noise;
Pan2.ar( sig * \\amp.kr(0), \\pan.kr(0) );
};
)" ], [ 3492.6094266, 'kof', "(
    ~hiss.ar(2);
    ~hiss.quant=2;
~hiss.fadeTime=0.2;
~hiss={
  //         |       |       |       |       |  
  var pat = [1,0,1,0,1,0,1,0,1,0,1,0,1,1,1,1].rotate(3);
    var imp = PulseDivider.kr(~tick.kr,2,~counter.kr);
  var hit = Select.kr(PulseCount.kr(imp)%pat.size,pat);
  var env = EnvGen.ar(Env([0.001,1,0.001],[0.002,0.15],[3,-3],curve:'exp'),imp * hit);
    var sig = Crackle.ar([0.1,0.2,0.4,0.7]+env);
  sig = sig * env;
  Splay.ar(sig,0.75,0.45);
};
~hiss.play;
);" ], [ 3492.3294262, 'alex', "(
~b[0]={
	var sig, sig1, env, fenv, penv;
	
	env=EnvGen.kr(Env([0,1,0],[0.05,3],[\\step, \\step]),\\trig.tr);
	fenv=EnvGen.kr(Env([\\freq.kr,\\freq.kr*\\top.kr(4),\\freq.kr],[0.01,4],[\\step, \\welch]),\\trig.tr);
	penv=EnvGen.kr(Env([0,1,-1],[1,3],[\\lin, \\lin]),\\trig.tr);


	sig1=LFSaw.ar([6,3])*LFPulse.ar([\\freq.kr,\\freq.kr+2],mul:0.5).lag(0.0002);
	sig=sig1+(HPF.ar(WhiteNoise.ar(0.1),11000)*Decay2.ar(Impulse.ar([4,3]),decayTime:0.5));
	sig*env;
};)" ], [ 3491.0253918, 'joach', "(
~jsin[0] = {
var osc = SinOsc.ar(( \\freq.kr(140) + \\fplus.kr(0) ), mul: 1, add: 0);
var noise = BrownNoise.ar(\\noise.kr(0), (1 - \\noise.kr(0)));
var sig = osc * noise;
Pan2.ar( sig * \\amp.kr(0), \\pan.kr(0) );
};
)" ], [ 3486.3183692, 'kof', "(
    ~kick.ar(2);
    ~kick.quant=2;
    ~kick.fadeTime=0.2;
    ~kick={
        //         |       |       |       |       |  
        var pat = [1,0,1,0,1,1,0,0,1,0,1,0,1,1,0,0].rotate(1);
        var imp = PulseDivider.kr(~tick.kr,fib(4)*4,~counter.kr);
        var hit = Select.kr(PulseCount.kr(imp)%pat.size,pat);
        var env = EnvGen.ar(Env([0.001,1,0.001],[0.002,1.5],[3,-3],curve:'exp'),imp * hit);
        var sig = SinOsc.ar(44+(env**100*1000)) + Pulse.ar([4,8,12,24]);
        sig = sig * env;
        Splay.ar(sig,0.75,0.95);
    };
    ~kick.play;
);" ], [ 3486.0843558, 'joach', "(
~jsin[1] = \\set -> QuantEnv(\\amp, 0.5)
.phase(1, [0.5,1,0.0], [0.05, 0.45], [2,-8], 0, 16)
.phase(2, [0.5,1,0.5], [0.35, 0.65], [2,-2], 0, 1)
.phase(3, [0.0,1,0.2], [0.35, 1.65], [\\step,-2], 0, 1)
.play([1,2,1,1,3]);
)" ], [ 3483.5853479, 'alex', "(
~b[0]={
	var sig, sig1, env, fenv, penv;
	
	env=EnvGen.kr(Env([0,1,0],[0.05,3],[\\step, \\step]),\\trig.tr);
	fenv=EnvGen.kr(Env([\\freq.kr,\\freq.kr*\\top.kr(4),\\freq.kr],[0.01,4],[\\step, \\welch]),\\trig.tr);
	penv=EnvGen.kr(Env([0,1,-1],[1,3],[\\lin, \\lin]),\\trig.tr);


	sig1=LFSaw.ar([6,3])*LFPulse.ar([\\freq.kr,\\freq.kr+2],mul:0.5).lag(0.0002);
	sig=sig1+(HPF.ar(WhiteNoise.ar(0.1),11000)*Decay2.ar(Impulse.ar([2,3]),decayTime:0.5));
	sig*env;
};)" ], [ 3478.8643083, 'joach', "(
~jsin[2] = \\set -> QuantEnv(\\fplus, 0.25)
.phase(1, [20,270,0], [0.005, 0.15], [8,-8], 0, 16)
.phase(2, [50,260,0], [0.035, 0.165], [8,-8], 0, 1)
.phase(3, [0,460,40], [0.075, 0.195], [8,-8], 0, 1)
.play([1, 2,3,1,3,2]);
)" ], [ 3474.6403022, 'kof', "(
    ~kick.ar(2);
    ~kick.quant=2;
    ~kick.fadeTime=0.2;
    ~kick={
        //         |       |       |       |       |  
        var pat = [1,0,1,0,1,1,0,0,1,0,1,0,1,1,0,0].rotate(1);
        var imp = PulseDivider.kr(~tick.kr,fib(4)*4,~counter.kr);
        var hit = Select.kr(PulseCount.kr(imp)%pat.size,pat);
        var env = EnvGen.ar(Env([0.001,1,0.001],[0.002,1.5],[3,-3],curve:'exp'),imp * hit);
        var sig = SinOsc.ar(44+(env**10*100)) + Pulse.ar([4,8,12,24]);
        sig = sig * env;
        Splay.ar(sig,0.75,0.95);
    };
    ~kick.play;
);" ], [ 3474.4603019, 'alex', "~b[31]=\\filter-> {arg in; LPF.ar(in,14000)};" ], [ 3469.4542655, 'joach', "(
~jsin[2] = \\set -> QuantEnv(\\fplus, 0.25)
.phase(1, [20,170,0], [0.005, 0.15], [8,-8], 0, 16)
.phase(2, [50,260,0], [0.035, 0.165], [8,-8], 0, 1)
.phase(3, [0,460,40], [0.075, 0.195], [8,-8], 0, 1)
.play([1, 2,3,1,3,2]);
)" ], [ 3466.056257, 'alex', "~b[29]=nil;" ], [ 3457.7042452, 'kof', "(
    ~kick.ar(2);
    ~kick.quant=2;
    ~kick.fadeTime=0.2;
    ~kick={
        //         |       |       |       |       |  
        var pat = [1,0,1,0,1,1,0,0,1,0,1,0,1,1,0,0].rotate(1);
        var imp = PulseDivider.kr(~tick.kr,fib(4)*4,~counter.kr);
        var hit = Select.kr(PulseCount.kr(imp)%pat.size,pat);
        var env = EnvGen.ar(Env([0.001,1,0.001],[0.002,1.5],[3,-3],curve:'exp'),imp * hit);
        var sig = SinOsc.ar(44+(env**100*1000)) + Pulse.ar([4,8,12,24]);
        sig = sig * env;
        Splay.ar(sig,0.75,0.95);
    };
    ~kick.play;
);" ], [ 3457.0062103, 'joach', "(
~jsin[6] = \\set -> QuantEnv(\\mulgverb, 0.5)
.phase(1, [0.2,1,0.5], [0.05, 0.15], [2,-2], 0, 1)
.phase(2, [0.2,1,0.4], [0.015, 0.15], [2,-2], 0, 1).plot
.play([1,2]);
)" ], [ 3456.2162092, 'alex', "~b[31]=\\filter-> {arg in; LPF.ar(in,1400)};" ], [ 3452.9701725, 'joach', "(
~jsin[6] = \\set -> QuantEnv(\\mulgverb, 0.5)
.phase(1, [0.2,1,0.5], [0.05, 0.15], [2,-2], 0, 1)
.phase(2, [0.2,1,0.4], [0.015, 0.15], [2,-2], 0, 1)
.play([1,2]);
)" ], [ 3451.173169, 'alex', "~b[3]=\\set-> Pbind(\\args, [\\top], \\dur, 16, \\top, Pseq([6,4],inf));" ], [ 3449.8631672, 'alex', "~b[2]=\\set-> Pbind(\\args, [\\freq], \\dur, 8, \\freq, Pseq([64,57,65,45,35,35],inf));" ], [ 3448.8831658, 'alex', "~b[1]=\\set-> Pbind(\\args, [\\trig], \\dur, 1, \\trig, 1);" ], [ 3446.0131618, 'kof', "(
    ~kick.ar(2);
    ~kick.quant=2;
    ~kick.fadeTime=0.2;
    ~kick={
        //         |       |       |       |       |  
        var pat = [1,0,1,0,1,1,0,0,1,0,1,0,1,1,0,0].rotate(1);
        var imp = PulseDivider.kr(~tick.kr,4,~counter.kr);
        var hit = Select.kr(PulseCount.kr(imp)%pat.size,pat);
        var env = EnvGen.ar(Env([0.001,1,0.001],[0.002,1.5],[3,-3],curve:'exp'),imp * hit);
        var sig = SinOsc.ar(44+(env**100*1000)) + Pulse.ar(4);
        sig = sig * env;
        Splay.ar(sig,0.75,0.95);
    };
    ~kick.play;
);" ], [ 3443.6531585, 'kof', "(
    ~kick.ar(2);
    ~kick.quant=2;
    ~kick.fadeTime=0.2;
    ~kick={
        //         |       |       |       |       |  
        var pat = [1,0,1,0,1,1,0,0,1,0,1,0,1,1,0,0].rotate(1);
        var imp = PulseDivider.kr(~tick.kr,4,~counter.kr);
        var hit = Select.kr(PulseCount.kr(imp)%pat.size,pat);
        var env = EnvGen.ar(Env([0.001,1,0.001],[0.002,1.5],[3,-3],curve:'exp'),imp * hit);
        var sig = SinOsc.ar(44+(env**100*1000)) + Pulse.ar(32);
        sig = sig * env;
        Splay.ar(sig,0.75,0.95);
    };
    ~kick.play;
);" ], [ 3442.2331565, 'alex', "(
~b[0]={
	var sig, sig1, env, fenv, penv;
	
	env=EnvGen.kr(Env([0,1,0],[0.05,3],[\\step, \\step]),\\trig.tr);
	fenv=EnvGen.kr(Env([\\freq.kr,\\freq.kr*\\top.kr(4),\\freq.kr],[0.01,4],[\\step, \\welch]),\\trig.tr);
	penv=EnvGen.kr(Env([0,1,-1],[1,3],[\\lin, \\lin]),\\trig.tr);


	sig1=LFSaw.ar([6,3])*LFPulse.ar([\\freq.kr,\\freq.kr+2],mul:0.5).lag(0.0002);
	sig=sig1+(HPF.ar(WhiteNoise.ar(1),11000)*Decay2.ar(Impulse.ar([2,3]),decayTime:0.5));
	sig*env;
};)" ], [ 3440.7341216, 'joach', "(
~jsin[6] = \\set -> QuantEnv(\\mulgverb, 0.5)
.phase(1, [0.2,1,0.5], [0.05, 0.15], [2,-2], 0, 1)
.phase(2, [0.2,1,0.4], [0.35, 0.15], [2,-2], 0, 1)
.play([1,2]);
)" ], [ 3437.7611172, 'kof', "(
    ~kick.ar(2);
    ~kick.quant=2;
    ~kick.fadeTime=0.2;
    ~kick={
        //         |       |       |       |       |  
        var pat = [1,0,1,0,1,1,0,0,1,0,1,0,1,1,0,0].rotate(1);
        var imp = PulseDivider.kr(~tick.kr,4,~counter.kr);
        var hit = Select.kr(PulseCount.kr(imp)%pat.size,pat);
        var env = EnvGen.ar(Env([0.001,1,0.001],[0.002,1.5],[3,-3],curve:'exp'),imp * hit);
        var sig = SinOsc.ar(44+(env**100*1000)) + Pulse.ar(16);
        sig = sig * env;
        Splay.ar(sig,0.75,0.95);
    };
    ~kick.play;
);" ], [ 3434.3311124, 'kof', "(
    ~kick.ar(2);
    ~kick.quant=2;
    ~kick.fadeTime=0.2;
    ~kick={
        //         |       |       |       |       |  
        var pat = [1,0,1,0,1,1,0,0,1,0,1,0,1,1,0,0].rotate(1);
        var imp = PulseDivider.kr(~tick.kr,4,~counter.kr);
        var hit = Select.kr(PulseCount.kr(imp)%pat.size,pat);
        var env = EnvGen.ar(Env([0.001,1,0.001],[0.002,1.5],[3,-3],curve:'exp'),imp * hit);
        var sig = SinOsc.ar(44+(env**100*1000)) + Pulse.ar(8);
        sig = sig * env;
        Splay.ar(sig,0.75,0.95);
    };
    ~kick.play;
);" ], [ 3432.4911098, 'alex', "(
~b[0]={
	var sig, sig1, env, fenv, penv;
	
	env=EnvGen.kr(Env([0,1,0],[0.05,3],[\\step, \\step]),\\trig.tr);
	fenv=EnvGen.kr(Env([\\freq.kr,\\freq.kr*\\top.kr(4),\\freq.kr],[0.01,4],[\\step, \\welch]),\\trig.tr);
	penv=EnvGen.kr(Env([0,1,-1],[1,3],[\\lin, \\lin]),\\trig.tr);


	sig1=LFSaw.ar([6,3])*LFPulse.ar([\\freq.kr,\\freq.kr+2],mul:0.5).lag(0.0002);
	sig=sig1+(HPF.ar(WhiteNoise.ar(0.5),11000)*Decay2.ar(Impulse.ar([2,3]),decayTime:0.5));
	sig*env;
};)" ], [ 3428.4111041, 'kof', "(
    ~kick.ar(2);
    ~kick.quant=2;
    ~kick.fadeTime=0.2;
    ~kick={
        //         |       |       |       |       |  
        var pat = [1,0,1,0,1,1,0,0,1,0,1,0,1,1,0,0].rotate(1);
        var imp = PulseDivider.kr(~tick.kr,4,~counter.kr);
        var hit = Select.kr(PulseCount.kr(imp)%pat.size,pat);
        var env = EnvGen.ar(Env([0.001,1,0.001],[0.002,1.5],[3,-3],curve:'exp'),imp * hit);
        var sig = SinOsc.ar(44+(env**100*1000)) + Pulse.ar(4);
        sig = sig * env;
        Splay.ar(sig,0.75,0.95);
    };
    ~kick.play;
);" ], [ 3427.6300701, 'joach', "~jsin.set(\\lpf_freq, 200);" ], [ 3426.3790683, 'alex', "(
~b[0]={
	var sig, sig1, env, fenv, penv;
	
	env=EnvGen.kr(Env([0,1,0],[0.05,3],[\\step, \\step]),\\trig.tr);
	fenv=EnvGen.kr(Env([\\freq.kr,\\freq.kr*\\top.kr(4),\\freq.kr],[0.01,4],[\\step, \\welch]),\\trig.tr);
	penv=EnvGen.kr(Env([0,1,-1],[1,3],[\\lin, \\lin]),\\trig.tr);


	sig1=LFSaw.ar([6,3])*LFPulse.ar([\\freq.kr,\\freq.kr+2],mul:0.5).lag(0.0002);
	sig=sig1+(HPF.ar(WhiteNoise.ar(0.5),14000)*Decay2.ar(Impulse.ar([2,3]),decayTime:0.5));
	sig*env;
};)" ], [ 3414.7450199, 'joach', "(
~jsin[3] = \\set -> QuantEnv(\\noise, 0.5)
.phase(1, [0.0,0.4,0.2], [0.05, 0.45], [2,-2], 0, 1)
.phase(2, [0,0.5,0.2], [0.35, 0.05], [2,-2], 0, 1)
.play([1,2]);
)" ], [ 3413.6890164, 'alex', "(
~b[0]={
	var sig, sig1, env, fenv, penv;
	
	env=EnvGen.kr(Env([0,1,0],[0.05,3],[\\step, \\step]),\\trig.tr);
	fenv=EnvGen.kr(Env([\\freq.kr,\\freq.kr*\\top.kr(4),\\freq.kr],[0.01,4],[\\step, \\welch]),\\trig.tr);
	penv=EnvGen.kr(Env([0,1,-1],[1,3],[\\lin, \\lin]),\\trig.tr);


	sig1=LFSaw.ar([6,3])*LFPulse.ar([\\freq.kr,\\freq.kr+2],mul:0.5).lag(0.0002);
	sig=sig1+(HPF.ar(WhiteNoise.ar(0.5),14000)*Decay2.ar(Impulse.ar([2,3]),decayTime:0.25));
	sig*env;
};)" ], [ 3412.8590153, 'kof', "~hiss.clear;" ], [ 3402.7339713, 'joach', "(
~jsin[3] = \\set -> QuantEnv(\\noise, 0.5)
.phase(1, [0.2,0.7,0.2], [0.05, 0.45], [2,-2], 0, 1)
.phase(2, [0,0.5,0.2], [0.35, 0.05], [2,-2], 0, 1)
.play([1,2]);
)" ], [ 3401.8999665, 'kof', "(
    ~hiss.ar(2);
    ~hiss.quant=2;
~hiss.fadeTime=0.2;
~hiss={
  //         |       |       |       |       |  
  var pat = [1,0,1,0,1,0,1,0,1,0,1,0,1,1,1,1].rotate(3);
    var imp = PulseDivider.kr(~tick.kr,2,~counter.kr);
  var hit = Select.kr(PulseCount.kr(imp)%pat.size,pat);
  var env = EnvGen.ar(Env([0.001,1,0.001],[0.002,0.5],[3,-3],curve:'exp'),imp * hit);
    var sig = Crackle.ar([0.1,0.2,0.4,0.7]+env);
  sig = sig * env;
  Splay.ar(sig,0.75,0.45);
};
~hiss.play;
);" ], [ 3391.8689524, 'alex', "(
~b[0]={
	var sig, sig1, env, fenv, penv;
	
	env=EnvGen.kr(Env([0,1,0],[0.05,3],[\\step, \\step]),\\trig.tr);
	fenv=EnvGen.kr(Env([\\freq.kr,\\freq.kr*\\top.kr(4),\\freq.kr],[0.01,4],[\\step, \\welch]),\\trig.tr);
	penv=EnvGen.kr(Env([0,1,-1],[1,3],[\\lin, \\lin]),\\trig.tr);


	sig1=LFSaw.ar([6,3])*LFPulse.ar([\\freq.kr,\\freq.kr+2]).lag(0.0002);
	sig=sig1+(HPF.ar(WhiteNoise.ar(0.5),14000)*Decay2.ar(Impulse.ar([2,3]),decayTime:0.25));
	sig*env;
};)" ], [ 3386.0289442, 'kof', "(
    ~hiss.ar(2);
    ~hiss.quant=2;
~hiss.fadeTime=0.2;
~hiss={
  //         |       |       |       |       |  
  var pat = [1,0,1,0,1,0,1,0,1,0,1,0,1,1,1,1].rotate(3);
    var imp = PulseDivider.kr(~tick.kr,2,~counter.kr);
  var hit = Select.kr(PulseCount.kr(imp)%pat.size,pat);
  var env = EnvGen.ar(Env([0.001,1,0.001],[0.002,0.25],[3,-3],curve:'exp'),imp * hit);
    var sig = Crackle.ar([0.1,0.2,0.4,0.7]+env);
  sig = sig * env;
  Splay.ar(sig,0.75,0.45);
};
~hiss.play;
);" ], [ 3380.7939043, 'joach', "(
~jsin[0] = {
var osc = SinOsc.ar(( \\freq.kr(320) + \\fplus.kr(0) ), mul: 1, add: 0);
var noise = BrownNoise.ar(\\noise.kr(0), (1 - \\noise.kr(0)));
var sig = osc * noise;
Pan2.ar( sig * \\amp.kr(0), \\pan.kr(0) );
};
)" ], [ 3370.4068586, 'joach', "(
~jsin[1] = \\set -> QuantEnv(\\amp, 1)
.phase(1, [0.5,1,0.0], [0.05, 0.45], [2,-8], 0, 16)
.phase(2, [0.5,1,0.5], [0.35, 0.65], [2,-2], 0, 1)
.phase(3, [0.0,1,0.2], [0.35, 1.65], [\\step,-2], 0, 1)
.play([1,2,1,1,3]);
)" ], [ 3370.0408556, 'kof', "(
    ~kick.ar(2);
    ~kick.quant=2;
    ~kick.fadeTime=0.2;
    ~kick={
        //         |       |       |       |       |  
        var pat = [1,0,1,0,1,1,0,0,1,0,1,0,1,1,0,0].rotate(1);
        var imp = PulseDivider.kr(~tick.kr,4,~counter.kr);
        var hit = Select.kr(PulseCount.kr(imp)%pat.size,pat);
        var env = EnvGen.ar(Env([0.001,1,0.001],[0.002,1.5],[3,-3],curve:'exp'),imp * hit);
        var sig = SinOsc.ar(44+(env**100*1000)) + Pulse.ar(2);
        sig = sig * env;
        Splay.ar(sig,0.75,0.95);
    };
    ~kick.play;
);" ], [ 3359.8188093, 'joach', "(
~jsin[1] = \\set -> QuantEnv(\\amp, 2)
.phase(1, [0.5,1,0.0], [0.05, 0.45], [2,-8], 0, 16)
.phase(2, [0.5,1,0.5], [0.35, 0.65], [2,-2], 0, 1)
.phase(3, [0.0,1,0.2], [0.35, 1.65], [\\step,-2], 0, 1)
.play([1,2,1,1,3]);
)" ], [ 3356.9108032, 'kof', "~kick.clear;" ], [ 3351.6797958, 'kof', "~ss.clear;" ], [ 3347.3097897, 'kof', "(
    ~ff.quant=1;
    ~ff.fadeTime=1;
    ~ff={
        var high,mid,low;
        var sig = ~test + ~kick + ~hiss + ~ss;

        sig = GVerb.ar(LPF.ar(sig,500)+HPF.ar(sig,500),60,[3,4,5,6],spread:[40,90])/8 + sig;
        low = CompanderD.ar(LPF.ar(sig,400),3/4,1/2,1/2);
        mid = CompanderD.ar(BPF.ar(sig,600,2),3/4,1/1,1/2);
        high = CompanderD.ar(HPF.ar(sig,900),3/4,1/1,1/2);
        sig = CompanderD.ar((high+mid+low).flat,3/4,1/1.1,1/1.1);
        Splay.ar(sig,0.75,0.25);
    };
    ~ff.play;
);" ], [ 3345.6107539, 'joach', "(
~jsin[6] = \\set -> QuantEnv(\\mulgverb, 2)
.phase(1, [0.2,1,0.5], [0.05, 0.15], [2,-2], 0, 1)
.phase(2, [0.2,1,0.4], [0.35, 0.15], [2,-2], 0, 1)
.play([1,2]);
)" ], [ 3341.2407472, 'kof', "(
    ~ss.ar(2);
    ~ss.quant=2;
    ~ss.fadeTime=2.02;
    ~ss={
        var mod = [-1,0.25,-0.25,8,16]/8;
        var spread = 0.0;
        var pos = [0,0.5,0.25,0.75]+LFSaw.ar(~tempo/10).range(0,0.3);
        //         |       |       |       |       |  
        var pat = [1,0,1,0,1,0,1,0,1,0,0,0,1,0,1,0].rotate(3);
        var imp = PulseDivider.kr(~tick.kr,fib(4)*4,~counter.kr);
        var hit = Select.kr(PulseCount.kr(imp)%pat.size,pat);
  var env = EnvGen.ar(Env([0.001,1,0.001],[0.502,0.75],[3,-3],curve:'exp'),imp * hit);
        var sig = PlayBuf.ar(b.numChannels,b.bufnum,BufRateScale.kr(b.bufnum)*mod+(env*0.01),imp, (pos + BrownNoise.ar(1!8).range(spread * -1,spread)) * BufFrames.kr(b.bufnum),1);
        
  sig = sig * env;
        Splay.ar(sig.flat,0.5,0.5);
    };
    ~ss.play;
);" ], [ 3339.7077164, 'joach', "(
~jsin[6] = \\set -> QuantEnv(\\mulgverb, 2)
.phase(1, [0.2,1,0.5], [0.05, 0.15], [2,-2], 0, 1)
.phase(2, [0.2,1,0.4], [0.35, 3.15], [2,-2], 0, 1)
.play([1,2]);
)" ], [ 3334.5896708, 'joach', "~jsin[5] = \\filter -> {|in| GVerb.ar(in, \\gverb_size.kr(6), \\gverb_time.kr(0.55), 0.9, mul:\\mulgverb.kr(1), add:(1-\\mulgverb.kr(1))) };" ], [ 3333.0586686, 'alex', "(
~b[0]={
	var sig, sig1, env, fenv, penv;
	
	env=EnvGen.kr(Env([0,1,0],[0.05,3],[\\step, \\step]),\\trig.tr);
	fenv=EnvGen.kr(Env([\\freq.kr,\\freq.kr*\\top.kr(4),\\freq.kr],[0.01,4],[\\step, \\welch]),\\trig.tr);
	penv=EnvGen.kr(Env([0,1,-1],[1,3],[\\lin, \\lin]),\\trig.tr);


	sig1=LFSaw.ar([6,3])*LFPulse.ar([\\freq.kr,\\freq.kr+2]).lag(0.0002);
	sig=Balance2.ar(sig1,HPF.ar(WhiteNoise.ar(0.5),14000)*Decay2.ar(Impulse.ar([2,3]),decayTime:0.25),SinOsc.kr(0.25));
	sig*env;
};)" ], [ 3329.768664, 'alex', "~b[31]=\\filter-> {arg in; LPF.ar(in,400)};" ], [ 3320.8476515, 'alex', "~b[29]=\\filter-> {arg in; CombL.ar(in,2,\\del.kr(1),4)};" ], [ 3314.4846106, 'joach', "(
~jsin[2] = \\set -> QuantEnv(\\fplus, 0.5)
.phase(1, [20,170,0], [0.005, 0.15], [8,-8], 0, 16)
.phase(2, [50,260,0], [0.035, 0.165], [8,-8], 0, 1)
.phase(3, [0,460,40], [0.075, 0.195], [8,-8], 0, 1)
.play([1, 2,3,1,3,2]);
)" ], [ 3314.4526093, 'alex', "~b[31]=\\filter-> {arg in; LPF.ar(in,1800)};" ], [ 3314.3326092, 'kof', "~kick.clear;" ], [ 3312.5426067, 'kof', "~hiss.clear;" ], [ 3310.4826038, 'alex', "~b.play(vol:1.2, fadeTime:2);" ], [ 3306.6925985, 'alex', "(
~b[0]={
	var sig, sig1, env, fenv, penv;
	
	env=EnvGen.kr(Env([0,1,0],[0.05,3],[\\step, \\step]),\\trig.tr);
	fenv=EnvGen.kr(Env([\\freq.kr,\\freq.kr*\\top.kr(4),\\freq.kr],[0.01,4],[\\step, \\welch]),\\trig.tr);
	penv=EnvGen.kr(Env([0,1,-1],[1,3],[\\lin, \\lin]),\\trig.tr);


	sig1=LFSaw.ar([6,3])*LFPulse.ar([\\freq.kr,\\freq.kr+2]).lag(0.0002);
	sig=Balance2.ar(sig1,HPF.ar(WhiteNoise.ar(0.5),14000)*Decay2.ar(Impulse.ar([2,3]),decayTime:0.25),SinOsc.kr(0.5));
	sig*env;
};)" ], [ 3304.9495674, 'joach', "(
~jsin[1] = \\set -> QuantEnv(\\amp, 2)
.phase(1, [0.5,1,0.5], [0.05, 0.45], [2,-8], 0, 16)
.phase(2, [0.5,1,0.5], [0.35, 0.65], [2,-2], 0, 1)
.phase(3, [0.0,1,0.2], [0.35, 1.65], [\\step,-2], 0, 1)
.play([1,2,1,1,3]);
)" ], [ 3299.9295258, 'joach', "(
~jsin[6] = \\set -> QuantEnv(\\mulgverb, 1)
.phase(1, [0.2,1,0.5], [0.05, 0.15], [2,-2], 0, 1)
.phase(2, [0.2,1,0.4], [0.35, 3.15], [2,-2], 0, 1)
.play([1,2]);
)" ], [ 3297.7575198, 'alex', "~b[3]=\\set-> Pbind(\\args, [\\top], \\dur, 16, \\top, Pseq([6,4],inf));" ], [ 3297.7275198, 'kof', "(
    ~ss.ar(2);
    ~ss.quant=2;
    ~ss.fadeTime=2.02;
    ~ss={
        var mod = [-1,0.25,-0.25,8,16]/8;
        var spread = 0.0;
        var pos = [0,0.5,0.25,0.75]+LFSaw.ar(1/60).range(0,0.3);
        //         |       |       |       |       |  
        var pat = [1,0,1,0,1,0,1,0,1,0,0,0,1,0,1,0].rotate(3);
        var imp = PulseDivider.kr(~tick.kr,fib(4)*4,~counter.kr);
        var hit = Select.kr(PulseCount.kr(imp)%pat.size,pat);
  var env = EnvGen.ar(Env([0.001,1,0.001],[0.502,0.75],[3,-3],curve:'exp'),imp * hit);
        var sig = PlayBuf.ar(b.numChannels,b.bufnum,BufRateScale.kr(b.bufnum)*mod+(env*0.01),imp, (pos + BrownNoise.ar(1!8).range(spread * -1,spread)) * BufFrames.kr(b.bufnum),1);
        
  sig = sig * env;
        Splay.ar(sig.flat,0.5,0.5);
    };
    ~ss.play;
);" ], [ 3296.8774868, 'joach', "~jsin[5] = \\filter -> {|in| GVerb.ar(in, \\gverb_size.kr(6), \\gverb_time.kr(1.55), 0.9, mul:\\mulgverb.kr(1), add:(1-\\mulgverb.kr(1))) };" ], [ 3296.485485, 'alex', "~b[2]=\\set-> Pbind(\\args, [\\freq], \\dur, 8, \\freq, Pseq([64,57,65,45,35,35],inf));" ], [ 3295.6254838, 'alex', "~b[1]=\\set-> Pbind(\\args, [\\trig], \\dur, 1, \\trig, 1);" ], [ 3290.646444, 'joach', "(
~jsin[1] = \\set -> QuantEnv(\\amp, 2)
.phase(1, [0.5,1,0.5], [0.05, 7.45], [2,-8], 0, 16)
.phase(2, [0.5,1,0.5], [0.35, 0.65], [2,-2], 0, 1)
.phase(3, [0.0,1,0.2], [0.35, 1.65], [\\step,-2], 0, 1)
.play([1,2,1,1,3]);
)" ], [ 3286.9524386, 'alex', "(
~b[0]={
	var sig, sig1, env, fenv, penv;
	
	env=EnvGen.kr(Env([0,1,0],[0.05,3],[\\step, \\step]),\\trig.tr);
	fenv=EnvGen.kr(Env([\\freq.kr,\\freq.kr*\\top.kr(4),\\freq.kr],[0.01,4],[\\step, \\welch]),\\trig.tr);
	penv=EnvGen.kr(Env([0,1,-1],[1,3],[\\lin, \\lin]),\\trig.tr);


	sig1=LFSaw.ar([6,3])*LFPulse.ar([\\freq.kr,\\freq.kr+2]).lag(0.0002);
	sig=Balance2.ar(sig1,HPF.ar(WhiteNoise.ar(0.5),14000)*Decay2.ar(Impulse.ar([2,3]),decayTime:0.25),penv);
	sig*env;
};)" ], [ 3285.6284047, 'joach', "(
~jsin[0] = {
var osc = SinOsc.ar(( \\freq.kr(120) + \\fplus.kr(0) ), mul: 1, add: 0);
var noise = BrownNoise.ar(\\noise.kr(0), (1 - \\noise.kr(0)));
var sig = osc * noise;
Pan2.ar( sig * \\amp.kr(0), \\pan.kr(0) );
};
)" ], [ 3281.3503977, 'kof', "(
    ~ss.ar(2);
    ~ss.quant=2;
    ~ss.fadeTime=2.02;
    ~ss={
        var mod = [-1,0.25,-0.25,8,16]/8;
        var spread = 0.0;
        var pos = [0,0.5,0.25,0.75]+LFSaw.ar(1/60).range(0,0.3);
        //         |       |       |       |       |  
        var pat = [1,0,1,0,1,0,1,0,1,0,0,0,1,0,1,0].rotate(3);
        var imp = PulseDivider.kr(~tick.kr,fib(4),~counter.kr);
        var hit = Select.kr(PulseCount.kr(imp)%pat.size,pat);
  var env = EnvGen.ar(Env([0.001,1,0.001],[0.502,0.75],[3,-3],curve:'exp'),imp * hit);
        var sig = PlayBuf.ar(b.numChannels,b.bufnum,BufRateScale.kr(b.bufnum)*mod+(env*0.01),imp, (pos + BrownNoise.ar(1!8).range(spread * -1,spread)) * BufFrames.kr(b.bufnum),1);
        
  sig = sig * env;
        Splay.ar(sig.flat,0.5,0.5);
    };
    ~ss.play;
);" ], [ 3279.0763659, 'joach', "(
~jsin[0] = {
var osc = SinOsc.ar(( \\freq.kr(166) + \\fplus.kr(0) ), mul: 1, add: 0);
var noise = BrownNoise.ar(\\noise.kr(0), (1 - \\noise.kr(0)));
var sig = osc * noise;
Pan2.ar( sig * \\amp.kr(0), \\pan.kr(0) );
};
)" ], [ 3268.0413144, 'joach', "(
~jsin[6] = \\set -> QuantEnv(\\mulgverb, 2)
.phase(1, [0.2,1,0.5], [0.05, 0.15], [2,-2], 0, 1)
.phase(2, [0.2,1,0.4], [0.35, 3.15], [2,-2], 0, 1)
.play([1,2]);
)" ], [ 3265.7163098, 'kof', "(
    ~hiss.ar(2);
    ~hiss.quant=2;
~hiss.fadeTime=0.2;
~hiss={
  //         |       |       |       |       |  
  var pat = [1,0,1,0,1,0,1,0,1,0,1,0,1,1,1,1].rotate(3);
    var imp = PulseDivider.kr(~tick.kr,1,~counter.kr);
  var hit = Select.kr(PulseCount.kr(imp)%pat.size,pat);
  var env = EnvGen.ar(Env([0.001,1,0.001],[0.002,0.25],[3,-3],curve:'exp'),imp * hit);
    var sig = Crackle.ar([0.1,0.2,0.4,0.7]+env);
  sig = sig * env;
  Splay.ar(sig,0.75,0.45);
};
~hiss.play;
);" ], [ 3261.4922707, 'joach', "(
~jsin[2] = \\set -> QuantEnv(\\fplus, 2)
.phase(1, [20,170,0], [0.005, 0.15], [8,-8], 0, 16)
.phase(2, [50,260,0], [0.035, 0.165], [8,-8], 0, 1)
.phase(3, [0,460,40], [0.075, 0.195], [8,-8], 0, 1)
.play([1, 2,3,1,3,2]);
)" ], [ 3257.9362604, 'kof', "(
    ~hiss.ar(2);
    ~hiss.quant=2;
~hiss.fadeTime=0.2;
~hiss={
  //         |       |       |       |       |  
  var pat = [1,0,1,0,1,0,1,0,1,0,1,0,1,1,1,1].rotate(3);
    var imp = PulseDivider.kr(~tick.kr,1,~counter.kr);
  var hit = Select.kr(PulseCount.kr(imp)%pat.size,pat);
  var env = EnvGen.ar(Env([0.001,1,0.001],[1.002,0.25],[3,-3],curve:'exp'),imp * hit);
    var sig = Crackle.ar([0.1,0.2,0.4,0.7]+env);
  sig = sig * env;
  Splay.ar(sig,0.75,0.45);
};
~hiss.play;
);" ], [ 3257.4532327, 'joach', "~jsin[5] = \\filter -> {|in| GVerb.ar(in, \\gverb_size.kr(6), \\gverb_time.kr(2.55), 0.9, mul:\\mulgverb.kr(1), add:(1-\\mulgverb.kr(1))) };" ], [ 3248.7792181, 'alex', "~b[31]=\\filter-> {arg in; LPF.ar(in,800)};" ], [ 3232.6291955, 'alex', "~b[31]=\\filter-> {arg in; LPF.ar(in,400)};" ], [ 3228.5891899, 'alex', "~b[31]=\\filter-> {arg in; LPF.ar(in,700)};" ], [ 3226.0591863, 'kof', "(
    ~hiss.ar(2);
    ~hiss.quant=2;
~hiss.fadeTime=0.2;
~hiss={
  //         |       |       |       |       |  
  var pat = [1,0,1,0,1,0,1,0,1,0,1,0,1,1,1,1].rotate(3);
    var imp = PulseDivider.kr(~tick.kr,8,~counter.kr);
  var hit = Select.kr(PulseCount.kr(imp)%pat.size,pat);
  var env = EnvGen.ar(Env([0.001,1,0.001],[1.002,0.25],[3,-3],curve:'exp'),imp * hit);
    var sig = Crackle.ar([0.1,0.2,0.4,0.7]+env);
  sig = sig * env;
  Splay.ar(sig,0.75,0.45);
};
~hiss.play;
);" ], [ 3225.2431564, 'joach', "(
~jsin[0] = {
var osc = SinOsc.ar(( \\freq.kr(160) + \\fplus.kr(0) ), mul: 1, add: 0);
var noise = BrownNoise.ar(\\noise.kr(0), (1 - \\noise.kr(0)));
var sig = osc * noise;
Pan2.ar( sig * \\amp.kr(0), \\pan.kr(0) );
};
)" ], [ 3218.9661433, 'alex', "~b[29]=\\filter-> {arg in; CombL.ar(in,2,\\del.kr(1),4)};" ], [ 3216.6091095, 'joach', "(
~jsin[6] = \\set -> QuantEnv(\\mulgverb, 4)
.phase(1, [0.2,1,0.5], [0.05, 0.15], [2,-2], 0, 1)
.phase(2, [0.2,1,0.4], [0.35, 3.15], [2,-2], 0, 1)
.play([1,2]);
)" ], [ 3210.2830696, 'joach', "~jsin[5] = \\filter -> {|in| GVerb.ar(in, \\gverb_size.kr(6), \\gverb_time.kr(7.55), 0.9, mul:\\mulgverb.kr(1), add:(1-\\mulgverb.kr(1))) };" ], [ 3209.0120633, 'kof', "(
    ~ss.ar(2);
    ~ss.quant=2;
    ~ss.fadeTime=2.02;
    ~ss={
        var mod = [-1,0.25,-0.25,8,16]/4;
        var spread = 0.0;
        var pos = [0,0.5,0.25,0.75]+LFSaw.ar(1/60).range(0,0.3);
        //         |       |       |       |       |  
        var pat = [1,0,1,0,1,0,1,0,1,0,0,0,1,0,1,0].rotate(3);
        var imp = PulseDivider.kr(~tick.kr,fib(4)*4,~counter.kr);
        var hit = Select.kr(PulseCount.kr(imp)%pat.size,pat);
  var env = EnvGen.ar(Env([0.001,1,0.001],[0.502,0.75],[3,-3],curve:'exp'),imp * hit);
        var sig = PlayBuf.ar(b.numChannels,b.bufnum,BufRateScale.kr(b.bufnum)*mod+(env*0.01),imp, (pos + BrownNoise.ar(1!8).range(spread * -1,spread)) * BufFrames.kr(b.bufnum),1);
        
  sig = sig * env;
        Splay.ar(sig.flat,0.5,0.5);
    };
    ~ss.play;
);" ], [ 3205.8320589, 'alex', "~b[29]=\\filter-> {arg in; CombL.ar(in,2,\\del.kr(1),2)};" ], [ 3203.9390231, 'joach', "(
~jsin[1] = \\set -> QuantEnv(\\amp, 8)
.phase(1, [0.5,1,0.5], [0.05, 7.45], [2,-8], 0, 16)
.phase(2, [0.5,1,0.5], [0.35, 0.65], [2,-2], 0, 1)
.phase(3, [0.0,1,0.2], [0.35, 1.65], [\\step,-2], 0, 1)
.play([1,2,1,1,3]);
)" ], [ 3201.4880196, 'kof', "~hiss.clear;" ], [ 3200.3349849, 'joach', "(
~jsin[1] = \\set -> QuantEnv(\\amp, 8)
.phase(1, [0.5,1,0.5], [0.05, 12.45], [2,-8], 0, 16)
.phase(2, [0.5,1,0.5], [0.35, 0.65], [2,-2], 0, 1)
.phase(3, [0.0,1,0.2], [0.35, 1.65], [\\step,-2], 0, 1)
.play([1,2,1,1,3]);
)" ], [ 3199.5249838, 'kof', "~kick.clear;" ], [ 3191.863973, 'kof', "(
    ~kick.ar(2);
    ~kick.quant=2;
    ~kick.fadeTime=0.2;
    ~kick={
        //         |       |       |       |       |  
        var pat = [1,0,1,0,1,1,0,0,1,0,1,0,1,1,0,0].rotate(1);
        var imp = PulseDivider.kr(~tick.kr,1,~counter.kr);
        var hit = Select.kr(PulseCount.kr(imp)%pat.size,pat);
        var env = EnvGen.ar(Env([0.001,1,0.001],[0.002,1.5],[3,-3],curve:'exp'),imp * hit);
        var sig = SinOsc.ar(44+(env**100*1000));
        sig = sig * env;
        Splay.ar(sig,0.75,0.45);
    };
    ~kick.play;
);" ], [ 3190.83794, 'joach', "~jsin.set(\\noise, 0)" ], [ 3189.5229368, 'kof', "(
    ~hiss.ar(2);
    ~hiss.quant=2;
~hiss.fadeTime=0.2;
~hiss={
  //         |       |       |       |       |  
  var pat = [1,0,1,0,1,0,1,0,1,0,1,0,1,1,1,1].rotate(3);
    var imp = PulseDivider.kr(~tick.kr,8,~counter.kr);
  var hit = Select.kr(PulseCount.kr(imp)%pat.size,pat);
  var env = EnvGen.ar(Env([0.001,1,0.001],[1.002,0.25],[3,-3],curve:'exp'),imp * hit);
    var sig = Crackle.ar([0.1,0.2,0.4,0.7]+env);
  sig = sig * env;
  Splay.ar(sig,0.75,0.45);
};
~hiss.play;
);" ], [ 3177.0609181, 'kof', "b = Buffer.read(s,Platform.resourceDir ++ \"/sounds/violin.wav\");" ], [ 3176.5648897, 'joach', "~jsin[3] = 0.0" ], [ 3174.7748827, 'kof', "~ss.clear;" ], [ 3171.6448784, 'kof', "(
    ~ss.ar(2);
    ~ss.quant=2;
    ~ss.fadeTime=2.02;
    ~ss={
        var mod = [-1,0.25,-0.25,8,16];
        var spread = 0.0;
        var pos = [0,0.5,0.25,0.75]+LFSaw.ar(1/60).range(0,0.3);
        //         |       |       |       |       |  
        var pat = [1,0,1,0,1,0,1,0,1,0,0,0,1,0,1,0].rotate(3);
        var imp = PulseDivider.kr(~tick.kr,fib(4)*4,~counter.kr);
        var hit = Select.kr(PulseCount.kr(imp)%pat.size,pat);
  var env = EnvGen.ar(Env([0.001,1,0.001],[0.502,0.75],[3,-3],curve:'exp'),imp * hit);
        var sig = PlayBuf.ar(b.numChannels,b.bufnum,BufRateScale.kr(b.bufnum)*mod+(env*0.01),imp, (pos + BrownNoise.ar(1!8).range(spread * -1,spread)) * BufFrames.kr(b.bufnum),1);
        
  sig = sig * env;
        Splay.ar(sig.flat,0.5,0.5);
    };
    ~ss.play;
);" ], [ 3164.973869, 'kof', "(
    ~ss.quant=2;
    ~ss.fadeTime=2.02;
    ~ss={
        var mod = [-1,0.25,-0.25,8,16];
        var spread = 0.0;
        var pos = [0,0.5,0.25,0.75]+LFSaw.ar(1/60).range(0,0.3);
        //         |       |       |       |       |  
        var pat = [1,0,1,0,1,0,1,0,1,0,0,0,1,0,1,0].rotate(3);
        var imp = PulseDivider.kr(~tick.kr,fib(4)*4,~counter.kr);
        var hit = Select.kr(PulseCount.kr(imp)%pat.size,pat);
  var env = EnvGen.ar(Env([0.001,1,0.001],[0.502,0.75],[3,-3],curve:'exp'),imp * hit);
        var sig = PlayBuf.ar(b.numChannels,b.bufnum,BufRateScale.kr(b.bufnum)*mod+(env*0.01),imp, (pos + BrownNoise.ar(1!8).range(spread * -1,spread)) * BufFrames.kr(b.bufnum),1);
        
  sig = sig * env;
        Splay.ar(sig.flat,0.5,0.5);
    };
    ~ss.play;
);" ], [ 3161.1698316, 'joach', "(
~jsin[2] = \\set -> QuantEnv(\\fplus, 8)
.phase(1, [20,170,0], [0.005, 0.15], [8,-8], 0, 16)
.phase(2, [50,260,0], [0.035, 0.165], [8,-8], 0, 1)
.phase(3, [0,460,40], [0.075, 0.195], [8,-8], 0, 1)
.play([1, 2,3,1,3,2]);
)" ], [ 3151.4267843, 'joach', "~jsin[2] = nil" ], [ 3147.5037446, 'joach', "~jsin[3] = nil" ], [ 3147.3027443, 'kof', "(
    ~ss.quant=2;
    ~ss.fadeTime=2.02;
    ~ss={
        var mod = [-1,0.25,-0.25,8,16];
        var spread = 0.0;
        var pos = [0,0.5]+LFSaw.ar(1/60);
        //         |       |       |       |       |  
        var pat = [1,0,1,0,1,0,1,0,1,0,0,0,1,0,1,0].rotate(3);
        var imp = PulseDivider.kr(~tick.kr,fib(4)*4,~counter.kr);
        var hit = Select.kr(PulseCount.kr(imp)%pat.size,pat);
  var env = EnvGen.ar(Env([0.001,1,0.001],[0.502,0.75],[3,-3],curve:'exp'),imp * hit);
        var sig = PlayBuf.ar(b.numChannels,b.bufnum,BufRateScale.kr(b.bufnum)*mod+(env*0.01),imp, (pos + BrownNoise.ar(1!8).range(spread * -1,spread)) * BufFrames.kr(b.bufnum),1);
        
  sig = sig * env;
        Splay.ar(sig.flat,0.5,0.5);
    };
    ~ss.play;
);" ], [ 3141.0557033, 'joach', "~jsin.play(vol: 0.4, fadeTime: 8);" ], [ 3139.0226998, 'kof', "(
    ~ss.quant=2;
    ~ss.fadeTime=2.02;
    ~ss={
        var mod = [-1,0.25,-0.25,8,16];
        var spread = 0.0;
        var pos = [0,0.5]+0.03;
        //         |       |       |       |       |  
        var pat = [1,0,1,0,1,0,1,0,1,0,0,0,1,0,1,0].rotate(3);
        var imp = PulseDivider.kr(~tick.kr,fib(4)*4,~counter.kr);
        var hit = Select.kr(PulseCount.kr(imp)%pat.size,pat);
  var env = EnvGen.ar(Env([0.001,1,0.001],[0.502,0.75],[3,-3],curve:'exp'),imp * hit);
        var sig = PlayBuf.ar(b.numChannels,b.bufnum,BufRateScale.kr(b.bufnum)*mod+(env*0.01),imp, (pos + BrownNoise.ar(1!8).range(spread * -1,spread)) * BufFrames.kr(b.bufnum),1);
        
  sig = sig * env;
        Splay.ar(sig.flat,0.5,0.5);
    };
    ~ss.play;
);" ], [ 3135.8186621, 'joach', "(
~jsin[1] = \\set -> QuantEnv(\\amp, 16)
.phase(1, [0.5,1,0.5], [0.05, 12.45], [2,-8], 0, 16)
.phase(2, [0.5,1,0.5], [0.35, 0.65], [2,-2], 0, 1)
.phase(3, [0.0,1,0.2], [0.35, 1.65], [\\step,-2], 0, 1)
.play([1,2,1,1,3]);
)" ], [ 3124.3776461, 'kof', "(
    ~ff.quant=1;
    ~ff.fadeTime=1;
    ~ff={
        var high,mid,low;
        var sig = ~test + ~kick + ~hiss + ~ss;

        sig = GVerb.ar(LPF.ar(sig,500)+HPF.ar(sig,500),60,[3,4,5,6],spread:[40,90])/8 + sig;
        low = CompanderD.ar(LPF.ar(sig,400),3/4,1/2,1/2);
        mid = CompanderD.ar(BPF.ar(sig,600,2),3/4,1/1,1/2);
        high = CompanderD.ar(HPF.ar(sig,900),3/4,1/1,1/2);
        sig = CompanderD.ar((high+mid+low).flat,3/4,1/1.1,1/1.1);
        Splay.ar(sig,0.75,0.25);
    };
    ~ff.play;
);" ], [ 3104.476588, 'joach', "~jsin.stop(8);" ], [ 3101.9675489, 'joach', "~jsin[3] = nil" ], [ 3100.5365468, 'kof', "b = Buffer.read(s,Platform.resourceDir ++ \"/sounds/violin.wav\");" ], [ 3099.2335147, 'joach', "(
~jsin[3] = \\set -> QuantEnv(\\noise, 32)
.phase(1, [0.2,0.7,0.2], [6.05, 0.45], [2,-2], 0, 1)
.phase(2, [0,0.5,0.2], [0.35, 10.65], [2,-2], 0, 1)
.play([1,2]);
)" ], [ 3097.9204792, 'joach', "~jsin[3] = nil" ], [ 3091.5904352, 'joach', "(
~jsin[2] = \\set -> QuantEnv(\\fplus, 1)
.phase(1, [20,170,0], [0.005, 0.15], [8,-8], 0, 16)
.phase(2, [50,260,0], [0.035, 0.165], [8,-8], 0, 1)
.phase(3, [0,460,40], [0.075, 0.195], [8,-8], 0, 1)
.play([1, 2,3,1,3,2]);
)" ], [ 3085.584398, 'joach', "(
~jsin[1] = \\set -> QuantEnv(\\amp, 1)
.phase(1, [0.5,1,0.5], [0.05, 0.45], [2,-8], 0, 16)
.phase(2, [0.5,1,0.5], [0.35, 0.65], [2,-2], 0, 1)
.phase(3, [0.0,1,0.2], [0.35, 1.65], [\\step,-2], 0, 1)
.play([1,2,1,1,3]);
)" ], [ 3081.8693551, 'joach', "(
~jsin[6] = \\set -> QuantEnv(\\mulgverb, 1)
.phase(1, [0.2,1,0.5], [0.05, 0.15], [2,-2], 0, 1)
.phase(2, [0.2,1,0.4], [0.35, 3.15], [2,-2], 0, 1)
.play([1,2]);
)" ], [ 3081.6903544, 'alex', "(
~b[0]={
	var sig, sig1, env, fenv;
	
	env=EnvGen.kr(Env([0,1,0],[0.05,3],[\\step, \\step]),\\trig.tr);
	fenv=EnvGen.kr(Env([\\freq.kr,\\freq.kr*\\top.kr(4),\\freq.kr],[0.01,4],[\\step, \\welch]),\\trig.tr);

	sig1=LFSaw.ar([6,3])*LFPulse.ar([\\freq.kr,\\freq.kr+2]).lag(0.0002);
	sig=Balance2.ar(sig1,HPF.ar(WhiteNoise.ar(0.5),14000)*Decay2.ar(Impulse.ar([4/3,4/3*2]),decayTime:0.15),SinOsc.kr(0.5));
	sig*env;
};)" ], [ 3079.5793184, 'joach', "(
~jsin[6] = \\set -> QuantEnv(\\mulgverb, 1)
.phase(1, [0.2,1,0.5], [0.05, 0.15], [2,-2], 0, 1)
.phase(2, [0.2,1,0.2], [0.35, 3.15], [2,-2], 0, 1)
.play([1,2]);
)" ], [ 3079.259318, 'kof', "(
    ~kick.ar(2);
    ~kick.quant=2;
    ~kick.fadeTime=0.2;
    ~kick={
        //         |       |       |       |       |  
        var pat = [1,0,1,0,1,1,0,0,1,0,1,0,1,1,0,0].rotate(1);
        var imp = PulseDivider.kr(~tick.kr,1,~counter.kr);
        var hit = Select.kr(PulseCount.kr(imp)%pat.size,pat);
        var env = EnvGen.ar(Env([0.001,1,0.001],[0.002,1.5],[3,-3],curve:'exp'),imp * hit);
        var sig = SinOsc.ar(44+(env**100*1000));
        sig = sig * env;
        Splay.ar(sig,0.75,0.45);
    };
    ~kick.play;
);" ], [ 3073.8972802, 'joach', "(
~jsin[6] = \\set -> QuantEnv(\\mulgverb, 1)
.phase(1, [0.2,1,0.5], [0.05, 0.15], [2,-2], 0, 1)
.phase(2, [0.2,1,0.8], [0.35, 3.15], [2,-2], 0, 1)
.play([1,2]);
)" ], [ 3072.149245, 'joach', "(
~jsin[6] = \\set -> QuantEnv(\\mulgverb, 1)
.phase(1, [0.2,1,0.5], [0.05, 0.15], [2,-2], 0, 1)
.phase(2, [0.2,1,0.8], [0.35, 4.15], [2,-2], 0, 1)
.play([1,2]);
)" ], [ 3064.8351988, 'joach', "(
~jsin[6] = \\set -> QuantEnv(\\mulgverb, 1)
.phase(1, [0.2,1,0.5], [0.05, 0.15], [2,-2], 0, 1)
.phase(2, [0.2,1,0.8], [0.35, 0.15], [2,-2], 0, 1)
.play([1,2]);
)" ], [ 3064.0751977, 'kof', "(
    ~hiss.ar(2);
    ~hiss.quant=2;
~hiss.fadeTime=0.2;
~hiss={
  //         |       |       |       |       |  
  var pat = [1,0,1,0,1,0,1,0,1,0,1,0,1,1,1,1].rotate(3);
    var imp = PulseDivider.kr(~tick.kr,8,~counter.kr);
  var hit = Select.kr(PulseCount.kr(imp)%pat.size,pat);
  var env = EnvGen.ar(Env([0.001,1,0.001],[1.002,0.25],[3,-3],curve:'exp'),imp * hit);
    var sig = Crackle.ar([0.1,0.2,0.4,0.7]+env);
  sig = sig * env;
  Splay.ar(sig,0.75,0.45);
};
~hiss.play;
);" ], [ 3053.6981532, 'joach', "~jsin[5] = \\filter -> {|in| GVerb.ar(in, \\gverb_size.kr(6), \\gverb_time.kr(0.55), 0.9, mul:\\mulgverb.kr(1), add:(1-\\mulgverb.kr(1))) };" ], [ 3051.0441465, 'alex', "~b.play(vol:1.2, fadeTime:2);" ], [ 3049.6041445, 'kof', "~kick.clear;" ], [ 3046.8151077, 'joach', "(
~jsin[2] = \\set -> QuantEnv(\\fplus, 0.5)
.phase(1, [20,170,0], [0.005, 0.15], [8,-8], 0, 16)
.phase(2, [50,260,0], [0.035, 0.165], [8,-8], 0, 1)
.phase(3, [0,460,40], [0.075, 0.195], [8,-8], 0, 1)
.play([1, 2,3,1,3,2]);
)" ], [ 3046.7731075, 'kof', "~hiss.clear;" ], [ 3044.4731043, 'kof', "(
    ~hiss.ar(2);
    ~hiss.quant=2;
~hiss.fadeTime=0.2;
~hiss={
  //         |       |       |       |       |  
  var pat = [1,0,1,0,1,0,1,0,1,0,1,0,1,1,1,1].rotate(3);
    var imp = PulseDivider.kr(~tick.kr,1,~counter.kr);
  var hit = Select.kr(PulseCount.kr(imp)%pat.size,pat);
  var env = EnvGen.ar(Env([0.001,1,0.001],[0.002,0.25],[3,-3],curve:'exp'),imp * hit);
    var sig = Crackle.ar([0.1,0.2,0.4,0.7]+env);
  sig = sig * env;
  Splay.ar(sig,0.75,0.45);
};
~hiss.play;
);" ], [ 3041.1930997, 'kof', "~kick.clear;" ], [ 3039.2810646, 'joach', "(
~jsin[2] = \\set -> QuantEnv(\\fplus, 0.5)
.phase(1, [20,170,0], [0.005, 0.15], [8,-8], 0, 16)
.phase(2, [150,260,0], [0.035, 0.165], [8,-8], 0, 1)
.phase(3, [0,460,40], [0.075, 0.195], [8,-8], 0, 1)
.play([1, 2,3,1,3,2]);
)" ], [ 3036.9410607, 'kof', "~ss.clear;" ], [ 3036.3320304, 'joach', "(
~jsin[1] = \\set -> QuantEnv(\\amp, 2)
.phase(1, [0.5,1,0.5], [0.05, 0.45], [2,-8], 0, 16)
.phase(2, [0.5,1,0.5], [0.35, 0.65], [2,-2], 0, 1)
.phase(3, [0.0,1,0.2], [0.35, 1.65], [\\step,-2], 0, 1)
.play([1,2,1,1,3]);
)" ], [ 3032.8930212, 'alex', "~b[3]=\\set-> Pbind(\\args, [\\top], \\dur, 16, \\top, Pseq([6,4],inf));" ], [ 3031.3109904, 'joach', "(
~jsin[6] = \\set -> QuantEnv(\\mulgverb, 1)
.phase(1, [0,1,0.5], [0.05, 0.15], [2,-2], 0, 1)
.phase(2, [0,1,0], [0.35, 0.15], [2,-2], 0, 1)
.play([1,2]);
)" ], [ 3028.9109524, 'joach', "~jsin[5] = \\filter -> {|in| GVerb.ar(in, \\gverb_size.kr(6), \\gverb_time.kr(1.25), 0.9, mul:\\mulgverb.kr(1), add:(1-\\mulgverb.kr(1))) };" ], [ 3027.7099479, 'kof', "(
    ~ss.quant=2;
    ~ss.fadeTime=2.02;
    ~ss={
        var mod = [-1,0.25,-0.25,8,16];
        var spread = 0.0;
        var pos = [0,0.5];
        //         |       |       |       |       |  
        var pat = [1,0,1,0,1,0,1,0,1,0,0,0,1,0,1,0].rotate(3);
        var imp = PulseDivider.kr(~tick.kr,fib(4),~counter.kr);
        var hit = Select.kr(PulseCount.kr(imp)%pat.size,pat);
  var env = EnvGen.ar(Env([0.001,1,0.001],[0.002,0.5],[3,-3],curve:'exp'),imp * hit);
        var sig = PlayBuf.ar(b.numChannels,b.bufnum,BufRateScale.kr(b.bufnum)*mod+(env*0.01),imp, (pos + BrownNoise.ar(1!8).range(spread * -1,spread)) * BufFrames.kr(b.bufnum),1);
        
  sig = sig * env;
        Splay.ar(sig.flat,0.5,0.5);
    };
    ~ss.play;
);" ], [ 3026.6599464, 'kof', "b = Buffer.read(s,Platform.resourceDir ++ \"/sounds/beat2.wav\");" ], [ 3025.7429124, 'joach', "~jsin[5] = \\filter -> {|in| GVerb.ar(in, \\gverb_size.kr(12), \\gverb_time.kr(1.25), 0.9, mul:\\mulgverb.kr(1), add:(1-\\mulgverb.kr(1))) };" ], [ 3025.598912, 'kof', "b = Buffer.read(s,Platform.resourceDir ++ \"/sounds/beat2.wav\");" ], [ 3020.9079053, 'kof', "(
    ~ss.quant=2;
    ~ss.fadeTime=2.02;
    ~ss={
        var mod = [-1,0.25,-0.25,8,16];
        var spread = 0.0;
        var pos = [0,0.5];
        //         |       |       |       |       |  
        var pat = [1,0,1,0,1,0,1,0,1,0,0,0,1,0,1,0].rotate(3);
        var imp = PulseDivider.kr(~tick.kr,fib(4),~counter.kr);
        var hit = Select.kr(PulseCount.kr(imp)%pat.size,pat);
  var env = EnvGen.ar(Env([0.001,1,0.001],[0.002,0.5],[3,-3],curve:'exp'),imp * hit);
        var sig = PlayBuf.ar(b.numChannels,b.bufnum,BufRateScale.kr(b.bufnum)*mod+(env*0.01),imp, (pos + BrownNoise.ar(1!8).range(spread * -1,spread)) * BufFrames.kr(b.bufnum),1);
        
  sig = sig * env;
        Splay.ar(sig.flat,0.5,0.5);
    };
    ~ss.play;
);" ], [ 3014.8248671, 'joach', "(
~jsin[2] = \\set -> QuantEnv(\\fplus, 0.5)
.phase(1, [20,470,0], [0.005, 0.15], [8,-8], 0, 16)
.phase(2, [150,260,0], [0.035, 0.165], [8,-8], 0, 1)
.phase(3, [0,460,40], [0.075, 0.195], [8,-8], 0, 1)
.play([1, 2,3,1,3,2]);
)" ], [ 3008.2248539, 'kof', "~test.clear;" ], [ 3007.1788226, 'joach', "(
~jsin[1] = \\set -> QuantEnv(\\amp, 8)
.phase(1, [0.5,1,0.5], [0.05, 0.45], [2,-8], 0, 16)
.phase(2, [0.5,1,0.5], [0.35, 0.65], [2,-2], 0, 1)
.phase(3, [0.0,1,0.2], [0.35, 1.65], [\\step,-2], 0, 1)
.play([1,2,1,1,3]);
)" ], [ 3006.1958171, 'alex', "(
~b[0]={
	var sig, sig1, env, fenv;
	
	env=EnvGen.kr(Env([0,1,0],[0.05,3],[\\step, \\step]),\\trig.tr);
	fenv=EnvGen.kr(Env([\\freq.kr,\\freq.kr*\\top.kr(4),\\freq.kr],[0.01,4],[\\step, \\welch]),\\trig.tr);

	sig1=LFSaw.ar([6,3])*LFPulse.ar([\\freq.kr,\\freq.kr+2]).lag(0.002);
	sig=Balance2.ar(sig1,HPF.ar(WhiteNoise.ar(0.5),14000)*Decay2.ar(Impulse.ar([4/3,4/3*2]),decayTime:0.15),SinOsc.kr(0.25));
	sig*env;
};)" ], [ 3000.3458089, 'kof', "(
    ~kick.ar(2);
    ~kick.quant=2;
    ~kick.fadeTime=0.2;
    ~kick={
        //         |       |       |       |       |  
        var pat = [1,0,1,0,1,1,0,0,1,0,1,0,1,1,0,0].rotate(1);
        var imp = PulseDivider.kr(~tick.kr,1,~counter.kr);
        var hit = Select.kr(PulseCount.kr(imp)%pat.size,pat);
        var env = EnvGen.ar(Env([0.001,1,0.001],[0.002,1.5],[3,-3],curve:'exp'),imp * hit);
        var sig = SinOsc.ar(44+(env**100*1000));
        sig = sig * env;
        Splay.ar(sig,0.75,0.45);
    };
    ~kick.play;
);" ], [ 2994.665801, 'kof', "~kick.clear;" ], [ 2992.6747981, 'kof', "~hiss.clear;" ], [ 2991.7807687, 'joach', "~jsin.set(\\lpf_freq, 600);" ], [ 2985.7737231, 'joach', "~jsin[3] = nil" ], [ 2983.9127199, 'alex', "~b[29]=\\filter-> {arg in; CombL.ar(in,2,\\del.kr(1),2)};" ], [ 2975.7266763, 'joach', "(
~jsin[2] = \\set -> QuantEnv(\\fplus, 2)
.phase(1, [20,470,0], [0.005, 0.15], [8,-8], 0, 16)
.phase(2, [150,260,0], [0.035, 0.165], [8,-8], 0, 1)
.phase(3, [0,460,40], [0.075, 0.195], [8,-8], 0, 1)
.play([1, 2,3,1,3,2]);
)" ], [ 2970.5916331, 'joach', "(
~jsin[2] = \\set -> QuantEnv(\\fplus, 2)
.phase(1, [20,170,0], [0.005, 0.15], [8,-8], 0, 16)
.phase(2, [150,260,0], [0.035, 0.165], [8,-8], 0, 1)
.phase(3, [0,460,40], [0.075, 0.195], [8,-8], 0, 1)
.play([1, 2,3,1,3,2]);
)" ], [ 2967.3205995, 'joach', "(
~jsin[2] = \\set -> QuantEnv(\\fplus, 0.5)
.phase(1, [20,170,0], [0.005, 0.15], [8,-8], 0, 16)
.phase(2, [150,260,0], [0.035, 0.165], [8,-8], 0, 1)
.phase(3, [0,460,40], [0.075, 0.195], [8,-8], 0, 1)
.play([1, 2,3,1,3,2]);
)" ], [ 2962.1865586, 'joach', "(
~jsin[2] = \\set -> QuantEnv(\\fplus, 0.5)
.phase(1, [20,170,0], [0.005, 0.15], [8,-8], 0, 16)
.phase(2, [0,260,0], [0.035, 0.165], [8,-8], 0, 1)
.phase(3, [0,460,40], [0.075, 0.195], [8,-8], 0, 1)
.play([1, 2,3,1,3,2]);
)" ], [ 2956.7255146, 'joach', "(
~jsin[2] = \\set -> QuantEnv(\\fplus, 0.5)
.phase(1, [20,170,0], [0.005, 0.15], [8,-8], 0, 16)
.phase(2, [0,260,0], [0.035, 0.165], [8,-8], 0, 1)
.phase(3, [0,460,40], [0.075, 0.195], [8,-8], 0, 1)
.play([1, 2,3,1,3,2]);
)" ], [ 2953.750509, 'alex', "(
~b[0]={
	var sig, sig1, env, fenv;
	
	env=EnvGen.kr(Env([0,1,0],[0.05,3],[\\step, \\step]),\\trig.tr);
	fenv=EnvGen.kr(Env([\\freq.kr,\\freq.kr*\\top.kr(4),\\freq.kr],[0.01,4],[\\step, \\welch]),\\trig.tr);

	sig1=LFSaw.ar([6,3])*LFPulse.ar([\\freq.kr,\\freq.kr+2]);
	sig=Balance2.ar(sig1,HPF.ar(WhiteNoise.ar(0.5),14000)*Decay2.ar(Impulse.ar([4/3,4/3*2]),decayTime:0.15),SinOsc.kr(0.25));
	sig*env;
};)" ], [ 2950.938476, 'joach', "(
~jsin[2] = \\set -> QuantEnv(\\fplus, 0.5)
.phase(1, [100,170,0], [0.005, 0.15], [8,-8], 0, 16)
.phase(2, [0,260,0], [0.035, 0.165], [8,-8], 0, 1)
.phase(3, [0,460,40], [0.075, 0.195], [8,-8], 0, 1)
.play([1, 2,3,1,3,2]);
)" ], [ 2947.2204664, 'kof', "b = Buffer.read(s,Platform.resourceDir ++ \"/sounds/beat.wav\");" ], [ 2944.3854332, 'joach', "(
~jsin[1] = \\set -> QuantEnv(\\amp, 2)
.phase(1, [0.5,1,0.5], [0.05, 0.45], [2,-8], 0, 16)
.phase(2, [0.5,1,0.5], [0.35, 0.65], [2,-2], 0, 1)
.phase(3, [0.0,1,0.2], [0.35, 1.65], [\\step,-2], 0, 1)
.play([1,2,1,1,3]);
)" ], [ 2940.9044243, 'alex', "~b[30]=\\filter-> {arg in; GVerb.ar(in,[20,10],4,add:in)};" ], [ 2938.0644203, 'alex', "~b[1]=\\set-> Pbind(\\args, [\\trig], \\dur, 1, \\trig, 1);" ], [ 2936.9144187, 'kof', "(
    ~ff.quant=1;
    ~ff.fadeTime=1;
    ~ff={
        var high,mid,low;
        var sig = ~test + ~kick + ~hiss;

        sig = GVerb.ar(LPF.ar(sig,500)+HPF.ar(sig,500),60,[3,4,5,6],spread:[40,90])/8 + sig;
        low = CompanderD.ar(LPF.ar(sig,400),3/4,1/2,1/2);
        mid = CompanderD.ar(BPF.ar(sig,600,2),3/4,1/1,1/2);
        high = CompanderD.ar(HPF.ar(sig,900),3/4,1/1,1/2);
        sig = CompanderD.ar((high+mid+low).flat,3/4,1/1.1,1/1.1);
        Splay.ar(sig,0.75,0.25);
    };
    ~ff.play;
);" ], [ 2936.3053889, 'joach', "(
~jsin[6] = \\set -> QuantEnv(\\mulgverb, 2)
.phase(1, [0,1,0.5], [0.05, 0.15], [2,-2], 0, 1)
.phase(2, [0,1,0], [0.35, 0.15], [2,-2], 0, 1)
.play([1,2]);
)" ], [ 2932.7403797, 'kof', "(
    ~ff.quant=1;
    ~ff.fadeTime=1;
    ~ff={
        var high,mid,low;
        var sig = ~test + ~kick + ~hiss;

        sig = GVerb.ar(LPF.ar(sig,500)+HPF.ar(sig,500),60,[3,4],spread:[40,90])/8 + sig;
        low = CompanderD.ar(LPF.ar(sig,400),3/4,1/2,1/2);
        mid = CompanderD.ar(BPF.ar(sig,600,2),3/4,1/1,1/2);
        high = CompanderD.ar(HPF.ar(sig,900),3/4,1/1,1/2);
        sig = CompanderD.ar((high+mid+low).flat,3/4,1/1.1,1/1.1);
        Splay.ar(sig,0.75,0.25);
    };
    ~ff.play;
);" ], [ 2931.3943457, 'joach', "(
~jsin[2] = \\set -> QuantEnv(\\fplus, 0.5)
.phase(1, [400,170,0], [0.005, 0.15], [8,-8], 0, 16)
.phase(2, [0,260,0], [0.035, 0.165], [8,-8], 0, 1)
.phase(3, [0,460,40], [0.075, 0.195], [8,-8], 0, 1)
.play([1, 2,3,1,3,2]);
)" ], [ 2929.3003409, 'kof', "(
    ~ff.quant=1;
    ~ff.fadeTime=1;
    ~ff={
        var high,mid,low;
        var sig = ~test + ~kick + ~hiss;

        sig = GVerb.ar(LPF.ar(sig,500)+HPF.ar(sig,500),40,[3,4],spread:[40,90])/8 + sig;
        low = CompanderD.ar(LPF.ar(sig,400),3/4,1/2,1/2);
        mid = CompanderD.ar(BPF.ar(sig,600,2),3/4,1/1,1/2);
        high = CompanderD.ar(HPF.ar(sig,900),3/4,1/1,1/2);
        sig = CompanderD.ar((high+mid+low).flat,3/4,1/1.1,1/1.1);
        Splay.ar(sig,0.75,0.25);
    };
    ~ff.play;
);" ], [ 2927.3003381, 'kof', "(
    ~ff.quant=1;
    ~ff.fadeTime=1;
    ~ff={
        var high,mid,low;
        var sig = ~test + ~kick + ~hiss;

        sig = GVerb.ar(LPF.ar(sig,500)+HPF.ar(sig,500),40,[3,4],spread:[40,90])/8 + sig;
        low = CompanderD.ar(LPF.ar(sig,400),3/4,1/1,1/2);
        mid = CompanderD.ar(BPF.ar(sig,600,2),3/4,1/1,1/2);
        high = CompanderD.ar(HPF.ar(sig,900),3/4,1/1,1/2);
        sig = CompanderD.ar((high+mid+low).flat,3/4,1/1.1,1/1.1);
        Splay.ar(sig,0.75,0.25);
    };
    ~ff.play;
);" ], [ 2924.5203342, 'kof', "(
    ~ff.quant=1;
    ~ff.fadeTime=1;
    ~ff={
        var high,mid,low;
        var sig = ~test + ~kick + ~hiss;

        sig = GVerb.ar(LPF.ar(sig,500)+HPF.ar(sig,500),40,[3,4],spread:[40,90])/8 + sig;
        low = CompanderD.ar(LPF.ar(sig,400),3/4,1/1,1/2);
        mid = CompanderD.ar(BPF.ar(sig,600,2),3/4,1/3,1/2);
        high = CompanderD.ar(HPF.ar(sig,900),3/4,1/1,1/2);
        sig = CompanderD.ar((high+mid+low).flat,3/4,1/1.1,1/1.1);
        Splay.ar(sig,0.75,0.25);
    };
    ~ff.play;
);" ], [ 2922.5293314, 'alex', "~b[1]=\\set-> Pbind(\\args, [\\trig], \\dur, 1, \\trig, 1);" ], [ 2922.5293314, 'kof', "(
    ~ff.quant=1;
    ~ff.fadeTime=1;
    ~ff={
        var high,mid,low;
        var sig = ~test + ~kick + ~hiss;

        sig = GVerb.ar(LPF.ar(sig,500)+HPF.ar(sig,500),40,[3,4],spread:[40,90])/8 + sig;
        low = CompanderD.ar(LPF.ar(sig,400),3/4,1/1,1/2);
        mid = CompanderD.ar(BPF.ar(sig,600,2),3/4,1/2,1/2);
        high = CompanderD.ar(HPF.ar(sig,900),3/4,1/1,1/2);
        sig = CompanderD.ar((high+mid+low).flat,3/4,1/1.1,1/1.1);
        Splay.ar(sig,0.75,0.25);
    };
    ~ff.play;
);" ], [ 2920.2093281, 'kof', "(
    ~ff.quant=1;
    ~ff.fadeTime=1;
    ~ff={
        var high,mid,low;
        var sig = ~test + ~kick + ~hiss;

        sig = GVerb.ar(LPF.ar(sig,500)+HPF.ar(sig,500),40,[3,4],spread:[40,90])/8 + sig;
        low = CompanderD.ar(LPF.ar(sig,400),3/4,1/1,1/2);
        mid = CompanderD.ar(BPF.ar(sig,600,2),3/4,1/2,1/2);
        high = CompanderD.ar(HPF.ar(sig,900),3/4,1/2,1/2);
        sig = CompanderD.ar((high+mid+low).flat,3/4,1/1.1,1/1.1);
        Splay.ar(sig,0.75,0.25);
    };
    ~ff.play;
);" ], [ 2914.0102894, 'joach', "p.clock.tempo" ], [ 2909.6082803, 'alex', "~b[1]=\\set-> Pbind(\\args, [\\trig], \\dur, 2, \\trig, 1);" ], [ 2893.9272254, 'joach', "(
~jsin[2] = \\set -> QuantEnv(\\fplus, 0.25)
.phase(1, [400,170,0], [0.005, 0.15], [8,-8], 0, 16)
.phase(2, [0,260,0], [0.035, 0.165], [8,-8], 0, 1)
.phase(3, [0,460,40], [0.075, 0.195], [8,-8], 0, 1)
.play([1, 2,3,1,3,2]);
)" ], [ 2893.7732249, 'alex', "~b[30]=\\filter-> {arg in; GVerb.ar(in,[20,10],4,add:in)};" ], [ 2886.0822141, 'alex', "~b.play(vol:1, fadeTime:2);" ], [ 2881.8011796, 'joach', "(
~jsin[2] = \\set -> QuantEnv(\\fplus, 2)
.phase(1, [400,170,0], [0.005, 0.15], [8,-8], 0, 16)
.phase(2, [0,260,0], [0.035, 0.165], [8,-8], 0, 1)
.phase(3, [0,460,40], [0.075, 0.195], [8,-8], 0, 1)
.play([1, 2,3,1,3,2]);
)" ], [ 2875.7091665, 'alex', "~b[30]=\\filter-> {arg in; GVerb.ar(Limiter.ar(in,0.8),[20,10],4,add:in)};" ], [ 2873.8301321, 'joach', "(
~jsin[0] = {
var osc = SinOsc.ar(( \\freq.kr(60) + \\fplus.kr(0) ), mul: 1, add: 0);
var noise = BrownNoise.ar(\\noise.kr(0), (1 - \\noise.kr(0)));
var sig = osc * noise;
Pan2.ar( sig * \\amp.kr(0), \\pan.kr(0) );
};
)" ], [ 2873.2411291, 'kof', "(
    ~kick.ar(2);
    ~kick.quant=2;
    ~kick.fadeTime=0.2;
    ~kick={
        //         |       |       |       |       |  
        var pat = [1,0,1,0,1,1,0,0,1,0,1,0,1,1,0,0].rotate(1);
        var imp = PulseDivider.kr(~tick.kr,1,~counter.kr);
        var hit = Select.kr(PulseCount.kr(imp)%pat.size,pat);
        var env = EnvGen.ar(Env([0.001,1,0.001],[0.002,1.5],[3,-3],curve:'exp'),imp * hit);
        var sig = SinOsc.ar(44+(env**100*1000));
        sig = sig * env;
        Splay.ar(sig,0.75,0.45);
    };
    ~kick.play;
);" ], [ 2869.1311233, 'alex', "~b[30]=\\filter-> {arg in; GVerb.ar(Limiter.ar(in,0.1),[20,10],4,add:in)};" ], [ 2866.1211191, 'kof', "(
    ~kick.ar(2);
    ~kick.quant=2;
    ~kick.fadeTime=0.2;
    ~kick={
        //         |       |       |       |       |  
        var pat = [1,0,0,0,1,1,0,0,1,0,1,0,1,1,0,0].rotate(1);
        var imp = PulseDivider.kr(~tick.kr,1,~counter.kr);
        var hit = Select.kr(PulseCount.kr(imp)%pat.size,pat);
        var env = EnvGen.ar(Env([0.001,1,0.001],[0.002,1.5],[3,-3],curve:'exp'),imp * hit);
        var sig = SinOsc.ar(44+(env**100*1000));
        sig = sig * env;
        Splay.ar(sig,0.75,0.45);
    };
    ~kick.play;
);" ], [ 2864.0000837, 'joach', "(
~jsin[0] = {
var osc = SinOsc.ar(( \\freq.kr(80) + \\fplus.kr(0) ), mul: 1, add: 0);
var noise = BrownNoise.ar(\\noise.kr(0), (1 - \\noise.kr(0)));
var sig = osc * noise;
Pan2.ar( sig * \\amp.kr(0), \\pan.kr(0) );
};
)" ], [ 2862.6730804, 'alex', "~b.play(vol:1, fadeTime:2);" ], [ 2858.2830742, 'kof', "(
    ~kick.ar(2);
    ~kick.quant=2;
    ~kick.fadeTime=0.2;
    ~kick={
        //         |       |       |       |       |  
        var pat = [1,0,0,0,1,1,0,0,1,0,0,0,1,1,0,0].rotate(1);
        var imp = PulseDivider.kr(~tick.kr,fib(4),~counter.kr);
        var hit = Select.kr(PulseCount.kr(imp)%pat.size,pat);
        var env = EnvGen.ar(Env([0.001,1,0.001],[0.002,1.5],[3,-3],curve:'exp'),imp * hit);
        var sig = SinOsc.ar(44+(env**100*1000));
        sig = sig * env;
        Splay.ar(sig,0.75,0.45);
    };
    ~kick.play;
);" ], [ 2857.9830738, 'alex', "(
~b[0]={
	var sig, sig1, env, fenv;
	
	env=EnvGen.kr(Env([0,1,0],[0.05,3],[\\step, \\step]),\\trig.tr);
	fenv=EnvGen.kr(Env([\\freq.kr,\\freq.kr*\\top.kr(4),\\freq.kr],[0.01,4],[\\step, \\welch]),\\trig.tr);

	sig1=LFSaw.ar([2,3])*LFPulse.ar([\\freq.kr,\\freq.kr+2]);
	sig=Balance2.ar(sig1,HPF.ar(WhiteNoise.ar(0.5),14000)*Decay2.ar(Impulse.ar([4/3,4/3*2]),decayTime:0.15),SinOsc.kr(0.25));
	sig*env;
};)" ], [ 2855.9200378, 'joach', "(
~jsin[1] = \\set -> QuantEnv(\\amp, 0.5)
.phase(1, [0.5,1,0.5], [0.05, 0.45], [2,-8], 0, 16)
.phase(2, [0.5,1,0.5], [0.35, 0.65], [2,-2], 0, 1)
.phase(3, [0.0,1,0.2], [0.35, 1.65], [\\step,-2], 0, 1)
.play([1,2,1,1,3]);
)" ], [ 2852.6490332, 'kof', "(
    ~kick.ar(2);
    ~kick.quant=2;
    ~kick.fadeTime=0.2;
    ~kick={
        //         |       |       |       |       |  
        var pat = [1,0,0,0,1,1,0,0,1,0,0,0,1,1,0,0].rotate(1);
        var imp = PulseDivider.kr(~tick.kr,fib(4),~counter.kr);
        var hit = Select.kr(PulseCount.kr(imp)%pat.size,pat);
        var env = EnvGen.ar(Env([0.001,1,0.001],[0.002,2.5],[3,-3],curve:'exp'),imp * hit);
        var sig = SinOsc.ar(44+(env**100*1000));
        sig = sig * env;
        Splay.ar(sig,0.75,0.45);
    };
    ~kick.play;
);" ], [ 2848.6890277, 'alex', "~b[2]=\\set-> Pbind(\\args, [\\freq], \\dur, 8, \\freq, Pseq([64,57,65,45,35,35],inf));" ], [ 2847.9290266, 'alex', "~b[1]=\\set-> Pbind(\\args, [\\trig], \\dur, 4, \\trig, 1);" ], [ 2846.4390245, 'kof', "(
    ~kick.ar(2);
    ~kick.quant=2;
    ~kick.fadeTime=0.2;
    ~kick={
        //         |       |       |       |       |  
        var pat = [1,0,0,0,1,1,0,0,1,0,0,0,1,1,0,0].rotate(1);
        var imp = PulseDivider.kr(~tick.kr,fib(4),~counter.kr);
        var hit = Select.kr(PulseCount.kr(imp)%pat.size,pat);
        var env = EnvGen.ar(Env([0.001,1,0.001],[0.002,2.5],[3,-3],curve:'exp'),imp * hit);
        var sig = SinOsc.ar(44+(env**10*1000));
        sig = sig * env;
        Splay.ar(sig,0.75,0.45);
    };
    ~kick.play;
);" ], [ 2842.6790192, 'alex', "(
~b[0]={
	var sig, sig1, env, fenv;
	
	env=EnvGen.kr(Env([0,1,0],[0.05,3],[\\step, \\step]),\\trig.tr);
	fenv=EnvGen.kr(Env([\\freq.kr,\\freq.kr*\\top.kr(4),\\freq.kr],[0.01,4],[\\step, \\welch]),\\trig.tr);

	sig1=LFSaw.ar([2,3])*LFPulse.ar([\\freq.kr,\\freq.kr+2]);
	sig=Balance2.ar(sig1,HPF.ar(WhiteNoise.ar(0.5),14000)*Decay2.ar(Impulse.ar([4/3,4/3*2]),decayTime:0.15),SinOsc.kr(1));
	sig*env;
};)" ], [ 2840.4590161, 'kof', "(
    ~kick.ar(2);
    ~kick.quant=2;
    ~kick.fadeTime=0.2;
    ~kick={
        //         |       |       |       |       |  
        var pat = [1,0,0,0,1,1,0,0,1,0,0,0,1,1,0,0].rotate(1);
        var imp = PulseDivider.kr(~tick.kr,fib(4),~counter.kr);
        var hit = Select.kr(PulseCount.kr(imp)%pat.size,pat);
        var env = EnvGen.ar(Env([0.001,1,0.001],[0.002,2.5],[3,-3],curve:'exp'),imp * hit);
        var sig = SinOsc.ar(44+(env**100*1000));
        sig = sig * env;
        Splay.ar(sig,0.75,0.45);
    };
    ~kick.play;
);" ], [ 2839.537983, 'joach', "(
~jsin[6] = \\set -> QuantEnv(\\mulgverb, 0.5)
.phase(1, [0,1,0.5], [0.05, 0.15], [2,-2], 0, 1)
.phase(2, [0,1,0], [0.35, 0.15], [2,-2], 0, 1)
.play([1,2]);
)" ], [ 2835.8479499, 'kof', "~hiss.clear;" ], [ 2835.7149434, 'joach', "(
~jsin[6] = \\set -> QuantEnv(\\mulgverb, 0.5)
.phase(1, [0,1,0], [0.05, 0.15], [2,-2], 0, 1)
.phase(2, [0,1,0], [0.35, 0.15], [2,-2], 0, 1)
.play([1,2]);
)" ], [ 2834.1749413, 'kof', "~kick.clear;" ], [ 2833.9349409, 'alex', "(
~b[0]={
	var sig, sig1, env, fenv;
	
	env=EnvGen.kr(Env([0,1,0],[0.05,3],[\\step, \\step]),\\trig.tr);
	fenv=EnvGen.kr(Env([\\freq.kr,\\freq.kr*\\top.kr(4),\\freq.kr],[0.01,4],[\\step, \\welch]),\\trig.tr);

	sig1=LFSaw.ar([2,3])*LFPulse.ar([\\freq.kr,\\freq.kr+2]);
	sig=Balance2.ar(sig1,HPF.ar(WhiteNoise.ar(0.5),14000)*Decay2.ar(Impulse.ar([4/3,4/3*2]),decayTime:0.15),SinOsc.kr(1));
	sig*env;
};)" ], [ 2831.4579086, 'joach', "~jsin.set(\\lpf_freq, 6000);" ], [ 2827.0828983, 'alex', "~b[2]=\\set-> Pbind(\\args, [\\freq], \\dur, 8, \\freq, Pseq([64,57,65,45,35,35],inf));" ], [ 2826.2528971, 'alex', "~b[1]=\\set-> Pbind(\\args, [\\trig], \\dur, 4, \\trig, 1);" ], [ 2822.0748585, 'joach', "(
~jsin[3] = \\set -> QuantEnv(\\noise, 32)
.phase(1, [0.2,0.7,0.2], [6.05, 0.45], [2,-2], 0, 1)
.phase(2, [0,0.5,0.2], [0.35, 10.65], [2,-2], 0, 1)
.play([1,2]);
)" ], [ 2820.2208557, 'kof', "(
    ~test.ar(2);
    ~test.quant=2;
    ~test.fadeTime=4.2;
    ~test={
        //         |       |       |       |       |  
        var pat = [1,0,0,0,1,0,0,0,1,0,0,0,1,0,0,0].rotate(1);
        var imp = PulseDivider.kr(~tick.kr,[1,2,3,4]*4,~counter.kr);
        var hit = Select.kr(PulseCount.kr(imp)%pat.size,pat);
        var env = EnvGen.ar(Env([0.001,1,0.001],[1.002,4.5],[3,-3],curve:'exp'),imp * hit);
        var sig = LFSaw.ar(44*8pi/(1+[1,2,3,4].reciprocal) + SinOsc.ar(1/[1,2,3,4]).range(-4,4),(1..8)/16);
        sig = LPF.ar(sig,800);
        sig = sig * env;
        Splay.ar(sig,0.75,0.35);
    };
    ~test.play;
);" ], [ 2818.280853, 'alex', "~b.play(vol:0.6, fadeTime:2);" ], [ 2813.7668146, 'joach', "(
~jsin[3] = \\set -> QuantEnv(\\noise, 16)
.phase(1, [0.2,0.7,0.2], [6.05, 0.45], [2,-2], 0, 1)
.phase(2, [0,0.5,0.2], [0.35, 10.65], [2,-2], 0, 1)
.play([1,2]);
)" ], [ 2812.7598122, 'alex', "~b[3]=\\set-> Pbind(\\args, [\\top], \\dur, 16, \\top, Pseq([6,4],inf));" ], [ 2810.8698096, 'alex', "~b[2]=\\set-> Pbind(\\args, [\\freq], \\dur, 8, \\freq, Pseq([64,57,65,45,35,35],inf));" ], [ 2810.0698085, 'alex', "~b[1]=\\set-> Pbind(\\args, [\\trig], \\dur, 4, \\trig, 1);" ], [ 2807.6357714, 'joach', "(
~jsin[3] = \\set -> QuantEnv(\\noise, 16)
.phase(1, [0.2,0.7,0.2], [6.05, 0.45], [2,-2], 0, 1)
.phase(2, [0,1,0], [0.35, 10.65], [2,-2], 0, 1)
.play([1,2]);
)" ], [ 2805.5497681, 'alex', "(
~b[0]={
	var sig, sig1, env, fenv;
	
	env=EnvGen.kr(Env([0,1,0],[0.05,3],[\\step, \\step]),\\trig.tr);
	fenv=EnvGen.kr(Env([\\freq.kr,\\freq.kr*\\top.kr(4),\\freq.kr],[0.01,4],[\\step, \\welch]),\\trig.tr);

	sig1=LFSaw.ar([2,3])*LFPulse.ar([\\freq.kr,\\freq.kr+2]);
	sig=Balance2.ar(sig1,HPF.ar(WhiteNoise.ar(0.5),14000)*Decay2.ar(Impulse.ar([4/3,4/3*2]),decayTime:0.15),SinOsc.kr(0.25));
	sig*env;
};)" ], [ 2804.4677375, 'joach', "(
~jsin[2] = \\set -> QuantEnv(\\fplus, 0.25)
.phase(1, [400,170,0], [0.005, 0.15], [8,-8], 0, 16)
.phase(2, [0,260,0], [0.035, 0.165], [8,-8], 0, 1)
.phase(3, [0,460,40], [0.075, 0.195], [8,-8], 0, 1)
.play([1, 2,3,1,3,2]);
)" ], [ 2799.4677266, 'kof', "(
    ~test.ar(2);
    ~test.quant=2;
    ~test.fadeTime=4.2;
    ~test={
        //         |       |       |       |       |  
        var pat = [1,0,0,0,1,0,0,0,1,0,0,0,1,0,0,0].rotate(1);
        var imp = PulseDivider.kr(~tick.kr,[1,2,3,4]*4,~counter.kr);
        var hit = Select.kr(PulseCount.kr(imp)%pat.size,pat);
        var env = EnvGen.ar(Env([0.001,1,0.001],[1.002,4.5],[3,-3],curve:'exp'),imp * hit);
        var sig = LFSaw.ar(44*2pi/(1+[1,2,3,4].reciprocal) + SinOsc.ar(1/[1,2,3,4]).range(-4,4),(1..8)/16);
        sig = LPF.ar(sig,800);
        sig = sig * env;
        Splay.ar(sig,0.75,0.35);
    };
    ~test.play;
);" ], [ 2790.1077135, 'kof', "(
    ~test.ar(2);
    ~test.quant=2;
    ~test.fadeTime=4.2;
    ~test={
        //         |       |       |       |       |  
        var pat = [1,0,0,0,1,0,0,0,1,0,0,0,1,0,0,0].rotate(3);
        var imp = PulseDivider.kr(~tick.kr,[1,2,3,4]*4,~counter.kr);
        var hit = Select.kr(PulseCount.kr(imp)%pat.size,pat);
        var env = EnvGen.ar(Env([0.001,1,0.001],[1.002,4.5],[3,-3],curve:'exp'),imp * hit);
        var sig = LFSaw.ar(44*2pi/(1+[1,2,3,4].reciprocal) + SinOsc.ar(1/[1,2,3,4]).range(-4,4),(1..8)/16);
        sig = LPF.ar(sig,800);
        sig = sig * env;
        Splay.ar(sig,0.75,0.35);
    };
    ~test.play;
);" ], [ 2785.5766747, 'joach', "(
~jsin[1] = \\set -> QuantEnv(\\amp, 1)
.phase(1, [0.5,1,0.5], [0.05, 0.45], [2,-8], 0, 16)
.phase(2, [0.5,1,0.5], [0.35, 0.65], [2,-2], 0, 1)
.phase(3, [0.0,1,0.2], [0.35, 1.65], [\\step,-2], 0, 1)
.play([1,2,1,1,3]);
)" ], [ 2779.138634, 'joach', "(
~jsin[1] = \\set -> QuantEnv(\\amp, 0.5)
.phase(1, [0.5,1,0.5], [0.05, 0.45], [2,-8], 0, 16)
.phase(2, [0.5,1,0.5], [0.35, 0.65], [2,-2], 0, 1)
.phase(3, [0.0,1,0.2], [0.35, 1.65], [\\step,-2], 0, 1)
.play([1,2,1,1,3]);
)" ], [ 2775.2035964, 'joach', "(
~jsin[1] = \\set -> QuantEnv(\\amp, 0.25)
.phase(1, [0.5,1,0.5], [0.05, 0.45], [2,-8], 0, 16)
.phase(2, [0.5,1,0.5], [0.35, 0.65], [2,-2], 0, 1)
.phase(3, [0.0,1,0.2], [0.35, 1.65], [\\step,-2], 0, 1)
.play([1,2,1,1,3]);
)" ], [ 2768.9085834, 'kof', "(
    ~kick.ar(2);
    ~kick.quant=2;
    ~kick.fadeTime=0.2;
    ~kick={
        //         |       |       |       |       |  
        var pat = [1,0,0,0,1,1,0,0,1,0,0,0,1,1,0,0].rotate(1);
        var imp = PulseDivider.kr(~tick.kr,fib(4),~counter.kr);
        var hit = Select.kr(PulseCount.kr(imp)%pat.size,pat);
        var env = EnvGen.ar(Env([0.001,1,0.001],[0.002,2.5],[3,-3],curve:'exp'),imp * hit);
        var sig = SinOsc.ar(44+(env**100*1000));
        sig = sig * env;
        Splay.ar(sig,0.75,0.45);
    };
    ~kick.play;
);" ], [ 2766.9775806, 'alex', "~b.clear;" ], [ 2766.1465476, 'joach', "(
~jsin[0] = {
var osc = SinOsc.ar(( \\freq.kr(60) + \\fplus.kr(0) ), mul: 1, add: 0);
var noise = BrownNoise.ar(\\noise.kr(0), (1 - \\noise.kr(0)));
var sig = osc * noise;
Pan2.ar( sig * \\amp.kr(0), \\pan.kr(0) );
};
)" ], [ 2759.1245366, 'kof', "(
    ~hiss.ar(2);
    ~hiss.quant=2;
~hiss.fadeTime=0.2;
~hiss={
  //         |       |       |       |       |  
  var pat = [1,0,0,0,1,0,0,0,1,0,0,0,1,1,1,1].rotate(3);
    var imp = PulseDivider.kr(~tick.kr,fib(4),~counter.kr);
  var hit = Select.kr(PulseCount.kr(imp)%pat.size,pat);
  var env = EnvGen.ar(Env([0.001,1,0.001],[0.002,0.15],[3,-3],curve:'exp'),imp * hit);
    var sig = Crackle.ar([0.1,0.2,0.4,0.7]+env);
  sig = sig * env;
  Splay.ar(sig,0.75,0.45);
};
~hiss.play;
);" ], [ 2757.0725006, 'joach', "(
~jsin[0] = {
var osc = LFSaw.ar(( \\freq.kr(60) + \\fplus.kr(0) ), mul: 1, add: 0);
var noise = BrownNoise.ar(\\noise.kr(0), (1 - \\noise.kr(0)));
var sig = osc * noise;
Pan2.ar( sig * \\amp.kr(0), \\pan.kr(0) );
};
)" ], [ 2748.9924893, 'kof', "(
    ~hiss.quant=2;
~hiss.fadeTime=0.2;
~hiss={
  //         |       |       |       |       |  
  var pat = [1,0,0,0,1,0,0,0,1,0,0,0,1,1,1,1].rotate(3);
    var imp = PulseDivider.kr(~tick.kr,1,~counter.kr);
  var hit = Select.kr(PulseCount.kr(imp)%pat.size,pat);
  var env = EnvGen.ar(Env([0.001,1,0.001],[0.002,0.15],[3,-3],curve:'exp'),imp * hit);
    var sig = Crackle.ar([0.1,0.2,0.4,0.7]+env);
  sig = sig * env;
  Splay.ar(sig,0.75,0.45);
};
~hiss.play;
);" ], [ 2746.7024532, 'joach', "~jsin.set(\\lpf_freq, 600);" ], [ 2739.1704085, 'joach', "(
~jsin[6] = \\set -> QuantEnv(\\mulgverb, 0.25)
.phase(1, [0,1,0], [0.05, 0.15], [2,-2], 0, 1)
.phase(2, [0,1,0], [0.35, 0.15], [2,-2], 0, 1)
.play([1,2]);
)" ], [ 2727.5173775, 'kof', "(
    ~kick.ar(2);
    ~kick.quant=2;
    ~kick.fadeTime=0.2;
    ~kick={
        //         |       |       |       |       |  
        var pat = [1,0,0,0,1,1,0,0,1,0,0,0,1,1,0,0].rotate(1);
        var imp = PulseDivider.kr(~tick.kr,1,~counter.kr);
        var hit = Select.kr(PulseCount.kr(imp)%pat.size,pat);
        var env = EnvGen.ar(Env([0.001,1,0.001],[0.002,2.5],[3,-3],curve:'exp'),imp * hit);
        var sig = SinOsc.ar(44+(env**100*1000));
        sig = sig * env;
        Splay.ar(sig,0.75,0.45);
    };
    ~kick.play;
);" ], [ 2727.2643631, 'joach', "(
~jsin[2] = \\set -> QuantEnv(\\fplus, 0.25)
.phase(1, [0,170,0], [0.005, 0.15], [8,-8], 0, 16)
.phase(2, [0,260,0], [0.035, 0.165], [8,-8], 0, 1)
.phase(3, [0,460,40], [0.075, 0.195], [8,-8], 0, 1)
.play([1, 2,3,1,3,2]);
)" ], [ 2718.7383469, 'kof', "(
    ~test.ar(2);
    ~test.quant=2;
    ~test.fadeTime=0.2;
    ~test={
        //         |       |       |       |       |  
        var pat = [1,0,0,0,1,0,0,0,1,0,0,0,1,0,0,0].rotate(3);
        var imp = PulseDivider.kr(~tick.kr,[1,2,3,4]*4,~counter.kr);
        var hit = Select.kr(PulseCount.kr(imp)%pat.size,pat);
        var env = EnvGen.ar(Env([0.001,1,0.001],[1.002,4.5],[3,-3],curve:'exp'),imp * hit);
        var sig = LFSaw.ar(44*4pi/(1+[1,2,3,4].reciprocal) + SinOsc.ar(1/[1,2,3,4]).range(-4,4),(1..8)/16);
        sig = LPF.ar(sig,800);
        sig = sig * env;
        Splay.ar(sig,0.75,0.35);
    };
    ~test.play;
);" ], [ 2716.2383434, 'alex', "~f.clear;" ], [ 2713.9453082, 'joach', "(
~jsin[6] = \\set -> QuantEnv(\\mulgverb, 0.5)
.phase(1, [0,1,0], [0.05, 0.45], [2,-2], 0, 1)
.phase(2, [0,1,0], [0.35, 0.15], [2,-2], 0, 1)
.play([1,2]);
)" ], [ 2709.354271, 'joach', "(
~jsin[6] = \\set -> QuantEnv(\\mulgverb, 1)
.phase(1, [0,1,0], [0.05, 0.45], [2,-2], 0, 1)
.phase(2, [0,1,0], [0.35, 0.15], [2,-2], 0, 1)
.play([1,2]);
)" ], [ 2707.2342647, 'kof', "(
    ~kick.ar(2);
    ~kick.quant=2;
    ~kick.fadeTime=0.2;
    ~kick={
        //         |       |       |       |       |  
        var pat = [1,0,0,0,1,1,0,0,1,0,0,0,1,1,0,0].rotate(1);
        var imp = PulseDivider.kr(~tick.kr,1,~counter.kr);
        var hit = Select.kr(PulseCount.kr(imp)%pat.size,pat);
        var env = EnvGen.ar(Env([0.001,1,0.001],[0.002,2.5],[3,-3],curve:'exp'),imp * hit);
        var sig = SinOsc.ar(44+(env**100*100));
        sig = sig * env;
        Splay.ar(sig,0.75,0.45);
    };
    ~kick.play;
);" ], [ 2703.2442591, 'kof', "(
    ~hiss.ar(2);
    ~hiss.quant=2;
~hiss.fadeTime=0.2;
~hiss={
  //         |       |       |       |       |  
  var pat = [1,0,0,0,1,0,0,0,1,0,0,0,1,0,0,0].rotate(3);
    var imp = PulseDivider.kr(~tick.kr,1,~counter.kr);
  var hit = Select.kr(PulseCount.kr(imp)%pat.size,pat);
  var env = EnvGen.ar(Env([0.001,1,0.001],[0.002,0.15],[3,-3],curve:'exp'),imp * hit);
    var sig = Crackle.ar([0.1,0.2,0.4,0.7]+env);
  sig = sig * env;
  Splay.ar(sig,0.75,0.45);
};
~hiss.play;
);" ], [ 2702.9842588, 'alex', "~f.play(vol:0,fadeTime:5).quant_(5);" ], [ 2701.1472251, 'joach', "(
~jsin[6] = \\set -> QuantEnv(\\mulgverb, 2)
.phase(1, [0,1,0], [0.05, 0.45], [2,-2], 0, 1)
.phase(2, [0,1,0], [0.35, 0.15], [2,-2], 0, 1)
.play([1,2]);
)" ], [ 2699.9492213, 'kof', "(
    ~hiss.ar(2);
    ~hiss.quant=2;
~hiss.fadeTime=0.2;
~hiss={
  //         |       |       |       |       |  
  var pat = [1,0,0,0,1,0,0,0,1,0,0,0,1,0,0,0].rotate(3);
    var imp = PulseDivider.kr(~tick.kr,2,~counter.kr);
  var hit = Select.kr(PulseCount.kr(imp)%pat.size,pat);
  var env = EnvGen.ar(Env([0.001,1,0.001],[0.002,0.15],[3,-3],curve:'exp'),imp * hit);
    var sig = Crackle.ar([0.1,0.2,0.4,0.7]+env);
  sig = sig * env;
  Splay.ar(sig,0.75,0.45);
};
~hiss.play;
);" ], [ 2699.2592203, 'alex', "~f.play(vol:0.1,fadeTime:5).quant_(5);" ], [ 2691.3061761, 'joach', "(
~jsin[3] = \\set -> QuantEnv(\\noise, 16)
.phase(1, [0.2,0.9,0.2], [6.05, 0.45], [2,-2], 0, 1)
.phase(2, [0,1,0], [0.35, 10.65], [2,-2], 0, 1)
.play([1,2]);
)" ], [ 2689.2861733, 'kof', "(
    ~hiss.ar(2);
    ~hiss.quant=2;
~hiss.fadeTime=0.2;
~hiss={
  //         |       |       |       |       |  
  var pat = [1,0,0,0,1,0,0,0,1,0,0,0,1,0,0,0].rotate(1);
    var imp = PulseDivider.kr(~tick.kr,2,~counter.kr);
  var hit = Select.kr(PulseCount.kr(imp)%pat.size,pat);
  var env = EnvGen.ar(Env([0.001,1,0.001],[0.052,0.15],[3,-3],curve:'exp'),imp * hit);
    var sig = Crackle.ar([0.1,0.2,0.4,0.7]+env);
  sig = sig * env;
  Splay.ar(sig,0.75,0.45);
};
~hiss.play;
);" ], [ 2685.2561676, 'alex', "~f[2]=\\set-> Pbind(\\args, [\\freq], \\dur, 8, \\octave, Pseq([[2,3,1], [3,2], [2,3]],inf), \\degree, Pseq([[2,4], [2,1,6]],inf));" ], [ 2682.8931324, 'joach', "(
~jsin[3] = \\set -> QuantEnv(\\noise, 16)
.phase(1, [0.2,0.9,0.2], [6.05, 0.45], [2,-2], 0, 1)
.phase(2, [0,1,0], [0.35, 0.65], [2,-2], 0, 1)
.play([1]);
)" ], [ 2679.6230993, 'joach', "(
~jsin[3] = \\set -> QuantEnv(\\noise, 16)
.phase(1, [0.2,0.9,0.2], [16.05, 0.45], [2,-2], 0, 1)
.phase(2, [0,1,0], [0.35, 0.65], [2,-2], 0, 1)
.play([1]);
)" ], [ 2678.2910929, 'kof', "(
    ~kick.ar(2);
    ~kick.quant=2;
    ~kick.fadeTime=0.2;
    ~kick={
        //         |       |       |       |       |  
        var pat = [1,0,0,0,1,1,0,0,1,0,0,0,1,1,0,0].rotate(1);
        var imp = PulseDivider.kr(~tick.kr,2,~counter.kr);
        var hit = Select.kr(PulseCount.kr(imp)%pat.size,pat);
        var env = EnvGen.ar(Env([0.001,1,0.001],[0.002,2.5],[3,-3],curve:'exp'),imp * hit);
        var sig = SinOsc.ar(44+(env**100*100));
        sig = sig * env;
        Splay.ar(sig,0.75,0.45);
    };
    ~kick.play;
);" ], [ 2672.9710854, 'kof', "(
    ~kick.ar(2);
    ~kick.quant=2;
    ~kick.fadeTime=0.2;
    ~kick={
        //         |       |       |       |       |  
        var pat = [1,0,0,0,1,1,0,0,1,0,0,0,1,1,0,0].rotate(1);
        var imp = PulseDivider.kr(~tick.kr,2,~counter.kr);
        var hit = Select.kr(PulseCount.kr(imp)%pat.size,pat);
        var env = EnvGen.ar(Env([0.001,1,0.001],[0.002,4.5],[3,-3],curve:'exp'),imp * hit);
        var sig = SinOsc.ar(44+(env**100*100));
        sig = sig * env;
        Splay.ar(sig,0.75,0.45);
    };
    ~kick.play;
);" ], [ 2669.6310808, 'kof', "(
    ~kick.ar(2);
    ~kick.quant=2;
    ~kick.fadeTime=0.2;
    ~kick={
        //         |       |       |       |       |  
        var pat = [1,0,0,0,1,1,0,0,1,0,0,0,1,1,0,0].rotate(1);
        var imp = PulseDivider.kr(~tick.kr,8,~counter.kr);
        var hit = Select.kr(PulseCount.kr(imp)%pat.size,pat);
        var env = EnvGen.ar(Env([0.001,1,0.001],[0.002,4.5],[3,-3],curve:'exp'),imp * hit);
        var sig = SinOsc.ar(44+(env**100*100));
        sig = sig * env;
        Splay.ar(sig,0.75,0.45);
    };
    ~kick.play;
);" ], [ 2663.5710399, 'joach', "(
~jsin[1] = \\set -> QuantEnv(\\amp, 0.5)
.phase(1, [0.5,1,0.5], [0.05, 0.45], [2,-8], 0, 16)
.phase(2, [0.5,1,0.5], [0.35, 0.65], [2,-2], 0, 1)
.phase(3, [0.0,1,0.2], [0.35, 1.65], [\\step,-2], 0, 1)
.play([1,2,1,3]);
)" ], [ 2661.8500369, 'kof', "(
    ~kick.ar(2);
    ~kick.quant=2;
    ~kick.fadeTime=0.2;
    ~kick={
        //         |       |       |       |       |  
        var pat = [1,0,0,0,1,1,0,0,1,0,0,0,1,1,0,0].rotate(1);
        var imp = PulseDivider.kr(~tick.kr,8,~counter.kr);
        var hit = Select.kr(PulseCount.kr(imp)%pat.size,pat);
        var env = EnvGen.ar(Env([0.001,1,0.001],[0.002,4.5],[3,-3],curve:'exp'),imp * hit);
        var sig = SinOsc.ar(44+(env**100*100)) + Pulse.ar(4);
        sig = sig * env;
        Splay.ar(sig,0.75,0.45);
    };
    ~kick.play;
);" ], [ 2655.1619953, 'joach', "~jsin.set(\\lpf_freq, 4600);" ], [ 2645.1179481, 'joach', "(
~jsin[3] = \\set -> QuantEnv(\\noise, 8)
.phase(1, [0.2,0.9,0.2], [0.05, 0.45], [2,-2], 0, 1)
.phase(2, [0,1,0], [0.35, 0.65], [2,-2], 0, 1)
.play([1]);
)" ], [ 2639.765907, 'joach', "(
~jsin[2] = \\set -> QuantEnv(\\fplus, 0.25)
.phase(1, [0,170,0], [0.005, 0.15], [8,-8], 0, 16)
.phase(2, [0,860,0], [0.035, 0.165], [8,-8], 0, 1)
.phase(3, [0,460,40], [0.075, 0.195], [8,-8], 0, 1)
.play([1, 2,3,1,3,2]);
)" ], [ 2630.9178651, 'joach', "(
~jsin[2] = \\set -> QuantEnv(\\fplus, 0.25)
.phase(1, [0,170,0], [0.005, 0.15], [8,-8], 0, 16)
.phase(2, [0,260,0], [0.035, 0.165], [8,-8], 0, 1)
.phase(3, [0,460,40], [0.075, 0.195], [8,-8], 0, 1)
.play([1, 2,3,1,3,2]);
)" ], [ 2626.1118229, 'joach', "(
~jsin[2] = \\set -> QuantEnv(\\fplus, 0.25)
.phase(1, [0,870,0], [0.005, 0.15], [8,-8], 0, 16)
.phase(2, [0,260,0], [0.035, 0.165], [8,-8], 0, 1)
.phase(3, [0,460,40], [0.075, 0.195], [8,-8], 0, 1)
.play([1, 2,3,1,3,2]);
)" ], [ 2625.6358191, 'alex', "~f[31]=\\filter-> {arg in; LPF.ar(in,800)};" ], [ 2620.1027788, 'joach', "~jsin.set(\\lpf_freq, 600);" ], [ 2605.2567259, 'joach', "(
~jsin[6] = \\set -> QuantEnv(\\mulgverb, 0.5)
.phase(1, [0,1,0], [0.05, 0.45], [2,-2], 0, 1)
.phase(2, [0,1,0], [0.35, 0.15], [2,-2], 0, 1)
.play([1,2]);
)" ], [ 2601.2166873, 'joach', "(
~jsin[6] = \\set -> QuantEnv(\\mulgverb, 0.5)
.phase(1, [0,1,0], [0.05, 0.45], [2,-2], 0, 1)
.phase(2, [0,1,0], [0.35, 0.65], [2,-2], 0, 1)
.play([1,2]);
)" ], [ 2597.8296521, 'joach', "(
~jsin[6] = \\set -> QuantEnv(\\mulgverb, 0.5)
.phase(1, [0,1,0], [0.05, 0.95], [2,-2], 0, 1)
.phase(2, [0,1,0], [0.35, 0.65], [2,-2], 0, 1)
.play([1,2]);
)" ], [ 2594.2306108, 'joach', "~jsin[5] = \\filter -> {|in| GVerb.ar(in, \\gverb_size.kr(12), \\gverb_time.kr(0.25), 0.9, mul:\\mulgverb.kr(1), add:(1-\\mulgverb.kr(1))) };" ], [ 2593.8936094, 'kof', "(
    ~kick.ar(2);
    ~kick.quant=2;
    ~kick.fadeTime=0.2;
    ~kick={
        //         |       |       |       |       |  
        var pat = [1,0,0,0,1,1,0,0,1,0,0,0,1,1,0,0].rotate(1);
        var imp = PulseDivider.kr(~tick.kr,8,~counter.kr);
        var hit = Select.kr(PulseCount.kr(imp)%pat.size,pat);
        var env = EnvGen.ar(Env([0.001,1,0.001],[0.002,4.5],[3,-3],curve:'exp'),imp * hit);
        var sig = SinOsc.ar(44+(env**100*100)) + Pulse.ar(4);
        sig = sig * env;
        Splay.ar(sig,0.75,0.45);
    };
    ~kick.play;
);" ], [ 2589.303603, 'kof', "(
    ~kick.ar(2);
    ~kick.quant=2;
    ~kick.fadeTime=0.2;
    ~kick={
        //         |       |       |       |       |  
        var pat = [1,0,0,0,1,1,0,0,1,0,0,0,1,1,0,0].rotate(1);
        var imp = PulseDivider.kr(~tick.kr,8,~counter.kr);
        var hit = Select.kr(PulseCount.kr(imp)%pat.size,pat);
        var env = EnvGen.ar(Env([0.001,1,0.001],[0.002,4.5],[3,-3],curve:'exp'),imp * hit);
        var sig = SinOsc.ar(44+(env**100*100)) + Pulse.ar(4);
        sig = sig * env;
        Splay.ar(sig,0.75,0.95);
    };
    ~kick.play;
);" ], [ 2588.1936014, 'alex', "~f[31]=\\filter-> {arg in; LPF.ar(in,800)};" ], [ 2586.6335992, 'kof', "(
    ~kick.ar(2);
    ~kick.quant=2;
    ~kick.fadeTime=0.2;
    ~kick={
        //         |       |       |       |       |  
        var pat = [1,0,0,0,1,1,0,0,1,0,0,0,1,1,0,0].rotate(1);
        var imp = PulseDivider.kr(~tick.kr,8,~counter.kr);
        var hit = Select.kr(PulseCount.kr(imp)%pat.size,pat);
        var env = EnvGen.ar(Env([0.001,1,0.001],[0.002,4.5],[3,-3],curve:'exp'),imp * hit);
        var sig = SinOsc.ar(44+(env**100*100)) + Pulse.ar(8);
        sig = sig * env;
        Splay.ar(sig,0.75,0.95);
    };
    ~kick.play;
);" ], [ 2582.6475604, 'joach', "(
~jsin[2] = \\set -> QuantEnv(\\fplus, 0.25)
.phase(1, [0,470,0], [0.005, 0.15], [8,-8], 0, 16)
.phase(2, [0,260,0], [0.035, 0.165], [8,-8], 0, 1)
.phase(3, [0,460,40], [0.075, 0.195], [8,-8], 0, 1)
.play([1, 2,3,1,3,2]);
)" ], [ 2580.7575578, 'alex', "~f[31]=\\filter-> {arg in; LPF.ar(in,400)};" ], [ 2577.6245214, 'joach', "~jsin.play(vol: 0.9, fadeTime: 8);" ], [ 2571.2965115, 'kof', "(
    ~hiss.ar(2);
    ~hiss.quant=2;
~hiss.fadeTime=0.2;
~hiss={
  //         |       |       |       |       |  
  var pat = [1,0,0,0,1,0,0,0,1,0,0,0,1,0,0,0].rotate(1);
    var imp = PulseDivider.kr(~tick.kr,8,~counter.kr);
  var hit = Select.kr(PulseCount.kr(imp)%pat.size,pat);
  var env = EnvGen.ar(Env([0.001,1,0.001],[0.952,0.15],[3,-3],curve:'exp'),imp * hit);
    var sig = Crackle.ar([0.1,0.2,0.4,0.7]+env);
  sig = sig * env;
  Splay.ar(sig,0.75,0.45);
};
~hiss.play;
);" ], [ 2570.534478, 'joach', "(
~jsin[1] = \\set -> QuantEnv(\\amp, 0.5)
.phase(1, [0.5,1,0.5], [0.05, 0.85], [2,-8], 0, 16)
.phase(2, [0.5,1,0.5], [0.35, 0.65], [2,-2], 0, 1)
.phase(3, [0.0,1,0.2], [0.35, 1.65], [\\step,-2], 0, 1)
.play([1,2,1,3]);
)" ], [ 2569.003444, 'joach', "(
~jsin[0] = {
var osc = SinOsc.ar(( \\freq.kr(60) + \\fplus.kr(0) ), mul: 1, add: 0);
var noise = BrownNoise.ar(\\noise.kr(0), (1 - \\noise.kr(0)));
var sig = osc * noise;
Pan2.ar( sig * \\amp.kr(0), \\pan.kr(0) );
};
)" ], [ 2549.8794153, 'kof', "(
    ~kick.ar(2);
    ~kick.quant=2;
    ~kick.fadeTime=0.2;
    ~kick={
        //         |       |       |       |       |  
        var pat = [1,0,0,0,1,1,0,0,1,0,0,0,1,1,0,0].rotate(1);
        var imp = PulseDivider.kr(~tick.kr,8,~counter.kr);
        var hit = Select.kr(PulseCount.kr(imp)%pat.size,pat);
        var env = EnvGen.ar(Env([0.001,1,0.001],[0.002,4.5],[3,-3],curve:'exp'),imp * hit);
        var sig = SinOsc.ar(44+(env**100*100)) + Pulse.ar(4);
        sig = sig * env;
        Splay.ar(sig,0.75,0.95);
    };
    ~kick.play;
);" ], [ 2544.1983777, 'joach', "(
~jsin[3] = \\set -> QuantEnv(\\noise, 1)
.phase(1, [0.2,0.9,0.2], [0.05, 0.45], [2,-2], 0, 1)
.phase(2, [0,1,0], [0.35, 0.65], [2,-2], 0, 1)
.play([1]);
)" ], [ 2539.3953357, 'joach', "(
~jsin[3] = \\set -> QuantEnv(\\noise, 0.5)
.phase(1, [0.2,0.9,0.2], [0.05, 0.45], [2,-2], 0, 1)
.phase(2, [0,1,0], [0.35, 0.65], [2,-2], 0, 1)
.play([1]);
)" ], [ 2530.4653221, 'alex', "~f[2]=\\set-> Pbind(\\args, [\\freq], \\dur, 8, \\octave, Pseq([[2,3,1], [3,2], [5,3]],inf), \\degree, Pseq([[2,4], [2,1,6]],inf));" ], [ 2526.2953162, 'alex', "~f[2]=\\set-> Pbind(\\args, [\\freq], \\dur, 8, \\octave, Pseq([[2,3,1], [3,2], [5,3]],inf), \\degree, Pseq([[2,4], [2,4,6]],inf));" ], [ 2525.1962852, 'joach', "(
~jsin[3] = \\set -> QuantEnv(\\noise, 0.5)
.phase(1, [0.2,0.5,0.2], [0.05, 0.45], [2,-2], 0, 1)
.phase(2, [0,1,0], [0.35, 0.65], [2,-2], 0, 1)
.play([1]);
)" ], [ 2524.5932808, 'kof', "(
    ~hiss.ar(2);
    ~hiss.quant=2;
~hiss.fadeTime=0.2;
~hiss={
  //         |       |       |       |       |  
  var pat = [1,0,0,0,1,0,0,0,1,0,0,0,1,0,0,0].rotate(1);
    var imp = PulseDivider.kr(~tick.kr,8,~counter.kr);
  var hit = Select.kr(PulseCount.kr(imp)%pat.size,pat);
  var env = EnvGen.ar(Env([0.001,1,0.001],[0.952,0.15],[3,-3],curve:'exp'),imp * hit);
    var sig = Crackle.ar([0.1,0.2,0.4,0.7]+env);
  sig = sig * env;
  Splay.ar(sig,0.75,0.45);
};
~hiss.play;
);" ], [ 2514.3032664, 'kof', "(
    ~kick.ar(2);
    ~kick.quant=2;
    ~kick.fadeTime=0.2;
    ~kick={
        //         |       |       |       |       |  
        var pat = [1,0,0,0,1,1,0,0,1,0,0,0,1,1,0,0].rotate(1);
        var imp = PulseDivider.kr(~tick.kr,8,~counter.kr);
        var hit = Select.kr(PulseCount.kr(imp)%pat.size,pat);
        var env = EnvGen.ar(Env([0.001,1,0.001],[0.002,4.5],[3,-3],curve:'exp'),imp * hit);
        var sig = SinOsc.ar(44+(env**100*100));
        sig = sig * env;
        Splay.ar(sig,0.75,0.95);
    };
    ~kick.play;
);" ], [ 2506.182255, 'alex', "~f[31]=\\filter-> {arg in; LPF.ar(in,1400)};" ], [ 2500.8222475, 'kof', "(
    ~kick.ar(2);
    ~kick.quant=2;
    ~kick.fadeTime=0.2;
    ~kick={
        //         |       |       |       |       |  
        var pat = [1,0,0,0,1,1,0,0,1,0,0,0,1,1,0,0].rotate(1);
        var imp = PulseDivider.kr(~tick.kr,4,~counter.kr);
        var hit = Select.kr(PulseCount.kr(imp)%pat.size,pat);
        var env = EnvGen.ar(Env([0.001,1,0.001],[0.002,4.5],[3,-3],curve:'exp'),imp * hit);
        var sig = SinOsc.ar(44+(env**100*100));
        sig = sig * env;
        Splay.ar(sig,0.75,0.95);
    };
    ~kick.play;
);" ], [ 2499.4222455, 'kof', "(
    ~hiss.ar(2);
    ~hiss.quant=2;
~hiss.fadeTime=0.2;
~hiss={
  //         |       |       |       |       |  
  var pat = [1,0,0,0,1,0,0,0,1,0,0,0,1,0,0,0].rotate(1);
    var imp = PulseDivider.kr(~tick.kr,8,~counter.kr);
  var hit = Select.kr(PulseCount.kr(imp)%pat.size,pat);
  var env = EnvGen.ar(Env([0.001,1,0.001],[0.952,0.15],[3,-3],curve:'exp'),imp * hit);
    var sig = Crackle.ar([0.1,0.2,0.4,0.7]+env);
  sig = sig * env;
  Splay.ar(sig,0.75,0.45);
};
~hiss.play;
);" ], [ 2493.9702088, 'joach', "~jsin[5] = \\filter -> {|in| GVerb.ar(in, \\gverb_size.kr(12), \\gverb_time.kr(8.75), 0.9, mul:\\mulgverb.kr(1), add:(1-\\mulgverb.kr(1))) };" ], [ 2488.2801969, 'kof', "(
    ~hiss.ar(2);
    ~hiss.quant=2;
~hiss.fadeTime=0.2;
~hiss={
  //         |       |       |       |       |  
  var pat = [1,0,0,0,1,0,0,0,1,0,0,0,1,1,1,1].rotate(3);
    var imp = PulseDivider.kr(~tick.kr,8,~counter.kr);
  var hit = Select.kr(PulseCount.kr(imp)%pat.size,pat);
  var env = EnvGen.ar(Env([0.001,1,0.001],[0.952,0.15],[3,-3],curve:'exp'),imp * hit);
    var sig = Crackle.ar([0.1,0.2,0.4,0.7]+env);
  sig = sig * env;
  Splay.ar(sig,0.75,0.45);
};
~hiss.play;
);" ], [ 2486.8641639, 'joach', "(
~jsin[6] = \\set -> QuantEnv(\\mulgverb, 4)
.phase(1, [0,1,0], [0.05, 0.95], [2,-2], 0, 1)
.phase(2, [0,1,0], [0.35, 0.65], [2,-2], 0, 1)
.play([1,2]);
)" ], [ 2484.3081583, 'alex', "~f[31]=\\filter-> {arg in; LPF.ar(in,400)};" ], [ 2475.2781155, 'joach', "(
~jsin[1] = \\set -> QuantEnv(\\amp, 8)
.phase(1, [0.5,1,0.5], [0.05, 0.85], [2,-8], 0, 16)
.phase(2, [0.5,1,0.5], [0.35, 0.65], [2,-2], 0, 1)
.phase(3, [0.0,1,0.2], [0.35, 1.65], [\\step,-2], 0, 1)
.play([1,2,1,3]);
)" ], [ 2472.6941089, 'alex', "~f[31]=\\filter-> {arg in; LPF.ar(in,800)};" ], [ 2469.9841051, 'kof', "(
    ~hiss.ar(2);
    ~hiss.quant=2;
~hiss.fadeTime=0.2;
~hiss={
  //         |       |       |       |       |  
  var pat = [1,0,0,0,1,0,0,0,1,0,0,0,1,1,1,1].rotate(3);
    var imp = PulseDivider.kr(~tick.kr,8,~counter.kr);
  var hit = Select.kr(PulseCount.kr(imp)%pat.size,pat);
  var env = EnvGen.ar(Env([0.001,1,0.001],[1.002,0.15],[3,-3],curve:'exp'),imp * hit);
    var sig = Crackle.ar([0.1,0.2,0.4,0.7]+env);
  sig = sig * env;
  Splay.ar(sig,0.75,0.45);
};
~hiss.play;
);" ], [ 2465.664099, 'kof', "(
    ~hiss.ar(2);
    ~hiss.quant=2;
~hiss.fadeTime=0.2;
~hiss={
  //         |       |       |       |       |  
  var pat = [1,0,0,0,1,0,0,0,1,0,0,0,1,1,1,1].rotate(3);
    var imp = PulseDivider.kr(~tick.kr,8,~counter.kr);
  var hit = Select.kr(PulseCount.kr(imp)%pat.size,pat);
  var env = EnvGen.ar(Env([0.001,1,0.001],[1.002,1.15],[3,-3],curve:'exp'),imp * hit);
    var sig = Crackle.ar([0.1,0.2,0.4,0.7]+env);
  sig = sig * env;
  Splay.ar(sig,0.75,0.45);
};
~hiss.play;
);" ], [ 2458.0640884, 'kof', "(
    ~hiss.ar(2);
    ~hiss.quant=2;
~hiss.fadeTime=0.2;
~hiss={
  //         |       |       |       |       |  
  var pat = [1,0,0,0,1,0,0,0,1,0,0,0,1,1,1,1].rotate(3);
    var imp = PulseDivider.kr(~tick.kr,4,~counter.kr);
  var hit = Select.kr(PulseCount.kr(imp)%pat.size,pat);
  var env = EnvGen.ar(Env([0.001,1,0.001],[1.002,1.15],[3,-3],curve:'exp'),imp * hit);
    var sig = Crackle.ar([0.1,0.2,0.4,0.7]+env);
  sig = sig * env;
  Splay.ar(sig,0.75,0.45);
};
~hiss.play;
);" ], [ 2455.3740846, 'alex', "~f[31]=\\filter-> {arg in; LPF.ar(in,400)};" ], [ 2452.744081, 'kof', "~test.clear;" ], [ 2450.922047, 'joach', "~jsin.play(vol: 0.1, fadeTime: 8);" ], [ 2450.3770438, 'kof', "~kick.clear;" ], [ 2448.8170416, 'kof', "~hiss.clear;" ], [ 2444.4850053, 'joach', "(
~jsin[0] = {
var osc = SinOsc.ar(( \\freq.kr(6000) + \\fplus.kr(0) ), mul: 1, add: 0);
var noise = BrownNoise.ar(\\noise.kr(0), (1 - \\noise.kr(0)));
var sig = osc * noise;
Pan2.ar( sig * \\amp.kr(0), \\pan.kr(0) );
};
)" ], [ 2444.4560036, 'alex', "~f[31]=\\filter-> {arg in; LPF.ar(in,100)};" ], [ 2438.1349936, 'kof', "(
    ~hiss.ar(2);
    ~hiss.quant=2;
~hiss.fadeTime=0.2;
~hiss={
  //         |       |       |       |       |  
  var pat = [1,0,0,0,1,0,0,0,1,0,0,0,1,1,1,1].rotate(3);
    var imp = PulseDivider.kr(~tick.kr,4,~counter.kr);
  var hit = Select.kr(PulseCount.kr(imp)%pat.size,pat);
  var env = EnvGen.ar(Env([0.001,1,0.001],[0.002,0.15],[3,-3],curve:'exp'),imp * hit);
    var sig = Crackle.ar([0.1,0.2,0.4,0.7]+env);
  sig = sig * env;
  Splay.ar(sig,0.75,0.45);
};
~hiss.play;
);" ], [ 2434.4179601, 'joach', "p.clock.tempo_(60/60);" ], [ 2430.59295, 'kof', "(
    ~kick.ar(2);
    ~kick.quant=2;
    ~kick.fadeTime=0.2;
    ~kick={
        //         |       |       |       |       |  
        var pat = [1,0,0,0,1,1,0,0,1,0,0,0,1,1,0,0].rotate(1);
        var imp = PulseDivider.kr(~tick.kr,4,~counter.kr);
        var hit = Select.kr(PulseCount.kr(imp)%pat.size,pat);
        var env = EnvGen.ar(Env([0.001,1,0.001],[0.002,4.5],[3,-3],curve:'exp'),imp * hit);
        var sig = SinOsc.ar(44+(env**100*100));
        sig = sig * env;
        Splay.ar(sig,0.75,0.95);
    };
    ~kick.play;
);" ], [ 2424.5759122, 'joach', "p.clock.tempo_(480/60);" ], [ 2419.1689009, 'kof', "(
    ~kick.ar(2);
    ~kick.quant=2;
    ~kick.fadeTime=0.2;
    ~kick={
        //         |       |       |       |       |  
        var pat = [1,0,0,0,1,1,0,0,1,0,0,0,1,1,0,0].rotate(1);
        var imp = PulseDivider.kr(~tick.kr,1,~counter.kr);
        var hit = Select.kr(PulseCount.kr(imp)%pat.size,pat);
        var env = EnvGen.ar(Env([0.001,1,0.001],[0.002,4.5],[3,-3],curve:'exp'),imp * hit);
        var sig = SinOsc.ar(44+(env**100*100));
        sig = sig * env;
        Splay.ar(sig,0.75,0.95);
    };
    ~kick.play;
);" ], [ 2409.7078876, 'kof', "(
    ~kick.ar(2);
    ~kick.quant=2;
    ~kick.fadeTime=0.2;
    ~kick={
        //         |       |       |       |       |  
        var pat = [1,0,0,0,1,1,0,0,1,0,0,0,1,1,0,0].rotate(1);
        var imp = PulseDivider.kr(~tick.kr,1,~counter.kr);
        var hit = Select.kr(PulseCount.kr(imp)%pat.size,pat);
        var env = EnvGen.ar(Env([0.001,1,0.001],[0.002,4.5],[3,-3],curve:'exp'),imp * hit);
        var sig = SinOsc.ar(44+(env**100*100));
        sig = sig * env;
        Splay.ar(sig,0.75,0.65);
    };
    ~kick.play;
);" ], [ 2408.6768861, 'alex', "~f.play(vol:0.7,fadeTime:5).quant_(5);" ], [ 2401.6668763, 'alex', "~f[31]=\\filter-> {arg in; LPF.ar(in,1600)};" ], [ 2400.776875, 'alex', "~f[30]=\\filter-> {arg in; GVerb.ar(Limiter.ar(in,0.1),[20,40],[5,7],add:in)};" ], [ 2398.9168724, 'alex', "~f[2]=\\set-> Pbind(\\args, [\\freq], \\dur, 8, \\octave, Pseq([[4,2], [3,2], [2,3]],inf), \\degree, Pseq([[2,4], [2,4,6]],inf));" ], [ 2397.7168707, 'alex', "~f[1]=\\set-> Pbind(\\args, [\\trig], \\dur, Pseq([4,6],inf), \\trig, 1);" ], [ 2395.3468674, 'alex', "(
~f[0]={
	var sig,sig1, env, fenv;
	
	env=EnvGen.kr(Env([0,1,0],[0.7,6],[\\welch, \\welch]),\\trig.tr);
	fenv=EnvGen.kr(Env([\\freq.kr,\\freq.kr*\\top.kr(2),\\freq.kr],[0.01,3],[\\step, \\welch]),\\trig.tr);

	sig1=LFSaw.ar(\\freq.kr+[1,2,3,5,8,13].reciprocal).lag([0.001,0.02,0.003]);
	sig=Balance2.ar(sig1, HPF.ar(Decay.ar(Impulse.ar([2,3]),0.1)*WhiteNoise.ar(0.2),\\hpf.kr(11000)),SinOsc.kr(0.5));
	Limiter.ar(sig*env,0.1);
};)" ], [ 2393.646865, 'alex', "~f.play(vol:0.7,fadeTime:5).quant_(5);" ], [ 2386.6158551, 'kof', "(
    ~hiss.ar(2);
    ~hiss.quant=2;
~hiss.fadeTime=0.2;
~hiss={
  //         |       |       |       |       |  
  var pat = [1,0,0,0,1,0,0,0,1,0,0,0,1,1,1,1].rotate(3);
    var imp = PulseDivider.kr(~tick.kr,2,~counter.kr);
  var hit = Select.kr(PulseCount.kr(imp)%pat.size,pat);
  var env = EnvGen.ar(Env([0.001,1,0.001],[0.002,0.15],[3,-3],curve:'exp'),imp * hit);
    var sig = Crackle.ar([0.1,0.2,0.4,0.7]+env);
  sig = sig * env;
  Splay.ar(sig,0.75,0.45);
};
~hiss.play;
);" ], [ 2384.9328225, 'joach', "p.clock.tempo_(6/60);" ], [ 2381.0638143, 'kof', "(
    ~kick.ar(2);
    ~kick.quant=2;
    ~kick.fadeTime=0.2;
    ~kick={
        //         |       |       |       |       |  
        var pat = [1,0,0,0,1,1,0,0,1,0,0,0,1,1,0,0].rotate(1);
        var imp = PulseDivider.kr(~tick.kr,8,~counter.kr);
        var hit = Select.kr(PulseCount.kr(imp)%pat.size,pat);
        var env = EnvGen.ar(Env([0.001,1,0.001],[0.002,4.5],[3,-3],curve:'exp'),imp * hit);
        var sig = SinOsc.ar(44+(env**100*100));
        sig = sig * env;
        Splay.ar(sig,0.75,0.65);
    };
    ~kick.play;
);" ], [ 2379.8107789, 'joach', "p.clock.tempo_(120/60);" ], [ 2379.3567781, 'alex', "~f.clear;" ], [ 2374.8877406, 'joach', "p.clock.tempo_(240/60);" ], [ 2370.5657328, 'kof', "~test.clear;" ], [ 2368.0947293, 'kof', "(
    ~test.quant=2;
    ~test.fadeTime=0.2;
    ~test={
        //         |       |       |       |       |  
        var pat = [1,0,0,0,1,0,0,0,1,0,0,0,1,0,0,0].rotate(3);
        var imp = PulseDivider.kr(~tick.kr,[1,2,3,4]*16,~counter.kr);
        var hit = Select.kr(PulseCount.kr(imp)%pat.size,pat);
        var env = EnvGen.ar(Env([0.001,1,0.001],[1.002,1.5],[3,-3],curve:'exp'),imp * hit);
        var sig = LFSaw.ar(44*4pi/(1+[1,2,3,4].reciprocal) + SinOsc.ar(1/[1,2,3,4]).range(-4,4),(1..8)/16);
        sig = LPF.ar(sig,800);
        sig = sig * env;
        Splay.ar(sig,0.75,0.35);
    };
    ~test.play;
);" ], [ 2365.2147252, 'alex', "p.clock.tempo_(180/60);" ], [ 2362.174721, 'kof', "(
    ~kick.ar(2);
    ~kick.quant=2;
    ~kick.fadeTime=0.2;
    ~kick={
        //         |       |       |       |       |  
        var pat = [1,0,0,0,1,1,0,0,1,0,0,0,1,1,0,0].rotate(1);
        var imp = PulseDivider.kr(~tick.kr,4,~counter.kr);
        var hit = Select.kr(PulseCount.kr(imp)%pat.size,pat);
        var env = EnvGen.ar(Env([0.001,1,0.001],[0.002,4.5],[3,-3],curve:'exp'),imp * hit);
        var sig = SinOsc.ar(44+(env**100*100));
        sig = sig * env;
        Splay.ar(sig,0.75,0.65);
    };
    ~kick.play;
);" ], [ 2354.3337099, 'kof', "(
    ~kick.ar(2);
    ~kick.quant=2;
    ~kick.fadeTime=0.2;
    ~kick={
        //         |       |       |       |       |  
        var pat = [1,0,0,0,1,1,0,0,1,0,0,0,1,1,0,0].rotate(1);
        var imp = PulseDivider.kr(~tick.kr,4,~counter.kr);
        var hit = Select.kr(PulseCount.kr(imp)%pat.size,pat);
        var env = EnvGen.ar(Env([0.001,1,0.001],[0.002,1.5],[3,-3],curve:'exp'),imp * hit);
        var sig = SinOsc.ar(44+(env**100*100));
        sig = sig * env;
        Splay.ar(sig,0.75,0.65);
    };
    ~kick.play;
);" ], [ 2337.1226858, 'kof', "(
    p.clock.tempo_(60/60);

    ~offset = (0..7)/8;

    ~tick.quant = 1;
    ~tick = {Mix(Impulse.kr( ~tempo / 2 , ~offset ))};

    ~counter = {PulseCount.kr(~tick.kr)};
);" ], [ 2333.4926807, 'kof', "(

    ~offset = (0..7)/8;

    ~tick.quant = 1;
    ~tick = {Mix(Impulse.kr( ~tempo / 2 , ~offset ))};

    ~counter = {PulseCount.kr(~tick.kr)};
);" ], [ 2328.9526744, 'kof', "(
    p.clock.tempo_(240/60);

    ~offset = (0..7)/8;

    ~tick.quant = 1;
    ~tick = {Mix(Impulse.kr( ~tempo / 2 , ~offset ))};

    ~counter = {PulseCount.kr(~tick.kr)};
);" ], [ 2326.6026711, 'alex', "~f[31]=\\filter-> {arg in; LPF.ar(in,1600)};" ], [ 2325.0826689, 'kof', "~kick.clear;" ], [ 2324.2236349, 'joach', "(
~jsin[1] = \\set -> QuantEnv(\\amp, 1)
.phase(1, [0.5,1,0.5], [0.05, 0.85], [2,-8], 0, 16)
.phase(2, [0.5,1,0.5], [0.35, 0.65], [2,-2], 0, 1)
.phase(3, [0.0,1,0.2], [0.35, 1.65], [\\step,-2], 0, 1)
.play([1,2,1,3]);
)" ], [ 2320.2905985, 'joach', "(
~jsin[1] = \\set -> QuantEnv(\\amp, 1)
.phase(1, [0.5,1,0.5], [0.05, 7.85], [2,-8], 0, 16)
.phase(2, [0.5,1,0.5], [0.35, 0.65], [2,-2], 0, 1)
.phase(3, [0.0,1,0.2], [0.35, 1.65], [\\step,-2], 0, 1)
.play([1,2,1,3]);
)" ], [ 2318.2075932, 'kof', "(
    ~kick.ar(2);
    ~kick.quant=2;
    ~kick.fadeTime=0.2;
    ~kick={
        //         |       |       |       |       |  
        var pat = [1,0,0,0,1,1,0,0,1,0,0,0,1,1,0,0].rotate(1);
        var imp = PulseDivider.kr(~tick.kr,1,~counter.kr);
        var hit = Select.kr(PulseCount.kr(imp)%pat.size,pat);
        var env = EnvGen.ar(Env([0.001,1,0.001],[0.002,1.5],[3,-3],curve:'exp'),imp * hit);
        var sig = SinOsc.ar(44+(env**100*100));
        sig = sig * env;
        Splay.ar(sig,0.75,0.65);
    };
    ~kick.play;
);" ], [ 2315.8135589, 'joach', "~jsin.set(\\lpf_freq, 2600);" ], [ 2312.9725236, 'joach', "~jsin.set(\\lpf_freq, 4600);" ], [ 2308.2734814, 'joach', "~jsin.play(vol: 0.8, fadeTime: 28);" ], [ 2307.7284787, 'kof', "(
    ~kick.ar(2);
    ~kick.quant=2;
    ~kick.fadeTime=0.2;
    ~kick={
        //         |       |       |       |       |  
        var pat = [1,0,0,0,1,1,0,0,1,0,0,0,1,1,0,0].rotate(1);
        var imp = PulseDivider.kr(~tick.kr,1,~counter.kr);
        var hit = Select.kr(PulseCount.kr(imp)%pat.size,pat);
        var env = EnvGen.ar(Env([0.001,1,0.001],[0.002,1.5],[3,-3],curve:'exp'),imp * hit);
        var sig = SinOsc.ar(44+(env**100*100));
        sig = sig * env;
        Splay.ar(sig,0.75,0.55);
    };
    ~kick.play;
);" ], [ 2299.2144375, 'joach', "(
~jsin[2] = \\set -> QuantEnv(\\fplus, 1)
.phase(1, [0,470,0], [0.005, 0.15], [8,-8], 0, 16)
.phase(2, [0,260,0], [0.035, 0.165], [8,-8], 0, 1)
.phase(3, [0,460,40], [0.075, 0.195], [8,-8], 0, 1)
.play([1, 2,3,1,3,2]);
)" ], [ 2294.6253938, 'joach', "(
~jsin[2] = \\set -> QuantEnv(\\fplus, 1)
.phase(1, [0,170,0], [0.005, 0.15], [8,-8], 0, 16)
.phase(2, [0,260,0], [0.035, 0.165], [8,-8], 0, 1)
.phase(3, [0,460,40], [0.075, 0.195], [8,-8], 0, 1)
.play([1, 2,3,1,3,2]);
)" ], [ 2293.7053925, 'kof', "(
    ~hiss.ar(2);
    ~hiss.quant=2;
~hiss.fadeTime=0.2;
~hiss={
  //         |       |       |       |       |  
  var pat = [1,0,0,0,1,0,0,0,1,0,0,0,1,1,1,1].rotate(3);
    var imp = PulseDivider.kr(~tick.kr,1,~counter.kr);
  var hit = Select.kr(PulseCount.kr(imp)%pat.size,pat);
  var env = EnvGen.ar(Env([0.001,1,0.001],[0.002,0.15],[3,-3],curve:'exp'),imp * hit);
    var sig = Crackle.ar([0.1,0.2,0.4,0.7]+env);
  sig = sig * env;
  Splay.ar(sig,0.75,0.45);
};
~hiss.play;
);" ], [ 2293.4453921, 'alex', "~f.play(vol:0.7,fadeTime:5).quant_(5);" ], [ 2287.4203522, 'joach', "~jsin[3] = nil" ], [ 2286.8353499, 'alex', "(
~f[0]={
	var sig,sig1, env, fenv;
	
	env=EnvGen.kr(Env([0,1,0],[0.7,6],[\\welch, \\welch]),\\trig.tr);
	fenv=EnvGen.kr(Env([\\freq.kr,\\freq.kr*\\top.kr(2),\\freq.kr],[0.01,3],[\\step, \\welch]),\\trig.tr);

	sig1=LFSaw.ar(\\freq.kr+[1,2,3,5,8,13].reciprocal).lag([0.001,0.02,0.003]);
	sig=Balance2.ar(sig1, HPF.ar(Decay.ar(Impulse.ar([2,3]),0.1)*WhiteNoise.ar(0.2),\\hpf.kr(11000)),SinOsc.kr(0.5));
	Limiter.ar(sig*env,0.1);
};)" ], [ 2281.6293116, 'joach', "(
~jsin[6] = \\set -> QuantEnv(\\mulgverb, 1)
.phase(1, [0,1,0], [0.05, 0.95], [2,-2], 0, 1)
.phase(2, [0,1,0], [0.35, 0.65], [2,-2], 0, 1)
.play([1,2]);
)" ], [ 2279.151306, 'kof', "(
    ~kick.ar(2);
    ~kick.quant=2;
    ~kick.fadeTime=0.2;
    ~kick={
        //         |       |       |       |       |  
        var pat = [1,0,0,0,1,1,0,0,1,0,0,0,1,1,0,0].rotate(1);
        var imp = PulseDivider.kr(~tick.kr,2,~counter.kr);
        var hit = Select.kr(PulseCount.kr(imp)%pat.size,pat);
        var env = EnvGen.ar(Env([0.001,1,0.001],[0.002,1.5],[3,-3],curve:'exp'),imp * hit);
        var sig = SinOsc.ar(44+(env**100*100));
        sig = sig * env;
        Splay.ar(sig,0.75,0.55);
    };
    ~kick.play;
);" ], [ 2272.9412974, 'kof', "~kick.clear;" ], [ 2271.7912957, 'alex', "~f[31]=\\filter-> {arg in; LPF.ar(in,600)};" ], [ 2270.3712938, 'kof', "(
    ~kick.quant=2;
    ~kick.fadeTime=0.2;
    ~kick={
        //         |       |       |       |       |  
        var pat = [1,0,0,0,1,1,0,0,1,0,0,0,1,1,0,0].rotate(1);
        var imp = PulseDivider.kr(~tick.kr,2,~counter.kr);
        var hit = Select.kr(PulseCount.kr(imp)%pat.size,pat);
        var env = EnvGen.ar(Env([0.001,1,0.001],[0.002,1.5],[3,-3],curve:'exp'),imp * hit);
        var sig = SinOsc.ar(44+(env**100*100));
        sig = sig * env;
        Splay.ar(sig,0.75,0.55);
    };
    ~kick.play;
);" ], [ 2267.4422607, 'joach', "~jsin[5] = \\filter -> {|in| GVerb.ar(in, \\gverb_size.kr(12), \\gverb_time.kr(0.75), 0.9, mul:\\mulgverb.kr(1), add:(1-\\mulgverb.kr(1))) };" ], [ 2263.7092514, 'kof', "(
    ~kick.quant=2;
    ~kick.fadeTime=0.2;
    ~kick={
        //         |       |       |       |       |  
        var pat = [1,0,0,0,1,1,0,0,1,0,0,0,1,1,0,0].rotate(1);
        var imp = PulseDivider.kr(~tick.kr,2,~counter.kr);
        var hit = Select.kr(PulseCount.kr(imp)%pat.size,pat);
        var env = EnvGen.ar(Env([0.001,1,0.001],[0.002,1.5],[3,-3],curve:'exp'),imp * hit);
        var sig = SinOsc.ar(44+(env**100*100));
        sig = sig * env;
        Splay.ar(sig,0.75,0.55);
    };
    ~kick.play;
);" ], [ 2259.7802136, 'joach', "(
~jsin[2] = \\set -> QuantEnv(\\fplus, 2)
.phase(1, [0,170,0], [0.005, 0.15], [8,-8], 0, 16)
.phase(2, [0,260,0], [0.035, 0.165], [8,-8], 0, 1)
.phase(3, [0,460,40], [0.075, 0.195], [8,-8], 0, 1)
.play([1, 2,3,1,3,2]);
)" ], [ 2256.5041763, 'joach', "(
~jsin[2] = \\set -> QuantEnv(\\fplus, 2)
.phase(1, [0,470,0], [0.005, 0.15], [8,-8], 0, 16)
.phase(2, [0,260,0], [0.035, 0.165], [8,-8], 0, 1)
.phase(3, [0,460,40], [0.075, 0.195], [8,-8], 0, 1)
.play([1, 2,3,1,3,2]);
)" ], [ 2252.1121689, 'alex', "~f[2]=\\set-> Pbind(\\args, [\\freq], \\dur, 8, \\octave, Pseq([[4,2], [3,2], [2,3]],inf), \\degree, Pseq([[2,4], [2,4,6]],inf));" ], [ 2251.2621348, 'joach', "~jsin.play(vol: 0.5, fadeTime: 28);" ], [ 2248.8421314, 'kof', "(
    ~hiss.ar(2);
    ~hiss.quant=2;
~hiss.fadeTime=0.2;
~hiss={
  //         |       |       |       |       |  
  var pat = [1,0,0,0,1,0,0,0,1,0,0,0,1,1,1,1].rotate(3);
    var imp = PulseDivider.kr(~tick.kr,2,~counter.kr);
  var hit = Select.kr(PulseCount.kr(imp)%pat.size,pat);
  var env = EnvGen.ar(Env([0.001,1,0.001],[0.002,0.15],[3,-3],curve:'exp'),imp * hit);
    var sig = Crackle.ar([0.1,0.2,0.4,0.7]+env);
  sig = sig * env;
  Splay.ar(sig,0.75,0.45);
};
~hiss.play;
);" ], [ 2242.7410938, 'joach', "(
~jsin[1] = \\set -> QuantEnv(\\amp, 8)
.phase(1, [0.5,1,0.5], [0.05, 7.85], [2,-8], 0, 16)
.phase(2, [0.5,1,0.5], [0.35, 0.65], [2,-2], 0, 1)
.phase(3, [0.0,1,0.2], [0.35, 1.65], [\\step,-2], 0, 1)
.play([1,2,1,3]);
)" ], [ 2240.312057, 'joach', "(
~jsin[1] = \\set -> QuantEnv(\\amp, 8)
.phase(1, [0.5,1,0.5], [0.05, 0.85], [2,-8], 0, 16)
.phase(2, [0.5,1,0.5], [0.35, 0.65], [2,-2], 0, 1)
.phase(3, [0.0,1,0.2], [0.35, 1.65], [\\step,-2], 0, 1)
.play([1,2,1,3]);
)" ], [ 2239.0190505, 'kof', "(
    ~hiss.ar(2);
    ~hiss.quant=2;
~hiss.fadeTime=0.2;
~hiss={
  //         |       |       |       |       |  
  var pat = [1,0,0,0,1,0,0,0,1,0,0,0,1,1,1,1].rotate(3);
    var imp = PulseDivider.kr(~tick.kr,[2,3,4,5],~counter.kr);
  var hit = Select.kr(PulseCount.kr(imp)%pat.size,pat);
  var env = EnvGen.ar(Env([0.001,1,0.001],[0.002,0.15],[3,-3],curve:'exp'),imp * hit);
    var sig = Crackle.ar([0.1,0.2,0.4,0.7]+env);
  sig = sig * env;
  Splay.ar(sig,0.75,0.45);
};
~hiss.play;
);" ], [ 2231.0580393, 'kof', "(
    ~hiss.ar(2);
    ~hiss.quant=2;
~hiss.fadeTime=0.2;
~hiss={
  //         |       |       |       |       |  
  var pat = [1,0,0,0,1,0,0,0,1,0,0,0,1,1,1,1].rotate(3);
  var imp = PulseDivider.kr(~tick.kr,2,~counter.kr);
  var hit = Select.kr(PulseCount.kr(imp)%pat.size,pat);
  var env = EnvGen.ar(Env([0.001,1,0.001],[0.002,0.15],[3,-3],curve:'exp'),imp * hit);
    var sig = Crackle.ar([0.1,0.2,0.4,0.7]+env);
  sig = sig * env;
  Splay.ar(sig,0.75,0.45);
};
~hiss.play;
);" ], [ 2227.8850113, 'kof', "(
    ~hiss.ar(2);
    ~hiss.quant=2;
~hiss.fadeTime=0.2;
~hiss={
  //         |       |       |       |       |  
  var pat = [1,0,0,0,1,0,0,0,1,0,0,0,1,1,1,1].rotate(3);
  var imp = PulseDivider.kr(~tick.kr,4,~counter.kr);
  var hit = Select.kr(PulseCount.kr(imp)%pat.size,pat);
  var env = EnvGen.ar(Env([0.001,1,0.001],[0.002,0.15],[3,-3],curve:'exp'),imp * hit);
    var sig = Crackle.ar([0.1,0.2,0.4,0.7]+env);
  sig = sig * env;
  Splay.ar(sig,0.75,0.45);
};
~hiss.play;
);" ], [ 2227.7500036, 'joach', "~jsin.set(\\lpf_freq, 1600);" ], [ 2225.1769981, 'alex', "~f[2]=\\set-> Pbind(\\args, [\\freq], \\dur, 8, \\octave, Pseq([[4,2], [3,2], [2,1]],inf), \\degree, Pseq([[2,4], [2,4,6]],inf));" ], [ 2223.2059953, 'alex', "~f[1]=\\set-> Pbind(\\args, [\\trig], \\dur, Pseq([4,6],inf), \\trig, 1);" ], [ 2220.4059914, 'alex', "(
~f[0]={
	var sig,sig1, env, fenv;
	
	env=EnvGen.kr(Env([0,1,0],[0.7,4.3],[\\welch, \\welch]),\\trig.tr);
	fenv=EnvGen.kr(Env([\\freq.kr,\\freq.kr*\\top.kr(2),\\freq.kr],[0.01,3],[\\step, \\welch]),\\trig.tr);

	sig1=LFSaw.ar(\\freq.kr+[1,2,3,5,8,13].reciprocal).lag([0.001,0.02,0.003]);
	sig=Balance2.ar(sig1, HPF.ar(Decay.ar(Impulse.ar([2,3]),0.1)*WhiteNoise.ar(0.2),\\hpf.kr(11000)),SinOsc.kr(0.5));
	Limiter.ar(sig*env,0.1);
};)" ], [ 2218.6839593, 'joach', "(
~jsin[1] = \\set -> QuantEnv(\\amp, 4)
.phase(1, [0.5,1,0.5], [0.05, 0.85], [2,-8], 0, 16)
.phase(2, [0.5,1,0.5], [0.35, 0.65], [2,-2], 0, 1)
.phase(3, [0.0,1,0.2], [0.35, 1.65], [\\step,-2], 0, 1)
.play([1,2,1,3]);
)" ], [ 2217.7079258, 'joach', "(
~jsin[0] = {
var osc = SinOsc.ar(( \\freq.kr(60) + \\fplus.kr(0) ), mul: 1, add: 0);
var noise = BrownNoise.ar(\\noise.kr(0), (1 - \\noise.kr(0)));
var sig = osc * noise;
Pan2.ar( sig * \\amp.kr(0), \\pan.kr(0) );
};
)" ], [ 2217.0508943, 'alex', "~f.play(vol:0.7,fadeTime:5).quant_(5);" ], [ 2216.9348877, 'joach', "~jsin.play(vol: 0.1, fadeTime: 28);" ], [ 2216.4238858, 'kof', "(
    ~hiss.ar(2);
    ~hiss.quant=2;
~hiss.fadeTime=0.2;
~hiss={
  //         |       |       |       |       |  
  var pat = [1,0,0,0,1,0,0,0,1,0,0,0,1,1,1,1].rotate(3);
  var imp = PulseDivider.kr(~tick.kr,4,~counter.kr);
  var hit = Select.kr(PulseCount.kr(imp)%pat.size,pat);
  var env = EnvGen.ar(Env([0.001,1,0.001],[0.002,0.15],[3,-3],curve:'exp'),imp * hit);
    var sig = Crackle.ar(1+env);
  sig = sig * env;
  Splay.ar(sig,0.75,0.45);
};
~hiss.play;
);" ], [ 2215.9538852, 'alex', "~f.scope;" ], [ 2213.7828821, 'alex', "~f.clear;" ], [ 2208.041874, 'kof', "(
    ~hiss.ar(2);
    ~hiss.quant=2;
~hiss.fadeTime=0.2;
~hiss={
  //         |       |       |       |       |  
  var pat = [1,0,0,0,1,0,0,0,1,0,0,0,1,1,1,1].rotate(3);
  var imp = PulseDivider.kr(~tick.kr,4,~counter.kr);
  var hit = Select.kr(PulseCount.kr(imp)%pat.size,pat);
  var env = EnvGen.ar(Env([0.001,1,0.001],[0.002,0.5],[3,-3],curve:'exp'),imp * hit);
    var sig = Crackle.ar(1+env);
  sig = sig * env;
  Splay.ar(sig,0.75,0.45);
};
~hiss.play;
);" ], [ 2207.8118737, 'alex', "(
~f[0]={
	var sig,sig1, env, fenv;
	
	env=EnvGen.kr(Env([0,1,0],[0.7,4.3],[\\welch, \\welch]),\\trig.tr);
	fenv=EnvGen.kr(Env([\\freq.kr,\\freq.kr*\\top.kr(2),\\freq.kr],[0.01,3],[\\step, \\welch]),\\trig.tr);

	sig1=LFSaw.ar(\\freq.kr+[1,2,3,5,8,13].reciprocal).lag([0.001,0.02,0.003]);
	sig=Balance2.ar(sig1, HPF.ar(Decay.ar(Impulse.ar([2,3]),0.1)*WhiteNoise.ar(0.2),\\hpf.kr(11000)),SinOsc.kr(0.5));
	Limiter.ar(sig*env,0.1);
};)" ], [ 2197.6308593, 'kof', "(
    ~ff.quant=1;
    ~ff.fadeTime=1;
    ~ff={
        var high,mid,low;
        var sig = ~test + ~kick + ~hiss;

        sig = GVerb.ar(LPF.ar(sig,500)+HPF.ar(sig,500),40,[3,4],spread:[40,90])/8 + sig;
        low = CompanderD.ar(LPF.ar(sig,400),3/4,1/2,1/2);
        mid = CompanderD.ar(BPF.ar(sig,600,2),3/4,1/2,1/2);
        high = CompanderD.ar(HPF.ar(sig,900),3/4,1/2,1/2);
        sig = CompanderD.ar((high+mid+low).flat,3/4,1/1.1,1/1.1);
        Splay.ar(sig,0.75,0.25);
    };
    ~ff.play;
);" ], [ 2194.1908545, 'alex', "~f[31]=nil;" ], [ 2191.2208504, 'kof', "(
    ~hiss.ar(2);
    ~hiss.quant=2;
~hiss.fadeTime=0.2;
~hiss={
  //         |       |       |       |       |  
  var pat = [1,0,0,0,1,0,0,0,1,0,0,0,1,1,1,1].rotate(3);
  var imp = PulseDivider.kr(~tick.kr,2,~counter.kr);
  var hit = Select.kr(PulseCount.kr(imp)%pat.size,pat);
  var env = EnvGen.ar(Env([0.001,1,0.001],[0.002,0.5],[3,-3],curve:'exp'),imp * hit);
    var sig = Crackle.ar(1+env);
  sig = sig * env;
  Splay.ar(sig,0.75,0.45);
};
~hiss.play;
);" ], [ 2179.7208343, 'alex', "~f[2]=\\set-> Pbind(\\args, [\\freq], \\dur, 8, \\octave, Pseq([[4,2], [3,2], [2,1]],inf), \\degree, Pseq([[2,4], [2,4,6]],inf));" ], [ 2166.5398158, 'alex', "~f[1]=\\set-> Pbind(\\args, [\\trig], \\dur, Pseq([4,6],inf), \\trig, 1);" ], [ 2141.4457804, 'alex', "(
~f[0]={
	var sig,sig1, env, fenv;
	
	env=EnvGen.kr(Env([0,1,0],[0.7,4.3],[\\welch, \\welch]),\\trig.tr);
	fenv=EnvGen.kr(Env([\\freq.kr,\\freq.kr*\\top.kr(2),\\freq.kr],[0.01,3],[\\step, \\welch]),\\trig.tr);

	sig1=LFSaw.ar(\\freq.kr+[1,2,3,5,8,13].reciprocal).lag([0.001,0.02,0.003]);
	sig=Balance2.ar(sig1, HPF.ar(Decay.ar(Impulse.ar([1,5]),0.1)*WhiteNoise.ar(0.2),\\hpf.kr(11000)),SinOsc.kr(0.5));
	Limiter.ar(sig*env,0.1);
};)" ], [ 2098.7527205, 'alex', "~f[2]=\\set-> Pbind(\\args, [\\freq], \\dur, 8, \\octave, Pseq([[4,2], [3,2], [5,2,1]],inf), \\degree, Pseq([[2,4], [2,4,6]],inf));" ], [ 2066.0096745, 'alex', "~f.play(vol:0.7,fadeTime:5).quant_(5);" ], [ 2051.409654, 'alex', "(
~f[0]={
	var sig,sig1, env, fenv;
	
	env=EnvGen.kr(Env([0,1,0],[0.7,4.3],[\\welch, \\welch]),\\trig.tr);
	fenv=EnvGen.kr(Env([\\freq.kr,\\freq.kr*\\top.kr(2),\\freq.kr],[0.01,3],[\\step, \\welch]),\\trig.tr);

	sig1=LFSaw.ar(\\freq.kr+[1,2,3,5,8,13].reciprocal).lag([0.001,0.02,0.003]);
	sig=Balance2.ar(sig1, HPF.ar(Decay.ar(Impulse.ar([2,3]),0.1)*WhiteNoise.ar(0.2),\\hpf.kr(11000)),SinOsc.kr(0.5));
	Limiter.ar(sig*env,0.1);
};)" ], [ 2043.3986428, 'alex', "~f[30]=\\filter-> {arg in; GVerb.ar(Limiter.ar(in,0.1),[20,40],[5,7],add:in)};" ], [ 2035.1986313, 'alex', "~f[30]=\\filter-> {arg in; GVerb.ar(Limiter.ar(in,0.1),[20,40],[10,7],add:in)};" ], [ 2033.2986286, 'alex', "~f[30]=\\filter-> {arg in; GVerb.ar(Limiter.ar(in,0.1),[20,40],[10,7]add:in)};" ], [ 2018.7686083, 'alex', "~f[2]=\\set-> Pbind(\\args, [\\freq], \\dur, 8, \\octave, Pseq([[4,2], [3,2], [5,1]],inf), \\degree, Pseq([[2,4], [2,4,6]],inf));" ], [ 1956.4545208, 'alex', "(
~f[0]={
	var sig,sig1, env, fenv;
	
	env=EnvGen.kr(Env([0,1,0],[0.7,4.3],[\\welch, \\welch]),\\trig.tr);
	fenv=EnvGen.kr(Env([\\freq.kr,\\freq.kr*\\top.kr(2),\\freq.kr],[0.01,3],[\\step, \\welch]),\\trig.tr);

	sig1=LFSaw.ar(\\freq.kr+[1,2,3,5,8,13].reciprocal).lag([0.001,0.002,0.003]);
	sig=Balance2.ar(sig1, HPF.ar(Decay.ar(Impulse.ar([2,3]),0.1)*WhiteNoise.ar(0.2),\\hpf.kr(11000)),SinOsc.kr(0.5));
	Limiter.ar(sig*env,0.1);
};)" ], [ 1923.8624751, 'alex', "(
~f[0]={
	var sig,sig1, env, fenv;
	
	env=EnvGen.kr(Env([0,1,0],[0.7,4.3],[\\welch, \\welch]),\\trig.tr);
	fenv=EnvGen.kr(Env([\\freq.kr,\\freq.kr*\\top.kr(2),\\freq.kr],[0.01,3],[\\step, \\welch]),\\trig.tr);

	sig1=LFSaw.ar(\\freq.kr+[1,2,3,5,8,13].reciprocal).lag([0.001,0.002,0.003]);
	sig=Balance2.ar(sig1, Decay.ar(Impulse.ar([2,3]),0.1)*WhiteNoise.ar(0.2),SinOsc.kr(0.5));
	Limiter.ar(sig*env,0.1);
};)" ], [ 1918.4524675, 'alex', "~f.play(vol:0.7,fadeTime:5);" ], [ 1914.2224616, 'alex', "~f[30]=\\filter-> {arg in; GVerb.ar(Limiter.ar(in,0.1),[20,40],add:in)};" ], [ 1904.1594473, 'alex', "~f[30]=\\filter-> {arg in; GVerb.ar(Limiter.ar(in,0.1),[20,10],add:in)};" ], [ 1903.0794458, 'alex', "~f[3]=\\set-> Pbind(\\args, [\\top], \\dur, 16, \\top, Pseq([8,5,6,4],inf));" ], [ 1900.8394427, 'alex', "~f[2]=\\set-> Pbind(\\args, [\\freq], \\dur, 8, \\freq, Pseq([145,165,135,85,65],inf));" ], [ 1898.1194389, 'alex', "~f[1]=\\set-> Pbind(\\args, [\\trig], \\dur, 4, \\trig, 1);" ], [ 1895.5194352, 'alex', "(
~f[0]={
	var sig,sig1, env, fenv;
	
	env=EnvGen.kr(Env([0,1,0],[0.7,4.3],[\\welch, \\welch]),\\trig.tr);
	fenv=EnvGen.kr(Env([\\freq.kr,\\freq.kr*\\top.kr(2),\\freq.kr],[0.01,3],[\\step, \\welch]),\\trig.tr);

	sig1=LFSaw.ar(\\freq.kr+[1,2,3,5,8,13].reciprocal).lag([0.001,0.002,0.003]);
	sig=Balance2.ar(sig1, Decay.ar(Impulse.ar([2,3]),0.1)*WhiteNoise.ar(0.002),SinOsc.kr(0.5));
	Limiter.ar(sig*env,0.1);
};)" ], [ 1878.199411, 'alex', "~f.clear;" ], [ 1854.718378, 'alex', "(
~f[0]={
	var sig,sig1, env, fenv;
	
	env=EnvGen.kr(Env([0,1,0],[0.7,4.3],[\\welch, \\welch]),\\trig.tr);
	fenv=EnvGen.kr(Env([\\freq.kr,\\freq.kr*\\top.kr(2),\\freq.kr],[0.01,3],[\\step, \\welch]),\\trig.tr);

	sig1=LFSaw.ar(\\freq.kr+[1,2,3,5,8,13].reciprocal).lag([0.001,0.002,0.003]);
	sig=Balance2.ar(sig1, Decay.ar(LFPulse.ar([2,3]),0.1)*WhiteNoise.ar(0.002),SinOsc.kr(0.5));
	Limiter.ar(sig*env,0.1);
};)" ], [ 1843.0283617, 'alex', "(
~f[0]={
	var sig,sig1, env, fenv;
	
	env=EnvGen.kr(Env([0,1,0],[0.7,4.3],[\\welch, \\welch]),\\trig.tr);
	fenv=EnvGen.kr(Env([\\freq.kr,\\freq.kr*\\top.kr(2),\\freq.kr],[0.01,3],[\\step, \\welch]),\\trig.tr);

	sig1=LFSaw.ar(\\freq.kr+[1,2,3,5,8,13].reciprocal).lag([0.001,0.002,0.003]);
	sig=Balance2.ar(sig1, Decay.ar(LFPulse.ar([2,3]),0.1)*GrayNoise.ar(0.002),SinOsc.kr(0.5));
	Limiter.ar(sig*env,0.1);
};)" ], [ 1835.6683514, 'alex', "~f.play(vol:0.7,fadeTime:5);" ], [ 1821.0463308, 'alex', "(
~f[0]={
	var sig,sig1, env, fenv;
	
	env=EnvGen.kr(Env([0,1,0],[0.7,4.3],[\\welch, \\welch]),\\trig.tr);
	fenv=EnvGen.kr(Env([\\freq.kr,\\freq.kr*\\top.kr(2),\\freq.kr],[0.01,3],[\\step, \\welch]),\\trig.tr);

	sig1=LFSaw.ar(\\freq.kr+[1,2,3,5,8,13].reciprocal).lag([0.001,0.002,0.003]);
	sig=Balance2.ar(sig1, Decay.ar(LFPulse.ar([2,3]),0.1)*GrayNoise.ar(0.02),SinOsc.kr(0.5));
	Limiter.ar(sig*env,0.1);
};)" ], [ 1815.3063228, 'alex', "~f.play(vol:0.2,fadeTime:5);" ], [ 1806.0063097, 'alex', "~f.play(vol:0.5,fadeTime:5);" ], [ 1800.8663025, 'alex', "p.clock.tempo_(60/60);" ], [ 1763.2352498, 'alex', "(
~f[0]={
	var sig,sig1, env, fenv;
	
	env=EnvGen.kr(Env([0,1,0],[0.7,4.3],[\\welch, \\welch]),\\trig.tr);
	fenv=EnvGen.kr(Env([\\freq.kr,\\freq.kr*\\top.kr(2),\\freq.kr],[0.01,3],[\\step, \\welch]),\\trig.tr);

	sig1=LFSaw.ar(\\freq.kr+[1,2,3,5,8,13].reciprocal).lag([0.001,0.002,0.003]);
	sig=Balance2.ar(sig1, Decay.ar(LFPulse.ar([2,3]),0.1)*GrayNoise.ar(0.2),SinOsc.kr(0.5));
	Limiter.ar(sig*env,0.1);
};)" ], [ 1755.6732391, 'alex', "~f[2]=\\set-> Pbind(\\args, [\\freq], \\dur, 8, \\freq, Pseq([145,165,135,85,65],inf));" ], [ 1748.9932298, 'alex', "~f[1]=\\set-> Pbind(\\args, [\\trig], \\dur, 4, \\trig, 1);" ], [ 1745.9732255, 'alex', "(
~f[0]={
	var sig,sig1, env, fenv;
	
	env=EnvGen.kr(Env([0,1,0],[0.7,4.3],[\\welch, \\welch]),\\trig.tr);
	fenv=EnvGen.kr(Env([\\freq.kr,\\freq.kr*\\top.kr(2),\\freq.kr],[0.01,3],[\\step, \\welch]),\\trig.tr);

	sig1=LFSaw.ar(\\freq.kr+[1,2,3,5,8,13].reciprocal).lag([0.001,0.002,0.003]);
	sig=Balance2.ar(sig1, Decay.ar(LFPulse.ar([2,3]),0.5)*GrayNoise.ar(0.2),SinOsc.kr(0.5));
	Limiter.ar(sig*env,0.1);
};)" ], [ 1726.1631978, 'alex', "~f[1]=\\set-> Pbind(\\args, [\\trig], \\dur, 4, \\trig, 1);" ], [ 1722.6731929, 'alex', "(
~f[0]={
	var sig,sig1, env, fenv;
	
	env=EnvGen.kr(Env([0,1,0],[0.7,4.3],[\\welch, \\welch]),\\trig.tr);
	fenv=EnvGen.kr(Env([\\freq.kr,\\freq.kr*\\top.kr(2),\\freq.kr],[0.01,3],[\\step, \\welch]),\\trig.tr);

	sig1=LFSaw.ar(\\freq.kr+[1,2,3,5,8,13].reciprocal).lag([0.001,0.002,0.003]);
	sig=Balance2.ar(sig1, Decay.ar(LFPulse.ar([2,3]),0.5)*GrayNoise.ar(0.2),SinOsc.kr(0.5));
	sig*env;
};)" ], [ 1699.2301599, 'alex', "~d.clear;" ], [ 1695.8301552, 'alex', "~d.stop;" ], [ 1556.4229596, 'alex', "~d[29]=\\filter-> {arg in; CombL.ar(in,2,\\del.kr(0.5),2)};" ], [ 1555.6029255, 'joach', "~jsin.stop(3);" ], [ 1549.521917, 'alex', "~d[31]=\\filter-> {arg in; LPF.ar(in,100)};" ], [ 1542.420907, 'alex', "~d[29]=\\filter-> {arg in; CombL.ar(in,2,\\del.kr(0.25),2)};" ], [ 1537.8058701, 'joach', "~jsin.stop(3);" ], [ 1532.0908596, 'alex', "~d[31]=\\filter-> {arg in; LPF.ar(in,800)};" ], [ 1528.3108543, 'alex', "~d[31]=\\filter-> {arg in; LPF.ar(in,100)};" ], [ 1522.2998458, 'alex', "~d[31]=\\filter-> {arg in; LPF.ar(in,400)};" ], [ 1521.092813, 'joach', "~jsin.stop(30);" ], [ 1515.6357743, 'joach', "(
~jsin[3] = \\set -> QuantEnv(\\noise, 8)
.phase(1, [0.2,0.5,0.2], [0.05, 7.95], [2,-2], 0, 1)
.phase(2, [0,1,0], [0.35, 0.65], [2,-2], 0, 1)
.play([1]);
)" ], [ 1512.6867368, 'joach', "(
~jsin[3] = \\set -> QuantEnv(\\noise, 8)
.phase(1, [0.2,0.5,0.2], [0.05, 0.95], [2,-2], 0, 1)
.phase(2, [0,1,0], [0.35, 0.65], [2,-2], 0, 1)
.play([1]);
)" ], [ 1512.1847326, 'alex', "~d[31]=\\filter-> {arg in; LPF.ar(in,100)};" ], [ 1508.8516954, 'joach', "~jsin[3] = nil" ], [ 1507.2116596, 'joach', "(
~jsin[2] = \\set -> QuantEnv(\\fplus, 8)
.phase(1, [0,470,0], [0.005, 0.15], [8,-8], 0, 16)
.phase(2, [0,260,0], [0.035, 0.165], [8,-8], 0, 1)
.phase(3, [0,460,40], [0.075, 0.195], [8,-8], 0, 1)
.play([1, 2,3,1,3,2]);
)" ], [ 1505.9516579, 'alex', "~d[31]=\\filter-> {arg in; LPF.ar(in,200)};" ], [ 1500.6596197, 'joach', "(
~jsin[2] = \\set -> QuantEnv(\\fplus, 2)
.phase(1, [0,470,0], [0.005, 0.15], [8,-8], 0, 16)
.phase(2, [0,260,0], [0.035, 0.165], [8,-8], 0, 1)
.phase(3, [0,460,40], [0.075, 0.195], [8,-8], 0, 1)
.play([1, 2,3,1,3,2]);
)" ], [ 1496.5125789, 'joach', "(
~jsin[1] = \\set -> QuantEnv(\\amp, 4)
.phase(1, [0.5,1,0.5], [0.05, 0.85], [2,-8], 0, 16)
.phase(2, [0.5,1,0.5], [0.35, 0.65], [2,-2], 0, 1)
.phase(3, [0.0,1,0.2], [0.35, 1.65], [\\step,-2], 0, 1)
.play([1,2,1,3]);
)" ], [ 1482.9645299, 'joach', "~jsin.set(\\lpf_freq, 600);" ], [ 1474.6564826, 'joach', "(
~jsin[1] = \\set -> QuantEnv(\\amp, 2)
.phase(1, [0.5,1,0.5], [0.05, 0.85], [2,-8], 0, 16).plot
.phase(2, [0.5,1,0.5], [0.35, 0.65], [2,-2], 0, 1)
.phase(3, [0.0,1,0.2], [0.35, 1.65], [\\step,-2], 0, 1)
.play([1,2,1,3]);
)" ], [ 1470.5104441, 'joach', "(
~jsin[1] = \\set -> QuantEnv(\\amp, 2)
.phase(1, [0.5,1,0.5], [0.05, 0.85], [2,-1], 0, 16).plot
.phase(2, [0.5,1,0.5], [0.35, 0.65], [2,-2], 0, 1)
.phase(3, [0.0,1,0.2], [0.35, 1.65], [\\step,-2], 0, 1)
.play([1,2,1,3]);
)" ], [ 1470.4024419, 'alex', "~d[2]=\\set-> Pbind(\\args, [\\freq], \\dur, 8, \\freq, Pseq([64,57,65,45,35,35],inf));" ], [ 1463.7164009, 'joach', "(
~jsin[1] = \\set -> QuantEnv(\\amp, 2)
.phase(1, [0.5,1,0.5], [0.05, 0.45], [2,-1], 0, 16).plot
.phase(2, [0.5,1,0.5], [0.35, 0.65], [2,-2], 0, 1)
.phase(3, [0.0,1,0.2], [0.35, 1.65], [\\step,-2], 0, 1)
.play([1,2,1,3]);
)" ], [ 1461.538364, 'joach', "(
~jsin[1] = \\set -> QuantEnv(\\amp, 2)
.phase(1, [0.5,1,0.5], [0.05, 0.45], [2,-1], 0, 16)
.phase(2, [0.5,1,0.5], [0.35, 0.65], [2,-2], 0, 1)
.phase(3, [0.0,1,0.2], [0.35, 1.65], [\\step,-2], 0, 1)
.play([1,2,1,3]);
)" ], [ 1447.7463099, 'alex', "(
~d[0]={
	var sig, env, fenv;
	
	env=EnvGen.kr(Env([0,1,0],[0.05,3],[\\step, \\step]),\\trig.tr);
	fenv=EnvGen.kr(Env([\\freq.kr,\\freq.kr*\\top.kr(4),\\freq.kr],[0.01,0.04],[\\step, \\welch]),\\trig.tr);

	sig=SinOsc.ar(fenv!2);
	sig*env;
};)" ], [ 1446.1062747, 'joach', "(
~jsin[1] = \\set -> QuantEnv(\\amp, 2)
.phase(1, [0.5,1,0.5], [0.05, 0.45], [2,\\welch], 0, 16)
.phase(2, [0.5,1,0.5], [0.35, 0.65], [2,-2], 0, 1)
.phase(3, [0.0,1,0.2], [0.35, 1.65], [\\step,-2], 0, 1)
.play([1,2,1,3]);
)" ], [ 1437.6702626, 'alex', "~d[31]=\\filter-> {arg in; LPF.ar(in,800)};" ], [ 1430.147219, 'joach', "(
~jsin[0] = {
var osc = SinOsc.ar(( \\freq.kr(60) + \\fplus.kr(0) ), mul: 1, add: 0);
var noise = BrownNoise.ar(\\noise.kr(0), (1 - \\noise.kr(0)));
var sig = osc * noise;
Pan2.ar( sig * \\amp.kr(0), \\pan.kr(0) );
};
)" ], [ 1426.4351846, 'joach', "~jsin.set(\\lpf_freq, 4600);" ], [ 1420.6551425, 'joach', "(
~jsin[0] = {
var osc = SinOsc.ar(( \\freq.kr(60) + \\fplus.kr(0) ), mul: 1, add: 0);
var noise = BrownNoise.ar(\\noise.kr(0), (1 - \\noise.kr(0)));
var sig = osc * noise;
Pan2.ar( sig * \\amp.kr(0), \\pan.kr(0) );
};
)" ], [ 1419.2261043, 'joach', "~jsin.play(vol: 0.9, fadeTime: 28);" ], [ 1408.2020579, 'joach', "(
~jsin[2] = \\set -> QuantEnv(\\fplus, 1)
.phase(1, [0,470,0], [0.005, 0.15], [8,-8], 0, 16)
.phase(2, [0,260,0], [0.035, 0.165], [8,-8], 0, 1)
.phase(3, [0,460,40], [0.075, 0.195], [8,-8], 0, 1)
.play([1, 2,3,1,3,2]);
)" ], [ 1403.6130186, 'joach', "(
~jsin[2] = \\set -> QuantEnv(\\fplus, 0.5)
.phase(1, [0,470,0], [0.005, 0.15], [8,-8], 0, 16)
.phase(2, [0,260,0], [0.035, 0.165], [8,-8], 0, 1)
.phase(3, [0,460,40], [0.075, 0.195], [8,-8], 0, 1)
.play([1, 2,3,1,3,2]);
)" ], [ 1401.7539798, 'joach', "(
~jsin[2] = \\set -> QuantEnv(\\fplus, 0.5)
.phase(1, [0,470,0], [0.005, 0.15], [8,-8], 0, 16)
.phase(2, [0,260,0], [0.035, 0.165], [8,-8], 0, 1)
.phase(3, [80,460,40], [0.075, 0.195], [8,-8], 0, 1)
.play([1, 2,3,1,3,2]);
)" ], [ 1393.8909396, 'joach', "(
~jsin[2] = \\set -> QuantEnv(\\fplus, 0.5)
.phase(1, [0,470,0], [0.005, 0.15], [8,-8], 0, 16)
.phase(2, [80,260,0], [0.035, 0.165], [8,-8], 0, 1)
.phase(3, [80,460,40], [0.075, 0.195], [8,-8], 0, 1)
.play([1, 2,3,1,3,2]);
)" ], [ 1389.0149286, 'alex', "~d[2]=\\set-> Pbind(\\args, [\\freq], \\dur, 8, \\freq, Pseq([64,57,85,45],inf));" ], [ 1387.9349271, 'alex', "~d[1]=\\set-> Pbind(\\args, [\\trig], \\dur, 4, \\trig, 1);" ], [ 1384.8749228, 'alex', "(
~d[0]={
	var sig, env, fenv;
	
	env=EnvGen.kr(Env([0,1,0],[0.05,3],[\\step, \\step]),\\trig.tr);
	fenv=EnvGen.kr(Env([\\freq.kr,\\freq.kr*\\top.kr(8),\\freq.kr],[0.01,0.04],[\\step, \\welch]),\\trig.tr);

	sig=SinOsc.ar(fenv!2);
	sig*env;
};)" ], [ 1380.9849173, 'alex', "~d.play(vol:0.6, fadeTime:2);" ], [ 1378.8238858, 'joach', "~jsin.set(\\lpf_freq, 600);" ], [ 1372.9218434, 'joach', "~jsin.set(\\lpf_freq, 200);" ], [ 1371.574821, 'alex', "(
~d[0]={
	var sig, env, fenv;
	
	env=EnvGen.kr(Env([0,1,0],[0.05,3],[\\step, \\step]),\\trig.tr);
	fenv=EnvGen.kr(Env([\\freq.kr,\\freq.kr*\\top.kr(8),\\freq.kr],[0.01,0.04],[\\step, \\welch]),\\trig.tr);

	sig=SinOsc.ar(fenv!2);
	sig*env;
};)" ], [ 1371.2968051, 'joach', "~jsin.set(\\lpf_freq, 800);" ], [ 1367.5327996, 'alex', "~d[1]=\\set-> Pbind(\\args, [\\trig], \\dur, 4, \\trig, 1);" ], [ 1366.3747691, 'joach', "(
~jsin[0] = {
var osc = LFSaw.ar(( \\freq.kr(60) + \\fplus.kr(0) ), mul: 1, add: 0);
var noise = BrownNoise.ar(\\noise.kr(0), (1 - \\noise.kr(0)));
var sig = osc * noise;
Pan2.ar( sig * \\amp.kr(0), \\pan.kr(0) );
};
)" ], [ 1364.0597617, 'alex', "~d.play(vol:0.2, fadeTime:2);" ], [ 1350.763712, 'joach', "(
~jsin[2] = \\set -> QuantEnv(\\fplus, 1)
.phase(1, [0,470,0], [0.005, 0.15], [8,-8], 0, 16)
.phase(2, [80,260,0], [0.035, 0.165], [8,-8], 0, 1)
.phase(3, [80,460,40], [0.075, 0.195], [8,-8], 0, 1)
.play([1, 2,3,1,3,2]);
)" ], [ 1344.1687008, 'alex', "~d[30]=\\filter-> {arg in; GVerb.ar(Limiter.ar(in,0.1),[20,10],10,add:in)};" ], [ 1343.1156663, 'joach', "(
~jsin[1] = \\set -> QuantEnv(\\amp, 2)
.phase(1, [0.5,1,0.5], [0.05, 0.45], [2,-2], 0, 16)
.phase(2, [0.5,1,0.5], [0.35, 0.65], [2,-2], 0, 1)
.phase(3, [0.0,1,0.2], [0.35, 1.65], [\\step,-2], 0, 1)
.play([1,2,1,3]);
)" ], [ 1342.3556652, 'alex', "~d[29]=nil;" ], [ 1341.465664, 'alex', "~d[29]=\\filter-> {arg in; CombL.ar(in,2,\\del.kr(0.25),2)};" ], [ 1340.2556623, 'alex', "~d[29]=nil;" ], [ 1334.1256537, 'alex', "~d.play(vol:0.5, fadeTime:2);" ], [ 1331.2146211, 'joach', "(
~jsin[1] = \\set -> QuantEnv(\\amp, 2)
.phase(1, [0.5,1,0.5], [0.05, 0.95], [2,-2], 0, 16)
.phase(2, [0.5,1,0.5], [0.35, 0.65], [2,-2], 0, 1)
.phase(3, [0.0,1,0.2], [0.35, 1.65], [\\step,-2], 0, 1)
.play([1,2,1,3]);
)" ], [ 1326.3426097, 'alex', "~d[3]=\\set-> Pbind(\\args, [\\top], \\dur, 16, \\top, Pseq([6,4],inf));" ], [ 1324.3355769, 'joach', "~jsin[5] = \\filter -> {|in| GVerb.ar(in, \\gverb_size.kr(12), \\gverb_time.kr(2.25), 0.9, mul:\\mulgverb.kr(1), add:(1-\\mulgverb.kr(1))) };" ], [ 1320.9605691, 'alex', "~d[2]=\\set-> Pbind(\\args, [\\freq], \\dur, 8, \\freq, Pseq([64,57,85,45],inf));" ], [ 1319.9665352, 'joach', "(
~jsin[6] = \\set -> QuantEnv(\\mulgverb, 1)
.phase(1, [0,1,0], [0.05, 0.95], [2,-2], 0, 1)
.phase(2, [0,1,0], [0.35, 0.65], [2,-2], 0, 1)
.play([1,2]);
)" ], [ 1319.5785342, 'alex', "~d[1]=\\set-> Pbind(\\args, [\\trig], \\dur, 4, \\trig, 1);" ], [ 1316.7485302, 'alex', "(
~d[0]={
	var sig, env, fenv;
	
	env=EnvGen.kr(Env([0,1,0],[0.05,0.5],[\\step, \\step]),\\trig.tr);
	fenv=EnvGen.kr(Env([\\freq.kr,\\freq.kr*\\top.kr(8),\\freq.kr],[0.01,0.04],[\\step, \\welch]),\\trig.tr);

	sig=SinOsc.ar(fenv!2);
	sig*env;
};)" ], [ 1310.6784899, 'joach', "(
~jsin[6] = \\set -> QuantEnv(\\mulgverb, 4)
.phase(1, [0,1,0], [0.05, 0.95], [2,-2], 0, 1)
.phase(2, [0,1,0], [0.35, 0.65], [2,-2], 0, 1)
.play([1,2]);
)" ], [ 1305.7394808, 'alex', "~d[29]=nil;" ], [ 1305.1154479, 'joach', "~jsin[4] = \\filter -> {|in| LPF.ar(in, \\lpf_freq.kr(600,28)) };" ], [ 1302.5884434, 'alex', "~d[39]=nil;" ], [ 1289.2803937, 'joach', "(
~jsin[1] = \\set -> QuantEnv(\\amp, 4)
.phase(1, [0.5,1,0.5], [0.05, 0.95], [2,-2], 0, 16)
.phase(2, [0.5,1,0.5], [0.35, 0.65], [2,-2], 0, 1)
.phase(3, [0.0,1,0.2], [0.35, 1.65], [\\step,-2], 0, 1)
.play([1,2,1,3]);
)" ], [ 1279.7793496, 'joach', "(
~jsin[1] = \\set -> QuantEnv(\\amp, 1)
.phase(1, [0.5,1,0.5], [0.05, 0.95], [2,-2], 0, 16)
.phase(2, [0.5,1,0.5], [3.35, 4.65], [2,-2], 0, 1)
.phase(3, [0.0,1,0.2], [0.35, 1.65], [\\step,-2], 0, 1)
.play([1,2,1,3]);
)" ], [ 1276.8263085, 'joach', "p.clock.tempo_(240/60);" ], [ 1274.4292768, 'joach', "~jsin[3] = nil" ], [ 1268.0792345, 'joach', "~jsin.set(\\lpf_freq, 1800);" ], [ 1264.146192, 'joach', "~jsin.set(\\lpf_freq, 4800);" ], [ 1262.2941569, 'joach', "~jsin[5] = \\filter -> {|in| GVerb.ar(in, \\gverb_size.kr(60), \\gverb_time.kr(2.25), 0.9, mul:\\mulgverb.kr(1), add:(1-\\mulgverb.kr(1))) };" ], [ 1255.9601154, 'joach', "(
~jsin[6] = \\set -> QuantEnv(\\mulgverb, 4)
.phase(1, [0,1,0], [0.05, 0.95], [2,-2], 0, 1)
.phase(2, [0,1,0], [0.35, 0.65], [2,-2], 0, 1)
.play([1,2]);
)" ], [ 1252.793081, 'joach', "(
~jsin[2] = \\set -> QuantEnv(\\fplus, 1)
.phase(1, [0,170,0], [0.005, 0.15], [8,-8], 0, 16)
.phase(2, [80,260,0], [0.035, 0.165], [8,-8], 0, 1)
.phase(3, [80,460,40], [0.075, 0.195], [8,-8], 0, 1)
.play([1, 2,3,1,3,2]);
)" ], [ 1249.5190718, 'alex', "~d[30]=\\filter-> {arg in; GVerb.ar(Limiter.ar(in,0.1),[20,10],10,add:in)};" ], [ 1248.0930399, 'joach', "(
~jsin[1] = \\set -> QuantEnv(\\amp, 1)
.phase(1, [0.5,1,0.5], [0.05, 0.95], [2,-2], 0, 16)
.phase(2, [0.5,1,0.5], [3.35, 4.65], [2,-2], 0, 1)
.phase(3, [0.0,1,0.2], [0.35, 1.65], [\\step,-2], 0, 1)
.play([1,2,1,3]);
)" ], [ 1247.6960361, 'alex', "~d[29]=\\filter-> {arg in; CombL.ar(in,2,\\del.kr(0.25),2)};" ], [ 1245.5850024, 'joach', "(
~jsin[2] = \\set -> QuantEnv(\\fplus, 0.5)
.phase(1, [0,170,0], [0.005, 0.15], [8,-8], 0, 16)
.phase(2, [80,260,0], [0.035, 0.165], [8,-8], 0, 1)
.phase(3, [80,460,40], [0.075, 0.195], [8,-8], 0, 1)
.play([1, 2,3,1,3,2]);
)" ], [ 1239.2509593, 'joach', "(
~jsin[0] = {
var osc = SinOsc.ar(( \\freq.kr(60) + \\fplus.kr(0) ), mul: 1, add: 0);
var noise = BrownNoise.ar(\\noise.kr(0), (1 - \\noise.kr(0)));
var sig = osc * noise;
Pan2.ar( sig * \\amp.kr(0), \\pan.kr(0) );
};
)" ], [ 1227.5659092, 'joach', "(
~jsin[0] = {
var osc = SinOsc.ar(( \\freq.kr(120) + \\fplus.kr(0) ), mul: 1, add: 0);
var noise = BrownNoise.ar(\\noise.kr(0), (1 - \\noise.kr(0)));
var sig = osc * noise;
Pan2.ar( sig * \\amp.kr(0), \\pan.kr(0) );
};
)" ], [ 1226.1019058, 'kof', "~ff.clear;" ], [ 1224.5919037, 'alex', "~d[31]=\\filter-> {arg in; CombL.ar(in,2,\\del.kr(0.25),2)};" ], [ 1223.4819021, 'kof', "~hiss.clear;" ], [ 1221.7818657, 'joach', "(
~jsin[2] = \\set -> QuantEnv(\\fplus, 0.5)
.phase(1, [0,170,0], [0.005, 0.15], [8,-8], 0, 16)
.phase(2, [80,260,0], [0.035, 0.165], [8,-8], 0, 1)
.phase(3, [80,460,40], [0.075, 0.195], [8,-8], 0, 1)
.play([1, 2,3,1,3,2]);
)" ], [ 1221.3518651, 'alex', "~d[30]=\\filter-> {arg in; GVerb.ar(Limiter.ar(in,0.1),[20,10],10,add:in)};" ], [ 1219.4918625, 'kof', "~kick.clear;" ], [ 1215.551857, 'kof', "~test.clear;" ], [ 1214.0218258, 'joach', "(
~jsin[2] = \\set -> QuantEnv(\\fplus, 4)
.phase(1, [0,170,0], [0.005, 0.15], [8,-8], 0, 16)
.phase(2, [80,260,0], [0.035, 0.165], [8,-8], 0, 1)
.phase(3, [80,460,40], [0.075, 0.195], [8,-8], 0, 1)
.play([1, 2,3,1,3,2]);
)" ], [ 1208.2888137, 'alex', "~d[31]=\\filter-> {arg in; CombL.ar(in,2,\\del.kr(0.25),2)};" ], [ 1203.6188072, 'kof', "~test.stop(7);" ], [ 1200.8117705, 'joach', "(
~jsin[1] = \\set -> QuantEnv(\\amp, 1)
.phase(1, [0.5,1,0.5], [0.05, 0.95], [2,-2], 0, 16)
.phase(2, [0.5,1,0.5], [3.35, 4.65], [2,-2], 0, 1)
.phase(3, [0.0,1,0.2], [0.35, 1.65], [\\step,-2], 0, 1)
.play([1,2,1,3]);
)" ], [ 1200.6457699, 'alex', "~d[31]=\\filter-> {arg in; CombL.ar(in,3,\\del.kr(0.25),2)};" ], [ 1196.1227344, 'joach', "~jsin[5] = \\filter -> {|in| GVerb.ar(in, \\gverb_size.kr(60), \\gverb_time.kr(0.25), 0.9, mul:\\mulgverb.kr(1), add:(1-\\mulgverb.kr(1))) };" ], [ 1194.9247289, 'alex', "~d[3]=\\set-> Pbind(\\args, [\\top], \\dur, 16, \\top, Pseq([1,1],inf));" ], [ 1191.433724, 'kof', "~hiss.clear;" ], [ 1188.2937196, 'alex', "~d[30]=\\filter-> {arg in; GVerb.ar(Limiter.ar(in,0.1),[20,10],4,add:in)};" ], [ 1183.9986826, 'joach', "~jsin[5] = \\filter -> {|in| GVerb.ar(in, \\gverb_size.kr(60), \\gverb_time.kr(4.5), 0.9, mul:\\mulgverb.kr(1), add:(1-\\mulgverb.kr(1))) };" ], [ 1183.2226795, 'kof', "(
~hiss.quant=2;
~hiss.fadeTime=0.2;
~hiss={
  //         |       |       |       |       |  
  var pat = [1,0,0,0,1,0,0,0,1,0,0,0,1,1,1,1].rotate(3);
  var imp = PulseDivider.kr(~tick.kr,2,~counter.kr);
  var hit = Select.kr(PulseCount.kr(imp)%pat.size,pat);
  var env = EnvGen.ar(Env([0.001,1,0.001],[0.002,0.5],[3,-3],curve:'exp'),imp * hit);
    var sig = Crackle.ar(1+env);
  sig = sig * env;
  Splay.ar(sig,0.75,0.45);
};
~hiss.play;
);" ], [ 1181.1446472, 'joach', "~jsin[5] = \\filter -> {|in| GVerb.ar(in, \\gverb_size.kr(6), \\gverb_time.kr(4.5), 0.9, mul:\\mulgverb.kr(1), add:(1-\\mulgverb.kr(1))) };" ], [ 1177.4016384, 'kof', "(
    ~ff.quant=1;
    ~ff.fadeTime=1;
    ~ff={
        var high,mid,low;
        var sig = ~test + ~kick + ~hiss;

        sig = GVerb.ar(LPF.ar(sig,500)+HPF.ar(sig,500),40,[3,4],spread:[40,90])/8 + sig;
        low = CompanderD.ar(LPF.ar(sig,400),3/4,1/2,1/2);
        mid = CompanderD.ar(BPF.ar(sig,600,2),3/4,1/2,1/2);
        high = CompanderD.ar(HPF.ar(sig,900),3/4,1/2,1/2);
        sig = CompanderD.ar((high+mid+low).flat,3/4,1/1.1,1/1.1);
        Splay.ar(sig,0.75,0.25);
    };
    ~ff.play;
);" ], [ 1174.0396018, 'joach', "(
~jsin[2] = \\set -> QuantEnv(\\fplus, 16)
.phase(1, [0,170,0], [0.005, 0.15], [8,-8], 0, 16)
.phase(2, [80,260,0], [0.035, 0.165], [8,-8], 0, 1)
.phase(3, [80,460,40], [0.075, 0.195], [8,-8], 0, 1)
.play([1, 2,3,1,3,2]);
)" ], [ 1173.8996005, 'alex', "~d[3]=\\set-> Pbind(\\args, [\\top], \\dur, 16, \\top, Pseq([1,0],inf));" ], [ 1168.2575595, 'joach', "(
~jsin[1] = \\set -> QuantEnv(\\amp, 4)
.phase(1, [0.5,1,0.5], [0.05, 0.95], [2,-2], 0, 16)
.phase(2, [0.5,1,0.5], [3.35, 4.65], [2,-2], 0, 1)
.phase(3, [0.0,1,0.2], [0.35, 1.65], [\\step,-2], 0, 1)
.play([1,2,1,3]);
)" ], [ 1167.887559, 'kof', "(
    ~ff.quant=1;
    ~ff.fadeTime=1;
    ~ff={
        var high,mid,low;
        var sig = ~test + ~kick + ~hiss;

        sig = GVerb.ar(LPF.ar(sig,500)+HPF.ar(sig,500),40,[3,4],spread:[40,90])/8 + sig;
        low = CompanderD.ar(LPF.ar(sig,400),3/4,1/3,1/2);
        mid = CompanderD.ar(BPF.ar(sig,600,2),3/4,1/2,1/2);
        high = CompanderD.ar(HPF.ar(sig,900),3/4,1/3,1/2);
        sig = CompanderD.ar((high+mid+low).flat,3/4,1/1.1,1/1.1);
        Splay.ar(sig,0.75,0.25);
    };
    ~ff.play;
);" ], [ 1167.7075588, 'alex', "~d[3]=\\set-> Pbind(\\args, [\\top], \\dur, 16, \\top, Pseq([8,5,6,4],inf));" ], [ 1166.7275574, 'alex', "~d[2]=\\set-> Pbind(\\args, [\\freq], \\dur, 8, \\freq, Pseq([6450,16500,8350,8500,6500],inf));" ], [ 1165.7145446, 'alex', "~d[1]=\\set-> Pbind(\\args, [\\trig], \\dur, 4, \\trig, 1);" ], [ 1165.3055224, 'joach', "(
~jsin[1] = \\set -> QuantEnv(\\amp, 4)
.phase(1, [0.5,1,0.5], [0.05, 0.95], [2,-2], 0, 16)
.phase(2, [0.5,1,0.2], [3.35, 4.65], [2,-2], 0, 1)
.phase(3, [0.0,1,0.2], [0.35, 1.65], [\\step,-2], 0, 1)
.play([1,2,1,3]);
)" ], [ 1162.6955187, 'kof', "(
    ~ff.quant=1;
    ~ff.fadeTime=1;
    ~ff={
        var high,mid,low;
        var sig = ~test + ~kick + ~hiss;

        sig = GVerb.ar(LPF.ar(sig,5000)+HPF.ar(sig,500),40,[3,4],spread:[40,90])/8 + sig;
        low = CompanderD.ar(LPF.ar(sig,400),3/4,1/3,1/2);
        mid = CompanderD.ar(BPF.ar(sig,600,2),3/4,1/2,1/2);
        high = CompanderD.ar(HPF.ar(sig,900),3/4,1/3,1/2);
        sig = CompanderD.ar((high+mid+low).flat,3/4,1/1.1,1/1.1);
        Splay.ar(sig,0.75,0.25);
    };
    ~ff.play;
);" ], [ 1160.6084842, 'joach', "(
~jsin[1] = \\set -> QuantEnv(\\amp, 4)
.phase(1, [0.5,1,0.2], [0.05, 0.95], [2,-2], 0, 16)
.phase(2, [0.5,1,0.2], [3.35, 4.65], [2,-2], 0, 1)
.phase(3, [0.0,1,0.2], [0.35, 1.65], [\\step,-2], 0, 1)
.play([1,2,1,3]);
)" ], [ 1160.2624822, 'kof', "~hiss.clear;" ], [ 1159.2824808, 'alex', "(
~d[0]={
	var sig, env, fenv;
	
	env=EnvGen.kr(Env([0,1,0],[0.05,0.05],[\\step, \\step]),\\trig.tr);
	fenv=EnvGen.kr(Env([\\freq.kr,\\freq.kr*\\top.kr(1),\\freq.kr],[0.01,0.04],[\\step, \\welch]),\\trig.tr);

	sig=SinOsc.ar(fenv!2);
	sig*env;
};)" ], [ 1149.5514672, 'alex', "~d[30]=\\filter-> {arg in; GVerb.ar(Limiter.ar(in,0.1),[20,10],add:in)};" ], [ 1140.0274508, 'alex', "(
~d[0]={
	var sig, env, fenv;
	
	env=EnvGen.kr(Env([0,1,0],[0.05,0.05],[\\step, \\step]),\\trig.tr);
	fenv=EnvGen.kr(Env([\\freq.kr,\\freq.kr*\\top.kr(2),\\freq.kr],[0.01,0.04],[\\step, \\welch]),\\trig.tr);

	sig=SinOsc.ar(fenv!2);
	sig*env;
};)" ], [ 1139.5354227, 'joach', "(
~jsin[1] = \\set -> QuantEnv(\\amp, 4)
.phase(1, [0.2,1,0.2], [0.05, 0.95], [2,-2], 0, 16)
.phase(2, [0.5,1,0.2], [3.35, 4.65], [2,-2], 0, 1)
.phase(3, [0.0,1,0.2], [0.35, 1.65], [\\step,-2], 0, 1)
.play([1,2,1,3]);
)" ], [ 1138.2994184, 'kof', "(
    ~kick.quant=2;
    ~kick.fadeTime=0.2;
    ~kick={
        //         |       |       |       |       |  
        var pat = [1,0,0,0,1,1,0,0,1,0,0,0,1,1,0,0].rotate(1);
        var imp = PulseDivider.kr(~tick.kr,2,~counter.kr);
        var hit = Select.kr(PulseCount.kr(imp)%pat.size,pat);
        var env = EnvGen.ar(Env([0.001,1,0.001],[0.002,1.5],[3,-3],curve:'exp'),imp * hit);
        var sig = SinOsc.ar(44+(env**100*100));
        sig = sig * env;
        Splay.ar(sig,0.75,0.55);
    };
    ~kick.play;
);" ], [ 1133.2594113, 'alex', "(
~d[0]={
	var sig, env, fenv;
	
	env=EnvGen.kr(Env([0,1,0],[0.05,0.05],[\\step, \\step]),\\trig.tr);
	fenv=EnvGen.kr(Env([\\freq.kr,\\freq.kr*\\top.kr(6),\\freq.kr],[0.01,0.04],[\\step, \\welch]),\\trig.tr);

	sig=SinOsc.ar(fenv!2);
	sig*env;
};)" ], [ 1132.8994108, 'kof', "(
    ~test.quant=2;
    ~test.fadeTime=0.2;
    ~test={
        //         |       |       |       |       |  
        var pat = [1,0,0,0,1,0,0,0,1,0,0,0,1,0,0,0].rotate(3);
        var imp = PulseDivider.kr(~tick.kr,[1,2,3,4]*16,~counter.kr);
        var hit = Select.kr(PulseCount.kr(imp)%pat.size,pat);
        var env = EnvGen.ar(Env([0.001,1,0.001],[1.002,1.5],[3,-3],curve:'exp'),imp * hit);
        var sig = LFSaw.ar(44*4pi/(1+[1,2,3,4].reciprocal) + SinOsc.ar(1/[1,2,3,4]).range(-4,4),(1..8)/16);
        sig = LPF.ar(sig,800);
        sig = sig * env;
        Splay.ar(sig,0.75,0.35);
    };
    ~test.play;
);" ], [ 1123.7003695, 'joach', "~jsin.set(\\lpf_freq, 4800);" ], [ 1116.8083553, 'kof', "(
    ~test.quant=2;
    ~test.fadeTime=0.2;
    ~test={
        //         |       |       |       |       |  
        var pat = [1,0,0,0,1,0,0,0,1,0,0,0,1,0,0,0].rotate(3);
        var imp = PulseDivider.kr(~tick.kr,[1,2,3,4]*16,~counter.kr);
        var hit = Select.kr(PulseCount.kr(imp)%pat.size,pat);
        var env = EnvGen.ar(Env([0.001,1,0.001],[1.002,1.5],[3,-3],curve:'exp'),imp * hit);
        var sig = LFSaw.ar(44*8pi/(1+[1,2,3,4].reciprocal) + SinOsc.ar(1/[1,2,3,4]).range(-4,4),(1..8)/16);
        sig = LPF.ar(sig,800);
        sig = sig * env;
        Splay.ar(sig,0.75,0.35);
    };
    ~test.play;
);" ], [ 1116.618355, 'alex', "~d[31]=\\filter-> {arg in; CombL.ar(in,3,\\del.kr(0.5),2)};" ], [ 1115.6383537, 'alex', "~d[30]=\\filter-> {arg in; GVerb.ar(Limiter.ar(in,0.1),[20,10],add:in)};" ], [ 1111.3553146, 'joach', "(
~jsin[3] = \\set -> QuantEnv(\\noise, 1)
.phase(1, [0.2,0.5,0.2], [0.05, 0.95], [2,-2], 0, 1)
.phase(2, [0,1,0], [0.35, 0.65], [2,-2], 0, 1)
.play([1]);
)" ], [ 1109.3953118, 'alex', "~d[2]=\\set-> Pbind(\\args, [\\freq], \\dur, 8, \\freq, Pseq([6450,16500,8350,8500,6500],inf));" ], [ 1104.3643047, 'alex', "(
~d[0]={
	var sig, env, fenv;
	
	env=EnvGen.kr(Env([0,1,0],[0.05,0.05],[\\welch, \\welch]),\\trig.tr);
	fenv=EnvGen.kr(Env([\\freq.kr,\\freq.kr*\\top.kr(6),\\freq.kr],[0.01,0.04],[\\step, \\welch]),\\trig.tr);

	sig=SinOsc.ar(fenv!2);
	sig*env;
};)" ], [ 1103.8282746, 'joach', "(
~jsin[1] = \\set -> QuantEnv(\\amp, 4)
.phase(1, [0.2,1,0.2], [0.05, 0.95], [2,-2], 0, 16)
.phase(2, [0.5,1,0.2], [3.35, 4.65], [2,-2], 0, 1)
.phase(3, [0.0,1,0.2], [0.35, 1.65], [\\step,-2], 0, 1)
.play([1,2,1,3]);
)" ], [ 1101.092237, 'joach', "(
~jsin[2] = \\set -> QuantEnv(\\fplus, 8)
.phase(1, [0,170,0], [0.005, 0.15], [8,-8], 0, 16)
.phase(2, [80,260,0], [0.035, 0.165], [8,-8], 0, 1)
.phase(3, [80,460,40], [0.075, 0.195], [8,-8], 0, 1)
.play([1, 2,3,1,3,2]);
)" ], [ 1095.4872261, 'alex', "~d.play(vol:0.1, fadeTime:2);" ], [ 1094.4351916, 'joach', "(
~jsin[2] = \\set -> QuantEnv(\\fplus, 1)
.phase(1, [0,170,0], [0.005, 0.15], [8,-8], 0, 16)
.phase(2, [80,260,0], [0.035, 0.165], [8,-8], 0, 1)
.phase(3, [80,460,40], [0.075, 0.195], [8,-8], 0, 1)
.play([1, 2,3,1,3,2]);
)" ], [ 1092.3661597, 'joach', "(
~jsin[0] = {
var osc = SinOsc.ar(( \\freq.kr(60) + \\fplus.kr(0) ), mul: 1, add: 0);
var noise = BrownNoise.ar(\\noise.kr(0), (1 - \\noise.kr(0)));
var sig = osc * noise;
Pan2.ar( sig * \\amp.kr(0), \\pan.kr(0) );
};
)" ], [ 1092.3441585, 'kof', "~test.clear;" ], [ 1089.2241284, 'kof', "~hiss.clear;" ], [ 1089.0861205, 'joach', "(
~jsin[2] = \\set -> QuantEnv(\\fplus, 1)
.phase(1, [0,170,0], [0.005, 0.15], [8,-8], 0, 16)
.phase(2, [80,260,0], [0.035, 0.165], [8,-8], 0, 1)
.phase(3, [80,460,40], [0.075, 0.195], [8,-8], 0, 1)
.play([1, 2,3,1,3,2]);
)" ], [ 1083.6101103, 'kof', "~kick.clear;" ], [ 1081.3290752, 'joach', "(
~jsin[2] = \\set -> QuantEnv(\\fplus, 1)
.phase(1, [0,170,0], [0.005, 0.15], [8,-8], 0, 16)
.phase(2, [80,260,0], [0.035, 0.165], [8,-8], 0, 1)
.phase(3, [80,460,40], [0.135, 0.195], [8,-8], 0, 1)
.play([1, 2,3,1,3,2]);
)" ], [ 1079.4730416, 'joach', "(
~jsin[2] = \\set -> QuantEnv(\\fplus, 1)
.phase(1, [0,170,0], [0.005, 0.15], [8,-8], 0, 16)
.phase(2, [80,260,0], [0.035, 0.165], [8,-8], 0, 1)
.phase(3, [80,460,40], [0.135, 0.165], [8,-8], 0, 1)
.play([1, 2,3,1,3,2]);
)" ], [ 1076.7060346, 'kof', "(
    ~kick.quant=2;
    ~kick.fadeTime=0.2;
    ~kick={
        //         |       |       |       |       |  
        var pat = [1,0,0,0,1,1,0,0,1,0,0,0,1,1,0,0].rotate(1);
        var imp = PulseDivider.kr(~tick.kr,2,~counter.kr);
        var hit = Select.kr(PulseCount.kr(imp)%pat.size,pat);
        var env = EnvGen.ar(Env([0.001,1,0.001],[0.002,1.5],[3,-3],curve:'exp'),imp * hit);
        var sig = SinOsc.ar(44+(env**100*100));
        sig = sig * env;
        Splay.ar(sig,0.75,0.55);
    };
    ~kick.play;
);" ], [ 1075.439, 'joach', "(
~jsin[2] = \\set -> QuantEnv(\\fplus, 1)
.phase(1, [0,170,0], [0.005, 0.15], [8,-8], 0, 16)
.phase(2, [80,260,0], [0.035, 0.065], [8,-8], 0, 1)
.phase(3, [80,460,40], [0.135, 0.065], [8,-8], 0, 1)
.play([1, 2,3,1,3,2]);
)" ], [ 1072.4829615, 'joach', "(
~jsin[2] = \\set -> QuantEnv(\\fplus, 1)
.phase(1, [0,170,0], [0.005, 0.15], [8,-8], 0, 16)
.phase(2, [80,260,0], [0.035, 0.365], [8,-8], 0, 1)
.phase(3, [80,460,40], [0.135, 0.065], [8,-8], 0, 1)
.play([1, 2,3,1,3,2]);
)" ], [ 1068.2639345, 'kof', "~kick.stop(2);" ], [ 1068.1139259, 'joach', "(
~jsin[2] = \\set -> QuantEnv(\\fplus, 1)
.phase(1, [0,170,0], [0.005, 0.15], [8,-8], 0, 16)
.phase(2, [80,260,0], [0.035, 0.365], [8,-8], 0, 1)
.phase(3, [80,60,400], [0.135, 0.065], [8,-8], 0, 1)
.play([1, 2,3,1,3,2]);
)" ], [ 1065.9328887, 'joach', "(
~jsin[2] = \\set -> QuantEnv(\\fplus, 1)
.phase(1, [0,170,0], [0.005, 0.15], [8,-8], 0, 16)
.phase(2, [80,260,0], [0.035, 0.365], [8,-8], 0, 1)
.phase(3, [8000,60,400], [0.135, 0.065], [8,-8], 0, 1)
.play([1, 2,3,1,3,2]);
)" ], [ 1062.877849, 'joach', "~jsin.play(vol: 0.5, fadeTime: 28);" ], [ 1058.1558423, 'kof', "~test.clear;" ], [ 1053.5948359, 'kof', "~hiss.clear;" ], [ 1051.0148323, 'kof', "(
~hiss.quant=2;
~hiss.fadeTime=0.2;
~hiss={
  //         |       |       |       |       |  
  var pat = [1,0,0,0,1,0,0,0,1,0,0,0,1,1,1,1].rotate(3);
  var imp = PulseDivider.kr(~tick.kr,2,~counter.kr);
  var hit = Select.kr(PulseCount.kr(imp)%pat.size,pat);
  var env = EnvGen.ar(Env([0.001,1,0.001],[0.002,0.5],[3,-3],curve:'exp'),imp * hit);
    var sig = Crackle.ar(1+env);
  sig = sig * env;
  Splay.ar(sig,0.75,0.15);
};
~hiss.play;
);" ], [ 1049.1157995, 'joach', "(
~jsin[1] = \\set -> QuantEnv(\\amp, 1)
.phase(1, [0.2,1,0.2], [0.05, 0.95], [2,-2], 0, 16)
.phase(2, [0.5,1,0.2], [3.35, 4.65], [2,-2], 0, 1)
.phase(3, [0.0,1,0.2], [0.35, 1.65], [\\step,-2], 0, 1)
.play([1,2,1,3]);
)" ], [ 1046.822761, 'joach', "(
~jsin[2] = \\set -> QuantEnv(\\fplus, 1)
.phase(1, [0,170,0], [0.005, 0.15], [8,-8], 0, 16)
.phase(2, [80,2600,0], [0.035, 0.365], [8,-8], 0, 1)
.phase(3, [8000,60,400], [0.135, 0.065], [8,-8], 0, 1)
.play([1, 2,3,1,3,2]);
)" ], [ 1046.0497592, 'kof', "(
    ~kick.quant=2;
    ~kick.fadeTime=0.2;
    ~kick={
        //         |       |       |       |       |  
        var pat = [1,0,0,0,1,1,0,0,1,0,0,0,1,1,0,0].rotate(1);
        var imp = PulseDivider.kr(~tick.kr,2,~counter.kr);
        var hit = Select.kr(PulseCount.kr(imp)%pat.size,pat);
        var env = EnvGen.ar(Env([0.001,1,0.001],[0.002,1.5],[3,-3],curve:'exp'),imp * hit);
        var sig = SinOsc.ar(44+(env**100*100));
        sig = sig * env;
        Splay.ar(sig,0.75,0.55);
    };
    ~kick.play;
);" ], [ 1042.4627214, 'joach', "(
~jsin[6] = \\set -> QuantEnv(\\mulgverb, 1)
.phase(1, [0,1,0], [0.05, 0.95], [2,-2], 0, 1)
.phase(2, [0,1,0], [0.35, 0.65], [2,-2], 0, 1)
.play([1,2]);
)" ], [ 1032.9957078, 'alex', "~d[31]=\\filter-> {arg in; CombL.ar(in,3,\\del.kr(0.5),2)};" ], [ 1027.1456834, 'kof', "(
~hiss.quant=2;
~hiss.fadeTime=0.2;
~hiss={
  //         |       |       |       |       |  
  var pat = [1,0,0,0,1,0,0,0,1,0,0,0,1,1,1,1].rotate(3);
  var imp = PulseDivider.kr(~tick.kr,2,~counter.kr);
  var hit = Select.kr(PulseCount.kr(imp)%pat.size,pat);
  var env = EnvGen.ar(Env([0.001,1,0.001],[0.002,0.5],[3,-3],curve:'exp'),imp * hit);
    var sig = Crackle.ar(1+env);
  sig = sig * env;
  Splay.ar(sig,0.75,0.5);
};
~hiss.play;
);" ], [ 1026.8366657, 'joach', "(
~jsin[2] = \\set -> QuantEnv(\\fplus, 0.5)
.phase(1, [0,170,0], [0.005, 0.15], [8,-8], 0, 8)
.phase(2, [80,2600,0], [0.035, 0.365], [8,-8], 0, 1)
.phase(3, [8000,60,400], [0.135, 0.065], [8,-8], 0, 1)
.play([1, 2,3,1,3,2]);
)" ], [ 1026.2666644, 'kof', "(
    ~ff.quant=1;
    ~ff.fadeTime=1;
    ~ff={
        var high,mid,low;
        var sig = ~test + ~kick + ~hiss;

        sig = GVerb.ar(LPF.ar(sig,5000)+HPF.ar(sig,500),40,[3,4],spread:[40,90])/8 + sig;
        low = CompanderD.ar(LPF.ar(sig,400),3/4,1/3,1/2);
        mid = CompanderD.ar(BPF.ar(sig,600,2),3/4,1/2,1/2);
        high = CompanderD.ar(HPF.ar(sig,900),3/4,1/3,1/2);
        sig = CompanderD.ar((high+mid+low).flat,3/4,1/1.1,1/1.1);
        Splay.ar(sig,0.75,0.25);
    };
    ~ff.play;
);" ], [ 1021.6566579, 'alex', "~d[31]=\\filter-> {arg in; CombL.ar(in,2,\\del.kr(0.5),2)};" ], [ 1019.0896221, 'joach', "(
~jsin[2] = \\set -> QuantEnv(\\fplus, 0.5)
.phase(1, [0,170,0], [0.005, 0.15], [8,-8], 0, 8)
.phase(2, [80,260,0], [0.035, 0.365], [8,-8], 0, 4)
.phase(3, [8000,60,400], [0.135, 0.065], [8,-8], 0, 1)
.play([1, 2,3,1,3,2]);
)" ], [ 1010.5665788, 'joach', "~jsin.set(\\lpf_freq, 800);" ], [ 998.6645268, 'joach', "(
~jsin[2] = \\set -> QuantEnv(\\fplus, 0.5)
.phase(1, [0,170,0], [0.005, 0.15], [8,-8], 0, 8)
.phase(2, [80,260,0], [0.035, 1.065], [8,-8], 0, 4)
.phase(3, [8000,60,400], [0.135, 0.065], [8,-8], 0, 1)
.play([1, 2,3,1,3,2]);
)" ], [ 994.5164921, 'joach', "(
~jsin[2] = \\set -> QuantEnv(\\fplus, 0.5)
.phase(1, [0,170,0], [0.005, 0.15], [8,-8], 0, 8)
.phase(2, [80,260,0], [0.035, 1.065], [8,-8], 0, 4)
.phase(3, [800,60,400], [0.135, 0.065], [8,-8], 0, 1)
.play([1, 2,3,1,3,2]);
)" ], [ 990.6824503, 'joach', "(
~jsin[2] = \\set -> QuantEnv(\\fplus, 0.5)
.phase(1, [0,170,0], [0.005, 0.15], [8,-8], 0, 8)
.phase(2, [80,260,0], [0.035, 1.065], [8,-8], 0, 4)
.phase(3, [800,60,400], [0.135, 1.065], [8,-8], 0, 1)
.play([1, 2,3,1,3,2]);
)" ], [ 987.7924451, 'alex', "~d[30]=\\filter-> {arg in; GVerb.ar(Limiter.ar(in,0.1),[20,10],add:in)};" ], [ 980.7424352, 'alex', "~d[2]=\\set-> Pbind(\\args, [\\freq], \\dur, 8, \\freq, Pseq([145,165,135,85,65],inf));" ], [ 975.9323967, 'joach', "(
~jsin[2] = \\set -> QuantEnv(\\fplus, 0.5)
.phase(1, [0,170,0], [0.005, 0.15], [8,-8], 0, 8)
.phase(2, [80,260,0], [0.035, 1.065], [8,-8], 0, 1)
.phase(3, [800,60,400], [0.135, 1.065], [8,-8], 0, 1)
.play([1, 2,3,1,3,2]);
)" ], [ 974.0103928, 'alex', "~d[30]=\\filter-> {arg in; GVerb.ar(Limiter.ar(in,0.2),[20,10],add:in)};" ], [ 969.7193867, 'kof', "(
    ~test.quant=2;
    ~test.fadeTime=0.2;
    ~test={
        //         |       |       |       |       |  
        var pat = [1,0,0,0,1,0,0,0,1,0,0,0,1,0,0,0].rotate(3);
        var imp = PulseDivider.kr(~tick.kr,[1,2,3,4]*16,~counter.kr);
        var hit = Select.kr(PulseCount.kr(imp)%pat.size,pat);
        var env = EnvGen.ar(Env([0.001,1,0.001],[1.002,1.5],[3,-3],curve:'exp'),imp * hit);
        var sig = LFSaw.ar(44*4pi/(1+[1,2,3,4].reciprocal),(1..8)/16);
        sig = LPF.ar(sig,800);
        sig = sig * env;
        Splay.ar(sig,0.75,0.35);
    };
    ~test.play;
);" ], [ 961.1383746, 'kof', "(
    ~kick.quant=2;
    ~kick.fadeTime=0.2;
    ~kick={
        //         |       |       |       |       |  
        var pat = [1,0,0,0,1,1,0,0,1,0,0,0,1,1,0,0].rotate(1);
        var imp = PulseDivider.kr(~tick.kr,2,~counter.kr);
        var hit = Select.kr(PulseCount.kr(imp)%pat.size,pat);
        var env = EnvGen.ar(Env([0.001,1,0.001],[0.002,1.5],[3,-3],curve:'exp'),imp * hit);
        var sig = SinOsc.ar(44+(env**100*100));
        sig = sig * env;
        Splay.ar(sig,0.75,0.95);
    };
    ~kick.play;
);" ], [ 954.844336, 'joach', "(
~jsin[2] = \\set -> QuantEnv(\\fplus, 0.5)
.phase(1, [0,170,0], [0.005, 0.15], [8,-8], 0, 8)
.phase(2, [80,260,0], [0.035, 1.065], [8,-8], 0, 1)
.play([1, 2]);
)" ], [ 949.5463254, 'alex', "~d.play(vol:0.5, fadeTime:2);" ], [ 945.2192866, 'joach', "~jsin.set(\\lpf_freq, 1800);" ], [ 942.4642824, 'alex', "~d.play(vol:0.4, fadeTime:2);" ], [ 936.8122432, 'joach', "(
~jsin[0] = {
var osc = SinOsc.ar(( \\freq.kr(130) + \\fplus.kr(0) ), mul: 1, add: 0);
var noise = BrownNoise.ar(\\noise.kr(0), (1 - \\noise.kr(0)));
var sig = osc * noise;
Pan2.ar( sig * \\amp.kr(0), \\pan.kr(0) );
};
)" ], [ 933.700237, 'alex', "~d[2]=\\set-> Pbind(\\args, [\\freq], \\dur, 4, \\freq, Pseq([145,165,135,85,65],inf));" ], [ 928.1821993, 'joach', "(
~jsin[1] = \\set -> QuantEnv(\\amp, 2)
.phase(1, [0.2,1,0.2], [0.05, 0.95], [2,-2], 0, 16)
.phase(2, [0.5,1,0.2], [3.35, 4.65], [2,-2], 0, 1)
.phase(3, [0.0,1,0.2], [0.35, 1.65], [\\step,-2], 0, 1)
.play([1,2,1,3]);
)" ], [ 920.147185, 'kof', "(
    ~test.quant=2;
    ~test.fadeTime=0.2;
    ~test={
        //         |       |       |       |       |  
        var pat = [1,0,0,0,1,0,0,0,1,0,0,0,1,0,0,0].rotate(3);
        var imp = PulseDivider.kr(~tick.kr,[1,2,3,4]*16,~counter.kr);
        var hit = Select.kr(PulseCount.kr(imp)%pat.size,pat);
        var env = EnvGen.ar(Env([0.001,1,0.001],[1.002,1.5],[3,-3],curve:'exp'),imp * hit);
        var sig = LFSaw.ar(44*2pi/(1+[1,2,3,4].reciprocal),(1..8)/16);
        sig = LPF.ar(sig,800);
        sig = sig * env;
        Splay.ar(sig,0.75,0.35);
    };
    ~test.play;
);" ], [ 914.457177, 'alex', "~d[30]=\\filter-> {arg in; GVerb.ar(Limiter.ar(in,0.2),20,add:in)};" ], [ 905.907165, 'alex', "~d[2]=\\set-> Pbind(\\args, [\\freq], \\dur, 4, \\freq, Pseq([145,165,135],inf));" ], [ 904.1471626, 'alex', "~d[3]=\\set-> Pbind(\\args, [\\top], \\dur, 16, \\top, Pseq([8,5,6,4],inf));" ], [ 901.1471584, 'kof', "(
    ~test.quant=2;
    ~test.fadeTime=0.2;
    ~test={
        //         |       |       |       |       |  
        var pat = [1,0,0,0,1,0,0,0,1,0,0,0,1,0,0,0].rotate(3);
        var imp = PulseDivider.kr(~tick.kr,[1,2,3,4]*16,~counter.kr);
        var hit = Select.kr(PulseCount.kr(imp)%pat.size,pat);
        var env = EnvGen.ar(Env([0.001,1,0.001],[1.002,1.5],[3,-3],curve:'exp'),imp * hit);
        var sig = LFSaw.ar(44*2pi/(1+[1,2,3,4].reciprocal),(1..8)/16);
        sig = LPF.ar(sig,800);
        sig = sig * env;
        Splay.ar(sig,0.75,0.25);
    };
    ~test.play;
);" ], [ 893.1371471, 'alex', "~d[3]=\\set-> Pbind(\\args, [\\freq], \\dur, 16, \\freq, Pseq([8,5,6,4],inf));" ], [ 889.6771423, 'kof', "(
    ~test.quant=2;
    ~test.fadeTime=0.2;
    ~test={
        //         |       |       |       |       |  
        var pat = [1,0,0,0,1,0,0,0,1,0,0,0,1,0,0,0].rotate(3);
        var imp = PulseDivider.kr(~tick.kr,[1,2,3,4]*16,~counter.kr);
        var hit = Select.kr(PulseCount.kr(imp)%pat.size,pat);
        var env = EnvGen.ar(Env([0.001,1,0.001],[1.002,1.5],[3,-3],curve:'exp'),imp * hit);
        var sig = LFSaw.ar(44*pi/(1+[1,2,3,4].reciprocal),(1..8)/16);
        sig = LPF.ar(sig,800);
        sig = sig * env;
        Splay.ar(sig,0.75,0.25);
    };
    ~test.play;
);" ], [ 885.0371073, 'joach', "(
~jsin[2] = \\set -> QuantEnv(\\fplus, 0.5)
.phase(1, [0,270,0], [0.005, 0.15], [8,-8], 0, 8)
.phase(2, [80,260,0], [0.035, 1.065], [8,-8], 0, 1)
.play([1, 2]);
)" ], [ 869.9540816, 'kof', "(
    ~ff.quant=1;
    ~ff.fadeTime=1;
    ~ff={
        var high,mid,low;
        var sig = ~test + ~kick;

        sig = GVerb.ar(LPF.ar(sig,5000)+HPF.ar(sig,500),40,[3,4],spread:[40,90])/8 + sig;
        low = CompanderD.ar(LPF.ar(sig,400),3/4,1/3,1/2);
        mid = CompanderD.ar(BPF.ar(sig,600,2),3/4,1/2,1/2);
        high = CompanderD.ar(HPF.ar(sig,900),3/4,1/2,1/2);
        sig = CompanderD.ar((high+mid+low).flat,3/4,1/1.1,1/1.1);
        Splay.ar(sig,0.75,0.25);
    };
    ~ff.play;
);" ], [ 863.833073, 'alex', "(
~d[0]={
	var sig, env, fenv;
	
	env=EnvGen.kr(Env([0,1,0],[0.05,0.2],[\\welch, \\welch]),\\trig.tr);
	fenv=EnvGen.kr(Env([\\freq.kr,\\freq.kr*\\top.kr(6),\\freq.kr],[0.01,0.04],[\\step, \\welch]),\\trig.tr);

	sig=SinOsc.ar(fenv!2);
	sig*env;
};)" ], [ 861.8700371, 'joach', "~jsin.set(\\lpf_freq, 800);" ], [ 854.4389982, 'joach', "(
~jsin[3] = \\set -> QuantEnv(\\noise, 8)
.phase(1, [0.2,0.5,0.2], [6.05, 0.95], [2,-2], 0, 1)
.phase(2, [0,1,0], [0.35, 0.65], [2,-2], 0, 1)
.play([1]);
)" ], [ 851.6569897, 'alex', "~d[30]=\\filter-> {arg in; GVerb.ar(Limiter.ar(in,0.2),10,add:in)};" ], [ 850.7369885, 'kof', "(
    ~test.quant=2;
    ~test.fadeTime=0.2;
    ~test={
        //         |       |       |       |       |  
        var pat = [1,0,0,0,1,0,0,0,1,0,0,0,1,0,0,0].rotate(3);
        var imp = PulseDivider.kr(~tick.kr,[1,2,3,4]*16,~counter.kr);
        var hit = Select.kr(PulseCount.kr(imp)%pat.size,pat);
        var env = EnvGen.ar(Env([0.001,1,0.001],[1.002,1.5],[3,-3],curve:'exp'),imp * hit);
        var sig = LFSaw.ar(44*(1+[1,2,2,3].reciprocal),(1..8)/16);
        sig = LPF.ar(sig,800);
        sig = sig * env;
        Splay.ar(sig,0.75,0.25);
    };
    ~test.play;
);" ], [ 848.6549854, 'kof', "(
    ~test.quant=2;
    ~test.fadeTime=0.2;
    ~test={
        //         |       |       |       |       |  
        var pat = [1,0,0,0,1,0,0,0,1,0,0,0,1,0,0,0].rotate(3);
        var imp = PulseDivider.kr(~tick.kr,[1,2,3,4]*16,~counter.kr);
        var hit = Select.kr(PulseCount.kr(imp)%pat.size,pat);
        var env = EnvGen.ar(Env([0.001,1,0.001],[1.002,0.5],[3,-3],curve:'exp'),imp * hit);
        var sig = LFSaw.ar(44*(1+[1,2,2,3].reciprocal),(1..8)/16);
        sig = LPF.ar(sig,800);
        sig = sig * env;
        Splay.ar(sig,0.75,0.25);
    };
    ~test.play;
);" ], [ 843.519945, 'joach', "~jsin.play(vol: 0.9, fadeTime: 28);" ], [ 836.5679346, 'alex', "~d[30]=\\filter-> {arg in; GVerb.ar(Limiter.ar(in,0.1),10)};" ], [ 834.2079313, 'kof', "(
    ~test.quant=2;
    ~test.fadeTime=0.2;
    ~test={
        //         |       |       |       |       |  
        var pat = [1,0,0,0,1,0,0,0,1,0,0,0,1,0,0,0].rotate(3);
        var imp = PulseDivider.kr(~tick.kr,[1,2,3,4]*8,~counter.kr);
        var hit = Select.kr(PulseCount.kr(imp)%pat.size,pat);
        var env = EnvGen.ar(Env([0.001,1,0.001],[1.002,0.5],[3,-3],curve:'exp'),imp * hit);
        var sig = LFSaw.ar(44*(1+[1,2,2,3].reciprocal),(1..8)/16);
        sig = LPF.ar(sig,800);
        sig = sig * env;
        Splay.ar(sig,0.75,0.25);
    };
    ~test.play;
);" ], [ 827.2679216, 'alex', "~d[2]=\\set-> Pbind(\\args, [\\freq], \\dur, 4, \\freq, Pseq([145,165,135],inf));" ], [ 826.3768896, 'joach', "(
~jsin[1] = \\set -> QuantEnv(\\amp, 2)
.phase(1, [0.2,1,0.2], [0.05, 0.95], [2,-2], 0, 16)
.phase(2, [0.5,1,0.2], [3.35, 4.65], [2,-2], 0, 1)
.play([1,2]);
)" ], [ 817.6358751, 'alex', "~d[1]=\\set-> Pbind(\\args, [\\trig], \\dur, 4, \\trig, 1);" ], [ 804.5058567, 'kof', "(
~kick.quant=2;
~kick.fadeTime=0.2;
~kick={
  //         |       |       |       |       |  
  var pat = [1,0,0,0,1,1,0,0,1,0,0,0,1,1,0,0].rotate(1);
    var imp = PulseDivider.kr(~tick.kr,2,~counter.kr);
  var hit = Select.kr(PulseCount.kr(imp)%pat.size,pat);
  var env = EnvGen.ar(Env([0.001,1,0.001],[0.002,2.5],[3,-3],curve:'exp'),imp * hit);
    var sig = SinOsc.ar(44+(env**100*100));
  sig = sig * env;
  Splay.ar(sig,0.75,0.75);
};
~kick.play;
);" ], [ 802.4698228, 'joach', "(
~jsin[0] = {
var osc = SinOsc.ar(( \\freq.kr(430) + \\fplus.kr(0) ), mul: 1, add: 0);
var noise = BrownNoise.ar(\\noise.kr(0), (1 - \\noise.kr(0)));
var sig = osc * noise;
Pan2.ar( sig * \\amp.kr(0), \\pan.kr(0) );
};
)" ], [ 802.0958193, 'alex', "~d.play(vol:0.2, fadeTime:2);" ], [ 797.6657802, 'joach', "~jsin[5] = \\filter -> {|in| GVerb.ar(in, \\gverb_size.kr(6), \\gverb_time.kr(1.5), 0.9, mul:\\mulgverb.kr(1), add:(1-\\mulgverb.kr(1))) };" ], [ 795.6447773, 'alex', "~d.play(vol:1, fadeTime:2);" ], [ 790.8847706, 'kof', "(
~kick.quant=2;
~kick.fadeTime=0.2;
~kick={
  //         |       |       |       |       |  
  var pat = [1,0,0,0,1,1,0,0,1,0,0,0,1,1,0,0].rotate(1);
    var imp = PulseDivider.kr(~tick.kr,4,~counter.kr);
  var hit = Select.kr(PulseCount.kr(imp)%pat.size,pat);
  var env = EnvGen.ar(Env([0.001,1,0.001],[0.002,2.5],[3,-3],curve:'exp'),imp * hit);
    var sig = SinOsc.ar(44+(env**100*100));
  sig = sig * env;
  Splay.ar(sig,0.75,0.75);
};
~kick.play;
);" ], [ 787.8307377, 'joach', "(
~jsin[2] = \\set -> QuantEnv(\\fplus, 0.5)
.phase(1, [0,270,0], [0.005, 0.15], [8,-8], 0, 8)
.phase(2, [80,260,0], [0.035, 0.065], [8,-8], 0, 1)
.play([1, 2]);
)" ], [ 785.9767298, 'kof', "(
~kick.quant=2;
~kick.fadeTime=0.2;
~kick={
  //         |       |       |       |       |  
  var pat = [1,0,0,0,1,1,0,0,1,0,0,0,1,1,0,0].rotate(1);
    var imp = PulseDivider.kr(~tick.kr,4,~counter.kr);
  var hit = Select.kr(PulseCount.kr(imp)%pat.size,pat);
  var env = EnvGen.ar(Env([0.001,1,0.001],[0.002,1.5],[3,-3],curve:'exp'),imp * hit);
    var sig = SinOsc.ar(44+(env**100*100));
  sig = sig * env;
  Splay.ar(sig,0.75,0.75);
};
~kick.play;
);" ], [ 784.3336967, 'joach', "(
~jsin[2] = \\set -> QuantEnv(\\fplus, 0.5)
.phase(1, [0,170,0], [0.005, 0.15], [8,-8], 0, 8)
.phase(2, [80,260,0], [0.035, 0.065], [8,-8], 0, 1)
.play([1, 2]);
)" ], [ 781.2646902, 'kof', "(
~kick.quant=2;
~kick.fadeTime=0.2;
~kick={
  //         |       |       |       |       |  
  var pat = [1,0,0,0,1,1,0,0,1,0,0,0,1,1,0,0].rotate(1);
    var imp = PulseDivider.kr(~tick.kr,4,~counter.kr);
  var hit = Select.kr(PulseCount.kr(imp)%pat.size,pat);
  var env = EnvGen.ar(Env([0.001,1,0.001],[0.002,0.5],[3,-3],curve:'exp'),imp * hit);
    var sig = SinOsc.ar(44+(env**100*100));
  sig = sig * env;
  Splay.ar(sig,0.75,0.75);
};
~kick.play;
);" ], [ 780.5946893, 'kof', "(
~kick.quant=2;
~kick.fadeTime=0.2;
~kick={
  //         |       |       |       |       |  
  var pat = [1,0,0,0,1,1,0,0,1,0,0,0,1,1,0,0].rotate(1);
    var imp = PulseDivider.kr(~tick.kr,2,~counter.kr);
  var hit = Select.kr(PulseCount.kr(imp)%pat.size,pat);
  var env = EnvGen.ar(Env([0.001,1,0.001],[0.002,0.5],[3,-3],curve:'exp'),imp * hit);
    var sig = SinOsc.ar(44+(env**100*100));
  sig = sig * env;
  Splay.ar(sig,0.75,0.75);
};
~kick.play;
);" ], [ 776.7546839, 'kof', "(
~kick.quant=2;
~kick.fadeTime=0.2;
~kick={
  //         |       |       |       |       |  
  var pat = [1,0,0,0,1,1,0,0,1,0,0,0,1,1,0,0].rotate(1);
    var imp = PulseDivider.kr(~tick.kr,[2,3,4],~counter.kr);
  var hit = Select.kr(PulseCount.kr(imp)%pat.size,pat);
  var env = EnvGen.ar(Env([0.001,1,0.001],[0.002,0.5],[3,-3],curve:'exp'),imp * hit);
    var sig = SinOsc.ar(44+(env**100*100));
  sig = sig * env;
  Splay.ar(sig,0.75,0.75);
};
~kick.play;
);" ], [ 775.2146817, 'alex', "~d[2]=\\set-> Pbind(\\args, [\\freq], \\dur, 4, \\freq, Pseq([45,65,35],inf));" ], [ 774.4436806, 'alex', "~d[1]=\\set-> Pbind(\\args, [\\trig], \\dur, 1, \\trig, 1);" ], [ 773.6406509, 'joach', "(
~jsin[0] = {
var osc = SinOsc.ar(( \\freq.kr(130) + \\fplus.kr(0) ), mul: 1, add: 0);
var noise = BrownNoise.ar(\\noise.kr(0), (1 - \\noise.kr(0)));
var sig = osc * noise;
Pan2.ar( sig * \\amp.kr(0), \\pan.kr(0) );
};
)" ], [ 771.5376433, 'alex', "(
~d[0]={
	var sig, env, fenv;
	
	env=EnvGen.kr(Env([0,1,0],[0.05,0.2],[\\welch, \\welch]),\\trig.tr);
	fenv=EnvGen.kr(Env([\\freq.kr,\\freq.kr*8,\\freq.kr],[0.01,0.04],[\\step, \\welch]),\\trig.tr);

	sig=SinOsc.ar(fenv!2);
	sig*env;
};)" ], [ 771.1176427, 'kof', "(
~kick.quant=2;
~kick.fadeTime=0.2;
~kick={
  //         |       |       |       |       |  
  var pat = [1,0,0,0,1,0,0,0,1,0,0,0,1,0,0,0].rotate(1);
    var imp = PulseDivider.kr(~tick.kr,[2,3,4],~counter.kr);
  var hit = Select.kr(PulseCount.kr(imp)%pat.size,pat);
  var env = EnvGen.ar(Env([0.001,1,0.001],[0.002,0.5],[3,-3],curve:'exp'),imp * hit);
    var sig = SinOsc.ar(44+(env**100*100));
  sig = sig * env;
  Splay.ar(sig,0.75,0.75);
};
~kick.play;
);" ], [ 770.2776415, 'alex', "~d.scope;" ], [ 768.9366067, 'joach', "(
~jsin[1] = \\set -> QuantEnv(\\amp, 8)
.phase(1, [0.2,1,0.2], [0.05, 0.95], [2,-2], 0, 16)
.phase(2, [0.5,1,0.2], [3.35, 4.65], [2,-2], 0, 1)
.play([1,2]);
)" ], [ 768.1066055, 'alex', "~d.stop;" ], [ 764.6966007, 'alex', "~d.clear;" ], [ 763.7865782, 'kof', "(
~kick.quant=2;
~kick.fadeTime=0.2;
~kick={
  //         |       |       |       |       |  
  var pat = [1,0,0,0,1,0,0,0,1,0,0,0,1,0,0,0].rotate(1);
    var imp = PulseDivider.kr(~tick.kr,[2,4,8],~counter.kr);
  var hit = Select.kr(PulseCount.kr(imp)%pat.size,pat);
  var env = EnvGen.ar(Env([0.001,1,0.001],[0.002,0.5],[3,-3],curve:'exp'),imp * hit);
    var sig = SinOsc.ar(44+(env**100*100));
  sig = sig * env;
  Splay.ar(sig,0.75,0.75);
};
~kick.play;
);" ], [ 763.5875669, 'joach', "~jsin.set(\\lpf_freq, 200);" ], [ 755.7465553, 'alex', "~d[30]=\\filter-> {arg in; GVerb.ar(Limiter.ar(in,0.1),10)};" ], [ 754.5265536, 'kof', "~test.clear;" ], [ 749.4065464, 'alex', "~d[30]=\\filter-> {arg in; GVerb.ar(Limiter.ar(in,0.2),10)};" ], [ 749.3365463, 'kof', "~test.stop(7);" ], [ 748.0645159, 'joach', "~jsin[4] = \\filter -> {|in| LPF.ar(in, \\lpf_freq.kr(600,28)) };" ], [ 743.5045051, 'kof', "(
    ~test.quant=2;
    ~test.fadeTime=0.2;
    ~test={
        //         |       |       |       |       |  
        var pat = [1,0,0,0,1,0,0,0,1,0,0,0,1,0,0,0].rotate(3);
        var imp = PulseDivider.kr(~tick.kr,[1,2,3,4]*2,~counter.kr);
        var hit = Select.kr(PulseCount.kr(imp)%pat.size,pat);
        var env = EnvGen.ar(Env([0.001,1,0.001],[0.002,0.5],[3,-3],curve:'exp'),imp * hit);
        var sig = LFSaw.ar(440/(1+[1,2,2,3].reciprocal),(1..8)/16);
        sig = LPF.ar(sig,800);
        sig = sig * env;
        Splay.ar(sig,0.75,0.45);
    };
    ~test.play;
);" ], [ 740.8614689, 'joach', "~jsin[4] = \\filter -> {|in| LPF.ar(in, \\lpf_freq.kr(1800,28)) };" ], [ 739.9934672, 'alex', "~d[2]=\\set-> Pbind(\\args, [\\freq], \\dur, 4, \\freq, Pseq([45,65,35],inf));" ], [ 735.553461, 'kof', "(
    ~test.quant=2;
    ~test.fadeTime=0.2;
    ~test={
        //         |       |       |       |       |  
        var pat = [1,0,0,0,1,0,0,0,1,0,0,0,1,0,0,0].rotate(3);
        var imp = PulseDivider.kr(~tick.kr,[1,2,3,4]*2,~counter.kr);
        var hit = Select.kr(PulseCount.kr(imp)%pat.size,pat);
        var env = EnvGen.ar(Env([0.001,1,0.001],[0.002,0.5],[3,-3],curve:'exp'),imp * hit);
        var sig = LFSaw.ar(440/(1+[1,2,5,3].reciprocal),(1..8)/16);
        sig = LPF.ar(sig,800);
        sig = sig * env;
        Splay.ar(sig,0.75,0.45);
    };
    ~test.play;
);" ], [ 727.4234496, 'kof', "(
    ~test.quant=2;
    ~test.fadeTime=0.2;
    ~test={
        //         |       |       |       |       |  
        var pat = [1,0,0,0,1,0,0,0,1,0,0,0,1,0,0,0].rotate(3);
        var imp = PulseDivider.kr(~tick.kr,[1,2,3,4]*2,~counter.kr);
        var hit = Select.kr(PulseCount.kr(imp)%pat.size,pat);
        var env = EnvGen.ar(Env([0.001,1,0.001],[0.002,0.5],[3,-3],curve:'exp'),imp * hit);
        var sig = LFSaw.ar(44*(1+[1,2,5,3].reciprocal),(1..8)/16);
        sig = LPF.ar(sig,800);
        sig = sig * env;
        Splay.ar(sig,0.75,0.45);
    };
    ~test.play;
);" ], [ 723.9964165, 'kof', "(
    ~test.quant=2;
    ~test.fadeTime=0.2;
    ~test={
        //         |       |       |       |       |  
        var pat = [1,0,0,0,1,0,0,0,1,0,0,0,1,0,0,0].rotate(3);
        var imp = PulseDivider.kr(~tick.kr,[1,2,3,4]*2,~counter.kr);
        var hit = Select.kr(PulseCount.kr(imp)%pat.size,pat);
        var env = EnvGen.ar(Env([0.001,1,0.001],[0.002,0.5],[3,-3],curve:'exp'),imp * hit);
        var sig = LFSaw.ar(44*(1+[1,2,2,3].reciprocal),(1..8)/16);
        sig = LPF.ar(sig,800);
        sig = sig * env;
        Splay.ar(sig,0.75,0.45);
    };
    ~test.play;
);" ], [ 723.9274126, 'joach', "(
~jsin[2] = \\set -> QuantEnv(\\fplus, 2)
.phase(1, [0,170,0], [0.005, 0.15], [8,-8], 0, 8)
.phase(2, [80,260,0], [0.035, 0.065], [8,-8], 0, 1)
.play([1, 2]);
)" ], [ 716.3933678, 'joach', "~jsin.play(vol: 0.8, fadeTime: 28);" ], [ 715.7533663, 'kof', "(
    ~test.quant=2;
    ~test.fadeTime=0.2;
    ~test={
        //         |       |       |       |       |  
        var pat = [1,0,0,0,1,0,0,0,1,0,0,0,1,0,0,0].rotate(3);
        var imp = PulseDivider.kr(~tick.kr,[1,2,3,4]*2,~counter.kr);
        var hit = Select.kr(PulseCount.kr(imp)%pat.size,pat);
        var env = EnvGen.ar(Env([0.001,1,0.001],[0.002,0.5],[3,-3],curve:'exp'),imp * hit);
        var sig = LFSaw.ar(44*(1+[1,2,4,3].reciprocal),(1..8)/16);
        sig = LPF.ar(sig,800);
        sig = sig * env;
        Splay.ar(sig,0.75,0.45);
    };
    ~test.play;
);" ], [ 710.8233594, 'kof', "(
    ~test.quant=2;
    ~test.fadeTime=0.2;
    ~test={
        //         |       |       |       |       |  
        var pat = [1,0,0,0,1,0,0,0,1,0,0,0,1,0,0,0].rotate(3);
        var imp = PulseDivider.kr(~tick.kr,[1,2,3,4],~counter.kr);
        var hit = Select.kr(PulseCount.kr(imp)%pat.size,pat);
        var env = EnvGen.ar(Env([0.001,1,0.001],[0.002,0.5],[3,-3],curve:'exp'),imp * hit);
        var sig = LFSaw.ar(44*(1+[1,2,4,3].reciprocal),(1..8)/16);
        sig = LPF.ar(sig,800);
        sig = sig * env;
        Splay.ar(sig,0.75,0.45);
    };
    ~test.play;
);" ], [ 709.2623572, 'alex', "~d[30]=\\filter-> {arg in; GVerb.ar(Limiter.ar(in,0.2),40)};" ], [ 706.7423536, 'alex', "~d[2]=\\set-> Pbind(\\args, [\\freq], \\dur, 4, \\freq, Pseq([85,65,165,85,440],inf));" ], [ 705.5483462, 'alex', "~d[1]=\\set-> Pbind(\\args, [\\trig], \\dur, 1, \\trig, 1);" ], [ 705.1363226, 'joach', "(
~jsin[3] = \\set -> QuantEnv(\\noise, 32)
.phase(1, [0.2,0.5,0.2], [28.05, 0.95], [2,-2], 0, 1)
.phase(2, [0,1,0], [0.35, 0.65], [2,-2], 0, 1)
.play([1]);
)" ], [ 703.7773163, 'alex', "(
~d[0]={
	var sig, env, fenv;
	
	env=EnvGen.kr(Env([0,1,0],[0.05,0.2],[\\welch, \\welch]),\\trig.tr);
	fenv=EnvGen.kr(Env([\\freq.kr,\\freq.kr*8,\\freq.kr],[0.01,0.04],[\\step, \\welch]),\\trig.tr);

	sig=SinOsc.ar(fenv!2);
	sig*env;
};)" ], [ 697.7973079, 'kof', "(
    ~test.quant=2;
    ~test.fadeTime=0.2;
    ~test={
        //         |       |       |       |       |  
        var pat = [1,0,0,0,1,0,0,0,1,0,0,0,1,0,0,0].rotate(3);
        var imp = PulseDivider.kr(~tick.kr,fib(4,4,5),~counter.kr);
        var hit = Select.kr(PulseCount.kr(imp)%pat.size,pat);
        var env = EnvGen.ar(Env([0.001,1,0.001],[0.002,0.5],[3,-3],curve:'exp'),imp * hit);
        var sig = LFSaw.ar(44*(1+[1,2,4,3].reciprocal),(1..8)/16);
        sig = LPF.ar(sig,800);
        sig = sig * env;
        Splay.ar(sig,0.75,0.45);
    };
    ~test.play;
);" ], [ 696.0752753, 'joach', "(
~jsin[0] = {
var osc = SinOsc.ar(( \\freq.kr(1300) + \\fplus.kr(0) ), mul: 1, add: 0);
var noise = BrownNoise.ar(\\noise.kr(0), (1 - \\noise.kr(0)));
var sig = osc * noise;
Pan2.ar( sig * \\amp.kr(0), \\pan.kr(0) );
};
)" ], [ 692.145238, 'joach', "(
~jsin[0] = {
var osc = SinOsc.ar(( \\freq.kr(130) + \\fplus.kr(0) ), mul: 1, add: 0);
var noise = BrownNoise.ar(\\noise.kr(0), (1 - \\noise.kr(0)));
var sig = osc * noise;
Pan2.ar( sig * \\amp.kr(0), \\pan.kr(0) );
};
)" ], [ 687.4422273, 'kof', "(
    ~test.quant=2;
    ~test.fadeTime=0.2;
    ~test={
        //         |       |       |       |       |  
        var pat = [1,0,0,0,1,0,0,0,1,0,0,0,1,0,0,0].rotate(3);
        var imp = PulseDivider.kr(~tick.kr,fib(4,4,5),~counter.kr);
        var hit = Select.kr(PulseCount.kr(imp)%pat.size,pat);
        var env = EnvGen.ar(Env([0.001,1,0.001],[0.002,0.5],[3,-3],curve:'exp'),imp * hit);
        var sig = LFSaw.ar(44*(1+[1,2,4,8].reciprocal),(1..8)/16);
        sig = LPF.ar(sig,800);
        sig = sig * env;
        Splay.ar(sig,0.75,0.45);
    };
    ~test.play;
);" ], [ 681.5451896, 'joach', "p.clock.tempo_(240/60);" ], [ 671.826142, 'joach', "(
~jsin[2] = \\set -> QuantEnv(\\fplus, 0.5)
.phase(1, [0,170,0], [0.005, 0.15], [8,-8], 0, 8)
.phase(2, [80,260,0], [0.035, 0.065], [8,-8], 0, 1)
.play([1, 2]);
)" ], [ 668.0131332, 'kof', "(
    ~test.quant=2;
    ~test.fadeTime=0.2;
    ~test={
        //         |       |       |       |       |  
        var pat = [1,0,0,0,1,0,0,0,1,0,0,0,1,0,0,0].rotate(3);
        var imp = PulseDivider.kr(~tick.kr,fib(4,4,5),~counter.kr);
        var hit = Select.kr(PulseCount.kr(imp)%pat.size,pat);
        var env = EnvGen.ar(Env([0.001,1,0.001],[0.002,0.45],[3,-3],curve:'exp'),imp * hit);
        var sig = LFSaw.ar(440/(1+[1,2,4,8].reciprocal),(1..8)/16);
        sig = LPF.ar(sig,800);
        sig = sig * env;
        Splay.ar(sig,0.75,0.45);
    };
    ~test.play;
);" ], [ 666.5531311, 'alex', "~d.clear;" ], [ 665.2631293, 'kof', "(
    ~test.quant=2;
    ~test.fadeTime=0.2;
    ~test={
        //         |       |       |       |       |  
        var pat = [1,0,0,0,1,0,0,0,1,0,0,0,1,0,0,0].rotate(3);
        var imp = PulseDivider.kr(~tick.kr,fib(4,4,5),~counter.kr);
        var hit = Select.kr(PulseCount.kr(imp)%pat.size,pat);
        var env = EnvGen.ar(Env([0.001,1,0.001],[0.002,0.05],[3,-3],curve:'exp'),imp * hit);
        var sig = LFSaw.ar(440/(1+[1,2,4,8].reciprocal),(1..8)/16);
        sig = LPF.ar(sig,800);
        sig = sig * env;
        Splay.ar(sig,0.75,0.45);
    };
    ~test.play;
);" ], [ 660.0330936, 'joach', "(
~jsin[1] = \\set -> QuantEnv(\\amp, 1)
.phase(1, [0.2,1,0.2], [0.05, 0.95], [2,-2], 0, 16)
.phase(2, [0.5,1,0.2], [3.35, 4.65], [2,-2], 0, 1)
.play([1,2]);
)" ], [ 654.3550511, 'joach', "(
~jsin[6] = \\set -> QuantEnv(\\mulgverb, 4)
.phase(1, [0,1,0], [0.05, 0.95], [2,-2], 0, 1)
.phase(2, [0,1,0], [0.35, 0.65], [2,-2], 0, 1)
.play([1,2]);
)" ], [ 654.1580477, 'alex', "~d[30]=\\filter-> {arg in; GVerb.ar(Limiter.ar(in,0.2),40)};" ], [ 650.5080426, 'alex', "~d[30]=\\filter-> {arg in; GVerb.ar(Limiter.ar(in,0.5),40)};" ], [ 649.4980411, 'kof', "(
~kick.quant=2;
~kick.fadeTime=0.2;
~kick={
  //         |       |       |       |       |  
  var pat = [1,0,0,0,1,0,0,0,1,0,0,0,1,0,0,0].rotate(1);
  var imp = PulseDivider.kr(~tick.kr,2,~counter.kr);
  var hit = Select.kr(PulseCount.kr(imp)%pat.size,pat);
  var env = EnvGen.ar(Env([0.001,1,0.001],[0.002,0.5],[3,-3],curve:'exp'),imp * hit);
    var sig = SinOsc.ar(44+(env**100*100));
  sig = sig * env;
  Splay.ar(sig,0.75,0.75);
};
~kick.play;
);" ], [ 644.0900036, 'joach', "~jsin.play(vol: 0.2, fadeTime: 8);" ], [ 643.5869999, 'kof', "(
    ~test.quant=2;
    ~test.fadeTime=0.2;
    ~test={
        //         |       |       |       |       |  
        var pat = [1,0,0,0,1,0,0,0,1,0,0,0,1,0,0,0].rotate(3);
        var imp = PulseDivider.kr(~tick.kr,fib(4,4,5),~counter.kr);
        var hit = Select.kr(PulseCount.kr(imp)%pat.size,pat);
        var env = EnvGen.ar(Env([0.001,1,0.001],[0.002,0.15],[3,-3],curve:'exp'),imp * hit);
        var sig = LFSaw.ar(440/(1+[1,2,4,8].reciprocal),(1..8)/16);
        sig = LPF.ar(sig,800);
        sig = sig * env;
        Splay.ar(sig,0.75,0.45);
    };
    ~test.play;
);" ], [ 640.274965, 'joach', "(
~jsin[0] = {
var osc = SinOsc.ar(( \\freq.kr(30) + \\fplus.kr(0) ), mul: 1, add: 0);
var noise = BrownNoise.ar(\\noise.kr(0), (1 - \\noise.kr(0)));
var sig = osc * noise;
Pan2.ar( sig * \\amp.kr(0), \\pan.kr(0) );
};
)" ], [ 637.648927, 'joach', "(
~jsin[1] = \\set -> QuantEnv(\\amp, 2)
.phase(1, [0.2,1,0.2], [0.05, 0.95], [2,-2], 0, 16)
.phase(2, [0.5,1,0.2], [3.35, 4.65], [2,-2], 0, 1)
.play([1,2]);
)" ], [ 636.2519235, 'kof', "(
    ~test.quant=2;
    ~test.fadeTime=0.2;
    ~test={
        //         |       |       |       |       |  
        var pat = [1,0,0,0,1,0,0,0,1,0,0,0,1,0,0,0].rotate(3);
        var imp = PulseDivider.kr(~tick.kr,fib(4,4,5)*2,~counter.kr);
        var hit = Select.kr(PulseCount.kr(imp)%pat.size,pat);
        var env = EnvGen.ar(Env([0.001,1,0.001],[0.002,0.15],[3,-3],curve:'exp'),imp * hit);
        var sig = LFSaw.ar(440/(1+[1,2,4,8].reciprocal),(1..8)/16);
        sig = LPF.ar(sig,800);
        sig = sig * env;
        Splay.ar(sig,0.75,0.45);
    };
    ~test.play;
);" ], [ 634.0319204, 'alex', "~d[30]=\\filter-> {arg in; GVerb.ar(Limiter.ar(in,0.1),40)};" ], [ 631.3719167, 'kof', "(
~kick.quant=2;
~kick.fadeTime=0.2;
~kick={
  //         |       |       |       |       |  
  var pat = [1,0,0,0,1,0,0,0,1,0,0,0,1,0,0,0].rotate(1);
  var imp = PulseDivider.kr(~tick.kr,4,~counter.kr);
  var hit = Select.kr(PulseCount.kr(imp)%pat.size,pat);
  var env = EnvGen.ar(Env([0.001,1,0.001],[0.002,0.5],[3,-3],curve:'exp'),imp * hit);
    var sig = SinOsc.ar(44+(env**100*100));
  sig = sig * env;
  Splay.ar(sig,0.75,0.75);
};
~kick.play;
);" ], [ 628.3319124, 'kof', "(
    ~ff.quant=1;
    ~ff.fadeTime=1;
    ~ff={
        var high,mid,low;
        var sig = ~test + ~kick;

        sig = GVerb.ar(LPF.ar(sig,5000)+HPF.ar(sig,500),40,[3,4],spread:[40,90])/8 + sig;
        low = CompanderD.ar(LPF.ar(sig,400),3/4,1/2,1/2);
        mid = CompanderD.ar(BPF.ar(sig,600,2),3/4,1/2,1/2);
        high = CompanderD.ar(HPF.ar(sig,900),3/4,1/2,1/2);
        sig = CompanderD.ar((high+mid+low).flat,3/4,1/1.1,1/1.1);
        Splay.ar(sig,0.75,0.25);
    };
    ~ff.play;
);" ], [ 617.0018966, 'kof', "(
~kick.quant=2;
~kick.fadeTime=0.2;
~kick={
  //         |       |       |       |       |  
  var pat = [1,0,0,0,1,0,0,0,1,0,0,0,1,0,0,0].rotate(1);
  var imp = PulseDivider.kr(~tick.kr,4,~counter.kr);
  var hit = Select.kr(PulseCount.kr(imp)%pat.size,pat);
  var env = EnvGen.ar(Env([0.001,1,0.001],[0.002,0.5],[3,-3],curve:'exp'),imp * hit);
    var sig = SinOsc.ar(44+(env**100*100));
  sig = sig * env;
  Splay.ar(sig,0.75,0.5);
};
~kick.play;
);" ], [ 616.3218956, 'alex', "(
~d[0]={
	var sig, env, fenv;
	
	env=EnvGen.kr(Env([0,1,0],[0.05,0.2],[\\welch, \\welch]),\\trig.tr);
	fenv=EnvGen.kr(Env([\\freq.kr,\\freq.kr*8,\\freq.kr],[0.01,0.04],[\\welch, \\welch]),\\trig.tr);

	sig=LFPulse.ar(fenv!2,add:GrayNoise.ar(fenv/2000)).lag([0.01,0.02]);
	sig*env;
};)" ], [ 596.7118681, 'alex', "~d[1]=\\set-> Pbind(\\args, [\\trig], \\dur, 1, \\trig, 1);" ], [ 593.090863, 'alex', "~d.play(vol:1, fadeTime:2);" ], [ 583.9808503, 'kof', "(
    ~test.quant=2;
    ~test.fadeTime=0.2;
    ~test={
        //         |       |       |       |       |  
        var pat = [1,0,0,0,1,0,0,0,1,0,0,0,1,1,1,1].rotate(3);
        var imp = PulseDivider.kr(~tick.kr,fib(4,4,5)*2,~counter.kr);
        var hit = Select.kr(PulseCount.kr(imp)%pat.size,pat);
        var env = EnvGen.ar(Env([0.001,1,0.001],[0.002,0.15],[3,-3],curve:'exp'),imp * hit);
        var sig = LFSaw.ar(440/(1+[1,2,4,8].reciprocal),(1..8)/16);
        sig = LPF.ar(sig,800);
        sig = sig * env;
        Splay.ar(sig,0.75,0.15);
    };
    ~test.play;
);" ], [ 581.2408464, 'kof', "(
    ~test.quant=2;
    ~test.fadeTime=0.2;
    ~test={
        //         |       |       |       |       |  
        var pat = [1,0,0,0,1,0,0,0,1,0,0,0,1,1,1,1].rotate(3);
        var imp = PulseDivider.kr(~tick.kr,fib(4,4,5)*2,~counter.kr);
        var hit = Select.kr(PulseCount.kr(imp)%pat.size,pat);
        var env = EnvGen.ar(Env([0.001,1,0.001],[0.102,0.15],[3,-3],curve:'exp'),imp * hit);
        var sig = LFSaw.ar(440/(1+[1,2,4,8].reciprocal),(1..8)/16);
        sig = LPF.ar(sig,800);
        sig = sig * env;
        Splay.ar(sig,0.75,0.15);
    };
    ~test.play;
);" ], [ 579.5808441, 'alex', "(
~d[0]={
	var sig, env, fenv;
	
	env=EnvGen.kr(Env([0,1,0],[0.05,0.2],[\\welch, \\welch]),\\trig.tr);
	fenv=EnvGen.kr(Env([\\freq.kr,\\freq.kr*8,\\freq.kr],[0.01,0.04],[\\welch, \\welch]),\\trig.tr);

	sig=LFSaw.ar(fenv!2,add:GrayNoise.ar(fenv/2000)).lag([0.01,0.02]);
	sig*env;
};)" ], [ 577.8608417, 'kof', "(
    ~test.quant=2;
    ~test.fadeTime=0.2;
    ~test={
        //         |       |       |       |       |  
        var pat = [1,0,0,0,1,0,0,0,1,0,0,0,1,1,1,1].rotate(3);
        var imp = PulseDivider.kr(~tick.kr,fib(4,4,5)*2,~counter.kr);
        var hit = Select.kr(PulseCount.kr(imp)%pat.size,pat);
        var env = EnvGen.ar(Env([0.001,1,0.001],[0.102,1.15],[3,-3],curve:'exp'),imp * hit);
        var sig = LFSaw.ar(440/(1+[1,2,4,8].reciprocal),(1..8)/16);
        sig = LPF.ar(sig,800);
        sig = sig * env;
        Splay.ar(sig,0.75,0.15);
    };
    ~test.play;
);" ], [ 576.1508393, 'kof', "(
    ~test.quant=2;
    ~test.fadeTime=0.2;
    ~test={
        //         |       |       |       |       |  
        var pat = [1,0,0,0,1,0,0,0,1,0,0,0,1,1,1,1].rotate(3);
        var imp = PulseDivider.kr(~tick.kr,fib(4,4,5)*2,~counter.kr);
        var hit = Select.kr(PulseCount.kr(imp)%pat.size,pat);
        var env = EnvGen.ar(Env([0.001,1,0.001],[0.102,0.15],[3,-3],curve:'exp'),imp * hit);
        var sig = LFSaw.ar(440/(1+[1,2,4,8].reciprocal),(1..8)/16);
        sig = LPF.ar(sig,800);
        sig = sig * env;
        Splay.ar(sig,0.75,0.15);
    };
    ~test.play;
);" ], [ 571.1118273, 'kof', "(
    ~test.quant=2;
    ~test.fadeTime=0.2;
    ~test={
        //         |       |       |       |       |  
        var pat = [1,0,0,0,1,0,0,0,1,0,0,0,1,1,1,1].rotate(3);
        var imp = PulseDivider.kr(~tick.kr,fib(4,4,5)*2,~counter.kr);
        var hit = Select.kr(PulseCount.kr(imp)%pat.size,pat);
        var env = EnvGen.ar(Env([0.001,1,0.001],[1.102,0.15],[3,-3],curve:'exp'),imp * hit);
        var sig = LFSaw.ar(440/(1+[1,2,4,8].reciprocal),(1..8)/16);
        sig = LPF.ar(sig,800);
        sig = sig * env;
        Splay.ar(sig,0.75,0.15);
    };
    ~test.play;
);" ], [ 570.6738022, 'joach', "~jsin.stop(6);" ], [ 566.9487934, 'alex', "(
~d[0]={
	var sig, env, fenv;
	
	env=EnvGen.kr(Env([0,1,0],[0.05,0.2],[\\welch, \\welch]),\\trig.tr);
	fenv=EnvGen.kr(Env([\\freq.kr,\\freq.kr*8,\\freq.kr],[0.01,0.04],[\\welch, \\welch]),\\trig.tr);

	sig=LFSaw.ar(fenv!2,add:GrayNoise.ar(fenv/2000));
	sig*env;
};)" ], [ 562.9687878, 'alex', "(
~d[0]={
	var sig, env, fenv;
	
	env=EnvGen.kr(Env([0,1,0],[0.05,0.2],[\\welch, \\welch]),\\trig.tr);
	fenv=EnvGen.kr(Env([\\freq.kr,\\freq.kr*8,\\freq.kr],[0.01,0.04],[\\welch, \\welch]),\\trig.tr);

	sig=LFSaw.ar(fenv!2,add:GrayNoise.ar(fenv/200));
	sig*env;
};)" ], [ 558.5537507, 'joach', "(
~jsin[2] = \\set -> QuantEnv(\\fplus, 1)
.phase(1, [0,170,0], [0.005, 0.15], [8,-8], 0, 8)
.phase(2, [80,260,0], [0.035, 0.065], [8,-8], 0, 1)
.play([1, 2]);
)" ], [ 556.094745, 'kof', "(
    ~test.quant=2;
    ~test.fadeTime=0.2;
    ~test={
        //         |       |       |       |       |  
        var pat = [1,0,0,0,1,0,0,0,1,0,0,0,1,1,1,1].rotate(3);
        var imp = PulseDivider.kr(~tick.kr,fib(4,4,5),~counter.kr);
        var hit = Select.kr(PulseCount.kr(imp)%pat.size,pat);
        var env = EnvGen.ar(Env([0.001,1,0.001],[0.102,0.15],[3,-3],curve:'exp'),imp * hit);
        var sig = LFSaw.ar(440/(1+[1,2,4,8].reciprocal),(1..8)/16);
        sig = LPF.ar(sig,800);
        sig = sig * env;
        Splay.ar(sig,0.75,0.15);
    };
    ~test.play;
);" ], [ 554.9047434, 'alex', "~d.play(vol:0.7, fadeTime:2);" ], [ 551.8947392, 'alex', "~d[2]=\\set-> Pbind(\\args, [\\freq], \\dur, 4, \\freq, Pseq([85,65,165,85,440],inf));" ], [ 551.0047379, 'alex', "~d[1]=\\set-> Pbind(\\args, [\\trig], \\dur, 6, \\trig, 1);" ], [ 546.5647317, 'alex', "(
~d[0]={
	var sig, env, fenv;
	
	env=EnvGen.kr(Env([0,1,0],[0.05,0.2],[\\welch, \\welch]),\\trig.tr);
	fenv=EnvGen.kr(Env([\\freq.kr,\\freq.kr*8,\\freq.kr],[0.01,0.04],[\\welch, \\welch]),\\trig.tr);

	sig=LFSaw.ar(fenv!2,add:GrayNoise.ar(fenv/100));
	sig*env;
};)" ], [ 544.4486977, 'joach', "~jsin.play(vol: 0.9, fadeTime: 8);" ], [ 538.3386574, 'joach', "(
~jsin[2] = \\set -> QuantEnv(\\fplus, 1)
.phase(1, [0,170,0], [0.005, 0.15], [8,-8], 0, 8)
.phase(2, [5800,60,0], [0.035, 4.165], [8,-8], 0, 1)
.play([1, 2]);
)" ], [ 535.4996172, 'joach', "(
~jsin[2] = \\set -> QuantEnv(\\fplus, 1)
.phase(1, [0,170,0], [0.005, 0.25], [8,-8], 0, 8)
.phase(2, [5800,60,0], [0.035, 4.165], [8,-8], 0, 1)
.play([1, 2]);
)" ], [ 535.1616157, 'kof', "(
    ~test.quant=2;
    ~test.fadeTime=0.2;
    ~test={
        //         |       |       |       |       |  
        var pat = [1,0,0,0,1,0,0,0,1,0,0,0,1,1,1,1].rotate(3);
        var imp = PulseDivider.kr(~tick.kr,fib(4,4,5),~counter.kr);
        var hit = Select.kr(PulseCount.kr(imp)%pat.size,pat);
        var env = EnvGen.ar(Env([0.001,1,0.001],[0.102,0.15],[3,-3],curve:'exp'),imp * hit);
        var sig = LFSaw.ar(440/[1,2,4,8],(1..8)/16);
        sig = LPF.ar(sig,800);
        sig = sig * env;
        Splay.ar(sig,0.75,0.15);
    };
    ~test.play;
);" ], [ 530.8716097, 'alex', "(
~d[0]={
	var sig, env, fenv;
	
	env=EnvGen.kr(Env([0,1,0],[0.5,4],[\\welch, \\welch]),\\trig.tr);
	fenv=EnvGen.kr(Env([\\freq.kr,\\freq.kr*8,\\freq.kr],[0.01,0.04],[\\welch, \\welch]),\\trig.tr);

	sig=LFSaw.ar(fenv!2,add:GrayNoise.ar(fenv/100));
	sig*env;
};)" ], [ 528.623576, 'joach', "(
~jsin[0] = {
var osc = SinOsc.ar(( \\freq.kr(30) + \\fplus.kr(0) ), mul: 1, add: 0);
var noise = BrownNoise.ar(\\noise.kr(0), (1 - \\noise.kr(0)));
var sig = osc * noise;
Pan2.ar( sig * \\amp.kr(0), \\pan.kr(0) );
};
)" ], [ 524.4085675, 'alex', "(
~d[0]={
	var sig, env, fenv;
	
	env=EnvGen.kr(Env([0,1,0],[0.5,4],[\\welch, \\welch]),\\trig.tr);
	fenv=EnvGen.kr(Env([\\freq.kr,\\freq.kr*8,\\freq.kr],[0.01,0.04],[\\welch, \\welch]),\\trig.tr);

	sig=LFSaw.ar(fenv!2,add:GrayNoise.ar(fenv/10));
	sig*env;
};)" ], [ 523.1465339, 'joach', "(
~jsin[0] = {
var osc = SinOsc.ar(( \\freq.kr(80) + \\fplus.kr(0) ), mul: 1, add: 0);
var noise = BrownNoise.ar(\\noise.kr(0), (1 - \\noise.kr(0)));
var sig = osc * noise;
Pan2.ar( sig * \\amp.kr(0), \\pan.kr(0) );
};
)" ], [ 520.7745293, 'kof', "(
    ~test.quant=2;
    ~test.fadeTime=0.2;
    ~test={
        //         |       |       |       |       |  
        var pat = [1,0,0,0,1,0,0,0,1,0,0,0,1,1,1,1].rotate(3);
        var imp = PulseDivider.kr(~tick.kr,fib(4,1,2),~counter.kr);
        var hit = Select.kr(PulseCount.kr(imp)%pat.size,pat);
        var env = EnvGen.ar(Env([0.001,1,0.001],[0.102,0.15],[3,-3],curve:'exp'),imp * hit);
        var sig = LFSaw.ar(440/[1,2,4,8],(1..8)/16);
        sig = LPF.ar(sig,800);
        sig = sig * env;
        Splay.ar(sig,0.75,0.15);
    };
    ~test.play;
);" ], [ 520.3795084, 'alex', "~d[30]=\\filter-> {arg in; Limiter.ar(in,0.1)};" ], [ 520.198498, 'joach', "(
~jsin[0] = {
var osc = SinOsc.ar(( \\freq.kr(180) + \\fplus.kr(0) ), mul: 1, add: 0);
var noise = BrownNoise.ar(\\noise.kr(0), (1 - \\noise.kr(0)));
var sig = osc * noise;
Pan2.ar( sig * \\amp.kr(0), \\pan.kr(0) );
};
)" ], [ 513.1914856, 'kof', "(
    ~test.quant=2;
    ~test.fadeTime=0.2;
    ~test={
        //         |       |       |       |       |  
        var pat = [1,0,0,0,1,0,0,0,1,0,0,0,1,1,1,1].rotate(3);
        var imp = PulseDivider.kr(~tick.kr,fib(4,1,2),~counter.kr);
        var hit = Select.kr(PulseCount.kr(imp)%pat.size,pat);
        var env = EnvGen.ar(Env([0.001,1,0.001],[0.102,0.15],[3,-3],curve:'exp'),imp * hit);
        var sig = LFSaw.ar(4400/[1,2,4,8],(1..8)/16);
        sig = LPF.ar(sig,800);
        sig = sig * env;
        Splay.ar(sig,0.75,0.15);
    };
    ~test.play;
);" ], [ 513.0114854, 'alex', "~d[2]=\\set-> Pbind(\\args, [\\freq], \\dur, 4, \\freq, Pseq([85,65,165,85,440],inf));" ], [ 510.8414823, 'alex', "~d[1]=\\set-> Pbind(\\args, [\\trig], \\dur, 6, \\trig, 1);" ], [ 508.6814793, 'alex', "(
~d[0]={
	var sig, env, fenv;
	
	env=EnvGen.kr(Env([0,1,0],[0.5,4],[\\welch, \\welch]),\\trig.tr);
	fenv=EnvGen.kr(Env([\\freq.kr,\\freq.kr*8,\\freq.kr],[0.01,0.04],[\\welch, \\welch]),\\trig.tr);

	sig=LFSaw.ar(fenv!2,add:GrayNoise.ar(fenv/10));
	sig*env;
};)" ], [ 506.7714766, 'kof', "(
    ~test.quant=2;
    ~test.fadeTime=0.2;
    ~test={
        //         |       |       |       |       |  
        var pat = [1,0,0,0,1,0,0,0,1,0,0,0,1,1,1,1].rotate(3);
        var imp = PulseDivider.kr(~tick.kr,fib(4,1,2),~counter.kr);
        var hit = Select.kr(PulseCount.kr(imp)%pat.size,pat);
        var env = EnvGen.ar(Env([0.001,1,0.001],[0.002,0.15],[3,-3],curve:'exp'),imp * hit);
        var sig = LFSaw.ar(4400/[1,2,4,8],(1..8)/16);
        sig = LPF.ar(sig,800);
        sig = sig * env;
        Splay.ar(sig,0.75,0.15);
    };
    ~test.play;
);" ], [ 501.351469, 'kof', "(
    ~test.quant=2;
    ~test.fadeTime=0.2;
    ~test={
        //         |       |       |       |       |  
        var pat = [1,0,0,0,1,0,0,0,1,0,0,0,1,1,1,1].rotate(3);
        var imp = PulseDivider.kr(~tick.kr,fib(4,1,2),~counter.kr);
        var hit = Select.kr(PulseCount.kr(imp)%pat.size,pat);
        var env = EnvGen.ar(Env([0.001,1,0.001],[0.002,0.15],[3,-3],curve:'exp'),imp * hit);
        var sig = LFSaw.ar(4400/[1,2,4,8],(1..8)/16);
        sig = LPF.ar(sig,800);
        sig = sig * env;
        Splay.ar(sig,0.75,0.5);
    };
    ~test.play;
);" ], [ 499.9894341, 'joach', "(
~jsin[2] = \\set -> QuantEnv(\\fplus, 1)
.phase(1, [0,4700,0], [0.005, 0.25], [8,-8], 0, 8)
.phase(2, [5800,60,0], [0.035, 4.165], [8,-8], 0, 1)
.play([1, 2]);
)" ], [ 491.9073897, 'joach', "(
~jsin[2] = \\set -> QuantEnv(\\fplus, 1)
.phase(1, [0,4700,0], [0.005, 0.25], [8,-8], 0, 8)
.phase(2, [400,60,0], [0.035, 4.165], [8,-8], 0, 1)
.play([1, 2]);
)" ], [ 488.1773845, 'kof', "(
    ~test.quant=2;
    ~test.fadeTime=0.2;
    ~test={
        //         |       |       |       |       |  
        var pat = [1,0,0,0,1,0,0,0,1,0,0,0,1,1,1,1].rotate(3);
        var imp = PulseDivider.kr(~tick.kr,fib(4,1,2),~counter.kr);
        var hit = Select.kr(PulseCount.kr(imp)%pat.size,pat);
        var env = EnvGen.ar(Env([0.001,1,0.001],[0.002,0.15],[3,-3],curve:'exp'),imp * hit);
        var sig = LFSaw.ar(4400,(1..8)/16);
        sig = LPF.ar(sig,800);
        sig = sig * env;
        Splay.ar(sig,0.75,0.5);
    };
    ~test.play;
);" ], [ 486.6663522, 'joach', "(
~jsin[2] = \\set -> QuantEnv(\\fplus, 1)
.phase(1, [0,3700,0], [0.005, 0.25], [8,-8], 0, 8)
.phase(2, [400,60,0], [0.035, 4.165], [8,-8], 0, 1)
.play([1, 2]);
)" ], [ 483.6453451, 'kof', "(
    ~ff.quant=1;
    ~ff.fadeTime=1;
    ~ff={
        var high,mid,low;
        var sig = ~test;

        sig = GVerb.ar(LPF.ar(sig,5000)+HPF.ar(sig,500),40,[3,4],spread:[40,90])/8 + sig;
        low = CompanderD.ar(LPF.ar(sig,400),3/4,1/2,1/2);
        mid = CompanderD.ar(BPF.ar(sig,600,2),3/4,1/2,1/2);
        high = CompanderD.ar(HPF.ar(sig,900),3/4,1/2,1/2);
        sig = CompanderD.ar((high+mid+low).flat,3/4,1/1.1,1/1.1);
        Splay.ar(sig,0.75,0.25);
    };
    ~ff.play;
);" ], [ 481.0353415, 'kof', "(
    ~test.quant=2;
    ~test.fadeTime=0.2;
    ~test={
        //         |       |       |       |       |  
        var pat = [1,0,0,0,1,0,0,0,1,0,0,0,1,1,1,1].rotate(3);
        var imp = PulseDivider.kr(~tick.kr,fib(4,1,2),~counter.kr);
        var hit = Select.kr(PulseCount.kr(imp)%pat.size,pat);
        var env = EnvGen.ar(Env([0.001,1,0.001],[0.002,0.15],[3,-3],curve:'exp'),imp * hit);
        var sig = LFSaw.ar(44,(1..8)/16);
        sig = LPF.ar(sig,800);
        sig = sig * env;
        Splay.ar(sig,0.75,0.5);
    };
    ~test.play;
);" ], [ 477.4443364, 'kof', "(
    ~test.quant=2;
    ~test.fadeTime=0.2;
    ~test={
        //         |       |       |       |       |  
        var pat = [1,0,0,0,1,0,0,0,1,0,0,0,1,1,1,1].rotate(3);
        var imp = PulseDivider.kr(~tick.kr,fib(4,1,2)*2,~counter.kr);
        var hit = Select.kr(PulseCount.kr(imp)%pat.size,pat);
        var env = EnvGen.ar(Env([0.001,1,0.001],[0.002,0.15],[3,-3],curve:'exp'),imp * hit);
        var sig = LFSaw.ar(44,(1..8)/16);
        sig = LPF.ar(sig,800);
        sig = sig * env;
        Splay.ar(sig,0.75,0.5);
    };
    ~test.play;
);" ], [ 469.4233251, 'kof', "(
    ~test.quant=2;
    ~test.fadeTime=0.2;
    ~test={
        //         |       |       |       |       |  
        var pat = [1,0,0,0,1,0,0,0,1,0,0,0,1,1,1,1].rotate(3);
        var imp = PulseDivider.kr(~tick.kr,fib(4,1,2)*4,~counter.kr);
        var hit = Select.kr(PulseCount.kr(imp)%pat.size,pat);
        var env = EnvGen.ar(Env([0.001,1,0.001],[0.002,0.15],[3,-3],curve:'exp'),imp * hit);
        var sig = LFSaw.ar(44,(1..8)/16);
        sig = LPF.ar(sig,800);
        sig = sig * env;
        Splay.ar(sig,0.75,0.5);
    };
    ~test.play;
);" ], [ 462.4233153, 'kof', "(
    ~test.quant=2;
    ~test.fadeTime=0.2;
    ~test={
        //         |       |       |       |       |  
        var pat = [1,0,0,0,1,0,0,0,1,0,0,0,1,1,1,1].rotate(3);
        var imp = PulseDivider.kr(~tick.kr,fib(4,1,2)*4,~counter.kr);
        var hit = Select.kr(PulseCount.kr(imp)%pat.size,pat);
        var env = EnvGen.ar(Env([0.001,1,0.001],[0.002,0.15],[3,-3],curve:'exp'),imp * hit);
        var sig = LFSaw.ar(44,(1..8)/16);
        sig = LPF.ar(sig,800);
        sig = sig * env;
        Splay.ar(sig,0.75,0.15);
    };
    ~test.play;
);" ], [ 461.4233139, 'kof', "(
    p.clock.tempo_(240/60);

    ~offset = (0..7)/8;

    ~tick.quant = 1;
    ~tick = {Mix(Impulse.kr( ~tempo / 2 , ~offset ))};

    ~counter = {PulseCount.kr(~tick.kr)};
);" ], [ 459.1512794, 'joach', "(
~jsin[2] = \\set -> QuantEnv(\\fplus, 1)
.phase(1, [0,4700,0], [0.005, 0.25], [8,-8], 0, 8)
.phase(2, [400,60,0], [0.035, 4.165], [8,-8], 0, 1)
.play([1, 2]);
)" ], [ 452.0562396, 'joach', "~jsin[4] = \\filter -> {|in| LPF.ar(in, \\lpf_freq.kr(800,8)) };" ], [ 450.050232, 'kof', "(
    ~test.quant=2;
    ~test.fadeTime=0.2;
    ~test={
        //         |       |       |       |       |  
        var pat = [1,0,0,0,1,0,0,0,1,0,0,0,1,1,1,1].rotate(3);
        var imp = PulseDivider.kr(~tick.kr,fib(4,1,2)*4,~counter.kr);
        var hit = Select.kr(PulseCount.kr(imp)%pat.size,pat);
        var env = EnvGen.ar(Env([0.001,1,0.001],[0.002,0.15],[3,-3],curve:'exp'),imp * hit);
        var sig = LFSaw.ar(44,(1..8)/16);
        sig = LPF.ar(sig,800);
        sig = sig * env;
        Splay.ar(sig,0.75,0.5);
    };
    ~test.play;
);" ], [ 448.7792011, 'joach', "~jsin[4] = \\filter -> {|in| LPF.ar(in, \\lpf_freq.kr(1800,8)) };" ], [ 445.7191929, 'kof', "(
    ~ff.quant=1;
    ~ff.fadeTime=1;
    ~ff={
        var high,mid,low;
        var sig = ~test;

        sig = GVerb.ar(LPF.ar(sig,5000)+HPF.ar(sig,500),40,[3,4],spread:[40,90])/8 + sig;
        low = CompanderD.ar(LPF.ar(sig,400),3/4,1/2,1/2);
        mid = CompanderD.ar(BPF.ar(sig,600,2),3/4,1/2,1/2);
        high = CompanderD.ar(HPF.ar(sig,900),3/4,1/2,1/2);
        sig = CompanderD.ar((high+mid+low).flat,3/4,1/1.1,1/1.1);
        Splay.ar(sig,0.75,0.25);
    };
    ~ff.play;
);" ], [ 443.63919, 'kof', "(
    ~test.quant=2;
    ~test.fadeTime=0.2;
    ~test={
        //         |       |       |       |       |  
        var pat = [1,0,0,0,1,0,0,0,1,0,0,0,1,1,1,1].rotate(3);
        var imp = PulseDivider.kr(~tick.kr,fib(4,1,2)*4,~counter.kr);
        var hit = Select.kr(PulseCount.kr(imp)%pat.size,pat);
        var env = EnvGen.ar(Env([0.001,1,0.001],[0.002,0.15],[3,-3],curve:'exp'),imp * hit);
        var sig = LFSaw.ar(44,(1..8)/16);
        sig = LPF.ar(sig,800);
        sig = sig * env;
        Splay.ar(sig,0.75,0.25);
    };
    ~test.play;
);" ], [ 439.2291839, 'kof', "(
    ~test.quant=2;
    ~test.fadeTime=0.2;
    ~test={
        //         |       |       |       |       |  
        var pat = [1,0,0,0,1,0,0,0,1,0,0,0,1,1,1,1].rotate(3);
        var imp = PulseDivider.kr(~tick.kr,fib(4,1,2)*4,~counter.kr);
        var hit = Select.kr(PulseCount.kr(imp)%pat.size,pat);
        var env = EnvGen.ar(Env([0.001,1,0.001],[0.002,1.15],[3,-3],curve:'exp'),imp * hit);
        var sig = LFSaw.ar(44,(1..8)/16);
        sig = LPF.ar(sig,800);
        sig = sig * env;
        Splay.ar(sig,0.75,0.25);
    };
    ~test.play;
);" ], [ 435.5491502, 'joach', "(
~jsin[1] = \\set -> QuantEnv(\\amp, 1)
.phase(1, [0.2,1,0.2], [0.05, 0.95], [2,-2], 0, 16)
.phase(2, [0.5,1,0.2], [3.35, 4.65], [2,-2], 0, 1)
.play([1,2]);
)" ], [ 423.8751292, 'alex', "~d.clear;" ], [ 423.3180979, 'joach', "(
~jsin[2] = \\set -> QuantEnv(\\fplus, 1)
.phase(1, [0,4700,0], [0.005, 0.25], [8,-8], 0, 8)
.phase(2, [400,60,0], [0.035, 0.165], [8,-8], 0, 1)
.play([1, 2]);
)" ], [ 421.6430931, 'kof', "(
    ~test.quant=2;
    ~test.fadeTime=0.2;
    ~test={
        //         |       |       |       |       |  
        var pat = [1,0,0,0,1,0,0,0,1,0,0,0,1,1,1,1].rotate(3);
        var imp = PulseDivider.kr(~tick.kr,fib(4,1,2)*4,~counter.kr);
        var hit = Select.kr(PulseCount.kr(imp)%pat.size,pat);
        var env = EnvGen.ar(Env([0.001,1,0.001],[0.002,1.15],[3,-3],curve:'exp'),imp * hit);
        var sig = LFSaw.ar(44*[1,2,1.5,3],(1..8)/16);
        sig = LPF.ar(sig,800);
        sig = sig * env;
        Splay.ar(sig,0.75,0.25);
    };
    ~test.play;
);" ], [ 420.5830916, 'alex', "~d[30]=\\filter-> {arg in; Limiter.ar(in,0.1)};" ], [ 416.8960565, 'joach', "(
~jsin[1] = \\set -> QuantEnv(\\amp, 1)
.phase(1, [0.2,1,0.2], [0.05, 7.95], [2,-2], 0, 16)
.phase(2, [0.5,1,0.2], [3.35, 4.65], [2,-2], 0, 1)
.play([1,2]);
)" ], [ 416.8910562, 'kof', "(
    ~test.quant=2;
    ~test.fadeTime=0.2;
    ~test={
        //         |       |       |       |       |  
        var pat = [1,0,0,0,1,0,0,0,1,0,0,0,1,1,1,1].rotate(3);
        var imp = PulseDivider.kr(~tick.kr,fib(4,1,2)*16,~counter.kr);
        var hit = Select.kr(PulseCount.kr(imp)%pat.size,pat);
        var env = EnvGen.ar(Env([0.001,1,0.001],[0.002,1.15],[3,-3],curve:'exp'),imp * hit);
        var sig = LFSaw.ar(44*[1,2,1.5,3],(1..8)/16);
        sig = LPF.ar(sig,800);
        sig = sig * env;
        Splay.ar(sig,0.75,0.25);
    };
    ~test.play;
);" ], [ 414.0650485, 'alex', "~d.play(vol:0.7, fadeTime:2);" ], [ 410.4150434, 'alex', "~d[2]=\\set-> Pbind(\\args, [\\freq], \\dur, 4, \\freq, Pseq([85,65,165,85,440],inf));" ], [ 409.5550422, 'alex', "~d[1]=\\set-> Pbind(\\args, [\\trig], \\dur, 6, \\trig, 1);" ], [ 406.393007, 'joach', "(
~jsin[1] = \\set -> QuantEnv(\\amp, 8)
.phase(1, [0.2,1,0.2], [0.05, 7.95], [2,-2], 0, 16)
.phase(2, [0.5,1,0.2], [3.35, 4.65], [2,-2], 0, 1)
.play([1,2]);
)" ], [ 406.3740059, 'kof', "(
    ~test.quant=2;
    ~test.fadeTime=0.2;
    ~test={
        //         |       |       |       |       |  
        var pat = [1,0,0,0,1,0,0,0,1,0,0,0,1,1,1,1].rotate(3);
        var imp = PulseDivider.kr(~tick.kr,fib(4)*16,~counter.kr);
        var hit = Select.kr(PulseCount.kr(imp)%pat.size,pat);
        var env = EnvGen.ar(Env([0.001,1,0.001],[0.002,1.15],[3,-3],curve:'exp'),imp * hit);
        var sig = LFSaw.ar(44*[1,2,1.5,3],(1..8)/16);
        sig = LPF.ar(sig,800);
        sig = sig * env;
        Splay.ar(sig,0.75,0.25);
    };
    ~test.play;
);" ], [ 405.0799732, 'joach', "(
~jsin[1] = \\set -> QuantEnv(\\amp, 8)
.phase(1, [0.2,1,0.2], [0.05, 7.95], [2,-2], 0, 16)
.phase(2, [0.5,1,0.5], [3.35, 4.65], [2,-2], 0, 1)
.play([1,2]);
)" ], [ 404.5799691, 'alex', "(
~d[0]={
	var sig, env;
	
	env=EnvGen.kr(Env([0,1,0],[0.5,4],[\\welch, \\welch]),\\trig.tr);
	
	sig=CombL.ar(GrayNoise.ar(0.5),1/\\freq.kr,1/\\freq.kr-10,3);
	sig*env;
};)" ], [ 401.3499646, 'alex', "(
~d[0]={
	var sig, env;
	
	env=EnvGen.kr(Env([0,1,0],[0.5,4],[\\welch, \\welch]),\\trig.tr);
	
	sig=CombL.ar(GrayNoise.ar(0.5),1/\\freq.kr,1/\\freq.kr-20,3);
	sig*env;
};)" ], [ 399.9499626, 'kof', "~test.clear;" ], [ 398.3799604, 'kof', "(
~test.quant=2;
~test.fadeTime=0.2;
~test={
  //         |       |       |       |       |  
  var pat = [1,0,0,0,1,0,0,0,1,0,0,0,1,1,1,1].rotate(3);
    var imp = PulseDivider.kr(~tick.kr,fib(4)*16,~counter.kr);
  var hit = Select.kr(PulseCount.kr(imp)%pat.size,pat);
  var env = EnvGen.ar(Env([0.001,1,0.001],[0.002,1.15],[3,-3],curve:'exp'),imp * hit);
    var sig = LFSaw.ar(44*[1,2,1.5,3],(1..8)/16);
    sig = LPF.ar(sig,800);
  sig = sig * env;
  Splay.ar(sig,0.75,0.25);
};
~test.play;
);" ], [ 397.379959, 'kof', "(
~test.quant=2;
~test.fadeTime=0.2;
~test={
  //         |       |       |       |       |  
  var pat = [1,0,0,0,1,0,0,0,1,0,0,0,1,1,1,1].rotate(3);
    var imp = PulseDivider.kr(~tick.kr,fib(4)*16,~counter.kr);
  var hit = Select.kr(PulseCount.kr(imp)%pat.size,pat);
  var env = EnvGen.ar(Env([0.001,1,0.001],[0.002,1.15],[3,-3],curve:'exp'),imp * hit);
    var sig = LFSaw.ar(44*[1,2,1.5,3],(1..8)/16);
    sig = LPF.ar(sig,800);
  sig = sig * env;
  Splay.ar(sig,0.75,0.35);
};
~test.play;
);" ], [ 395.5999566, 'kof', "(
~test.quant=2;
~test.fadeTime=0.2;
~test={
  //         |       |       |       |       |  
  var pat = [1,0,0,0,1,0,0,0,1,0,0,0,1,1,1,1].rotate(3);
    var imp = PulseDivider.kr(~tick.kr,fib(4)*16,~counter.kr);
  var hit = Select.kr(PulseCount.kr(imp)%pat.size,pat);
  var env = EnvGen.ar(Env([0.001,1,0.001],[0.002,1.15],[3,-3],curve:'exp'),imp * hit);
    var sig = LFSaw.ar(44*[1,2,1.5,3],(1..8)/16);
    sig = LPF.ar(sig,800);
  sig = sig * env;
  Splay.ar(sig,0.75,0.55);
};
~test.play;
);" ], [ 392.7099525, 'kof', "(
~test.quant=2;
~test.fadeTime=0.2;
~test={
  //         |       |       |       |       |  
  var pat = [1,0,0,0,1,0,0,0,1,0,0,0,1,1,1,1].rotate(3);
    var imp = PulseDivider.kr(~tick.kr,fib(4)*16,~counter.kr);
  var hit = Select.kr(PulseCount.kr(imp)%pat.size,pat);
  var env = EnvGen.ar(Env([0.001,1,0.001],[0.002,1.15],[3,-3],curve:'exp'),imp * hit);
    var sig = LFSaw.ar(44*[1,2,1.5,3],(1..8)/16);
    sig = LPF.ar(sig,800);
  sig = sig * env;
  Splay.ar(sig,0.75,0.15);
};
~test.play;
);" ], [ 388.920916, 'joach', "(
~jsin[2] = \\set -> QuantEnv(\\fplus, 2)
.phase(1, [0,4700,0], [0.005, 0.25], [8,-8], 0, 8)
.phase(2, [400,60,0], [0.035, 0.165], [8,-8], 0, 1)
.play([1, 2]);
)" ], [ 388.9169158, 'alex', "~d[2]=\\set-> Pbind(\\args, [\\freq], \\dur, 4, \\freq, Pseq([85,65,165,85,440],inf));" ], [ 385.2058759, 'joach', "(
~jsin[2] = \\set -> QuantEnv(\\fplus, 2)
.phase(1, [0,470,0], [0.005, 0.25], [8,-8], 0, 8)
.phase(2, [400,60,0], [0.035, 0.165], [8,-8], 0, 1)
.play([1, 2]);
)" ], [ 381.2958705, 'kof', "(
~test.quant=2;
~test.fadeTime=0.2;
~test={
  //         |       |       |       |       |  
  var pat = [1,0,0,0,1,0,0,0,1,0,0,0,1,1,1,1].rotate(3);
    var imp = PulseDivider.kr(~tick.kr,fib(4)*16,~counter.kr);
  var hit = Select.kr(PulseCount.kr(imp)%pat.size,pat);
  var env = EnvGen.ar(Env([0.001,1,0.001],[1.002,1.15],[3,-3],curve:'exp'),imp * hit);
    var sig = LFSaw.ar(44*[1,2,1.5,3],(1..8)/16);
    sig = LPF.ar(sig,800);
  sig = sig * env;
  Splay.ar(sig,0.75,0.15);
};
~test.play;
);" ], [ 374.6658612, 'alex', "~d.play(vol:0.7, fadeTime:2);" ], [ 371.4258566, 'alex', "~d[30]=\\filter-> {arg in; Limiter.ar(in,0.1)};" ], [ 370.3448249, 'joach', "~jsin[4] = \\filter -> {|in| LPF.ar(in, \\lpf_freq.kr(800,8)) };" ], [ 369.524821, 'alex', "~d[2]=\\set-> Pbind(\\args, [\\freq], \\dur, 4, \\freq, Pseq([220,440,165,85,440],inf));" ], [ 367.9648188, 'alex', "~d[1]=\\set-> Pbind(\\args, [\\trig], \\dur, 6, \\trig, 1);" ], [ 365.8848159, 'alex', "(
~d[0]={
	var sig, env;
	
	env=EnvGen.kr(Env([0,1,0],[0.5,4],[\\welch, \\welch]),\\trig.tr);
	
	sig=CombL.ar(GrayNoise.ar(0.5),1/\\freq.kr,1/\\freq.kr,3);
	sig*env;
};)" ], [ 365.2057832, 'joach', "(
~jsin[3] = \\set -> QuantEnv(\\noise, 32)
.phase(1, [0.2,0.5,0.2], [28.05, 0.95], [2,-2], 0, 1)
.phase(2, [0,1,0], [0.35, 0.65], [2,-2], 0, 1)
.play([1]);
)" ], [ 361.058743, 'joach', "(
~jsin[3] = \\set -> QuantEnv(\\noise, 32)
.phase(1, [0,0.5,0.2], [28.05, 0.95], [2,-2], 0, 1)
.phase(2, [0,1,0], [0.35, 0.65], [2,-2], 0, 1)
.play([1]);
)" ], [ 349.5886962, 'joach', "(
~jsin[1] = \\set -> QuantEnv(\\amp, 8)
.phase(1, [0.2,1,0.2], [0.05, 7.95], [2,-2], 0, 16)
.phase(2, [0,1,0], [3.35, 4.65], [2,-2], 0, 1)
.play([1,2]);
)" ], [ 335.3526732, 'alex', "(
~d[0]={
	var sig, env;
	
	env=EnvGen.kr(Env([0,1,0],[0.5,4],[\\welch, \\welch]),\\trig.tr);
	
	sig=CombL.ar(GrayNoise.ar(0.5),1/\\freq.kr,\\freq.kr);
	sig*env;
};)" ], [ 333.9756407, 'joach', "(
~jsin[2] = \\set -> QuantEnv(\\fplus, 2)
.phase(1, [0,470,0], [0.005, 0.15], [8,-8], 0, 8)
.phase(2, [400,60,0], [0.035, 0.165], [8,-8], 0, 1)
.play([1, 2]);
)" ], [ 323.7486238, 'alex', "~d.clear;" ], [ 312.1365767, 'joach', "(
~jsin[2] = \\set -> QuantEnv(\\fplus, 2)
.phase(1, [0,470,0], [0.005, 0.15], [8,-8], 0, 8)
.phase(2, [400,60,0], [0.035, 0.165], [2,-2], 0, 1)
.play([1, 2]);
)" ], [ 305.9105649, 'alex', "~d.play(vol:0.7, fadeTime:2);" ], [ 305.2535334, 'joach', "~jsin.play(vol: 0.5, fadeTime: 8);" ], [ 303.5295286, 'alex', "~d[30]=\\filter-> {arg in; Limiter.ar(in,0.1)};" ], [ 299.568504, 'alex', "~d[2]=\\set-> Pbind(\\args, [\\freq], \\dur, 4, \\freq, Pseq([220,440,165,85,440],inf));" ], [ 299.358492, 'joach', "(
~jsin[1] = \\set -> QuantEnv(\\amp, 8)
.phase(1, [0.2,1,0.2], [0.05, 7.95], [2,-2], 0, 16)
.phase(2, [0,1,0], [0.35, 0.65], [2,-2], 0, 1)
.play([1,2]);
)" ], [ 298.4884885, 'alex', "~d[1]=\\set-> Pbind(\\args, [\\trig], \\dur, 6, \\trig, 1);" ], [ 296.5184858, 'alex', "(
~d[0]={
	var sig, env;
	
	env=EnvGen.kr(Env([0,1,0],[0.5,4],[\\welch, \\welch]),\\trig.tr);
	
	sig=CombN.ar(GrayNoise.ar(0.5),1/\\freq.kr,\\freq.kr);
	sig*env;
};)" ], [ 295.6464554, 'joach', "(
~jsin[1] = \\set -> QuantEnv(\\amp, 8)
.phase(1, [0.2,1,0.2], [0.05, 0.95], [2,-2], 0, 16)
.phase(2, [0,1,0], [0.35, 0.65], [2,-2], 0, 1)
.play([1,2]);
)" ], [ 292.0474147, 'joach', "(
~jsin[0] = {
var osc = SinOsc.ar(( \\freq.kr(80) + \\fplus.kr(0) ), mul: 1, add: 0);
var noise = BrownNoise.ar(\\noise.kr(0), (1 - \\noise.kr(0)));
var sig = osc * noise;
Pan2.ar( sig * \\amp.kr(0), \\pan.kr(0) );
};
)" ], [ 291.0553837, 'joach', "~jsin.play(vol: 0.9, fadeTime: 8);" ], [ 288.659342, 'joach', "p.clock.tempo_(240/60);" ], [ 288.1183111, 'joach', "p = ProxySpace.push(s).makeTempoClock;" ], [ 280.6513002, 'kof', "thisProcess.stop;" ], [ 276.9732667, 'joach', "(
~jsin[2] = \\set -> QuantEnv(\\fplus, 1)
.phase(1, [0,470,0], [0.005, 0.15], [8,-8], 0, 8)
.phase(2, [400,60,0], [0.035, 0.165], [2,-2], 0, 1)
.play([1, 2]);
)" ], [ 270.7092533, 'alex', "~d[1]=\\set-> Pbind(\\args, [\\trig], \\dur, 6, \\trig, 1);" ], [ 263.4742423, 'alex', "~d[30]=\\filter-> {arg in; Limiter.ar(in,0.1)};" ], [ 262.8862092, 'joach', "(
~jsin[2] = \\set -> QuantEnv(\\fplus, 1)
.phase(1, [0,170,0], [0.005, 0.15], [8,-8], 0, 8)
.phase(2, [400,60,0], [0.035, 0.165], [2,-2], 0, 1)
.play([1, 2]);
)" ], [ 252.5111637, 'joach', "(
~jsin[1] = \\set -> QuantEnv(\\amp, 2)
.phase(1, [0.2,1,0.2], [0.05, 0.95], [2,-2], 0, 16)
.phase(2, [0,1,0], [0.35, 0.65], [2,-2], 0, 1)
.play([1,2]);
)" ], [ 246.3951208, 'joach', "(
~jsin[1] = \\set -> QuantEnv(\\amp, 4)
.phase(1, [0.2,1,0.2], [0.05, 0.95], [2,-2], 0, 16)
.phase(2, [0,1,0], [0.35, 0.65], [2,-2], 0, 1)
.play([1,2]);
)" ], [ 246.344119, 'kof', "(
~test.quant=2;
~test.fadeTime=0.2;
~test={
  //         |       |       |       |       |  
  var pat = [1,0,0,0,1,0,0,0,1,0,0,0,1,1,1,1].rotate(3);
    var imp = PulseDivider.kr(~tick.kr,fib(4)*16,~counter.kr);
  var hit = Select.kr(PulseCount.kr(imp)%pat.size,pat);
  var env = EnvGen.ar(Env([0.001,1,0.001],[1.002,1.15],[3,-3],curve:'exp'),imp * hit);
    var sig = LFSaw.ar(44*[1,2,1.5,3],(1..8)/16);
    sig = LPF.ar(sig,800);
  sig = sig * env;
  Splay.ar(sig,0.75,0.25);
};
~test.play;
);" ], [ 244.5641165, 'alex', "~d[2]=\\set-> Pbind(\\args, [\\freq], \\dur, 4, \\freq, Pseq([220,440,165,85,440],inf));" ], [ 243.2320822, 'joach', "(
~jsin[1] = \\set -> QuantEnv(\\amp, 1)
.phase(1, [0.2,1,0.2], [0.05, 0.95], [2,-2], 0, 16)
.phase(2, [0,1,0], [0.35, 0.65], [2,-2], 0, 1)
.play([1,2]);
)" ], [ 242.3020803, 'alex', "~d[1]=\\set-> Pbind(\\args, [\\trig], \\dur, 4, \\trig, 1);" ], [ 240.9320784, 'kof', "(
~test.quant=2;
~test.fadeTime=0.2;
~test={
  //         |       |       |       |       |  
  var pat = [1,0,0,0,1,0,0,0,1,0,0,0,1,1,1,1].rotate(3);
    var imp = PulseDivider.kr(~tick.kr,fib(4)*16,~counter.kr);
  var hit = Select.kr(PulseCount.kr(imp)%pat.size,pat);
  var env = EnvGen.ar(Env([0.001,1,0.001],[1.002,1.15],[3,-3],curve:'exp'),imp * hit);
    var sig = LFSaw.ar(44*[1,2,1.5,3],(1..8)/16);
    sig = LPF.ar(sig,800);
  sig = sig * env;
  Splay.ar(sig,0.75,0.5);
};
~test.play;
);" ], [ 238.7520753, 'alex', "(
~d[0]={
	var sig, env;
	
	env=EnvGen.kr(Env([0,1,0],[0.5,4],[\\welch, \\welch]),\\trig.tr);
	
	sig=CombN.ar(GrayNoise.ar([1,0.5,0.2,0.4]),1/\\freq.kr,\\freq.kr);
	sig*env;
};)" ], [ 232.3120373, 'joach', "(
~jsin[3] = \\set -> QuantEnv(\\noise, 32)
.phase(1, [0,0.5,0.2], [28.05, 0.95], [2,-2], 0, 1)
.phase(2, [0,1,0], [0.35, 0.65], [2,-2], 0, 1)
.play([1]);
)" ], [ 216.8029788, 'joach', "(
~jsin[2] = \\set -> QuantEnv(\\fplus, 1)
.phase(1, [0,170,0], [0.005, 0.15], [8,-8], 0, 8)
.phase(2, [400,600,0], [0.035, 0.165], [2,-2], 0, 1)
.play([1, 2]);
)" ], [ 210.4889698, 'kof', "(
~test.quant=2;
~test.fadeTime=0.2;
~test={
  //         |       |       |       |       |  
  var pat = [1,0,0,0,1,0,0,0,1,0,0,0,1,1,1,1].rotate(3);
    var imp = PulseDivider.kr(~tick.kr,fib(4)*16,~counter.kr);
  var hit = Select.kr(PulseCount.kr(imp)%pat.size,pat);
  var env = EnvGen.ar(Env([0.001,1,0.001],[1.002,1.15],[3,-3],curve:'exp'),imp * hit);
    var sig = LFSaw.ar(44,(1..8)/16);
    sig = LPF.ar(sig,800);
  sig = sig * env;
  Splay.ar(sig,0.75,0.5);
};
~test.play;
);" ], [ 202.1689285, 'joach', "(
~jsin[2] = \\set -> QuantEnv(\\fplus, 1)
.phase(1, [0,170,0], [0.005, 0.15], [8,-8], 0, 8)
.phase(2, [0,600,0], [0.035, 0.165], [2,-2], 0, 1)
.play([1, 2]);
)" ], [ 199.3298884, 'joach', "(
~jsin[2] = \\set -> QuantEnv(\\fplus, 1)
.phase(1, [0,170,0], [0.005, 0.15], [8,-8], 0, 8)
.phase(2, [0,600,0], [0.035, 0.65], [2,-2], 0, 1)
.play([1, 2]);
)" ], [ 192.7768489, 'joach', "(
~jsin[2] = \\set -> QuantEnv(\\fplus, 1)
.phase(1, [0,170,0], [0.005, 0.15], [8,-8], 0, 8)
.phase(2, [0,600,0], [0.35, 0.65], [2,-2], 0, 1)
.play([1, 2]);
)" ], [ 173.9947884, 'joach', "~jsin.play(vol: 0.9, fadeTime: 8);" ], [ 172.571755, 'joach', "~jsin.play(vol: 0.5, fadeTime: 8);" ], [ 168.4927449, 'alex', "~d.clear;" ], [ 162.639707, 'joach', "(
~jsin[2] = \\set -> QuantEnv(\\fplus, 1)
.phase(1, [0,170,0], [0.005, 0.15], [8,-8], 0, 1)
.phase(2, [0,1,0], [0.35, 0.65], [2,-2], 0, 1)
.play([1]);
)" ], [ 156.2896947, 'kof', "~test.clear;" ], [ 153.2486608, 'joach', "(
~jsin[1] = \\set -> QuantEnv(\\amp, 2)
.phase(1, [0.2,1,0.2], [0.05, 0.95], [2,-2], 0, 16)
.phase(2, [0,1,0], [0.35, 0.65], [2,-2], 0, 1)
.play([1,2]);
)" ], [ 143.3406426, 'alex', "~d.play(vol:0.7, fadeTime:2);" ], [ 142.7806418, 'kof', "(
~ff.quant=1;
~ff.fadeTime=1;
~ff={
  var high,mid,low;
  var sig = ~test;
  
  sig = GVerb.ar(LPF.ar(sig,5000)+HPF.ar(sig,500),40,[3,4],spread:[40,90])/8 + sig;
  low = CompanderD.ar(LPF.ar(sig,400),3/4,1/2,1/2);
  mid = CompanderD.ar(BPF.ar(sig,600,2),3/4,1/2,1/2);
  high = CompanderD.ar(HPF.ar(sig,900),3/4,1/2,1/2);
  sig = CompanderD.ar((high+mid+low).flat,3/4,1/1.1,1/1.1);
  Splay.ar(sig,0.75,0.25);
};
~ff.play;
);" ], [ 141.0196092, 'joach', "(
~jsin[3] = \\set -> QuantEnv(\\noise, 32)
.phase(1, [0,0.5,0], [28.05, 0.95], [2,-2], 0, 1)
.phase(2, [0,1,0], [0.35, 0.65], [2,-2], 0, 1)
.play([1]);
)" ], [ 140.2376052, 'alex', "~d.play(vol:0.4, fadeTime:2);" ], [ 133.5375958, 'alex', "(
~d[0]={
	var sig, env;
	
	env=EnvGen.kr(Env([0,1,0],[0.5,4],[\\welch, \\welch]),\\trig.tr);
	
	sig=CombN.ar(PinkNoise.ar([1,0.5,0.2,0.4]),1/\\freq.kr,\\freq.kr);
	sig*env;
};)" ], [ 132.927595, 'kof', "(
~test.quant=2;
~test.fadeTime=0.2;
~test={
  //         |       |       |       |       |  
  var pat = [1,0,0,0,1,0,0,0,1,0,0,0,1,1,1,1].rotate(3);
    var imp = PulseDivider.kr(~tick.kr,fib(4)+4,~counter.kr);
  var hit = Select.kr(PulseCount.kr(imp)%pat.size,pat);
  var env = EnvGen.ar(Env([0.001,1,0.001],[0.002,0.15],[3,-3],curve:'exp'),imp * hit);
    var sig = Crackle.ar([0.1,0.2,0.3,0.7]+env);
  sig = sig * env;
  Splay.ar(sig,0.75,0.5);
};
~test.play;
);" ], [ 127.9975881, 'kof', "(
~test.quant=2;
~test.fadeTime=0.2;
~test={
  //         |       |       |       |       |  
  var pat = [1,0,0,0,1,0,0,0,1,0,0,0,1,1,1,1].rotate(3);
    var imp = PulseDivider.kr(~tick.kr,fib(4)+4,~counter.kr);
  var hit = Select.kr(PulseCount.kr(imp)%pat.size,pat);
  var env = EnvGen.ar(Env([0.001,1,0.001],[0.002,0.15],[3,-3],curve:'exp'),imp * hit);
    var sig = Crackle.ar([0.1,0.2,0.3,0.4]+env);
  sig = sig * env;
  Splay.ar(sig,0.75,0.5);
};
~test.play;
);" ], [ 118.4675747, 'kof', "(
~test.quant=2;
~test.fadeTime=0.2;
~test={
  //         |       |       |       |       |  
  var pat = [1,0,0,0,1,0,0,0,1,0,0,0,1,1,1,1].rotate(3);
    var imp = PulseDivider.kr(~tick.kr,fib(4)+4,~counter.kr);
  var hit = Select.kr(PulseCount.kr(imp)%pat.size,pat);
  var env = EnvGen.ar(Env([0.001,1,0.001],[0.002,0.15],[3,-3],curve:'exp'),imp * hit);
  var sig = Crackle.ar(1+env);
  sig = sig * env;
  Splay.ar(sig,0.75,0.5);
};
~test.play;
);" ], [ 110.0055628, 'kof', "(
~test.quant=2;
~test.fadeTime=0.2;
~test={
  //         |       |       |       |       |  
  var pat = [1,0,0,0,1,0,0,0,1,0,0,0,1,0,0,0].rotate(3);
    var imp = PulseDivider.kr(~tick.kr,fib(4)+4,~counter.kr);
  var hit = Select.kr(PulseCount.kr(imp)%pat.size,pat);
  var env = EnvGen.ar(Env([0.001,1,0.001],[0.002,0.15],[3,-3],curve:'exp'),imp * hit);
  var sig = Crackle.ar(1+env);
  sig = sig * env;
  Splay.ar(sig,0.75,0.5);
};
~test.play;
);" ], [ 103.8665241, 'joach', "(
~jsin[0] = {
var osc = SinOsc.ar(( \\freq.kr(80) + \\fplus.kr(0) ), mul: 1, add: 0);
var noise = BrownNoise.ar(\\noise.kr(0), (1 - \\noise.kr(0)));
var sig = osc * noise;
Pan2.ar( sig * \\amp.kr(0), \\pan.kr(0) );
};
)" ], [ 98.3964807, 'joach', "(
~jsin[2] = \\set -> QuantEnv(\\fplus, 4)
.phase(1, [0,170,0], [0.005, 0.15], [8,-8], 0, 1)
.phase(2, [0,1,0], [0.35, 0.65], [2,-2], 0, 1)
.play([1]);
)" ], [ 98.0404799, 'alex', "~d[30]=\\filter-> {arg in; Limiter.ar(in,0.1)};" ], [ 94.5774419, 'joach', "(
~jsin[1] = \\set -> QuantEnv(\\amp, 2)
.phase(1, [0,1,0], [0.05, 0.95], [2,-2], 0, 16)
.phase(2, [0,1,0], [0.35, 0.65], [2,-2], 0, 1)
.play([1,2]);
)" ], [ 93.0494076, 'joach', "(
~jsin[1] = \\set -> QuantEnv(\\amp, 3)
.phase(1, [0,1,0], [0.05, 0.95], [2,-2], 0, 16)
.phase(2, [0,1,0], [0.35, 0.65], [2,-2], 0, 1)
.play([1,2]);
)" ], [ 91.2254042, 'alex', "~d[2]=\\set-> Pbind(\\args, [\\freq], \\dur, 4, \\freq, Pseq([220,440,165,85,440],inf));" ], [ 90.7454035, 'alex', "~d[1]=\\set-> Pbind(\\args, [\\trig], \\dur, 4, \\trig, 1);" ], [ 88.0853998, 'kof', "(
~test.quant=2;
~test.fadeTime=0.2;
~test={
  //         |       |       |       |       |  
  var pat = [1,0,0,0,1,0,0,0,1,0,0,0,1,0,0,0].rotate(3);
  var imp = PulseDivider.kr(~tick.kr,8,~counter.kr);
  var hit = Select.kr(PulseCount.kr(imp)%pat.size,pat);
  var env = EnvGen.ar(Env([0.001,1,0.001],[0.002,0.15],[3,-3],curve:'exp'),imp * hit);
  var sig = Crackle.ar(1+env);
  sig = sig * env;
  Splay.ar(sig,0.75,0.5);
};
~test.play;
);" ], [ 87.8753995, 'alex', "(
~d[0]={
	var sig, env;
	
	env=EnvGen.kr(Env([0,1,0],[0.5,4],[\\welch, \\welch]),\\trig.tr);
	
	sig=CombN.ar(PinkNoise.ar([1,0.5,0.2,0.4]),4,1/\\freq.kr,\\freq.kr);
	sig*env;
};)" ], [ 87.2653691, 'joach', "(
~jsin[0] = {
var osc = SinOsc.ar(( \\freq.kr(130) + \\fplus.kr(0) ), mul: 1, add: 0);
var noise = BrownNoise.ar(\\noise.kr(0), (1 - \\noise.kr(0)));
var sig = osc * noise;
Pan2.ar( sig * \\amp.kr(0), \\pan.kr(0) );
};
)" ], [ 86.1333641, 'kof', "(
~test.quant=2;
~test.fadeTime=0.2;
~test={
  //         |       |       |       |       |  
  var pat = [1,0,0,0,1,0,0,0,1,0,0,0,1,0,0,0].rotate(3);
  var imp = PulseDivider.kr(~tick.kr,2,~counter.kr);
  var hit = Select.kr(PulseCount.kr(imp)%pat.size,pat);
  var env = EnvGen.ar(Env([0.001,1,0.001],[0.002,0.15],[3,-3],curve:'exp'),imp * hit);
  var sig = Crackle.ar(1+env);
  sig = sig * env;
  Splay.ar(sig,0.75,0.5);
};
~test.play;
);" ], [ 82.4033588, 'alex', "~d.play(vol:0.1, fadeTime:2);" ], [ 78.0033527, 'alex', "~d[30]=\\filter-> {arg in; Limiter.ar(in,0.4)};" ], [ 76.4233505, 'kof', "(
~ff.quant=1;
~ff.fadeTime=1;
~ff={
  var high,mid,low;
  var sig = ~test;
  
  sig = GVerb.ar(LPF.ar(sig,5000)+HPF.ar(sig,500),40,[3,4,5,6],spread:[40,90])/8 + sig;
  low = CompanderD.ar(LPF.ar(sig,400),3/4,1/2,1/2);
  mid = CompanderD.ar(BPF.ar(sig,600,2),3/4,1/2,1/2);
  high = CompanderD.ar(HPF.ar(sig,900),3/4,1/2,1/2);
  sig = CompanderD.ar((high+mid+low).flat,3/4,1/1.1,1/1.1);
  Splay.ar(sig,0.75,0.25);
};
~ff.play;
);" ], [ 74.0433471, 'kof', "(
~test.quant=2;
~test.fadeTime=0.2;
~test={
  //         |       |       |       |       |  
  var pat = [1,0,0,0,1,0,0,0,1,0,0,0,1,0,0,0].rotate(3);
  var imp = PulseDivider.kr(~tick.kr,4,~counter.kr);
  var hit = Select.kr(PulseCount.kr(imp)%pat.size,pat);
  var env = EnvGen.ar(Env([0.001,1,0.001],[0.002,0.15],[3,-3],curve:'exp'),imp * hit);
  var sig = Crackle.ar(1+env);
  sig = sig * env;
  Splay.ar(sig,0.75,0.5);
};
~test.play;
);" ], [ 71.3133433, 'kof', "(
~test.quant=2;
~test.fadeTime=0.2;
~test={
  //         |       |       |       |       |  
  var pat = [1,0,0,0,1,0,0,0,1,0,0,0,1,0,0,0].rotate(3);
  var imp = PulseDivider.kr(~tick.kr,4,~counter.kr);
  var hit = Select.kr(PulseCount.kr(imp)%pat.size,pat);
  var env = EnvGen.ar(Env([0.001,1,0.001],[0.002,0.15],[3,-3],curve:'exp'),imp * hit);
  var sig = Crackle.ar(LFNoise2.kr(1/4)+env);
  sig = sig * env;
  Splay.ar(sig,0.75,0.5);
};
~test.play;
);" ], [ 66.7333068, 'joach', "(
~jsin[0] = {
var osc = SinOsc.ar(( \\freq.kr(300) + \\fplus.kr(0) ), mul: 1, add: 0);
var noise = BrownNoise.ar(\\noise.kr(0), (1 - \\noise.kr(0)));
var sig = osc * noise;
Pan2.ar( sig * \\amp.kr(0), \\pan.kr(0) );
};
)" ], [ 66.2793031, 'kof', "(
~test.quant=2;
~test.fadeTime=0.2;
~test={
  //         |       |       |       |       |  
  var pat = [1,0,0,0,1,0,0,0,1,0,0,0,1,0,0,0].rotate(3);
  var imp = PulseDivider.kr(~tick.kr,1,~counter.kr);
  var hit = Select.kr(PulseCount.kr(imp)%pat.size,pat);
  var env = EnvGen.ar(Env([0.001,1,0.001],[0.002,0.15],[3,-3],curve:'exp'),imp * hit);
  var sig = Crackle.ar(LFNoise2.kr(1/4)+env);
  sig = sig * env;
  Splay.ar(sig,0.75,0.5);
};
~test.play;
);" ], [ 63.6492994, 'kof', "(
~test.quant=2;
~test.fadeTime=0.2;
~test={
  //         |       |       |       |       |  
  var pat = [1,0,0,0,1,0,0,0,1,0,0,0,1,0,0,0].rotate(3);
  var imp = PulseDivider.kr(~tick.kr,2,~counter.kr);
  var hit = Select.kr(PulseCount.kr(imp)%pat.size,pat);
  var env = EnvGen.ar(Env([0.001,1,0.001],[0.002,0.15],[3,-3],curve:'exp'),imp * hit);
  var sig = Crackle.ar(LFNoise2.kr(1/4)+env);
  sig = sig * env;
  Splay.ar(sig,0.75,0.5);
};
~test.play;
);" ], [ 57.9892915, 'alex', "~d.clear;" ], [ 56.1482587, 'joach', "(
~jsin[2] = \\set -> QuantEnv(\\fplus, 1)
.phase(1, [0,170,0], [0.005, 0.15], [8,-8], 0, 1)
.phase(2, [0,1,0], [0.35, 0.65], [2,-2], 0, 1)
.play([1]);
)" ], [ 56.1432585, 'kof', "(
~test.quant=2;
~test.fadeTime=0.2;
~test={
  //         |       |       |       |       |  
  var pat = [1,0,0,0,1,0,0,0,1,0,0,0,1,0,0,0].rotate(3);
  var imp = PulseDivider.kr(~tick.kr,4,~counter.kr);
  var hit = Select.kr(PulseCount.kr(imp)%pat.size,pat);
  var env = EnvGen.ar(Env([0.001,1,0.001],[0.002,0.15],[3,-3],curve:'exp'),imp * hit);
  var sig = Crackle.ar(LFNoise2.kr(1/4)+env);
  sig = sig * env;
  Splay.ar(sig,0.75,0.5);
};
~test.play;
);" ], [ 53.7112516, 'alex', "~d.play(vol:0.1, fadeTime:2);" ], [ 48.6712445, 'alex', "~d[2]=\\set-> Pbind(\\args, [\\freq], \\dur, 4, \\freq, Pseq([220,440,165,85,440],inf));" ], [ 47.6812432, 'alex', "~d[1]=\\set-> Pbind(\\args, [\\trig], \\dur, 4, \\trig, 1);" ], [ 44.0912381, 'alex', "(
~d[0]={
	var sig, env;
	
	env=EnvGen.kr(Env([0,1,0],[0.5,4],[\\welch, \\welch]),\\trig.tr);
	
	sig=CombN.ar(PinkNoise.ar([1,0.5,0.2,0.4]),4,1/\\freq.kr,\\freq.kr);
	sig*env;
};)" ], [ 40.4712331, 'alex', "~d.play(vol:0.7, fadeTime:2);" ], [ 36.4312274, 'alex', "~d.play(vol:0.2, fadeTime:2);" ], [ 26.4141873, 'kof', "(
~test.quant=2;
~test.fadeTime=0.2;
~test={
  //         |       |       |       |       |  
  var pat = [1,0,0,0,1,0,0,0,1,0,0,0,1,0,0,0].rotate(3);
  var imp = PulseDivider.kr(~tick.kr,4,~counter.kr);
  var hit = Select.kr(PulseCount.kr(imp)%pat.size,pat);
  var env = EnvGen.ar(Env([0.001,1,0.001],[0.002,0.5],[3,-3],curve:'exp'),imp * hit);
  var sig = Crackle.ar(LFNoise2.kr(1/4)+env);
  sig = sig * env;
  Splay.ar(sig,0.75,0.5);
};
~test.play;
);" ], [ 26.0881692, 'joach', "(
~jsin[2] = \\set -> QuantEnv(\\fplus, 1)
.phase(1, [0,170,0], [0.005, 0.15], [2,-2], 0, 1)
.phase(2, [0,1,0], [0.35, 0.65], [2,-2], 0, 1)
.play([1]);
)" ], [ 24.8891369, 'joach', "(
~jsin[1] = \\set -> QuantEnv(\\amp, 1)
.phase(1, [0,1,0], [0.05, 0.95], [2,-2], 0, 16)
.phase(2, [0,1,0], [0.35, 0.65], [2,-2], 0, 1)
.play([1,2]);
)" ], [ 23.3720998, 'joach', "(
~jsin[0] = {
var osc = SinOsc.ar(( \\freq.kr(60) + \\fplus.kr(0) ), mul: 1, add: 0);
var noise = BrownNoise.ar(\\noise.kr(0), (1 - \\noise.kr(0)));
var sig = osc * noise;
Pan2.ar( sig * \\amp.kr(0), \\pan.kr(0) );
};
)" ], [ 22.5970661, 'joach', "~jsin.play(vol: 0.5, fadeTime: 8);" ], [ 21.0970623, 'alex', "~d.play(vol:0.2, fadeTime:2);" ], [ 16.7870563, 'kof', "(
  p.clock.tempo_(240/60);
  
  ~offset = (0..7)/8;
  
  ~tick.quant = 1;
  ~tick = {Mix(Impulse.kr( ~tempo / 2 , ~offset ))};
  
  ~counter = {PulseCount.kr(~tick.kr)};
);" ], [ 12.5670504, 'kof', "(
  p=ProxySpace.push(s.boot);
  p.makeTempoClock;
);" ], [ 12.4670502, 'alex', "~d.play(vol:0.02, fadeTime:2);" ], [ 9.417046, 'alex', "~d[2]=\\set-> Pbind(\\args, [\\freq], \\dur, 4, \\freq, Pseq([220,440,165,85,440],inf));" ], [ 8.5170447, 'alex', "~d[1]=\\set-> Pbind(\\args, [\\trig], \\dur, 4, \\trig, 1);" ], [ 3.7170380000002, 'alex', "(
~d[0]={
	var sig, env;
	
	env=EnvGen.kr(Env([0,1,0],[0.5,4],[\\welch, \\welch]),\\trig.tr);
	
	sig=CombN.ar(PinkNoise.ar([1,0.5,0.2,0.4]),4,1/\\freq.kr,\\freq.kr);
	sig*env;
};)" ], [ 0, 'joach', "p = ProxySpace.push(s).makeTempoClock;" ] ]