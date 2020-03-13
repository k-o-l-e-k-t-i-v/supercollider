

p.push();

// perlinsaw synth ///////////////////////////////////////

(
    ~perlinsaw.ar(2);
    ~perlinsaw.quant=2;
    ~perlinsaw.fadeTime=4;
    ~perlinsaw={
        var note = [
            Duty.kr(16/~tempo,0,Dseq([60,61,60,61],inf)),
            Duty.kr(32/~tempo,0,Dseq([65,64,65,65],inf)),
            Duty.kr(64/~tempo,0,Dseq([67,71,72,36],inf))
        ].midicps.lag(1) + SinOsc.kr(~tempo*[3,4,5],mul:2.0);
        var dist = LFNoise2.ar(~tempo/4!12).range(0.5,1.5)/16;
        var sig = LFSaw.ar([dist,dist,note+dist],mul:2pi) + LFTri.ar(~tempo/4/[1,2,16],mul:2pi);
        var cut;
        sig = Perlin3.ar(sig[0].cos,sig[1].sin,sig[2]);
        cut = LFNoise2.kr(~tempo/4).range(150,15000);
        4.do{
            sig = LPF.ar(sig,cut) + (Resonz.ar(sig,note*[1,1.5,2],0.2)/10.0);
        sig = LeakDC.ar(sig);    
        //sig = CombL.ar(sig,1,1/4,1);
        };
        Splay.ar(sig,0.95,0.5);
    };
    ~perlinsaw.play;
);
~perlinsaw.stop(4);
~perlinsaw.clear;
~perlinsaw.pause;
~perlinsaw.resume;

(
    ~master.quant=2;
    ~master.play;
    ~master.fadeTime = 0.01;
    ~master = {|wet=0.15,lp=3500,hp=250,len=10,rev = 3|
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
