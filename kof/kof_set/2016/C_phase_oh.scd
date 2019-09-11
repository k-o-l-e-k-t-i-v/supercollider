

p.makeTempoClock;
(
    TempoClock.default = p.clock;
    p.clock.tempo_(127/60);
    p.arProxyNames.do(p[_.asSymbol].rebuild);
)

(
    s.latency=0.2;
    //p.clock.tempo_(120/60);
    p.arProxyNames.do({|synth| if(synth.asSymbol!=\master){p[synth.asSymbol].rebuild;};});
);


(

    (
        ~master.quant=16;
        ~master.play;
        ~master.fadeTime = 0.01;
        ~master = {|wet=0.35,lp=4500,hp=150,len=10,rev = 2|
            var sig = In.ar([0,1]);
            var orig = sig;
            var fx,low,high,mid;
            //fx = Limiter.ar(sig,0.95);

            //sig = CombN.ar(sig,1/50,1/50,1);
            low = CompanderD.ar(LPF.ar(sig,LFNoise2.kr(1/4!2*~tempo).range(100,800)),3/4,1,1/2);
            mid = CompanderD.ar(BPF.ar(sig,LFNoise2.kr(1/8!2*~tempo).range(500,4500),1/2),3/4,1,1/2);
            high = CompanderD.ar(HPF.ar(sig,LFNoise2.kr(1/16!2*~tempo).range(3000,10000)),3/4,1,1/2);
            sig = CompanderD.ar((high+mid+low).flat,3/4,1/1.4,1/1.2); 
            //sig = Compander.ar(sig,3/4,1/2,1/3);
            orig = sig;
            fx = LPF.ar(sig,lp);
            fx = HPF.ar(fx,hp);
            fx = DWGReverbC1C3.ar(NumChannels.ar(fx,2),[5000,5010],1/len)/rev;
            sig = SelectX.ar(wet,[orig,fx]);
            sig = NumChannels.ar(sig,2);
            sig = Limiter.ar(sig.softclip);
            ReplaceOut.ar(0,sig);
        };

        ~master_wet.quant = 4;
        ~master_wet = {LFDNoise1.kr(~tempo/4!2).exprange(0.05,0.35);};
        ~master.map(\wet,~master_wet);
    );
)


(
    //////////////////////////  FADE -> OUT ///////////////////////////////////////////////////////
    {
        p.arProxyNames.do({|synth| if(synth.asSymbol!=\master){p[synth.asSymbol].clear(20);};});
    }.fork;  
)


(
    //////////////////////////  FADE -> OUT ///////////////////////////////////////////////////////

    p.clock.sched(p.clock.timeToNextBeat(32),{
        p.arProxyNames.do({|synth| if(synth.asSymbol!=\master){p[synth.asSymbol].clear(16);};});
    });  
);

(
    /// 8 KICK start

    (
        ~kick2.ar(2);
        //  ~kick.clock = p.clock;
        ~kick2.quant = [16,0];
        ~kick2.fadeTime=0.02;

        ~kick2={
            //         |       |       |       |       |  
            var pat = [
                1,0,1,0,1,0,1,0,1,0,1,0,1,0,1,1,
                1,0,1,0,1,0,1,0,1,0,1,0,1,0,0,1,
                1,0,1,0,1,0,1,0,1,0,1,0,1,0,1,1,
                1,0,1,0,1,0,1,0,1,0,1,0,1,0,0,1,
            ].rotate(1);
            var mod2 = LFNoise2.kr(~tempo/160!4).range(2,80);
            var mod = LFDNoise1.kr(~tempo/160!4).range(2,80);
            var imp = PulseDivider.kr(~tick.kr,16);
            var hit = Select.kr(PulseCount.kr(imp)%pat.size,pat);
            var env = EnvGen.ar(Env([0.001,1,0.0001],[0.002,2.5/[1,1.01,1.011,1.0111]],[2,-3.3]), imp * hit);
            var hum = LFDNoise1.kr(~tempo).range(0.0,0.01);
            var sig;
            env = env ** LFNoise1.kr(1/64!4).range(0.07,1.6);

            // env = DelayN.ar(env,hum,hum);

            sig = Mix.fill(20,{|i|SinOsc.ar(33.midicps+(env**mod2*55),env**(mod2+i)*8pi)})/20.9;
            sig = sig * env;
            Splay.ar(sig,0.005,0.65);
        };
        ~kick2.play;
    );
)

