p.push();

p.bpm(69.4444445)
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

69.44444/60
1-0.1574073333333
~tempo={1.1574073333333}
~tempo={SinOsc.kr([33.midicps/1000]).range(1.1574073333333*0.999,1.1574073333333*1.001)};

// one synth ///////////////////////////////////////
s.latency=0.13334
~one.rebuild;
(
    ~one.ar(2);
    ~one.quant=4;
    ~one.fadeTime=0.12;
    ~one={
        var ll1 = LFTri.kr(~tempo/8/[1,2,3]).range(0.02,0.75);
        var ll2 = LFTri.kr(~tempo/16/[1,2,3]).range(0.02,0.75);
        var del = 1/(~tempo/[4,8,16])/4;
        var bass = [48,36].midicps + SinOsc.kr([3,4,5],mul:0.3);
        var high = [[65,67],[60,65]].midicps*2 + SinOsc.kr([4,5,6],mul:4.333);
        var mod = Duty.kr(1/~tempo*[4,8,16,1/4],0,Dseq([1,2,1.5,1.33333],inf)).lag(2);
        var mod2 = Duty.kr([4,8,16]/~tempo,0,Dseq([1,2,1.5,1.33333],inf)).lag(2);
        var sig = Pulse.ar(~tempo*4/[1,2,3,4]) * BrownNoise.ar(1!4);
        var lo,hi;

        lo = sig;
        //10.do{
        lo = DelayN.ar(lo,(1/(bass*mod)),(1/(bass*mod)));
        lo = AllpassN.ar(lo,1/bass*mod,1/bass*mod);
        lo = BPF.ar(lo,bass*mod,ll1);

        // };

        hi = DelayN.ar(sig,del,del);
        //10.do{
        hi = DelayN.ar(hi,(1/(high*mod2)),(1/(high*mod2)));
        hi = AllpassN.ar(hi,1/high*mod2,1/high*mod2);
        hi = BPF.ar(hi,high*mod2,ll2);
        //};


        /* 
        = Pluck.ar(SinOsc.ar(bass/[1,2,1.5,1.333]/mod),Impulse.ar(~tempo*4/[1,3,7,9]),ll1,2/bass*mod,ll1*2,mul:0.335);
        sig = sig + DelayN.ar( Pluck.ar(SinOsc.ar(high/[1,2,1.5,3/4]/mod2),Impulse.ar(),ll2,2/high/[1/mod2,mod2],ll2*2,mul:0.75),del,del);
        */
        sig = lo+hi/2;
        sig = MoogFF.ar(sig,bass/mod*[2,4,8]*[mod2,1/mod2],[3.2,3.2,2.5,1])+(sig/8);
        //sig = CompanderD.ar(sig,1/2,1/3,1);
        Splay.ar(sig,0.95,0.75);
    };
    ~one.play;
);

~one.stop(10);
~one.clear(30);
~one.pause;
~one.resume;

// kick synth ///////////////////////////////////////

(
    ~kick.ar(2);
    ~kick.quant=4;
    ~kick.fadeTime=[4];
    ~kick={
        var sig = SinOsc.ar(33.midicps,Pulse.ar(~tempo/16)*2pi)*Pulse.ar(~tempo/2);
        Splay.ar(sig,0.05,0.015);
    };
    ~kick.play;
);
~kick.stop(4);
~kick.clear;
~kick.pause;
~kick.resume;


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


// hiss synth ///////////////////////////////////////

(
    ~hiss.ar(2);
    ~hiss.quant=[16,0];
    ~hiss.fadeTime=0.02;
    ~hiss={
        //  |       |       |       |       |  
        var pat = [
            1,0,0,0, 0,0,0,0, 1,0,0,0, 0,0,0,0,
            1,0,0,0, 0,0,0,0, 1,0,0,0, 0,0,0,0,
            1,0,0,0, 0,0,0,0, 1,0,0,0, 0,0,0,0,
            1,0,0,0, 0,0,0,0, 1,0,0,0, 0,0,0,0,
        ].rotate(5);
        var imp = PulseDivider.kr(~tick.kr,[1,2,4,8],~counter.kr%pat.size);
        var hit = Select.kr(PulseCount.kr(imp)%pat.size,pat);
        var env = EnvGen.ar(Env([0.001,1,0.0001],[0.002,0.05],[3,-3]),imp * hit);
        var sig = WhiteNoise.ar(0.1!2);
        sig = sig * env;
        Splay.ar(sig,0.25,0.25);
    };
    ~hiss.play;
);
~hiss.stop(4);
~hiss.clear;
~hiss.pause;
~hiss.resume;


(
    ~master.quant=2;
    ~master.play;
    ~master.fadeTime = 0.01;
    ~master = {|wet=0.45,lp=3500,hp=250,len=10,rev = 3|
        var sig = In.ar([0,1]);
        var orig = sig;
        var fx;
        //fx = Limiter.ar(sig,0.95);
        sig = CompanderD.ar(sig,3/4,1/1.1,1/3);
        fx = LPF.ar(sig,lp);
        fx = HPF.ar(fx,hp);
        fx = DelayN.ar(sig,10/100,10/100);
        fx = DWGReverb3Band.ar(NumChannels.ar(fx,2),[2000,2010,5000,5001])/rev;
        sig = SelectX.ar(wet,[orig,fx]);
        sig = NumChannels.ar(sig,2);
        ReplaceOut.ar(0,sig);
    };
);
p.moveNodeToTail(\master);
