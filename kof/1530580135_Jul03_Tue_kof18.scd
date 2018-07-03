
p.push();
p.bpm(90)

// one synth ///////////////////////////////////////

(
    ~one.ar(2);
    ~one.clock = p.clock;
    ~one.quant=4;
    ~one.fadeTime=4;
    ~one={
        var mod = Duty.kr(8/~tempo*[1,4,8,16],0,Dseq([1,2,1.5,1.33333],inf)).lag(1);
        var imp = ~tempo/[1,2,3,4]*2;
        var f = 6.octcps*3/4/[1,2,1.3333334,1.5] + SinOsc.kr(~tempo/[1,2,3,4],mul:0.003) * mod;
        var sig = FBSineC.ar(f,0.5,LFSaw.ar(~tempo/16/[1,2,3,4]).range(1,0.1),LFNoise1.kr(~tempo/32/[1,2,3,4]).range(1,0.1),LFNoise1.kr(~tempo/32/[1,2,3,4]).range(1,0.1),LFNoise1.kr(~tempo/32/[1,2,3,4]).range(1,0.1),LFNoise1.kr(~tempo/32/[1,2,3,4]).range(1,0.1)) * Decay2.ar(Impulse.ar(imp),0.001,0.004) + LocalIn.ar(4);
        sig = DelayN.ar(sig,1/f,1/f);
        sig = DFM1.ar(sig,f*[1,1.5],LFTri.ar(1/16/[1,2,3,4]).range(0.0001,0.2));
        sig = LPF.ar(sig,f);
        sig = LeakDC.ar(sig);
        sig = Limiter.ar(sig,0.9999996);
        LocalOut.ar(sig*0.2496*4/3);
        sig = CompanderD.ar(sig,1/2,1/1.5,1);
        sig = Compander.ar(sig,~kick.ar,0.1,1,0.1);
        Splay.ar(sig,0.5,0.29);
    };
    ~one.play;
);
~one.stop(4);
~one.clear;
~one.pause;
~one.resume;


(
    s.latency=2/3;
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
        ].rotate(1);
        var mod = Duty.kr(16/~tempo,0,Dseq([1,2,1.5,1.33333],inf));
        var imp = PulseDivider.kr(~tick.kr,1,~counter.kr%pat.size);
        var hit = Select.kr(PulseCount.kr(imp)%pat.size,pat);
        var env = EnvGen.ar(Env([0.001,1,0.0001],[0.002,1.5],[3,-3]),imp * hit);
        var sig = SinOsc.ar(33+(env**80*33.3)+(1..8).reciprocal,env**40*pi);
        sig = LeakDC.ar(sig);
        sig = sig * env;
        Splay.ar(sig,0.75,0.5);
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
        var env = EnvGen.ar(Env([0.001,1,0.0001],[0.0013,0.04513],[3,-3]),imp * hit);
        var sig = WhiteNoise.ar(env**alpha) + GrayNoise.ar(0.97!4 + (env**beta*0.4));
        sig = HPF.ar(sig,LFSaw.kr(~tempo/4/[1,2,3,4]).range(500,15000));
        sig = sig * env;
        sig = Compander.ar(sig,~kick.ar,LFNoise2.kr(1/4*~tempo!2).range(0.1,0.9),1,0.01);
        Splay.ar(sig,0.65,0.05);
    };
    ~hihat.play;
);
~hihat.stop(4);
~hihat.clear;
~hihat.pause;
~hihat.resume;

// one synth ///////////////////////////////////////

(
    ~dark_perl.ar(2);
    ~dark_perl.clock = p.clock;
    ~dark_perl.quant=[16,0];
    ~dark_perl.fadeTime=2;
    ~dark_perl={
        var mod = Duty.kr(16/~tempo*[1,2,3],0,Dseq([1,2,1.5,1.33333],inf));
        var t = SinOsc.ar([1/160,1/1600,3.octcps*3/4*[1,1.005,1.00001]*mod/[1,1.5,mod]]).range(0,2pi) + SinOsc.ar(4+(40..44).reciprocal,mul:1/10).range(0,1);
        var perl = Perlin3.ar(t.sin,t.cos,t);
        var sig = VarSaw.ar(3.octcps*3/4/[1,2,3,4]+(33..38).reciprocal,0,perl**LFTri.ar(~tempo/16).exprange(0.01,2));
        sig = LPF.ar(sig,3303) * LFTri.ar(~tempo*2/[1,2,3,4]) + HPF.ar(sig,14000) * SinOsc.ar(3.octcps*3/4/[4,3,2,1],perl);
        sig = LeakDC.ar(sig);
        //sig = sig * Decay.kr(Impulse.kr(1/4/[1,2,3,4]),4);
        sig = BPF.ar(sig * LFTri.ar(1/(1..12)),110*.x[1,2,4,8,16]*(2**((1..12)/12)),0.2);
        sig = CompanderD.ar(sig,3/4,1/1.5,1);
        sig = CombL.ar(sig,1/2,1/55,2);
        sig = Compander.ar(sig,~kick.ar,0.1,1,0.1);
        Splay.ar(sig,0.25,0.0015);
    };
    ~dark_perl.play;
);
~dark_perl.stop(4);
~dark_perl.clear;
~dark_perl.pause;
~dark_perl.resume;

