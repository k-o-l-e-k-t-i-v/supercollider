(
    p = NetProxy.push();
    s.latency = 0.2;
)

// Compander DUCK (NOPLAY) /////////////////////////////////////// *****
(
    ~duck.ar(2);
    ~duck.clock = p.clock;
    ~duck.quant=[16];
    ~duck.fadeTime=0.02;
    ~duck={
        var sig = ~kick_one.ar;
        Splay.ar(sig,0.01,0.95);
    };
);



p.bpm(115)
String.help

(
    p.restartClock;
    ~tick.kr(1);
    ~counter.kr(1);

    ~tick.clock = p.clock;
    ~counter.clock = p.clock;

    ~tick.quant=16;
    ~counter.quant=16;

    ~tick = { var imp = Impulse.kr(~tempo.kr * 4); SendTrig.kr(PulseDivider.kr(imp,16), 0, ~tempo.kr ); imp;  };
    ~counter = {PulseCount.kr(~tick.kr);};
    p.arProxyNames.do({|synth| if(synth.asSymbol!=\master){p[synth.asSymbol].rebuild;};});
)

(
    //////////////////////////  FADE -> OUT ///////////////////////////////////////////////////////
    {
        p.arProxyNames.do({|synth| if(synth.asSymbol!=\master){p[synth.asSymbol].clear(20);};});
    }.fork;
)


////////// SYNC //////////////////////////
(

    (
        p.clock.sched(p.clock.timeToNextBeat(16),{
            p.restartClock;
            //p.arProxyNames.do({|synth| if(synth.asSymbol!=\master){~tick.quantize(p[synth.asSymbol]);};});
            p.arProxyNames.do({|synth| if(synth.asSymbol!=\master){
                p[synth.asSymbol].clock=p.clock;
                p[synth.asSymbol].fadeTime=0;
                p[synth.asSymbol].rebuild;}
                ;}

            );
        });
    );

);


// BRIGHT MASTER ////////////////////////////////////////////////////////// ****
(
    ~master.quant=16;
    ~master.clock = p.clock;
    ~master.play;
    ~master.fadeTime = 0.01;
    ~master = {|wet=0.45,lp=2500,hp=200,len=30,rev = 2|
        var sig = In.ar([0,1]);
        var orig = sig;
        var fx,hi,lo;
        //fx = Limiter.ar(sig,0.95);
        sig = Limiter.ar(sig);
        fx = LPF.ar(sig,lp);
        fx = LPF.ar(fx,lp);
        fx = HPF.ar(fx,hp);
        fx = HPF.ar(fx,hp);
        lo = DWGReverb.ar(NumChannels.ar(fx,2),[5000,5010],1/len)/rev;
        fx = HPF.ar(sig,lp);
        hi = DWGReverb.ar(NumChannels.ar(fx,2),[4000,4010],1/len/10)/rev/10;
        sig = SelectX.ar(wet,[orig,NumChannels.ar(lo+hi,2)]);
        sig = Compander.ar(sig,3/4,1/2,1/3);
        sig = NumChannels.ar(sig,2);
        ReplaceOut.ar(0,sig);
    };
    ~master_wet.quant = 4;
    //~master_wet = {LFDNoise1.kr(~tempo/2!2).exprange(0.15,0.35);};
    ~master_wet = {|sig| sig-(1-LFSaw.ar(~tempo*1)).range(0,1)**4};
    ~master.map(\wet,~master_wet);
    p.moveNodeToTail(\master);
);

// CLASSIC MASTER /w KICK_ONE DUCKING //////////////////////////////////////////////////////////// ***

(
    ~master.quant=16;
    ~master.play;
    ~master.fadeTime = 0.01;
    ~master = {|wet=0.55,lp=4500,hp=250,len=4,rev = 2,duckLo = 150|
        var sig = In.ar([0,1]);
        var orig = sig;
        var fx,low,high,mid;
        var duck;

        duck = LPF.ar(LPF.ar(sig,duckLo),duckLo);
        low = CompanderD.ar(LPF.ar(sig,LFNoise2.kr(1/4!2*~tempo).range(100,800)),9/10,1,1/2);
        mid = CompanderD.ar(BPF.ar(sig,LFNoise2.kr(1/8!2*~tempo).range(500,4500),1/2),9/10,1,1/2);
        high = CompanderD.ar(HPF.ar(sig,LFNoise2.kr(1/16!2*~tempo).range(3000,10000)),9/10,1,1/2);
        sig = CompanderD.ar((high+mid+low).flat,9/10,1,1/1.2);
        orig = sig;
        fx = LPF.ar(sig,lp).distort;
        fx = LPF.ar(fx,lp);
        fx = HPF.ar(fx,hp);
        fx = HPF.ar(fx,hp);
        fx = AllpassN.ar(fx,1/1600*~tempo,1/4*~tempo,len);

        fx = DWGReverb.ar(NumChannels.ar(fx,2),[5000,5100],1/len)/rev + fx;

        sig = SelectX.ar(wet,[orig,fx]);
        //  sig = Compander.ar(sig,~duck.ar,8/10,1/2,1);
        sig = NumChannels.ar(sig,2) ;
        sig = Limiter.ar(sig.softclip);
        ReplaceOut.ar(0,sig);
    };

    ~master_wet.quant = 4;
    ~master_wet = {LFDNoise1.kr(~tempo/1600!2).exprange(0.15,0.35);};
    // ~master_wet = {|sig| sig-(1-LFSaw.ar(~tempo*1)).range(0,1)**4};
    ~master.map(\wet,~master_wet);
    p.moveNodeToTail(\master);
);

