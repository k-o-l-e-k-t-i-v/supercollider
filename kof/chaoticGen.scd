

(
    ~master.quant=2;
    ~master.play;
    ~master.fadeTime = 0.01;
    ~master = {|wet=0.35,lp=3500,hp=250,len=10,rev = 1|
        var sig = In.ar([0,1]);
        var orig = PitchShift.ar(sig,0.25,LFNoise2.ar(1/4!4*~tempo).range(0.95,1.05) );
        var fx;
        orig = CombN.ar(sig,1/50,1/5,1)/2;
        orig = AllpassN.ar(sig,1/50,1,5);
        //fx = Limiter.ar(sig,0.95);
        //sig = sig * SinOsc.ar(50);
        sig = Compander.ar(sig,3/4,1/1.1,1/3);
        fx = LPF.ar(sig,lp);
        fx = HPF.ar(fx,hp);
        fx = DWGReverb.ar(NumChannels.ar(fx,2),[5000,5010],1/len)/rev;
        sig = SelectX.ar(wet,[orig,fx]);
        sig = NumChannels.ar(sig,2);
        ReplaceOut.ar(0,sig);
    };
);
p.moveNodeToTail(\master);

p.makeTempoClock;
(
    TempoClock.default = p.clock;
    p.clock.tempo_(127/60);
    p.arProxyNames.do(p[_.asSymbol].rebuild);
)

(
//////////////////////////  FADE -> OUT ///////////////////////////////////////////////////////
{
  p.arProxyNames.do({|synth| if(synth.asSymbol!=\master){p[synth.asSymbol].clear(20);};});
}.fork;  
)

(
    ~tick.kr(1);
    ~tick.clock = p.clock;
    ~tick.quant=1;
    ~tick = { Impulse.kr(~tempo * 4); };
    ~counter = {PulseCount.kr(~tick.kr);};
);    


(
    ~chaos.clock = p.clock;
    ~chaos.quant = [4,1/2];
    ~chaos.fadeTime = 10;
    ~chaos={
        var sig;
        var all = [];
        var mod = TWChoose.kr(Impulse.kr(1/32!8*~tempo),[1,2,4,8,16,1.5,1.33333,1.25,1.125],[7,6,5,4,3,2,1],1).lag(1/4);
        sig = {ChaosGen.allSubclasses.choose.ar}!16 * Pulse.ar(2/(1..16) * ~tempo);
        sig = LeakDC.ar(sig);
        sig = CompanderD.ar(sig,3/4,1/2,1/2);
        sig = PitchShift.ar(sig,0.05,1/mod/[1,2,1,4,1,8,1,16]);
        //sig = TChoose.ar(Impulse.ar(~tempo*4),all);
        Splay.ar(sig,0.92,0.05);
    };
    ~chaos.play;
);

(
//////////////////////////  FADE -> OUT ///////////////////////////////////////////////////////
{
  p.arProxyNames.do({|synth| if(synth.asSymbol!=\master){p[synth.asSymbol].clear(20);};});
}.fork;  
)

(
  s.latency=0;
  //p.clock.tempo_(120/60);
  p.arProxyNames.do({|synth| if(synth.asSymbol!=\master){p[synth.asSymbol].rebuild;};});
  ~tick.kr(1);
  ~tick.clock = p.clock;
  ~tick.quant=4;
  ~counter.clock = p.clock;
  ~counter.quant = 4;
  ~counter = {PulseCount.kr(~tick.kr);};
  ~tick = { Impulse.kr(~tempo*4); };
);

// kick synth ///////////////////////////////////////

(
    ~kick.ar(2);
    ~kick.clock = p.clock;
    ~kick.quant=[4,0];
    ~kick.fadeTime=0.2;
    ~kick={
        //         |       |       |       |       |  
        var pat = [1,0,0,0,1,0,0,0,1,0,0,0,1,0,0,0];
        var imp = PulseDivider.kr(~tick.kr,1,~counter.kr%pat.size);
        var hit = Select.kr(PulseCount.kr(imp)%pat.size,pat);
        var env = EnvGen.ar(Env([0.001,1,0.0001],[0.002,2.5],[40,-3]),imp * hit);
        var sig = SinOsc.ar(50!2,env**40*8pi);
        sig = sig * env;
        Splay.ar(sig,0.75,0.75);
    };
    ~kick.play;
);
~kick.stop(4);
~kick.clear;
~kick.pause;
~kick.resume;
