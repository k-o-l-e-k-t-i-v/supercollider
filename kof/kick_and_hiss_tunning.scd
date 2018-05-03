
p.push();
p.bpm(90);


(
    s.latency = 0.486;
    p.arProxyNames.do({|synth| if(synth.asSymbol!=\master){p[synth.asSymbol].rebuild;};});
    ~tick.kr(1);
    ~tick.clock = p.clock;
    ~tick.quant = 16;
    ~counter.clock = p.clock;
    ~counter.quant = 16;
    ~counter = {PulseCount.kr(~tick.kr);};
    ~tick = { Impulse.kr( ~tempo * 4 ); };
);


// kick synth ///////////////////////////////////////

(
    ~kick.ar(2);
    ~kick.clock = p.clock;
    ~kick.quant=[16,0];
    ~kick.fadeTime=0.02;
    ~kick={
        //  |       |       |       |       |  
        var pat = [
            1,0,0,0, 1,0,0,0, 1,0,0,0, 1,0,0,0,
            1,0,0,0, 1,0,0,0, 1,0,0,0, 1,0,0,0,
            1,0,0,0, 1,0,0,0, 1,0,0,0, 1,0,0,0,
            1,0,0,0, 1,0,0,0, 1,0,0,0, 1,0,0,0,
        ];
        var imp = PulseDivider.kr(~tick.kr,[1,2,3,4],~counter.kr%pat.size);
        var hit = Select.kr(PulseCount.kr(imp)%pat.size,pat);
        var env = {EnvGen.ar(Env([0.001,1,0.0001],[0.002,4.13] * LFSaw.ar(~tempo/[1,2,3,4],add:0.25).lag(0.013),[3,-3]),imp * hit)};
        var sig = SinOsc.ar(50+(env**LFNoise2.kr(~tempo/64).range(11.1,80.9)*4000),env**LFNoise2.kr(~tempo/32).range(20,80)*8pi);
        sig = sig * env;
        //sig = CompanderD.ar(sig,0.88,1/4,1/2,0.013,2);
        Splay.ar(sig,0.19,0.997);
    };
    ~kick.play;
);
~kick.stop(4);
~kick.clear;
~kick.pause;
~kick.resume;


// hihat synth ///////////////////////////////////////

(
    ~hihat.ar(2);
    ~hihat.clock = p.clock;
    ~hihat.quant=[16,0];
    ~hihat.fadeTime=0.02;
    ~hihat={
        //  |       |       |       |       |  
        var pat = [
            1,0,1,0, 1,0,1,0, 1,0,1,0, 1,0,1,1,
            1,0,1,0, 1,0,1,0, 1,0,1,0, 0,1,1,1,
        ].rotate(3);

        var alpha = LFSaw.ar(~tempo/[1,2,3,4]/16,add:1.013);
        var beta = LFTri.ar(~tempo/[1,2,3,4]/32,add:1.013);

        var imp = PulseDivider.kr(~tick.kr,[1,2,3,4],~counter.kr%pat.size);
        var hit = Select.kr(PulseCount.kr(imp)%pat.size,pat);
        var env = EnvGen.ar(Env([0.001,1,0.0001],[0.0013,0.12513],[3,-3]),imp * hit);
        var sig = WhiteNoise.ar(env**alpha) + GrayNoise.ar(0.97!4 + (env**beta*0.4));
        sig = HPF.ar(sig,LFSaw.kr(~tempo/4/[1,2,3,4]).range(500,15000));
        sig = sig * env;
        Splay.ar(sig,0.65,0.75);
    };
    ~hihat.play;
);
~hihat.stop(4);
~hihat.clear;
~hihat.pause;
~hihat.resume;


// mid synth ///////////////////////////////////////

(
    ~mid.ar(2);
    ~mid.clock = p.clock;
    ~mid.quant=[16,0];
    ~mid.fadeTime=4;
    ~mid={
        var f1 = [60,48,72].midicps *.x [1,1.5,1.3334] / Duty.kr(4/~tempo,0,Dseq([1,1,1,1,2,1.5,1.33333],inf));
        var lfo1 = SinOsc.ar([3,4,7,9]*LFTri.ar(~tempo/[1,2,3,4]));
        var f2 = [61,65,67].midicps/2 /.x [1,1.5,1.3334] * Duty.kr(16/~tempo,0,Dseq([1,1,1,1,2,1.5,1.33333],inf));
        var lfo2 = SinOsc.ar([3,4,7,9]/4 * LFTri.ar(~tempo/[1,2,3,4]/4));


        var sig = SinOsc.ar(f1,mul:lfo1) + SinOsc.ar(f2,mul:lfo2);
        sig = Vibrato.ar(sig.distort,[3,4,5,7]);
        sig = LeakDC.ar(sig);
        sig = CombN.ar(sig,16/(f1+f2+0.01334),4/(f1+f2+0.001),~tempo);
        sig = Compander.ar(sig,~kick.ar,LFNoise2.kr(1/4*~tempo!2).range(0.1,0.9),1,0.01);
        Splay.ar(sig,0.75,0.337);
    };
    ~mid.play;
);
~mid.stop(4);
~mid.clear;
~mid.pause;
~mid.resume;

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