// DEEP MASTER //////////////////////////////////////////////////////////// ***
(

    (
        ~master.quant=16;
        ~master.play;
        ~master.fadeTime = 0.01;
        ~master = {|wet=0.35,lp=7500,hp=250,len=2,rev = 8|
            var sig = In.ar([0,1]);
            var orig = sig;
            var fx,low,high,mid;
            //fx = Limiter.ar(sig,0.95);

            //sig = CombN.ar(sig,1/50,1/50,1);
            low = CompanderD.ar(LPF.ar(sig,LFNoise2.kr(1/32!2*~tempo).range(250,800)),3/4,1/1.12,1/1.35,0.1,0.3);
            mid = CompanderD.ar(BPF.ar(sig,LFNoise2.kr(1/32!2*~tempo).range(800,7500),0.1),3/4,1/1.25,1/2,0.02,0.1);
            high = CompanderD.ar(HPF.ar(sig,LFNoise2.kr(1/32!2*~tempo).range(7000,10000)),3/4,1.12,1,0.02,0.05);
            sig = CompanderD.ar((high+mid+low).flat,3/4,1/1.14,1/1.2);
            //sig = Compander.ar(sig,sig,3/4,1/2,1/3);
            orig = sig;
            fx = LPF.ar(sig,lp);
            fx = HPF.ar(fx,hp);
            fx = DWGReverb.ar(NumChannels.ar(fx,2),[5000,5010],1/len)/rev;
            sig = SelectX.ar(wet,[orig,fx]);
            sig = NumChannels.ar(sig,2);
            sig = Limiter.ar(sig.softclip);
            //Splay.ar(sig);
            ReplaceOut.ar(0,sig);
        };

        ~master_wet.quant = 32;
        ~master_wet = {|sig| sig-(1-LFSaw.ar(~tempo*1)).range(0,1)**4};
        ~master.map(\wet,~master_wet);

    );
    p.moveNodeToTail(\master);

)

// PUNK MASTER /////////////////////////////////////////////////////////// **
(
    ~master.quant=16;
    ~master.play;
    ~master.fadeTime = 0.01;
    ~master = {|wet=0.35,lp=3500,hp=250,len=10,rev = 2|
        var sig = In.ar([0,1]);
        var orig = sig;
        var fx;
        //fx = Limiter.ar(sig,0.95);
        var f = 30.midicps;
        var mod = Duty.kr(16/(~tempo/2),0,Dseq([1,2,1.5,1.33333],inf));
        sig = CombN.ar(sig,1/f*mod,1/f*mod,4)/rev+sig;
        sig = Compander.ar(sig,3/4,1/1.1,1/3);
        fx = LPF.ar(sig,lp);
        fx = HPF.ar(fx,hp);
        fx = DWGReverb.ar(NumChannels.ar(fx,2),[5000,5010],1/len)/rev;
        sig = SelectX.ar(wet,[orig,fx]);
        sig = NumChannels.ar(sig,2);
        ReplaceOut.ar(0,sig);
    };
    p.moveNodeToTail(\master);
);


// EASY MASTER /////////////////////////////////////////////////////////////// ***
(
    ~master.quant=16;
    ~master.clock = p.clock;
    ~master.play;
    ~master.fadeTime = 0.01;
    ~master = {|wet=0.95,lp=7500,hp=200,len=5,rev = 2|
        var sig = In.ar([0,1]);
        var orig = sig;
        var fx,hi,lo;
        //fx = Limiter.ar(sig,0.95);
        sig = Limiter.ar(sig);
        fx = LPF.ar(sig,lp);
        fx = LPF.ar(fx,lp);
        fx = HPF.ar(fx,hp);
        fx = HPF.ar(fx,hp);
        lo = DWGReverb.ar(NumChannels.ar(fx,2),[5000,5010],1/len)/rev;
        fx = HPF.ar(sig,lp);
        hi = DWGReverb.ar(NumChannels.ar(fx,2),[4000,4010],1/len/10)/rev/10;
        sig = SelectX.ar(wet,[orig,NumChannels.ar(lo+hi,2)]);
        //sig = PitchShift.ar(sig,~tempo*4,LFSaw.ar(1/8*~tempo).exprange(1,20));
        sig = Compander.ar(sig,3/4,1/2,1/3);
        sig = NumChannels.ar(sig,2);
        ReplaceOut.ar(0,sig);
    };
    ~master_wet.quant = 4;
    ~master_wet = {LFDNoise1.kr(~tempo/2!2).exprange(0.15,0.25);};
    ~master.map(\wet,~master_wet);
    p.moveNodeToTail(\master);
);


////////////////////////// MANUAL TAIL ////
///////////////////////////////////////////


//////////////////////////  FADE -> OUT ///////////////////////////////////////////////////////
(
    p.clock.sched(p.clock.timeToNextBeat(32),{
        p.arProxyNames.do({|synth| if(synth.asSymbol!=\master){p[synth.asSymbol].clear(8);};});
    });
);

(
    //////////////////////////  FADE -> OUT ///////////////////////////////////////////////////////
    {
        p.arProxyNames.do({|synth| if(synth.asSymbol!=\master){p[synth.asSymbol].clear(60);};});
    }.fork;
)

p.clock.queue.postln

// karplus.g synth ///////////////////////////////////////

(
    ~karplus.ar(2);
    ~karplus.clock = p.clock;
    ~karplus.quant=[16];
    ~karplus.fadeTime=4;
    ~karplus={
        var pat = 1/4/[1,2,3] * ~tempo.kr * 2;
        var sig = (PinkNoise.ar(0.91!2) * LFPulse.ar(1/8/[1,2,3,4]*~tempo,0,0.005)) + LocalIn.ar(4);
        var mod = TChoose.kr(Impulse.kr(pat/4),[2,4,1,1/2]).lag(1/400);
        var mod2 = TChoose.kr(Impulse.kr(pat/16),[2,1.5,4,1,1.3333333]).lag(1/400);
        var base = TWChoose.kr(Impulse.kr(pat/16),[60,64,67,61,65].midicps,[1,1,1,0.2,0.2],1) * mod / mod2;
        RandSeed.kr(Impulse.kr(1/64*~tempo),2017);
        sig = BPF.ar(sig,base,0.04);
        sig = DelayN.ar(sig,1/base,1/base);
        sig = Limiter.ar(sig);
        LocalOut.ar(sig/1.0051);
        //sig = CombL.ar(sig,1/base,2/base,0.7);
        sig = CompanderD.ar(sig,3/4,1/3,1/2);
        sig = Vibrato.ar(sig,[4,5,6,7],0.1);
        sig = sig * (LFTri.ar(2*~tempo/[1,2,3,4])**4).range(0.001,0.9);
        sig = HPF.ar(sig,100);
        Splay.ar(sig,0.95,0.35);
    };
    ~karplus.play;
    //~karplus[10] = \filter -> {|sig| LPF.ar(DWGReverb.ar(HPF.ar(NumChannels.ar(sig,2),50),[4004,4014]),LFNoise2.kr(1/4!2).range(3000,15000))+sig;};
);
~karplus.stop(10);
~karplus.clear;
~karplus.pause;
~karplus.resume;

