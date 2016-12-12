p = NetProxy.push();
p.push()
p.bpm(110);


(
    s.latency=0.4;
    p.restartClock;
    p.arProxyNames.do({|synth| if(synth.asSymbol!=\master){ p[synth.asSymbol].quant = [16,0]; p[synth.asSymbol].rebuild;};});
    ~tick.kr(1);
    ~tick.clock = p.clock;
    ~tick.quant = 16;
    ~counter.clock = p.clock;
    ~counter.quant = 16;
    ~tick = { var imp = Impulse.kr(~tempo.kr * 4); SendTrig.kr(PulseDivider.kr(imp,16), 0, ~tempo.kr ); imp;  };
    ~counter = {PulseCount.kr(~tick.kr);};
    /*
    (
        SystemClock.sched( p.clock.timeToNextBeat(1 * 16) ,{ 
            p.restartClock;

        });
    );
    */
);

TempoClock.default = p.clock;

(
    ~master.quant=1;
    ~master.play;
    ~master.fadeTime = 0.01;
    ~master = {|wet=0.15,lp=4500,hp=250,len=4,rev = 2,duckLo = 150|
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

        fx = PitchShift.ar(fx,0.12,LFNoise2.kr(1/2!8).exprange(0.75,2.15));
        //fx = DelayN.ar(fx,[1,2,3,4,5,6]*~tempo,[1,2,3,4,5,6]*~tempo) * LFNoise2.kr(1/4!8)+fx;
        fx = LeakDC.ar(fx);
        fx = DWGReverb.ar(NumChannels.ar(fx,2),[5000,5100],1/len)/rev + fx;

        sig = SelectX.ar(wet,[orig,fx]);
        //  sig = Compander.ar(sig,~duck.ar,8/10,1/2,1);
        sig = NumChannels.ar(sig,2) ;
        sig = Limiter.ar(sig.softclip);
        sig = LeakDC.ar(sig);
        sig = HPF.ar(sig,150);
        ReplaceOut.ar(0,sig);
    };

    ~master_wet.quant = 4;
    //~master_wet = {LFDNoise1.kr(~tempo/1600!2).exprange(0.15,0.35);};
    // ~master_wet = {|sig| sig-(1-LFSaw.ar(~tempo*1)).range(0,1)**4};
    ~master.map(\wet,~master_wet);
    p.moveNodeToTail(\master);
);



(
    ~weirdo.quant=1;
    ~weirdo.fadeTime=4.02;
    ~weirdo={
        var sig = HPF.ar(LPF.ar(AudioIn.ar([1,1]),5000),150);
        var pure = sig;
        var t = (1..4) * ~tempo;
        sig = PitchShift.ar(sig,0.12,LFNoise2.kr(1/4 * ~tempo!8).exprange(0.75,1.15));
        sig = DelayN.ar(sig,t,t) * LFNoise2.kr(1/4 * ~tempo!8)+sig;
        //sig = GVerb.ar(HPF.ar(sig,100) + LPF.ar(sig,8000),[16,16],[5,6],spread:[50,90])/32 + sig;
        Splay.ar(sig.flat,0.95,0.95,SinOsc.kr(~tempo));
    };
    ~weirdo.play;
);
~weirdo.stop(7);
~weirdo.clear;

(
//////////////////////////  FADE -> OUT ///////////////////////////////////////////////////////
{
  p.arProxyNames.do({|synth| if(synth.asSymbol!=\master){p[synth.asSymbol].clear(20);};});
}.fork;  
)



/*
(
    p=ProxySpace.push(s.reboot);
    p.makeTempoClock;
    TempoClock.default = p.clock;
);

(
    p.clock.tempo_(110/60);

    ~offset = (0..7)/8;

    ~tick.quant = 1;
    ~tick = {Mix(Impulse.kr( ~tempo / 2 , ~offset ))};

    ~counter = {PulseCount.kr(~tick.kr)};
);

*/
// one synth ///////////////////////////////////////

