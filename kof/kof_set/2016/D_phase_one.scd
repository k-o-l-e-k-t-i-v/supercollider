/*
* This program is free software; you can redistribute it and/or modify
* it under the terms of the GNU General Public License as published by
* the Free Software Foundation; either version 2 of the License, or
* (at your option) any later version.
*
* This program is distributed in the hope that it will be useful,
* but WITHOUT ANY WARRANTY; without even the implied warranty of
* MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the
* GNU General Public License for more details.
*
* You should have received a copy of the GNU General Public License
* along with this program; if not, see <http://www.gnu.org/licenses/>.
*
* Copyright (C) kof, 2016
*/


p = NetProxy.connect();
p.restartClock();
p.bpm;
p.arProxyNames;
p.metro(4);

p.bpm(127)


(

    s.latency = 0.3;
    (
        p.clock.sched(p.clock.timeToNextBeat(16),{ 
            p.arProxyNames.do({|synth| if(synth.asSymbol!=\master){p[synth.asSymbol].rebuild;};});
            ~tick.rebuild;
        });
    );
);

(
    p=ProxySpace.push(s.reboot);
    p.makeTempoClock;
    //TempoClock.default = p.clock;
);

~chaos.clear(8)

(
    var synths = [];
    p.arProxyNames.do({|synth| if(synth.asSymbol!=\master){synths ++ synth;};});
    "fading out "+synths.last.asSymbol;
    p[synths.last.asSymbol].clear(2);
)

(
    //////////////////////////  FADE -> OUT -> LONG ///////////////////////////////////////////////////////
    {
        p.arProxyNames.do({|synth| if(synth.asSymbol!=\master){p[synth.asSymbol].clear(20);};});
    }.fork;
)

//////////////////////////  FADE -> OUT FAST ///////////////////////////////////////////////////////
(
    p.clock.sched(p.clock.timeToNextBeat(32),{
        p.arProxyNames.do({|synth| if(synth.asSymbol!=\master){p[synth.asSymbol].clear(0.2);};});
    });  
);

ProxyMixer.new(p,16);

(
    ~tick.kr(1);
    ~tick.clock = p.clock;
    ~tick.quant=4;
    ~tick = { Impulse.kr(~tempo*4); };
    ~counter = {PulseCount.kr(~tick.kr);};
);


p.makeTempoClock;
TempoClock.default = p.clock;

//p.arProxyNames.postln;
p.clock.tempo_(127/60);



(
    ~moog.ar(2);
    ~moog.clock = p.clock;
    ~moog.quant=[16];
    ~moog.fadeTime=20.2;
    ~moog={
        var mul = 1;//1+2.reciprocal;
        var deviation = 1.33;
        var pat = 1/64/[1,2,3,4]*~tempo.kr;
        var harm = TChoose.kr(Impulse.kr(pat),[1,2,1,4,1,1,1,8,1,4]).lag(1/100);
        var f =  ([60,64,69,65]).midicps * harm / {TChoose.kr(Impulse.kr(pat),[1,2,1.5,1.33333])}!4 * mul;
        var sig = LFSaw.ar(f * [1,1.01] + SinOsc.kr(1/4/[1,2,3,4]*~tempo,mul:deviation),mul:[0.7,0.4,0.2,0.1]) * (LFTri.ar(pat*2,mul:0.9)**6);
        sig = Vibrato.ar(sig,[5,6,7,8],0.02);
        sig = BMoog.ar(sig,f*[2,1/2,4],LFNoise2.kr(1/16!4).range(0.05,1),mul:[1,0.4,0.02]);
        sig = LPF.ar(sig,f*3);
        sig = HPF.ar(sig,40);
        sig = Limiter.ar(sig,0.8);
        sig = LPF.ar(sig,7000);
        sig = CompanderD.ar(sig,3/4,1/2,1);
        Splay.ar(sig,0.25,0.15);
    };
    ~moog.play;
    //   ~moog[10] = \filter -> {|sig| LPF.ar(DWGReverb.ar(HPF.ar(NumChannels.ar(sig,2),80),[4004,4014]),LFNoise2.kr(1/4!2).range(5000,9000))+sig;};
);
~moog.stop(8);
~moog.clear(10);
~moog.pause;
~moog.resume;


(
    {
        p.arProxyNames.do({|synth| if(synth.asSymbol!=\master){p[synth.asSymbol].clear(30);};});
    }.fork;
)

// karplus.g synth ///////////////////////////////////////