// hiss synth ///////////////////////////////////////

(
    ~hiss.ar(2);
    ~hiss.clock = p.clock;
    ~hiss.quant=[16,0];
    ~hiss.fadeTime=2.2;
    ~hiss={
        //         |       |       |       |       |
        var pat = [
            0,0,1,0,0,0,1,0,0,0,1,0,0,0,1,0,
            0,0,1,0,1,0,1,0,1,0,1,0,1,0,1,0,
            0,0,1,0,0,0,1,0,0,0,1,0,0,0,1,0,
            0,0,1,0,1,0,1,0,1,0,1,0,1,0,1,0,
        ].rotate(1);
        var imp = PulseDivider.kr(~tick.kr,[1,2,4]);
        var hit = Select.kr(PulseCount.kr(imp)%pat.size,pat);
        var env = EnvGen.ar(Env([0.001,1,0.0001],[0.002,0.25*[1,2,4]],[3,-3],curve:'exp'),imp * hit);
        var sig = Crackle.ar([0.1,0.2,0.6]+env);
        sig = sig * env;
        Splay.ar(sig,0.25,0.25);
    };
    ~hiss.play;
);
~hiss.stop(4);
~hiss.clear(10);
~hiss.clear;
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
        var mod = TWChoose.kr(Impulse.kr(1/32*(1..16)*~tempo),[1,2,4,8,16,1.5,1.33333,1.25,1.125],[7,6,5,4,3,2,1],1).lag(1/10);
        sig = {ChaosGen.allSubclasses.choose.ar}!16 * (Decay.ar(Impulse.ar(2/(1..16) * ~tempo),0.2 * LFNoise2.kr(1/16*~tempo*16).range(0.7,1.2)) ** 2);
        sig = LeakDC.ar(sig) * LFPulse.ar(8*~tempo*mod);
        sig = CompanderD.ar(sig,3/4,1/2,1/2);
        sig = PitchShift.ar(sig,0.05,1/mod/[1,2,1,4,1,8,1,16]);
        //sig = TChoose.ar(Impulse.ar(~tempo*4),all);
        Splay.ar(sig,0.92,0.25,SinOsc.ar(1*~tempo));
    };
    ~chaos.play;
);
~chaos.clear;
(
    p.clock.sched(p.clock.timeToNextBeat(16),{ ~chaos.clear; });
);

(
    //////////////////////////  FADE -> OUT ///////////////////////////////////////////////////////
    {
        p.arProxyNames.do({|synth| if(synth.asSymbol!=\master){p[synth.asSymbol].clear(20);};});
    }.fork;
)

// MAIN KICK /////////////////////////////////////// *****
(
    ~kick_one.ar(2);
    ~kick_one.clock = p.clock;
    ~kick_one.quant=[16];
    ~kick_one.fadeTime=0.02;
    ~kick_one={
        //         |       |       |       |       |
        var pat = [
            1,0,0,0, 1,0,0,0, 1,0,0,0, 1,0,0,0,
            1,0,0,0, 1,0,0,0, 1,0,0,0, 1,0,1,0,
            1,0,0,0, 1,0,0,0, 1,0,0,0, 1,0,0,0,
            1,0,0,0, 1,0,0,0, 1,0,0,0, 1,1,1,1,
        ].rotate(1);
        var mod = LFNoise2.kr(1/64*~tempo!4).range(10,40);
        var len = LFNoise2.kr(~tempo/64!4).range(3.2,4.5);
        var imp = PulseDivider.kr(~tick.kr,1);
        var hit = Select.kr(PulseCount.kr(imp)%pat.size,pat);

        var env = {EnvGen.ar( Env([0,1,0],[0.005,len],curve: [1,-1] * mod) ,imp * hit)};
        var sig = SinOsc.ar(50+(env**mod*2),env**mod*8pi) + VarSaw.ar(50,0,env**LFNoise2.kr(1/16!4).range(0.1,2),mul:env**0.04/[1,2,3,4]);
        sig = (RLPF.ar(GrayNoise.ar(env**4),150+(env**0.2*150),0.4) * (env**(mod*0.12)*0.12)) + sig;
        //sig = Normalizer.ar(sig);
        sig = sig * env;
        sig = NumChannels.ar(sig,2);
       // sig = sig.distort;
        Splay.ar(sig,0.001,0.25);

    };
    ~kick_one.play;
);
~kick_one.clear(16);

(
    ~kick_one.clear(8);
    ~onea.clear(8);
    ~high_kick.clear(16);
    ~saw_kick.clear(8);
)

// high_kick synth /////////////////////////////////////// ***

(
    ~high_kick.ar(2);
    ~high_kick.clock = p.clock;
    ~high_kick.quant=[16,0];
    ~high_kick.fadeTime=0.2;
    ~high_kick={
        //        |       |       |       |       |
        var pat = [
            1,0,0,0, 0,0,0,0, 0,0,0,0, 0,0,0,0,
            1,0,0,0, 0,0,0,0, 0,0,0,0, 0,0,0,0,
            1,0,0,0, 0,0,0,0, 0,0,0,0, 0,0,0,0,
            1,0,0,0, 0,0,0,0, 1,0,0,0, 1,0,1,0,
        ].rotate(1);
        var imp = PulseDivider.kr(~tick.kr,[1,2,3,4].nthPrime);
        var hit = Select.kr(PulseCount.kr(imp)%pat.size,pat);
        var env = Decay.kr(imp * hit,[0.7,0.2,1]*1);
        var sig = BrownNoise.ar(0.4**4*env) + SinOsc.ar([30,36].midicps+(env**5*5),env**4*8pi);
        sig = sig * env;
        Splay.ar(sig,0.05,0.25);
    };
    ~high_kick.play;
);
~high_kick.clear(16);
~high_kick.stop(4);
~high_kick.pause;
~high_kick.resume;

