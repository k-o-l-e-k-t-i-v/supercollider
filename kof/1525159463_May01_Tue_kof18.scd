

p.push();
p.bpm(143.5);



(
  s.latency=0.3334;
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
    ~one.quant=4;
    ~one.fadeTime=0.334;
    ~one={
        var hit = Pulse.ar(LFTri.ar(~tempo/[1,2,3,4]/64).exprange(~tempo/16,~tempo*4));
        var sig = SinOsc.ar(22000/(2**(1/(1..12).at([1,3,5,7,12,24]))),hit*[0.5pi,0]);
        sig = sig * hit;
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
    0,0,0,0, 0,0,0,0, 0,0,0,0, 0,0,0,0,
    0,0,0,0, 0,0,0,0, 0,0,0,0, 0,0,0,0,
  ].rotate(1);
  var imp = PulseDivider.kr(~tick.kr,1,~counter.kr%pat.size);
  var hit = Select.kr(PulseCount.kr(imp)%pat.size,pat);
  var env = EnvGen.ar(Env([0.001,1,0.0001],[0.002,0.15],[3,-3]),imp * hit);
  var sig = WhiteNoise.ar(0.1!2);

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
~low.quant=[16,0];
~low.fadeTime=0.02;
~low={
  //  |       |       |       |       |  
  var pat = [
    1,0,0,0, 1,0,0,0, 1,0,0,0, 1,0,0,0,
    1,0,0,0, 1,0,0,0, 1,0,0,0, 1,0,0,0,
    1,0,0,0, 1,0,0,0, 1,0,0,0, 1,0,0,0,
    1,0,0,0, 1,0,0,0, 1,0,0,0, 1,0,0,0,
  ].rotate(1);
  var imp = PulseDivider.kr(~tick.kr,[1,3,7],~counter.kr%pat.size);
  var hit = Select.kr(PulseCount.kr(imp)%pat.size,pat);
  var env = {EnvGen.ar(Env([0.001,1,0.0001],[0.002,2.5]*LFDNoise1.kr(~tempo/32/[1,2,3]),[3,-3]),imp * hit)};
  var sig = SinOsc.ar(45!2,(env**73*2pi) + (env**0.66667*4pi));
  sig = sig * env;
  Splay.ar(sig,1.0,0.5);
};
~low.play;
);
~low.stop(4);
~low.clear;
~low.pause;
~low.resume;
