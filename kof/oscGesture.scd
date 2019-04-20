p.push;
(
    ~acc={|xyz=#[0,0,0]| Slope.kr(xyz/10.0).lag(1/60)/10;};
    ~rot={|xyz=#[0,0,0]| xyz.lag(1/60)/10.0;};

    x = OSCFunc( { | msg, time, addr, port |
        ~acc.set(\xyz, msg[1..].asFloat);
        ~rot.set(\xyz, msg[1..].asFloat);
    }, '/accelerometer' );

    y = OSCFunc({|msg,time,add,port|msg.postln;},'/stepdetector');
)


~acc.scope;
~rot.scope;

// drone synth ///////////////////////////////////////

(
        ~acc={|xyz=#[0,0,0]| Slope.kr(xyz/10.0).lag(1/60)/10;};
        ~rot={|xyz=#[0,0,0]| xyz.lag(1/60)/10.0;};

        x = OSCFunc( { | msg, time, addr, port |
            ~acc.set(\xyz, msg[1..].asFloat);
            ~rot.set(\xyz, msg[1..].asFloat);
        }, '/accelerometer' );

        ~drone.ar(2);
    ~drone.quant=2;
    ~drone.fadeTime=4;
    ~drone={
        var sig = [
            Perlin3.ar(SinOsc.ar(~rot.ar.reverse.lag(5)),SinOsc.ar(~rot.ar.lag(5)),SinOsc.ar(50) ),
        
        
    GrayNoise.ar(0.1),
    Pulse.ar(8);
    Pulse.ar(4);
    Pulse.ar(16);
    SinOsc.ar(50),
    LFSaw.ar(15000,mul:0.1),
    WhiteNoise.ar(0.1)
    ];
    
        //[BrownNoise.ar(0.1),WhiteNoise.ar(0.1),PinkNoise.ar(0.1)];

        sig = SelectX.ar(~rot.kr*sig.size,sig);
        sig = LPF.ar(sig,1500) + (CombN.ar(HPF.ar(sig*(~acc.kr.abs**1.5),1500),1,1,4)/3);
        // sig = CombN.ar(sig,1,1/4,1);
        sig = LeakDC.ar(sig);
        //sig = GVerb.ar(sig,80)/9+sig;
        Splay.ar(sig,0.05,0.75,~rot);
    };
    ~drone.play;
);
~drone.stop(4);
~drone.clear;
~drone.pause;
~drone.resume;


(
    {
        var changingSignal = LFNoise0.ar(1000);
        var changed = Changed.ar(changingSignal);
        [changingSignal, changed]
    }.plot
);
