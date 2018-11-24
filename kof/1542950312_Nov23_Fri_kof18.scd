
p.push();
p.latency=0.2;
p.bpm(90);
(
    SynthDef(\kick,{|freq=40,sus=1,slope=10,eff1=0,eff2=0|
        var env = EnvGen.ar(Env([0.001,1,0.001],[0.002,sus],[5,-3]),doneAction:2);
        var sig = SinOsc.ar(freq+(env**slope*(freq*10)),env**slope,*2pi) + WhiteNoise.ar(0.1**env) + VarSaw.ar(freq,mul:0.2);
        sig = sig * env;
        sig = sig + (CombN.ar(sig,1/freq,2/freq,sus/2)*eff1);
        sig = sig + (CombN.ar(sig,1/32,1/32,sus/2)*eff2);
        sig = LeakDC.ar(sig);
        Out.ar(0,Splay.ar(sig,0.9,0.25));
    };
).add;
)


(
    var tempo = (60/90);
    ~kicker.quant=4;
    ~kicker.fadeTime=0.2;
    ~kicker[0]=Pbind(
        \instrument, \kick,
        \dur, tempo * Pseq([1,1/2,1,1/4,1/4,1/4,1/4,Pseq([1,1,1,1/2],inf)],inf),
        \freq, 45,
        \sus, Pwhite(0.9,2.1,inf),
        \slope, Pseq([80,20,60,40],inf)
    );
    ~kicker[1]=Pbind(
        \instrument, \kick,
        \freq, Pseq([45,90,45,90],inf),
        \dur, tempo*16,
        \sus, Pwhite(1,2,inf),
        \eff1, Pseq([0,0,0,1],inf)
    );
    ~kicker[2]=Pbind(
        \instrument, \kick,
        \dur, tempo*32,
        \sus, Pwhite(1,2,inf),
        \oct, Pseq([2,3,2,4,2,4,2]*.x[1,1,1,2,4],inf),
        \eff2, Pseq([1,0,0,0],inf)
    );


    ~kicker.play;
)


// ode synth ///////////////////////////////////////

(
    ~ode.ar(2);
    ~ode.clock = p.clock;
    ~ode.quant=4;
    ~ode.fadeTime=[4,1];
    ~ode={
        var sig = SinOsc.ar(4500/[1,2,1.5]);
        sig = sig * (LFSaw.ar(~tempo*4/[1,2,3])**2);
        Splay.ar(sig,0.5,0.35);
    };
    ~ode.play;
);
~ode.stop(4);
~ode.clear;
~ode.pause;
~ode.resume;

// hiss synth ///////////////////////////////////////

(
~hiss.ar(2);
~hiss.clock = p.clock;
~hiss.quant=[16,0];
~hiss.fadeTime=0.02;
~hiss={
  //  |       |       |       |       |  
  var pat = [
    1,0,0,0, 1,0,0,0, 1,0,0,0, 1,0,1,0,
    1,0,0,0, 1,0,0,0, 1,0,0,0, 1,0,1,0,
    1,0,0,0, 1,0,0,0, 1,0,0,0, 1,0,1,0,
    1,0,0,0, 1,0,0,0, 1,0,0,0, 1,0,1,0,
  ].rotate(3);
  var imp = PulseDivider.kr(~tick.kr,1,~counter.kr%pat.size);
  var hit = Select.kr(PulseCount.kr(imp)%pat.size,pat);
  var env = EnvGen.ar(Env([0.001,1,0.0001],[0.002,0.15],[3,-3]),imp * hit);
  var sig = WhiteNoise.ar(1!2);
  sig = HPF.ar(sig,5000);
  sig = sig * env;
  Splay.ar(sig,0.75,0.5);
};
~hiss.play;
);
~hiss.stop(4);
~hiss.clear;
~hiss.pause;
~hiss.resume;


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
