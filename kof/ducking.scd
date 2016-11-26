

(
    p=ProxySpace.push(s.boot);
    p.makeTempoClock;
);

(
    ~tick.kr(1);
    ~tick.clock = p.clock;
    ~tick.quant=16;
    ~tick = { Impulse.kr(~tempo * 2); };
    ~counter = {PulseCount.kr(~tick.kr);};
);


p = NetProxy.push();
p.makeTempoClock;

(
  p=NetProxy.push();
s.latency = 0.95;
);

p.bpm(127/2);

(
    // world is predictable, and seekable ))
    //~seed.quant=16;
    //~seed = {RandSeed.ar(Impulse.ar(1/16*~tempo),(2012..2016) )};
    //~seed.play;

    (
        ~master.quant=16;
        ~master.play;
        ~master.fadeTime = 0.01;
        ~master = {|wet=0.15,lp=3500,hp=250,len=20,rev = 2,duck=0.2|
            var sig = In.ar([0,1]);
            var orig = sig;
            var fx;
            sig = Limiter.ar(sig,0.95);
            sig = Compander.ar(sig,~kick.ar,LFNoise2.kr(1/4*~tempo!2).range(0.1,0.9),1,0.01)*duck+sig;
            fx = LPF.ar(sig,lp);
            fx = HPF.ar(fx,hp);
            fx = DWGReverb.ar(NumChannels.ar(fx,2),[5000,5010,2000,3000],1/len)/rev;
            sig = SelectX.ar(wet,[orig,fx]);
            sig = NumChannels.ar(sig,2);
            //sig = sig + ~kick.ar;
            sig = HPF.ar(sig,20);
            sig = HPF.ar(sig,20);
            sig = CompanderD.ar(sig,9/10,1,1/3);
            sig = Limiter.ar(sig,0.95);
            ReplaceOut.ar(0,sig);
        };
    );
    p.moveNodeToTail(\master);

    // kick synth ///////////////////////////////////////

    (
        ~kick.ar(2);
        ~kick.clock = p.clock;
        ~kick.quant=[16,0];
        ~kick.fadeTime=0.02;
        ~kick={
            //  |       |       |       |       |  
            var pat = [
                [
                    1,0,1,0, 1,0,1,0, 1,0,1,0, 1,0,1,0,
                    1,0,1,0, 1,0,1,0, 1,0,1,0, 1,0,1,0,
                    1,0,1,0, 1,0,1,0, 1,0,1,0, 1,0,1,0,
                    1,0,1,0, 1,0,1,0, 1,0,1,0, 1,1,1,1,
                ],
                [0,0,1,0, 1,0,0,0, 0,0,1,0, 1,0,1,0],
                [0,0,1,0, 1,0,1,0, 0,0,1,0, 1,0,0],

            ];
            var imp = PulseDivider.kr(~tick.kr,[1,2,4]);
            var hit = Select.kr(PulseCount.kr(imp)%pat.size,pat);
            var env = {EnvGen.ar(Env([0.001,1,0.0001],[0.002,LFNoise2.kr(1/16*~tempo).range(0.2,1)],[3,-3]),imp * hit)};
            var sig = SinOsc.ar(55!3,env**LFNoise2.kr(1/16*~tempo!3).range(1,80)*8pi)/3;
            sig = sig * env;
            Splay.ar(sig,0.005,0.25);
        };
        ~kick.play;
    );
    // hiss synth ///////////////////////////////////////

    (
        ~hiss.ar(2);
        ~hiss.clock = p.clock;
        ~hiss.quant=[16,1/16];
        ~hiss.fadeTime=0.02;
        ~hiss={
            //  |       |       |       |       |  
            var pat = [

                [
                    1,0,1,0, 1,0,1,0, 1,0,1,0, 1,0,1,0,
                    1,0,1,0, 1,0,1,0, 1,0,1,0, 1,0,1,0,
                    1,0,1,0, 1,0,1,0, 1,0,1,0, 1,0,1,0,
                    1,0,1,0, 1,0,1,0, 1,0,1,0, 1,1,1,1,
                ],[
                    1,0,1,0, 1,0,1,0, 1,0,1,0, 1,0,1,0,
                    1,0,1,0, 1,0,1,0, 1,0,1,1, 1,0,1,0,
                    1,0,1,0, 1,0,1,0, 1,0,1,0, 1,0,1,0,
                    1,0,1,0, 1,0,1,0, 1,0,1,0, 1,1,1,1,
                ],[
                    1,0,0,0, 1,0,1,0, 1,0,1,0, 1,0,1,0,
                    1,0,0,0, 1,0,1,0, 1,0,1,0, 1,0,1,0,
                    1,0,0,0, 1,0,1,0, 1,0,1,0, 1,0,1,0,
                    1,0,0,0, 1,0,1,0, 1,0,1,0, 1,1,1,1,
                ],[
                    1,0,1,0, 1,0,1,0, 1,0,1,0, 1,0,1,0,
                    1,0,1,0, 1,0,1,0, 1,0,1,0, 1,0,1,0,
                    1,0,1,0, 1,0,1,0, 1,0,1,0, 1,0,1,0,
                    1,1,1,1, 1,0,1,0, 1,1,1,1, 1,1,1,1,
                ]
            ];
            var imp = PulseDivider.kr(~tick.kr,[1,3,7,9],~counter.kr%pat.size);
            var hit = Select.kr(PulseCount.kr(imp)%pat.size,pat);
            var env = {EnvGen.ar(Env([0.001,1,0.0001],[0.002,LFNoise2.kr(1/16!4).exprange(0.02,0.5)],[3,-3]),imp * hit)};
            var sig = BPF.ar(WhiteNoise.ar(0.4!4),LFNoise2.kr(1/16!4).range(500,15000),LFNoise2.kr(1/16!4).range(0.1,0.9));
            sig = sig * env;
            Splay.ar(sig,0.75,0.05);
        };
        ~hiss.play;
    );

// background synth ///////////////////////////////////////

(
    ~background.ar(2);
    ~background.clock = p.clock;
    ~background.quant=[16,0];
    ~background.fadeTime=14.02;
    ~background={
        //  |       |       |       |       |  
        var pat = [
            [0,1,1,0,0,0,0,],
            [1,0,1,0,0,0,0,0],
            [0,0,1,1,0,0,0,0,0],
        ];
        var f;
        var note  = Duty.kr(4/~tempo,0,Dseq([64,67,69,63],inf));
        var base = ([60,60,note]).midicps;
        var env_mod = Duty.kr(1/16/~tempo*[2,4,8]*1,0,Dseq([1,2,16,32],inf)).lag(4);
        var mod2 = Duty.kr(4*16/~tempo*[2,4,8]/4,0,Dseq([1,2,1,4,1,1.5],inf));
        var mod = Duty.kr(16/~tempo*[2,4,8]/2,0,Dseq([1,0.5,1/4,4]/mod2*[1,2,0.5],inf)).lag(1/40);
        var imp = PulseDivider.kr(~tick.kr,[1,2,3,4],~counter.kr%pat.size);
        var hit = Select.kr(PulseCount.kr(imp)%pat.size,pat);
        var env = {EnvGen.ar(Env.asr(0.002,1/16*env_mod,2/16*env_mod,[2,-2,-8]*env_mod),imp * hit)};
        var t = SinOsc.ar([base*mod,LFSaw.kr(1/3200*~tempo,mul:10),env**LFDNoise1.kr(1/16!3).range(1/20,4)]).abs + 1 * LFNoise2.kr(1/160!3 * ~tempo).exprange(1/4,4);
        var sig = Perlin3.ar(t[0],t[1],t[2]);
        sig = LPF.ar(sig,LFNoise2.kr(1/16!3).exprange(15000.01,50));
        sig = sig * env;
        sig = CompanderD.ar(sig,3/4,1/2,1);
        Splay.ar(sig,0.75,0.95);
    };
    ~background.play;
);

/*
~background.stop(16);
~background.clear;
~background.pause;
~background.resume;
*/
// background synth ///////////////////////////////////////

(
    ~background2.ar(2);
    ~background2.clock = p.clock;
    ~background2.quant=[16,0];
    ~background2.fadeTime=14.02;
    ~background2={
        //  |       |       |       |       |  
        var pat = [
            [1,1,1,1, 0,0,0,0, 0,0,0,0, 0,0,0,0, 0],
            [1,0,0,0, 1,0,0,0, 0,0,0,0],
            [0,0,1,0, 0],
        ];
        var f;
        var note  = Duty.kr(4/~tempo,0,Dseq([64,67,69,63],inf));
        var base = ([60,60,note]-12).midicps;
        var env_mod = Duty.kr(1/16/~tempo*[2,4,8]*1,0,Dseq([1,2,16,32],inf)).lag(4);
        var mod2 = Duty.kr(4*16/~tempo*[2,4,8]/4,0,Dseq([1,2,1,4,1,1.5],inf));
        var mod = Duty.kr(16/~tempo*[2,4,8]/8,0,Dseq([1,0.5,1/2,2]/mod2*[1,2,0.5],inf)).lag(1/40);
        var imp = PulseDivider.kr(~tick.kr,[1,2,3,4],~counter.kr%pat.size);
        var hit = Select.kr(PulseCount.kr(imp)%pat.size,pat);
        var env = {EnvGen.ar(Env.asr(0.002,env_mod/8,env_mod/4,[-4,-2,-8]*env_mod),imp * hit)};
        var t = SinOsc.ar([base*mod,LFSaw.kr(1/3200*~tempo,mul:10),env**LFDNoise1.kr(1/16!3).range(1/20,4)]).abs + 1 * LFNoise2.kr(1/160!3 * ~tempo).exprange(1/4,4);
        var sig = Perlin3.ar(t[0],t[1],t[2]);
        sig = LPF.ar(sig,LFNoise2.kr(1/16!3).exprange(15000.01,50));
        sig = sig * env;
        sig = CompanderD.ar(sig,3/4,1/2,1);
        Splay.ar(sig,0.75,0.5);
    };
    ~background2.play;
);


);