(
    ~karplus.ar(2);
    ~karplus.clock = p.clock;
    ~karplus.quant=[16];
    ~karplus.fadeTime=4;
    ~karplus={
        var pat = 1/4/[1,2,3,4] * ~tempo.kr;
        var sig = (PinkNoise.ar(0.91!2) * LFPulse.ar(1/8/[1,2,3,4]*~tempo,0,0.005)) + LocalIn.ar(4);
        var mod = TChoose.kr(Impulse.kr(pat/4),[2,4,1,1/2]).lag(1/400);
        var mod2 = TChoose.kr(Impulse.kr(pat/16),[2,1.5,4,1,1.3333333]).lag(1/400);
        var base = [60,64,69,61].midicps * mod / mod2;
        sig = BPF.ar(sig,base,0.04);
        sig = DelayN.ar(sig,1/base,1/base);
        sig = Limiter.ar(sig);
        LocalOut.ar(sig/1.051);
        //sig = CombL.ar(sig,1/base,2/base,0.7);
        //sig = sig * (LFTri.ar(pat)**2);
        sig = CompanderD.ar(sig,3/4,1/3,1/2);
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

// saw synth ///////////////////////////////////////

(
    ~saw.ar(2);
    ~saw.clock = p.clock;
    ~saw.quant=[16];
    ~saw.fadeTime=8.2;
    ~saw={
        var mod = Duty.kr(16/~tempo.kr*2,0,Dseq([1,2,1.5,1.33333],inf));
        //         |       |       |       |       |
        var pat = [1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0].rotate(1);
        var imp = PulseDivider.kr(~tick.kr,1,~counter.kr%pat.size);
        var hit = Select.kr(PulseCount.kr(imp)%pat.size,pat);
        var env = EnvGen.ar(Env([0.001,1,0.0001],[4,0.05],[30,-10]),imp * hit);
        var sig = [] ++ LFSaw.ar([60.midicps/4,72.midicps*8/mod],mul:[1,0.1,0.05]) ++ (SinOsc.ar(84.midicps*16,mul:0.1) * Pulse.ar(8*~tempo.kr));
        sig = sig.flat;
        sig = sig * env;
        Splay.ar(sig,0.05,0.25);
    };
    ~saw.play;
    //~saw[10] = \filter -> {|sig|LPF.ar(DWGReverb.ar(HPF.ar(NumChannels.ar(sig,2),50),[4000,4010]),1500+LFTri.kr(1/16!2).range(0,10000));};
);
~saw.stop(4);
~saw.clear(16);
~saw.pause;
~saw.resume;

(
    //////////////////////////  FADE -> OUT ///////////////////////////////////////////////////////
    {
        p.arProxyNames.do({|synth| if(synth.asSymbol!=\master){p[synth.asSymbol].clear(20);};});
    }.fork;
)

(
    ~sell.ar(4);
    ~sell.mold(4);
    ~sell.clock = p.clock;
    ~sell.quant=[16];
    ~sell.fadeTime=4;

    ~sell={var t = LFTri.kr([1/1600,1/1600,[1/4,1/2,1/8,1/16]]*~tempo/400) * 1/2 + LFSaw.ar(1/4000,mul:2); Perlin3.ar(t[0],t[1],t[2]);};
)


(
    //////////////////////////  FADE -> OUT ///////////////////////////////////////////////////////
    {
        p.arProxyNames.do({|synth| if(synth.asSymbol!=\master){p[synth.asSymbol].clear(20);};});
    }.fork;
)
// scanner synth ///////////////////////////////////////

(
    ~scanner.ar(2);
    ~scanner.clock = p.clock;
    ~scanner.quant=[16,0];
    ~scanner.fadeTime=4.2;
    ~scanner={
        //         |       |       |       |       |
        var pat = [1,0,0,0,1,0,0,0,1,0,0,0,1,0,0,0].rotate(1);
        var imp = PulseDivider.kr(~tick.kr,[1,2,3,4],~counter.kr % pat.size);
        var hit = Select.kr(PulseCount.kr(imp)*[1,2,3,4]%pat.size,pat);
        var env = {Decay2.kr(imp*hit,1/4*[1,2,3,4]*~tempo*LFNoise2.kr(~tempo/64!4).exprange(1.0,4.9),0.0005)};
        var sig = [
            SinOsc.ar(60.midicps/4,Pulse.ar(~tempo/[1,2,3,4])),
            LFNoise2.ar(1500!2) * Pulse.ar(~tempo/[1,2,3,4]),
            Pulse.ar([4,3,2,1]*~tempo*2) * SinOsc.ar(55,Pulse.ar(~tempo/[1,2,3,4])),
            Crackle.ar(1.85+Pulse.ar(~tempo/[1,2,3,4]));
            SinOsc.ar(60.midicps/4,Pulse.ar(~tempo/[1,2,3,4]),mul:LFNoise2.kr(1/4!4)),
            Pulse.ar(~tempo*4) * SinOsc.ar(1500),
            LFNoise1.ar(5800!2) * Pulse.ar(~tempo/[1,2,3,4]),
            LFSaw.ar(60.midicps/4,0,Pulse.ar(~tempo/[1,2,3,4]),mul:0.1),
        ];
        sig = SelectX.ar(~sell.ar*sig.size,sig);
        //sig = Resonz.ar(sig,LFNoise2.kr(1/4/[1,2,3,4] * ~tempo).exprange(100.01,1600),0.2,mul:2)+sig/2;
        sig = HPF.ar(sig,40);
        //sig =  (sig * Pulse.ar(~tempo*[1,2,3,4]/2));
        sig = CompanderD.ar(sig,3/4,1/1.1,1/2);
        //sig = CombC.ar(sig,1/60.midicps*4,1/60.midicps*[4,2,1.5,2],8)+sig;
        sig = Limiter.ar(sig,0.95);
        sig = sig * env;
        //sig = LPF.ar(GVerb.ar(sig,90,3)/2,2000)+sig/2;
        Splay.ar(sig,0.95,0.25,SinOsc.kr(4.01*~tempo)/1.2);
    };
    ~scanner.play;
    //    ~scanner[10] = \filter -> {|sig|DWGReverb.ar(HPF.ar(LPF.ar(NumChannels.ar(sig,2),LFNoise2.kr(1/4!2).range(5000,13000)),300),[3000,3010])/4+sig;};
);
~scanner.stop(4);
~scanner.clear(10);
~scanner.pause;
~scanner.resume;


// slowmo, player synth ///////////////////////////////////////

b = Buffer.read(s,Platform.resourceDir ++ "/sounds/mono/beat.wav");
(
    ~smp.ar(2);
    ~smp.clock = p.clock;

    ~smp.quant=[16,0];
    ~smp.fadeTime=2.02;
    ~smp={
        var mod = 1/4/[1,1.5,1.3333,2];
        var spread = 0.0;
        var pos = [0,0.5,0.25,0.6] + LFSaw.ar(1/128/2*~tempo.kr).round(1/128/2);
        //         |       |       |       |       |
        var pat = [1,0,0,0,1,0,0,0,1,0,0,0,1,0,0,0].rotate(1);
        var imp = PulseDivider.kr(~tick.kr,[1,2,4,8],~counter.kr);
        var hit = Select.kr(PulseCount.kr(imp)%pat.size,pat);
        var env = EnvGen.ar(Env([0.001,1,0.0001],[0.002,0.5],[10,3],curve:'exp'),imp * hit);
        var sig = PlayBuf.ar(b.numChannels,b.bufnum,BufRateScale.kr(b.bufnum)*mod+(env**0.01/100),imp, (pos) * BufFrames.kr(b.bufnum),2);

        sig = sig * env;
        sig = Vibrato.ar(sig,[4,5],0.02);
        Splay.ar(sig.flat,0.5,0.15);
    };
    ~smp.play;
    //  ~smp[10] = \filter -> {|sig|LPF.ar(DWGReverb.ar(HPF.ar(NumChannels.ar(sig,2),300),[4003,4013]),1500+LFSaw.kr(1/32!2).range(0,4000))/4+sig;};
);

~smp.stop(7);
~smp.clear(10);

// first perlin noisy synth ///////////////////////////////////////
(
    ~one_weird.ar(2);
    ~one_weird.quant=[16];
    ~one_weird.clock = p.clock;
    ~one_weird.fadeTime=8;
    ~one_weird={
        var t = LFTri.ar([1/64,50,1/32/(1..16)]) * ((1..16)*10);
        var f = Perlin3.ar(t[0],t[1],t[2]);
        var sig = Formant.ar(f.range(29.midicps,29.midicps*100/[1,2,1.5,4]),f.range(29.midicps,29.midicps*100).scramble,f.range(29.midicps,29.midicps*100).reverse,mul:LFTri.kr(1/(1..16))**4 );
        sig = sig ** 0.05;
        sig = CompanderD.ar(BPF.ar(sig,60.midicps*10/8*(1..8),0.5),3/4,1/LFNoise2.kr(1/4!8).range(1,4),1/2);

        Splay.ar(sig,0.95,0.95);
    };

    ~one_weird_env.ar(2);
    ~one_weird_env.clock = p.clock;
    ~one_weird_env.quant=[16];
    ~one_weird_env.fadeTime=0.2;
    ~one_weird_env={
        //         |       |       |       |       |
        var pat = [1,0,0,0,1,0,0,0,1,0,0,0,1,0,0,0].rotate(1);
        var imp = PulseDivider.kr(~tick.kr,16,~counter.kr%pat.size);
        var hit = Select.kr(PulseCount.kr(imp)%pat.size,pat);
        var env = EnvGen.ar(Env([0.001,1,0.0001],[8,0.005]/~tempo,[2,-30]),imp * hit);
        //var env = (LFSaw.ar(1/4*~tempo.kr)**16);
        var sig = ~one_weird.ar;// * LFSaw.ar([20,20.01]);
        sig = HPF.ar(sig,env.exprange(14000.01,150),0.42);
        sig = sig * env;
        //sig = sig * (LFSaw.ar(1/64*~tempo.kr)**3);
        Splay.ar(sig,0.95,0.15);
    };
    ~one_weird_env.play;
    //~one_weird_env[10] = \filter -> {|sig|LPF.ar(DWGReverb.ar(HPF.ar(NumChannels.ar(sig,2),50),[4001,4011]),5000)+sig;};

);
~one_weird_env.stop(4);
~one_weird_env.clear;
~one_weird_env.pause;
~one_weird_env.resume;

(
    //////////////////////////  FADE -> OUT ///////////////////////////////////////////////////////
    {
        p.arProxyNames.do({|synth| if(synth.asSymbol!=\master){p[synth.asSymbol].clear(30);};});
    }.fork;
)

(
    ~tick.kr(1);
    ~tick.clock = p.clock;
    ~tick.quant=4;
    ~tick = { Impulse.kr(~tempo * 2); };
    ~counter = {PulseCount.kr(~tick.kr);};
);

///// second perlin noisy weirdo FFT_WEIRDO ///////////////////////////////////////////////////////////////////////////

(
    b = Buffer.alloc(s,2048,1);
    ~a.ar(2);
    ~a.clock = p.clock;
    ~a.quant=16;
    ~a.fadeTime=8;
    ~a.mold(2);
    ~a =  { var in, chain,sig;
        var mel = TChoose.kr(Impulse.kr(1/32*~tempo.kr),[1.5,1.3333,1,2,1.666666,1.875]);//Duty.kr(1/50,0,Dseq([1,2,1.5,1.33333],inf));
        var mod = SinOsc.ar(1/50,mul:0.05);
        var t = LFSaw.ar([1/16,1/4000,29.midicps/mel]) * 480 * (LFTri.ar(1/32/[1,2,3])**8);
        in = Perlin3.ar(t[0],t[1],t[2]);
        in = Normalizer.ar(in) + RLPF.ar(Pulse.ar(2*~tempo.kr),8000);
        chain = FFT(b.bufnum, in) ;
        chain = PV_MagFreeze(chain, Decay.kr(Dust.kr(0.15),0.1) );
        chain = PV_BrickWall(chain, mod);
        chain = PV_MagShift(chain, 0.5 );
        chain = IFFT(chain);

        sig = chain;

        sig = LPF.ar(sig,18000);
        sig = HPF.ar(sig,40);
        sig = AllpassN.ar(sig,1/[100,101],1/5,4);
        sig = CombL.ar(sig,1/29.midicps*mel,1/29.midicps*mel,4);
        sig = CompanderD.ar(sig,3/4,1/3,1/10,0.002);
        Splay.ar(sig,0.99,0.25);

    };


    ~a_env.ar(2);
    ~a_env.clock = p.clock;
    ~a_env.quant=[4,1/4];
    ~a_env.fadeTime=0.2;
    ~a_env={
        //         |       |       |       |       |
        var pat = [1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0].rotate(1);
        var imp = PulseDivider.kr(~tick.kr,[1,2]);
        var hit = Select.kr(PulseCount.kr(imp)%pat.size,pat);
        var env = {EnvGen.ar(Env([0.001,1,0.0001],[[2,0.99]/~tempo,1/40],[20,-3]),imp * hit)};
        //var sig = Mix.fill(10,{|n| SinOsc.ar(50!2,env**(n+10)*8pi)});
        var sig = ~a.ar;
        sig = sig * env;
        Splay.ar(sig,0.85,0.15,SinOsc.ar(1/[4,5])/2);
    };
    ~a_env.play;

    //~a_env[10] = \filter -> {|sig|LPF.ar(DWGReverb.ar(HPF.ar(NumChannels.ar(sig,2),50),[4002,4012]),1600+LFSaw.kr(1/32!2).range(0,10000))+sig;};
);
~a_env.stop(4);
~a_env.clear(8);
~a_env.pause;
~a_env.resume;


(
    {
        p.stop(30);
        ~master.play;
        30.wait;
        p.clean;
    }.fork;
)



// hard sin nabeh, synth ///////////////////////////////////////

(
    ~sup.ar(2);
    ~sup.clock = p.clock;
    ~sup.quant=[16,0];
    ~sup.fadeTime=0.02;
    ~sup={
        //         |       |       |       |       |
        var pat = [
            1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,
            0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,
            0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,
            0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,
        ].rotate(1);
        var imp = PulseDivider.kr(~tick.kr,1);
        var hit = Select.kr(PulseCount.kr(imp)%pat.size,pat);
        var env = EnvGen.ar(Env([0.000001,1,0.0001],[0.95,0.05],[3,-3]),imp * hit);
        var sig = Mix.fill(10,{|n| SinOsc.ar(33.midicps+(n/100),env**(10+(n*5))*8pi) + WhiteNoise.ar(env**4)})/2;

        sig = sig * env;
        Splay.ar(sig,0.05,0.15);
    };
    ~sup.play;
    //~sup[10] = \filter -> {|sig|LPF.ar(DWGReverb.ar(HPF.ar(NumChannels.ar(sig,2),30),[4004,4014]),LFNoise2.kr(1/4!2).range(10000,17000))+sig;};

);
~sup.stop(4);
~sup.clear(2);
~sup.pause;
~sup.resume;

//////////////////////////////////////////////////////
//////////////////////////////////////////////////////
// hat synth ///////////////////////////////////////

(
    ~high_glitch.clock = p.clock;
    ~high_glitch.quant=[16,0];
    ~high_glitch.fadeTime=0.02;
    ~high_glitch={
        var imp = PulseDivider.kr(~tick.kr,[1,2]);
        //var imp = PulseDivider.kr(~tick.kr,[4,16]/4);
        var env = {EnvGen.ar(Env([0.001,1,0.001],[0.002,[0.05,0.2]],[3,-3]),imp)};
        var sig = WhiteNoise.ar(0.5!2);
        sig = HPF.ar(sig,LFNoise2.kr(1/16 * ~tempo/2 !4).range(1000,16000)) * LFPulse.ar(1/4/[1,4]*~tempo,0,1/4);
        sig = sig * env;
        sig = sig + (CombN.ar(sig * LFPulse.ar(1/4/[1,2,3,4] * ~tempo/2,0,0.15),1/50,1/50,0.5));
        Splay.ar(sig,0.45,0.25);
    };
    ~high_glitch.play;
    //~high_glitch[10] = \filter -> {|sig|LPF.ar(DWGReverb.ar(HPF.ar(NumChannels.ar(sig,2),5000),[4001,4011]),12000)+sig;};
);
~high_glitch.stop(7);
~high_glitch.clear;

// perl synth ///////////////////////////////////////

(
    ~perl.ar(2);
    ~perl.quant=[16];
    ~perl.fadeTime=0.001;
    ~perl={
        var mod = Duty.kr(16/~tempo,0,Dseq([1,2,1.5,1.33333],inf))  ;
        var sig = LFSaw.ar([1/16,1/4,5000/mod]*~tempo) ** 4 * 400;
        var pan = sig;
        sig = Perlin3.ar(sig[0],sig[1],sig[2]) * (LFSaw.ar(1/4/[1,2,3,4] * ~tempo)**2);
        Splay.ar(sig,0.75,0.005,LeakDC.ar(pan));
    };
    ~perl.play;
);
~perl.stop(4);
~perl.clear;
~perl.pause;
~perl.resume;

(
    //s.latency=0.2;
    //p.clock.tempo_(120/60);
    p.arProxyNames.do({|synth| if(synth.asSymbol!=\master){p[synth.asSymbol].rebuild;};});
    ~tick.kr(1);
    ~tick.clock = p.clock;
    ~tick.quant = 16;
    ~counter.clock = p.clock;
    ~counter.quant = 16;
    //~counter = {PulseCount.kr(~tick.kr);};
    //~tick = { Impulse.kr( ~tempo * 4 ); };
);

// kick synth ///////////////////////////////////////

(
    ~kick.ar(2);
    ~kick.clock = p.clock;
    ~kick.quant=[16];
    ~kick.fadeTime=0.02;
    ~kick={
        //         |       |       |       |       |
        var pat = [
            1,0,0,0,1,0,0,0,1,0,0,0,1,0,0,0,
            1,0,0,0,1,0,0,0,1,0,0,0,1,0,0,0,
            1,0,0,0,1,0,0,0,1,0,0,0,1,0,0,0,
            1,0,0,0,1,0,0,0,1,0,0,0,1,0,0,0,
        ].rotate(1);
        var mod = LFNoise2.kr(1/4*~tempo).range(10,40);
        var imp = PulseDivider.kr(~tick.kr,16);
        var hit = Select.kr(PulseCount.kr(imp)%pat.size,pat);
        var env = EnvGen.ar(Env([0.001,1,0.0001],[0.002,4.5],[40,-10]),imp * hit);
        var sig = Mix.fill(8,{|n| SinOsc.ar(33.midicps+(env**1.95*2),env**(mod+(n/2000))*8pi) + BrownNoise.ar(env**mod)});
        //sig= Limiter.ar(sig,0.9);
        sig = sig * env/3.9;
        sig = CompanderD.ar(sig,3/4,1,1/3,0.0002);
        SendTrig.kr(Impulse.kr(~tempo/8),1,1);
        //sig = Clip.ar(sig,-0.95,0.95);

        Splay.ar(sig,0.05,0.75);
    };
    ~kick.play;
);
~kick.stop(8);
~kick.clear(8);
~kick.resume;


(
    {
        p.arProxyNames.do({|synth| if(synth.asSymbol!=\master){p[synth.asSymbol].clear(16);};});
    }.fork;
)

// two synth ///////////////////////////////////////

(
    ~k_two.ar(2);
    ~k_two.clock = p.clock;
    ~k_two.quant=[16,0];
    ~k_two.fadeTime=0.02;
    ~k_two={
        //         |       |       |       |       |
        var mod = LFNoise2.kr(1/4*~tempo).range(20,80);
        var pat = [1,0,0,0,1,0,0,0,1,0,0,0,1,0,0,0,1,0,0,0,1,0,0,0,1,0,0,0,1,1,1,1];
        var imp = PulseDivider.kr(~tick.kr,1,~counter.kr);
        var hit = Select.kr(PulseCount.kr(imp)%pat.size,pat);
        var env = EnvGen.ar(Env([0.001,1,0.00001],[0.002,1],[10,-3]),imp * hit);
        var sig = SinOsc.ar(50+(env**(mod*2)*LFNoise1.kr(1/32!4).range(50,350)),env**mod*8pi);
        sig = sig * env;
        Splay.ar(sig,0.25,0.67);
    };
    ~k_two.play;
);
~k_two.stop(4);
~k_two.clear(8);
~k_two.pause;
~k_two.resume;

//////////////////////////  FADE -> OUT ///////////////////////////////////////////////////////
(
    p.clock.sched(p.clock.timeToNextBeat(32),{
        ~k_two.clear(1);
        ~kick.clear(1);
        ~onea.clear(1);
    });  
);

// hh synth ///////////////////////////////////////

(
    ~hh3.ar(2);
    ~hh3.clock = p.clock;
    ~hh3.quant=[16,0];
    ~hh3.fadeTime=0.2;
    ~hh3={
        //         |       |       |       |       |
        var pat = [1,0,1,0,1,0,1,0,1,0,1,0,1,0,1,0,1,0,1,0,1,0,1,0,1,1,0,0,1,0,1,0];
        var imp = PulseDivider.kr(~tick.kr,[1,4],~counter.kr);
        var hit = Select.kr(PulseCount.kr(imp)/[1,2,3,4]%pat.size,pat);
        var env = EnvGen.ar(Env([0.01,1,0.0001],[0.005,1/2*~tempo],[60,-5]),imp * hit);
        var sig = LFNoise1.ar([1600,16000]/[1,4,8,16]) * Crackle.ar([0.1,0.7,0.4,0.6]+env);
        sig = sig * env;
        Splay.ar(sig,0.25,0.55);
    };
    ~hh3.play;
);
~hh3.stop(4);
~hh3.clear(40);
~hh3.pause;
~hh3.resume;

(
    //////////////////////////  FADE -> OUT ///////////////////////////////////////////////////////
    {
        p.arProxyNames.do({|synth| if(synth.asSymbol!=\master){p[synth.asSymbol].clear(20);};});
    }.fork;
)

(
    n = ProxyMixer(p,32);
    n.parent.alwaysOnTop_(true);
)

(
    // one synth ///////////////////////////////////////

    (
        ~tam.ar(2);
        ~tam.clock = p.clock;
        ~tam.quant=[16];
        ~tam.fadeTime=0.2;
        ~tam={
            var pat = [
                //      |       |       |       |       |
                1,0,0,0,1,0,0,0,1,0,0,0,1,0,0,0,
                1,0,0,0,1,0,0,0,1,0,0,0,1,0,0,0,
            ];
            var imp = PulseDivider.kr(~tick.kr,1,~counter.kr);
            var hit = Select.kr(PulseCount.kr(imp)%pat.size,pat);
            var env = EnvGen.ar(Env([0.001,1,0.0001],[0.002,1.75],[20,-3],curve:'exp'),imp * hit);
            var sig = Mix.fill(4,{|i| SinOsc.ar(50+i+(env**20*500),env**40*8pi)});
            sig = sig + (env**20*PinkNoise.ar(1!2));
            sig = sig + (env**40.5*SinOsc.ar([500,500.001]));
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
            var pat = [
                //      |       |       |       |       |
                0,0,1,0,0,0,1,0,0,0,1,0,0,0,1,0,
                0,0,1,0,0,0,1,0,0,0,1,0,0,0,1,0,
            ];
            var imp = PulseDivider.kr(~tick.kr,1);
            var hit = Select.kr(PulseCount.kr(imp)%pat.size,pat);
            var env = EnvGen.ar(Env([0.001,1,0.0001],[0.002,1.25],[3,-3],curve:'exp'),imp * hit);
            var sig = Mix.fill(4,{|i|SinOsc.ar(50+i,env**(40-i)*8pi)}) + Resonz.ar(WhiteNoise.ar(env**40),env**2*14000+40);
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
        p.arProxyNames.do({|synth| if(synth.asSymbol!=\master){p[synth.asSymbol].clear(4);};});
    }.fork;
)

(
    n = ProxyMixer(p,32);
    n.parent.alwaysOnTop_(true);
)

// switch synth ///////////////////////////////////////

(
    ~switch.ar(2);
    ~switch.clock = p.clock;
    ~switch.quant=[16,1];
    ~switch.fadeTime=8.2;
    ~switch={
        var pat = [1,0,1,0,1,0,1,0,1,0,1,0,1,1,0,0].pyramid;
        //         |       |       |       |       |
        var imp = PulseDivider.kr(~tick.kr,[1,2,3,4,5,6].scramble,~counter.kr%pat.size);
        var hit = Select.kr(PulseCount.kr(imp)%pat.size,pat);
        var env = EnvGen.ar(Env([0.001,1,0.0001],[0.002,0.1*[1,2,3,4]],[3,30]),imp * hit);
        var sig = WhiteNoise.ar(0.4!4) * Pulse.ar(1000);
        sig = RHPF.ar(sig,[1000,2500,12500,15000,1000,500,12500],LFNoise2.kr(1/4!4 * ~tempo/2).range(0.1,0.9));
        sig = sig * env * LFPulse.ar(1/4/(1..6)*~tempo,0,1/4);
        sig = CompanderD.ar(sig,3/4,1,1/3,0.0002);
        Splay.ar(sig,0.5,0.245);
    };
    ~switch.play;
    //~switch[10] = \filter -> {|sig|LPF.ar(DWGReverb.ar(HPF.ar(NumChannels.ar(sig,2),5000),[4001,4011]),12000)+sig;};
);
~switch.play;
~switch.stop(4);
~switch.clear;




// pre-kick synth ///////////////////////////////////////

(
    ~kick_even.ar(2);
    ~kick_even.clock = p.clock;
    ~kick_even.quant=[16,0];
    ~kick_even.fadeTime=0.02;
    ~kick_even={
        var mod = Duty.kr(4 / ~tempo.kr,0,Dseq([1,2,1.5,1.33333,1.875,1.666666],inf));
        //         |       |       |       |       |
        var pat = [
            1,0,0,0,1,0,0,0,1,0,0,0,1,0,0,0,
        ];
        var imp = PulseDivider.kr(~tick.kr,8,~counter.kr%pat.size);
        var hit = Select.kr(PulseCount.kr(imp)%pat.size,pat);
        var env = EnvGen.ar(Env([0.001,1,0.0001],[2/~tempo,0.2],[3,-4]),imp * hit);
        var sig = SinOsc.ar((33).midicps,env*8pi) + PinkNoise.ar(env**2*2);
        //sig= Limiter.ar(sig,0.9);
        sig = sig * env;
        sig = CompanderD.ar(sig,3/4,1/2,1/3,0.0002);
        sig = Clip.ar(sig,-0.95,0.95);
        Splay.ar(sig,0.05,0.135);
    };
    ~kick_even.play;

    //~kick_even[10] = \filter -> {|sig|LPF.ar(DWGReverb.ar(HPF.ar(NumChannels.ar(sig,2),30),[3000,3010]),LFNoise2.kr(1/4!2).range(1000,7000))+sig;};
);
~kick_even.stop(4);
~kick_even.clear;


(
    n = ProxyMixer(p,32);
    n.parent.alwaysOnTop_(true);
)


(
    ~tick.kr(1);
    ~tick.clock = p.clock;
    ~tick.quant=4;
    ~tick = { Impulse.kr(~tempo * 4); };
    ~counter = {PulseCount.kr(~tick.kr);};
);

b = Buffer.read(s,Platform.resourceDir ++ "/sounds/mono/violin.wav");

// player synth ///////////////////////////////////////

(
    ~violin.ar(2);
    ~violin.clock = p.clock;
    ~violin.quant=16;
    ~violin.fadeTime=4.02;
    ~violin={
        var speed = 1/4/[1,2,3,4] * ~tempo.kr;
        var mod = 1/1.5/[1,1.3333,1.5,2]/TChoose.kr(Impulse.ar(1/16/[1,2,3,4]*~tempo.kr),[1.5,1.33335,1,0.75,1.6666666,1.875])/[1,1.5];
        var trate, dur, clk, pos, pan,sig;
        trate = 120;
        2.do{
            mod = mod / TChoose.kr(Impulse.ar(speed),[1.5,1.33335,1,0.5]);
        };
        dur = BufDur.kr(b) / trate;
        clk = Impulse.kr(trate);
        pos = LFSaw.ar(1/4000/[1,2,4,8]).range(0,BufDur.kr(b)) + TRand.kr(0, 0.0001, clk);
        pan = WhiteNoise.kr(0.6);
        sig = TGrains.ar(2, clk, b.bufnum, mod, pos, dur, pan, 0.3);
        sig = sig * (LFTri.ar(speed) ** 8 * LFTri.kr(~tempo));
        Splay.ar(sig.flat,0.95,0.15);
    };
    ~violin.play;
    //~violin[10] = \filter -> {|sig|LPF.ar(DWGReverb.ar(HPF.ar(NumChannels.ar(sig,2),300),[3000,3010]),LFNoise2.kr(1/4!2).range(1000,7000));};
);
~violin.stop(10);
~violin.clear(10);


(
    p.clock.sched(p.clock.timeToNextBeat(32),{ 
        (
            //////////////////////////  FADE -> OUT ///////////////////////////////////////////////////////
            {
                p.arProxyNames.do({|synth| if(synth.asSymbol!=\master){p[synth.asSymbol].clear(20);};});
            }.fork;  
        )
    });
);


// sw synth ///////////////////////////////////////

(
    ~sw.ar(2);
    ~sw.clock = p.clock;
    ~sw.quant=[4,0];
    ~sw.fadeTime=8.2;
    ~sw={
        var base = [72,60,48].midicps / Duty.kr(4/~tempo,0,Dseq([1,2,1.5,1.33333],inf));
        //         |       |       |       |       |
        var pat = [1,1,1,1];
        var imp = PulseDivider.kr(~tick.kr,(1..8)*4,~counter.kr % pat.size);
        var hit = Select.kr(PulseCount.kr(imp)%pat.size,pat);
        var env = EnvGen.ar(Env([0.001,1,0.0001],[1.5,0.005]/~tempo,[8,-6]),imp * hit);
        var sig = [
            SinOsc.ar(base!2),
            SinOsc.ar(SinOsc.ar(base/[1,2,3,4]).range(24.midicps,33.midicps*100/[1,1.3333,2,1.5]),mul:0.1),
            Pulse.ar(base/100),
            LFSaw.ar(base*2/[1,2,1.33333,1.5],mul:0.1),
            Formant.ar(base*1.5,base*10/[1,1.333,1.5,2],base*10/[1,2,4,8]),
            LFNoise2.ar(base*10!2),
            SinOsc.ar(base/[1,2,1.33333,1.5],mul:0.1),
            Pulse.ar(4*~tempo/2),
            LFNoise2.ar(base*10/[1,2,4,8]),
            VarSaw.ar(base!2),
            LFSaw.ar(base*10/[1,2,1.3333,1.5],mul:0.1)
        ];
        sig = SelectX.ar(LFSaw.ar(8/(1..8)*~tempo.kr)*sig.size,sig);
        sig = sig * (LFTri.ar(1/4/(1..8)*~tempo.kr)**4);
        //sig = CombN.ar(sig,1/base,2/base,4);
        sig = CompanderD.ar(sig,3/4,1/1.5,1/2);
        sig = sig * env;
        Splay.ar(sig,0.15,0.125);
    };
    ~sw.play;
    //~sw[10] = \filter -> {|sig|DWGReverb.ar(HPF.ar(LPF.ar(NumChannels.ar(sig,2),LFNoise2.kr(1/4!2).range(5000,13000)),300),[3000,3010])/4+sig;};

);
~sw.stop(4);
~sw.clear(4);
~sw.pause;
~sw.resume;

~circular.clear(8)

(
    //////////////////////////  FADE -> OUT ///////////////////////////////////////////////////////
    {
        p.arProxyNames.do({|synth| if(synth.asSymbol!=\master){p[synth.asSymbol].clear(20);};});
    }.fork;
)

// moog synth , DANEGEROUS LARGE offset ///////////////////////////////////////

(
    ~moog2.ar(2);
    ~moog2.clock = p.clock;
    ~moog2.quant=[16,0];
    ~moog2.fadeTime=4.2;
    ~moog2={
        var mul = 1;
        var deviation = 1.03;
        var pat = 1/2/[1,2,3,4]*~tempo.kr;
        var harm = TWChoose.kr(Impulse.kr(pat),[1,2,4,8],[1,1,0.2,0.1],1).lag(1/100);
        var f =  (48).midicps * harm / {TWChoose.kr(Impulse.kr(pat),[1,2,1.5,1.33333],[2,2,0.2,0.1],1)}!4 * mul;
        var sig = LFSaw.ar(f * [1,1.001] + SinOsc.kr(1/4/[1,2,3,4]*~tempo,mul:deviation),mul:[0.7,0.4,0.2,0.1]) * (LFTri.ar(pat*2,mul:0.9)**8);
        sig = Vibrato.ar(sig,[5,6,7,8],0.02);
        sig = BMoog.ar(sig,f*[2,1/2,4],LFNoise2.kr(1/16!4 * ~tempo/2).range(0.05,1),mul:[1,0.4,0.02]);
        sig = LPF.ar(sig,f*3);
        sig = HPF.ar(sig,40);
        sig = Limiter.ar(sig,0.8);
        sig = LPF.ar(sig,7000);
        sig = CompanderD.ar(sig,3/4,1/2,1);
        Splay.ar(sig,0.25,0.15);
    };
    ~moog2.play;
    //~moog2[10] = \filter -> {|sig| LPF.ar(DWGReverb.ar(HPF.ar(NumChannels.ar(sig,2),80),[4004,4014]),LFNoise2.kr(1/4!2).range(5000,9000))+sig;};
);
~moog2.stop(16);
~moog2.clear;
~moog2.pause;
~moog2.resume;


