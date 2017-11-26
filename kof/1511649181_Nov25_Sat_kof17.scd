
(
    SynthDescLib.global.read;
    SynthDescLib.global.browse;
)


(
    SynthDef.new(\kick,{|freq=500,attack=0.02,release=2,ff=500,amp=0.5,curv=40,ccc=3|
        var env = EnvGen.ar(Env.perc(attack,release,amp,ccc), doneAction: Done.freeSelf);
        var sig = SinOsc.ar(freq+(env**curv*ff),env**curv*2pi);
        sig = sig + LFSaw.ar(freq,0,SinOsc.ar(env**0.72*freq/200));
        sig = LPF.ar(sig,freq*env+freq);
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
        \freq, Pseq(432 *.x [1,2,1.5,1,1/1.5,1,4,1,8] *.x (2**([0,5,7,9]/12)), inf),
        \ff, Pseq(432/4 *.x [1,2,1.5,1,1/1.5,1,4,1,8] *.x (2**([11,5,7,9]/12)), inf),
        \release, Pseq([0.25,1,0.2,1], inf),
        \attack, Pwhite(0.002,0.12,inf),
        \curv, Pwhite(1,40,inf),
        \ccc, Pwhite(-6,6,inf),
        \amp, Pwhite(0.01,0.25,inf),
        \dur, Pseq([120/130]/2, inf)
    );
    p.play;
)
(
)

x=Synth(\kick,[\f,432 ,\a ,0.002 ,\r ,2]);
x.set(\f,50);
x;
