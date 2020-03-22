


p.push();
p.bpm(90);

// pat synth ///////////////////////////////////////

(
    ~pat.mold(8);
    ~pat.kr(2);
    ~pat.quant=4;
    ~pat.fadeTime=4;
    ~pat={
        var sig = Duty.kr((1..8).nthPrime*4/~tempo,0,Dseq([1,2,1/2,1/4],inf));
        sig;
    };
);


(
    ~test.ar(2);
    ~test.quant=4;
    ~test.fadeTime=1;
    ~test={
        var mod = Duty.kr(24*[1,2,3,4]/~tempo,0,Dseq([1,2,1.5,1.33333],inf)).lag(1/4);
        var f = [60,48,60,72].midicps*2/mod;
        var puls = Pulse.ar(~tempo*2/~pat.kr.lag(1/4));
        var sig = SinOsc.ar(f);
        sig = sig * puls;
        Splay.ar(sig,0.666,0.25);
    };
    ~test.play;
);
~test.stop(4);
~test.clear;
~test.pause;
~test.resume;


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