// harm synth ///////////////////////////////////////

(
    ~harm.ar(2);
    ~harm.quant=16;
    ~harm.fadeTime=4;
    ~harm={
        var speed = 1/32/(1..3) * ~tempo;
        var master = Duty.kr(1/speed,0,Dseq([1,1.33333,2,1.5].pyramid,inf));
        var change = Impulse.kr(speed);
        var tonic = Duty.kr(1/speed*8,0,Dseq([1,5/4,3/2,15/8].scramble.pyramid,inf)) ;
        var mod = Duty.kr(1/speed*[1,2,3],0,Dseq([2,4,1.5,2,1,1.5,4,3],inf))/[1.5,1];
        var mel = Duty.kr(1/speed*16,0,Dseq([1,2,3,4,3,4,5,6].scramble.octcps*3/4/mod,inf));
        var f = mel * tonic + SinOsc.kr(1/6/(1..4),mul:0.3) /  master;
        //var sig = SinOsc.ar(f,mul:LFNoise2.kr(1/16!8)) +PinkNoise.ar(0.1!8);
        var sig = BrownNoise.ar(1!6);

        sig = Vibrato.ar(sig,[3,4,5,6,5,6,7],0.02) ;//SinOsc.ar(1/f/[9/8,4/3,5/3,2]);
        sig = LPF.ar(sig,2000);
        //sig = MoogFF.ar(sig,f*4,3.5);
        //sig = AllpassN.ar(sig * (LFTri.ar(speed)**2),1/f,1/f*4,4);
        sig = DFM1.ar(sig,f,LFNoise1.kr(~tempo/16/[1,2,3]).range(0.01,0.3));
        sig= CombN.ar(sig,1/f,4/f,2);
        sig = LeakDC.ar(sig);
        sig = AllpassN.ar(sig * (LFTri.ar(speed)**2),2/f,1/f,2);
        sig = CompanderD.ar(sig,3/4,1/2,1);
        sig = HPF.ar(sig,100);
        //sig = Compander.ar(sig,~kick.ar,0.1,1,0.1);
        //sig = sig * LFSaw.ar(speed);
        Splay.ar(sig,0.95,0.015);
    };
    ~harm.play;
    //~harm[1] = \filter -> {|sig| DWGReverb.ar(LPF.ar(HPF.ar(sig,200),3500),[4020,4000])/2+sig;};
);
~harm.stop(4);
~harm.clear(20);
~harm.pause;
~harm.resume;

(
    n = [
        "/home/kof/Downloads/sounds/63862__moppetron__stayingalive-tamburin.wav",
        "/home/kof/Downloads/sounds/354140__inspectorj__triangle-4-hard-hit-a.wav",
        "home/kof/Downloads/sounds/360327__inspectorj__triangle-8-hard-hit-a.wav",
    ]
);

b = Buffer.read(s,n[0]);


(
    //////////////////////////  FADE -> OUT ///////////////////////////////////////////////////////
    {
        p.arProxyNames.do({|synth| if(synth.asSymbol!=\master){p[synth.asSymbol].clear(120);};});
    }.fork;  
)

// player synth ///////////////////////////////////////

