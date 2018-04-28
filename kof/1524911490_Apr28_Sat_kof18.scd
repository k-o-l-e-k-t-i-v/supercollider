

p.push();
s.latency = 0.2;

p.bpm(142.334);
p.bpm(125.33);


(
  //s.latency=0.2;
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
            1,0,0,0, 0,0,0,0, 1,0,0,0, 0,0,0,0,
            1,0,0,0, 0,0,0,0, 1,0,0,0, 0,0,0,0,
            1,0,0,0, 0,0,0,0, 1,0,0,0, 0,0,0,0,
            1,0,0,0, 0,0,0,0, 1,0,0,0, 0,0,0,0,
        ].rotate(1);
        var imp = PulseDivider.kr(~tick.kr,[1,2,3,4],~counter.kr%pat.size);
        var hit = Select.kr(PulseCount.kr(imp)%pat.size,pat);
        var env = EnvGen.ar(Env([0.001,1,0.0001],[0.002,2.5],[3,-3]),imp * hit);
        var sig = SinOsc.ar(50+(env**40.2*100),env**[20,30,40,70]*pi);
        sig = sig * env;
        Splay.ar(sig,0.15,0.5);
    };
    ~kick.play;
);
~kick.stop(4);
~kick.clear;
~kick.pause;
~kick.resume;



// hiss synth ///////////////////////////////////////

(
~hiss.ar(2);
~hiss2.clock = p.clock;
~hiss2.quant=[16,0];
~hiss2.fadeTime=0.02;
~hiss2={
  //  |       |       |       |       |  
  var pat = [
    0,0,0,0, 1,0,0,0, 0,0,0,0, 1,0,0,0,
    0,0,0,0, 1,0,0,0, 0,0,0,0, 1,0,0,0,
    0,0,0,0, 1,0,0,0, 0,0,0,0, 1,0,0,0,
    0,0,0,0, 1,0,0,0, 0,0,0,0, 1,0,0,0,
  ].rotate(1);
  var imp = PulseDivider.kr(~tick.kr,[1,3,5,7],~counter.kr%pat.size);
  var hit = Select.kr(PulseCount.kr(imp)%pat.size,pat);
  var env = EnvGen.ar(Env([0.001,1,0.0001],[0.002,0.05],[3,-3]),imp * hit);
  var sig = Crackle.ar(env);
  sig = HPF.ar(sig,5000*[1,1.5,2,3]);
  sig = sig * env;
  Splay.ar(sig,0.75,0.15);
};
~hiss2.play;
);
~hiss.stop(4);
~hiss.clear;
~hiss.pause;
~hiss.resume;

(
  //s.latency=0.2;
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


(
  //s.latency=0.2;
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
  p.arProxyNames.do({|synth| if(synth.asSymbol!=\master){p[synth.asSymbol].clear(30);};});
}.fork;  
)




(
//////////////////////////  FADE -> OUT ///////////////////////////////////////////////////////
{
  p.arProxyNames.do({|synth| if(synth.asSymbol!=\master){p[synth.asSymbol].clear(30);};});
}.fork;  
)