(
    //////////////////////////  FADE -> OUT ///////////////////////////////////////////////////////
    {
        p.arProxyNames.do({|synth| if(synth.asSymbol!=\master){p[synth.asSymbol].clear(20);};});
    }.fork;
)


// high_kick synth /////////////////////////////////////// ***

(
    ~saw_high.ar(2);
    ~saw_high.clock = p.clock;
    ~saw_high.quant=[16,0];
    ~saw_high.fadeTime=0.2;
    ~saw_high={
        //        |       |       |       |       |
        var pat = [
            0,0,1,0, 0,0,1,0, 0,0,1,0, 0,0,1,0,
            0,0,1,0, 0,0,1,0, 0,0,1,0, 0,0,1,0,
            0,0,1,0, 0,0,1,0, 0,0,1,0, 0,0,1,0,
            0,0,1,0, 0,0,1,0, 0,0,1,0, 1,1,1,1,
        ].rotate(1);

        var mel = Duty.kr(16/~tempo/[1,2,3],0,Dseq([60,64,60,67,60,65,72,36].midicps,inf)).lag(1/4);
        var mod2 = Duty.kr(16/~tempo/[1,2,3],0,Dseq([1,2,1.5,1.33333],inf)).lag(1/4);
        var len = LFNoise2.kr(1/4*~tempo).range(0.4,1.5);
        var mod = Duty.kr(16/~tempo,0,Dseq([1,2,1.5,1.33333],inf));
        var imp = PulseDivider.kr(~tick.kr,1,~counter.kr%pat.size);
        var hit = Select.kr(PulseCount.kr(imp)%pat.size,pat);
        var env = {EnvGen.ar(Env.perc(0.001,len*2,1,LFNoise2.kr(1/4*~tempo!2).range(-1,-8)),imp * hit)};
        var sig = WhiteNoise.ar(0.2**7*env) + VarSaw.ar(mel/[4,4,1.5],0,env*mod2) * LFNoise2.kr(1/4!3*~tempo).range(0.07,0.9) ** LFDNoise1.kr(1/40*~tempo).range(0.2,2);
        sig = LPF.ar(sig,env**0.2*5800+800);
        sig = sig * env;
        Splay.ar(sig,0.75,0.15);
    };
    ~saw_high.play;
);
~saw_high.stop(4);
~saw_high.clear(8);
~saw_high.pause;
~saw_high.resume;

Env.adsr(0.1,1,1,0.2,0.9,4).plot;


(
    //////////////////////////  FADE -> OUT ///////////////////////////////////////////////////////
    {
        p.arProxyNames.do({|synth| if(synth.asSymbol!=\master){p[synth.asSymbol].clear(20);};});
    }.fork;
)

p.push()
(
  s.latency=0.5;
  //p.clock.tempo_(120/60);
  p.arProxyNames.do({|synth| if(synth.asSymbol!=\master){p[synth.asSymbol].rebuild;};});
  ~tick.kr(1);
  ~tick.clock = p.clock;
  ~tick.quant = 16;
  ~counter.clock = p.clock;
  ~counter.quant = 16;
  ~counter = {PulseCount.kr(~tick.kr);};
  ~tick = { Impulse.kr( ~tempo * 2 ); };
);

// hh synth /////////////////////////////////////// ***

(
    ~hh3.ar(2);
    ~hh3.clock = p.clock;
    ~hh3.quant=[16,0];
    ~hh3.fadeTime=0.2;
    ~hh3={
        //         |       |       |       |       |
        var pat = [
            1,0,1,0, 1,0,1,0, 1,0,1,0, 0,0,0,0,
            1,0,1,0, 1,0,1,0, 1,0,1,0, 0,1,0,1,
            1,0,1,0, 1,0,1,0, 1,0,1,0, 0,0,0,0,
            1,0,1,0, 1,0,1,0, 1,0,1,0, 1,1,1,1,

        ].rotate(1);
        var imp = PulseDivider.kr(~tick.kr,[1,2,4,8,16,32].nthPrime%4);
        var hit = Select.kr(PulseCount.kr(imp)/[1,2,3,4]%pat.size,pat);
        var env = EnvGen.ar(Env([0.01,1,0.0001],[0.005,1/16*[1,2,3]],[80,-5]),imp * hit);
        var sig = LFNoise1.ar(22000*LFNoise0.kr(1/4*~tempo/2!4).range(0.5,1)) * Crackle.ar([0.1,0.7,0.4]+env);
        sig = sig * env;
        Splay.ar(sig,0.75,0.15);
    };
    ~hh3.play;
);
~hh3.stop(4);
~hh3.clear(40);
~hh3.pause;
~hh3.resume;

p.bpm(240)

// SWITCH WHISPERING /////////////////////////////////////// ***

(
    ~switch.ar(2);
    ~switch.clock = p.clock;
    ~switch.quant=[16,0];
    ~switch.fadeTime=0.2;
    ~switch={
        //         |       |       |       |       |
        var pat = [
            0,0,1,0, 0,0,0,0, 0,0,1,0, 0,0,0,0,
            0,0,0,0, 0,0,0,0, 0,0,0,0, 0,0,0,0,
            0,0,1,0, 0,0,0,0, 0,0,1,0, 0,0,0,0,
            0,0,0,0, 0,0,0,0, 0,0,0,0, 0,0,0,0,
        ].rotate(1);
        var imp = PulseDivider.kr(~tick.kr,[1,2,4,8]);
        var hit = Select.kr(PulseCount.kr(imp)%pat.size,pat);
        var env = EnvGen.ar(Env([0.001,1,0.0001],[0.002,0.1*[1,2,3,4]],[3,30]),imp * hit);
        var sig = WhiteNoise.ar(0.4!4) * Pulse.ar(1000);
        sig = RHPF.ar(sig,[1000,2500,12500,15000,1000,500,12500],LFNoise2.kr(1/4!4 * ~tempo/2).range(0.1,0.9));
        sig = sig * env * LFPulse.ar(1/4/(1..6)*~tempo,0,1/4);
        sig = CompanderD.ar(sig,3/4,1,1/3,0.0002);
        Splay.ar(sig,0.5,0.25);
    };
    ~switch.play;
    //~switch[10] = \filter -> {|sig|LPF.ar(DWGReverb.ar(HPF.ar(NumChannels.ar(sig,2),5000),[4001,4011]),12000)+sig;};
);
~switch.play;
~switch.stop(4);
~switch.clear;


