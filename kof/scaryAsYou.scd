
p.push();
p.bpm(60)
s.latency = 0.3337;

// one synth ///////////////////////////////////////

(
    ~one.ar(2);
    ~one.clock = p.clock;
    ~one.quant=16;
    ~one.fadeTime=1.02;
    ~one={
        var base = [48,60,63].midicps *.x [8,2,1];
        var t = LFTri.ar(base/[10,100,1000+(1..4)]) * 0.0002;
        var perl = Perlin3.ar(t[0],t[1],t).range(0,1);
        var cad = ~tempo/64/(1..4);
        var puls = Mix(LFTri.ar(cad).exprange(0.0001,1));
        var f = base * Duty.kr(1/cad,0,Dseq( 2**(([102,600,102,306,102,804,102,1008,12000,0])/1200),inf) );

        var sig = SinOsc.ar(f / [1,1.5,2,4/3],SinOsc.kr(base/(1..4))*2pi,mul:1/((1..4)**2));
        sig = sig * (LFTri.ar(cad)**4).range(0,1);
        sig = sig + SinOsc.ar(f*[2,4,8],SinOsc.ar(f/4)*2pi,mul:[1,1/2,1/5]);
        sig = CompanderD.ar(sig,3/4,1/1.25,1) * (LFTri.ar(~tempo/[1,2,3,4]/16) ** 4);
        Splay.ar(sig,SinOsc.ar(7.5,SinOsc.ar(~tempo/15)).range(0.1,0.9),0.5);
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
        wet = SinOsc.ar(~tempo/[8,7,6,3]).range(0,1);
        sig = SelectX.ar(wet,[orig,fx]);
        sig = NumChannels.ar(sig,2);
        ReplaceOut.ar(0,sig);
    };
);
p.moveNodeToTail(\master);