(
    ~sample_one.ar(2);
    ~sample_one.quant=4;
    ~sample_one.fadeTime=0.2;
    ~sample_one={
        var mod = 1;//[-1,0.25,-0.25,1/8,1/16];
        var spread = 0.0001;
        var pos = [0,0.5,0.25,0.75] * LFSaw.ar(~tempo/16*[1,2,3,4]);
        //         |       |       |       |       |  
        var pat = [
            1,0,1,0,1,0,1,0,1,0,1,0,1,0,1,0,1,0,1,0,1,0,1,0,1,0,1,0,1,0,1,0, 
            1,0,1,0,1,0,1,0,1,0,1,0,1,0,1,0,1,0,1,0,1,0,1,0,1,0,1,0,1,0,1,0, 
            1,0,1,0,1,0,1,0,1,0,1,0,1,0,1,0,1,0,1,0,1,0,1,0,1,0,1,0,1,0,1,0, 
            1,0,1,0,1,0,1,0,1,0,1,0,1,0,1,0,1,0,1,0,1,0,1,0,1,0,1,0,1,0,1,1, 
        ].rotate(1);
        var imp = PulseDivider.kr(~tick.kr,[1,2,3,4],~counter.kr);
        var hit = Select.kr(PulseCount.kr(imp)%pat.size,pat);
        var env = EnvGen.ar(Env([0.001,1,0.001],[0.002,1.5],[3,-3],curve:'exp'),imp * hit);
        var sig = PlayBuf.ar(b.numChannels,b.bufnum,BufRateScale.kr(b.bufnum)*mod+(env*0.01),imp, (pos + BrownNoise.ar(1!8).range(spread * -1,spread)) * BufFrames.kr(b.bufnum),1);

        sig = sig * env;
        sig = Resonz.ar(sig,LFDNoise1.kr(~tempo/32!4).range(50,15000),env);
        Splay.ar(sig.flat,0.75,0.75);
    };
    ~sample_one.play;
);
~sample_one.stop(7);
~sample_one.clear;



b = Buffer.read(s,n[1]);


// player synth ///////////////////////////////////////

(
    ~sample_two.ar(2);
    ~sample_two.quant=4;
    ~sample_two.fadeTime=2.02;
    ~sample_two={
        var mod = (1) + (2**([1,3,5,7,11,12]/12)) / Duty.kr([1,2,3,4,5,6,7]*16/~tempo,0,Dseq([1,2,1.5,1.33333,4,8,16,32],inf));
        var spread = 0.001;
        var pos = 1/(1..8);
        //         |       |       |       |       |  
        var pat = [
            1,0,0,0,1,0,0,0,1,0,0,0,1,0,0,0,
            1,0,0,0,1,0,0,0,1,0,0,0,1,0,0,0,
            1,0,0,0,1,0,0,0,1,0,0,0,1,0,0,0,
            1,0,0,0,1,0,0,0,1,0,0,0,1,1,1,1,
        ].rotate(1);
        var imp = PulseDivider.kr(~tick.kr,[1,2,3,4,6,7,8]*16,~counter.kr);
        var hit = Select.kr(PulseCount.kr(imp)%pat.size,pat);
        var env = EnvGen.ar(Env([0.001,1,0.001],[0.002,4.15],[3,-3],curve:'exp'),imp * hit);
        var sig = PlayBuf.ar(b.numChannels,b.bufnum,BufRateScale.kr(b.bufnum)*mod+(env*0.01),imp, (pos + BrownNoise.ar(1!8).range(spread * -1,spread)) * BufFrames.kr(b.bufnum),1);

        sig = sig * env;
        sig = CompanderD.ar(sig,3/4,1/3,1);
        Splay.ar(sig.flat,0.5,0.005);
    };
    ~sample_two.play;
);
~sample_two.stop(7);
~sample_two.clear;



(
    ~master.quant=16;
    ~master.play;
    ~master.fadeTime = 0.01;
    ~master = {|wet=0.35,lp=4500,hp=250,len=10,rev = 1.5|
        var sig = In.ar([0,1]);
        var orig = sig;
        var fx,low,high,mid;
        //fx = Limiter.ar(sig,0.95);

        //sig = CombN.ar(sig,1/50,1/50,1);
        low = CompanderD.ar(LPF.ar(sig,LFNoise2.kr(1/4!2*~tempo).range(100,800)),3/4,1/1.2,1);
        mid = CompanderD.ar(BPF.ar(sig,LFNoise2.kr(1/8!2*~tempo).range(500,4500),1/2),3/4,1/1.2,1);
        high = CompanderD.ar(HPF.ar(sig,LFNoise2.kr(1/16!2*~tempo).range(3000,10000)),3/4,1/1.2,1);
        sig = CompanderD.ar((high+mid+low).flat,3/4,1/1.2,1); 
        //sig = Compander.ar(sig,3/4,1/2,1/3);
        orig = sig;
        fx = LPF.ar(sig,lp).distort;
        fx = LPF.ar(fx,lp);
        fx = HPF.ar(fx,hp);
        fx = HPF.ar(fx,hp);
        fx = DWGReverbC1C3.ar(NumChannels.ar(fx,2),[5000,5010],1/len)/rev;
        sig = SelectX.ar(wet,[orig,fx]);
        sig = NumChannels.ar(sig,2);
        sig = Limiter.ar(sig.softclip);
        ReplaceOut.ar(0,sig);
    };

    ~master_wet.quant = 4;
    ~master_wet = {LFDNoise1.kr(~tempo/16!2).exprange(0.05,0.35);};
    ~master.map(\wet,~master_wet);
    //    p.moveNodeToTail(\master);
);
p.moveNodeToTail(\master);
p.gui