// perl synth ///////////////////////////////////////

(
    ~perl.ar(2);
    ~perl.quant=16;
    ~perl.fadeTime=8.001;
    ~perl={
        var mod = Duty.kr(4/~tempo*2,0,Dseq([1,2,1.5,1.33333,1,2,1.5,1.666666],inf))  ;
        var sig = LFSaw.ar([1/16,1/4,[72,60,48].midicps/mod]*(~tempo*2)) ** LFNoise2.kr(1/400).range(0.9,4) * 24.midicps + LFSaw.ar(1/64*~tempo,mul:4);
        var pan = LeakDC.ar(sig);
        RandSeed.kr(Impulse.kr(1/128*~tempo),2017);
        sig = Perlin3.ar(sig[0],sig[1],sig[2]) * (LFSaw.ar(1/4/[1,2,3,4] * ~tempo)**2);
        sig = LPF.ar(sig,LFDNoise1.kr(1/16!3 * ~tempo/2).range(500,15000));
        Splay.ar(sig,0.75,0.025,pan);
    };
    ~perl.play;
);
~perl.stop(16);
~perl.clear(16);
~perl.pause;
~perl.resume;


(
    //////////////////////////  FADE -> OUT ///////////////////////////////////////////////////////
    {
        p.arProxyNames.do({|synth| if(synth.asSymbol!=\master){p[synth.asSymbol].clear(20);};});
    }.fork;
)

(
    ~kick_one.clear(8);
    ~onea.clear(8);
    ~high_kick.clear(16);
)
//////// FADE-OUT KICKS /////////////////////////////
(
    p.clock.sched(p.clock.timeToNextBeat(4),{
        ~kick.stop(8);
        ~onea.stop(11);
        ~scanner.stop(12);
        ~kick_one.stop(13);
        ~k_two.stop(6);
        ~high_kick.stop(16);
    });
);

//////// KICK-IN GROSS /////////////////////////////
(
    p.clock.sched(p.clock.timeToNextBeat(16),{
        ~kick.quant=0;
        ~onea.quant=0;
        ~scanner.quant=0;
        ~kick_one.quant=0;
        ~k_two.quant=0;

        ~kick.play;
        ~onea.play;
        ~scanner.play;
        ~kick_one.play;
        ~k_two.play;
    });
);

//////// SUPRESS KICKS /////////////////////////////
(
    p.clock.sched(p.clock.timeToNextBeat(4),{
        ~kick.pause;
        ~onea.pause;
        ~scanner.pause;
        ~kick_one.pause;
        ~k_two.pause;
    });
);

//////// RESUME KICKS /////////////////////////////
(
    p.clock.sched(p.clock.timeToNextBeat(4),{
        ~kick.resume;
        ~onea.resume;
        ~scanner.resume;
        ~kick_one.resume;
        ~k_two.resume;
    });
);


(
    //////////////////////////  FADE -> OUT ///////////////////////////////////////////////////////
    {
        p.arProxyNames.do({|synth| if(synth.asSymbol!=\master){p[synth.asSymbol].clear(60);};});
    }.fork;
)

(
    ~kick.play;
    ~onea.play;
)


(
    //////////////////////////  FADE -> OUT ///////////////////////////////////////////////////////
    {
        p.clock.sched(p.clock.timeToNextBeat(16),{
            p.arProxyNames.do({|synth| if(synth.asSymbol!=\master){p[synth.asSymbol].clear(8);};});
        });
    }.fork;
)

(
    (
        ~sell.ar(4);
        // ~sell.quantize(~tick);
        ~sell.mold(4);
        ~sell.clock = p.clock;
        ~sell.quant=[16,0];
        ~sell.fadeTime=4;

        ~sell={var t = LFSaw.ar([1/1600,1/1600,[1/4,1/3]]*~tempo) * 1 * LFSaw.ar(1/2000,mul:4); Perlin3.ar(t[0],t[1],t[2]) ** LFNoise2.kr(1/64*~tempo).range(0.4,4);};
    );

    // scanner synth ///////////////////////////////////////

    (
        //~scanner.ar(4);
        //~scanner.clock = p.clock;
        ~scanner.quant=[16,0];
        ~scanner.fadeTime=0.2;
        ~scanner[0]={
            //         |       |       |       |       |
            var pat = [
                1,0,1,0,1,0,1,0,1,0,1,0,1,0,1,0,
            ].rotate(1);
            var imp = PulseDivider.kr(~tick.kr,4,~counter.kr % pat.size);
            var hit = Select.kr(PulseCount.kr(imp)%pat.size,pat);
            var env = Decay2.kr(imp*hit,[1,2,3,4]/~tempo*LFNoise2.kr(~tempo/64!4).exprange(1.0,4.9),0.0005);
            var sig = [
                LFNoise0.ar(550*[1,2,3,4]) * Pulse.ar(~tempo/[1,2,3,4]),
                WhiteNoise.ar(0.6!2) * LFSaw.ar(1/4*~tempo);
                LFNoise1.ar(150!2) * Pulse.ar(~tempo/[1,2,3,4]),
                LFNoise2.ar(15000!2) * Pulse.ar(~tempo/[1,2,3,4].reverse),
            ];
            sig=  HPF.ar(sig,200);
            sig = sig * env
        };

        ~scanner[1] = \filter -> {|sig| SelectX.ar(~sell.ar*(sig.size+1) % (sig.size+1),sig);};
        ~scanner[2] = \filter -> {|sig| Resonz.ar(sig,LFNoise2.kr(1/40/[1,2,3,4] * ~tempo).exprange(100.01,1600),0.2,mul:2)+sig/2};
        ~scanner[3] = \filter -> {|sig| HPF.ar(sig,200); };
        ~scanner[4] = \filter -> {|sig| Limiter.ar(sig)/2 };
        ~scanner[6] = \filter -> {|sig| CompanderD.ar(sig,3/4,1/2,1,0.002,1/2)/8 } ;
        ~scanner[7] = \filter -> {|sig| Splay.ar(sig,0.95,0.35,SinOsc.kr(4.01*~tempo)/1.2); };

        ~scanner.play;
    );

);
~scanner.stop(16);
~scanner.clear;
~scanner.pause;

