

p.push();
p.bpm(79.5*3);

(
    //////////////////////////  FADE -> OUT ///////////////////////////////////////////////////////
    {
        p.arProxyNames.do({|synth| if(synth.asSymbol!=\master){p[synth.asSymbol].clear(20);};});
    }.fork;  
)

// oneone synth ///////////////////////////////////////

(
    ~oneone.ar(2);
    ~oneone.clock = p.clock;
    ~oneone.quant=16;
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
        sig = Compander.ar(sig,~kick.ar,0.1,1,0.1);      
        Splay.ar(sig,0.75,0.05,SinOsc.ar(6.97));
    };
    ~oneone.play;
    ~oneone[20] = \filter -> {|in| DWGReverbC1C3.ar(in,[2000,2010],1/2)/8+in };
);
~oneone.stop(4);
~oneone.clear;
~oneone.pause;
~oneone.resume;


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
// kick synth ///////////////////////////////////////

(
    ~kick.ar(2);
    ~kick.clock = p.clock;
    ~kick.quant=[16,0];
    ~kick.fadeTime=0.02;
    ~kick={
        //  |       |       |       |       |  
        var pat = [
            1,0,0,0, 0,0,0,0, 1,0,1,0, 1,0,0,0,
            1,0,0,0, 0,0,0,0, 1,0,0,0, 0,0,0,0,
            1,0,0,0, 0,0,0,0, 1,0,0,0, 0,0,0,0,
            1,0,0,0, 1,0,0,0, 1,0,1,0, 1,0,1,0,
        ].rotate(1);
        var imp = PulseDivider.kr(~tick.kr,1,~counter.kr%pat.size);
        var hit = Select.kr(PulseCount.kr(imp)%pat.size,pat);
        var env = {EnvGen.ar(Env([0.001,1,0.0001],[0.002,1.5]*LFNoise1.ar(~tempo/16).range(0.5,1.5),[3,-3]*LFNoise1.kr(~tempo*4).range(1,1.5)),imp * hit)};
        var sig = SinOsc.ar(55+(env**20*150)+BrownNoise.ar(env**10*50),env**20*8pi);
        sig = sig * env * LFNoise1.ar(~tempo*4).range(0.66,1);
        Splay.ar(sig,0.75,0.25);
    };
    ~kick.play;
);
~kick.stop(4);
~kick.clear;
~kick.pause;
~kick.resume;


// varkick synth ///////////////////////////////////////

(
    ~varkick.ar(2);
    ~varkick.clock = p.clock;
    ~varkick.quant=[16,0];
    ~varkick.fadeTime=0.02;
    ~varkick={
        //  |       |       |       |       |  
        var pat = [
            0,0,0,0, 1,0,0,0, 0,0,0,0, 1,0,0,0,
            0,0,0,0, 1,0,0,0, 0,0,0,0, 1,0,0,0,
            0,0,0,0, 1,0,0,0, 0,0,0,0, 1,0,0,0,
            0,0,0,0, 1,0,0,0, 0,0,0,0, 1,0,0,0,
        ].rotate();
        var imp = PulseDivider.kr(~tick.kr,1,~counter.kr%pat.size);
        var hit = Select.kr(PulseCount.kr(imp)%pat.size,pat);
        var env = {EnvGen.ar(Env([0.001,1,0.0001],[0.25,1.5]*LFNoise2.kr(~tempo/64).range(1/2,4),[3,-3]),imp * hit)};
        var sig = VarSaw.ar(55,0,env**(0.6/[1,2,3,4])+(env**20));
        sig = sig * env;
        sig = Compander.ar(sig,~kick.ar,0.1,1,0.1);      
        Splay.ar(sig,0.75,0.015,SinOsc.ar(7)*3/4);
    };
    ~varkick.play;
);
~varkick.stop(4);
~varkick.clear;
~varkick.pause;
~varkick.resume;



b = Buffer.read(s,Platform.resourceDir ++ "/sounds/beat.wav");

// player synth ///////////////////////////////////////

(
    ~one.ar(2);
    ~one.quant=16;
    ~one.fadeTime=6.02;
    ~one={
        var mod = TChoose.kr(Impulse.kr(~tempo/16/[1,2,3]),[1,1/1.5,1/1.3333333,2,1/2,1/1.66666,1]);
        var spread = 0.00005;//005;
        var pos = LFSaw.kr(~tempo/3740/[1,1.001,1.0001])+0.05;
        //         |       |       |       |       |  
        var pat = [
            1,0,0,0,1,0,0,0,1,0,0,0,1,0,0,0,1,1,1,1].rotate(3);
            var imp = Impulse.kr(~tempo*4);
            var hit = Select.kr(PulseCount.kr(imp)%pat.size,pat);
            var env = EnvGen.ar(Env([0.001,1,0.001],[0.252,1.75*[1,2,3]],[-1,-7],curve:'exp'),imp * hit);
            var sig = PlayBuf.ar(b.numChannels,b.bufnum,BufRateScale.kr(b.bufnum)*mod,imp, (pos + BrownNoise.ar(1!8).range(spread * -1,spread)) * BufFrames.kr(b.bufnum),1);

            sig = sig * env;
            sig = Compander.ar(sig,Pulse.ar(~tempo*4/[1,2,3]),0.1,1,0.1) + SinOsc.ar(11000/[1,2,SinOsc.ar(~tempo*4).range(1,8*mod)],mul:LFPulse.ar(~tempo*4/[1,4,1/8])*0.01/[1,4,32]);
            sig = CompanderD.ar(sig,3/4,1,1/2);      
            sig = Compander.ar(sig,~kick.ar+~varkick.ar,0.1,1,0.1);      
            Splay.ar(sig.flat,0.5,0.15,SinOsc.kr(~tempo/[3,4]));
        };
        ~one.play;
        ~one[20] = \filter -> {|in| DWGReverbC1C3.ar(in,[3000,3010],1/2)/8+in };
    );
    ~one.stop(7);
    ~one.clear;

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
