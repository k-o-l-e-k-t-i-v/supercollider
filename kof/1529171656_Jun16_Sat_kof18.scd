

p.push();
p.bpm(121.5);
// one synth ///////////////////////////////////////


// sync synth ///////////////////////////////////////

(
    ~sync.ar(2);
    ~sync.clock = p.clock;
    ~sync.quant=2;
    ~sync.fadeTime=4;
    ~sync={

        var f = MouseX.kr(55,4400);
        var env = Env.circle([0,-0.5,1,-0.5,-1,0],1/f,[3,-3]*MouseX.kr(-0.001,10.2)) ;
        var sig = EnvGen.ar(env);
        sig = Perlin3.ar(sig,SinOsc.ar(f/4)+MouseY.kr(1,200),SinOsc.ar(f/8)+MouseX.kr(1,2));
        sig = DFM1.ar(sig,f,0.1);
        Splay.ar(sig,0.5,0.25);
    
    };
    ~sync.play;
);
~sync.stop(4);
~sync.clear;
~sync.pause;
~sync.resume;

(
    ~one.ar(2);
    ~one.clock = p.clock;
    ~one.quant=4;
    ~one.fadeTime=1;
    ~one={
        var mod = Duty.kr(5/~tempo,0,Dseq([1,2,1.5,1.33333],inf));
        var mod2 = Duty.kr(1/5/~tempo,0,Dseq([1,2,1.5,1.33333,1/2],inf));
        var maxfreq = 432*5/(mod*5) /.x [1,2,1.5,1.333334,4] / mod2;
        var puls = 1/5; 
        var phase = Pulse.ar(puls).range(0,2pi);
        var x = SinOsc.ar(puls).exprange(20.00001,maxfreq);
        var y = LFTri.ar(puls).range(0.000001,1);
        var sig = (SinOsc.ar(maxfreq/((1..12).reciprocal+1),phase)*SinOsc.ar(maxfreq/2/((1..12).reciprocal+1),phase));
        sig = BPF.ar(sig,x.lag(0.001),y.lag(0.001));
        sig = BPF.ar(sig,x.lag(0.0001),y.lag(0.0001));
        sig = BPF.ar(sig,x,y);
        sig = Normalizer.ar(sig);
        sig = LPF.ar(sig,maxfreq);
        Splay.ar(sig,0.95,0.5);
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
    ~master = {|wet=0.15,lp=13500,hp=50,len=10,rev = 3|
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