(
    ~one.ar(2);
    ~one.quant=16;
    ~one.fadeTime=0.2;
    ~one={
        //         |       |       |       |       |  
        var pat = [1,0,0,0,1,0,0,0,1,0,0,0,1,0,0,0].rotate(1);
        var imp = PulseDivider.kr(~tick.kr,[1,2,3,4]);
        var hit = Select.kr(PulseCount.kr(imp)%pat.size,pat);
        var env = EnvGen.ar(Env([0.001,1,0.0001],[0.002,1.5],[3,-3],curve:'exp'),imp * hit);
        var sig = Limiter.ar(AudioIn.ar([1,2])*2).softclip + SinOsc.ar(50,env**20*8pi);
        sig = sig * env;
        Splay.ar(sig,0.75,0.5);
    };
    ~one.play;
);
~one.stop(4);
~one.clear;
~one.pause;
~one.resume;



(
    var tmp = '';

    x = FileReader.read("/tmp/text.txt");

    x.collect{|n| tmp = tmp ++ n };
    tmp.postln;

    x.choose.choose;

    Tdef(\a,{
        loop{
            ("echo "+x.choose.choose+" |  uconv -f utf-8 -t iso-8859-2 - | festival --tts").unixCmd;
            (4.3636).wait;  
        }
    });
    Tdef(\a).play;
)
("rekniTo").unixCmd;
Tdef(\a).stop;

// plain synth ///////////////////////////////////////

(
    ~plain.ar(2);
    ~plain.clock = p.clock;
    ~plain.quant=1;
    ~plain.fadeTime=4;
    ~plain={
        var sig = HPF.ar(LPF.ar(AudioIn.ar([1,1]),100),5000);
        //sig = CompanderD.ar(sig,3/4,1/2,1);
        Splay.ar(sig,0.5,0.55);
    };
    ~plain.play;
);
~plain.stop(4);
~plain.clear;
~plain.pause;
~plain.resume;



(
    //////////////////////////  FADE -> OUT ///////////////////////////////////////////////////////
    {
        p.arProxyNames.do({|synth| if(synth.asSymbol!=\master){p[synth.asSymbol].clear(20);};});
    }.fork;  
)

b = Buffer.alloc(s, 44100 * 8, 2); 

// lin synth ///////////////////////////////////////

(
    ~lin.ar(2);
    ~lin.clock = p.clock;
    ~lin.quant=16;
    ~lin.fadeTime=4;
    ~lin={
        var sig = HPF.ar(LPF.ar(AudioIn.ar([1,1]),150),5000);
        Splay.ar(sig,0.5,0.95);
    };
    //~lin.play;
);
~lin.stop(4);
~lin.clear;
~lin.pause;
~lin.resume;

(
    ~rec.quant=16;
    ~rec.ar(2);
    ~rec = { arg rate=1; 
        var sig = ~lin.ar;

        sig = Limiter.ar(sig);
        //sig = CompanderD.ar(sig,3/4,1/1.1,1/2);
        sig = NumChannels.ar(sig,2);
        //sig = CombN.ar(sig,1/50,1/50,1/4);
        RecordBuf.ar(sig,b.bufnum,0,1,0.334,loop:1);
        //BufWr.ar(sig, b.bufnum, Phasor.ar(0, BufRateScale.kr(b) * rate, 0, BufFrames.kr(b)));
        0.0 //quiet
    };

)

// use SinOsc to modulate the playrate

(
    ~b.ar(2);
    ~b.mold(2);
    ~b.quant=1;
    ~b.fadeTime=4;
    ~b = { 
        var mod = LFNoise2.kr(1/(1..8) * ~tempo).range(0.998,TChoose.kr(Impulse.kr(1/(1..8) * ~tempo),[1,2,4,8,16].reciprocal + 1))  ;
        //var sig = BufRd.ar(2, b.bufnum, LFSaw.ar([1/4,1/1.5,1/1.33333,1/2]/mod,mul:[1,1,0.52,0.71]).range(0, BufFrames.kr(b)));
        var sig = PlayBuf.ar(2,b.bufnum,mod,loop:1);
        //sig = sig * (LFTri.ar(1/16/[1,2,4,3])**4)/4;

        // sig = sig * LFTri.ar(1/4/[1,2,3,4]);
        //sig = CompanderD.ar(sig,3/4,1/2,1/2);
        //sig = LPF.ar(sig,15900);
        Splay.ar(sig,0.95,0.35);
    };
    ~b.play;
    ~b[10] = nil;
    //~b[10] = \filter -> {|sig| DWGReverb.ar(LPF.ar(HPF.ar(sig,300),5000),[5000,5021],1/30)/1.1+sig};
)

