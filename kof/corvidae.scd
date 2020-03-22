/**
Coded by Kof @ 
Sat 21 Mar 2020 12:40:48 PM CET
\n\n
   ,dPYb,                  ,dPYb,
   IP'`Yb                  IP'`Yb
   I8  8I                  I8  8I
   I8  8bgg,               I8  8'
   I8 dP" "8    ,ggggg,    I8 dP
   I8d8bggP"   dP"  "Y8ggg I8dP
   I8P' "Yb,  i8'    ,8I   I8P
  ,d8    `Yb,,d8,   ,d8'  ,d8b,_
  88P      Y8P"Y8888P"    PI8"8888
                           I8 `8,
                           I8  `8,
                           I8   8I
                           I8   8I
                           I8, ,8'
                            "Y8P'
*/

"ls /home/kof/Downloads/corvidea/wav".unixCmd.postln

(
    var index = 0;
    a = [];
    b = SoundFile.collect("/home/kof/Downloads/corvidea/wav/*").do{|f|
        a = a.add(Buffer.read(s,f.path));
    };
)

p.push()
p.tempo(121.35);
p.tempo(88);

(
    ~corvidae={
        var sig = PlayBuf.ar(2,a[0].bufnum,1/(1..12));
        Splay.ar(sig);
    };
    ~corvidae.play;
)

~corvidae.stop

~ss.rebuild;
~ss2.rebuild;
~ss3.rebuild;

(
    Tdef(\x,{
        loop{
            "rebuilding".postln;
            ~ss.rebuild;
            ~ss2.rebuild;
            ~ss3.rebuild;
            24.sleep;
        };

    });
    Tdef(\x).play;
)
Tdef(\x).stop;



// stereo control ///////////////////////////////////////

(
    ~stereo.quant=24;
    ~stereo.fadeTime=0;
    ~stereo={
        var ctl = LFTri.kr(~tempo/12);
        ctl;
    };
);
~stereo.stop(4);
~stereo.clear;
~stereo.pause;
~stereo.resume;


// one synth ///////////////////////////////////////

c = Buffer.alloc(s,16,48000);
(
    ~one.ar(2);
    ~one.quant=8;
    ~one.fadeTime=0.4;
    ~one={
        var mod = Duty.kr(16/~tempo,0,Dseq([1,2,1.5,1.33333],inf));
        //var sig = LFSaw.ar([50,49.994,49.9859]*mod);
        var sig = DWGBowed.ar([50,49.994,49.9859],1,1,LFTri.kr(~tempo*4).range(0.75,1),1,LFTri.kr(~tempo*4/[1,2,3,4]).range(0.002,0.94));
        sig = DWGSoundBoard.ar(sig);
        sig = RLPF.ar(sig,LFTri.ar(~tempo/4/[1,2,3,4]).range(150,15000));
        sig = BufDelayL.ar(c.bufnum,sig,SinOsc.ar(~tempo/16,mod/(12/((2..17).log*12))).exprange(0.00001,0.02));
        //sig = AllpassL.ar(sig*LFSaw.ar(4/[1,2,3]),4/50,mod/50);
        //sig = LPF.ar(sig,1500);
        Splay.ar(sig,~stereo.kr,0.05);
    };
    ~one.play;
);
~one.stop(4);
~one.clear;
~one.pause;
~one.resume;


(
    ~violin.ar(2);
    ~violin.quant=4;
    ~violin.fadeTime=3.02;
    ~violin={
        var index = a.size.rand;
        var mod = ~tempo/[2,1]/[1,1.3333,1.5,2]/TChoose.kr(Impulse.ar(~tempo/24/[1,2,3,4]),[1.5,1.33335,1,0.75])/1.5;
        var trate, dur, clk, pos, pan,sig;
        trate = 120;
        2.do{
            mod = mod / TChoose.kr(Impulse.ar(~tempo/24/[1,2,3,4]),[1.5,1.33335,1,0.5]);
        };
        dur = BufDur.kr(a[index].bufnum) / trate;
        clk = Impulse.kr(trate);
        pos = LFSaw.ar(1/200/[1,2,4,8]).range(0,BufDur.kr(a[index].bufnum)) + TRand.kr(0, 0.001, clk);
        pan = WhiteNoise.kr(0.6);
        sig = TGrains.ar(2, clk, a[index].bufnum, mod, pos, dur, pan, 0.3);
        sig = sig * (LFTri.ar(~tempo/24/[1,2,3,4])**4);
        //sig = sig * Pulse.ar(1/4/[1,2,3,4]);
        //sig = Resonz.ar(sig,[468,1168]/TChoose.kr(Impulse.kr(8!4),[1,2,1.5,1.3333]),0.02);
        //sig = CompanderD.ar(sig,3/4,1/2,1) ;//** LFNoise2.kr(1/4!3).range(0.5,1.99);
        Splay.ar(sig,~stereo.kr,0.95);
    };
    ~violin.play;
);
~violin.stop(50);
~violin.clear;
TRand
// player synth ///////////////////////////////////////

