

(
    p=ProxySpace.push(s.boot);
    p.makeTempoClock;
);


// raw synth ///////////////////////////////////////

(
    ~raw.ar(2);
    ~raw.quant=[2,1/2];
    ~raw.fadeTime=16;
    ~raw={|speed = 1|
        var sig = VarSaw.ar([500,600]+.x[1,2,3,4,5]) + GrayNoise.ar(0.5!2) * (1-(LFTri.ar(speed)**4));
        //sig = Resonz.ar(sig,LFSaw.ar(1/32/[1,2,3,4]).exprange(160.001,250)+SinOsc.ar(4).range(-100,1000),LFNoise2.kr(1/32!2).range(0.02,0.6));
        sig = Resonz.ar(sig,LFSaw.ar(speed).range(90,19000),0.162);
        sig = Limiter.ar(sig);// * Pulse.ar(4/[1,2,8,16]);
        Splay.ar(sig,0.5,0.055);
    };
    ~raw.play;
    ~raw[10] = \filter -> {|sig| DWGReverb.ar(LPF.ar(HPF.ar(sig,200),3800),[4000,4100],1/30)+sig};
);
~raw.stop(4);
~raw.clear;
~raw.pause;
~raw.resume;


~raw.map(\speed,~ctl);

~ctl.quant=2;
~ctl = {Duty.kr(1/4,0,Dseq([1,8,4,1,8,2,1,8,3,1,8,16,1,8,32,64,128],inf))};





// one synth ///////////////////////////////////////

(
    ~one.ar(2);
    ~one.quant=2;
    ~one.fadeTime=4;
    ~one={
        var sig = SinOsc.ar([55,55.01]+.x[1,2,3,4,5],Pulse.ar([1,2,3,4]/4)/LFNoise1.kr(1/16!4).range(2,8) );
        sig = sig + (LFSaw.ar(49,mul:0.3) * (LFSaw.ar(1/16)**8));
        Splay.ar(sig,0.95,0.25);
    };
    ~one.play;
    ~one[10] = \filter -> {|sig| DWGReverb.ar(LPF.ar(HPF.ar(sig,100),3800),[6400,6410],1/20)/2+sig};
);
~one.stop(4);
~one.clear;
~one.pause;
~one.resume;


Crackle.help;

// crack synth ///////////////////////////////////////

(
    ~crack.ar(2);
    ~crack.quant=2;
    ~crack.fadeTime=4;
    ~crack={
        var sig = Crackle.ar(1+LFNoise2.kr(1/4).range(0.01,0.7),LFPulse.ar(5000*[1,2,1.3333,1.5])/LFSaw.ar(1/4).range(1,50)) * Pulse.ar(8) * LFPulse.ar(1) * LFPulse.ar(7/[1,2,3,4]);
        Splay.ar(sig,0.5,0.25);
    };
    ~crack.play;
    ~crack[10] = \filter -> {|sig| DWGReverb.ar(LPF.ar(HPF.ar(sig,1300),15000),[4000,4010],1/10)/4+sig};
);
~crack.stop(4);
~crack.clear;
~crack.pause;
~crack.resume;


(
    ~voice1.quant=2;
    ~voice1.play;
    ~voice1.fadeTime=5;
    ~voice1={|input|
        var notes,code,sig,freq,speed,mod;


        //////////////////|/////////|/////////|/////////|/////////|////////| 
        code=            "      cryptokof                                  ";
        //////////////////|/////////|/////////|/////////|/////////|////////| 


        code=code.ascii;

        notes = (code).linexp(20,127,30,15000);
        speed = 1/8/(1..8);
        mod = 1.5/(1..8);
        freq = Duty.ar(speed,0,Dseq(notes,inf)).lag(speed/2*mod);
        sig = SinOsc.ar(freq!2,mul:0.2) + LFNoise2.ar(freq*2,freq.linlin(50,10000,1,0));
        sig = sig + Formant.ar(freq!2,freq.lag(0.02*speed*mod),freq.lag(0.01*speed*mod)*2,0.09);
        Splay.ar(sig,0.7,0.0029,SinOsc.ar(4)/3);
    };
    ~voice1[10] = \filter -> {|sig| DWGReverb.ar(LPF.ar(HPF.ar(sig,1300),15000),[4000,4010],1/10)/4+sig};
)
~voice1.clear;