(
    ~onea.ar(2);
    //    ~onea.clock = p.clock;
    ~onea.quant=[16,0];
    ~onea.fadeTime=0.02;
    ~onea={
        //         |       |       |       |       |  
        var pat = [
            1,0,1,0,1,0,1,0,1,0,1,0,1,0,1,0,
            1,0,1,0,1,0,1,0,1,0,1,0,1,0,1,0,
            1,0,1,0,1,0,1,0,1,0,1,0,1,0,1,0,
            1,0,1,0,1,0,1,0,1,0,1,0,1,0,1,1,
        ].rotate(1);
        var imp = PulseDivider.kr(~tick.kr,1);
        var imp2 = PulseDivider.kr(~tick.kr,[4,8,16,3]);
        var hit = Select.kr(PulseCount.kr(imp)%pat.size,pat);
        var hit2 = Select.kr(PulseCount.kr(imp2)%pat.size,pat);
        var env = EnvGen.ar(Env([0.001,1,0.0001],[0.002,0.5],[10,-3],curve:'exp'),imp * hit);
        var env2 = EnvGen.ar(Env([0.001,1,0.0001],[0.02,1.15],[10,-3],curve:'exp'),imp2 * hit2);
        var sig = SinOsc.ar(55 + (env**55*500)) ;

        //sig = LFSaw.ar([60,67,64].midicps*64+(env2**20*1500),mul:0.7)**LFNoise2.kr(1/16!2 * ~tempo).range(0.4,4)/1.5+sig;
        sig = LPF.ar(sig,LFSaw.kr([1,2,3,4]/16*~tempo).range(190,9000));

        sig = sig * env;

        //sig = GVerb.ar(HPF.ar(sig,900),10,3)/4+sig;
        //sig = GVerb.ar(LPF.ar(sig,900),100,10)/4+sig;
        sig = CompanderD.ar(sig,3/4,1/1.5,1);
        Splay.ar(sig,0.75,0.65);
    };
    //~onea[1] = \filter -> {|sig| DWGReverb.ar(HPF.ar(LPF.ar(sig,5000),50),[5000,5050],1/2)+sig};
    ~onea.play;
);

~onea.clear()


(
    //////////////////////////  FADE -> OUT ///////////////////////////////////////////////////////
    {
        p.arProxyNames.do({|synth| if(synth.asSymbol!=\master){p[synth.asSymbol].clear(60);};});
    }.fork;  
)

(
    ~kick.clear(1);
    ~onea.clear(1);
)

)


~onea.stop(4);
~onea.clear(2);
~onea.pause;
~onea.resume;

(
    //////////////////////////  FADE -> OUT ///////////////////////////////////////////////////////
    {
        p.arProxyNames.do({|synth| if(synth.asSymbol!=\master){p[synth.asSymbol].clear(20);};});
    }.fork;  
)

// circular synth ///////////////////////////////////////