NodeProxy.help;

~scanner.rebuild;

(
    //////////////////////////  FADE -> OUT ///////////////////////////////////////////////////////
    {
        p.arProxyNames.do({|synth| if(synth.asSymbol!=\master){p[synth.asSymbol].clear(20);};});
    }.fork;
)
~scanner.resume;

// SWITCH OCCASIONAL /////////////////////////////////////// ****

(
    ~switch.ar(2);
    ~switch.clock = p.clock;
    ~switch.quant=[16,0];
    ~switch.fadeTime=8.2;
    ~switch={
        var pat = [
            0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,1,
        ].rotate(1);
        //         |       |       |       |       |
        var imp = PulseDivider.kr(~tick.kr,[1,2,3,4,5,6]);
        var hit = Select.kr(PulseCount.kr(imp)%pat.size,pat);
        var env = EnvGen.ar(Env([0.001,1,0.0001],[0.002,0.15*[1,2,3,4]/~tempo],[3,30]),imp * hit);
        var sig = WhiteNoise.ar(0.4!4) + Crackle.ar(env+((1..6)/10))* SinOsc.ar(1/(1..6)*~tempo);
        sig = Resonz.ar(sig,[1000,2500,12500,15000,500,12500],LFDNoise1.kr(~tempo!6).range(0.01,0.9));
        sig = sig * env * LFPulse.ar(8/(1..6)*~tempo,0,1/2);
        sig = CompanderD.ar(sig,3/4,1,1/3,0.0002);
        Splay.ar(sig,0.5,0.5,SinOsc.kr(~tempo,mul:0.24));
    };
    ~switch.play;
);
~switch.play;
~switch.clear(10);
~switch.stop(10);
~switch.clear;
(
    p.clock.sched(p.clock.timeToNextBeat(32),{
        ~switch.clear;
    });
);

(
    //////////////////////////  FADE -> OUT ///////////////////////////////////////////////////////
    {
        p.arProxyNames.do({|synth| if(synth.asSymbol!=\master){p[synth.asSymbol].clear(20);};});
    }.fork;
)


//////////////// DSL 14K MODEM EMULATOR x) /////////////////////////////////
(
    (
        ~modem.ar(2);
        ~modem.clock = p.clock;
        ~modem.quant=[16,0];
        ~modem.fadeTime=8;
        ~modem={
            var mod = Duty.kr(128/~tempo*(1..16),0,Dseq([1,2,1.5,1.33333,4,8,1,1,1,1,1,1],inf));
            var high = 60.midicps*10/[1,2.0,1.333,1.5]/mod;
            var mad = SinOsc.ar(30.midicps*~tempo/(1..16)).range(1,high);
            var sig = SinOsc.ar(mad.range(0.1,high)) ** (LFSaw.ar(mad).exprange(0.01,2));
            sig = VarSaw.ar(sig.exprange(36.midicps,high));// * Pulse.ar(~tempo).lag(0.01);

            sig = BBandPass.ar(sig,high/16*(((1..16)/16)**2*16),0.02 + LFNoise0.kr(~tempo/4*((1..16)/16**4)).range(0.0001,0.92)) * LFSaw.kr(~tempo*((1..16)/16**2)).exprange(0.001,4);
            sig = Resonz.ar(sig,high/16*(((1..16)/16)**2*16),0.02 + LFNoise1.kr(~tempo/16*((1..16)/16**5.14)).range(0.0001,0.92)) * LFNoise2.kr(~tempo*((1..16)/16**2)).exprange(0.001,4);
            sig = OnePole.ar(sig,LFNoise2.kr(~tempo/16!16));
            sig = DFM1.ar(sig,high/16*(((1..16)/16)**2*16),0.002 + LFNoise2.kr(~tempo/64*((1..16)**0.54)).range(0.0001,0.92)) * LFNoise2.kr(~tempo*((1..16)/16**2)).exprange(0.001,4);
            sig = CompanderD.ar(sig,3/4,1/4,1/2);
            sig = Normalizer.ar(sig) * LFSaw.ar(~tempo/(1..16));//  * LFPulse.ar(~tempo*4/(1..16));
            sig = (sig * LFSaw.ar(~tempo/[1,2,3,4,5,6,7,8]*2,0,1/2));
            sig = (sig * Pulse.ar(~tempo/[1,2,3,4,5,6,7,8])) + sig;
            sig = (sig * LFPulse.ar(~tempo/[1,2,3,4,5,6,7,8]/2)/3) + sig;
            sig = OnePole.ar(sig,LFTri.ar([4,3,2,1]*~tempo/2)**0.9);
            Splay.ar(sig,0.75,0.15,SinOsc.kr(1/4/[1,2,3,4]*~tempo));
        };
        ~modem.play;
    );
);
~modem.stop(16)

(
    //////////////////////////  FADE -> OUT ///////////////////////////////////////////////////////
    {
        p.arProxyNames.do({|synth| if(synth.asSymbol!=\master){p[synth.asSymbol].clear(20);};});
    }.fork;
)

~modem.clear(16);

(
    p.clock.sched(p.clock.timeToNextBeat(16),{ ~modem.clear(8); });
);


(
    // LATE KICK SYNTH /////////////////////////////////////// **
    (
        ~late_kick.ar(2);
        ~late_kick.clock = p.clock;
        ~late_kick.quant=[16,0];
        ~late_kick.fadeTime=16.04;
        ~late_kick={
            var speed = 2/[1,2,4,3]/4;//TWChoose.kr(Impulse.ar(~tempo/8),[1,2,1/2,1/4,1/8],[8,3,2,1,0.2],1).lag(1);
            var sig = SinOsc.ar(50!2+Pulse.ar(~tempo*speed*4,mul:10),Pulse.ar(~tempo*speed*2)) * LFPulse.ar(~tempo/32*speed,3/4);
            Splay.ar(sig,0.5,0.95);
        };
        ~late_kick.play;
    );

)
~late_kick.clear;