(
    ~ss.ar(2);
    ~ss.quant=4;
    ~ss.fadeTime=5.02;
    ~ss={
        var index = a.size.rand;
        var mod2 = Duty.kr(24/~tempo*[1,2,3,4],0,Dseq([1,2,1,1.5],inf));
        var mod = ([1,-1,0.5,-0.5])*mod2;//[-1,0.25,-0.25,8,1/16];
        var spread = 0.005;
        var pos = [0,0.5,0.05,0.06] + LFSaw.kr(~tempo/24/[1,2,3,4]).exprange(0.001,0.9);
        //         |       |       |       |       |  
        var pat = [1,0,0,0, 0,0,0,0, 0,0,0,0, 1,0,0,0, 0,0,0,0 ,0,0,0,0 ].rotate(6);
        var imp = PulseDivider.kr(~tick.kr,[1,2,3,4]);
        var hit = Select.kr(PulseCount.kr(imp)%pat.size,pat);
        var env = EnvGen.ar(Env([0.001,1,0.001],[0.52,1*[1,2,3,4]],[3,-3],curve:'exp'),imp * hit);
        var sig = PlayBuf.ar(a[index].numChannels,a[index].bufnum,BufRateScale.kr(a[index].bufnum)*mod+(env*0.01),hit, (pos + BrownNoise.ar(1!8).range(spread * -1,spread)) * BufFrames.kr(a[index].bufnum),2);

        sig = sig * env;// * SinOsc.kr(~tempo/16/[1,2,3,4]).range(0.1);
        Splay.ar(sig.flat,~stereo.kr,0.5);
    };
    ~ss.play;
);
~ss.stop(7);
~ss.clear;


// player synth ///////////////////////////////////////
(
    ~ss2.ar(2);
    ~ss2.quant=4;
    ~ss2.fadeTime=5.02;
    ~ss2={
        var index = a.size.rand;
        var mod2 = Duty.kr(24/~tempo*[1,2,3,4],0,Dseq([1,2,1,1.5],inf));
        var mod = ([1,-1,0.5,-0.5])*mod2;//[-1,0.25,-0.25,8,1/16];
        var spread = 0.005;
        var pos = [0,0.5,0.05,0.06] + LFSaw.kr(~tempo/24/[1,2,3,4]).exprange(0.001,0.9);
        //         |       |       |       |       |  
        var pat = [1,0,0,0, 0,0,0,0, 0,0,0,0, 1,0,0,0, 0,0,0,0 ,0,0,0,0 ].rotate(6);
        var imp = PulseDivider.kr(~tick.kr,[1,2,3,4]);
        var hit = Select.kr(PulseCount.kr(imp)%pat.size,pat);
        var env = EnvGen.ar(Env([0.001,1,0.001],[0.52,1*[1,2,3,4]],[3,-3],curve:'exp'),imp * hit);
        var sig = PlayBuf.ar(a[index].numChannels,a[index].bufnum,BufRateScale.kr(a[index].bufnum)*mod+(env*0.01),hit, (pos + BrownNoise.ar(1!8).range(spread * -1,spread)) * BufFrames.kr(a[index].bufnum),2);

        sig = sig * env;// * SinOsc.kr(~tempo/16/[1,2,3,4]).range(0,1);
        Splay.ar(sig.flat,~stereo.kr,0.5);
    };
    ~ss2.play;
);
~ss.stop(7);
~ss.clear;