(
    ~circular.ar(2);
    ~circular.clock = p.clock;
    ~circular.quant=[16,0];
    ~circular.fadeTime=0.004;
    ~circular={
        var xx;
        var yy;
        var speed = (1..16) / ~tempo * 4;
        var filfreq2 = Duty.ar(speed*16,0,Dseq(([60,64,67,69] +.x [0,0,0,-12,-24,12,24,36,48]).midicps,inf)) + SinOsc.kr(1/8/speed,mul:10).lag(4);
        var filfreq = Duty.ar(speed*4,0,Dseq(([60,64,67,69] +.x [0,0,0,-12,-24,12,24,36,48]).midicps,inf)) + SinOsc.kr(filfreq2/speed,mul:100).lag(4);
        var ff = filfreq+(speed/100);
        var loop = filfreq+(speed/100);
        var t = LFSaw.ar(loop).range(0,2pi) + LFTri.ar(1/400/speed,mul:44100);
        var st = LFTri.ar(loop/10).range(0,2pi) + LFTri.ar(1/40,mul:8pi);
        var x = t.cos;
        var y = t.sin;
        var sx = st.cos;
        var sy = st.sin;


        var sig = Perlin3.ar(x,y,t*ff);
        var bck = Perlin3.kr(sx,sy,st);
        RandSeed.kr(Impulse.kr(1/128*~tempo),2017);
        sig = BBandPass.ar(sig,filfreq2,LFTri.ar(1/16/speed).exprange(0.0005,1)**4/2);
        sig = Resonz.ar(sig,filfreq*4,0.62);
        sig = Normalizer.ar(sig) * (LFTri.kr(1/4/speed)**4) * (LFTri.kr(1/16/speed)**4);
        sig = LeakDC.ar(sig);
        sig = AllpassN.ar(PitchShift.ar(sig,2/filfreq,1/[1,1.5,2,1.3333]),1,1,[1,2,3,4]);
        sig = sig/4+LPF.ar(sig,3000);
        sig = CompanderD.ar(sig,1/2,1,1/4);
        #xx,yy = Pan4.ar(NumChannels.ar(sig,4),sx,sy)+sig;
        sig = []++xx++yy;
        Splay.ar(sig,0.75,0.125);
    };
    ~circular.play;
    ~circular[1] = \filter -> {|sig| DWGReverbC1C3.ar(HPF.ar(LPF.ar(sig,5000),50),[5000,5050],1/2)+sig};
    ~circular[2] = \filter -> {|sig| NumChannels.ar(Resonz.ar(sig,LFTri.ar(1/16/(1..16)).exprange(130,14000),0.42),2)*2+sig;};
);
~circular.stop(4);
~circular.clear(2);
~circular.pause;
~circular.resume;


(
    //////////////////////////  FADE -> OUT ///////////////////////////////////////////////////////
    {
        p.arProxyNames.do({|synth| if(synth.asSymbol!=\master){p[synth.asSymbol].clear(10);};});
    }.fork;  
)

(
    p.clock.sched(p.clock.timeToNextBeat(16),{ ~hiss.clear; });
);


(
    ~chaos.clock = p.clock;
    ~chaos.quant = [16,0];
    ~chaos.fadeTime = 1;
    ~chaos={
        var sig;
        var all = [];
        var mod = TWChoose.kr(Impulse.kr(1/4*(1..16)*~tempo),[1,2,4,8,16,1.5,1.33333,1.25,1.125],[7,6,5,4,3,2,1],1).lag(1/10);
        sig = {ChaosGen.allSubclasses.choose.ar}!16 * (Decay.ar(Impulse.ar(1/(1..16) * ~tempo),0.2 * LFNoise2.kr(1/16*~tempo*16).range(0.7,1.2)) ** 2);
        sig = LeakDC.ar(sig) * LFPulse.ar(8*~tempo*mod);
        sig = CompanderD.ar(sig,3/4,1/2,1/2);
        sig = PitchShift.ar(sig,0.05,1/mod/[1,2,1,4,1,8,1,16]);
        //sig = TChoose.ar(Impulse.ar(~tempo*4),all);
        Splay.ar(sig,0.92,0.05,SinOsc.ar(1*~tempo));
    };
    ~chaos.play;
);
~chaos.clear(16);
(
    p.clock.sched(p.clock.timeToNextBeat(16),{ ~chaos.clear; });
);


// shuttles synth ///////////////////////////////////////

(
    ~shuttles.ar(2);
    ~shuttles.clock = p.clock;
    ~shuttles.quant=[16];
    ~shuttles.fadeTime=4;
    ~shuttles={
        var mod = Duty.kr(4/~tempo,0,Dseq([1,2,1,4,1,1.5],inf));
        var t = LFSaw.ar([1,1/4/[1,2,3,4]*~tempo/2,LFSaw.ar(1/5000).range(1,50)]) + LFSaw.ar(1/4000) * 40;
        var sig = Perlin3.ar(t[0],t[1],t[2])/2;// * Decay.ar(Impulse.ar(8/[1,2,3,4]),0.02);
        var f = 1/[100,200,2000,1000]/mod;// + (Pulse.ar(4/[1,2,3,4],mul:1/100000));
        sig = LocalIn.ar(4) + sig;
        sig = BPF.ar(sig,LFSaw.ar(1/16/[1,2,3,4]*~tempo/2).exprange(50.01,15000),0.1);
        sig = DelayN.ar(sig,f,f) * LFTri.ar(1/32/[1,2,4,1.5] * ~tempo/2).range(0.15,1);
        //sig = Normalizer.ar(sig)/2;
        LocalOut.ar(sig/1.00001);

        Splay.ar(sig,0.95,0.35,SinOsc.kr(2/[5,6]*~tempo));
    };
    ~shuttles.play;
);
~shuttles.stop(4);
~shuttles.clear(20);
(
    p.clock.sched(p.clock.timeToNextBeat(16),{ ~shuttles.clear; });
);