p.restartClock;
(
    //////////////////////////  FADE -> OUT ///////////////////////////////////////////////////////
    {
        p.arProxyNames.do({|synth| if(synth.asSymbol!=\master){p[synth.asSymbol].clear(40);};});
    }.fork;
)

// DEEP SOUNDS ///////////////////////////////////////

(
    ~mel_tick.ar(2);
    ~mel_tick.clock = p.clock;
    ~mel_tick.quant=[16,0];
    ~mel_tick.fadeTime=4.2;
    ~mel_tick={
        var f,sig,slo;
        slo = 4;
        f = TWChoose.kr(Impulse.ar(4/slo/(1..16)*~tempo/4),[60,65,67,64,57,72,36].midicps*4,(7..1),1);
        10.do{|n|
            f = f/{TWChoose.kr(Impulse.kr(1/slo/n/(1..16)*~tempo/4),[1,2,1.333333,1/2,1/1.333333,1.5,1/1.5],[4,4,1/3,1/4,1/3,2,0.5],1)};
        };
        sig = Formant.ar(f,f*4,LFTri.ar(1/slo/(1..16)).range(50,5000)*~tempo/2) * (LFTri.ar(1/8/(1..16))**4);
        sig = Vibrato.ar(sig,[6,7,8,9],0.12) + (WhiteNoise.ar(0.01)*Pulse.ar(TChoose.kr(Impulse.ar(4/slo/(1..16)*~tempo/2),[2,4,8,16,32,44,22,33])));
        sig = sig * (LFTri.ar(1/slo/(1..16)*~tempo/2) ** 3);
        sig = MoogFF.ar(sig,f*2,2.85);
        sig = HPF.ar(sig,100) * Pulse.ar(~tempo);
        sig = CompanderD.ar(sig,3/4,1/2,1/2);
        Splay.ar(sig,0.25,0.85);
    };
    ~mel_tick.play;
);
~mel_tick.stop(120);
~mel_tick.clear(20);
~mel_tick.pause;
~mel_tick.resume;


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

// crack synth ///////////////////////////////////////

(
    ~crack.ar(2);
    ~crack.clock = p.clock;
    ~crack.quant=[16,0];
    ~crack.fadeTime=4;
    ~crack={
        var sig = Crackle.ar(1+LFNoise2.kr(1/4).range(0.01,0.7),LFPulse.ar(5000*[1,2,1.3333,1.5])/LFSaw.ar(1/4*~tempo/2).range(1,50)) * Pulse.ar(8*~tempo/2) * LFPulse.ar(1*~tempo/2) * LFPulse.ar(7/[1,2,3,4]*~tempo/2);
        Splay.ar(sig,0.5,0.05);
    };
    ~crack.play;
);
~crack.stop(4);
~crack.clear;
~crack.pause;
~crack.resume;


// hiss synth ///////////////////////////////////////

(
    ~hiss.ar(2);
    ~hiss.clock = p.clock;
    ~hiss.quant=[16,1];
    ~hiss.fadeTime=2.2;
    ~hiss={
        //         |       |       |       |       |
        var pat = [1,0,1,0,1,0,1,0,1,0,1,0,1,1,1,1].rotate(1);
        var imp = PulseDivider.kr(~tick.kr,[1,2,3]);
        var hit = Select.kr(PulseCount.kr(imp)%pat.size,pat);
        var env = EnvGen.ar(Env([0.001,1,0.0001],[0.002,0.5],[3,-3],curve:'exp'),imp * hit);
        var sig = Crackle.ar([0.1,0.2,0.6]+env);
        sig = sig * env;
        Splay.ar(sig,0.25,0.095);
    };
    ~hiss.play;
);
~hiss.stop(4);
~hiss.clear(10);
~hiss.clear;
~hiss.pause;
~hiss.resume;

(
    ~chaos.clock = p.clock;
    ~chaos.quant = [16,0];
    ~chaos.fadeTime = 1;
    ~chaos={
        var sig;
        var all = [];
        var mod = TWChoose.kr(Impulse.kr(1/32*(1..16)*~tempo),[1,2,4,8,16,1.5,1.33333,1.25,1.125],[7,6,5,4,3,2,1],1).lag(1/10);
        sig = {ChaosGen.allSubclasses.choose.ar}!16 * (Decay.ar(Impulse.ar(2/(1..16) * ~tempo),0.2 * LFNoise2.kr(1/16*~tempo*16).range(0.7,1.2)) ** 2);
        sig = LeakDC.ar(sig) * LFPulse.ar(8*~tempo*mod);
        sig = CompanderD.ar(sig,3/4,1/2,1/2);
        sig = PitchShift.ar(sig,0.05,1/mod/[1,2,1,4,1,8,1,16]);
        //sig = TChoose.ar(Impulse.ar(~tempo*4),all);
        Splay.ar(sig,0.92,0.05,SinOsc.ar(1*~tempo));
    };
    ~chaos.play;
);
~chaos.clear(20);

(
//////////////////////////  FADE -> OUT ///////////////////////////////////////////////////////
{
  p.arProxyNames.do({|synth| if(synth.asSymbol!=\master){p[synth.asSymbol].clear(20);};});
}.fork;  
)

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
~shuttles.pause;
~shuttles.resume;

(
//////////////////////////  FADE -> OUT ///////////////////////////////////////////////////////
{
  p.arProxyNames.do({|synth| if(synth.asSymbol!=\master){p[synth.asSymbol].clear(20);};});
}.fork;  
)

// perlin synth ///////////////////////////////////////