~b.stop;
~b.clear(4);

(
    //////////////////////////  FADE -> OUT ///////////////////////////////////////////////////////
    {
        p.arProxyNames.do({|synth| if(synth.asSymbol!=\master){p[synth.asSymbol].clear(20);};});
    }.fork;  
)



(
    ~modulator.quant=1;
    ~modulator.fadeTime = 2;
    ~modulator = {TChoose.kr(Impulse.kr(1/16*~tempo),[1,2,4,8,1/8,1/4]).lag(1/40)};


    // glitch synth ///////////////////////////////////////

    ~glitch2.ar(2);
    ~glitch2.clock = p.clock;
    ~glitch2.quant=1;
    ~glitch2.fadeTime=4;
    ~glitch2={
        var mod = Duty.ar(1/[1,2,3,4]/~tempo,0,Dseq([1,2,1,1.33333,4,0.1,0.8],inf));
        var f = [60,64,64,36].midicps * ~modulator.kr;

        var in = HPF.ar(LPF.ar(AudioIn.ar([1,1]),150),5000);
        //var in = Normalizer.ar(HPF.ar(LPF.ar(AudioIn.ar([1,2]),2500),150));
        //var in = CompanderD.ar(AudioIn.ar([1,2]),1/2,1/3,1);
        var t = LFSaw.ar([~tempo/4,~tempo/16,f]) + LFSaw.ar(4410,mul:1);
        var perl = Perlin3.ar(t[0],t[1],t[2]) * LFDNoise1.kr(1/16!4);
        var sig;


        sig = CombN.ar(in+perl,1/f,1/f+0.01,4) + perl + in/4;
        sig = LocalIn.ar(2) + sig;
        sig = DelayN.ar(sig,1/f,1/f);
        sig = GlitchBPF.ar(sig+in,f,0.14);
        sig = CompanderD.ar(sig,3/4,1/1.45,1);
        sig = LPF.ar(sig,f);
        sig = LeakDC.ar(sig);
        LocalOut.ar(NumChannels.ar(sig,2));

        sig = LeakDC.ar(sig);
        sig = PitchShift.ar(in+sig/2,0.25,[1,2,pi,1/pi]);
        in = CombN.ar(in,1/f,[2,1,8,4]/f,~tempo*4);
        sig = GlitchBPF.ar(sig+in,f,0.2);
        //sig = LPF.ar(sig,9000);

        sig = Normalizer.ar(sig);
        sig = Limiter.ar(sig/2,0.85);
        sig = CompanderD.ar(sig,3/4,1/2,1)/4;
        Splay.ar(sig,0.5,0.0025);
    };
    ~glitch2.play;
);
~glitch2.stop(4);
~glitch2.clear(16);
~glitch2.pause;
~glitch2.resume;


(
//////////////////////////  FADE -> OUT ///////////////////////////////////////////////////////
{
  p.arProxyNames.do({|synth| if(synth.asSymbol!=\master){p[synth.asSymbol].clear(20);};});
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
            1,0,0,0, 1,0,0,0, 1,0,0,0, 1,0,0,0,
            1,0,0,0, 1,0,0,0, 1,0,0,0, 1,0,0,0,
            1,0,0,0, 1,0,0,0, 1,0,0,0, 1,0,0,0,
            1,0,0,0, 1,0,0,0, 1,0,0,0, 1,0,1,0,
        ].rotate(1);
        //var imp = PulseDivider.kr(~tick.kr,2);
        var imp = PulseDivider.kr(~tick.kr,16);
        //var imp = PulseDivider.kr(~tick.kr,16);
        //var imp = PulseDivider.kr(~tick.kr,[1,2,3,4].nthPrime);
        var hit = Select.kr(PulseCount.kr(imp)%pat.size,pat);
        var env = {EnvGen.ar(Env([0.001,1,0.0001],[0.002,3.5/LFNoise2.kr(1/32*~tempo).range(1,2)],[20,-3]),imp * hit)};
        var sig = SinOsc.ar(50!2 + (env**2*50),env**40*8pi) + VarSaw.ar(50,0,env**4);
        sig = sig * env;
        Splay.ar(sig,0.005,0.0025);
    };
    ~kick.play;
);
~kick.stop(16);
~kick.clear(16);
~kick.pause;
~kick.resume;

