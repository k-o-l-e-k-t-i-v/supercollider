
(
    SynthDescLib.global.read;
    SynthDescLib.global.browse;
)


(
    SynthDef.new(\kick,{|freq=500,attack=0.02,release=2,ff=500,amp=0.5,curv=40|
        var env = EnvGen.ar(Env.perc(attack,release,amp,-4), doneAction: Done.freeSelf);
        var sig = SinOsc.ar(freq+(env**curv*ff),env**curv*2pi);
        sig = sig + LFSaw.ar(freq*4);
        sig = BPF.ar(sig,freq,env+0.01);
        sig = sig * env;
        Out.ar(0,sig!2);
    }).send(s);
)

(

    // m = Pbind(
    //     \value, Pbind(#[1,2,4,8],inf),
    //     \dur,1   
    // );
    p = Pbind(
        \instrument, \kick,
        \freq, Pseq(([100,1000] /.x [1,2,4,1.5] *.x [1,2,4,1.333333,1.5] *.x [1,2]), inf),
        \release, Pseq([0.25,1,0.2,1], inf),
        \attack, Pwhite(0.002,0.12,inf),
        \curve, Pwhite(10,40,inf),
        \amp, Pwhite(0.01,0.05,inf),
        \dur, Pseq([120/130], inf)
    );
    p.play;
)
(
)

x=Synth(\kick,[\f,432 ,\a ,0.002 ,\r ,2]);
x.set(\f,50);
x;
