(
    p.push();
    p.bpm(120);
    s.latency = 0.15;
)

(
    s.latency=0.224;
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

// pass synth ///////////////////////////////////////

(
    ~pass.ar(2);
    ~pass.clock = p.clock;
    ~pass.quant=4;
    ~pass.fadeTime=4;
    ~pass={
        var mod= Duty.kr(16/~tempo,0,Dseq([1,2,1.5,1.33333]*.x[1,2,4,8],inf));
        var sig = Normalizer.ar(AudioIn.ar(1) * 0.99999);
        var f = LFTri.ar(~tempo/(1..8)/32).range(40,120)/.x[1,2,1.5,1.3333] + SinOsc.ar(1/(60..50)).range(-0.2pi,0.2pi) * mod;
        var q = SinOsc.ar(~tempo/[1,2,3,4]+0.01 * 4).range(0.001,0.38) ;

        //sig = DelayN.ar(sig,1/f,1/f) * (LFSaw.ar(~tempo/[1,2,3,4])**2);
        sig = sig * (LFTri.ar(~tempo/32/(1..8)).exprange(0.001,0.9) ** 0.2);
        sig = BPF.ar(sig,f,q);
        sig = CompanderD.ar(sig,3/4,1/3,1/2);
        sig = AllpassN.ar(sig,1/50+LFNoise2.kr(1/32).range(0.00001,0.01),1/50)/4+sig * Pulse.ar(~tempo * [2,0.75,1/8] /.x [1,2,3,4]);

        [Mix.ar(sig),DC.ar(0)];
    };
    ~pass.play;
);
~pass.stop(4);
~pass.clear;
~pass.pause;
~pass.resume;

(
    ~output.ar(2);
    ~output.clock = p.clock;
    ~output.quant=16;
    ~output.fadeTime=4;
    ~output={
        var sig = ~pass.ar;
        //sig = LPF.ar(sig,1400);
        sig = AllpassN.ar(sig,1,1/50);
        [DC.ar(0),Splay.ar(sig,0.5,0.15,SinOsc.ar(~tempo/[1,2,3,4]))];
    };
    ~output.play;
);
~output.stop(4);
~output.clear;
~output.pause;
~output.resume;


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


// hiss synth ///////////////////////////////////////

(
    ~hiss.ar(2);
    ~hiss.clock = p.clock;
    ~hiss.quant=[4,3];
    ~hiss.fadeTime=4;
    ~hiss={
        var sig = HPF.ar(WhiteNoise.ar(0.1)+~pass.ar,8000) * Pulse.ar(8*~tempo/(1..8));
        [sig/4,Splay.ar(sig,0.5,0.25)];
    };
    ~hiss.play;
);
~hiss.stop(4);
~hiss.clear;
~hiss.pause;
~hiss.resume;


(
    //////////////////////////  FADE -> OUT ///////////////////////////////////////////////////////
    {
        p.arProxyNames.do({|synth| if(synth.asSymbol!=\master){p[synth.asSymbol].clear(16);};});
    }.fork;  
)

// kick synth ///////////////////////////////////////

(
    ~kick.ar(2);
    ~kick.clock = p.clock;
    ~kick.quant=[16,0];
    ~kick.fadeTime=0.02;
    ~kick={
        //  |       |       |       |       |  
        var pat = [
            1,0,0,0, 0,0,0,0, 1,0,0,0, 0,0,0,0,
            1,0,0,0, 0,0,0,0, 1,0,0,0, 0,0,0,0,
            1,0,0,0, 0,0,0,0, 1,0,0,0, 0,0,0,0,
            1,0,0,0, 0,0,0,0, 1,0,0,0, 1,1,1,1,
        ].rotate(1);
        var imp = PulseDivider.kr(~tick.kr,1,~counter.kr%pat.size);
        var hit = Select.kr(PulseCount.kr(imp)%pat.size,pat);
        var env = EnvGen.ar(Env([0.001,1,0.0001],[0.002,2.5],[3,-3]),imp * hit);
        var sig = SinOsc.ar(5,env**20*8pi) + VarSaw.ar(25,0,env**0.2);
        sig = sig * env;
        [DC.ar(0),Splay.ar(sig,0.75,0.95)];
    };
    ~kick.play;
);
~kick.stop(4);
~kick.clear;
~kick.pause;
~kick.resume;

// output synth ///////////////////////////////////////
// one synth ///////////////////////////////////////

(
    ~one.ar(2);
    ~one.clock = p.clock;
    ~one.quant=4;
    ~one.fadeTime=2;
    ~one={
        var mod = 1.33335*[1,2,1.5,1.333];//Duty.kr([1,2,3],0,Dseq([1,2,1.5,1.33333],inf));
        var f = 100/mod;//(84+[0,7,-12,-24]).midicps / mod * [1,1.5,1/1.3333,1];
        var sig = ~pass.ar + LocalIn.ar(2) * Pulse.ar(4/[1,2,3,4]);//Limiter.ar( ~pass.ar.softclip , 0.45) + (Pulse.ar( ~tempo / [1,2,3,4]) * WhiteNoise.ar(0.2!4));

        sig = DelayN.ar(sig,1/f,1/f);
        //sig = PitchShift.ar(sig,0.1,SinOsc.ar(1.001/4/[1,2,3,4]).range(0.5,1.5));// * Pulse.ar(4/[1,2,3,4]);
        sig = BPF.ar(sig,f,LFNoise2.kr(1/4!4).exprange(0.01,0.4));//LFSaw.ar(1/4/[1,2,3,4]).exprange(0.01,0.1));
        sig = Compander.ar(sig,3/4,1/3,1/2);
        sig = HPF.ar(sig,25);
        LocalOut.ar(Mix.ar(sig)!2);
        [0,Splay.ar(sig,0.5,0.95)];
    };
    ~one.play;
);
~one.stop(4);
~one.clear;
~one.pause;
~one.resume;

// kick synth ///////////////////////////////////////

(
    ~kick.ar(2);
    ~kick.clock = p.clock;
    ~kick.quant=[16,0];
    ~kick.fadeTime=0.02;
    ~kick={
        //  |       |       |       |       |  
        var pat = [
            1,0,0,0, 0,0,0,0, 1,0,0,0, 0,0,0,0,
            1,0,0,0, 0,0,0,0, 1,0,0,0, 0,0,0,0,
            1,0,0,0, 0,0,0,0, 1,0,0,0, 0,0,0,0,
            1,0,0,0, 1,0,0,0, 1,0,0,0, 1,1,1,1,
        ].rotate(1);
        var imp = PulseDivider.kr(~tick.kr,1,~counter.kr%pat.size);
        var hit = Select.kr(PulseCount.kr(imp)%pat.size,pat);
        var env = {EnvGen.ar(Env([0.001,1,0.0001],[0.002,LFNoise2.kr(1/32!16).range(0.1,4)],[3,-30]),imp * hit)};
        var sig = ~pass.ar;//VarSaw.ar(50/[1,2,3,4],0,env**LFNoise2.kr(~tempo/32/(1..16)).exprange(0.001,20.99));
        //sig = PitchShift.ar(sig,0.01,env**40*4) * env;
        //sig = CombN.ar(sig,1/50,1/5*(env**0.52)+0.0001,1);
        sig = AllpassN.ar(sig,1/4,1/4/(1..8),4);
        [0,Splay.ar(sig,0.0001,0.95)];
    };
    ~kick.play;
);
~kick.stop(4);
~kick.clear;
~kick.pause;
~kick.resume;


// one synth ///////////////////////////////////////

(
    ~one.ar(2);
    ~one.clock = p.clock;
    ~one.quant=[16,3];
    ~one.fadeTime=4;
    ~one={
        var note = Duty.ar(8/~tempo*[1,2,3],0,Dseq([60,65,60,67,65,63,67,69,55,60,58,60,61].midicps,inf));
        //var note = Duty.ar(8/~tempo*[1,2,3],0,Dseq([60,48,60,36,60,72,60,84].midicps,inf));
        var f = note / [1,2,1.5,1.333333].scramble *.x [1,2,1/2,4/3] + SinOsc.kr((4..20),mul:0.5);
        var q = LFNoise2.kr(~tempo/16/(1..16)).exprange(0.0001,0.3);
        var sig = Crackle.ar(LFTri.ar(~tempo/((1..16)*10)).range(0.001,1.9));
        sig = LeakDC.ar(sig);
        sig = RLPF.ar(sig,f,q);
        sig = HPF.ar(sig,55);
        sig = HPF.ar(sig,55);
        sig = Normalizer.ar(sig) * LFTri.ar(~tempo/(1..16)) * LFTri.ar(f/10);
        sig = sig * Pulse.ar(~tempo*2/(1..16) + SinOsc.kr(~tempo/(8..28)).range(-0.001,0.001));
        sig = CombN.ar(sig,1/f,1/f,LFNoise2.kr(~tempo/16!16).exprange(1/2,2)/(1..16));
        //        sig = Compander.ar(sig,~kick.ar,0.1,1,0.1);
        sig = LPF.ar(sig,f*2);
        [0,Splay.ar(sig,0.75,0.013335,SinOsc.kr((~tempo/((1..16)*0.51))))];
    };
    ~one.play;
);
~one.stop(4);
~one.clear;
~one.pause;
~one.resume;



// two synth ///////////////////////////////////////

(
    ~two.ar(2);
    ~two.clock = p.clock;
    ~two.quant=2;
    ~two.fadeTime=16;
    ~two={
        var t = SinOsc.ar( ((1..9)/1600) * ~tempo * [50,25,12.5,7.5] * 4) * 1/4 ;
        var sig = [] ++ Perlin3.ar(t[0],t[1],t[2]) ++ Perlin3.ar(t[3],t[4],t[5]) ++ Perlin3.ar(t[6],t[7],t[8]);
        var gen = Formant.ar( sig[0] * 100+50, sig[1] * 1500+5, sig[2] * 550+5 ) * LFTri.ar(~tempo/(1..9));
        gen = AllpassN.ar(gen,1/4,4/(1..16),4);

        [Splay.ar(gen,0.005,0.15),0];
    };
    ~two.play;
);
~two.stop(4);
~two.clear;
~two.pause;
~two.resume;