// hiss synth ///////////////////////////////////////

(
    ~hiss.ar(2);
    ~hiss.clock = p.clock;
    ~hiss.quant=[16,0];
    ~hiss.fadeTime=0.02;
    ~hiss={
        //  |       |       |       |       |  
         //   1,0,1,0, 1,0,1,0, 1,0,1,0, 1,1,1,1,
        var pat = [
            1,0,0,0, 1,0,0,0, 1,0,0,0, 1,0,0,0,
            1,0,0,0, 1,0,0,0, 1,0,0,0, 1,0,0,0,
            1,0,0,0, 1,0,0,0, 1,0,0,0, 1,0,0,0,
            1,0,0,0, 1,0,0,0, 1,0,0,0, 1,0,1,0,
        ].rotate(1);
        var imp = PulseDivider.kr(~tick.kr,1);
        var hit = Select.kr(PulseCount.kr(imp)%pat.size,pat);
        var env = {EnvGen.ar(Env([0.001,1,0.0001],[0.002,0.5*LFNoise0.kr([1,2,3,4]*~tempo).range(0.01,0.5)],[3,-3]),imp * hit)};
        var sig = SinOsc.ar(440,mul:0.95);//HPF.ar(ClipNoise.ar(0.7!4),8000/[1,2,3,4]);
        sig = sig * env;
        Splay.ar(sig,0.05,0.015);
    };
    ~hiss.play;
);
~hiss.stop(4);
~hiss.clear(16);
~hiss.pause;
~hiss.resume;


(
//////////////////////////  FADE -> OUT ///////////////////////////////////////////////////////
{
  p.arProxyNames.do({|synth| if(synth.asSymbol!=\master){p[synth.asSymbol].clear(20);};});
}.fork;  
)

// karplus_glitch synth ///////////////////////////////////////

(
    ~modulator.quant=1;
    ~modulator.fadeTime = 2;
    ~modulator = {TChoose.kr(Impulse.kr(1/16*~tempo),[1,2,4,8,1/8,1/4]).lag(1/40)};

    ~karplus_glitch.ar(2);
    ~karplus_glitch.clock = p.clock;
    ~karplus_glitch.quant=1;
    ~karplus_glitch.fadeTime=4;
    ~karplus_glitch={
        var sig = CompanderD.ar(HPF.ar(AudioIn.ar([1,2],200)),1/3,1);
        //var f = [50,100,1000,500];
        var f = [60,64,36,72].midicps/4/~modulator.kr;
        sig = max(LocalIn.ar(4),sig * LFNoise2.kr(1/4*~tempo ! 4));// * Pulse.ar(~tempo/4/[1,2,3,4]).softclip;
        sig = DelayN.ar(sig,1/f,1/f) + sig / 2;
        sig = PitchShift.ar(sig,1/f,0.9905) + sig /2;
        sig = LPF.ar(sig,f*2) + sig / 2;
        sig = LeakDC.ar(sig);
        sig = Normalizer.ar(sig)/1.052;

        LocalOut.ar(sig);
        sig = HPF.ar(sig,100);

        Splay.ar(sig,0.5,0.005);
    };
    ~karplus_glitch.play;
);
~karplus_glitch.stop(4);
~karplus_glitch.clear;
~karplus_glitch.pause;
~karplus_glitch.resume;
