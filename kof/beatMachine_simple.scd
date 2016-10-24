(
    ~master.quant=2;
    ~master.play;
    ~master.fadeTime = 0.01;
    ~master = {|wet=0.15,lp=5500,hp=50,len=30,rev = 4|
        var sig = In.ar([0,1]);
        var orig = sig;//PitchShift.ar(sig,0.5,SinOsc.ar(1/80/[1/4,1/2,1/8,1/4]*~tempo,mul:0.00015)+1);
        var hi,lo,fx;
        //fx = Limiter.ar(sig,0.95);
        lo = LPF.ar(sig,lp);
        lo = HPF.ar(sig,150);
        lo = Compander.ar(lo,3/4,1/2,1/2);
        lo = DWGReverb.ar(NumChannels.ar(lo,2),[5000,5010],1/len)/rev;
        
        hi = LPF.ar(sig,7000);
        hi = HPF.ar(sig,hp);
        hi = Compander.ar(hi,3/4,1/1,1/2);
        hi = DWGReverb.ar(NumChannels.ar(hi,2),[5000,5010],1/len/10)/rev/4;
        
        fx = NumChannels.ar([]++lo++hi,2);
        sig = SelectX.ar(wet,[orig,fx]);
        sig = NumChannels.ar(sig,2);
        ReplaceOut.ar(0,sig);
    };
);


p.moveNodeToTail(\master);


(
    ~o = {16};
    ~l = {16};

    ~z.quant=2;
    ~z = {[
        1,0,0,0, 0,0,0,0, 1,0,0,0, 0,0,0,0,
        1,0,0,1, 1,0,1,0, 1,0,1,0, 1,0,1,0,
        1,1,1,1, 0,0,1,0, 1,0,1,0, 0,0,1,0,
        1,0,0,0, 0,0,0,0, 1,0,0,0, 0,0,0,0,
    ]};

    //    p.arProxyNames.do(p[_.asSymbol].rebuild);
)



(
    {
        p.stop(20);
        ~master.play;
        20.wait;
        p.clean;
    }.fork;  
)



p.makeTempoClock;  

(
  ~tick.kr(1);
  ~tick.clock = p.clock;
  ~tick.quant=2;
  ~tick = { Impulse.kr(~tempo*4); };
  ~counter = {PulseCount.kr(~tick.kr);};
);

(
  p.clock.tempo_(140/60);
  p.arProxyNames.do(p[_.asSymbol].rebuild);
)



(


// ok synth ///////////////////////////////////////

(
    ~first.ar(2);
    ~first.quant=4;
    ~first.fadeTime=0.2;
    ~first={
        //         |       |       |       |       |  
        var pat = ~z.kr;
        var imp = PulseDivider.kr(~tick.kr,1,~counter.kr%pat.size);
        var hit = Select.kr(PulseCount.kr(imp)%~l.kr,pat);
        var env = EnvGen.ar(Env([0.001,1,0.0001],[0.002,2.5],[3,-3],curve:'exp'),imp * hit);
        var sig = SinOsc.ar(50!2,env**70*8pi);
        sig = sig * env;
        Splay.ar(sig,0.75,0.25);
    };
    ~first.play;
);


// second synth ///////////////////////////////////////

(
    ~second.ar(2);
    ~second.quant=4;
    ~second.fadeTime=0.2;
    ~second={
        //         |       |       |       |       |  
        var pat = ~z.kr;
        var mod = Duty.kr([4,3,2,1]/~tempo,0,Dseq([1,2,1.5,1.33333],inf));
        var imp = PulseDivider.kr(~tick.kr,[1,2,3,4],~counter.kr%pat.size);
        var hit = Select.kr(PulseCount.kr(imp)%~l.kr+~o.kr,pat);
        var env = EnvGen.ar(Env([0.001,1,0.0001],[0.002,1.75],[-3,3],curve:'exp'),imp * hit);
        var sig = VarSaw.ar(250!2/mod*[1,2,1.5,1.333]*[1,1.5],env**0.02*pi,env**0.82);
        sig = sig * env;
        Splay.ar(sig,0.75,0.15);
    };
    ~second.play;
);

// third synth ///////////////////////////////////////

(
    ~third.ar(2);
    ~third.quant=4;
    ~third.fadeTime=0.2;
    ~third={
        var pat = ~z.kr;
        var imp = PulseDivider.kr(~tick.kr,1,~counter.kr%pat.size);
        var hit = Select.kr(PulseCount.kr(imp)%~l.kr+(~o.kr*2),pat);
        var env = EnvGen.ar(Env([0.001,1,0.0001],[0.002,0.15],[3,-3],curve:'exp'),imp * hit);
        var sig = HPF.ar(WhiteNoise.ar(0.9!2),LFNoise1.kr(1/16!2).range(500,15000));
        sig = sig * env;
        Splay.ar(sig,0.75,0.35);
    };
    ~third.play;
);


// fourth synth ///////////////////////////////////////

(
    ~fourth.ar(2);
    ~fourth.quant=2;
    ~fourth.fadeTime=0.2;
    ~fourth={
        //         |       |       |       |       |  
        var pat = ~z.kr;
        var imp = PulseDivider.kr(~tick.kr,1,~counter.kr%pat.size);
        var hit = Select.kr(PulseCount.kr(imp)%~l.kr+(~o.kr*3),pat);
        var env = EnvGen.ar(Env([0.001,1,0.0001],[0.702,0.15],[3,-3],curve:'exp'),imp * hit);
        var sig = Crackle.ar(env+0.2);
        sig = sig * env;
        Splay.ar(sig,0.75,0.15);
    };
    ~fourth.play;
);

);


(
{
  p.stop(30);
  ~master.play;
  30.wait;
  p.clean;
}.fork;  
)
