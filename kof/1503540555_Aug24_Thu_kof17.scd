
p.push();


~tempo = {110/120}// xxx synth ///////////////////////////////////////

(
    ~xxx.ar(2);
    ~xxx.clock = p.clock;
    ~xxx.quant=[24,1/2];
    ~xxx.fadeTime=0.2;
    ~xxx={
        var bbase = [60,67].midicps *.x [2,1/2] /.x [1,4/3,5/4,2];
        var len = Duty.kr([4,8,24]/~tempo,0,Dseq([1,1/16,8,4],inf));
        var mel = Duty.kr([24,12,8]/~tempo,0,Dseq([1,2,1.5,1.33333],inf));
        var base = bbase * [1,2,1.5,mel];
        var te = ~tempo*2 /.x [1,2,3,4,1/4,4/3];
        var f = SinOsc.ar([mel/3000,[50,60,300/mel],mel/300]).range(0,2pi) + LFSaw.kr(~tempo/240).range(0,10);
        var sig = SinOsc.ar(((Perlin3.ar(f[0].cos,f[1].sin,f[2].sin)*([500,600]*[1,2,3,4])) ),Pulse.ar(te)*0.5pi) * Pulse.ar(te);
        sig = CombL.ar(sig,1/[5,6],[2,8,1]/bbase,[0.2,0.1,1,0.2]*len) / [4,1] + sig;
        sig = RLPF.ar(sig * [1,0.5,1,0.1],base*[2,1.5,4/3,1],LFSaw.kr(~tempo*4/[4,1,2,3]).range(0.01,0.99));
        Splay.ar(sig,0.75,0.015);
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