(
    //////////////////////////  FADE -> OUT ///////////////////////////////////////////////////////
    {
        p.arProxyNames.do({|synth| if(synth.asSymbol!=\master){p[synth.asSymbol].clear(40);};});
    }.fork;  
)

// lark synth ///////////////////////////////////////

(
    ~lark.ar(2);
    ~lark.clock = p.clock;
    ~lark.quant=16;
    ~lark.fadeTime=4;
    ~lark={
        var mod = Duty.kr(4/~tempo,0,Dseq([1,2,1.5,1.333333],inf));
        var a = LFTri.ar(1/4/[1,2,3,4]*~tempo) + LFTri.ar(1/4000,mul:10);
        var t = Perlin3.ar(a,a,a);
        var f = t.exprange(450.1,5230).round(1.octcps)/mod*[1,2,1.3333,1.5];
        var sig = PinkNoise.ar(0.12!4) + LocalIn.ar(4);
        sig = DelayN.ar(sig,1/f,1/f);
        sig = SelectX.ar( LFTri.ar(1/16/[1,2,3,4]*~tempo) ** 2 * 2, [LPF.ar(sig,f),BPF.ar(sig,f),DFM1.ar(sig,f,0.2)]);
        sig = CompanderD.ar(sig,3/4,1/1.52,1/1.02,0.0002,0.1);
        //sig = PitchShift.ar(sig,1/f,2.0195);
        LocalOut.ar(Normalizer.ar(sig));
        sig = CompanderD.ar(sig,3/4,1/2,1/2);
        Splay.ar(sig * LFTri.ar(1/4/[1,2,3,4]*~tempo),0.95,0.15);
    };
    ~lark.play;
    ~lark[10] = \filter -> {|in| NumChannels.ar(GVerb.ar(Resonz.ar(in,1500/[1,2,4,1.5]) * LFSaw.ar(1/2/[1,2,3,4]),[10,20,90,89])+in,2);};
);
~lark.clear(10);

(
    //////////////////////////  FADE -> OUT ///////////////////////////////////////////////////////
    {
        p.arProxyNames.do({|synth| if(synth.asSymbol!=\master){p[synth.asSymbol].clear(20);};});
    }.fork;  
)

// one synth ///////////////////////////////////////

(
    ~mel_tick.ar(2);
    ~mel_tick.clock = p.clock;
    ~mel_tick.quant=4;
    ~mel_tick.fadeTime=32;
    ~mel_tick={
        var f,sig,slo;
        slo = 4;
        f = TChoose.kr(Impulse.ar(1/slo/(1..16)*~tempo/2),[60,65,67,64,57,72,36].midicps)/[1,1.5];
        10.do{|n|
            f = f/{TChoose.kr(Impulse.kr(1/slo/n/(1..16)*~tempo/2),[1,2,1.333333,1/2,1/1.333333,1.5,1/1.5])};
        };
        sig = Formant.ar(f,f*4,LFTri.ar(1/slo/(1..16)).range(50,5000)*~tempo/2) * (LFTri.ar(1/8/(1..16))**4);

        //sig = Pulse.ar(8/(1..16)) * sig;
        sig = Vibrato.ar(sig,[6,7,8,9],0.12) + (WhiteNoise.ar(0.01)*Pulse.ar(TChoose.kr(Impulse.ar(4/slo/(1..16)*~tempo/2),[2,4,8,16,32,44,22,33])));
        sig = MoogFF.ar(sig,f*2,2.85);
        //sig = sig /2 + LPF.ar(sig,f+SinOsc.kr([1,2,3,4],mul:2pi),0.2);
        sig = CompanderD.ar(sig,3/4,1/2,1/2);
        Splay.ar(sig,0.85,0.15);
    };
    ~mel_tick.play;
);
~mel_tick.stop(120);
~mel_tick.clear(20);
~mel_tick.pause;
~mel_tick.resume;