(
    ~perlin.ar(2);
    ~perlin.quant=[16];
    ~perlin.fadeTime=2;
    ~perlin={
        var speed = ~tempo/2;
        var mmod = Duty.kr(1/4/speed,0,Dseq([1,2,1.5,1.333],inf));
        var notes = Duty.kr(16/speed,0,Dseq([1,2,3,4,5,6].octcps,inf));
        var mod3 = Duty.kr(16/speed,0,Dseq([1,2,1.5,4],inf));
        var mod2 = Duty.kr(4/speed,0,Dseq([1,2,1.5,1.3333]*mod3,inf));
        var mod = Duty.kr(8/speed,0,Dseq([1,2,1.5,4]/mod2,inf));
        var f = notes/[60,57,36,24,12,64,65].midicps/[1/100,1/100,1/150,1/200]/mod + SinOsc.kr(1/4/[1,2,3,4],mul:0.15) ;
        var time = LFSaw.ar(f/40,mul:LFSaw.ar(1/4/(1..16))**20*20);
        var sig = Perlin3.ar(time[0],time[1],time[2]) + Perlin3.ar(time[3],time[4],time[5]) + SinOsc.ar([36,24,12].midicps/mod);
        //sig = SinOsc.ar(f/8) * sig;
        sig = LeakDC.ar(sig).softclip;
        sig = (SinOsc.ar(f*[2,1/2,8,8/1.5],sig*2pi)*LFSaw.ar(1/32/(1..16)*speed).exprange(0.001,0.7) * LFSaw.ar(1/4/(1..16)*speed )).exprange(0.001,1);
        sig = CombN.ar(sig,speed,speed,8);
        sig = sig + LFNoise2.ar(1600/16*(1..16),mul:0.00001);
        sig = Resonz.ar(sig,(16*60.midicps)/16*(1..16),LFNoise2.ar(1/4!4).range(0.02,0.2),mul:LFNoise2.kr(4!16).exprange(0.001,1/(1..16)) );
        sig = CompanderD.ar(sig,1/2,1/4,1/200);
        Splay.ar(sig,0.15,0.15);
    };
    ~perlin.play;
);
~perlin.stop(4);
~perlin.clear;
~perlin.pause;
~perlin.resume;


(
    // one synth /////////////////////////////////////// ***

    (
        ~tam.ar(2);
        ~tam.clock = p.clock;
        ~tam.quant=[16];
        ~tam.fadeTime=0.2;
        ~tam={
            var pat = [
                //     |       |       |       |       |
                1,0,0,0,1,0,0,0,1,0,0,0,1,0,0,0,
                1,0,0,0,1,0,0,0,1,0,0,0,1,0,0,0,
            ].rotate(1);
            var imp = PulseDivider.kr(~tick.kr,1,~counter.kr%pat.size);
            var hit = Select.kr(PulseCount.kr(imp)%pat.size,pat);
            var env = EnvGen.ar(Env([0.001,1,0.0001],[0.002,2],[20,-3],curve:'exp'),imp * hit);
            var sig = Mix.fill(4,{|i| SinOsc.ar(50+i+(env**20*500),env**40*8pi)});
            sig = sig + (env**20*PinkNoise.ar(1!2));
            sig = sig + (env**10.5*SinOsc.ar([50,500.001]));
            sig = sig * env;
            sig = CompanderD.ar(sig,3/4,1,1/4);
            Splay.ar(sig,0.05,0.25);
        };
        ~tam.play;
    );
    // two synth ///////////////////////////////////////

    (
        ~zpet.ar(2);
        ~zpet.clock = p.clock;
        ~zpet.quant=[16];
        ~zpet.fadeTime=0.2;
        ~zpet={
            //     |       |       |       |       |
            var pat = [
                0,0,1,0,0,0,1,0,0,0,1,0,0,0,1,0,
                0,0,1,0,0,0,1,0,0,0,1,0,0,0,1,0,
                0,0,1,0,0,0,1,0,0,0,1,0,0,0,1,0,
                0,0,1,0,0,0,1,0,0,0,1,0,0,1,1,1,
            ].rotate(1);
            var imp = PulseDivider.kr(~tick.kr,1,~counter.kr%pat.size);
            var hit = Select.kr(PulseCount.kr(imp)%pat.size,pat);
            var env = EnvGen.ar(Env([0.001,1,0.0001],[0.002,4],[3,-3],curve:'exp'),imp * hit);
            var sig = Resonz.ar(WhiteNoise.ar(env**40),env**2*14000+40);
            sig = sig * env;
            sig = CompanderD.ar(sig,3/4,1,1/4);
            Splay.ar(sig,0.05,0.25);
        };
        ~zpet.play;
    );

)

(
    ~tam.clear(5);
    ~zpet.clear(5);
)

(
    //////////////////////////  FADE -> OUT ///////////////////////////////////////////////////////
    {
        p.arProxyNames.do({|synth| if(synth.asSymbol!=\master){p[synth.asSymbol].clear(20);};});
    }.fork;
)



// raw synth ///////////////////////////////////////

(
    ~raw.ar(2);
    ~raw.clock = p.clock;
    ~raw.quant=[4,1/8];
    ~raw.fadeTime=8;
    ~raw={|speed = 1|
        var sig = VarSaw.ar([55,550] +.x [1,2,3,4,5],0,LFSaw.ar(speed/[1,2,3,4]*~tempo)**4) + GrayNoise.ar(0.5!2) * (1-(LFTri.ar(speed)**4));
        //sig = Resonz.ar(sig,LFSaw.ar(1/32/[1,2,3,4]).exprange(160.001,250)+SinOsc.ar(4).range(-100,1000),LFNoise2.kr(1/32!2).range(0.02,0.6));
        sig = Resonz.ar(sig,LFSaw.ar(speed*~tempo/2).exprange(55.01,5500),LFDNoise1.kr(1/[1,2,3,4]*~tempo/2).range(0.01,0.3));
        sig = Limiter.ar(sig);// * Pulse.ar(4/[1,2,8,16]);
        Splay.ar(sig,0.5,0.155);
    };
    ~raw.play;

    ~raw.map(\speed,~ctl);

    ~ctl.quant=[4,1/8];
    ~ctl = {Duty.kr(1/4/~tempo*2,0,Dseq([1,8,4,1,8,2,1,8,3,1,8,16,1,8,32,64,128],inf)) * ~tempo/2};

);
~raw.stop(5);
~raw.clear(5);
~raw.pause;
~raw.resume;





(
    s.latency=0.6;
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
