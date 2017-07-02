p.push();
p.bpm(90/2);

(
    // one synth ///////////////////////////////////////

    (
        ~one.ar(2);
        ~one.clock = p.clock;
        ~one.quant=8;
        ~one.fadeTime=4;
        ~one={
            var sig = LFNoise1.ar(LFNoise2.kr(~tempo!3).range(1500,15000)) + VarSaw.ar(1.5,0,SinOsc.kr([9,75,50]));
            var f = LFNoise0.ar(~tempo/16!3).range(50,2500).round([7,12,24].midicps);
            sig = BPF.ar(sig,f + SinOsc.kr([3,4,5]),0.001+LFSaw.kr(~tempo/4/[1,2,3]).exprange(0.001,0.1));
            sig = Normalizer.ar(sig);
            sig = sig + (0.25*CombN.ar(sig,9/61,9/60.01,4)*ToggleFF.ar(Impulse.ar(~tempo/16/[1,2,3])));
            sig = sig + Formant.ar(f/32,f/16.01,f/8,mul:0.7) ;
            sig = LPF.ar(sig,2500) + CombN.ar((Pulse.ar(~tempo/[4,8,16,32]).softclip*sig),8,9/60,8);
            sig = AllpassN.ar(sig,1/50,10/f,30)* (LFSaw.ar(~tempo/8/[1,2,3,4])**4) ;
            Splay.ar(sig,0.3334,0.5);
        };
        ~one.play;
    );
    ~one.stop(4);
    ~one.clear;
    ~one.pause;
    ~one.resume;
)

(
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
)

(
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

)
