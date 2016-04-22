
(
    p=ProxySpace.push(s.boot);
    p.makeTempoClock;
);




Tdef(\mel).quant=2;
Tdef(\mel,{loop{~atmo.rebuild;8.wait;}}).play;
Tdef(\mel).stop;

TdefAllGui.new
(
    n = ProxyMixer(p,32);
    n.parent.alwaysOnTop_(true);
)

(
    ~atmo.ar(2);
    ~atmo.quant=2;
    ~atmo.fadeTime=5.2;
    ~atmo={
        var mod = {[1,1.5,1.25,2,2,2,2].choose}!3;
        var freq = 44*mod/{[1,1.3333,1.5,2].choose}!4+(1..4).reciprocal*[8,8,8,16,4].choose/[1.25,1.5,1.5,2].choose/[1.3333,1.33333,1.5,1.25].choose;
        var sig = LFSaw.ar(freq);
        sig = LPF.ar(sig,LFSaw.ar(1/16/[1,2,3,4]).range(16000,600)).tanh;
        sig = Limiter.ar(sig,0.95,0.1);
        sig = Resonz.ar(sig,freq,0.2);
        sig = Vibrato.ar(sig,[4,5,6,7],0.12);
        //sig = DelayN.ar(sig,[1,2,3,4]);
        sig = LPF.ar(sig,8900)+sig;
        //sig = DWGReverb.ar(sig,LFNoise2.kr(1/32!2).exprange(1000.1,8000),mix:LFNoise2.kr(1/4!2).range(0.25,0.75));
        sig = CompanderD.ar(sig,3/4,1/2,1/2);
        Splay.ar(sig,0.75,0.0525);
    };
    ~atmo.play;
);
~atmo.stop(4);
~atmo.clear;
~atmo.pause;
~atmo.resume;


Limiter.help
