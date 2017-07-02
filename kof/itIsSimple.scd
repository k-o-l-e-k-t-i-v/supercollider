

p.push();
p.bpm(90);


// noTempo synth ///////////////////////////////////////

(
    ~noTempo.ar(2);
    ~noTempo.clock = p.clock;
    ~noTempo.quant=2;
    ~noTempo.fadeTime=4;
    ~noTempo={
        var mod =  Duty.kr(16/~tempo*(1..3),0,Dseq([1,2,1.5,1.33333],inf))  ;
        var th = 0.25;
        var treshLow = (0.5)*th;
        var treshMid = (0.35)*th;
        var treshHi = (0.35)*th;

        var low = Amplitude.ar(LPF.ar(AudioIn.ar([1,2]),200),attackTime:0.01,releaseTime:0.01).softclip ** 0.9;
        var mid = Amplitude.ar(LPF.ar(AudioIn.ar([1,2]),200),attackTime:0.01,releaseTime:0.01).softclip ** 0.9;
        var hi = Amplitude.ar(LPF.ar(AudioIn.ar([1,2]),200),attackTime:0.01,releaseTime:0.01).softclip ** 0.9;

        var trigLow = low > treshLow;
        var trigMid = mid > treshMid;
        var trigHi = hi > treshHi;

        var envLow = Decay.ar(Trig1.ar(HPZ1.ar(trigLow),0.001),LFNoise2.kr(~tempo/4!4).range(0.05,4)).softclip ** 2.6;
        var envMid = Decay.ar(Trig1.ar(HPZ1.ar(trigMid),0.001),LFNoise2.kr(~tempo/4!4).range(0.05,4)).softclip ** 3.6;
        var envHi = Decay.ar(Trig1.ar(HPZ1.ar(trigHi),0.001),LFNoise2.kr(~tempo/4!4).range(0.05,4)).softclip ** 4.6;

        var sigLow = SinOsc.ar([50,100]/mod+(envLow**80*20),envLow**50) * envLow;
        var sigMid = SinOsc.ar([500,1000]/mod+(envMid**80*20),envMid**50) * envMid;
        var sigHi = SinOsc.ar([5000,10000]/mod+(envHi**80*20),envHi**50) * envHi;


        var sig = ([] ++ (sigLow ++ sigMid ++ sigHi)) * AudioIn.ar([1,2]);
        Splay.ar(sig,0.65,0.5);
    };
    ~noTempo.play;
);
~noTempo.stop(4);
~noTempo.clear;
~noTempo.pause;
~noTempo.resume;


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
