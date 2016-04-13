List[ [ 71939.993374359, 'kof', "Kolektiv.historySave" ], [ 2375.897275391, 'joach', "Pdef(\\seqDrum).stop;" ], [ 2366.163557745, 'joach', "(
Pdef(\\seqDrum, {
	Ppar([
		Pbind(\\instrument, \\DrumA, \\amp, 0.5, \\legato, 0.9, \\octave, 2, \\degree, Pseq([Pn(4,16),Pn(3,16)],inf),
			\\dur, 0.5
		),
		Pbind(\\instrument, \\DrumB, \\amp, 0.3, \\legato, 0.3, \\octave, 2, \\degree, Pseq([Pn(5,16),Pn(3,16)],inf),
			\\dur, Pseq([Rest(0.25),Pn(0.125,4)],inf),
		),
		Pbind(\\instrument, \\DrumE, \\amp, 0.5, \\octave, 5, \\degree, Pseq([Pn(5,16),Pn(3,16)],inf),
			\\dur, Pseq([Rest(0.75),0.125,0.125],inf),
			\\legato, Pseg(Pseq([0.1,1.9,1,0.1],inf),Pseq([16,10,4],inf),\\sin,inf)
		)
	],inf);
}).play(quant:1);
Pdef(\\seqDrum).fadeTime = 4.0;
)" ], [ 2361.178972246, 'joach', "Pdef(\\seqSawA).stop;" ], [ 2346.560853778, 'joach', "(
Pdef(\\seqSawA, {
	Ppar([
		Pbind(\\instrument, \\SawA, \\amp, 0.7, \\legato, 1.5, \\octave, 2, \\degree, Pseq([Pn(11,16),Pn(7,16)],inf),
			\\dur, Pseq([2],inf)
		),
		Pbind(\\instrument, \\SawA, \\amp, 0.4, \\legato, 0.9, \\octave, 3, \\degree, Pseq([4,4,4,3],inf),
			\\dur, Pseq([0.25],inf)
		),
		Pbind(\\instrument, \\SawA, \\amp, 0.5, \\legato, 0.3, \\octave, 3, \\degree, Pseq([Pn(4,32),Pn(3,8)],inf),
			\\dur, Pseq([Rest(1),1,1],inf)
		)
	],inf);
}).play(quant:1);
Pdef(\\seqSawA).fadeTime = 4.0;
)" ], [ 2335.588982318, 'kof', "(
    ~two.ar(2);
    ~two.quant=2;
    ~two.fadeTime=2.02;
    ~two={
        var mod = 0.75;//[-1,0.25,-0.25,1/8,1/16];
        var spread = 0.0;
        var pos = [0,0.5]+LFSaw.kr(1/400);
        //         |       |       |       |       |  
        var pat = [1,0,0,0,1,0,0,0,1,0,0,0,1,0,0,0].rotate(3);
        var imp = PulseDivider.kr(~tick.kr,[1,2,3,4]*8,~counter.kr);
        var hit = Select.kr(PulseCount.kr(imp)%pat.size,pat);
  var env = EnvGen.ar(Env([0.001,1,0.001],[1.502,1.5],[3,-3],curve:'exp'),imp * hit);
        var sig = PlayBuf.ar(b.numChannels,b.bufnum,BufRateScale.kr(b.bufnum)*mod+(env*0.01),imp, (pos + BrownNoise.ar(1!8).range(spread * -1,spread)) * BufFrames.kr(b.bufnum),1);
        
  sig = sig * env;
  sig =  CompanderD.ar(sig,3/4,1/2,1/2);
  sig = GVerb.ar(sig,3/4,1/2,1/2);
        Splay.ar(sig.flat,0.5,0.75);
    };
    ~two.play;
);" ], [ 2329.705549803, 'joach', "(
Pdef(\\seqDrum, {
	Ppar([
		Pbind(\\instrument, \\DrumA, \\amp, 0.5, \\legato, 0.9, \\octave, 2, \\degree, Pseq([Pn(4,16),Pn(3,16)],inf),
			\\dur, 0.5
		),
		Pbind(\\instrument, \\DrumB, \\amp, 0.3, \\legato, 0.3, \\octave, 2, \\degree, Pseq([Pn(5,16),Pn(3,16)],inf),
			\\dur, Pseq([Rest(0.25),Pn(0.125,4)],inf),
		),
		Pbind(\\instrument, \\DrumE, \\amp, 0.5, \\octave, 5, \\degree, Pseq([Pn(5,16),Pn(3,16)],inf),
			\\dur, Pseq([Rest(0.75),0.125,0.125],inf),
			\\legato, Pseg(Pseq([0.1,1.9,1,0.1],inf),Pseq([16,10,4],inf),\\sin,inf)
		)
	],inf);
}).play(quant:1);
Pdef(\\seqDrum).fadeTime = 4.0;
)" ], [ 2299.442163437, 'joach', "Pdef(\\seqSawA).stop;" ], [ 2287.116714561, 'kof', "(
    ~two.ar(2);
    ~two.quant=2;
    ~two.fadeTime=2.02;
    ~two={
        var mod = 0.75;//[-1,0.25,-0.25,1/8,1/16];
        var spread = 0.0;
        var pos = [0,0.5]+LFSaw.kr(1/400);
        //         |       |       |       |       |  
        var pat = [1,0,0,0,1,0,0,0,1,0,0,0,1,0,0,0].rotate(3);
        var imp = PulseDivider.kr(~tick.kr,[1,2,3,4]*8,~counter.kr);
        var hit = Select.kr(PulseCount.kr(imp)%pat.size,pat);
  var env = EnvGen.ar(Env([0.001,1,0.001],[1.502,1.5],[3,-3],curve:'exp'),imp * hit);
        var sig = PlayBuf.ar(b.numChannels,b.bufnum,BufRateScale.kr(b.bufnum)*mod+(env*0.01),imp, (pos + BrownNoise.ar(1!8).range(spread * -1,spread)) * BufFrames.kr(b.bufnum),1);
        
  sig = sig * env;
  sig =  CompanderD.ar(sig,3/4,1/2,1/2);
        Splay.ar(sig.flat,0.5,0.75);
    };
    ~two.play;
);" ], [ 2283.937521365, 'joach', "(
Pdef(\\seqSawA, {
	Ppar([
		Pbind(\\instrument, \\SawA, \\amp, 0.7, \\legato, 1.5, \\octave, 2, \\degree, Pseq([Pn(11,16),Pn(7,16)],inf),
			\\dur, Pseq([2],inf)
		),
		Pbind(\\instrument, \\SawA, \\amp, 0.4, \\legato, 0.9, \\octave, 3, \\degree, Pseq([4,4,4,3],inf),
			\\dur, Pseq([0.25],inf)
		),
		Pbind(\\instrument, \\SawA, \\amp, 0.5, \\legato, 0.3, \\octave, 3, \\degree, Pseq([Pn(4,32),Pn(3,8)],inf),
			\\dur, Pseq([Rest(1),1,1],inf)
		)
	],inf);
}).play(quant:1);
Pdef(\\seqSawA).fadeTime = 4.0;
)" ], [ 2281.231663707, 'joach', "(
SynthDef(\\DrumA, { |out = 0, gate = 1, amp = 1, freq = 90, sustain = 0.5|
	var tone, osc, aEnv, fEnv;
	aEnv = EnvGen.kr(Env.adsr(0.15*sustain, 0.15*sustain, 0.8, 0.65*sustain),gate);
	fEnv = EnvGen.kr(Env([Rand(freq*5,freq*7),freq,1],[0.15*sustain, 0.85*sustain],\\exp));
	osc = SinOsc.ar([fEnv,fEnv],0,amp*0.95);
	tone = osc * aEnv;
	tone = LPF.ar(tone,fEnv + 700);
	tone = FreeVerb.ar(tone,0.8,0.5,0.5, 1, tone);
	DetectSilence.ar(tone,doneAction:2);
	Out.ar(out, tone);
}).store;

SynthDef(\\DrumB, { |out = 0, gate = 1, amp = 1, freq = 90, sustain = 0.5|
	var tone, osc, aEnv, fEnv;
	aEnv = EnvGen.kr(Env.adsr(0.15*sustain, 0.05*sustain, 0.05, 0.8*sustain),gate);
	fEnv = EnvGen.kr(Env([Rand(freq*5,freq*7),freq,1],[0.15*sustain, 0.85*sustain],\\exp));
	osc = SinOsc.ar([fEnv,fEnv],0,amp*0.95);
	tone = osc * aEnv;
	tone = LPF.ar(tone,fEnv + 700);
	tone = FreeVerb.ar(tone,0.8,0.5,0.5, 1, tone);
	DetectSilence.ar(tone,doneAction:2);
	Out.ar(out, tone);
}).store;

SynthDef(\\DrumE, { |out = 0, gate = 1, amp = 1, freq = 90, sustain = 0.5|
	var tone, osc, aEnv, fEnv;
	aEnv = EnvGen.kr(Env.adsr(0.05*sustain, 0.3*sustain, 0.4, 0.65*sustain),gate, doneAction:2);
	fEnv = EnvGen.kr(Env([Rand(freq*10,freq*11),freq,1],[0.09*sustain, 0.6*sustain],\\exp));
	osc = SinOsc.ar([freq-1, freq+1],0,amp)*SinOsc.ar([fEnv+1,fEnv-1],0.5,amp);
	tone = osc * aEnv;
	tone = LPF.ar(tone,fEnv + 400);
	Out.ar(out, tone);
}).store;

SynthDef(\\SawA, { |out = 0, gate = 1, amp = 1, freq = 90, sustain = 0.5|
	var tone, osc, aEnv, fEnv;
	aEnv = EnvGen.kr(Env.asr(0.95*sustain, 1, 0.05*sustain),gate, doneAction:2);
	fEnv = EnvGen.kr(Env([freq,freq,Rand(freq*7,freq*9),1],[0.7*sustain, 0.15*sustain,0.15*sustain],\\welch));
	osc = LFSaw.ar([fEnv+1,fEnv-1],0,amp)*LFPulse.ar([fEnv+1,fEnv-1],0,0.9,amp);
	tone = osc * aEnv;
	tone = AllpassC.ar(tone,0.5,0.0625,sustain/2, 1);
	tone = LPF.ar(tone,fEnv + 300);
	Out.ar(out, tone);
}).store;
)" ], [ 2279.231317594, 'kof', "(
    ~two.ar(2);
    ~two.quant=2;
    ~two.fadeTime=2.02;
    ~two={
        var mod = 0.75;//[-1,0.25,-0.25,1/8,1/16];
        var spread = 0.0;
        var pos = [0,0.5]+LFSaw.kr(1/400);
        //         |       |       |       |       |  
        var pat = [1,0,0,0,1,0,0,0,1,0,0,0,1,0,0,0].rotate(3);
        var imp = PulseDivider.kr(~tick.kr,[1,2,3,4]*8,~counter.kr);
        var hit = Select.kr(PulseCount.kr(imp)%pat.size,pat);
  var env = EnvGen.ar(Env([0.001,1,0.001],[1.502,1.5],[3,-3],curve:'exp'),imp * hit);
        var sig = PlayBuf.ar(b.numChannels,b.bufnum,BufRateScale.kr(b.bufnum)*mod+(env*0.01),imp, (pos + BrownNoise.ar(1!8).range(spread * -1,spread)) * BufFrames.kr(b.bufnum),1);
        
  sig = sig * env;
  sig =  CompanderD.ar(sig,3/4,1/2,1/2);
        Splay.ar(sig.flat,0.5,0.55);
    };
    ~two.play;
);" ], [ 2272.225193924, 'kof', "(
    ~two.ar(2);
    ~two.quant=2;
    ~two.fadeTime=2.02;
    ~two={
        var mod = 0.75;//[-1,0.25,-0.25,1/8,1/16];
        var spread = 0.0;
        var pos = [0,0.5]+LFSaw.kr(1/400);
        //         |       |       |       |       |  
        var pat = [1,0,0,0,1,0,0,0,1,0,0,0,1,0,0,0].rotate(3);
        var imp = PulseDivider.kr(~tick.kr,[1,2,3,4]*8,~counter.kr);
        var hit = Select.kr(PulseCount.kr(imp)%pat.size,pat);
  var env = EnvGen.ar(Env([0.001,1,0.001],[1.502,1.5],[3,-3],curve:'exp'),imp * hit);
        var sig = PlayBuf.ar(b.numChannels,b.bufnum,BufRateScale.kr(b.bufnum)*mod+(env*0.01),imp, (pos + BrownNoise.ar(1!8).range(spread * -1,spread)) * BufFrames.kr(b.bufnum),1);
        
  sig = sig * env;
  sig =  CompanderD.ar(sig,3/4,1/2,1/2);
        Splay.ar(sig.flat,0.5,0.15);
    };
    ~two.play;
);" ], [ 2266.13785342, 'joach', "(
Pdef(\\seqSawA, {
	Ppar([
		Pbind(\\instrument, \\SawA, \\amp, 0.7, \\legato, 1.5, \\octave, 2, \\degree, Pseq([Pn(11,16),Pn(7,16)],inf),
			\\dur, Pseq([2],inf)
		),
		Pbind(\\instrument, \\SawA, \\amp, 0.4, \\legato, 0.9, \\octave, 3, \\degree, Pseq([4,4,4,3],inf),
			\\dur, Pseq([0.25],inf)
		),
		Pbind(\\instrument, \\SawA, \\amp, 0.5, \\legato, 0.3, \\octave, 3, \\degree, Pseq([Pn(4,32),Pn(3,8)],inf),
			\\dur, Pseq([Rest(1),1,1],inf)
		)
	],inf);
}).play(quant:1);
Pdef(\\seqSawA).fadeTime = 4.0;
)" ], [ 2253.178417526, 'joach', "(
Pdef(\\seqSawA, {
	Ppar([
		Pbind(\\instrument, \\SawA, \\amp, 0.7, \\legato, 4.5, \\octave, 2, \\degree, Pseq([Pn(11,16),Pn(7,16)],inf),
			\\dur, Pseq([2],inf)
		),
		Pbind(\\instrument, \\SawA, \\amp, 0.4, \\legato, 0.9, \\octave, 3, \\degree, Pseq([4,4,4,3],inf),
			\\dur, Pseq([0.25],inf)
		),
		Pbind(\\instrument, \\SawA, \\amp, 0.5, \\legato, 0.3, \\octave, 3, \\degree, Pseq([Pn(4,32),Pn(3,8)],inf),
			\\dur, Pseq([Rest(1),1,1],inf)
		)
	],inf);
}).play(quant:1);
Pdef(\\seqSawA).fadeTime = 4.0;
)" ], [ 2238.006097458, 'kof', "b = Buffer.read(s,Platform.resourceDir ++ \"/sounds/douce.wav\");" ], [ 2234.692124368, 'joach', "(
Pdef(\\seqSawA, {
	Ppar([
		Pbind(\\instrument, \\SawA, \\amp, 0.7, \\legato, 4.5, \\octave, 1, \\degree, Pseq([Pn(11,16),Pn(7,16)],inf),
			\\dur, Pseq([2],inf)
		),
		Pbind(\\instrument, \\SawA, \\amp, 0.4, \\legato, 0.9, \\octave, 3, \\degree, Pseq([4,4,4,3],inf),
			\\dur, Pseq([0.25],inf)
		),
		Pbind(\\instrument, \\SawA, \\amp, 0.5, \\legato, 0.3, \\octave, 3, \\degree, Pseq([Pn(4,32),Pn(3,8)],inf),
			\\dur, Pseq([Rest(1),1,1],inf)
		)
	],inf);
}).play(quant:1);
Pdef(\\seqSawA).fadeTime = 4.0;
)" ], [ 2217.965562089, 'kof', "b = Buffer.read(s,Platform.resourceDir ++ \"/sounds/.wav\");" ], [ 2214.981795178, 'kof', "~threew.stop(4);" ], [ 2209.574343761, 'joach', "(
Pdef(\\seqSawA, {
	Ppar([
		Pbind(\\instrument, \\SawA, \\amp, 0.7, \\legato, 1.5, \\octave, 1, \\degree, Pseq([Pn(11,16),Pn(7,16)],inf),
			\\dur, Pseq([2],inf)
		),
		Pbind(\\instrument, \\SawA, \\amp, 0.4, \\legato, 0.9, \\octave, 3, \\degree, Pseq([4,4,4,3],inf),
			\\dur, Pseq([0.25],inf)
		),
		Pbind(\\instrument, \\SawA, \\amp, 0.5, \\legato, 0.3, \\octave, 3, \\degree, Pseq([Pn(4,32),Pn(3,8)],inf),
			\\dur, Pseq([Rest(1),1,1],inf)
		)
	],inf);
}).play(quant:1);
Pdef(\\seqSawA).fadeTime = 4.0;
)" ], [ 2208.20345377, 'kof', "~threew.stop(4);" ], [ 2200.010911125, 'joach', "(
SynthDef(\\DrumA, { |out = 0, gate = 1, amp = 1, freq = 90, sustain = 0.5|
	var tone, osc, aEnv, fEnv;
	aEnv = EnvGen.kr(Env.adsr(0.15*sustain, 0.15*sustain, 0.8, 0.65*sustain),gate);
	fEnv = EnvGen.kr(Env([Rand(freq*5,freq*7),freq,1],[0.15*sustain, 0.85*sustain],\\exp));
	osc = SinOsc.ar([fEnv,fEnv],0,amp*0.95);
	tone = osc * aEnv;
	tone = LPF.ar(tone,fEnv + 700);
	tone = FreeVerb.ar(tone,0.8,0.5,0.5, 1, tone);
	DetectSilence.ar(tone,doneAction:2);
	Out.ar(out, tone);
}).store;

SynthDef(\\DrumB, { |out = 0, gate = 1, amp = 1, freq = 90, sustain = 0.5|
	var tone, osc, aEnv, fEnv;
	aEnv = EnvGen.kr(Env.adsr(0.15*sustain, 0.05*sustain, 0.05, 0.8*sustain),gate);
	fEnv = EnvGen.kr(Env([Rand(freq*5,freq*7),freq,1],[0.15*sustain, 0.85*sustain],\\exp));
	osc = SinOsc.ar([fEnv,fEnv],0,amp*0.95);
	tone = osc * aEnv;
	tone = LPF.ar(tone,fEnv + 700);
	tone = FreeVerb.ar(tone,0.8,0.5,0.5, 1, tone);
	DetectSilence.ar(tone,doneAction:2);
	Out.ar(out, tone);
}).store;

SynthDef(\\DrumE, { |out = 0, gate = 1, amp = 1, freq = 90, sustain = 0.5|
	var tone, osc, aEnv, fEnv;
	aEnv = EnvGen.kr(Env.adsr(0.05*sustain, 0.3*sustain, 0.4, 0.65*sustain),gate, doneAction:2);
	fEnv = EnvGen.kr(Env([Rand(freq*10,freq*11),freq,1],[0.09*sustain, 0.6*sustain],\\exp));
	osc = SinOsc.ar([freq-1, freq+1],0,amp)*SinOsc.ar([fEnv+1,fEnv-1],0.5,amp);
	tone = osc * aEnv;
	tone = LPF.ar(tone,fEnv + 400);
	Out.ar(out, tone);
}).store;

SynthDef(\\SawA, { |out = 0, gate = 1, amp = 1, freq = 90, sustain = 0.5|
	var tone, osc, aEnv, fEnv;
	aEnv = EnvGen.kr(Env.asr(0.95*sustain, 1, 0.05*sustain),gate, doneAction:2);
	fEnv = EnvGen.kr(Env([freq,freq,Rand(freq*7,freq*9),1],[0.7*sustain, 0.15*sustain,0.15*sustain],\\welch));
	osc = LFSaw.ar([fEnv+1,fEnv-1],0,amp)*LFPulse.ar([fEnv+1,fEnv-1],0,0.9,amp);
	tone = osc * aEnv;
	tone = AllpassC.ar(tone,0.5,0.0625,sustain/2, 1);
	tone = LPF.ar(tone,fEnv + 300);
	Out.ar(out, tone);
}).store;
)" ], [ 2176.358980331, 'alex', "~n5.free(fadeTime:2);" ], [ 2168.043396456, 'alex', "~n5.play(vol:0.0, fadeTime:2, numChannels:2).quant_(2);" ], [ 2155.465892305, 'alex', "~n5.play(vol:0.0, fadeTime:20, numChannels:2).quant_(2);" ], [ 2150.001915275, 'alex', "~n5.play(vol:0.1, fadeTime:2, numChannels:2).quant_(2);" ], [ 2141.029990119, 'alex', "~n5.play(vol:0.2, fadeTime:2, numChannels:2).quant_(2);" ], [ 2130.405919184, 'alex', "~n5[2]=\\set->Pbind(\\args, [\\freq], \\dur,1, \\freq, Pseq([12000],inf));" ], [ 2127.016212206, 'alex', "~n5[2]=\\set->Pbind(\\args, [\\freq], \\dur,1, \\freq, Pseq([1200],inf));" ], [ 2123.516127825, 'alex', "~n5[2]=\\set->Pbind(\\args, [\\freq], \\dur,1, \\freq, Pseq([120],inf));" ], [ 2114.861545186, 'alex', "~n5[2]=\\set->Pbind(\\args, [\\freq], \\dur,1, \\freq, Pseq([11500],inf));" ], [ 2112.977098402, 'joach', "~testJa.stop(26);" ], [ 2108.825683581, 'alex', "~n5[2]=\\set->Pbind(\\args, [\\freq], \\dur,1, \\freq, Pseq([9500],inf));" ], [ 2103.9451302, 'joach', "~testJa2.stop(16);" ], [ 2101.670414844, 'joach', "~testJa.set(\\lpf_freq, 800);" ], [ 2094.426402736, 'joach', "~testJa[1] = \\set -> Pbind(\\args, [\\amp], \\amp, Pseq([0.9, 0.05], inf), \\dur, Pseq([2,4,2,8, Rest(8)], inf));" ], [ 2094.235535363, 'alex', "~n5.play(vol:0.7, fadeTime:2, numChannels:2).quant_(2);" ], [ 2090.953396292, 'alex', "~n5.play(vol:0.5, fadeTime:2, numChannels:2).quant_(2);" ], [ 2086.821902751, 'joach', "~testJa[1] = \\set -> Pbind(\\args, [\\amp], \\amp, Pseq([0.9, 0.05], inf), \\dur, Pseq([2,4,2,8], inf));" ], [ 2086.576359645, 'alex', "~n5.play(vol:0.4, fadeTime:2, numChannels:2).quant_(2);" ], [ 2075.535091184, 'alex', "~n5[30]=\\filter->{arg in; GVerb.ar(in,roomsize:20,revtime:0.7)};" ], [ 2074.847248612, 'joach', "~testJa[4] = \\filter -> {|in| LPF.ar(in, \\lpf_freq.kr(800,18)) };" ], [ 2073.58810936, 'joach', "~testJa.set(\\lpf_freq, 2800);" ], [ 2071.488958525, 'alex', "~n5[30]=\\filter->{arg in; GVerb.ar(in,roomsize:40,revtime:0.7)};" ], [ 2056.387864569, 'alex', "~n5[2]=\\set->Pbind(\\args, [\\freq], \\dur,1, \\freq, Pseq([11500],inf));" ], [ 2053.309787748, 'joach', "~testJa[2] = \\set -> Pbind(\\args, [\\freq], \\octave, 4, \\degree, Pseq([3,4,3,7], inf), \\dur, 16);" ], [ 2049.662827561, 'joach', "~testJa[1] = \\set -> Pbind(\\args, [\\amp], \\amp, Pseq([0.9, 0.05], inf), \\dur, Pseq([2,4,2,8, Rest(8)], inf));" ], [ 2043.204584524, 'joach', "~testJa.play(vol: 0.5, fadeTime: 18);" ], [ 2040.108822251, 'alex', "~n5[30]=\\filter->{arg in; GVerb.ar(in,roomsize:20,revtime:0.7)};" ], [ 2031.973581051, 'kof', "~zet.clear;" ], [ 2030.001188189, 'alex', "~n5[30]=\\filter->{arg in; GVerb.ar(in,roomsize:20,revtime:0.4)};" ], [ 2025.512499762, 'alex', "~n5[2]=\\set->Pbind(\\args, [\\freq], \\dur,1, \\freq, Pseq([12500],inf));" ], [ 2020.741436966, 'joach', "~testJa.stop(26);" ], [ 2020.137615994, 'alex', "~n5[2]=\\set->Pbind(\\args, [\\freq], \\dur,1, \\freq, Pseq([9500],inf));" ], [ 2017.818545326, 'joach', "~testJa2.stop(16);" ], [ 2012.398915486, 'joach', "~testJa2.play(vol: 0.5, fadeTime: 8);" ], [ 2011.595068376, 'alex', "~n5[29]=\\filter->{arg in; CombN.ar(in,2,0.25)};" ], [ 2004.411315898, 'joach', "~testJa.stop(26);" ], [ 1999.171050143, 'joach', "~testJa[4] = \\filter -> {|in| LPF.ar(in, \\lpf_freq.kr(800,8)) };" ], [ 1991.308184566, 'joach', "~testJa[1] = \\set -> Pbind(\\args, [\\amp], \\amp, Pseq([0.9, 0.0], inf), \\dur, Pseq([2,4,2,8, Rest(8)], inf));" ], [ 1982.355974712, 'alex', "~n5[2]=\\set->Pbind(\\args, [\\freq], \\dur,1, \\freq, Pseq([11500],inf));" ], [ 1982.348892619, 'joach', "~testJa[1] = \\set -> Pbind(\\args, [\\amp], \\amp, Pseq([0.9, 0.1], inf), \\dur, Pseq([2,4,2,8, Rest(8)], inf));" ], [ 1979.293983053, 'joach', "~testJa[1] = \\set -> Pbind(\\args, [\\amp], \\amp, Pseq([0.9, 0.1], inf), \\dur, Pseq([2,4,2,6, Rest(8)], inf));" ], [ 1973.828665626, 'joach', "~testJa[1] = \\set -> Pbind(\\args, [\\amp], \\amp, Pseq([0.9, 0.1], inf), \\dur, Pseq([2,4,1,1, Rest(8)], inf));" ], [ 1973.174922399, 'alex', "~n5[30]=\\filter->{arg in; GVerb.ar(in,roomsize:20,revtime:0.2)};" ], [ 1971.978912783, 'joach', "~testJa[1] = \\set -> Pbind(\\args, [\\amp], \\amp, Pseq([0.9, 0.1], inf), \\dur, Pseq([1,4,1,1, Rest(8)], inf));" ], [ 1968.353236537, 'alex', "~n5[2]=\\set->Pbind(\\args, [\\freq], \\dur,1, \\freq, Pseq([14500],inf));" ], [ 1965.728735559, 'alex', "~n5[2]=\\set->Pbind(\\args, [\\freq], \\dur,1, \\freq, Pseq([12500],inf));" ], [ 1962.803053969, 'joach', "~testJa[1] = \\set -> Pbind(\\args, [\\amp], \\amp, Pseq([0.9, 0.1], inf), \\dur, Pseq([1,2,1,1, Rest(8)], inf));" ], [ 1959.716236674, 'alex', "~n5[1]=\\set->Pbind(\\args, [\\trig], \\dur, Pseq([0.5,1,0.5,Prand([Rest(0.5),Rest(0.5),1],1)],inf), \\trig, 1);" ], [ 1946.322594868, 'joach', "~testJa[1] = \\set -> Pbind(\\args, [\\amp], \\amp, Pseq([0.9, 0.1], inf), \\dur, Pseq([4.5,0.5,0.25,0.25, Rest(8)], inf));" ], [ 1941.071660002, 'joach', "~testJa.play(vol: 0.2, fadeTime: 18);" ], [ 1940.716454625, 'kof', "Kolektiv.tempo_(120);" ], [ 1938.350172782, 'joach', "(
~testJa[0] = {
var osc = SinOsc.ar(( \\freq.kr(60) + \\fplus.kr(0) ), mul: 1, add: 0);
var noise = BrownNoise.ar(\\noise.kr(0), (1 - \\noise.kr(0)));
var sig = osc * noise;
Pan2.ar( sig * \\amp.kr(0), \\pan.kr(0) );
};
)" ], [ 1928.73945466, 'joach', "(
~testJa[0] = {
var osc = SinOsc.ar(( \\freq.kr(600) + \\fplus.kr(0) ), mul: 1, add: 0);
var noise = BrownNoise.ar(\\noise.kr(0), (1 - \\noise.kr(0)));
var sig = osc * noise;
Pan2.ar( sig * \\amp.kr(0), \\pan.kr(0) );
};
)" ], [ 1928.326228171, 'alex', "~n5.play(vol:0.2, fadeTime:2, numChannels:2).quant_(2);" ], [ 1921.631550754, 'joach', "~testJa.play(vol: 0.2, fadeTime: 18);" ], [ 1919.324328462, 'alex', "~n5.play(vol:0.4, fadeTime:2, numChannels:2).quant_(2);" ], [ 1918.115890437, 'kof', "(
~zet.ar(2);
~zet.quant=2;
~zet.fadeTime=0.2;
~zet={
  //         |       |       |       |       |  
  var pat = [1,0,0,0,1,0,0,0,1,0,0,0,1,0,0,0].rotate(1);
  var imp = PulseDivider.kr(~tick.kr,1,~counter.kr);
  var hit = Select.kr(PulseCount.kr(imp)%pat.size,pat);
  var env = EnvGen.ar(Env([0.001,1,0.0001],[0.002,0.5],[3,-3],curve:'exp'),imp * hit);
  var sig = SinOsc.ar(15000/fib(16)) * Pulse.ar(fib(16));
  //sig = sig * env;
  Splay.ar(sig,0.75,0.15);
};
~zet.play;
);" ], [ 1915.05956745, 'alex', "~n5[2]=\\set->Pbind(\\args, [\\freq], \\dur,1, \\freq, Pseq([14500],inf));" ], [ 1912.654399503, 'alex', "~n5[1]=\\set->Pbind(\\args, [\\trig], \\dur, Pseq([2,1,0.5,Prand([Rest(0.5),Rest(0.5),1],1)],inf), \\trig, 1);" ], [ 1911.804257789, 'joach', "~testJa2[2] = \\set -> Pbind(\\args, [\\freq], \\octave, 4, \\degree, Pseq([3,4,3,7], inf), \\dur, 8);" ], [ 1910.247269299, 'alex', "(
~n5[0]={
	var sig;
	var env=EnvGen.kr(Env([0,1,1,0],[0.001,0.1,0.001],\\welch),\\trig.tr);
	sig=SinOsc.ar(\\freq.kr!2)*env;
	sig=sig*env;
};
)" ], [ 1909.292364792, 'joach', "~testJa2[2] = \\set -> Pbind(\\args, [\\freq], \\octave, 4, \\degree, Pseq([3,4,3,7], inf), \\dur, 2);" ], [ 1906.283155366, 'kof', "(
~zet.ar(2);
~zet.quant=2;
~zet.fadeTime=0.2;
~zet={
  //         |       |       |       |       |  
  var pat = [1,0,0,0,1,0,0,0,1,0,0,0,1,0,0,0].rotate(1);
  var imp = PulseDivider.kr(~tick.kr,1,~counter.kr);
  var hit = Select.kr(PulseCount.kr(imp)%pat.size,pat);
  var env = EnvGen.ar(Env([0.001,1,0.0001],[0.002,0.5],[3,-3],curve:'exp'),imp * hit);
  var sig = SinOsc.ar(15000) * Pulse.ar(fib(16));
  //sig = sig * env;
  Splay.ar(sig,0.75,0.15);
};
~zet.play;
);" ], [ 1899.909984401, 'joach', "~testJa2[4] = \\filter -> {|in| FreeVerb.ar(in, \\fverb_mix.kr(0), \\fverb_room.kr(0.5)) };" ], [ 1893.245218276, 'joach', "~testJa2[3] = \\filter -> {|in| LPF.ar(in, \\lpf_freq.kr(800,18)) };" ], [ 1890.070334642, 'joach', "~testJa2.set(\\lpf_freq, 4800);" ], [ 1889.006327421, 'kof', "(
~zet.ar(2);
~zet.quant=2;
~zet.fadeTime=0.2;
~zet={
  //         |       |       |       |       |  
  var pat = [1,0,0,0,1,0,0,0,1,0,0,0,1,0,0,0].rotate(1);
  var imp = PulseDivider.kr(~tick.kr,1,~counter.kr);
  var hit = Select.kr(PulseCount.kr(imp)%pat.size,pat);
  var env = EnvGen.ar(Env([0.001,1,0.0001],[0.002,0.5],[3,-3],curve:'exp'),imp * hit);
  var sig = SinOsc.ar(15000) * Pulse.ar(4);
  sig = sig * env;
  Splay.ar(sig,0.75,0.15);
};
~zet.play;
);" ], [ 1881.348870834, 'joach', "~testJa2[3] = \\filter -> {|in| LPF.ar(in, \\lpf_freq.kr(800,8)) };" ], [ 1864.195277837, 'joach', "~testJa2[1] = \\set -> Pbind(\\args, [\\amp], \\amp, Pseq([0.9, 0.1], inf), \\dur, 1); // Pseq([0.5,0.5,0.25,0.25, Rest(1)], inf));" ], [ 1861.800489029, 'joach', "(
~testJa[0] = {
var osc = LFSaw.ar(( \\freq.kr(200) + \\fplus.kr(0) ), mul: 1, add: 0);
var noise = BrownNoise.ar(\\noise.kr(0), (1 - \\noise.kr(0)));
var sig = osc * noise;
Pan2.ar( sig * \\amp.kr(0), \\pan.kr(0) );
};
)" ], [ 1859.604949419, 'joach', "~testJa2.play(vol: 0.2, fadeTime: 8);" ], [ 1838.194233695, 'kof', "p.arProxyNames.collect{|n| var snth = (p[n.asSymbol]);if(true){snth.stop(10)}};" ], [ 1825.796238152, 'kof', "(
~one.ar(2);
~one.quant=2;
~one.fadeTime=2.2;
~one={
  //         |       |       |       |       |  
  var pat = [1,0,0,0,1,0,0,0,1,0,0,0,1,0,0,0].rotate(1);
  var imp = PulseDivider.kr(~tick.kr,[1,2,3,4,5,6,7] * 8,~counter.kr);
  var hit = Select.kr(PulseCount.kr(imp)%pat.size,pat);
  var env = EnvGen.ar(Env([0.001,1,0.0001],[0.002,2.25/[1,2,3,4]],[3,-3],curve:'exp'),imp * hit);
  var sig = SinOsc.ar(50!2 + (env**20*1000));
  sig = sig * env;
  GVerb.ar(sig,100,10);
  Splay.ar(sig,0.005,1);
};
~one.play;
);" ], [ 1794.71912554, 'kof', "(
~saw.ar(2);
~saw.quant=2;
~saw.fadeTime=8.2;
~saw={
  //         |       |       |       |       |  
  var pat = [1,0,0,0,1,0,0,0,1,0,0,0,1,0,0,0].rotate(1);
  var imp = PulseDivider.kr(~tick.kr,1,~counter.kr);
  var hit = Select.kr(PulseCount.kr(imp)%pat.size,pat);
  var env = EnvGen.ar(Env([0.001,1,0.0001],[0.002,0.5],[3,-3],curve:'exp'),imp * hit);
  var sig = LFSaw.ar(50 + [1,2,3,4].reciprocal / [1,1.5,1.25,2]*1.5) * LFSaw.ar(8/[1,2,3,4]).exprange(0.001,1);
  sig = GVerb.ar(sig,100,10)/2+sig;
  //sig = sig * env;
  Splay.ar(sig,0.75,0.75);
};
~saw.play;
);" ], [ 1794.602515358, 'alex', "~n1.free(fadeTime:12);" ], [ 1789.670513339, 'kof', "(
~saw.ar(2);
~saw.quant=2;
~saw.fadeTime=8.2;
~saw={
  //         |       |       |       |       |  
  var pat = [1,0,0,0,1,0,0,0,1,0,0,0,1,0,0,0].rotate(1);
  var imp = PulseDivider.kr(~tick.kr,1,~counter.kr);
  var hit = Select.kr(PulseCount.kr(imp)%pat.size,pat);
  var env = EnvGen.ar(Env([0.001,1,0.0001],[0.002,0.5],[3,-3],curve:'exp'),imp * hit);
  var sig = LFSaw.ar(50 + [1,2,3,4].reciprocal / [1,1.5,1.25,2]*1.5) * LFSaw.ar(4/[1,2,3,4]).exprange(0.001,1);
  sig = GVerb.ar(sig,100,10)/2+sig;
  //sig = sig * env;
  Splay.ar(sig,0.75,0.75);
};
~saw.play;
);" ], [ 1780.821493206, 'alex', "~n1.play(vol:0.4, fadeTime:2, numChannels:2).quant_(2);" ], [ 1773.227604668, 'kof', "(
    ~two.ar(2);
    ~two.quant=2;
    ~two.fadeTime=2.02;
    ~two={
        var mod = 0.75;//[-1,0.25,-0.25,1/8,1/16];
        var spread = 0.0;
        var pos = [0,0.5]+LFSaw.kr(1/400);
        //         |       |       |       |       |  
        var pat = [1,0,0,0,1,0,0,0,1,0,0,0,1,0,0,0].rotate(3);
        var imp = PulseDivider.kr(~tick.kr,[1,2,3,4],~counter.kr);
        var hit = Select.kr(PulseCount.kr(imp)%pat.size,pat);
  var env = EnvGen.ar(Env([0.001,1,0.001],[0.502,0.5],[3,-3],curve:'exp'),imp * hit);
        var sig = PlayBuf.ar(b.numChannels,b.bufnum,BufRateScale.kr(b.bufnum)*mod+(env*0.01),imp, (pos + BrownNoise.ar(1!8).range(spread * -1,spread)) * BufFrames.kr(b.bufnum),1);
        
  sig = sig * env;
        Splay.ar(sig.flat,0.5,0.5);
    };
    ~two.play;
);" ], [ 1771.95342365, 'alex', "~n1[33]=\\filter->{arg in; LPF.ar(in,\\lpf.kr(400,2))};" ], [ 1768.604902153, 'kof', "(
    ~two.ar(2);
    ~two.quant=2;
    ~two.fadeTime=2.02;
    ~two={
        var mod = 0.75;//[-1,0.25,-0.25,1/8,1/16];
        var spread = 0.0;
        var pos = [0,0.5]+LFSaw.kr(1/400);
        //         |       |       |       |       |  
        var pat = [1,0,0,0,1,0,0,0,1,0,0,0,1,0,0,0].rotate(3);
        var imp = PulseDivider.kr(~tick.kr,[1,2,3,4],~counter.kr);
        var hit = Select.kr(PulseCount.kr(imp)%pat.size,pat);
  var env = EnvGen.ar(Env([0.001,1,0.001],[0.502,0.5],[3,-3],curve:'exp'),imp * hit);
        var sig = PlayBuf.ar(b.numChannels,b.bufnum,BufRateScale.kr(b.bufnum)*mod+(env*0.01),imp, (pos + BrownNoise.ar(1!8).range(spread * -1,spread)) * BufFrames.kr(b.bufnum),1);
        
  sig = sig * env;
        Splay.ar(sig.flat,0.5,0.5);
    };
    ~two.play;
);" ], [ 1768.010600883, 'alex', "~n1[2]=\\set->Pbind(\\args, [\\freq], \\dur,1, \\freq, Pseq([45],inf));" ], [ 1760.681473034, 'alex', "~n1[1]=\\set->Pbind(\\args, [\\trig], \\dur, Pseq([2],inf), \\trig, 1);" ], [ 1758.779929307, 'kof', "(
    ~two.ar(2);
    ~two.quant=2;
    ~two.fadeTime=2.02;
    ~two={
        var mod = 0.75;//[-1,0.25,-0.25,1/8,1/16];
        var spread = 0.0;
        var pos = [0,0.5]+LFSaw.kr(1/400);
        //         |       |       |       |       |  
        var pat = [1,0,0,0,1,0,0,0,1,0,0,0,1,0,0,0].rotate(3);
        var imp = PulseDivider.kr(~tick.kr,[1,2,3,4],~counter.kr);
        var hit = Select.kr(PulseCount.kr(imp)%pat.size,pat);
  var env = EnvGen.ar(Env([0.001,1,0.001],[0.502,0.5],[3,-3],curve:'exp'),imp * hit);
        var sig = PlayBuf.ar(b.numChannels,b.bufnum,BufRateScale.kr(b.bufnum)*mod+(env*0.01),imp, (pos + BrownNoise.ar(1!8).range(spread * -1,spread)) * BufFrames.kr(b.bufnum),1);
        
  sig = sig * env;
        Splay.ar(sig.flat,0.5,0.5);
    };
    ~two.play;
);" ], [ 1754.234209553, 'kof', "b = Buffer.read(s,Platform.resourceDir ++ \"/sounds/douce.wav\");" ], [ 1747.102684507, 'alex', "~n1.play(vol:0.8, fadeTime:2, numChannels:2).quant_(2);" ], [ 1744.990530894, 'kof', "(
~one.ar(2);
~one.quant=2;
~one.fadeTime=2.2;
~one={
  //         |       |       |       |       |  
  var pat = [1,0,0,0,1,0,0,0,1,0,0,0,1,0,0,0].rotate(1);
  var imp = PulseDivider.kr(~tick.kr,[1,2,3,4,5,6,7] * 8,~counter.kr);
  var hit = Select.kr(PulseCount.kr(imp)%pat.size,pat);
  var env = EnvGen.ar(Env([0.001,1,0.0001],[0.002,8.25/[1,2,3,4]],[3,-3],curve:'exp'),imp * hit);
  var sig = SinOsc.ar(50!2 + (env**20*1000));
  sig = sig * env;
  GVerb.ar(sig,100,10);
  Splay.ar(sig,0.005,1);
};
~one.play;
);" ], [ 1738.635596347, 'kof', "(
~one.ar(2);
~one.quant=2;
~one.fadeTime=2.2;
~one={
  //         |       |       |       |       |  
  var pat = [1,0,0,0,1,0,0,0,1,0,0,0,1,0,0,0].rotate(1);
  var imp = PulseDivider.kr(~tick.kr,[1,2,3,4,5,6,7] * 16,~counter.kr);
  var hit = Select.kr(PulseCount.kr(imp)%pat.size,pat);
  var env = EnvGen.ar(Env([0.001,1,0.0001],[0.002,8.25/[1,2,3,4]],[3,-3],curve:'exp'),imp * hit);
  var sig = SinOsc.ar(50!2 + (env**20*1000));
  sig = sig * env;
  GVerb.ar(sig,100,10);
  Splay.ar(sig,0.005,1);
};
~one.play;
);" ], [ 1732.743335871, 'alex', "~n1[33]=\\filter->{arg in; LPF.ar(in,\\lpf.kr(800,2))};" ], [ 1726.727402295, 'alex', "~n1[1]=\\set->Pbind(\\args, [\\trig], \\dur, Pseq([2,Rest(1)],inf), \\trig, 1);" ], [ 1723.2899325, 'alex', "(
~n1[0]={
	var sig;
	var env=EnvGen.kr(Env([0,1,1,0],[0.001,0.1,0.001],\\welch),\\trig.tr);
	var fenv=EnvGen.kr(Env([\\freq.kr,\\freq.kr*\\top.kr(8),\\freq.kr],[0.01,0.04],\\welch),\\trig.tr);
	
	sig=LFSaw.ar(fenv+fib(4).reciprocal)+ClipNoise.ar([0.4,0.1]);
	sig=sig*env;
};
)" ], [ 1721.553016062, 'kof', "(
~saw.ar(2);
~saw.quant=2;
~saw.fadeTime=8.2;
~saw={
  //         |       |       |       |       |  
  var pat = [1,0,0,0,1,0,0,0,1,0,0,0,1,0,0,0].rotate(1);
  var imp = PulseDivider.kr(~tick.kr,1,~counter.kr);
  var hit = Select.kr(PulseCount.kr(imp)%pat.size,pat);
  var env = EnvGen.ar(Env([0.001,1,0.0001],[0.002,0.5],[3,-3],curve:'exp'),imp * hit);
  var sig = LFSaw.ar(50 + [1,2,3,4].reciprocal / [1,1.5,1.25,2]*1.5) * LFSaw.ar(1/16/[1,2,3,4]).exprange(0.001,1);
  sig = GVerb.ar(sig,100,10)/2+sig;
  //sig = sig * env;
  Splay.ar(sig,0.75,0.75);
};
~saw.play;
);" ], [ 1711.191663613, 'alex', "~n1[30]=\\filter->{arg in; GVerb.ar(in,roomsize:20,revtime:0.2)};" ], [ 1701.89731455, 'kof', "(
    ~two.ar(2);
    ~two.quant=2;
    ~two.fadeTime=2.02;
    ~two={
        var mod = 0.25;//[-1,0.25,-0.25,1/8,1/16];
        var spread = 0.0;
        var pos = [0,0.5]+LFSaw.kr(1/400);
        //         |       |       |       |       |  
        var pat = [1,0,0,0,1,0,0,0,1,0,0,0,1,0,0,0].rotate(3);
        var imp = PulseDivider.kr(~tick.kr,[1,2,3,4],~counter.kr);
        var hit = Select.kr(PulseCount.kr(imp)%pat.size,pat);
  var env = EnvGen.ar(Env([0.001,1,0.001],[0.502,0.5],[3,-3],curve:'exp'),imp * hit);
        var sig = PlayBuf.ar(b.numChannels,b.bufnum,BufRateScale.kr(b.bufnum)*mod+(env*0.01),imp, (pos + BrownNoise.ar(1!8).range(spread * -1,spread)) * BufFrames.kr(b.bufnum),1);
        
  sig = sig * env;
        Splay.ar(sig.flat,0.5,0.5);
    };
    ~two.play;
);" ], [ 1701.648884651, 'joach', "~testJa.play(vol: 0.8, fadeTime: 18);" ], [ 1700.288326087, 'kof', "(
    ~two.ar(2);
    ~two.quant=2;
    ~two.fadeTime=2.02;
    ~two={
        var mod = 0.25;//[-1,0.25,-0.25,1/8,1/16];
        var spread = 0.0;
        var pos = [0,0.5]+LFSaw.kr(1/4);
        //         |       |       |       |       |  
        var pat = [1,0,0,0,1,0,0,0,1,0,0,0,1,0,0,0].rotate(3);
        var imp = PulseDivider.kr(~tick.kr,[1,2,3,4],~counter.kr);
        var hit = Select.kr(PulseCount.kr(imp)%pat.size,pat);
  var env = EnvGen.ar(Env([0.001,1,0.001],[0.502,0.5],[3,-3],curve:'exp'),imp * hit);
        var sig = PlayBuf.ar(b.numChannels,b.bufnum,BufRateScale.kr(b.bufnum)*mod+(env*0.01),imp, (pos + BrownNoise.ar(1!8).range(spread * -1,spread)) * BufFrames.kr(b.bufnum),1);
        
  sig = sig * env;
        Splay.ar(sig.flat,0.5,0.5);
    };
    ~two.play;
);" ], [ 1695.768416719, 'alex', "~n1[33]=\\filter->{arg in; LPF.ar(in,\\lpf.kr(400,2))};" ], [ 1689.84924442, 'kof', "(
    ~two.ar(2);
    ~two.quant=2;
    ~two.fadeTime=2.02;
    ~two={
        var mod = 0.25;//[-1,0.25,-0.25,1/8,1/16];
        var spread = 0.0;
        var pos = [0,0.5];
        //         |       |       |       |       |  
        var pat = [1,0,0,0,1,0,0,0,1,0,0,0,1,0,0,0].rotate(3);
        var imp = PulseDivider.kr(~tick.kr,[1,2,3,4],~counter.kr);
        var hit = Select.kr(PulseCount.kr(imp)%pat.size,pat);
  var env = EnvGen.ar(Env([0.001,1,0.001],[0.502,0.5],[3,-3],curve:'exp'),imp * hit);
        var sig = PlayBuf.ar(b.numChannels,b.bufnum,BufRateScale.kr(b.bufnum)*mod+(env*0.01),imp, (pos + BrownNoise.ar(1!8).range(spread * -1,spread)) * BufFrames.kr(b.bufnum),1);
        
  sig = sig * env;
        Splay.ar(sig.flat,0.5,0.5);
    };
    ~two.play;
);" ], [ 1680.689337808, 'kof', "(
    ~two.ar(2);
    ~two.quant=2;
    ~two.fadeTime=2.02;
    ~two={
        var mod = 0.25;//[-1,0.25,-0.25,1/8,1/16];
        var spread = 0.0;
        var pos = [0,0.25];
        //         |       |       |       |       |  
        var pat = [1,0,0,0,1,0,0,0,1,0,0,0,1,0,0,0].rotate(3);
        var imp = PulseDivider.kr(~tick.kr,[1,2,3,4],~counter.kr);
        var hit = Select.kr(PulseCount.kr(imp)%pat.size,pat);
  var env = EnvGen.ar(Env([0.001,1,0.001],[0.502,0.5],[3,-3],curve:'exp'),imp * hit);
        var sig = PlayBuf.ar(b.numChannels,b.bufnum,BufRateScale.kr(b.bufnum)*mod+(env*0.01),imp, (pos + BrownNoise.ar(1!8).range(spread * -1,spread)) * BufFrames.kr(b.bufnum),1);
        
  sig = sig * env;
        Splay.ar(sig.flat,0.5,0.5);
    };
    ~two.play;
);" ], [ 1672.898360659, 'alex', "~n1[2]=\\set->Pbind(\\args, [\\freq], \\dur,1, \\freq, Pseq([65],inf));" ], [ 1671.921501654, 'alex', "~n1[1]=\\set->Pbind(\\args, [\\trig], \\dur, Pseq([2,Rest(1)],inf), \\trig, 1);" ], [ 1668.973762201, 'alex', "(
~n1[0]={
	var sig;
	var env=EnvGen.kr(Env([0,1,1,0],[0.001,0.1,0.001],\\welch),\\trig.tr);
	var fenv=EnvGen.kr(Env([\\freq.kr,\\freq.kr*\\top.kr(4),\\freq.kr],[0.01,0.04],\\welch),\\trig.tr);
	
	sig=LFSaw.ar(fenv+fib(4).reciprocal)+ClipNoise.ar([0.4,0.1]);
	sig=sig*env;
};
)" ], [ 1667.428054343, 'alex', "~n1.play(vol:0.2, fadeTime:2, numChannels:2).quant_(2);" ], [ 1665.745497528, 'joach', "~testJa2.stop(16);" ], [ 1663.059197123, 'kof', "b = Buffer.read(s,Platform.resourceDir ++ \"/sounds/violin.wav\");" ], [ 1652.55431558, 'alex', "~n2.free(fadeTime:12);" ], [ 1651.790044323, 'alex', "~n2.play(vol:0.2, fadeTime:2, numChannels:2).quant_(2);" ], [ 1640.130293704, 'joach', "~testJa.stop(26);" ], [ 1634.60031086, 'joach', "(
~testJa[0] = {
var osc = LFSaw.ar(( \\freq.kr(200) + \\fplus.kr(0) ), mul: 1, add: 0);
var noise = BrownNoise.ar(\\noise.kr(0), (1 - \\noise.kr(0)));
var sig = osc * noise;
Pan2.ar( sig * \\amp.kr(0), \\pan.kr(0) );
};
)" ], [ 1633.219253672, 'kof', "p.arProxyNames.collect{|n| var snth = (p[n.asSymbol]);if(true){snth.stop(10)}};" ], [ 1631.21014277, 'joach', "~testJa2.play(vol: 0.8, fadeTime: 8);" ], [ 1626.801948261, 'joach', "~testJa[3] = nil" ], [ 1625.29817378, 'kof', "(
~one.ar(2);
~one.quant=2;
~one.fadeTime=2.2;
~one={
  //         |       |       |       |       |  
  var pat = [1,0,0,0,1,0,0,0,1,0,0,0,1,0,0,0].rotate(1);
  var imp = PulseDivider.kr(~tick.kr,[1,2,3,4,5,6,7] * 16,~counter.kr);
  var hit = Select.kr(PulseCount.kr(imp)%pat.size,pat);
  var env = EnvGen.ar(Env([0.001,1,0.0001],[0.002,8.25/[1,2,3,4]],[3,-3],curve:'exp'),imp * hit);
  var sig = SinOsc.ar(50!2 + (env**20*1000));
  sig = sig * env;
  GVerb.ar(sig,100,10);
  Splay.ar(sig,0.005,1);
};
~one.play;
);" ], [ 1624.132428961, 'alex', "~n2[30]=\\filter->{arg in; GVerb.ar(in,roomsize:20,revtime:0.6)};" ], [ 1616.146476598, 'alex', "(
~n2[0]={
	var sig;
	var env=EnvGen.kr(Env([0,1,0],[0.001,0.1],\\welch),\\trig.tr);
	
	sig=HPF.ar(WhiteNoise.ar(0.8),\\freq.kr);
	sig=Pan2.ar(sig,SinOsc.kr(0.25));
	sig=sig*env;
};
)" ], [ 1614.373914969, 'joach', "~testJa.set(\\lpf_freq, 1800);" ], [ 1613.658442283, 'kof', "(
~one.ar(2);
~one.quant=2;
~one.fadeTime=2.2;
~one={
  //         |       |       |       |       |  
  var pat = [1,0,0,0,1,0,0,0,1,0,0,0,1,0,0,0].rotate(1);
  var imp = PulseDivider.kr(~tick.kr,[1,2,3,4,5,6,7],~counter.kr);
  var hit = Select.kr(PulseCount.kr(imp)%pat.size,pat);
  var env = EnvGen.ar(Env([0.001,1,0.0001],[0.002,4.25/[1,2,3,4]],[3,-3],curve:'exp'),imp * hit);
  var sig = SinOsc.ar(50!2 + (env**20*1000));
  sig = sig * env;
  GVerb.ar(sig,100,10);
  Splay.ar(sig,0.005,1);
};
~one.play;
);" ], [ 1613.292147844, 'alex', "~n2[2]=\\set->Pbind(\\args, [\\freq], \\dur,2, \\freq, Pseq([11000],inf));" ], [ 1612.510520412, 'kof', "(
~one.ar(2);
~one.quant=2;
~one.fadeTime=2.2;
~one={
  //         |       |       |       |       |  
  var pat = [1,0,0,0,1,0,0,0,1,0,0,0,1,0,0,0].rotate(1);
  var imp = PulseDivider.kr(~tick.kr,[1,2,3,4,5,6,7],~counter.kr);
  var hit = Select.kr(PulseCount.kr(imp)%pat.size,pat);
  var env = EnvGen.ar(Env([0.001,1,0.0001],[0.002,4.25/[1,2,3,4]],[3,-3],curve:'exp'),imp * hit);
  var sig = SinOsc.ar(50!2 + (env**20*1000));
  sig = sig * env;
  GVerb.ar(sig,100,10);
  Splay.ar(sig,0.005,1);
};
~one.play;
);" ], [ 1610.594891375, 'joach', "~testJa[2] = \\set -> Pbind(\\args, [\\freq], \\octave, 3, \\degree, Pseq([3,4,3,7], inf), \\dur, 16);" ], [ 1608.476704519, 'alex', "~n2[33]=\\filter->{arg in; LPF.ar(in,\\lpf.kr(14000,2))};" ], [ 1601.890870252, 'alex', "~n2[33]=\\filter->{arg in; LPF.ar(in,\\lpf.kr(4000,2))};" ], [ 1600.674254383, 'joach', "~testJa[2] = \\set -> Pbind(\\args, [\\freq], \\octave, 4, \\degree, Pseq([3,4,3,7], inf), \\dur, 16);" ], [ 1597.070744185, 'alex', "~n2[2]=\\set->Pbind(\\args, [\\freq], \\dur,2, \\freq, Pseq([14000],inf));" ], [ 1595.09649982, 'alex', "~n2[2]=\\set->Pbind(\\args, [\\freq], \\dur,2, \\freq, Pseq([18000],inf));" ], [ 1594.068362798, 'kof', "(
    ~two.ar(2);
    ~two.quant=2;
    ~two.fadeTime=2.02;
    ~two={
        var mod = 0.25;//[-1,0.25,-0.25,1/8,1/16];
        var spread = 0.0;
        var pos = [0,0.25];
        //         |       |       |       |       |  
        var pat = [1,0,0,0,1,0,0,0,1,0,0,0,1,0,0,0].rotate(3);
        var imp = PulseDivider.kr(~tick.kr,[1,2,3,4],~counter.kr);
        var hit = Select.kr(PulseCount.kr(imp)%pat.size,pat);
  var env = EnvGen.ar(Env([0.001,1,0.001],[0.002,0.5],[3,-3],curve:'exp'),imp * hit);
        var sig = PlayBuf.ar(b.numChannels,b.bufnum,BufRateScale.kr(b.bufnum)*mod+(env*0.01),imp, (pos + BrownNoise.ar(1!8).range(spread * -1,spread)) * BufFrames.kr(b.bufnum),1);
        
  sig = sig * env;
        Splay.ar(sig.flat,0.5,0.5);
    };
    ~two.play;
);" ], [ 1593.052735891, 'kof', "b = Buffer.read(s,Platform.resourceDir ++ \"/sounds/beat.wav\");" ], [ 1592.67867363, 'joach', "~testJa[2] = \\set -> Pbind(\\args, [\\freq], \\octave, 3, \\degree, Pseq([3,4,3,7], inf), \\dur, 16);" ], [ 1592.262832458, 'alex', "~n2[33]=\\filter->{arg in; LPF.ar(in,\\lpf.kr(14000,2))};" ], [ 1589.194848311, 'alex', "~n2[2]=\\set->Pbind(\\args, [\\freq], \\dur,2, \\freq, Pseq([1000],inf));" ], [ 1584.82748466, 'kof', "(
    ~two.ar(2);
    ~two.quant=2;
    ~two.fadeTime=2.02;
    ~two={
        var mod = 0.25;//[-1,0.25,-0.25,1/8,1/16];
        var spread = 0.0;
        var pos = [0,0.25];
        //         |       |       |       |       |  
        var pat = [1,0,0,0,1,0,0,0,1,0,0,0,1,0,0,0].rotate(3);
        var imp = PulseDivider.kr(~tick.kr,[1,2,3,4],~counter.kr);
        var hit = Select.kr(PulseCount.kr(imp)%pat.size,pat);
  var env = EnvGen.ar(Env([0.001,1,0.001],[0.002,0.5],[3,-3],curve:'exp'),imp * hit);
        var sig = PlayBuf.ar(b.numChannels,b.bufnum,BufRateScale.kr(b.bufnum)*mod+(env*0.01),imp, (pos + BrownNoise.ar(1!8).range(spread * -1,spread)) * BufFrames.kr(b.bufnum),1);
        
  sig = sig * env;
        Splay.ar(sig.flat,0.5,0.5);
    };
    ~two.play;
);" ], [ 1584.022477477, 'kof', "b = Buffer.read(s,Platform.resourceDir ++ \"/sounds/beat2.wav\");" ], [ 1579.786138307, 'alex', "~n2[30]=\\filter->{arg in; GVerb.ar(in,roomsize:20,revtime:0.5)};" ], [ 1578.526659438, 'kof', "b = Buffer.read(s,Platform.resourceDir ++ \"/sounds/beat2.wav\");" ], [ 1574.170980926, 'joach', "~testJa.play(vol: 0.8, fadeTime: 18);" ], [ 1565.555256319, 'alex', "~n2[2]=\\set->Pbind(\\args, [\\freq], \\dur,2, \\freq, Pseq([2000],inf));" ], [ 1565.288889869, 'joach', "(
~testJa[0] = {
var osc = SinOsc.ar(( \\freq.kr(60) + \\fplus.kr(0) ), mul: 1, add: 0);
var noise = BrownNoise.ar(\\noise.kr(0), (1 - \\noise.kr(0)));
var sig = osc * noise;
Pan2.ar( sig * \\amp.kr(0), \\pan.kr(0) );
};
)" ], [ 1562.493933635, 'alex', "~n2[2]=\\set->Pbind(\\args, [\\freq], \\dur,2, \\freq, Pseq([4000],inf));" ], [ 1558.430886755, 'alex', "~n2[2]=\\set->Pbind(\\args, [\\freq], \\dur,2, \\freq, Pseq([6000],inf));" ], [ 1555.14776067, 'alex', "~n2[2]=\\set->Pbind(\\args, [\\freq], \\dur,2, \\freq, Pseq([8000],inf));" ], [ 1546.696534204, 'alex', "~n2[33]=\\filter->{arg in; LPF.ar(in,\\lpf.kr(14000,2))};" ], [ 1543.635385122, 'alex', "~n2[33]=\\filter->{arg in; LPF.ar(in,\\lpf.kr(1000,2))};" ], [ 1541.006970205, 'alex', "~n2[33]=\\filter->{arg in; LPF.ar(in,\\lpf.kr(14000,2))};" ], [ 1537.949326637, 'kof', "(
~ff.quant=1;
~ff.fadeTime=16;
~ff={
  var high,mid,low;
  var sig = ~threew.ar + ~one.ar + ~saw.ar;

  sig = Resonz.ar(sig,MouseX.kr(100,10000,(1..8)),MouseY.kr(0.1,1,(1..4)/16))/4;
  sig = CompanderD.ar(sig,3/4,1/2,1/2);
  sig = CombN.ar(sig,4,[4,8,16],32)+sig;
  sig = GVerb.ar(LPF.ar(sig,7000)+HPF.ar(sig,300),100,[3,4],spread:[95,96])/4 + sig;
  low = CompanderD.ar(LPF.ar(sig,LFNoise2.kr(1/2!2).range(100,800)),3/4,1/2,1/2);
  mid = CompanderD.ar(BPF.ar(sig,LFNoise2.kr(1/2!2).range(700,1500),2),3/4,1/2,1/2);
  high = CompanderD.ar(HPF.ar(sig,LFNoise2.kr(1/2!2).range(1000,10000)),3/4,1/2,1/2);
  sig = CompanderD.ar((high+mid+low).flat,3/4,1/1.1,1/1.1);
  Splay.ar(sig,0.75,0.2);
};
~ff.play;
);" ], [ 1528.545257442, 'alex', "~n2[33]=\\filter->{arg in; LPF.ar(in,\\lpf.kr(14000,2))};" ], [ 1521.583343195, 'kof', "(
~saw.ar(2);
~saw.quant=2;
~saw.fadeTime=8.2;
~saw={
  //         |       |       |       |       |  
  var pat = [1,0,0,0,1,0,0,0,1,0,0,0,1,0,0,0].rotate(1);
  var imp = PulseDivider.kr(~tick.kr,1,~counter.kr);
  var hit = Select.kr(PulseCount.kr(imp)%pat.size,pat);
  var env = EnvGen.ar(Env([0.001,1,0.0001],[0.002,0.5],[3,-3],curve:'exp'),imp * hit);
  var sig = LFSaw.ar(50 + [1,2,3,4].reciprocal / [1,1.5,1.25,2]*1.5) * LFSaw.ar(1/16/[1,2,3,4]).exprange(0.001,1);
  sig = GVerb.ar(sig,100,10)/2+sig;
  //sig = sig * env;
  Splay.ar(sig,0.75,0.75);
};
~saw.play;
);" ], [ 1519.573519977, 'alex', "~n2[33]=\\filter->{arg in; LPF.ar(in,\\lpf.kr(11000,2))};" ], [ 1515.474566078, 'joach', "(\\octave:8, \\amp:0.1).play" ], [ 1513.00434689, 'alex', "~n2.play(vol:0.5, fadeTime:2, numChannels:2).quant_(2);" ], [ 1507.956528776, 'alex', "~n2.play(vol:0.4, fadeTime:2, numChannels:2).quant_(2);" ], [ 1507.176196293, 'joach', "(\\octave:8, \\amp:0.1).play" ], [ 1499.318835559, 'alex', "~n2.play(vol:0.3, fadeTime:2, numChannels:2).quant_(2);" ], [ 1497.923021878, 'kof', "(
    ~two.ar(2);
    ~two.quant=2;
    ~two.fadeTime=2.02;
    ~two={
        var mod = 0.25;//[-1,0.25,-0.25,1/8,1/16];
        var spread = 0.0;
        var pos = [0,0.25];
        //         |       |       |       |       |  
        var pat = [1,0,0,0,1,0,0,0,1,0,0,0,1,0,0,0].rotate(3);
        var imp = PulseDivider.kr(~tick.kr,[1,2,3,4],~counter.kr);
        var hit = Select.kr(PulseCount.kr(imp)%pat.size,pat);
  var env = EnvGen.ar(Env([0.001,1,0.001],[0.002,0.5],[3,-3],curve:'exp'),imp * hit);
        var sig = PlayBuf.ar(b.numChannels,b.bufnum,BufRateScale.kr(b.bufnum)*mod+(env*0.01),imp, (pos + BrownNoise.ar(1!8).range(spread * -1,spread)) * BufFrames.kr(b.bufnum),1);
        
  sig = sig * env;
        Splay.ar(sig.flat,0.5,0.5);
    };
    ~two.play;
);" ], [ 1496.151116567, 'joach', "~testJa2.play(vol: 0.8, fadeTime: 8);" ], [ 1495.597447979, 'alex', "~n2[2]=\\set->Pbind(\\args, [\\freq], \\dur,2, \\freq, Pseq([11000],inf));" ], [ 1491.113464645, 'alex', "~n2[1]=\\set->Pbind(\\args, [\\trig], \\dur,Pseq([Pn(0.25,8),Rest(2)],inf), \\trig, 1);" ], [ 1489.702317223, 'kof', "(
~one.ar(2);
~one.quant=2;
~one.fadeTime=2.2;
~one={
  //         |       |       |       |       |  
  var pat = [1,0,0,0,1,0,0,0,1,0,0,0,1,0,0,0].rotate(1);
  var imp = PulseDivider.kr(~tick.kr,[1,2,3,4,5,6,7],~counter.kr);
  var hit = Select.kr(PulseCount.kr(imp)%pat.size,pat);
  var env = EnvGen.ar(Env([0.001,1,0.0001],[0.002,4.25/[1,2,3,4]],[3,-3],curve:'exp'),imp * hit);
  var sig = SinOsc.ar(50!2 + (env**20*1000));
  sig = sig * env;
  GVerb.ar(sig,100,10);
  Splay.ar(sig,0.005,1);
};
~one.play;
);" ], [ 1485.882455863, 'joach', "~testJa2[2] = \\set -> Pbind(\\args, [\\freq], \\octave, 3, \\degree, Pseq([3,4,3,7], inf), \\dur, 2);" ], [ 1483.220859169, 'kof', "(
    ~two.ar(2);
    ~two.quant=2;
    ~two.fadeTime=2.02;
    ~two={
        var mod = 0.25;//[-1,0.25,-0.25,1/8,1/16];
        var spread = 0.0;
        var pos = [0,0.5];
        //         |       |       |       |       |  
        var pat = [1,0,0,0,1,0,0,0,1,0,0,0,1,0,0,0].rotate(3);
        var imp = PulseDivider.kr(~tick.kr,[1,2,3,4],~counter.kr);
        var hit = Select.kr(PulseCount.kr(imp)%pat.size,pat);
  var env = EnvGen.ar(Env([0.001,1,0.001],[0.002,0.5],[3,-3],curve:'exp'),imp * hit);
        var sig = PlayBuf.ar(b.numChannels,b.bufnum,BufRateScale.kr(b.bufnum)*mod+(env*0.01),imp, (pos + BrownNoise.ar(1!8).range(spread * -1,spread)) * BufFrames.kr(b.bufnum),1);
        
  sig = sig * env;
        Splay.ar(sig.flat,0.5,0.5);
    };
    ~two.play;
);" ], [ 1475.946945879, 'joach', "~testJa2[2] = \\set -> Pbind(\\args, [\\freq], \\octave, 3, \\degree, Pseq([3,4,3,7], inf), \\dur, 16);" ], [ 1471.414418268, 'kof', "(
    ~two.ar(2);
    ~two.quant=2;
    ~two.fadeTime=2.02;
    ~two={
        var mod = 0.125;//[-1,0.25,-0.25,1/8,1/16];
        var spread = 0.0;
        var pos = [0,0.25];
        //         |       |       |       |       |  
        var pat = [1,0,0,0,1,0,0,0,1,0,0,0,1,0,0,0].rotate(1);
        var imp = PulseDivider.kr(~tick.kr,[1,2,3,4],~counter.kr);
        var hit = Select.kr(PulseCount.kr(imp)%pat.size,pat);
  var env = EnvGen.ar(Env([0.001,1,0.001],[0.002,0.5],[3,-3],curve:'exp'),imp * hit);
        var sig = PlayBuf.ar(b.numChannels,b.bufnum,BufRateScale.kr(b.bufnum)*mod+(env*0.01),imp, (pos + BrownNoise.ar(1!8).range(spread * -1,spread)) * BufFrames.kr(b.bufnum),1);
        
  sig = sig * env;
        Splay.ar(sig.flat,0.5,0.5);
    };
    ~two.play;
);" ], [ 1470.232371586, 'alex', "(
~n2[0]={
	var sig;
	var env=EnvGen.kr(Env([0,1,0],[0.001,0.1],\\welch),\\trig.tr);
	
	sig=HPF.ar(WhiteNoise.ar(0.8),\\freq.kr);
	sig=Pan2.ar(sig,SinOsc.kr(0.25));
	sig=sig*env;
};
)" ], [ 1468.216369053, 'kof', "(
    ~two.ar(2);
    ~two.quant=2;
    ~two.fadeTime=2.02;
    ~two={
        var mod = 0.25;//[-1,0.25,-0.25,1/8,1/16];
        var spread = 0.0;
        var pos = [0,0.25];
        //         |       |       |       |       |  
        var pat = [1,0,0,0,1,0,0,0,1,0,0,0,1,0,0,0].rotate(1);
        var imp = PulseDivider.kr(~tick.kr,[1,2,3,4],~counter.kr);
        var hit = Select.kr(PulseCount.kr(imp)%pat.size,pat);
  var env = EnvGen.ar(Env([0.001,1,0.001],[0.002,0.5],[3,-3],curve:'exp'),imp * hit);
        var sig = PlayBuf.ar(b.numChannels,b.bufnum,BufRateScale.kr(b.bufnum)*mod+(env*0.01),imp, (pos + BrownNoise.ar(1!8).range(spread * -1,spread)) * BufFrames.kr(b.bufnum),1);
        
  sig = sig * env;
        Splay.ar(sig.flat,0.5,0.5);
    };
    ~two.play;
);" ], [ 1464.027629173, 'kof', "(
    ~two.ar(2);
    ~two.quant=2;
    ~two.fadeTime=2.02;
    ~two={
        var mod = 0.5;//[-1,0.25,-0.25,1/8,1/16];
        var spread = 0.0;
        var pos = [0,0.25];
        //         |       |       |       |       |  
        var pat = [1,0,0,0,1,0,0,0,1,0,0,0,1,0,0,0].rotate(1);
        var imp = PulseDivider.kr(~tick.kr,[1,2,3,4],~counter.kr);
        var hit = Select.kr(PulseCount.kr(imp)%pat.size,pat);
  var env = EnvGen.ar(Env([0.001,1,0.001],[0.002,0.5],[3,-3],curve:'exp'),imp * hit);
        var sig = PlayBuf.ar(b.numChannels,b.bufnum,BufRateScale.kr(b.bufnum)*mod+(env*0.01),imp, (pos + BrownNoise.ar(1!8).range(spread * -1,spread)) * BufFrames.kr(b.bufnum),1);
        
  sig = sig * env;
        Splay.ar(sig.flat,0.5,0.5);
    };
    ~two.play;
);" ], [ 1463.829534356, 'joach', "~testJa2[1] = \\set -> Pbind(\\args, [\\amp], \\amp, Pseq([0.9, 0.1], inf), \\dur, Pseq([0.5,0.5,0.25,0.25, Rest(1)], inf));" ], [ 1457.058573208, 'kof', "(
    ~two.ar(2);
    ~two.quant=2;
    ~two.fadeTime=2.02;
    ~two={
        var mod = 1;//[-1,0.25,-0.25,1/8,1/16];
        var spread = 0.0;
        var pos = [0,0.25];
        //         |       |       |       |       |  
        var pat = [1,0,0,0,1,0,0,0,1,0,0,0,1,0,0,0].rotate(1);
        var imp = PulseDivider.kr(~tick.kr,[1,2,3,4],~counter.kr);
        var hit = Select.kr(PulseCount.kr(imp)%pat.size,pat);
  var env = EnvGen.ar(Env([0.001,1,0.001],[0.002,0.5],[3,-3],curve:'exp'),imp * hit);
        var sig = PlayBuf.ar(b.numChannels,b.bufnum,BufRateScale.kr(b.bufnum)*mod+(env*0.01),imp, (pos + BrownNoise.ar(1!8).range(spread * -1,spread)) * BufFrames.kr(b.bufnum),1);
        
  sig = sig * env;
        Splay.ar(sig.flat,0.5,0.5);
    };
    ~two.play;
);" ], [ 1456.005325587, 'alex', "~n1.free(fadeTime:8);" ], [ 1452.017296273, 'alex', "~n1.play(vol:0.2, fadeTime:2, numChannels:2).quant_(2);" ], [ 1449.140792985, 'kof', "(
    ~two.ar(2);
    ~two.quant=2;
    ~two.fadeTime=2.02;
    ~two={
        var mod = 1;//[-1,0.25,-0.25,1/8,1/16];
        var spread = 0.0;
        var pos = [0,0.5];
        //         |       |       |       |       |  
        var pat = [1,0,0,0,1,0,0,0,1,0,0,0,1,0,0,0].rotate(1);
        var imp = PulseDivider.kr(~tick.kr,[1,2,3,4],~counter.kr);
        var hit = Select.kr(PulseCount.kr(imp)%pat.size,pat);
  var env = EnvGen.ar(Env([0.001,1,0.001],[0.002,0.5],[3,-3],curve:'exp'),imp * hit);
        var sig = PlayBuf.ar(b.numChannels,b.bufnum,BufRateScale.kr(b.bufnum)*mod+(env*0.01),imp, (pos + BrownNoise.ar(1!8).range(spread * -1,spread)) * BufFrames.kr(b.bufnum),1);
        
  sig = sig * env;
        Splay.ar(sig.flat,0.5,0.5);
    };
    ~two.play;
);" ], [ 1441.536370125, 'kof', "(
    ~two.ar(2);
    ~two.quant=2;
    ~two.fadeTime=2.02;
    ~two={
        var mod = 1;//[-1,0.25,-0.25,1/8,1/16];
        var spread = 0.0;
        var pos = [0,0.5];
        //         |       |       |       |       |  
        var pat = [1,0,0,0,1,0,0,0,1,0,0,0,1,0,0,0].rotate(1);
        var imp = PulseDivider.kr(~tick.kr,2,~counter.kr);
        var hit = Select.kr(PulseCount.kr(imp)%pat.size,pat);
  var env = EnvGen.ar(Env([0.001,1,0.001],[0.002,0.5],[3,-3],curve:'exp'),imp * hit);
        var sig = PlayBuf.ar(b.numChannels,b.bufnum,BufRateScale.kr(b.bufnum)*mod+(env*0.01),imp, (pos + BrownNoise.ar(1!8).range(spread * -1,spread)) * BufFrames.kr(b.bufnum),1);
        
  sig = sig * env;
        Splay.ar(sig.flat,0.5,0.5);
    };
    ~two.play;
);" ], [ 1441.31576839, 'alex', "(
~n1[0]={
	var sig;
	var env=EnvGen.kr(Env([0,1,1,0],[0.001,0.1,0.001],\\welch),\\trig.tr);
	var fenv=EnvGen.kr(Env([\\freq.kr,\\freq.kr*\\top.kr(4),\\freq.kr],[0.01,0.04],\\welch),\\trig.tr);
	
	sig=LFSaw.ar(fenv+fib(4).reciprocal)+ClipNoise.ar([0.4,0.1]);
	sig=sig*env;
};
)" ], [ 1439.810334926, 'kof', "(
    ~two.ar(2);
    ~two.quant=2;
    ~two.fadeTime=2.02;
    ~two={
        var mod = 1;//[-1,0.25,-0.25,1/8,1/16];
        var spread = 0.0;
        var pos = [0,0.5];
        //         |       |       |       |       |  
        var pat = [1,0,0,0,1,0,0,0,1,0,0,0,1,0,0,0].rotate(1);
        var imp = PulseDivider.kr(~tick.kr,4,~counter.kr);
        var hit = Select.kr(PulseCount.kr(imp)%pat.size,pat);
  var env = EnvGen.ar(Env([0.001,1,0.001],[0.002,0.5],[3,-3],curve:'exp'),imp * hit);
        var sig = PlayBuf.ar(b.numChannels,b.bufnum,BufRateScale.kr(b.bufnum)*mod+(env*0.01),imp, (pos + BrownNoise.ar(1!8).range(spread * -1,spread)) * BufFrames.kr(b.bufnum),1);
        
  sig = sig * env;
        Splay.ar(sig.flat,0.5,0.5);
    };
    ~two.play;
);" ], [ 1438.162799552, 'joach', "~testJa2.play(vol: 0.5, fadeTime: 8);" ], [ 1436.05104096, 'kof', "(
    ~two.ar(2);
    ~two.quant=2;
    ~two.fadeTime=2.02;
    ~two={
        var mod = 1;//[-1,0.25,-0.25,1/8,1/16];
        var spread = 0.0;
        var pos = [0,0.5];
        //         |       |       |       |       |  
        var pat = [1,0,0,0,1,0,0,0,1,0,0,0,1,0,0,0].rotate(1);
        var imp = PulseDivider.kr(~tick.kr,2,~counter.kr);
        var hit = Select.kr(PulseCount.kr(imp)%pat.size,pat);
  var env = EnvGen.ar(Env([0.001,1,0.001],[0.002,0.5],[3,-3],curve:'exp'),imp * hit);
        var sig = PlayBuf.ar(b.numChannels,b.bufnum,BufRateScale.kr(b.bufnum)*mod+(env*0.01),imp, (pos + BrownNoise.ar(1!8).range(spread * -1,spread)) * BufFrames.kr(b.bufnum),1);
        
  sig = sig * env;
        Splay.ar(sig.flat,0.5,0.5);
    };
    ~two.play;
);" ], [ 1431.901667661, 'alex', "~n1[2]=\\set->Pbind(\\args, [\\freq], \\dur,1, \\freq, Pseq([65],inf));" ], [ 1431.068598755, 'joach', "~testJa2[2] = \\set -> Pbind(\\args, [\\freq], \\octave, 5, \\degree, Pseq([3,4,3,7], inf), \\dur, 16);" ], [ 1426.211375381, 'kof', "(
    ~two.ar(2);
    ~two.quant=2;
    ~two.fadeTime=2.02;
    ~two={
        var mod = 1;//[-1,0.25,-0.25,1/8,1/16];
        var spread = 0.0;
        var pos = [0,0.5];
        //         |       |       |       |       |  
        var pat = [1,0,0,0,1,0,0,0,1,0,0,0,1,0,0,0].rotate(1);
        var imp = PulseDivider.kr(~tick.kr,1,~counter.kr);
        var hit = Select.kr(PulseCount.kr(imp)%pat.size,pat);
  var env = EnvGen.ar(Env([0.001,1,0.001],[0.002,0.5],[3,-3],curve:'exp'),imp * hit);
        var sig = PlayBuf.ar(b.numChannels,b.bufnum,BufRateScale.kr(b.bufnum)*mod+(env*0.01),imp, (pos + BrownNoise.ar(1!8).range(spread * -1,spread)) * BufFrames.kr(b.bufnum),1);
        
  sig = sig * env;
        Splay.ar(sig.flat,0.5,0.5);
    };
    ~two.play;
);" ], [ 1425.193815374, 'kof', "b = Buffer.read(s,Platform.resourceDir ++ \"/sounds/beat.wav\");" ], [ 1423.128172488, 'alex', "(
~n1[0]={
	var sig;
	var env=EnvGen.kr(Env([0,1,1,0],[0.001,0.1,0.001],\\welch),\\trig.tr);
	var fenv=EnvGen.kr(Env([\\freq.kr,\\freq.kr*\\top.kr(8),\\freq.kr],[0.01,0.04],\\welch),\\trig.tr);
	
	sig=LFSaw.ar(fenv+fib(4).reciprocal)+ClipNoise.ar([0.4,0.1]);
	sig=sig*env;
};
)" ], [ 1420.907671367, 'joach', "~testJa2[1] = \\set -> Pbind(\\args, [\\amp], \\amp, Pseq([0.9, 0.1], inf), \\dur, Pseq([4.5,0.5,0.25,0.25, Rest(1)], inf));" ], [ 1418.635638628, 'alex', "~n1[33]=\\filter->{arg in; LPF.ar(in,\\lpf.kr(200,2))};" ], [ 1418.628451276, 'joach', "(
~testJa[0] = {
var osc = LFSaw.ar(( \\freq.kr(200) + \\fplus.kr(0) ), mul: 1, add: 0);
var noise = BrownNoise.ar(\\noise.kr(0), (1 - \\noise.kr(0)));
var sig = osc * noise;
Pan2.ar( sig * \\amp.kr(0), \\pan.kr(0) );
};
)" ], [ 1417.418652404, 'joach', "~testJa2.play(vol: 0.1, fadeTime: 8);" ], [ 1414.697066593, 'alex', "~n1[33]=\\filter->{arg in; LPF.ar(in,\\lpf.kr(300,2))};" ], [ 1411.08358412, 'alex', "~n1[33]=\\filter->{arg in; LPF.ar(in,\\lpf.kr(400,2))};" ], [ 1400.918431234, 'alex', "~n1[2]=\\set->Pbind(\\args, [\\freq], \\dur,1, \\freq, Pseq([35],inf));" ], [ 1391.620679883, 'alex', "~n1[30]=\\filter->{arg in; GVerb.ar(in,roomsize:20,revtime:2)};" ], [ 1381.44652912, 'alex', "~n1[1]=\\set->Pbind(\\args, [\\trig], \\dur, Pseq([2,Rest(1)],inf), \\trig, 1);" ], [ 1372.916030705, 'alex', "~n1[33]=\\filter->{arg in; LPF.ar(in,\\lpf.kr(200,2))};" ], [ 1366.977140669, 'alex', "~n1[33]=\\filter->{arg in; LPF.ar(in,\\lpf.kr(400,2))};" ], [ 1363.453169319, 'alex', "~n1[33]=\\filter->{arg in; LPF.ar(in,\\lpf.kr(100,2))};" ], [ 1356.679749117, 'alex', "~n1[1]=\\set->Pbind(\\args, [\\trig], \\dur, Pseq([Pn(1,8),Rest(1)],inf), \\trig, 1);" ], [ 1352.143484847, 'kof', "(
~saw.ar(2);
~saw.quant=2;
~saw.fadeTime=8.2;
~saw={
  //         |       |       |       |       |  
  var pat = [1,0,0,0,1,0,0,0,1,0,0,0,1,0,0,0].rotate(1);
  var imp = PulseDivider.kr(~tick.kr,1,~counter.kr);
  var hit = Select.kr(PulseCount.kr(imp)%pat.size,pat);
  var env = EnvGen.ar(Env([0.001,1,0.0001],[0.002,0.5],[3,-3],curve:'exp'),imp * hit);
  var sig = LFSaw.ar(50 + [1,2,3,4].reciprocal / [1,1.5,1.25,2]*1.5) * LFSaw.ar(1/16/[1,2,3,4]).exprange(0.001,1);
  sig = GVerb.ar(sig,100,10)/2+sig;
  //sig = sig * env;
  Splay.ar(sig,0.75,0.25);
};
~saw.play;
);" ], [ 1347.8772513, 'kof', "(
~saw.ar(2);
~saw.quant=2;
~saw.fadeTime=8.2;
~saw={
  //         |       |       |       |       |  
  var pat = [1,0,0,0,1,0,0,0,1,0,0,0,1,0,0,0].rotate(1);
  var imp = PulseDivider.kr(~tick.kr,1,~counter.kr);
  var hit = Select.kr(PulseCount.kr(imp)%pat.size,pat);
  var env = EnvGen.ar(Env([0.001,1,0.0001],[0.002,0.5],[3,-3],curve:'exp'),imp * hit);
  var sig = LFSaw.ar(50 + [1,2,3,4].reciprocal / [1,1.5,1.25,2]*1.5) * LFSaw.ar(1/16/[1,2,3,4]).exprange(0.001,1);
  sig = GVerb.ar(sig,100,10)/2+sig;
  //sig = sig * env;
  Splay.ar(sig,0.75,0.15);
};
~saw.play;
);" ], [ 1325.726202917, 'alex', "~n1[33]=\\filter->{arg in; LPF.ar(in,\\lpf.kr(100,2))};" ], [ 1321.791226284, 'alex', "~n1[33]=\\filter->{arg in; LPF.ar(in,\\lpf.kr(200,2))};" ], [ 1309.523160681, 'alex', "~n1[2]=\\set->Pbind(\\args, [\\freq], \\dur,1, \\freq, Pseq([45],inf));" ], [ 1294.406766307, 'alex', "~n1[2]=\\set->Pbind(\\args, [\\freq], \\dur,1, \\freq, Pseq([65],inf));" ], [ 1293.066726603, 'kof', "~threew.clear;" ], [ 1288.779600915, 'joach', "~testJa.stop(26);" ], [ 1285.010008334, 'kof', "~one.clear;" ], [ 1284.109640006, 'alex', "~n1[1]=\\set->Pbind(\\args, [\\trig], \\dur, 1, \\trig, 1);" ], [ 1282.018913444, 'joach', "~testJa2.play(vol: 0.9, fadeTime: 8);" ], [ 1279.209619275, 'alex', "(
~n1[0]={
	var sig;
	var env=EnvGen.kr(Env([0,1,1,0],[0.001,0.1,0.001],\\welch),\\trig.tr);
	var fenv=EnvGen.kr(Env([\\freq.kr,\\freq.kr*\\top.kr(8),\\freq.kr],[0.01,0.04],\\welch),\\trig.tr);
	
	sig=LFSaw.ar(fenv+fib(4).reciprocal)+ClipNoise.ar([0.04,0.1]);
	sig=sig*env;
};
)" ], [ 1276.405864304, 'joach', "~testJa[2] = \\set -> Pbind(\\args, [\\freq], \\octave, 4, \\degree, Pseq([3,4,3,7], inf), \\dur, 16);" ], [ 1275.462770888, 'kof', "(
~threew.ar(2);
~threew.quant=2;
~threew.fadeTime=0.2;
~threew={
  var mod = Duty.kr(4,0,Dseq([1,2,1.5,1.25],inf)) ;
  //         |       |       |       |       |  
  var pat = [1,0,0,0,1,0,0,0,1,0,0,0,1,0,0,0].rotate(1);
  var imp = PulseDivider.kr(~tick.kr,[1],~counter.kr);
  var hit = Select.kr(PulseCount.kr(imp)%pat.size,pat);
  var env = EnvGen.ar(Env([0.001,1,0.0001],[0.002,0.5],[3,-3],curve:'exp'),imp * hit);
  var sig = [
  Pulse.ar(4),
  Pulse.ar(16/mod),
  //SinOsc.ar(500!2/mod,mul:0.2) * Pulse.ar(4),
  SinOsc.ar(50!2*mod),
  LFNoise2.ar(15000!2/mod),
  //SinOsc.ar(50!2),
  ];
  sig = Select.ar(PulseCount.kr(imp*hit)%sig.size,sig);
 // sig = sig * env;
  Splay.ar(sig,0.05,0.95);
};
~threew.play;
);" ], [ 1266.95260071, 'alex', "~n1[33]=\\filter->{arg in; LPF.ar(in,\\lpf.kr(400,2))};" ], [ 1264.961881578, 'joach', "~testJa[2] = \\set -> Pbind(\\args, [\\freq], \\octave, 5, \\degree, Pseq([3,4,3,7], inf), \\dur, 16);" ], [ 1261.018958072, 'alex', "~n1[2]=\\set->Pbind(\\args, [\\freq], \\dur,1, \\freq, Pseq([35],inf));" ], [ 1257.532027178, 'joach', "~testJa.set(\\lpf_freq, 800);" ], [ 1256.282726017, 'kof', "(
~threew.ar(2);
~threew.quant=2;
~threew.fadeTime=0.2;
~threew={
  var mod = Duty.kr(4,0,Dseq([1,2,1.5,1.25],inf)) ;
  //         |       |       |       |       |  
  var pat = [1,0,0,0,1,0,0,0,1,0,0,0,1,0,0,0].rotate(1);
  var imp = PulseDivider.kr(~tick.kr,[1],~counter.kr);
  var hit = Select.kr(PulseCount.kr(imp)%pat.size,pat);
  var env = EnvGen.ar(Env([0.001,1,0.0001],[0.002,0.5],[3,-3],curve:'exp'),imp * hit);
  var sig = [
  Pulse.ar(4),
  Pulse.ar(1600/mod),
  //SinOsc.ar(500!2/mod,mul:0.2) * Pulse.ar(4),
  SinOsc.ar(50!2*mod),
  LFNoise2.ar(15000!2/mod),
  //SinOsc.ar(50!2),
  ];
  sig = Select.ar(PulseCount.kr(imp*hit)%sig.size,sig);
 // sig = sig * env;
  Splay.ar(sig,0.05,0.95);
};
~threew.play;
);" ], [ 1255.346192626, 'alex', "(
~n1[0]={
	var sig;
	var env=EnvGen.kr(Env([0,1,1,0],[0.001,0.2,0.001],\\welch),\\trig.tr);
	var fenv=EnvGen.kr(Env([\\freq.kr,\\freq.kr*\\top.kr(8),\\freq.kr],[0.01,0.04],\\welch),\\trig.tr);
	
	sig=LFSaw.ar(fenv+fib(4).reciprocal)+ClipNoise.ar([0.04,0.1]);
	sig=sig*env;
};
)" ], [ 1251.547128627, 'kof', "(
~threew.ar(2);
~threew.quant=2;
~threew.fadeTime=0.2;
~threew={
  var mod = Duty.kr(4,0,Dseq([1,2,1.5,1.25],inf)) ;
  //         |       |       |       |       |  
  var pat = [1,0,0,0,1,0,0,0,1,0,0,0,1,0,0,0].rotate(1);
  var imp = PulseDivider.kr(~tick.kr,[1],~counter.kr);
  var hit = Select.kr(PulseCount.kr(imp)%pat.size,pat);
  var env = EnvGen.ar(Env([0.001,1,0.0001],[0.002,0.5],[3,-3],curve:'exp'),imp * hit);
  var sig = [
  Pulse.ar(4),
  Pulse.ar(1600),
  //SinOsc.ar(500!2/mod,mul:0.2) * Pulse.ar(4),
  SinOsc.ar(50!2*mod),
  LFNoise2.ar(15000!2/mod),
  //SinOsc.ar(50!2),
  ];
  sig = Select.ar(PulseCount.kr(imp*hit)%sig.size,sig);
 // sig = sig * env;
  Splay.ar(sig,0.05,0.95);
};
~threew.play;
);" ], [ 1248.985065625, 'alex', "(
~n1[0]={
	var sig;
	var env=EnvGen.kr(Env([0,1,1,0],[0.001,0.2,0.001],\\welch),\\trig.tr);
	var fenv=EnvGen.kr(Env([\\freq.kr,\\freq.kr*\\top.kr(8),\\freq.kr],[0.01,0.04],\\welch),\\trig.tr);
	
	sig=LFSaw.ar(fenv+fib(4).reciprocal)+ClipNoise.ar([0.64,0.3]);
	sig=sig*env;
};
)" ], [ 1243.983790781, 'joach', "~testJa[4] = \\filter -> {|in| LPF.ar(in, \\lpf_freq.kr(800,8)) };" ], [ 1241.863491454, 'alex', "~n1[2]=\\set->Pbind(\\args, [\\freq], \\dur,1, \\freq, Pseq([65],inf));" ], [ 1238.983715721, 'kof', "(
~one.quant=2;
~one.fadeTime=2.2;
~one={
  //         |       |       |       |       |  
  var pat = [1,0,0,0,1,0,0,0,1,0,0,0,1,0,0,0].rotate(1);
  var imp = PulseDivider.kr(~tick.kr,[1,2,3,4,5,6,7],~counter.kr);
  var hit = Select.kr(PulseCount.kr(imp)%pat.size,pat);
  var env = EnvGen.ar(Env([0.001,1,0.0001],[0.002,4.25/[1,2,3,4]],[3,-3],curve:'exp'),imp * hit);
  var sig = SinOsc.ar(50!2 + (env**20*1000));
  sig = sig * env;
  GVerb.ar(sig,100,10);
  Splay.ar(sig,0.005,1);
};
~one.play;
);" ], [ 1238.795056415, 'alex', "~n1.play(vol:0.6, fadeTime:2, numChannels:2).quant_(2);" ], [ 1235.717372046, 'alex', "~n1[1]=\\set->Pbind(\\args, [\\trig], \\dur, Pseq([2,1,Rest(1),1,Rest(1)],inf), \\trig, 1);" ], [ 1227.206653242, 'kof', "(
~one.ar(2);
~one.quant=2;
~one.fadeTime=4.2;
~one={
  //         |       |       |       |       |  
  var pat = [1,0,0,0,1,0,0,0,1,0,0,0,1,0,0,0].rotate(1);
  var imp = PulseDivider.kr(~tick.kr,[1,2,3,4,5,6,7],~counter.kr);
  var hit = Select.kr(PulseCount.kr(imp)%pat.size,pat);
  var env = EnvGen.ar(Env([0.001,1,0.0001],[0.002,0.25/[1,2,3,4]],[3,-3],curve:'exp'),imp * hit);
  var sig = SinOsc.ar(50!2 + (env**20*1000));
  sig = sig * env;
  GVerb.ar(sig,100,10);
  Splay.ar(sig,0.005,1);
};
~one.play;
);" ], [ 1225.224241276, 'alex', "~n1[1]=\\set->Pbind(\\args, [\\trig], \\dur, Pseq([2,1,Rest(1),1,Rest(1)],inf), \\trig, 1);" ], [ 1223.989681199, 'joach', "~testJa[2] = \\set -> Pbind(\\args, [\\freq], \\octave, 4, \\degree, Pseq([3,4,3,7], inf), \\dur, 16);" ], [ 1220.66362882, 'joach', "~testJa[2] = \\set -> Pbind(\\args, [\\freq], \\octave, 6, \\degree, Pseq([3,4,3,7], inf), \\dur, 16);" ], [ 1212.907065292, 'joach', "~testJa2.play(vol: 0.9, fadeTime: 8);" ], [ 1208.640041029, 'kof', "(
~one.ar(2);
~one.quant=2;
~one.fadeTime=0.2;
~one={
  //         |       |       |       |       |  
  var pat = [1,0,0,0,1,0,0,0,1,0,0,0,1,0,0,0].rotate(1);
  var imp = PulseDivider.kr(~tick.kr,[1,2,3,4,5,6,7],~counter.kr);
  var hit = Select.kr(PulseCount.kr(imp)%pat.size,pat);
  var env = EnvGen.ar(Env([0.001,1,0.0001],[0.002,4.5/[1,2,3,4]],[3,-3],curve:'exp'),imp * hit);
  var sig = SinOsc.ar(50!2 + (env**20*1000));
  sig = sig * env;
  GVerb.ar(sig,100,10);
  Splay.ar(sig,0.005,1);
};
~one.play;
);" ], [ 1197.96847601, 'alex', "~n1[2]=\\set->Pbind(\\args, [\\freq], \\dur,1, \\freq, Pseq([35],inf));" ], [ 1197.250711019, 'joach', "~testJa2.stop(16);" ], [ 1194.044058364, 'alex', "~n1[30]=\\filter->{arg in; GVerb.ar(in,roomsize:20,revtime:0.4)};" ], [ 1187.209578384, 'joach', "~testJa2[1] = \\set -> Pbind(\\args, [\\amp], \\amp, Pseq([0.9, 0.1], inf), \\dur, Pseq([4.5,0.5,0.25,0.25, Rest(1)], inf));" ], [ 1187.010943655, 'alex', "~n1[30]=\\filter->{arg in; GVerb.ar(in,roomsize:20,revtime:1)};" ], [ 1177.25658558, 'alex', "~n1[33]=\\filter->{arg in; LPF.ar(in,\\lpf.kr(1200,2))};" ], [ 1177.102142959, 'kof', "(
~threew.ar(2);
~threew.quant=2;
~threew.fadeTime=0.2;
~threew={
  var mod = Duty.kr(4,0,Dseq([1,2,1.5,1.25],inf)) ;
  //         |       |       |       |       |  
  var pat = [1,0,0,0,1,0,0,0,1,0,0,0,1,0,0,0].rotate(1);
  var imp = PulseDivider.kr(~tick.kr,[1],~counter.kr);
  var hit = Select.kr(PulseCount.kr(imp)%pat.size,pat);
  var env = EnvGen.ar(Env([0.001,1,0.0001],[0.002,0.5],[3,-3],curve:'exp'),imp * hit);
  var sig = [
  Pulse.ar(4),
  Pulse.ar(8),
  //SinOsc.ar(500!2/mod,mul:0.2) * Pulse.ar(4),
  SinOsc.ar(50!2*mod),
  LFNoise2.ar(15000!2/mod),
  //SinOsc.ar(50!2),
  ];
  sig = Select.ar(PulseCount.kr(imp*hit)%sig.size,sig);
 // sig = sig * env;
  Splay.ar(sig,0.05,0.95);
};
~threew.play;
);" ], [ 1177.08686403, 'joach', "~testJa.play(vol: 0.8, fadeTime: 18);" ], [ 1172.879887527, 'joach', "~testJa[2] = \\set -> Pbind(\\args, [\\freq], \\octave, 4, \\degree, Pseq([3,4,3,7], inf), \\dur, 16);" ], [ 1172.256744223, 'kof', "(
~threew.ar(2);
~threew.quant=2;
~threew.fadeTime=0.2;
~threew={
  var mod = Duty.kr(4,0,Dseq([1,2,1.5,1.25],inf)) ;
  //         |       |       |       |       |  
  var pat = [1,0,0,0,1,0,0,0,1,0,0,0,1,0,0,0].rotate(1);
  var imp = PulseDivider.kr(~tick.kr,[1],~counter.kr);
  var hit = Select.kr(PulseCount.kr(imp)%pat.size,pat);
  var env = EnvGen.ar(Env([0.001,1,0.0001],[0.002,0.5],[3,-3],curve:'exp'),imp * hit);
  var sig = [
  Pulse.ar(4),
  Pulse.ar(8),
  //SinOsc.ar(500!2/mod,mul:0.2) * Pulse.ar(4),
  SinOsc.ar(150!2*mod),
  LFNoise2.ar(15000!2/mod),
  //SinOsc.ar(50!2),
  ];
  sig = Select.ar(PulseCount.kr(imp*hit)%sig.size,sig);
 // sig = sig * env;
  Splay.ar(sig,0.05,0.95);
};
~threew.play;
);" ], [ 1172.212019836, 'alex', "~n1[33]=\\filter->{arg in; LPF.ar(in,\\lpf.kr(400,2))};" ], [ 1162.051384373, 'kof', "(
~threew.ar(2);
~threew.quant=2;
~threew.fadeTime=0.2;
~threew={
  var mod = Duty.kr(4,0,Dseq([1,2,1.5,1.25],inf)) ;
  //         |       |       |       |       |  
  var pat = [1,0,0,0,1,0,0,0,1,0,0,0,1,0,0,0].rotate(1);
  var imp = PulseDivider.kr(~tick.kr,[1],~counter.kr);
  var hit = Select.kr(PulseCount.kr(imp)%pat.size,pat);
  var env = EnvGen.ar(Env([0.001,1,0.0001],[0.002,0.5],[3,-3],curve:'exp'),imp * hit);
  var sig = [
  Pulse.ar(4),
  Pulse.ar(8),
  //SinOsc.ar(500!2/mod,mul:0.2) * Pulse.ar(4),
  SinOsc.ar(50!2*mod),
  LFNoise2.ar(15000!2/mod),
  //SinOsc.ar(50!2),
  ];
  sig = Select.ar(PulseCount.kr(imp*hit)%sig.size,sig);
 // sig = sig * env;
  Splay.ar(sig,0.05,0.95);
};
~threew.play;
);" ], [ 1161.489760443, 'alex', "~n1[30]=\\filter->{arg in; GVerb.ar(in,roomsize:20,revtime:0.8)};" ], [ 1160.083531349, 'joach', "~testJa.play(vol: 0.1, fadeTime: 18);" ], [ 1150.70334918, 'joach', "(
~testJa[0] = {
var osc = SinOsc.ar(( \\freq.kr(60) + \\fplus.kr(0) ), mul: 1, add: 0);
var noise = BrownNoise.ar(\\noise.kr(0), (1 - \\noise.kr(0)));
var sig = osc * noise;
Pan2.ar( sig * \\amp.kr(0), \\pan.kr(0) );
};
)" ], [ 1148.685132712, 'joach', "~testJa.play(vol: 0.8, fadeTime: 18);" ], [ 1147.564813915, 'alex', "~n1[2]=\\set->Pbind(\\args, [\\freq], \\dur,1, \\freq, Pseq([45],inf));" ], [ 1146.662435342, 'kof', "(
~threew.ar(2);
~threew.quant=2;
~threew.fadeTime=0.2;
~threew={
  var mod = Duty.kr(4,0,Dseq([1,2,1.5,1.25],inf)) ;
  //         |       |       |       |       |  
  var pat = [1,0,0,0,1,0,0,0,1,0,0,0,1,0,0,0].rotate(1);
  var imp = PulseDivider.kr(~tick.kr,[1],~counter.kr);
  var hit = Select.kr(PulseCount.kr(imp)%pat.size,pat);
  var env = EnvGen.ar(Env([0.001,1,0.0001],[0.002,0.5],[3,-3],curve:'exp'),imp * hit);
  var sig = [
  Pulse.ar(4),
  Pulse.ar(8),
  //SinOsc.ar(500!2/mod,mul:0.2) * Pulse.ar(4),
  SinOsc.ar(50!2*mod),
  LFNoise2.ar(15000!2/mod),
  //SinOsc.ar(50!2),
  ];
  sig = Select.ar(PulseCount.kr(imp*hit)%sig.size,sig);
  sig = sig * env;
  Splay.ar(sig,0.05,0.95);
};
~threew.play;
);" ], [ 1143.409632086, 'alex', "~n1[2]=\\set->Pbind(\\args, [\\freq], \\dur,1, \\freq, Pseq([125],inf));" ], [ 1141.247664934, 'joach', "~testJa2[1] = \\set -> Pbind(\\args, [\\amp], \\amp, Pseq([0.9, 0.1], inf), \\dur, Pseq([0.5,0.5,0.25,0.25, Rest(1)], inf));" ], [ 1139.140200457, 'alex', "~n1[2]=\\set->Pbind(\\args, [\\freq], \\dur,1, \\freq, Pseq([85],inf));" ], [ 1138.44349564, 'kof', "(
~one.ar(2);
~one.quant=2;
~one.fadeTime=0.2;
~one={
  //         |       |       |       |       |  
  var pat = [1,0,0,0,1,0,0,0,1,0,0,0,1,0,0,0].rotate(1);
  var imp = PulseDivider.kr(~tick.kr,[1,2,3,4,5,6,7],~counter.kr);
  var hit = Select.kr(PulseCount.kr(imp)%pat.size,pat);
  var env = EnvGen.ar(Env([0.001,1,0.0001],[0.002,4.5/[1,2,3,4]],[3,-3],curve:'exp'),imp * hit);
  var sig = SinOsc.ar(50!2 + (env**20*1000));
  sig = sig * env;
  Splay.ar(sig,0.005,1);
};
~one.play;
);" ], [ 1135.57298901, 'joach', "~testJa2[1] = \\set -> Pbind(\\args, [\\amp], \\amp, Pseq([0.9, 0.1], inf), \\dur, Pseq([1.5,0.5,0.25,0.25, Rest(1)], inf));" ], [ 1130.170225982, 'alex', "~n1[1]=\\set->Pbind(\\args, [\\trig], \\dur, Pseq([2,1,Rest(1)],inf), \\trig, 1);" ], [ 1129.217193551, 'kof', "(
~one.ar(2);
~one.quant=2;
~one.fadeTime=0.2;
~one={
  //         |       |       |       |       |  
  var pat = [1,0,0,0,1,0,0,0,1,0,0,0,1,0,0,0].rotate(1);
  var imp = PulseDivider.kr(~tick.kr,[1,2,3,4,5,6,7],~counter.kr);
  var hit = Select.kr(PulseCount.kr(imp)%pat.size,pat);
  var env = EnvGen.ar(Env([0.001,1,0.0001],[0.002,4.5/[1,2,3,4]],[3,-3],curve:'exp'),imp * hit);
  var sig = SinOsc.ar(50!2 + (env**20*1000));
  sig = sig * env;
  Splay.ar(sig,0.005,0.95);
};
~one.play;
);" ], [ 1123.026912061, 'joach', "(
~testJa[0] = {
var osc = LFSaw.ar(( \\freq.kr(200) + \\fplus.kr(0) ), mul: 1, add: 0);
var noise = BrownNoise.ar(\\noise.kr(0), (1 - \\noise.kr(0)));
var sig = osc * noise;
Pan2.ar( sig * \\amp.kr(0), \\pan.kr(0) );
};
)" ], [ 1122.283866155, 'kof', "(
~one.ar(2);
~one.quant=2;
~one.fadeTime=0.2;
~one={
  //         |       |       |       |       |  
  var pat = [1,0,0,0,1,0,0,0,1,0,0,0,1,0,0,0].rotate(1);
  var imp = PulseDivider.kr(~tick.kr,[1,2,3,4,5,6,7],~counter.kr);
  var hit = Select.kr(PulseCount.kr(imp)%pat.size,pat);
  var env = EnvGen.ar(Env([0.001,1,0.0001],[0.002,4.5],[3,-3],curve:'exp'),imp * hit);
  var sig = SinOsc.ar(50!2 + (env**20*1000));
  sig = sig * env;
  Splay.ar(sig,0.005,0.95);
};
~one.play;
);" ], [ 1114.569932919, 'joach', "(
~testJa[0] = {
var osc = LFSaw.ar(( \\freq.kr(600) + \\fplus.kr(0) ), mul: 1, add: 0);
var noise = BrownNoise.ar(\\noise.kr(0), (1 - \\noise.kr(0)));
var sig = osc * noise;
Pan2.ar( sig * \\amp.kr(0), \\pan.kr(0) );
};
)" ], [ 1113.660124558, 'kof', "(
~one.ar(2);
~one.quant=2;
~one.fadeTime=0.2;
~one={
  //         |       |       |       |       |  
  var pat = [1,0,0,0,1,0,0,0,1,0,0,0,1,0,0,0].rotate(1);
  var imp = PulseDivider.kr(~tick.kr,[1,2,3,4,5,6,7],~counter.kr);
  var hit = Select.kr(PulseCount.kr(imp)%pat.size,pat);
  var env = EnvGen.ar(Env([0.001,1,0.0001],[0.002,3.5],[3,-3],curve:'exp'),imp * hit);
  var sig = SinOsc.ar(50!2 + (env**20*1000));
  sig = sig * env;
  Splay.ar(sig,0.005,0.95);
};
~one.play;
);" ], [ 1108.644295823, 'joach', "~testJa2.play(vol: 0.5, fadeTime: 8);" ], [ 1105.760013519, 'joach', "~testJa2[1] = \\set -> Pbind(\\args, [\\amp], \\amp, Pseq([0.9, 0.1], inf), \\dur, Pseq([0.5,0.5,0.25,0.25, Rest(1)], inf));" ], [ 1099.202020851, 'alex', "~n1.play(vol:0.6, fadeTime:2, numChannels:2).quant_(2);" ], [ 1098.663868005, 'kof', "(
~one.ar(2);
~one.quant=2;
~one.fadeTime=0.2;
~one={
  //         |       |       |       |       |  
  var pat = [1,0,0,0,1,0,0,0,1,0,0,0,1,0,0,0].rotate(1);
  var imp = PulseDivider.kr(~tick.kr,[1,2,3,4],~counter.kr);
  var hit = Select.kr(PulseCount.kr(imp)%pat.size,pat);
  var env = EnvGen.ar(Env([0.001,1,0.0001],[0.002,3.5],[3,-3],curve:'exp'),imp * hit);
  var sig = SinOsc.ar(50!2 + (env**20*1000));
  sig = sig * env;
  Splay.ar(sig,0.005,0.95);
};
~one.play;
);" ], [ 1082.561115663, 'kof', "(
~one.ar(2);
~one.quant=2;
~one.fadeTime=0.2;
~one={
  //         |       |       |       |       |  
  var pat = [1,0,0,0,1,0,0,0,1,0,0,0,1,0,0,0].rotate(1);
  var imp = PulseDivider.kr(~tick.kr,[1,2,3,4],~counter.kr);
  var hit = Select.kr(PulseCount.kr(imp)%pat.size,pat);
  var env = EnvGen.ar(Env([0.001,1,0.0001],[0.002,3.5],[3,-3],curve:'exp'),imp * hit);
  var sig = SinOsc.ar(50!2 + (env**20*100));
  sig = sig * env;
  Splay.ar(sig,0.005,0.95);
};
~one.play;
);" ], [ 1081.142463921, 'alex', "~n1[2]=\\set->Pbind(\\args, [\\freq], \\dur,1, \\freq, Pseq([45],inf));" ], [ 1073.710736434, 'joach', "~testJa.stop(6);" ], [ 1070.860187048, 'alex', "~n1[2]=\\set->Pbind(\\args, [\\freq], \\dur,1, \\freq, Pseq([55],inf));" ], [ 1066.151087314, 'joach', "~testJa[3] = \\filter -> {|in| GVerb.ar(in, \\gverb_size.kr(12), \\gverb_time.kr(2), 0.9, mul:\\mulgverb.kr(1)) };" ], [ 1058.226496051, 'alex', "(
~n1[0]={
	var sig;
	var env=EnvGen.kr(Env([0,1,1,0],[0.001,0.2,0.001],\\welch),\\trig.tr);
	var fenv=EnvGen.kr(Env([\\freq.kr,\\freq.kr*\\top.kr(8),\\freq.kr],[0.01,0.04],\\welch),\\trig.tr);
	
	sig=LFSaw.ar(fenv+fib(4).reciprocal)+ClipNoise.ar([0.64,0.9]);
	sig=sig*env;
};
)" ], [ 1050.791889564, 'alex', "(
~n1[0]={
	var sig;
	var env=EnvGen.kr(Env([0,1,1,0],[0.001,0.2,0.001],\\welch),\\trig.tr);
	var fenv=EnvGen.kr(Env([\\freq.kr,\\freq.kr*\\top.kr(8),\\freq.kr],[0.01,0.04],\\welch),\\trig.tr);
	
	sig=LFSaw.ar(fenv+fib(4).reciprocal)+ClipNoise.ar([0.64,0.2]);
	sig=sig*env;
};
)" ], [ 1050.758412617, 'joach', "~testJa[2] = \\set -> Pbind(\\args, [\\freq], \\octave, 6, \\degree, Pseq([3,4,3,7], inf), \\dur, 16);" ], [ 1050.254110843, 'kof', "(
~threew.ar(2);
~threew.quant=2;
~threew.fadeTime=0.2;
~threew={
  var mod = Duty.kr(4,0,Dseq([1,2,1.5,1.25],inf)) ;
  //         |       |       |       |       |  
  var pat = [1,0,0,0,1,0,0,0,1,0,0,0,1,0,0,0].rotate(1);
  var imp = PulseDivider.kr(~tick.kr,[1],~counter.kr);
  var hit = Select.kr(PulseCount.kr(imp)%pat.size,pat);
  var env = EnvGen.ar(Env([0.001,1,0.0001],[0.002,0.5],[3,-3],curve:'exp'),imp * hit);
  var sig = [
  Pulse.ar(4),
  Pulse.ar(8),
  //SinOsc.ar(500!2/mod,mul:0.2) * Pulse.ar(4),
  SinOsc.ar(50!2*mod),
  LFNoise2.ar(15000!2/mod),
  //SinOsc.ar(50!2),
  ];
  sig = Select.ar(PulseCount.kr(imp*hit)%sig.size,sig);
 // sig = sig * env;
  Splay.ar(sig,0.05,0.95);
};
~threew.play;
);" ], [ 1039.455856294, 'alex', "~n1[1]=\\set->Pbind(\\args, [\\trig], \\dur, Pseq([2,4],inf), \\trig, 1);" ], [ 1034.632733287, 'kof', "(
~threew.ar(2);
~threew.quant=2;
~threew.fadeTime=0.2;
~threew={
  var mod = Duty.kr(4,0,Dseq([1,2,1.5,1.25],inf)) ;
  //         |       |       |       |       |  
  var pat = [1,0,0,0,1,0,0,0,1,0,0,0,1,0,0,0].rotate(1);
  var imp = PulseDivider.kr(~tick.kr,[1],~counter.kr);
  var hit = Select.kr(PulseCount.kr(imp)%pat.size,pat);
  var env = EnvGen.ar(Env([0.001,1,0.0001],[0.002,0.5],[3,-3],curve:'exp'),imp * hit);
  var sig = [
  Pulse.ar(4),
  Pulse.ar(8),
  //SinOsc.ar(500!2/mod,mul:0.2) * Pulse.ar(4),
  SinOsc.ar(50!2),
  LFNoise2.ar(15000!2/mod),
  //SinOsc.ar(50!2),
  ];
  sig = Select.ar(PulseCount.kr(imp*hit)%sig.size,sig);
 // sig = sig * env;
  Splay.ar(sig,0.05,0.95);
};
~threew.play;
);" ], [ 1025.345677533, 'alex', "~n1[2]=\\set->Pbind(\\args, [\\freq], \\dur,1, \\freq, Pseq([95],inf));" ], [ 1017.913536975, 'alex', "~n1[33]=\\filter->{arg in; LPF.ar(in,\\lpf.kr(900,2))};" ], [ 1013.955248452, 'joach', "~testJa[1] = \\set -> Pbind(\\args, [\\amp], \\amp, Pseq([0.9, 0.1], inf), \\dur, Pseq([4.5,0.5,0.25,0.25, Rest(8)], inf));" ], [ 1002.500094233, 'kof', "Kolektiv.tempo_(240)" ], [ 999.261175206, 'alex', "(
~n1[0]={
	var sig;
	var env=EnvGen.kr(Env([0,1,1,0],[0.001,0.2,0.001],\\welch),\\trig.tr);
	var fenv=EnvGen.kr(Env([\\freq.kr,\\freq.kr*\\top.kr(6),\\freq.kr],[0.01,0.04],\\welch),\\trig.tr);
	
	sig=LFSaw.ar(fenv+fib(4).reciprocal)+ClipNoise.ar([0.64,0.2]);
	sig=sig*env;
};
)" ], [ 990.612183348, 'alex', "~n1[2]=\\set->Pbind(\\args, [\\freq], \\dur,1, \\freq, Pseq([85],inf));" ], [ 979.880002292, 'alex', "~n1[33]=\\filter->{arg in; LPF.ar(in,\\lpf.kr(800,2))};" ], [ 967.620365952, 'alex', "~n1.play(vol:0.2, fadeTime:2, numChannels:2).quant_(2);" ], [ 962.34163552, 'joach', "~testJa/.play(vol: 0.8, fadeTime: 18);" ], [ 961.758742217, 'alex', "(
~n1[0]={
	var sig;
	var env=EnvGen.kr(Env([0,1,1,0],[0.001,0.2,0.001],\\welch),\\trig.tr);
	var fenv=EnvGen.kr(Env([\\freq.kr,\\freq.kr*\\top.kr(4),\\freq.kr],[0.01,0.04],\\welch),\\trig.tr);
	
	sig=LFSaw.ar(fenv+fib(4).reciprocal)+ClipNoise.ar([0.64,0.2]);
	sig=sig*env;
};
)" ], [ 951.265424239, 'kof', "(
~ff.quant=1;
~ff.fadeTime=16;
~ff={
  var high,mid,low;
  var sig = ~threew.ar + ~one.ar;

  sig = Resonz.ar(sig,MouseX.kr(100,10000,(1..8)),MouseY.kr(0.1,1,(1..4)/16))/4;
  sig = CompanderD.ar(sig,3/4,1/2,1/2);
  sig = CombN.ar(sig,4,[4,8,16],32)+sig;
  sig = GVerb.ar(LPF.ar(sig,7000)+HPF.ar(sig,300),100,[3,4],spread:[95,96])/4 + sig;
  low = CompanderD.ar(LPF.ar(sig,LFNoise2.kr(1/2!2).range(100,800)),3/4,1/2,1/2);
  mid = CompanderD.ar(BPF.ar(sig,LFNoise2.kr(1/2!2).range(700,1500),2),3/4,1/2,1/2);
  high = CompanderD.ar(HPF.ar(sig,LFNoise2.kr(1/2!2).range(1000,10000)),3/4,1/2,1/2);
  sig = CompanderD.ar((high+mid+low).flat,3/4,1/1.1,1/1.1);
  Splay.ar(sig,0.75,0.2);
};
~ff.play;
);" ], [ 949.396502291, 'alex', "~n1[30]=\\filter->{arg in; GVerb.ar(in,roomsize:20,revtime:0.4)};" ], [ 942.360753662, 'joach', "~testJa[2] = \\set -> Pbind(\\args, [\\freq], \\octave, 5, \\degree, Pseq([3,4,3,7], inf), \\dur, 16);" ], [ 936.900431374, 'alex', "(
~n1[0]={
	var sig;
	var env=EnvGen.kr(Env([0,1,1,0],[0.001,0.2,0.001],\\welch),\\trig.tr);
	var fenv=EnvGen.kr(Env([\\freq.kr,\\freq.kr*\\top.kr(4),\\freq.kr],[0.01,0.04],\\welch),\\trig.tr);
	
	sig=LFSaw.ar(fenv+fib(4).reciprocal)+ClipNoise.ar([0.4,0.2]);
	sig=sig*env;
};
)" ], [ 926.786511089, 'kof', "(
~one.ar(2);
~one.quant=2;
~one.fadeTime=0.2;
~one={
  //         |       |       |       |       |  
  var pat = [1,0,0,0,1,0,0,0,1,0,0,0,1,0,0,0].rotate(1);
  var imp = PulseDivider.kr(~tick.kr,1,~counter.kr);
  var hit = Select.kr(PulseCount.kr(imp)%pat.size,pat);
  var env = EnvGen.ar(Env([0.001,1,0.0001],[0.002,3.5],[3,-3],curve:'exp'),imp * hit);
  var sig = SinOsc.ar(50!2 + (env**20*100));
  sig = sig * env;
  Splay.ar(sig,0.005,0.95);
};
~one.play;
);" ], [ 921.284366887, 'alex', "~n1[33]=\\filter->{arg in; LPF.ar(in,\\lpf.kr(600,2))};" ], [ 915.950878983, 'kof', "(
~one.ar(2);
~one.quant=2;
~one.fadeTime=0.2;
~one={
  //         |       |       |       |       |  
  var pat = [1,0,0,0,1,0,0,0,1,0,0,0,1,0,0,0].rotate(1);
  var imp = PulseDivider.kr(~tick.kr,1,~counter.kr);
  var hit = Select.kr(PulseCount.kr(imp)%pat.size,pat);
  var env = EnvGen.ar(Env([0.001,1,0.0001],[0.002,3.5],[3,-3],curve:'exp'),imp * hit);
  var sig = SinOsc.ar(50!2 + (env**20*100));
  sig = sig * env;
  Splay.ar(sig,0.75,0.95);
};
~one.play;
);" ], [ 913.75437413, 'joach', "~testJa/.play(vol: 0.5, fadeTime: 18);" ], [ 912.321402223, 'kof', "(
~ff.quant=1;
~ff.fadeTime=1;
~ff={
  var high,mid,low;
  var sig = ~threew.ar + ~one.ar;

  sig = Resonz.ar(sig,MouseX.kr(100,10000,(1..8)),MouseY.kr(0.1,1,(1..4)/16))/4;
  sig = CompanderD.ar(sig,3/4,1/2,1/2);
  sig = CombN.ar(sig,4,[4,8,16],32)+sig;
  sig = GVerb.ar(LPF.ar(sig,7000)+HPF.ar(sig,300),100,[3,4],spread:[95,96])/4 + sig;
  low = CompanderD.ar(LPF.ar(sig,LFNoise2.kr(1/2!2).range(100,800)),3/4,1/2,1/2);
  mid = CompanderD.ar(BPF.ar(sig,LFNoise2.kr(1/2!2).range(700,1500),2),3/4,1/2,1/2);
  high = CompanderD.ar(HPF.ar(sig,LFNoise2.kr(1/2!2).range(1000,10000)),3/4,1/2,1/2);
  sig = CompanderD.ar((high+mid+low).flat,3/4,1/1.1,1/1.1);
  Splay.ar(sig,0.75,~n8);
};
~ff.play;
);" ], [ 906.335562973, 'alex', "(
~n1[0]={
	var sig;
	var env=EnvGen.kr(Env([0,1,1,0],[0.001,0.2,0.001],\\welch),\\trig.tr);
	var fenv=EnvGen.kr(Env([\\freq.kr,\\freq.kr*\\top.kr(4),\\freq.kr],[0.01,0.04],\\welch),\\trig.tr);
	
	sig=LFSaw.ar(fenv+fib(4).reciprocal)+ClipNoise.ar([0.1,0.2]);
	sig=sig*env;
};
)" ], [ 897.010326499, 'alex', "~n1[30]=\\filter->{arg in; GVerb.ar(in,roomsize:20,revtime:0.2)};" ], [ 875.98248183, 'alex', "~n1.play(vol:0.1, fadeTime:2, numChannels:2).quant_(2);" ], [ 870.053456086, 'joach', "~testJa.stop(6);" ], [ 870.008433244, 'alex', "~n1[2]=\\set->Pbind(\\args, [\\freq], \\dur,1, \\freq, Pseq([65],inf));" ], [ 869.249930843, 'alex', "~n1[1]=\\set->Pbind(\\args, [\\trig], \\dur, 2, \\trig, 1);" ], [ 866.190359545, 'alex', "(
~n1[0]={
	var sig;
	var env=EnvGen.kr(Env([0,1,1,0],[0.001,0.2,0.001],\\welch),\\trig.tr);
	var fenv=EnvGen.kr(Env([\\freq.kr,\\freq.kr*\\top.kr(4),\\freq.kr],[0.01,0.04],\\welch),\\trig.tr);
	
	sig=LFSaw.ar(fenv+fib(4).reciprocal)+ClipNoise.ar([0.7,0.2]);
	sig=sig*env;
};
)" ], [ 859.37434545, 'kof', "(
~ff.quant=1;
~ff.fadeTime=1;
~ff={
  var high,mid,low;
  var sig = ~threew.ar;

  sig = Resonz.ar(sig,MouseX.kr(100,10000,(1..8)),MouseY.kr(0.1,1,(1..4)/16))/4;
  sig = CompanderD.ar(sig,3/4,1/2,1/2);
  sig = CombN.ar(sig,4,[4,8,16],32)+sig;
  sig = GVerb.ar(LPF.ar(sig,7000)+HPF.ar(sig,300),100,[3,4],spread:[95,96])/4 + sig;
  low = CompanderD.ar(LPF.ar(sig,LFNoise2.kr(1/2!2).range(100,800)),3/4,1/2,1/2);
  mid = CompanderD.ar(BPF.ar(sig,LFNoise2.kr(1/2!2).range(700,1500),2),3/4,1/2,1/2);
  high = CompanderD.ar(HPF.ar(sig,LFNoise2.kr(1/2!2).range(1000,10000)),3/4,1/2,1/2);
  sig = CompanderD.ar((high+mid+low).flat,3/4,1/1.1,1/1.1);
  Splay.ar(sig,0.75,~n8);
};
~ff.play;
);" ], [ 857.879302175, 'kof', "(
~threew.ar(2);
~threew.quant=2;
~threew.fadeTime=0.2;
~threew={
  var mod = Duty.kr(4,0,Dseq([1,2,1.5,1.25],inf)) ;
  //         |       |       |       |       |  
  var pat = [1,0,0,0,1,0,0,0,1,0,0,0,1,0,0,0].rotate(1);
  var imp = PulseDivider.kr(~tick.kr,[1,2,3,4],~counter.kr);
  var hit = Select.kr(PulseCount.kr(imp)%pat.size,pat);
  var env = EnvGen.ar(Env([0.001,1,0.0001],[0.002,0.5],[3,-3],curve:'exp'),imp * hit);
  var sig = [
  Pulse.ar(4),
  Pulse.ar(8),
  //SinOsc.ar(500!2/mod,mul:0.2) * Pulse.ar(4),
  SinOsc.ar(50!2),
  LFNoise2.ar(15000!2/mod),
  //SinOsc.ar(50!2),
  ];
  sig = Select.ar(PulseCount.kr(imp*hit)%sig.size,sig);
 // sig = sig * env;
  Splay.ar(sig,0.05,0.95);
};
~threew.play;
);" ], [ 836.89322459, 'joach', "~testJa[1] = \\set -> Pbind(\\args, [\\amp], \\amp, Pseq([0.9, 0.1], inf), \\dur, Pseq([0.5,0.5,0.25,0.25, Rest(8)], inf));" ], [ 817.970116491, 'joach', "~testJa[3] = \\filter -> {|in| GVerb.ar(in, \\gverb_size.kr(12), \\gverb_time.kr(1), 0.9, mul:\\mulgverb.kr(1)) };" ], [ 805.398449926, 'joach', "~testJa[2] = \\set -> Pbind(\\args, [\\freq], \\octave, 6, \\degree, Pseq([3,4,3,7], inf), \\dur, 16);" ], [ 801.660177246, 'kof', "~saw.stop(4);" ], [ 801.137762766, 'joach', "~testJa[2] = \\set -> Pbind(\\args, [\\freq], \\octave, 6, \\degree, Pseq([3,4,3,7], inf), \\dur, 4);" ], [ 794.911972686, 'joach', "~testJa[1] = \\set -> Pbind(\\args, [\\amp], \\amp, Pseq([0.9, 0.1], inf), \\dur, Pseq([0.5,0.5,0.25,0.25], inf));" ], [ 793.285256175, 'joach', "(
~testJa[0] = {
var osc = SinOsc.ar(( \\freq.kr(60) + \\fplus.kr(0) ), mul: 1, add: 0);
var noise = BrownNoise.ar(\\noise.kr(0), (1 - \\noise.kr(0)));
var sig = osc * noise;
Pan2.ar( sig * \\amp.kr(0), \\pan.kr(0) );
};
)" ], [ 791.527650408, 'joach', "~testJa/.play(vol: 0.5, fadeTime: 18);" ], [ 774.602664122, 'joach', "~testJa/.play(vol: 0.0, fadeTime: 8);" ], [ 769.576354966, 'joach', "~testJa[1] = \\set -> Pbind(\\args, [\\amp], \\amp, Pseq([0.9, 0.1], inf), \\dur, Pseq([0.5,0.5,0.25,0.25], inf));" ], [ 760.159711917, 'kof', "(
~saw.ar(2);
~saw.quant=2;
~saw.fadeTime=8.2;
~saw={
  //         |       |       |       |       |  
  var pat = [1,0,0,0,1,0,0,0,1,0,0,0,1,0,0,0].rotate(1);
  var imp = PulseDivider.kr(~tick.kr,1,~counter.kr);
  var hit = Select.kr(PulseCount.kr(imp)%pat.size,pat);
  var env = EnvGen.ar(Env([0.001,1,0.0001],[0.002,0.5],[3,-3],curve:'exp'),imp * hit);
  var sig = LFSaw.ar(50 + [1,2,3,4].reciprocal / [1,1.5,1.25,2]*1.5) * LFSaw.ar(1/16/[1,2,3,4]).exprange(0.001,1);
  sig = GVerb.ar(sig,100,10)/2+sig;
  //sig = sig * env;
  Splay.ar(sig,0.75,0.25);
};
~saw.play;
);" ], [ 751.77672669, 'joach', "~testJa[2] = \\set -> Pbind(\\args, [\\freq], \\octave, 6, \\degree, Pseq([3,4,3,7], inf), \\dur, 4);" ], [ 748.635433733, 'kof', "(
~threew.ar(2);
~threew.quant=2;
~threew.fadeTime=0.2;
~threew={
  var mod = Duty.kr(4,0,Dseq([1,2,1.5,1.25],inf)) ;
  //         |       |       |       |       |  
  var pat = [1,0,0,0,1,0,0,0,1,0,0,0,1,0,0,0].rotate(1);
  var imp = PulseDivider.kr(~tick.kr,[1,2,3,4],~counter.kr);
  var hit = Select.kr(PulseCount.kr(imp)%pat.size,pat);
  var env = EnvGen.ar(Env([0.001,1,0.0001],[0.002,0.5],[3,-3],curve:'exp'),imp * hit);
  var sig = [
  Pulse.ar(4),
  SinOsc.ar(500!2/mod,mul:0.2) * Pulse.ar(4),
  SinOsc.ar(50!2),
  LFNoise2.ar(1500!2/mod),
  //SinOsc.ar(50!2),
  ];
  sig = Select.ar(PulseCount.kr(imp*hit)%sig.size,sig);
  sig = sig * env;
  Splay.ar(sig,0.05,0.95);
};
);" ], [ 737.204114297, 'kof', "(
~threew.ar(2);
~threew.quant=2;
~threew.fadeTime=0.2;
~threew={
  var mod = Duty.kr(4,0,Dseq([1,2,1.5,1.25],inf)) ;
  //         |       |       |       |       |  
  var pat = [1,0,0,0,1,0,0,0,1,0,0,0,1,0,0,0].rotate(1);
  var imp = PulseDivider.kr(~tick.kr,1,~counter.kr);
  var hit = Select.kr(PulseCount.kr(imp)%pat.size,pat);
  var env = EnvGen.ar(Env([0.001,1,0.0001],[0.002,0.5],[3,-3],curve:'exp'),imp * hit);
  var sig = [
  Pulse.ar(4),
  SinOsc.ar(500!2/mod,mul:0.2) * Pulse.ar(4),
  SinOsc.ar(50!2),
  LFNoise2.ar(1500!2/mod),
  //SinOsc.ar(50!2),
  ];
  sig = Select.ar(PulseCount.kr(imp*hit)%sig.size,sig);
  //sig = sig * env;
  Splay.ar(sig,0.05,0.95);
};
~threew.play;
);" ], [ 736.492790436, 'joach', "~testJa2[1] = \\set -> Pbind(\\args, [\\freq], \\octave, 3, \\degree, Pseq([3,4,3,7], inf), \\dur, 4);" ], [ 731.903829433, 'joach', "~testJa2.play(vol: 0.2, fadeTime: 8);" ], [ 730.055899223, 'joach', "(
~testJa[0] = {
var osc = LFSaw.ar(( \\freq.kr(60) + \\fplus.kr(0) ), mul: 1, add: 0);
var noise = BrownNoise.ar(\\noise.kr(0), (1 - \\noise.kr(0)));
var sig = osc * noise;
Pan2.ar( sig * \\amp.kr(0), \\pan.kr(0) );
};
)" ], [ 722.244770499, 'kof', "(
~threew.ar(2);
~threew.quant=2;
~threew.fadeTime=0.2;
~threew={
  var mod = Duty.kr(4,0,Dseq([1,2,1.5,1.25],inf)) ;
  //         |       |       |       |       |  
  var pat = [1,0,0,0,1,0,0,0,1,0,0,0,1,0,0,0].rotate(1);
  var imp = PulseDivider.kr(~tick.kr,1,~counter.kr);
  var hit = Select.kr(PulseCount.kr(imp)%pat.size,pat);
  var env = EnvGen.ar(Env([0.001,1,0.0001],[0.002,0.5],[3,-3],curve:'exp'),imp * hit);
  var sig = [
  Pulse.ar(4),
  SinOsc.ar(5000!2/mod,mul:0.2) * Pulse.ar(4),
  SinOsc.ar(50!2),
  LFNoise2.ar(1500!2/mod),
  //SinOsc.ar(50!2),
  ];
  sig = Select.ar(PulseCount.kr(imp*hit)%sig.size,sig);
  //sig = sig * env;
  Splay.ar(sig,0.05,0.95);
};
~threew.play;
);" ], [ 720.863612306, 'kof', "(
~threew.ar(2);
~threew.quant=2;
~threew.fadeTime=0.2;
~threew={
  var mod = Duty.kr(4,0,Dseq([1,2,1.5,1.25],inf)) ;
  //         |       |       |       |       |  
  var pat = [1,0,0,0,1,0,0,0,1,0,0,0,1,0,0,0].rotate(1);
  var imp = PulseDivider.kr(~tick.kr,1,~counter.kr);
  var hit = Select.kr(PulseCount.kr(imp)%pat.size,pat);
  var env = EnvGen.ar(Env([0.001,1,0.0001],[0.002,0.5],[3,-3],curve:'exp'),imp * hit);
  var sig = [
  Pulse.ar(4),
  SinOsc.ar(5000!2/mod,mul:0.2) * Pulse.ar(4),
  SinOsc.ar(50!2),
  LFNoise2.ar(15000!2/mod),
  //SinOsc.ar(50!2),
  ];
  sig = Select.ar(PulseCount.kr(imp*hit)%sig.size,sig);
  //sig = sig * env;
  Splay.ar(sig,0.05,0.95);
};
~threew.play;
);" ], [ 708.424741142, 'joach', "~testJa.stop(6);" ], [ 705.475363343, 'joach', "~testJa[2] = \\set -> Pbind(\\args, [\\freq], \\octave, 3, \\degree, Pseq([3,4,3,7], inf), \\dur, 4);" ], [ 703.417544623, 'alex', "~n1.free(fadeTime:8);" ], [ 699.143124085, 'joach', "~testJa[1] = \\set -> Pbind(\\args, [\\amp], \\amp, Pseq([0.9, 0.1, 0.5, 0.2, 0.8, 0.1], inf), \\dur, Pseq([2,0.5,4.5,0.5], inf));" ], [ 688.471528564, 'kof', "(
~threew.ar(2);
~threew.quant=2;
~threew.fadeTime=0.2;
~threew={
  var mod = Duty.kr(4,0,Dseq([1,2,1.5,1.25],inf)) ;
  //         |       |       |       |       |  
  var pat = [1,0,0,0,1,0,0,0,1,0,0,0,1,0,0,0].rotate(1);
  var imp = PulseDivider.kr(~tick.kr,1,~counter.kr);
  var hit = Select.kr(PulseCount.kr(imp)%pat.size,pat);
  var env = EnvGen.ar(Env([0.001,1,0.0001],[0.002,0.5],[3,-3],curve:'exp'),imp * hit);
  var sig = [
  Pulse.ar(4),
  SinOsc.ar(5000!2/mod,mul:0.2) * Pulse.ar(4),
  SinOsc.ar(50!2),
  LFNoise2.ar(15000!2/mod),
  //SinOsc.ar(50!2),
  ];
  sig = Select.ar(PulseCount.kr(imp*hit)%sig.size,sig);
  //sig = sig * env;
  Splay.ar(sig,0.05,0.95);
};
~threew.play;
);" ], [ 682.328328016, 'joach', "~testJa[1] = \\set -> Pbind(\\args, [\\amp], \\amp, Pseq([0.9, 0.1], inf), \\dur, Pseq([2,0.5,4.5,0.5], inf));" ], [ 682.309750337, 'alex', "~n2.free(fadeTime:12);" ], [ 671.1350583, 'alex', "~n2.play(vol:0.3, fadeTime:2, numChannels:2).quant_(2);" ], [ 669.114117473, 'joach', "~testJa/.play(vol: 0.9, fadeTime: 8);" ], [ 666.767273075, 'alex', "~n2[33]=\\filter->{arg in; LPF.ar(in,\\lpf.kr(14000,2))};" ], [ 661.147203271, 'joach', "~testJa[1] = \\set -> Pbind(\\args, [\\amp], \\amp, Pseq([0.9, 0.1], inf), \\dur, Pseq([2,0.5,1.5,0.5], inf));" ], [ 658.344658515, 'alex', "~n1[33]=\\filter->{arg in; LPF.ar(in,\\lpf.kr(400,2))};" ], [ 640.788801813, 'alex', "~n2[1]=\\set->Pbind(\\args, [\\trig], \\dur,Pseq([Pn(0.25,8),Rest(2)],inf), \\trig, 1);" ], [ 638.925496825, 'kof', "(
  p.clock.tempo_(240/60);
  
  ~offset = (0..7)/8;
  
  ~tick.quant = 1;
  ~tick = {Mix(Impulse.kr( ~tempo / 2 , ~offset ))};
  
  ~counter = {PulseCount.kr(~tick.kr)};
);" ], [ 637.989594907, 'joach', "~testJa[1] = \\set -> Pbind(\\args, [\\amp], \\amp, Pseq([0.7, 0.1], inf), \\dur, Pseq([2,0.5,1.5,0.5], inf));" ], [ 627.181104889, 'joach', "~testJa[2] = \\set -> Pbind(\\args, [\\freq], \\octave, 4, \\degree, Pseq([3,4,3,7], inf), \\dur, 4);" ], [ 626.681173944, 'alex', "~n2[33]=nil;" ], [ 613.432445761, 'kof', "(
~threew.ar(2);
~threew.quant=2;
~threew.fadeTime=0.2;
~threew={
  //         |       |       |       |       |  
  var pat = [1,0,0,0,1,0,0,0,1,0,0,0,1,0,0,0].rotate(1);
  var imp = PulseDivider.kr(~tick.kr,1,~counter.kr);
  var hit = Select.kr(PulseCount.kr(imp)%pat.size,pat);
  var env = EnvGen.ar(Env([0.001,1,0.0001],[0.002,0.5],[3,-3],curve:'exp'),imp * hit);
  var sig = [
  Pulse.ar(4),
  SinOsc.ar(5000!2,mul:0.1),
  SinOsc.ar(50!2),
  LFNoise2.ar(15000!2),
  //SinOsc.ar(50!2),
  ];
  sig = Select.ar(PulseCount.kr(imp*hit)%sig.size,sig);
  //sig = sig * env;
  Splay.ar(sig,0.75,0.95);
};
~threew.play;
);" ], [ 606.562084467, 'alex', "~n2[33]=\\filter->{arg in; LPF.ar(in,\\lpf.kr(14000,2))};" ], [ 603.661676612, 'kof', "(
~threew.ar(2);
~threew.quant=2;
~threew.fadeTime=0.2;
~threew={
  //         |       |       |       |       |  
  var pat = [1,0,0,0,1,0,0,0,1,0,0,0,1,0,0,0].rotate(1);
  var imp = PulseDivider.kr(~tick.kr,1,~counter.kr);
  var hit = Select.kr(PulseCount.kr(imp)%pat.size,pat);
  var env = EnvGen.ar(Env([0.001,1,0.0001],[0.002,0.5],[3,-3],curve:'exp'),imp * hit);
  var sig = [
  SinOsc.ar(50!2),
  SinOsc.ar(5000!2,mul:0.1),
  SinOsc.ar(50!2),
  LFNoise2.ar(15000!2),
  //SinOsc.ar(50!2),
  ];
  sig = Select.ar(PulseCount.kr(imp*hit)%sig.size,sig);
  //sig = sig * env;
  Splay.ar(sig,0.75,0.95);
};
~threew.play;
);" ], [ 602.841886892, 'alex', "~n2[33]=\\filter->{arg in; LPF.ar(in,\\lpf.kr(10400,2))};" ], [ 599.782127287, 'alex', "~n2[33]=\\filter->{arg in; LPF.ar(in,\\lpf.kr(1400,2))};" ], [ 596.715373563, 'alex', "~n2[33]=\\filter->{arg in; LPF.ar(in,\\lpf.kr(400,2))};" ], [ 596.318968399, 'kof', "(
~threew.ar(2);
~threew.quant=2;
~threew.fadeTime=0.2;
~threew={
  //         |       |       |       |       |  
  var pat = [1,0,0,0,1,0,0,0,1,0,0,0,1,0,0,0].rotate(1);
  var imp = PulseDivider.kr(~tick.kr,1,~counter.kr);
  var hit = Select.kr(PulseCount.kr(imp)%pat.size,pat);
  var env = EnvGen.ar(Env([0.001,1,0.0001],[0.002,0.5],[3,-3],curve:'exp'),imp * hit);
  var sig = [
  SinOsc.ar(50!2),
  SinOsc.ar(5000!2,mul:0.1),
  SinOsc.ar(50!2),
  LFNoise2.ar(15000!2),
  //SinOsc.ar(50!2),
  ];
  sig = Select.ar(PulseCount.kr(imp*hit)%sig.size,sig);
  //sig = sig * env;
  Splay.ar(sig,0.75,0.5);
};
~threew.play;
);" ], [ 592.91443364, 'kof', "(
~threew.ar(2);
~threew.quant=2;
~threew.fadeTime=0.2;
~threew={
  //         |       |       |       |       |  
  var pat = [1,0,0,0,1,0,0,0,1,0,0,0,1,0,0,0].rotate(1);
  var imp = PulseDivider.kr(~tick.kr,1,~counter.kr);
  var hit = Select.kr(PulseCount.kr(imp)%pat.size,pat);
  var env = EnvGen.ar(Env([0.001,1,0.0001],[0.002,0.5],[3,-3],curve:'exp'),imp * hit);
  var sig = [
  SinOsc.ar(50!2),
  SinOsc.ar(5000!2,mul:0.1),
  SinOsc.ar(50!2),
  LFNoise2.ar(15000!2),
  //SinOsc.ar(50!2),
  ];
  sig = Select.ar(PulseCount.kr(imp*hit)%sig.size,sig);
  sig = sig * env;
  Splay.ar(sig,0.75,0.5);
};
~threew.play;
);" ], [ 588.727273118, 'kof', "~one.clear;" ], [ 588.189700323, 'alex', "~n2[30]=\\filter->{arg in; GVerb.ar(in,roomsize:20,revtime:0.2)};" ], [ 573.204771882, 'alex', "~n2[1]=\\set->Pbind(\\args, [\\trig], \\dur,Pseq([Pn(0.5,8),Rest(2)],inf), \\trig, 1);" ], [ 572.623517727, 'kof', "(
~one.ar(2);
~one.quant=2;
~one.fadeTime=0.2;
~one={
  //         |       |       |       |       |  
  var pat = [1,0,0,0,1,0,0,0,1,0,0,0,1,0,0,0].rotate(1);
  var imp = PulseDivider.kr(~tick.kr,[8,4,3,4],~counter.kr);
  var hit = Select.kr(PulseCount.kr(imp)%pat.size,pat);
  var env = EnvGen.ar(Env([0.001,1,0.0001],[0.002,1.5],[3,-3],curve:'exp'),imp * hit);
  var sig = SinOsc.ar(50!2 + (env**200*100));
  sig = sig * env;
  Splay.ar(sig,0.75,0.95);
};
~one.play;
);" ], [ 572.57525259, 'joach', "~testJa/.play(vol: 0.5, fadeTime: 28);" ], [ 566.576772208, 'joach', "~testJa[2] = \\set -> Pbind(\\args, [\\freq], \\octave, 5, \\degree, Pseq([3,4,3,7], inf), \\dur, 4);" ], [ 561.574702837, 'kof', "~saw.stop(4);" ], [ 560.944931492, 'alex', "~n2[2]=\\set->Pbind(\\args, [\\freq], \\dur,2, \\freq, Pseq([11000],inf));" ], [ 558.275686345, 'joach', "~testJa[1] = \\set -> Pbind(\\args, [\\amp], \\amp, Pseq([0.7, 0.1], inf), \\dur, Pseq([1,0.5,1.5,0.5], inf));" ], [ 548.130252116, 'alex', "~n2[1]=\\set->Pbind(\\args, [\\trig], \\dur,Pseq([Pn(1,7),Rest(2)],inf), \\trig, 1);" ], [ 539.858933704, 'kof', "(
~threew.ar(2);
~threew.quant=2;
~threew.fadeTime=0.2;
~threew={
  //         |       |       |       |       |  
  var pat = [1,0,0,0,1,0,0,0,1,0,0,0,1,0,0,0].rotate(1);
  var imp = PulseDivider.kr(~tick.kr,1,~counter.kr);
  var hit = Select.kr(PulseCount.kr(imp)%pat.size,pat);
  var env = EnvGen.ar(Env([0.001,1,0.0001],[0.002,0.5],[3,-3],curve:'exp'),imp * hit);
  var sig = [
  SinOsc.ar(50!2),
  SinOsc.ar(5000!2,mul:0.1),
  SinOsc.ar(50!2),
  LFNoise2.ar(15000!2),
  //SinOsc.ar(50!2),
  ];
  sig = Select.ar(PulseCount.kr(imp*hit)%sig.size,sig);
  sig = sig * env;
  Splay.ar(sig,0.75,0.5);
};
~threew.play;
);" ], [ 534.767143179, 'alex', "~n1[33]=\\filter->{arg in; LPF.ar(in,\\lpf.kr(200,2))};" ], [ 532.605621169, 'joach', "~testJa[1] = \\set -> Pbind(\\args, [\\amp], \\amp, Pseq([0.7, 0.1], inf), \\dur, 1);" ], [ 526.671317129, 'alex', "~n1[33]=\\filter->{arg in; LPF.ar(in,\\lpf.kr(900,2))};" ], [ 519.23051757, 'alex', "~n1[33]=\\filter->{arg in; LPF.ar(in,\\lpf.kr(800,2))};" ], [ 512.299706229, 'joach', "~testJa2.play(vol: 0.2, fadeTime: 8);" ], [ 507.382338317, 'joach', "(\\octave:3, \\amp:0.8).play" ], [ 505.638351627, 'joach', "(\\octave:3, \\amp:0.8).play" ], [ 504.365672526, 'alex', "~n1[2]=\\set->Pbind(\\args, [\\freq], \\dur,1, \\freq, Pseq([25],inf));" ], [ 501.488950233, 'joach', "~testJa/.play(vol: 0.3, fadeTime: 28);" ], [ 496.707603833, 'alex', "~n1[2]=\\set->Pbind(\\args, [\\freq], \\dur,1, \\freq, Pseq([95],inf));" ], [ 491.790431774, 'alex', "~n1[2]=\\set->Pbind(\\args, [\\freq], \\dur,1, \\freq, Pseq([85],inf));" ], [ 488.925962398, 'joach', "~testJa/.play(vol: 0.2, fadeTime: 8);" ], [ 486.857224195, 'joach', "~testJa[2] = \\set -> Pbind(\\args, [\\freq], \\octave, 4, \\degree, Pseq([3,4,3,7], inf), \\dur, 4);" ], [ 484.458496514, 'alex', "~n1[2]=\\set->Pbind(\\args, [\\freq], \\dur,1, \\freq, Pseq([65],inf));" ], [ 474.725044679, 'kof', "(
~saw.ar(2);
~saw.quant=2;
~saw.fadeTime=8.2;
~saw={
  //         |       |       |       |       |  
  var pat = [1,0,0,0,1,0,0,0,1,0,0,0,1,0,0,0].rotate(1);
  var imp = PulseDivider.kr(~tick.kr,1,~counter.kr);
  var hit = Select.kr(PulseCount.kr(imp)%pat.size,pat);
  var env = EnvGen.ar(Env([0.001,1,0.0001],[0.002,0.5],[3,-3],curve:'exp'),imp * hit);
  var sig = LFSaw.ar(50 + [1,2,3,4].reciprocal / [1,1.5,1.25,2]*1.5) * LFSaw.ar(1/16/[1,2,3,4]).exprange(0.001,1);
  sig = GVerb.ar(sig,100,10)/2+sig;
  //sig = sig * env;
  Splay.ar(sig,0.75,0.25);
};
~saw.play;
);" ], [ 465.996533862, 'joach', "~testJa/.play(vol: 0.2, fadeTime: 8);" ], [ 463.478035006, 'alex', "~n2[1]=\\set->Pbind(\\args, [\\trig], \\dur,Pseq([Pn(2,2),Rest(2)],inf), \\trig, 1);" ], [ 457.149108266, 'joach', "~testJa/.play(vol: 0.5, fadeTime: 8);" ], [ 446.122631171, 'joach', "(\\octave:4, \\amp:0.8).play" ], [ 444.270852029, 'joach', "~testJa[1] = \\set -> Pbind(\\args, [\\amp], \\amp, Pseq([0.7, 0.1], inf), \\dur, 2);" ], [ 444.147932915, 'kof', "(
~saw.ar(2);
~saw.quant=2;
~saw.fadeTime=8.2;
~saw={
  //         |       |       |       |       |  
  var pat = [1,0,0,0,1,0,0,0,1,0,0,0,1,0,0,0].rotate(1);
  var imp = PulseDivider.kr(~tick.kr,1,~counter.kr);
  var hit = Select.kr(PulseCount.kr(imp)%pat.size,pat);
  var env = EnvGen.ar(Env([0.001,1,0.0001],[0.002,0.5],[3,-3],curve:'exp'),imp * hit);
  var sig = LFSaw.ar(50 + [1,2,3,4].reciprocal / [1,1.5,1.25,2]*1.5) * LFSaw.ar(1/16/[1,2,3,4]).exprange(0.001,1);
  sig = GVerb.ar(sig,100,10)/2+sig;
  //sig = sig * env;
  Splay.ar(sig,0.75,0.95);
};
~saw.play;
);" ], [ 440.76919393, 'joach', "(\\octave:4, \\amp:0.8).play" ], [ 440.722374632, 'alex', "~n2[2]=\\set->Pbind(\\args, [\\freq], \\dur,2, \\freq, Pseq([1800],inf));" ], [ 437.279151044, 'joach', "~testJa2.play(vol: 0.0, fadeTime: 8);" ], [ 423.052906391, 'alex', "~n2[2]=\\set->Pbind(\\args, [\\freq], \\dur,2, \\freq, Pseq([3,2],inf));" ], [ 422.159401004, 'alex', "~n2[1]=\\set->Pbind(\\args, [\\trig], \\dur, 2, \\trig, 1);" ], [ 421.990690427, 'joach', "~testJa[1] = \\set -> Pbind(\\args, [\\amp], \\amp, Pseq([0.7, 0.1], inf), \\dur, 4);" ], [ 419.545042761, 'alex', "(
~n2[0]={
	var sig;
	var env=EnvGen.kr(Env([0,1,0],[0.001,0.1],\\welch),\\trig.tr);
	
	sig=HPF.ar(WhiteNoise.ar(0.8),\\freq.kr);
	sig=Pan2.ar(sig,SinOsc.kr(0.25));
	sig=sig*env;
};
)" ], [ 418.947153941, 'kof', "~one.clear;" ], [ 404.298128646, 'joach', "~testJa[2] = \\set -> Pbind(\\args, [\\freq], \\octave, 3, \\degree, Pseq([3,4,3,7], inf), \\dur, 4);" ], [ 398.866287552, 'alex', "~n2.free(fadeTime:0.2);" ], [ 394.574979158, 'kof', "(
~one.ar(2);
~one.quant=2;
~one.fadeTime=0.2;
~one={
  //         |       |       |       |       |  
  var pat = [1,0,0,0,1,0,0,0,1,0,0,0,1,0,0,0].rotate(1);
  var imp = PulseDivider.kr(~tick.kr,[8,4,3,4],~counter.kr);
  var hit = Select.kr(PulseCount.kr(imp)%pat.size,pat);
  var env = EnvGen.ar(Env([0.001,1,0.0001],[0.002,4.5],[3,-3],curve:'exp'),imp * hit);
  var sig = SinOsc.ar(50!2 + (env**200*1000));
  sig = sig * env;
  Splay.ar(sig,0.75,0.95);
};
~one.play;
);" ], [ 392.193793861, 'alex', "~n3.free(fadeTime:0.1);" ], [ 387.500439065, 'kof', "(
~one.ar(2);
~one.quant=2;
~one.fadeTime=0.2;
~one={
  //         |       |       |       |       |  
  var pat = [1,0,0,0,1,0,0,0,1,0,0,0,1,0,0,0].rotate(1);
  var imp = PulseDivider.kr(~tick.kr,[8,4,3,4],~counter.kr);
  var hit = Select.kr(PulseCount.kr(imp)%pat.size,pat);
  var env = EnvGen.ar(Env([0.001,1,0.0001],[0.002,4.5],[3,-3],curve:'exp'),imp * hit);
  var sig = SinOsc.ar(50!2 + (env**20*1000));
  sig = sig * env;
  Splay.ar(sig,0.75,0.95);
};
~one.play;
);" ], [ 384.313345116, 'joach', "~testJa[1] = \\set -> Pbind(\\args, [\\amp], \\amp, Pseq([0.3, 0.1], inf), \\dur, 8);" ], [ 381.482387961, 'joach', "(
~testJa[0] = {
var osc = SinOsc.ar(( \\freq.kr(60) + \\fplus.kr(0) ), mul: 1, add: 0);
var noise = BrownNoise.ar(\\noise.kr(0), (1 - \\noise.kr(0)));
var sig = osc * noise;
Pan2.ar( sig * \\amp.kr(0), \\pan.kr(0) );
};
)" ], [ 379.876953882, 'kof', "(
~one.ar(2);
~one.quant=2;
~one.fadeTime=0.2;
~one={
  //         |       |       |       |       |  
  var pat = [1,0,0,0,1,0,0,0,1,0,0,0,1,0,0,0].rotate(1);
  var imp = PulseDivider.kr(~tick.kr,[8,4,3,4],~counter.kr);
  var hit = Select.kr(PulseCount.kr(imp)%pat.size,pat);
  var env = EnvGen.ar(Env([0.001,1,0.0001],[0.002,4.5],[3,-3],curve:'exp'),imp * hit);
  var sig = SinOsc.ar(50!2 + (env**20*1000));
  sig = sig * env;
  Splay.ar(sig,0.75,0.5);
};
~one.play;
);" ], [ 378.859184418, 'joach', "~testJa/.play(vol: 0.1, fadeTime: 8);" ], [ 372.628984086, 'joach', "(\\octave:4, \\amp:0.8).play" ], [ 364.547076342, 'joach', "(\\octave:4, \\amp:0.8).play" ], [ 357.666523381, 'joach', "(\\octave:3, \\amp:0.8).play" ], [ 350.244654444, 'joach', "(\\octave:5, \\amp:0.8).play" ], [ 347.849079932, 'kof', "(
~one.ar(2);
~one.quant=2;
~one.fadeTime=0.2;
~one={
  //         |       |       |       |       |  
  var pat = [1,0,0,0,1,0,0,0,1,0,0,0,1,0,0,0].rotate(1);
  var imp = PulseDivider.kr(~tick.kr,8,~counter.kr);
  var hit = Select.kr(PulseCount.kr(imp)%pat.size,pat);
  var env = EnvGen.ar(Env([0.001,1,0.0001],[0.002,4.5],[3,-3],curve:'exp'),imp * hit);
  var sig = SinOsc.ar(50!2 + (env**20*1000));
  sig = sig * env;
  Splay.ar(sig,0.75,0.5);
};
~one.play;
);" ], [ 341.179465087, 'joach', "(\\octave:3, \\amp:0.8).play" ], [ 315.810058334, 'kof', "(
~saw.ar(2);
~saw.quant=2;
~saw.fadeTime=8.2;
~saw={
  //         |       |       |       |       |  
  var pat = [1,0,0,0,1,0,0,0,1,0,0,0,1,0,0,0].rotate(1);
  var imp = PulseDivider.kr(~tick.kr,1,~counter.kr);
  var hit = Select.kr(PulseCount.kr(imp)%pat.size,pat);
  var env = EnvGen.ar(Env([0.001,1,0.0001],[0.002,0.5],[3,-3],curve:'exp'),imp * hit);
  var sig = LFSaw.ar(50 + [1,2,3,4].reciprocal / [1,1.5,1.25,2]*2) * LFSaw.ar(1/16/[1,2,3,4]).exprange(0.001,1);
  sig = GVerb.ar(sig,100,10)/2+sig;
  //sig = sig * env;
  Splay.ar(sig,0.75,0.95);
};
~saw.play;
);" ], [ 305.894184333, 'alex', "~n1.play(vol:0.4, fadeTime:2, numChannels:2).quant_(2);" ], [ 300.870591196, 'kof', "(
~saw.ar(2);
~saw.quant=2;
~saw.fadeTime=8.2;
~saw={
  //         |       |       |       |       |  
  var pat = [1,0,0,0,1,0,0,0,1,0,0,0,1,0,0,0].rotate(1);
  var imp = PulseDivider.kr(~tick.kr,1,~counter.kr);
  var hit = Select.kr(PulseCount.kr(imp)%pat.size,pat);
  var env = EnvGen.ar(Env([0.001,1,0.0001],[0.002,0.5],[3,-3],curve:'exp'),imp * hit);
  var sig = LFSaw.ar(50 + [1,2,3,4].reciprocal / [1,1.5,1.25,2]*2) * LFSaw.ar(1/16/[1,2,3,4]).exprange(0.001,1);
  sig = GVerb.ar(sig,100,10)/4+sig;
  //sig = sig * env;
  Splay.ar(sig,0.75,0.95);
};
~saw.play;
);" ], [ 294.300661853, 'alex', "~n1.play(vol:0.2, fadeTime:2, numChannels:2).quant_(2);" ], [ 292.726216229, 'kof', "(
~saw.ar(2);
~saw.quant=2;
~saw.fadeTime=8.2;
~saw={
  //         |       |       |       |       |  
  var pat = [1,0,0,0,1,0,0,0,1,0,0,0,1,0,0,0].rotate(1);
  var imp = PulseDivider.kr(~tick.kr,1,~counter.kr);
  var hit = Select.kr(PulseCount.kr(imp)%pat.size,pat);
  var env = EnvGen.ar(Env([0.001,1,0.0001],[0.002,0.5],[3,-3],curve:'exp'),imp * hit);
  var sig = LFSaw.ar(50 + [1,2,3,4].reciprocal / [1,1.5,1.25,2]*2) * LFSaw.ar(1/16/[1,2,3,4]).exprange(0.001,1);
  sig = GVerb.ar(sig,100,10)/8+sig;
  //sig = sig * env;
  Splay.ar(sig,0.75,0.95);
};
~saw.play;
);" ], [ 288.623813642, 'alex', "~n1[30]=\\filter->{arg in; GVerb.ar(in,roomsize:20)};" ], [ 285.254343899, 'alex', "~n1[33]=\\filter->{arg in; LPF.ar(in,\\lpf.kr(400,2))};" ], [ 284.230613596, 'alex', "~n1[30]=\\filter->{arg in; GVerb.ar(in,roomsize:40)};" ], [ 283.403838387, 'alex', "~n1[2]=\\set->Pbind(\\args, [\\freq], \\dur,1, \\freq, Pseq([45],inf));" ], [ 282.363441222, 'alex', "~n1[1]=\\set->Pbind(\\args, [\\trig], \\dur, 4, \\trig, 1);" ], [ 281.792439562, 'kof', "(
~saw.ar(2);
~saw.quant=2;
~saw.fadeTime=8.2;
~saw={
  //         |       |       |       |       |  
  var pat = [1,0,0,0,1,0,0,0,1,0,0,0,1,0,0,0].rotate(1);
  var imp = PulseDivider.kr(~tick.kr,1,~counter.kr);
  var hit = Select.kr(PulseCount.kr(imp)%pat.size,pat);
  var env = EnvGen.ar(Env([0.001,1,0.0001],[0.002,0.5],[3,-3],curve:'exp'),imp * hit);
  var sig = LFSaw.ar(50 + [1,2,3,4].reciprocal / [1,1.5,1.25,2]*1.75) * LFSaw.ar(1/16/[1,2,3,4]).exprange(0.001,1);
  sig = GVerb.ar(sig,100,10)/8+sig;
  //sig = sig * env;
  Splay.ar(sig,0.75,0.95);
};
~saw.play;
);" ], [ 278.975381443, 'alex', "(
~n1[0]={
	var sig;
	var env=EnvGen.kr(Env([0,1,1,0],[0.001,0.2,0.001],\\welch),\\trig.tr);
	var fenv=EnvGen.kr(Env([\\freq.kr,\\freq.kr*\\top.kr(4),\\freq.kr],[0.01,0.04],\\welch),\\trig.tr);
	
	sig=LFSaw.ar(fenv+fib(4).reciprocal)+ClipNoise.ar([0.7,0.2]);
	sig=sig*env;
};
)" ], [ 265.368004388, 'kof', "(
~saw.ar(2);
~saw.quant=2;
~saw.fadeTime=8.2;
~saw={
  //         |       |       |       |       |  
  var pat = [1,0,0,0,1,0,0,0,1,0,0,0,1,0,0,0].rotate(1);
  var imp = PulseDivider.kr(~tick.kr,1,~counter.kr);
  var hit = Select.kr(PulseCount.kr(imp)%pat.size,pat);
  var env = EnvGen.ar(Env([0.001,1,0.0001],[0.002,0.5],[3,-3],curve:'exp'),imp * hit);
  var sig = LFSaw.ar(50 + [1,2,3,4].reciprocal / [1,1.5,1.25,2]*1.25) * LFSaw.ar(1/16/[1,2,3,4]).exprange(0.001,1);
  sig = GVerb.ar(sig,100,10)/8+sig;
  //sig = sig * env;
  Splay.ar(sig,0.75,0.95);
};
~saw.play;
);" ], [ 256.821368784, 'kof', "(
~saw.ar(2);
~saw.quant=2;
~saw.fadeTime=16.2;
~saw={
  //         |       |       |       |       |  
  var pat = [1,0,0,0,1,0,0,0,1,0,0,0,1,0,0,0].rotate(1);
  var imp = PulseDivider.kr(~tick.kr,1,~counter.kr);
  var hit = Select.kr(PulseCount.kr(imp)%pat.size,pat);
  var env = EnvGen.ar(Env([0.001,1,0.0001],[0.002,0.5],[3,-3],curve:'exp'),imp * hit);
  var sig = LFSaw.ar(50 + [1,2,3,4].reciprocal / [1,1.5,1.25,2]*1.25) * LFSaw.ar(1/16/[1,2,3,4]).exprange(0.001,1);
  sig = GVerb.ar(sig,100,10)/8+sig;
  //sig = sig * env;
  Splay.ar(sig,0.75,0.95);
};
~saw.play;
);" ], [ 245.364667892, 'alex', "~n2.free(fadeTime:8);" ], [ 237.22483567, 'kof', "(
~saw.ar(2);
~saw.quant=2;
~saw.fadeTime=16.2;
~saw={
  //         |       |       |       |       |  
  var pat = [1,0,0,0,1,0,0,0,1,0,0,0,1,0,0,0].rotate(1);
  var imp = PulseDivider.kr(~tick.kr,1,~counter.kr);
  var hit = Select.kr(PulseCount.kr(imp)%pat.size,pat);
  var env = EnvGen.ar(Env([0.001,1,0.0001],[0.002,0.5],[3,-3],curve:'exp'),imp * hit);
  var sig = LFSaw.ar(50 + [1,2,3,4].reciprocal / [1,1.5,1.25,2]*1.5) * LFSaw.ar(1/16/[1,2,3,4]).exprange(0.001,1);
  sig = GVerb.ar(sig,100,10)/8+sig;
  //sig = sig * env;
  Splay.ar(sig,0.75,0.95);
};
~saw.play;
);" ], [ 230.521761096, 'joach', "(\\octave:3, \\amp:0.8).play" ], [ 228.598550031, 'joach', "~testJa.stop(6);" ], [ 222.547276877, 'joach', "(\\octave:3, \\amp:0.8).play" ], [ 217.90895511, 'alex', "~n2.play(vol:0.8, fadeTime:2, numChannels:2).quant_(2);" ], [ 216.481848729, 'joach', "(\\octave:4, \\amp:0.8).play" ], [ 216.254189652, 'joach', "(\\octave:4, \\amp:0.8).play" ], [ 214.931732736, 'alex', "~n2[33]=\\filter->{arg in; LPF.ar(in,\\lpf.kr(1400,2))};" ], [ 214.170535349, 'alex', "~n2[30]=\\filter->{arg in; GVerb.ar(in,roomsize:40)};" ], [ 212.954570161, 'alex', "~n2[2]=\\set->Pbind(\\args, [\\freq], \\dur,32, \\freq, Pseq([3,2],inf));" ], [ 212.026425614, 'kof', "(
~saw.ar(2);
~saw.quant=2;
~saw.fadeTime=4.2;
~saw={
  //         |       |       |       |       |  
  var pat = [1,0,0,0,1,0,0,0,1,0,0,0,1,0,0,0].rotate(1);
  var imp = PulseDivider.kr(~tick.kr,1,~counter.kr);
  var hit = Select.kr(PulseCount.kr(imp)%pat.size,pat);
  var env = EnvGen.ar(Env([0.001,1,0.0001],[0.002,0.5],[3,-3],curve:'exp'),imp * hit);
  var sig = LFSaw.ar(50 + [1,2,3,4].reciprocal / [1,1.5,1.25,2]) * LFSaw.ar(1/16/[1,2,3,4]).exprange(0.001,1);
  sig = GVerb.ar(sig,100,10)/8+sig;
  //sig = sig * env;
  Splay.ar(sig,0.75,0.95);
};
~saw.play;
);" ], [ 209.870472202, 'joach', "(\\octave:4, \\amp:0.8).play" ], [ 208.425975394, 'alex', "~n2[1]=\\set->Pbind(\\args, [\\trig], \\dur, 16, \\trig, 1);" ], [ 205.488681946, 'alex', "(
~n2[0]={
	var sig;
	var env=EnvGen.kr(Env([0,1,0],[16,0.001],\\welch),\\trig.tr);
	var fenv=EnvGen.kr(Env([\\freq.kr,\\freq.kr*\\top.kr(4),\\freq.kr],[16,0.04],\\welch),\\trig.tr);
	
	sig=WhiteNoise.ar(0.2)*LFSaw.kr(fenv);
	sig=Pan2.ar(sig,SinOsc.kr(0.25));
	sig=sig*env;
};
)" ], [ 202.041954768, 'joach', "(\\octave:4, \\amp:0.8).play" ], [ 201.687343083, 'kof', "(
~saw.ar(2);
~saw.quant=2;
~saw.fadeTime=4.2;
~saw={
  //         |       |       |       |       |  
  var pat = [1,0,0,0,1,0,0,0,1,0,0,0,1,0,0,0].rotate(1);
  var imp = PulseDivider.kr(~tick.kr,1,~counter.kr);
  var hit = Select.kr(PulseCount.kr(imp)%pat.size,pat);
  var env = EnvGen.ar(Env([0.001,1,0.0001],[0.002,0.5],[3,-3],curve:'exp'),imp * hit);
  var sig = LFSaw.ar(50 + [1,2,3,4].reciprocal / [1,1.5,1.25,2]) * LFSaw.ar(1/16/[1,2,3,4]).exprange(0.001,1) + Dust.ar(16);
  sig = GVerb.ar(sig,100,10)/8+sig;
  //sig = sig * env;
  Splay.ar(sig,0.75,0.95);
};
~saw.play;
);" ], [ 198.560541079, 'joach', "(\\octave:3, \\amp:0.8).play" ], [ 195.406537595, 'alex', "~n2.free(fadeTime:8);" ], [ 192.79408978, 'joach', "(\\octave:3, \\amp:0.8).play" ], [ 192.555168934, 'joach', "(\\octave:3, \\amp:0.8).play" ], [ 190.37617723, 'alex', "~n3.free(fadeTime:8);" ], [ 185.642554939, 'joach', "(\\octave:3, \\amp:0.8).play" ], [ 179.126193947, 'joach', "(\\octave:3, \\amp:0.8).play" ], [ 178.084163127, 'joach', "~testJa[1] = \\set -> Pbind(\\args, [\\amp], \\amp, Pseq([0.3, 0.1], inf), \\dur, 8);" ], [ 176.445990162, 'kof', "(
~saw.ar(2);
~saw.quant=2;
~saw.fadeTime=4.2;
~saw={
  //         |       |       |       |       |  
  var pat = [1,0,0,0,1,0,0,0,1,0,0,0,1,0,0,0].rotate(1);
  var imp = PulseDivider.kr(~tick.kr,1,~counter.kr);
  var hit = Select.kr(PulseCount.kr(imp)%pat.size,pat);
  var env = EnvGen.ar(Env([0.001,1,0.0001],[0.002,0.5],[3,-3],curve:'exp'),imp * hit);
  var sig = LFSaw.ar(50 + [1,2,3,4].reciprocal / [1,1.5,1.25,2]) * LFSaw.ar(1/16/[1,2,3,4]).exprange(0.001,1);
  sig = GVerb.ar(sig,100,10)/8+sig;
  //sig = sig * env;
  Splay.ar(sig,0.75,0.95);
};
~saw.play;
);" ], [ 174.26393658, 'joach', "(
~testJa[0] = {
var osc = SinOsc.ar(( \\freq.kr(60) + \\fplus.kr(0) ), mul: 1, add: 0);
var noise = BrownNoise.ar(\\noise.kr(0), (1 - \\noise.kr(0)));
var sig = osc * noise;
Pan2.ar( sig * \\amp.kr(0), \\pan.kr(0) );
};
)" ], [ 173.967815642, 'alex', "~n3.play(vol:0.1, fadeTime:2, numChannels:2).quant_(2);" ], [ 172.295537803, 'joach', "~testJa/.play(vol: 0.1, fadeTime: 8);" ], [ 166.6715414, 'joach', "~testJa[1] = \\set -> Pbind(\\args, [\\amp], \\amp, Pseq([0.3, 0.1], inf), \\dur, 8);" ], [ 166.268874889, 'kof', "(
~saw.ar(2);
~saw.quant=2;
~saw.fadeTime=4.2;
~saw={
  //         |       |       |       |       |  
  var pat = [1,0,0,0,1,0,0,0,1,0,0,0,1,0,0,0].rotate(1);
  var imp = PulseDivider.kr(~tick.kr,1,~counter.kr);
  var hit = Select.kr(PulseCount.kr(imp)%pat.size,pat);
  var env = EnvGen.ar(Env([0.001,1,0.0001],[0.002,0.5],[3,-3],curve:'exp'),imp * hit);
  var sig = LFSaw.ar(50 + [1,2,3,4].reciprocal / [1,1.5,1.25,2]) * LFSaw.ar(1/16/[1,2,3,4]).exprange(0.001,1);
  sig = GVerb.ar(sig,100,10)/8+sig;
  //sig = sig * env;
  Splay.ar(sig,0.75,0.75);
};
~saw.play;
);" ], [ 165.881515342, 'alex', "~n3[33]=\\filter->{arg in; LPF.ar(in,\\lpf.kr(1400,2))};" ], [ 164.349119528, 'alex', "~n3[30]=\\filter->{arg in; GVerb.ar(in,roomsize:40,revtime:[8,6])};" ], [ 157.826462553, 'joach', "(\\octave:3, \\amp:0.8).play" ], [ 152.971406494, 'alex', "~n2[1]=\\set->Pbind(\\args, [\\trig], \\dur, 16, \\trig, 1);" ], [ 146.226091049, 'kof', "(
~saw.ar(2);
~saw.quant=2;
~saw.fadeTime=4.2;
~saw={
  //         |       |       |       |       |  
  var pat = [1,0,0,0,1,0,0,0,1,0,0,0,1,0,0,0].rotate(1);
  var imp = PulseDivider.kr(~tick.kr,1,~counter.kr);
  var hit = Select.kr(PulseCount.kr(imp)%pat.size,pat);
  var env = EnvGen.ar(Env([0.001,1,0.0001],[0.002,0.5],[3,-3],curve:'exp'),imp * hit);
  var sig = LFSaw.ar(50 + [1,2,3,4].reciprocal / [1,1.5,1.25,2]) * LFSaw.ar(1/16/[1,2,3,4]).exprange(0.001,1);
  sig = GVerb.ar(sig,100,10)/8+sig;
  //sig = sig * env;
  Splay.ar(sig,0.75,0.5);
};
~saw.play;
);" ], [ 146.142027875, 'joach', "(\\octave:3, \\amp:0.8).play" ], [ 143.313825951, 'alex', "~n2[1]=\\set->Pbind(\\args, [\\trig], \\dur, 2, \\trig, 1);" ], [ 141.120367012, 'joach', "(\\octave:3, \\amp:0.8).play" ], [ 140.903522949, 'joach', "(\\octave:3, \\amp:0.8).play" ], [ 135.084638811, 'alex', "~n2[33]=\\filter->{arg in; LPF.ar(in,\\lpf.kr(1400,2))};" ], [ 134.320866578, 'alex', "~n2[30]=\\filter->{arg in; GVerb.ar(in,roomsize:40)};" ], [ 133.474995162, 'joach', "(\\octave:3, \\amp:0.8).play" ], [ 133.11431945, 'alex', "~n2[2]=\\set->Pbind(\\args, [\\freq], \\dur,32, \\freq, Pseq([3,2],inf));" ], [ 131.65352141, 'alex', "~n2[1]=\\set->Pbind(\\args, [\\trig], \\dur, 32, \\trig, 1);" ], [ 128.823379076, 'alex', "(
~n2[0]={
	var sig;
	var env=EnvGen.kr(Env([0,1,0],[16,0.001],\\welch),\\trig.tr);
	var fenv=EnvGen.kr(Env([\\freq.kr,\\freq.kr*\\top.kr(4),\\freq.kr],[16,0.04],\\welch),\\trig.tr);
	
	sig=WhiteNoise.ar(0.2)*LFSaw.kr(fenv);
	sig=Pan2.ar(sig,SinOsc.kr(0.25));
	sig=sig*env;
};
)" ], [ 125.728488281, 'joach', "(\\octave:3, \\amp:0.8).play" ], [ 117.638201848, 'joach', "(\\octave:3, \\amp:0.8).play" ], [ 112.84667601, 'kof', "(
~saw.ar(2);
~saw.quant=2;
~saw.fadeTime=0.2;
~saw={
  //         |       |       |       |       |  
  var pat = [1,0,0,0,1,0,0,0,1,0,0,0,1,0,0,0].rotate(1);
  var imp = PulseDivider.kr(~tick.kr,1,~counter.kr);
  var hit = Select.kr(PulseCount.kr(imp)%pat.size,pat);
  var env = EnvGen.ar(Env([0.001,1,0.0001],[0.002,0.5],[3,-3],curve:'exp'),imp * hit);
  var sig = LFSaw.ar(50 + [1,2,3,4].reciprocal / [1,1.5,1.25,2]) * LFSaw.ar(1/16/[1,2,3,4]).exprange(0.001,1);
  //sig = sig * env;
  Splay.ar(sig,0.75,0.5);
};
~saw.play;
);" ], [ 110.558408138, 'alex', "~n2.play(vol:0.8, fadeTime:2, numChannels:2).quant_(2);" ], [ 110.54554857, 'joach', "(\\octave:3, \\amp:0.8).play" ], [ 105.739587629, 'alex', "~n2[33]=\\filter->{arg in; LPF.ar(in,\\lpf.kr(1400,2))};" ], [ 103.880495172, 'joach', "(\\octave:3, \\amp:0.8).play" ], [ 101.916988311, 'alex', "~n2[30]=\\filter->{arg in; GVerb.ar(in,roomsize:40)};" ], [ 96.386379, 'joach', "(\\octave:3, \\amp:0.8).play" ], [ 94.575114195, 'alex', "~n2[2]=\\set->Pbind(\\args, [\\freq], \\dur,32, \\freq, Pseq([3,2],inf));" ], [ 93.595508189, 'alex', "~n2[1]=\\set->Pbind(\\args, [\\trig], \\dur, 32, \\trig, 1);" ], [ 90.213764405, 'alex', "(
~n2[0]={
	var sig;
	var env=EnvGen.kr(Env([0,1,0],[16,0.001],\\welch),\\trig.tr);
	var fenv=EnvGen.kr(Env([\\freq.kr,\\freq.kr*\\top.kr(4),\\freq.kr],[16,0.04],\\welch),\\trig.tr);
	
	sig=WhiteNoise.ar(0.2)*LFSaw.kr(fenv);
	sig=Pan2.ar(sig,SinOsc.kr(0.25));
	sig=sig*env;
};
)" ], [ 90.129220576, 'kof', "(
~saw.ar(2);
~saw.quant=2;
~saw.fadeTime=0.2;
~saw={
  //         |       |       |       |       |  
  var pat = [1,0,0,0,1,0,0,0,1,0,0,0,1,0,0,0].rotate(1);
  var imp = PulseDivider.kr(~tick.kr,1,~counter.kr);
  var hit = Select.kr(PulseCount.kr(imp)%pat.size,pat);
  var env = EnvGen.ar(Env([0.001,1,0.0001],[0.002,0.5],[3,-3],curve:'exp'),imp * hit);
  var sig = LFSaw.ar(50 + [1,2,3,4].reciprocal) * LFSaw.ar(1/16/[1,2,3,4]).exprange(0.001,1);
  //sig = sig * env;
  Splay.ar(sig,0.75,0.5);
};
~saw.play;
);" ], [ 87.82700366, 'joach', "(\\octave:4, \\amp:0.8).play" ], [ 82.684237697, 'alex', "~n2.play(vol:0.1, fadeTime:2, numChannels:2).quant_(2);" ], [ 79.30958074, 'joach', "(\\octave:4, \\amp:0.8).play" ], [ 78.529736609, 'alex', "~n2[2]=\\set->Pbind(\\args, [\\freq], \\dur,32, \\freq, Pseq([3,2],inf));" ], [ 77.768654986, 'alex', "~n2[1]=\\set->Pbind(\\args, [\\trig], \\dur, 32, \\trig, 1);" ], [ 73.846788325, 'alex', "(
~n2[0]={
	var sig;
	var env=EnvGen.kr(Env([0,1,0],[16,0.001],\\welch),\\trig.tr);
	var fenv=EnvGen.kr(Env([\\freq.kr,\\freq.kr*\\top.kr(4),\\freq.kr],[16,0.04],\\welch),\\trig.tr);
	
	sig=WhiteNoise.ar(0.2)*LFSaw.kr(fenv);
	sig=Pan2.ar(sig,SinOsc.kr(0.25));
	sig=sig*env;
};
)" ], [ 68.175194556, 'joach', "(\\octave:4).play" ], [ 58.890228419999, 'joach', "(\\octave:4).play" ], [ 49.940036167, 'joach', "(\\octave:4).play" ], [ 38.364669011999, 'joach', "(\\octave:4).play" ], [ 0, 'kof', "Kolektiv.tempo_(120);" ] ]