// player synth ///////////////////////////////////////

(
    ~ss3.ar(2);
    ~ss3.quant=4;
    ~ss3.fadeTime=5.02;
    ~ss3={
        var index = a.size.rand;
        var mod2 = Duty.kr(24/~tempo*[1,2,3,4],0,Dseq([1,2,1,1.5],inf));
        var mod = ([1,-1,0.5,-0.5])*mod2;//[-1,0.25,-0.25,8,1/16];
        var spread = 0.005;
        var pos = [0,0.5,0.05,0.06] + LFSaw.kr(~tempo/24/[1,2,3,4]).exprange(0.001,0.9);
        //         |       |       |       |       |  
        var pat = [1,0,0,0, 0,0,0,0, 0,0,0,0, 1,0,0,0, 0,0,0,0 ,0,0,0,0 ].rotate(6);
        var imp = PulseDivider.kr(~tick.kr,[1,2,3,4]);
        var hit = Select.kr(PulseCount.kr(imp)%pat.size,pat);
        var env = EnvGen.ar(Env([0.001,1,0.001],[0.52,1*[1,2,3,4]],[3,-3],curve:'exp'),imp * hit);
        var sig = PlayBuf.ar(a[index].numChannels,a[index].bufnum,BufRateScale.kr(a[index].bufnum)*mod+(env*0.01),hit, (pos + BrownNoise.ar(1!8).range(spread * -1,spread)) * BufFrames.kr(a[index].bufnum),2);

        sig = sig * env;// * SinOsc.kr(~tempo/16/[1,2,3,4]).range(0,1);
        Splay.ar(sig.flat,~stereo.kr,1);
    };
    ~ss3.play;
);
~ss.stop(7);
~ss.clear;



// enveloper synth ///////////////////////////////////////

(
    ~enveloper.ar(2);
    ~enveloper.quant=24;
    ~enveloper.fadeTime=4;
    ~enveloper={
        var f = 2;
        var sig = [] ++ ~ss.ar ++ ~ss2.ar ++ ~ss3.ar;
        //sig = SelectX.ar(LFSaw.ar(~tempo/24/[1,2,3,4])*sig.size,sig);
        //sig = BPF.ar(sig,MouseX.kr(50,16000),0.2)+sig;
        //sig = CombL.ar(sig*Decay.ar(Impulse.ar(~tempo*4/[1,2,3,4],0.85)),1/f,1/f,1)+sig;
        //sig = sig * LFTri.ar(~tempo*4/[1,2,3,4]);
        sig = CompanderD.ar(sig,1/2,1/2,1);
        Splay.ar(sig,0,1);
    };
    ~enveloper.play;
);
~enveloper.stop(4);
~enveloper.clear;
~enveloper.pause;
~enveloper.resume;

// shaper synth ///////////////////////////////////////

(
    ~shaper.ar(2);
    ~shaper.quant=4;
    ~shaper.fadeTime=4;
    ~shaper={
        var index = a.size.rand;
        //var sig = Shaper.ar(a[index].bufnum,LFSaw.ar(~tempo/4)+LFSaw.ar(100,mul:0.01));
        var spread = 0.00015;
        var mod = [1,2,4];
        var imp = Impulse.ar(25/[1,2,3,4]);
        var pos = [0,0.5] + LFSaw.kr(~tempo/240/[1,1.0001]).exprange(0.001,0.5);
        var sig = PlayBuf.ar(a[index].numChannels,a[index].bufnum,BufRateScale.kr(a[index].bufnum)*mod,imp, (pos + BrownNoise.ar(1!8).range(spread * -1,spread)) * BufFrames.kr(a[index].bufnum),2);
        sig = SinOsc.ar(sig.range(5,150).lag(1/25))*sig;
        sig = CompanderD.ar(sig,1/2,1/2,1);
        sig = sig * LFTri.ar(~tempo/4/[1,2,3,4]);
        Splay.ar(sig,0.75,0.25);
    };
    ~shaper.play;
);
~shaper.stop(4);
~shaper.clear;
~shaper.pause;
~shaper.resume;


