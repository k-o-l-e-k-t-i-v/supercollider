





p.push();
p.bpm(120);


// click synth ///////////////////////////////////////

(
    ~click.ar(2);
    ~click.clock = p.clock;
    ~click.quant=[16,0];
    ~click.fadeTime=0.02;
    ~click={
        //  |       |       |       |       |  
        var pat = [
            1,0,0,0, 0,0,0,0, 0,0,0,0, 0,0,0,0,
            1,0,0,0, 0,0,0,0, 0,0,0,0, 0,0,0,0,
            1,0,0,0, 0,0,0,0, 0,0,0,0, 0,0,0,0,
            1,0,0,0, 0,0,0,0, 0,0,0,0, 1,1,1,1,
        ].rotate(3);
        var imp = PulseDivider.kr(~tick.kr,1,~counter.kr%pat.size);
        var hit = Select.kr(PulseCount.kr(imp)%pat.size,pat);
        var env = EnvGen.ar(Env([0.001,1,0.0001],[0.00002,0.05],[3,-3]),imp * hit);
        var sig = DC.ar(0.75) + LFSaw.ar(8800/[1,2,3,4]);
        sig = sig * env;
        Splay.ar(sig,0.75,0.15);
    };
    ~click.play;
);
~click.stop(4);
~click.clear;
~click.pause;
~click.resume;


// kick synth ///////////////////////////////////////

(
    ~kick.ar(2);
    ~kick.clock = p.clock;
    ~kick.quant=[16,0];
    ~kick.fadeTime=0.02;
    ~kick={
        //  |       |       |       |       |  
        var pat = [
            1,0,0,0, 0,0,0,0, 0,0,0,0, 0,0,0,0,
            1,0,0,0, 0,0,0,0, 0,0,0,0, 0,0,0,0,
            1,0,0,0, 0,0,0,0, 0,0,0,0, 0,0,0,0,
            1,0,0,0, 0,0,0,0, 0,0,0,0, 0,0,0,0,
        ].rotate(1);
        var imp = PulseDivider.kr(~tick.kr,4,~counter.kr%pat.size);
        var hit = Select.kr(PulseCount.kr(imp)%pat.size,pat);
        var env = EnvGen.ar(Env([0.001,1,0.0001],[0.0002,3.5],[3,-3]),imp * hit);
        var sig = SinOsc.ar(50!2,env**60*2pi) + PinkNoise.ar(env**4);
        sig = sig * env;
        Splay.ar(sig,0.75,0.5);
    };
    ~kick.play;
);
~kick.stop(4);
~kick.clear;
~kick.pause;
~kick.resume;

// swswitch synth ///////////////////////////////////////

(
    ~swswitch.ar(2);
    ~swswitch.quant=16;
    ~swswitch.fadeTime=0.2;
    ~swswitch={
        //         |       |       |       |       |  
        var pat = [
            1,0,0,0,1,0,0,0,1,0,0,0,1,0,0,0,
            1,0,0,0,1,0,0,0,1,0,0,0,1,0,0,0,
            1,0,0,0,1,0,0,0,1,0,0,0,1,0,0,0,
            1,0,0,0,1,0,0,0,1,0,0,0,1,0,0,0,
        ].rotate(3);
        var imp = PulseDivider.kr(~tick.kr,4,~counter.kr % pat.size);
        var hit = Select.kr(PulseCount.kr(imp)%pat.size,pat);
        var env = EnvGen.ar(Env([0.001,1,0.0001],[0.002,3.05],[3,-3],curve:'exp'),imp * hit);
        var f = TChoose.kr(Impulse.kr(~tempo/4!4),[60,65,57,59,72].midicps);
        var sig = [
            VarSaw.ar(50!2,0,env*4),
            SinOsc.ar(f!2),
            SinOsc.ar(50!2,Pulse.ar(4)),
            VarSaw.ar(50!2),
        ];
        sig = [
            HPF.ar(sig,f*10),
            BPF.ar(sig,8000,0.2),
            LPF.ar(sig,f),
            LPF.ar(sig,500)
        ].scramble;
        sig = Select.ar(PulseCount.kr(imp*hit)%sig.size,sig);
        sig = sig * env;
        Splay.ar(sig,0.75,0.25);
    };
    ~swswitch.play;
);
~swswitch.stop(4);
~swswitch.clear;
~swswitch.pause;
~swswitch.resume;

// click synth ///////////////////////////////////////

(
    ~click.ar(2);
    ~click.clock = p.clock;
    ~click.quant=[16,0];
    ~click.fadeTime=0.02;
    ~click={
        //  |       |       |       |       |  
        var pat = [
            1,0,0,0, 1,0,0,0, 1,0,0,0, 1,0,0,0,
            1,0,0,0, 1,0,0,0, 1,0,0,0, 1,0,0,0,
            1,0,0,0, 1,0,0,0, 1,0,0,0, 1,0,0,0,
            1,0,0,0, 1,0,0,0, 1,1,1,1, 1,1,1,1,
        ].rotate(1);
        var imp = PulseDivider.kr(~tick.kr,[1,2,3,4],~counter.kr%pat.size);
        var hit = Select.kr(PulseCount.kr(imp)%pat.size,pat);
        var env = EnvGen.ar(Env([0.001,1,0.0001],[0.002,0.5],[3,-3]),imp * hit);
        var sig = WhiteNoise.ar(env**LFNoise1.kr(~tempo/4!8).range(1,80));
        var f = TChoose.kr(Impulse.kr(~tempo/4!4),[60,65,57,59,72].midicps);
        var del = TChoose.kr(Impulse.kr(~tempo/4!4),2**(1..8)).lag(1/40);

        sig = CombN.ar(sig,~tempo,~tempo/del,~tempo);
        sig = sig * env;
        sig = CombN.ar(sig,~tempo,~tempo/del*4,~tempo*4);
        sig = BPF.ar(sig,f) * Pulse.ar(~tempo*8/[1,2,3,4])+LPF.ar(sig,1600)+HPF.ar(sig,16000);
        Splay.ar(sig,0.75,0.15);
    };
    ~click.play;
);
~click.stop(4);
~click.clear;
~click.pause;
~click.resume;

2**12

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

(
    s.latency=(4/6);
    //p.clock.tempo_(120/60);
    p.arProxyNames.do({|synth| if(synth.asSymbol!=\master){p[synth.asSymbol].rebuild;};});
    ~tick.kr(1);
    ~tick.clock = p.clock;
    ~tick.quant = 16;
    ~counter.clock = p.clock;
    ~counter.quant = 16;
    ~counter = {PulseCount.kr(~tick.kr);};
    ~tick = { Impulse.kr( ~tempo * 4 ); };
);
