
s.boot;
s.freeAll;

(
    Ndef(\mod).quant = 2.0;
    Ndef(\mod,{Splay.kr(Select.kr(Stepper.kr(Impulse.kr(1/8/[1,2,4,8])),[1,1,1/4,1/2,1/4,1,2,1/8,1,1]).lag((1..4)/16) + SinOsc.ar([2,4,5,6]*10).range(-0.01,0.01) )});


    SynthDef(\kick,{|amp = 0.2,freq = 8000|
                    var sig,env1,env2;
                    env1 = EnvGen.ar(Env.new([0,1,0],[{ExpRand(0.01,0.12)}!2,{ExpRand()}!2],[-3,3]),doneAction:2);
                    env2 = EnvGen.ar(Env.new([freq,144,45],[0.015,0.02],[-3,3]));
                    sig = Vibrato.ar(SinOsc.ar(env2+([0.01,0])) * env1,[4,5,6,7],0.2);

                    Out.ar(0,Splay.ar(sig,1,amp));


                   }).add;

    SynthDef(\hiss,{|amp = 0.2,freq = 800|
                    var sig,env1,env2;
                    env1 = EnvGen.ar(Env.new([0,1,0],[0.02,{ExpRand(0.2,0.4)}!2],[-3,3]),doneAction:2);
                    sig = Vibrato.ar(HPF.ar(WhiteNoise.ar(amp!2),freq) * env1,[4,5,6,7],0.2);

                    Out.ar(0,Splay.ar(sig,1,amp));


                   }).add;


    SynthDef(\tone,{|freq = 432, amp = 0.2, dur = 1, modd = 1|
                    var env1,env2,env3,sig;
                    env1 = EnvGen.ar(Env.new([0,1,0],[0.02,dur/8],[-3,3]));
                    env2 = EnvGen.ar(Env.new([0,1,0],[dur/16,dur],[3,-3]));
                    env3 = EnvGen.ar(Env.new([0,1,0],[dur,dur*2],[-3,3]),doneAction:2);
                    sig = SinOsc.ar(freq*Ndef(\mod).kr.choose+((1.01*(1..8))/1.0) ) * env1;
                    sig = LFSaw.ar(freq*Ndef(\mod).kr.choose*(1.5pi)+((1.01*(1..8))/4.0) ) * env2 + sig; 
                    sig = LFTri.ar(freq*Ndef(\mod).kr.choose/15+((1.01*(1..8))/1.0) ) * env3 + sig + BrownNoise.ar(0.01*modd);


                    Out.ar(0,Splay.ar(sig,0.5,amp));
                   }).add;

)


(


    Pdef(\melod,{
        var a = 0;
        Ppar([
            Pbind(
                \instrument, \tone,
                \dur, Pseq([1,1,1/2]*1/8,inf),
                \freq, Pseq([60,72,51].midicps,inf),
            ),
            Pbind(
                \instrument, \tone,
                \dur, 16,
                \modd, Pxrand([1,2,4,1/2,1/4].scramble,inf)
            ),
            Pbind(
                \instrument, \tone,
                \dur, 8,
                \modd, Pxrand([1,2,4,1/2,1/4].scramble,inf)
            ),
            Pbind(
                \instrument, \tone,
                \dur, 32,
                \modd, Pxrand([1,2,4,1/2,1/4].scramble,inf)

            )])
    }).play(quant:2);


    Pdef(\beat,{
        Ppar([
            Pbind(
                \instrument, \kick,
                \freq, Pseq([1,1,2,4]*8000,inf),
                \dur, Pseq([1,1,1,1/2,1/2]/4,inf),
                \amp, Pwhite(0.1,0.4,inf)
            ),
            Pbind(
                \instrument, \hiss,
                \freq, Pwhite(4000,12000,inf),
                \dur, Pseq([1,1,1,1/2,1/2]/8,inf),
                \amp, Pwhite(0.1,0.7,inf)
            )])
        }).play(quant:2);
    )
