
p.push();


// xxx synth ///////////////////////////////////////

(
    ~xxx.ar(2);
    ~xxx.clock = p.clock;
    ~xxx.quant=4;
    ~xxx.fadeTime=4;
    ~xxx={
        var te = [1.5,3,4,8];
        var f = SinOsc.ar([1/100,50,1/250]).range(0,1/2);
        var sig = SinOsc.ar((Perlin3.ar(f[0],f[1],f[2])*500*[1,2,3,4]),Pulse.ar(te)) * Pulse.ar(te);
        sig = CombL.ar(sig,1/5,1/50,2);
        sig = RLPF.ar(sig,800,0.2);
        Splay.ar(sig,0.5,0.05);
    };
    ~xxx.play;
);
~xxx.stop(4);
~xxx.clear;
~xxx.pause;
~xxx.resume;

(
    ~master.quant=2;
    ~master.play;
    ~master.fadeTime = 0.01;
    ~master = {|wet=0.15,lp=3500,hp=150,len=10,rev = 3|
        var sig = In.ar([0,1]);
        var orig = sig;
        var fx;
        //fx = Limiter.ar(sig,0.95);
        sig = CompanderD.ar(sig,3/4,1/1.1,1/3);
        fx = LPF.ar(sig,lp);
        fx = HPF.ar(fx,hp);
        fx = DWGReverbC1C3.ar(NumChannels.ar(fx,2),[5000,5010],1/len)/rev;
        sig = SelectX.ar(wet,[orig,fx]);
        sig = NumChannels.ar(sig,2);
        ReplaceOut.ar(0,sig);
    };
);
p.moveNodeToTail(\master);
