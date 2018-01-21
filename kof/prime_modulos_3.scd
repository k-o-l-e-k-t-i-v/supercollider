
97.33/90
p.push();
p.bpm(105/8)
~tempo.quant=16;
~tempo={125.33/120};

(
    s.latency=0.2;
    //p.clock.tempo_(120/60);
    p.arProxyNames.do({|synth| if(synth.asSymbol!=\master){p[synth.asSymbol].rebuild;};});
    ~tick.kr(1);
    ~tick.clock = p.clock;
    ~tick.quant = 0;
    ~counter.clock = p.clock;
    ~counter.quant = 0;
    ~counter = {PulseCount.kr(~tick.kr);};
    ~tick = { Impulse.kr( ~tempo * 4 ); };
);

// once synth ///////////////////////////////////////

(
    ~once.ar(2);
    ~once.quant=16;
    ~once.fadeTime=0.2;
    ~once={
        var mod2 =Duty.kr((1..16).nthPrime*2/~tempo,0,Dseq( (2**(([1200,102,600,306,1008,804])/1200) ),inf));
        var mod = Duty.kr((1..16).nthPrime*16/~tempo,0,Dseq([1,2,4,8],inf)) * mod2;
        var mel = Duty.kr((1..16).nthPrime*4/~tempo,0,Dseq([1,2,4,8,1/2,1/4,1/8],inf));
        //         |       |       |       |       |  
        var f = 432 / 1.5555 * (~tempo) * mod / ((((2..16).nthPrime)%((1..16).nthPrime))) / mel;//[150,133,200,1000];
        var env = (Decay.ar(Impulse.ar(4/(1..16).nthPrime*~tempo),0.12*((1..16).nthPrime**0.25)) );
        var sig = SinOsc.ar(f/[1,2,4],SinOsc.ar(f/2)*0.05pi*(env**LFTri.ar(~tempo/16/(1..16).nthPrime).exprange(0.1,40)),mul:1/((1..16).nthPrime**0.5)); 
        sig = sig * env;
        sig = sig + BPF.ar(Dust.ar(f/10,mul:env*10),f,0.002);
        sig = CompanderD.ar(sig,3/4,1/3,1/2);
        Splay.ar(sig,0.75,0.15);
    };
    ~once.play;
);
~once.stop(1);
~once.clear;
~once.pause;
~once.resume;

// kick synth ///////////////////////////////////////

(
    ~kick.ar(2);
    ~kick.clock = p.clock;
    ~kick.quant=[2,3];
    ~kick.fadeTime=0.02;
    ~kick={
        //  |       |       |       |       |  
        var pat = [
            1,0,0,0, 0,0,0,0, 1,0,0,0, 0,0,0,0,
            1,0,0,0, 1,0,0,0, 1,0,0,0, 1,0,0,0,
            1,0,0,0, 0,0,0,0, 1,0,0,0, 0,0,0,0,
            1,0,0,0, 1,0,0,0, 1,0,0,0, 1,0,0,0,
        ].rotate(1);
        var imp = PulseDivider.kr(~tick.kr,16,~counter.kr%pat.size);
        var hit = Select.kr(PulseCount.kr(imp)%pat.size,pat);
        var env = EnvGen.ar(Env([0.001,1,0.0001],[0.002,3.5],[3,-3]),imp * hit);
        var sig = SinOsc.ar(50!2,env**180*8pi);
        sig = sig * env;
        Splay.ar(sig,0.75,0.95);
    };
    ~kick.play;
);
~kick.stop(4);
~kick.clear;
~kick.pause;
~kick.resume;


(
    //s.latency=0.2;
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
(
    ~master.quant=2;
    ~master.play;
    ~master.fadeTime = 0.01;
    ~master = {|wet=0.45,lp=3500,hp=250,len=10,rev = 3|
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
