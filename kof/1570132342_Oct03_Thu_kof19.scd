p.push()


p.bpm(88.631)


b=Buffer.alloc(s,512*128,2);

// rec synth ///////////////////////////////////////

(
    ~rec.ar(2);
    ~rec.quant=0;
    ~rec.fadeTime=0;
    ~rec={
        var sig = BrownNoise.ar(1!2);
        RecordBuf.ar(sig,b.bufnum,recLevel:0.96,loop:0);
        //Splay.ar(sig,0.5,0.25);
    };
    //~rec.play;
);
~rec.stop(4);
~rec.clear;
~rec.pause;
~rec.resume;

(
    //s.latency=0.2;
    //p.clock.tempo_(120/60);
    p.arProxyNames.do({|synth| if(synth.asSymbol!=\master){p[synth.asSymbol].rebuild;};});
    ~tick.kr(1);
    ~tick.quant = 16;
    ~counter.quant = 16;
    ~counter = {PulseCount.kr(~tick.kr);};
    ~tick = { Impulse.kr( ~tempo * 4 ); };
);


// kick synth ///////////////////////////////////////

(
    ~kick.ar(2);
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
        var imp = PulseDivider.kr(~tick.kr,1,~counter.kr%pat.size);
        var hit = Select.kr(PulseCount.kr(imp)%pat.size,pat);
        var env = EnvGen.ar(Env([0.001,1,0.0001],[0.002,1.5],[3,-3]),imp * hit);
        var sig = SinOsc.ar(40+(env**40*20),env**40*8pi);
        sig = sig * env;
        Splay.ar(sig,0.0,0.95);
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
    ~one.quant=4;
    ~one.fadeTime=0.4;
    ~one={
        var f = [48,60].midicps+SinOsc.kr(~tempo/[4,5]);
        var am = LFTri.ar(~tempo/16,mul:1);
        var sig = [] ++ LFSaw.ar([~tempo/24,~tempo/32],add:1,mul: 2pi) ++ SinOsc.ar(f,mul:am);
        sig = Perlin3.ar(sig[0].cos,sig[1].sin,sig[2]+1);
        sig = Shaper.ar(b.bufnum,(sig.range(0,1)/2)+(am/2));
        sig = LeakDC.ar(sig);
        sig = MoogFF.ar(sig,f,0.29);
        sig = CompanderD.ar(sig,1/2,1/2,1);
        Splay.ar(sig,0.75,0.25);
    };
    ~one.play;
);
~one.stop(4);
~one.clear;
~one.pause;
~one.resume;


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
