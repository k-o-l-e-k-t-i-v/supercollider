

p.push();

// one synth ///////////////////////////////////////
// cyclic 5

~tempo={121.35/60};

(
    ~one.ar(2);
    ~one.quant=24;
    ~one.fadeTime=4;
    ~one={
        var mod2 = Duty.kr([4,3,24]/~tempo*2,0,Dseq([4,3,2,1,24/[2,3,4]],inf));
        var mod = mod2 / Duty.kr([4,3,1,2,2]/~tempo*2,0,Dseq([2/1,3/2,4/3,1/4],inf)) ;
        var sig = SinOsc.ar([60,50]*mod,SinOsc.ar(mod2/24).range(-2pi,2pi)) * Decay2.ar(Impulse.ar(~tempo/[4,3,2,1]/2),0.02,[1,2,3,4,5]);
        Splay.ar(sig,0.95,0.25,SinOsc.kr(~tempo/4));
    };
    ~one.play;
);
~one.stop(2*60);
~one.clear;
~one.pause;
~one.resume;


// kick synth ///////////////////////////////////////

(
~kick.ar(2);
~kick.quant=24;
~kick.fadeTime=0.02;
~kick={
  //  |       |       |       |       |  
  var pat = [
    1,0,0,0, 0,0,0,0, 1,0,0,0, 0,0,0,0,
    1,0,0,0, 0,0,0,0, 1,0,0,0, 0,0,0,0,
    1,0,0,0, 0,0,0,0, 1,0,0,0, 0,0,0,0,
    1,0,0,0, 0,0,0,0, 1,0,0,0, 0,0,0,0,
  ].rotate(3);
  var imp = PulseDivider.kr(~tick.kr,1,~counter.kr%pat.size);
  var hit = Select.kr(PulseCount.kr(imp)%pat.size,pat);
  var env = EnvGen.ar(Env([0.001,1,0.0001],[0.002,1.5],[3,-3]),imp * hit);
  var sig = SinOsc.ar(42!2,env**80*2pi);
  sig = sig * env;
  Splay.ar(sig,0.0,0.5);
};
~kick.play;
);
~kick.stop(4);
~kick.clear;
~kick.pause;
~kick.resume;


// hihat synth ///////////////////////////////////////

(
~hihat.ar(2);
~hihat.quant=24;
~hihat.fadeTime=0.02;
~hihat={
  //  |       |       |       |       |  
  var pat = [
    1,0,0,0, 0,0,0,0, 0,0,0,0, 0,0,0,0,
    1,0,0,0, 1,0,0,0, 1,0,0,0, 1,1,1,1,
    1,0,0,0, 0,0,0,0, 0,0,0,0, 0,0,0,0,
    1,0,1,0, 1,0,1,0, 1,0,1,0, 1,1,1,1,
  ].rotate(1);
    var imp = PulseDivider.kr(~tick.kr,[4,4,3,2,1],~counter.kr%pat.size);
  var hit = Select.kr(PulseCount.kr(imp)%pat.size,pat);
  var env = EnvGen.ar(Env([0.001,1,0.0001],[0.002,0.15],[12,-3]),imp * hit);
    var sig = WhiteNoise.ar(0.3!4);
    var ramp = LFSaw.ar([~tempo/4/1,~tempo/4/24,1500/[5/4,4/3,3/2,2/1,1]],mul:pi);
    ramp = Perlin3.ar(ramp[0].cos,ramp[1].sin,ramp[2].sin);
    sig = HPF.ar(sig+ramp,15000/[1,2,3,4,4]);
  sig = sig * env;
  Splay.ar(sig,0.75,0.5);
};
~hihat.play;
);
~hihat.stop(4);
~hihat.clear;
~hihat.pause;
~hihat.resume;

(
  //s.latency=0.2;
  p.clock.tempo_(121.35/60);
  p.arProxyNames.do({|synth| if(synth.asSymbol!=\master){p[synth.asSymbol].rebuild;};});
  ~tick.kr(1);
  ~tick.quant = 24;
  ~counter.quant = 24;
  ~counter = {PulseCount.kr(~tick.kr);};
  ~tick = { Impulse.kr( ~tempo * 4 ); };
);


(
//////////////////////////  FADE -> OUT ///////////////////////////////////////////////////////
{
  p.arProxyNames.do({|synth| if(synth.asSymbol!=\master){p[synth.asSymbol].clear(20);};});
}.fork;  
)