/////////////
(
    ~hasher.ar(2);
    ~hasher.clock = p.clock;
    ~hasher.quant=8;
    ~hasher.fadeTime=4;
    ~hasher={
        var sig = VarSaw.ar(5000/[1,2,4],mul:0.1) * Pulse.ar(~tempo*4/[1,2,3]);
        for(1,6,{|i| sig = sig ++ CombN.ar(sig/4 * Pulse.ar(i),1/16*i,1/16*i,4)});
        sig = SelectX.ar(LFTri.ar(~tempo/4/[1,2,3,4]).range(0,sig.size),sig);
        Splay.ar(sig,0.5,0.5,SinOsc.kr(7));
    };
    ~hasher.play;
);
~hasher.stop(4);
~hasher.clear;
~hasher.pause;
~hasher.resume;

(
    //////////////////////////  FADE -> OUT ///////////////////////////////////////////////////////
    {
        p.arProxyNames.do({|synth| if(synth.asSymbol!=\master){p[synth.asSymbol].clear(20);};});
    }.fork;  
)

// simple synth ///////////////////////////////////////

(
    ~simple.ar(2);
    ~simple.clock = p.clock;
    ~simple.quant=[4,1];
    ~simple.fadeTime=4;
    ~simple={
        var mod = Duty.kr(8/~tempo,0,Dseq([1,2,1.5,1.33333],inf));
        var pos = LFSaw.ar(~tempo/(1..16)).exprange(15000.00,50);
        var sig = BPF.ar(Dust.ar(pos),pos,LFNoise2.ar(~tempo!16).range(0.01,0.4));
        RandSeed.kr(Impulse.ar(pos/100),123);
        sig = Normalizer.ar(sig) * Pulse.ar(~tempo/[1,2,3]*.x[1,1.5,2,3]).softclip;
        sig = SinOsc.ar(sig.range(5,5000).round(250/mod) ,sig*(1/8)*pi,mul:0.3) * Pulse.ar(~tempo/[1,2,3]*.x[1,1.5,2,3]).softclip;
        sig = CompanderD.ar(LPF.ar(sig,15000) + (sig/10),3/4,1/2,1);
        sig = CombN.ar(sig,~tempo/2,~tempo/2,4);
        Splay.ar(sig,0.665,0.25,SinOsc.kr(7.1));
    };
    ~simple.play;
);
~simple.stop(4);
~simple.clear;
~simple.pause;
// kick synth ///////////////////////////////////////

(
    ~kick.quant=12;
    ~kick.fadeTime=0.2;
    ~kick={
        //         |       |       |       |       |  
        var pat = [1,0,0,0,1,0,0,0,1,0,0,0,1,0,0,0,1,0,0,0,0,0,0,0].rotate(1);
        var imp = PulseDivider.kr(~tick.kr,1,~counter.kr);
        var hit = Select.kr(PulseCount.kr(imp)%pat.size,pat);
        var env = EnvGen.ar(Env([0.001,1,0.001],[0.002,1.5],[3,-3],curve:'exp'),imp * hit);
        var sig = SinOsc.ar([43.2,43.1,43.01,43.55]*1.25+(env**10*100),env**20*2pi);
        sig = sig * env;
        Splay.ar(sig,1,0.95);
    };
    ~kick.play;
);
~kick.stop(7);
~kick.clear;


// hiss synth ///////////////////////////////////////

(
    ~hiss.quant=24;
    ~hiss.fadeTime=0.2;
    ~hiss={
        //         |       |       |       |       |  
        var pat = [1,0,0,0,1,0,0,0,1,0,0,0,1,1,1,1,1,0,0,0,1,1,1,1].rotate(3);
        var imp = PulseDivider.kr(~tick.kr,[1,2,3,4],~counter.kr);
        var hit = Select.kr(PulseCount.kr(imp)%pat.size,pat);
        var env = EnvGen.ar(Env([0.001,1,0.001],[0.002,0.25],[3,-3],curve:'exp'),imp * hit);
        var sig = Crackle.ar([0.2,0.4,0.7,0.9]+(env**2));
        sig = sig * env;
        Splay.ar(sig,~stereo.kr,0.75);
    };
    ~hiss.play;
);
~hiss.stop(7);
~hiss.clear;


