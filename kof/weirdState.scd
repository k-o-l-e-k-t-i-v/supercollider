
p.push();
p.bpm(60)

// one synth ///////////////////////////////////////

(
    ~one.ar(2);
    ~one.clock = p.clock;
    ~one.quant=15;
    ~one.fadeTime=0.02;
    ~one={
        var base = 110 / [1,2,1.5];
        var t = LFTri.ar(base/[10,100,1000+(1..12)]) * 0.004;
        var perl = Perlin3.ar(t[0],t[1],t[2]).range(0,1);
        var cad = ~tempo/(1..12);
        var puls = Mix(LFTri.ar(cad).exprange(0.0001,1));
        var f = base * Duty.kr(cad,0,Dseq( 2**(([102,306,600,804,1008])/1200).scramble,inf) );

        var sig = SinOsc.ar(f / [1,1.5,2,4/3],SinOsc.kr(base/(1..12))*2pi,mul:1/((1..12)**2));
        sig = sig * (LFTri.ar(cad)**4).range(0,1);
        sig = CompanderD.ar(sig,3/4,1/1.5,1) * LFTri.ar(~tempo/16/[1,2,3]);
        Splay.ar(sig,LFTri.ar(1/7.5,SinOsc.ar(~tempo)),0.75);
    };
    ~one.play;
);
~one.stop(4);
~one.clear;
~one.pause;
~one.resume;


(
    ~master.quant=2;
    ~master.play;
    ~master.fadeTime = 0.01;
    ~master = {|wet=0.15,lp=2500,hp=350,len=4,rev = 2|
        var sig = In.ar([0,1]);
        var orig = sig;
        var fx;
        var size = LFSaw.ar(~tempo/16/[1,2,3,4]).range(1000,5000);
        //fx = Limiter.ar(sig,0.95);
        sig = CompanderD.ar(sig,3/4,1/1.1,1/3);
        fx = LPF.ar(sig,lp);
        fx = HPF.ar(fx,hp);
        fx = DWGReverbC1C3.ar(NumChannels.ar(fx,2),size,1/len)/rev;
        wet = SinOsc.ar(~tempo*8).range(0,1);
        sig = SelectX.ar(wet,[orig,fx]);
        sig = NumChannels.ar(sig,2);
        ReplaceOut.ar(0,sig);
    };
);
p.moveNodeToTail(\master);
