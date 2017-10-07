


p.push();
p.bpm(88);

(
    s.latency=0.2;
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

// one synth ///////////////////////////////////////

(
    ~one.ar(2);
    ~one.clock = p.clock;
    ~one.quant=16;
    ~one.fadeTime=4;
    ~one={
        var sig = SinOsc.ar(50!2,Pulse.ar(~tempo*2/[1,2,3,4])) * Pulse.ar(~tempo*4/[1,2,3,4]);
        Splay.ar(sig,0.335,0.15,SinOsc.ar(1));
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
    ~two.quant=[16,0];
    ~two.fadeTime=0.02;
    ~two={
        //  |       |       |       |       |  
        var pat = [
            1,0,0,0, 1,0,0,0, 1,0,0,0, 1,0,0,0,
        ].rotate(1);
        var imp = PulseDivider.kr(~tick.kr,[1,2,3,4]*4,~counter.kr%pat.size);
        var hit = Select.kr(PulseCount.kr(imp)%pat.size,pat);
        var env = EnvGen.ar(Env([0.001,1,0.0001],[0.002,0.15],[3,-3]),imp * hit);
        var sig = WhiteNoise.ar(1!2);
        sig = LPF.ar(sig,22000*(env**20)+100);
        sig = sig * env;
        Splay.ar(sig,0.25,0.5);
    };
    ~two.play;
);
~two.stop(4);
~two.clear;
~two.pause;
~two.resume;

// two synth ///////////////////////////////////////

(
    ~three.ar(2);
    ~three.clock = p.clock;
    ~three.quant=[16,0];
    ~three.fadeTime=0.02;
    ~three={
        //  |       |       |       |       |  
        var pat = [
            1,0,0,0, 0,0,0,0, 0,0,0,0, 0,0,0,0,
            0,0,0,0, 0,0,0,0, 0,0,0,0, 0,0,0,0,
            0,0,0,0, 0,0,0,0, 0,0,0,0, 0,0,0,0,
            0,0,0,0, 0,0,0,0, 0,0,0,0, 0,0,0,0,
        ].rotate(1);
        var imp = PulseDivider.kr(~tick.kr,1,~counter.kr%pat.size);
        var hit = Select.kr(PulseCount.kr(imp)%pat.size,pat);
        var env = EnvGen.ar(Env([0.001,1,0.0001],[0.002,4.5],[3,-3]),imp * hit);
        var sig = SinOsc.ar(4500*2!2) * LFPulse.ar(~tempo*8);
        sig = sig * env;
        Splay.ar(sig,0.75,0.5);
    };
    ~three.play;
);
~three.stop(4);
~three.clear;
~three.pause;
~three.resume;


// four synth ///////////////////////////////////////

(
    ~four.ar(2);
    ~four.clock = p.clock;
    ~four.quant=16;
    ~four.fadeTime=4;
    ~four={
        var sig = [SinOsc.ar(1/160/((1..12))), LFTri.ar(44,mul:2), SinOsc.ar(440*(2**((_+7!12)/12)),mul:LFNoise1.kr(1/4!12))] + LFTri.ar(1/500,mul:4);
        sig = Perlin3.ar(sig[0],sig[1],sig[2]);
        sig = LeakDC.ar(sig);
        sig = AllpassN.ar(sig,4/44,1/44,1);
        sig = Compander.ar(sig,~one.ar,0.1,1,0.1);
        Splay.ar(sig,0.1,0.15);
    };
    ~four.play;
);
~four.stop(4);
~four.clear;
~four.pause;
~four.resume;

// one synth ///////////////////////////////////////

(
    ~five.ar(2);
    ~five.clock = p.clock;
    ~five.quant=16;
    ~five.fadeTime=4;
    ~five={
        var change = ~tempo/[1,2,3,4,5,6]/4;
        var imp = Impulse.kr(change);
        var base = TChoose.kr(imp,44*[10,10/4,10/2,10*2,1]) * TChoose.kr(imp,[1,2,1/2,4])/2;
        var ht = TChoose.kr( Impulse.kr(change),[102,306,600,804,1008]);
        var f = base * (2**(ht/1200));
        var sig = SinOsc.ar(f,SinOsc.ar(base/.x[256,1024,2048])*0.5pi,mul:0.4) * (LFTri.ar(change)**1.2);
        sig = Compander.ar(sig,~one.ar,0.1,1,0.1);
        Splay.ar(sig,0.25,0.25);
    };
    ~five.play;
);
~five.stop(4);
~five.clear;
~five.pause;
~five.resume;

// symmtery synth ///////////////////////////////////////

(
    ~symmtery.ar(2);
    ~symmtery.clock = p.clock;
    ~symmtery.quant=16;
    ~symmtery.fadeTime=4;
    ~symmtery={
        var ml = LFTri.ar(~tempo/512)**2*4;
        var f = 44;
        var sig = SinOsc.ar([f,f/16,f/128],mul:ml);
        sig = Perlin3.ar(sig[0],sig[1],sig[2]);
        sig = LeakDC.ar(sig);
        sig = Compander.ar(sig,~one.ar,0.1,1,0.1);
        //sig = sig * LFTri.ar(~tempo);
        Splay.ar(sig,0.15,SinOsc.ar(f,LFNoise1.kr(~tempo/320)));
    };
    ~symmtery.play;
);
~symmtery.stop(4);
~symmtery.clear;
~symmtery.pause;
~symmtery.resume;


// perlinKarplusar synth ///////////////////////////////////////

(
    ~perlinKarplusar.ar(2);
    ~perlinKarplusar.clock = p.clock;
    ~perlinKarplusar.quant=4;
    ~perlinKarplusar.fadeTime=4;
    ~perlinKarplusar={
        var span = LFSaw.ar(1/60).exprange(0.0001,80+([1,2,3,4]/100))+1/2 + LFNoise2.kr(4!3,mul:1/4);
        var sig = SinOsc.ar([20+[0.1,0.001323,0.00003204],0.0001,0.00001],mul:[span,10,10]);
        //sig = Resonz.ar(sig,937.5,0.2);
        sig = Perlin3.ar(sig[0],sig[1],sig[2]) * LPF.ar(BrownNoise.ar(1!8),10) + (SinOsc.ar(12000/(2..8).log+(sig*pi),Pulse.ar(1.5),mul:1/1000) * Pulse.ar(~tempo/(2..8).nthPrime));
        sig = CombL.ar(sig,8/20,[1,2.0001,3.000023]/20,16);
        sig = LeakDC.ar(sig);
        sig = Normalizer.ar(sig);
        Splay.ar(sig,0.15,0.05);
    };
    ~perlinKarplusar.play;
);
~perlinKarplusar.stop(4);
~perlinKarplusar.clear;
~perlinKarplusar.pause;
~perlinKarplusar.resume;


(
    ~roatate.ar(2);
    ~roatate.clock = p.clock;
    ~roatate.quant=2;
    ~roatate.fadeTime=4;
    ~roatate={
        var t = LFSaw.ar([44,88.001]).range(0,2pi);
        var x = t.cos;
        var y = t.sin;
        var z = 0;
        var angle = LFSaw.ar(1/600).range(0,8pi);
        var nx = (angle.cos * x) - (angle.sin * y);
        var ny = (angle.sin * x) - (angle.cos * y);
        var nz = (angle.sin * x) - (angle.sin * y);
        var sig = Perlin3.ar(nx,ny,nz);
        sig = Compander.ar(sig,~one.ar,0.1,1,0.1);
        Splay.ar(sig,0.15,0.25);
    };
    ~roatate.play;
);
~roatate.stop(4);
~roatate.clear;
~roatate.pause;
~roatate.resume;

(
    ~master.quant=2;
    ~master.play;
    ~master.fadeTime = 0.01;
    ~master = {|wet=0.15,lp=3500,hp=250,len=10,rev = 3|
        var sig = In.ar([0,1]);
        var orig = CompanderD.ar(sig,3/4,1,1/10)*1.2;
        var fx;
        //fx = Limiter.ar(sig,0.95);
        sig = CompanderD.ar(sig,3/4,1,1/5);
        fx = LPF.ar(sig,lp);
        fx = HPF.ar(fx,hp);
        fx = DWGReverbC1C3.ar(NumChannels.ar(fx,2),[5000,5010],1/len)/rev;
        sig = SelectX.ar(wet,[orig,fx]);
        sig = NumChannels.ar(sig,2);
        ReplaceOut.ar(0,sig);
    };
);
p.moveNodeToTail(\master);


