
m = 499.004/1000;
p.bpm(m*240);
p.push();
// one synth ///////////////////////////////////////
s.prepareForRecord("~/recordings/au.wav",2);
~one.stop
(
    ~one.ar(6);
    ~one.mold(6);
    ~one.quant=0;
    ~one.fadeTime=15;
    ~one={
        var puls = Pulse.ar(~tempo*[1,2,4,8,10,1/2,1/4,1/8,1/16,1/32,1/12,1/24]).softclip;
        var sig = SinOsc.ar(m*1000,mul:0.334) + Gendy1.ar(1,1,1,1/(1..10),~tempo*50,~tempo*1000,mul:0.3);
        sig = sig * puls;
        Splay.ar(sig,0.95,0.5);
    };
//    ~one.play;

    (2**((60-69)/12))*m;

    ~first.ar(6);
    ~first.mold(6);
    ~first.quant=0;
    ~first.fadeTime=15;
    ~first={
        var in = SoundIn.ar(0);
        var sig = SinOsc.ar(432.04/[1,0.98,pi,1.501],in*2pi) * (LFTri.ar(~tempo/[1,2,3,4])**2);
        Splay.ar(sig,0.98,0.5);
    };
    ~first.play;

    //s.record("~/recordings/au.wav",duration:499.004);
);

s.stopRecording();
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
