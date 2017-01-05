(
    ~master.quant=16;
    ~master.play;
    ~master.fadeTime = 0.01;
    ~master = {|wet=0.15,lp=3500,hp=250,len=10,rev = 3|
        var sig = In.ar([0,1]);
        var orig = sig;
        var fx;
        var mod = Duty.kr(16/~tempo,0,Dseq([1,2,1.5,1.33333],inf));
        //fx = Limiter.ar(sig,0.95);
        sig = CombN.ar(sig,1/36.midicps*mod,1/36.midicps*mod,3);
        sig = Compander.ar(sig,3/4,1/1.05,1/3);
        fx = LPF.ar(sig,lp);
        fx = HPF.ar(fx,hp);
        fx = DWGReverb.ar(NumChannels.ar(fx,2),[5000,5010],1/len)/rev;
        sig = SelectX.ar(wet,[orig,fx]);
        sig = NumChannels.ar(sig,2);
        ReplaceOut.ar(0,sig);
    };
);
p.moveNodeToTail(\master);


// one synth ///////////////////////////////////////

(
    ~one.ar(2);
    ~one.clock = p.clock;
    ~one.quant=16;
    ~one.fadeTime=0.25;
    ~one={
        var sig = Pulse.ar(~tempo/[1,2,3,4,5,6,7,8,9,10]*2) * VarSaw.ar([33,36,24,48].midicps);
        Splay.ar(sig,0.05,0.25);
    };
    ~one.play;
);
~one.stop(4);
~one.clear;
~one.pause;
~one.resume;


(
//////////////////////////  FADE -> OUT ///////////////////////////////////////////////////////
{
  p.arProxyNames.do({|synth| if(synth.asSymbol!=\master){p[synth.asSymbol].clear(60);};});
}.fork;  
)

// two synth ///////////////////////////////////////

(
    ~two.ar(2);
    ~two.clock = p.clock;
    ~two.quant=4;
    ~two.fadeTime=4;
    ~two={
        var mod = Duty.kr(16/[1,1/8,1/4]/~tempo,0,Dseq([1,2,1.5,1.33333],inf));
        var sig = Pulse.ar(~tempo/[2,3,4,5] *.x [1,2,1/4]) * SinOsc.ar([84,88].midicps *.x 10/[1,2,1,1.5,4,8,16]/mod,mul:0.02);
        Splay.ar(sig,0.5,0.5);
    };
    ~two.play;
);
~two.stop(4);
~two.clear;
~two.pause;
~two.resume;

(
~switcher.ar(2);
~switcher.quant=2;
~switcher.fadeTime=0.2;
~switcher={
  //         |       |       |       |       |  
  var pat = [1,0,0,0,1,0,0,0,1,0,0,0,1,0,0,0].rotate(1);
  var imp = PulseDivider.kr(~tick.kr,[1,2,3,4]);
  var hit = Select.kr(PulseCount.kr(imp)%pat.size,pat);
  var env = EnvGen.ar(Env([0.001,1,0.0001],[0.002,0.5],[3,-3],curve:'exp'),imp * hit);
  var sig = [
  SinOsc.ar(50!2),
  SinOsc.ar(15000!2,mul:0.1) * Pulse.ar(4*~tempo),
  Pulse.ar(~tempo*2),
  Pulse.ar(~tempo/(1..8)),
  WhiteNoise.ar(0.1!2),
  SinOsc.ar(60!2),
  ];
  sig = sig * env;
  sig = CombN.ar(sig,1/[24,36,48].midicps,1/[24,36,48].midicps,1);
  sig = Select.ar(PulseCount.kr(imp*hit)%sig.size,sig);
  Splay.ar(sig,0.75,0.5);
};
~switcher.play;
);
~switcher.stop(4);
~switcher.clear;
~switcher.pause;
~switcher.resume;

(
    s.latency=0.4;
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

// hiss synth ///////////////////////////////////////

(
    ~hiss.ar(2);
    ~hiss.clock = p.clock;
    ~hiss.quant=[16,0];
    ~hiss.fadeTime=0.02;
    ~hiss={
        //  |       |       |       |       |  
        var pat = [
            1,0,0,0, 1,0,0,0, 1,0,1,0, 1,1,1,1,
        ].rotate(1);
        var imp = PulseDivider.kr(~tick.kr,[1,2,3,4]);
        var hit = Select.kr(PulseCount.kr(imp)%pat.size,pat);
        var env = EnvGen.ar(Env([0.001,1,0.0001],[0.002,0.05],[3,-3]),imp * hit);
        var sig = WhiteNoise.ar(1!4);
        sig = sig * env;
        Splay.ar(sig,0.75,0.15);
    };
    ~hiss.play;
);
~hiss.stop(4);
~hiss.clear;
~hiss.pause;
~hiss.resume;


(
    s.latency=0.4;
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

(
    //////////////////////////  FADE -> OUT ///////////////////////////////////////////////////////
    {
        p.arProxyNames.do({|synth| if(synth.asSymbol!=\master){p[synth.asSymbol].clear(40);};});
    }.fork;  
)

~chaos.clear(50);



~kick.clear(5);
