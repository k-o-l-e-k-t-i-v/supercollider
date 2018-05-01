

p.push();
p.bpm(125.337/2);

p.gui

(
  s.latency=0.449;
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
    ~one.quant=[16,0];
    ~one.fadeTime=0.334;
    ~one={
        var hit = Pulse.ar(LFTri.ar(~tempo*[1,2,3,4]/32).exprange(~tempo/16,~tempo*4));
        var sig = SinOsc.ar([1,3,7,9].midicps * 1100,hit*[0.5pi,0]);
        sig = sig * hit;
  sig = CombN.ar(sig,1/~tempo,1/~tempo+0.001,~tempo*LFTri.ar(~tempo*16)+1*8);
        Splay.ar(sig,0.95,0.0365,SinOsc.ar(~tempo/[1,1.1332]));
    };
    ~one.play;
);
~one.stop(4);
~one.clear;
~one.pause;
~one.resume;


// tickage synth ///////////////////////////////////////

(
~tickage.ar(2);
~tickage.clock = p.clock;
~tickage.quant=[16,0];
~tickage.fadeTime=0.02;
~tickage={
  //  |       |       |       |       |  
  var pat = [
    1,0,0,0, 0,0,0,0, 0,0,0,0, 0,0,0,0,
    0,0,0,0, 0,0,0,0, 0,0,0,0, 0,0,0,0,
    1,0,0,0, 0,0,0,0, 0,0,0,0, 0,0,0,0,
    0,0,0,0, 0,0,0,0, 0,0,0,0, 1,0,1,0,
  ].rotate(1);
  var imp = PulseDivider.kr(~tick.kr,[1,2,3],~counter.kr%pat.size);
  var hit = Select.kr(PulseCount.kr(imp)%pat.size,pat);
  var env = EnvGen.ar(Env([0.001,1,0.0001],[0.733,0.05],[3,-3]),imp * hit);
  var sig = WhiteNoise.ar(0.2!2);

  sig = sig * env;
  sig = CombN.ar(sig,1/~tempo,1/~tempo+0.001,~tempo*LFTri.ar(~tempo*16)+1*8);
  Splay.ar(sig,0.75,0.5);
};
~tickage.play;
);
~tickage.stop(4);
~tickage.clear;
~tickage.pause;
~tickage.resume;


// low synth ///////////////////////////////////////

(
~low.ar(2);
~low.clock = p.clock;
~low.quant=[4,0];
~low.fadeTime=0.02;
~low={
  //  |       |       |       |       |  
  var pat = [
    1,0,0,0, 1,0,0,0, 1,0,0,0, 1,0,0,0,
    1,0,0,0, 1,0,0,0, 1,0,0,0, 1,0,0,0,
    1,0,0,0, 1,0,0,0, 1,0,0,0, 1,0,0,0,
    1,0,0,0, 1,0,0,0, 1,0,0,0, 1,1,1,1,
  ].rotate(1);
  var imp = PulseDivider.kr(~tick.kr,[1,7,3,4],~counter.kr%pat.size);
  var hit = Select.kr(PulseCount.kr(imp)%pat.size,pat);
  var env = {EnvGen.ar(Env([0.001,1,0.0001],[4.002,4.005]*LFDNoise1.kr(~tempo/16/[7,1,4,3]),[3,-3]),imp * hit)};
  var sig = SinOsc.ar(49.997+((env**10)*44000),(env**(83.34/[1,2,3,4])*4pi) + (env**0.066667*0.15pi));
  sig = sig * env;
  Splay.ar(sig,0.997,0.3355,LeakDC.ar(VarSaw.ar(4999.337*env)) );
};
~low.play;
);
~low.stop(4);
~low.clear;
~low.pause;
~low.resume;

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
    0,0,0,0, 0,0,0,0, 1,0,0,0, 0,0,0,0,
    1,0,0,0, 0,0,0,0, 1,0,0,0, 0,0,0,0,
    0,0,0,0, 0,0,0,0, 1,0,0,0, 0,0,0,0,
  ].rotate(1);
  var imp = PulseDivider.kr(~tick.kr,[1,2,3,4],~counter.kr%pat.size);
  var hit = Select.kr(PulseCount.kr(imp)%pat.size,pat);
  var env = EnvGen.ar(Env([0.001,1,0.0001],[0.002,4.5],[3,-3]),imp * hit);
  var sig = SinOsc.ar(39!2,env**80*8pi) + (VarSaw.ar(39,0,env**SinOsc.ar(~tempo*8))*0.2);
  sig = sig * env;
  Splay.ar(sig,0.99,0.5);
};
~kick.play;
);
~kick.stop(4);
~kick.clear;
~kick.pause;
~kick.resume;



(
//////////////////////////  FADE -> OUT ///////////////////////////////////////////////////////
{
  p.arProxyNames.do({|synth| if(synth.asSymbol!=\master){p[synth.asSymbol].clear(60);};});
}.fork;  
)