// neue synth ///////////////////////////////////////

(
    ~neue.ar(2);
    ~neue.quant=[24,0];
    ~neue.fadeTime=0.02;
    ~neue={
        //  |       |       |       |       |  
        var pat = [
            1,0,0,0, 1,0,0,0, 1,0,0,0, 1,0,0,0,
            1,0,0,0, 1,0,0,0, 1,0,0,0, 1,0,0,0,
            1,0,0,0, 1,0,0,0, 1,0,0,0, 1,0,0,0,
            1,0,0,0, 1,0,0,0, 1,0,0,0, 1,0,0,0,
        ].rotate(3);
        var imp = PulseDivider.kr(~tick.kr,1,~counter.kr%pat.size);
        var hit = Select.kr(PulseCount.kr(imp)%pat.size,pat);
        var env = EnvGen.ar(Env([0.001,1,0.0001],[0.002,0.5],[3,-3]),imp * hit);
        var sig = ~ss.ar;
        sig = sig * env;
        Splay.ar(sig,0.75,0.5);
    };
    ~neue.play;
);
~neue.stop(4);
~neue.clear;
~neue.pause;
~neue.resume;

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

// oneone synth ///////////////////////////////////////

(
    ~oneone.ar(2);
    ~oneone.quant=4;
    ~oneone.fadeTime=4;
    ~oneone={
        var mod = Duty.kr([16,32,64]*4/~tempo,0,Dseq(([1,2,1.5,1.33333] *.x [1,2,4,1/2,1/4] /.x [1.333,1,1,1.5]).scramble,inf));
        var f = TChoose.kr(Impulse.kr(~tempo/64/[1,2,3]),(5500 * [1,2,1.5,1.33333] /.x [1,2,4,1/2,1/4] *.x [1.333,1,1,1.5]).scramble) / mod + SinOsc.kr(7,mul:0.5pi);
        var sig = SelectX.ar(LFTri.ar(~tempo/[1,2,3]).exprange(0.001,f.size+1),SinOsc.ar(f,Pulse.ar(~tempo),mul:0.1));
        sig = sig * Pulse.ar(~tempo/[1,2,3]);
        //sig = sig * CombN.ar(Pulse.ar(~tempo*2/[1,2,3]),1/~tempo,1/~tempo,8);
        sig = PitchShift.ar(sig,1/~tempo,1.5/mod.lag(~tempo/2));
        sig = CompanderD.ar(sig,3/4,1/2,1);
        sig = LPF.ar(sig,5000);
        //sig = Compander.ar(sig,~kick.ar,0.1,1,0.1);      
        Splay.ar(sig,0.25,0.15,SinOsc.ar(6.97));
    };
    ~oneone.play;
    //    ~oneone[20] = \filter -> {|in| DWGReverbC1C3.ar(in,[2000,2010],1/2)/8+in };
);
~oneone.stop(4);
~oneone.clear;
~oneone.pause;
~oneone.resume;


(
    //s.latency=0.2;
    //p.clock.tempo_(120/60);
    p.arProxyNames.do({|synth| if(synth.asSymbol!=\master){p[synth.asSymbol].rebuild;};});
    ~tick.kr(1);
    ~tick.quant = 24;
    ~counter.quant = 24;
    ~counter = {PulseCount.kr(~tick.kr);};
    ~tick = { Impulse.kr( ~tempo * 4 ); };
);

(
    ~master.quant=2;
    ~master.play;
    ~master.fadeTime = 0.01;
    ~master = {|wet=0.05,lp=3500,hp=250,len=10,rev = 3|
        var sig = In.ar([0,1]);
        var orig = sig;
        var fx;
        //fx = Limiter.ar(sig,0.95);
        sig = CompanderD.ar(sig,3/4,1/2,1);
        fx = LPF.ar(sig,lp);
        fx = HPF.ar(fx,hp);
        fx = DWGReverbC1C3.ar(NumChannels.ar(fx,2),[5000,5010],1/len)/rev;
        sig = SelectX.ar(wet,[orig,fx]);
        sig = NumChannels.ar(sig,2);
        ReplaceOut.ar(0,sig);
    };
);
p.moveNodeToTail(\master);

