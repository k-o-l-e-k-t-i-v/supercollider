// Big_Pickle gen vv

p=ProxySpace.push(s);
~tempo={4/0.432};
p.bpm(138.9);
~tick.kr(1);
~counter.kr(1);
~tick.quant=16;
~counter.quant=16;
~tick = { Impulse.kr(~tempo*4); };
~counter = {PulseCount.kr(~tick.kr);};

// wash synth ///////////////////////////////////////

(
~wash.ar(2);
~wash.quant=4;
~wash.fadeTime=4;
~wash={
  var chord = Duty.kr(32/~tempo,0,Dseq([1,1,5/4,3/2,4/3,2].scramble,inf));
  var base = (55).midicps * chord;
  var detune = SinOsc.ar(~tempo/[7,6,5,4]+LFNoise1.kr(~tempo/[3,6,7,9])).range(-1,1);
  var ang = LFSaw.ar([1/100,1/250,1/41]).range(0,2pi);
  var perl = Perlin3.ar(ang[0].cos,ang[1].sin,ang[2].cos);
  var sig = SinOsc.ar(base+LFNoise1.kr(0.1!4)+detune,mul:0.2)
    + Formant.ar(base+LFNoise1.kr(0.1!4),base/2,base*2)*0.3
    + (perl*60);
  sig = Vibrato.ar(sig,[5,6,7,8],0.15);
  sig = LeakDC.ar(sig);
  sig = RLPF.ar(sig,base*6,LFNoise2.kr(~tempo/8!4).range(0.1,0.8));
  sig = GVerb.ar(HPF.ar(sig,80),90,3)/6+sig;
  sig = CompanderD.ar(sig,3/4,1/2,1)/3+sig;
  Splay.ar(sig,0.7,0.25);
};
~wash.play;
);
~wash.stop(4);
~wash.clear;
~wash.pause;
~wash.resume;

// chest synth ///////////////////////////////////////

(
~chest.ar(2);
~chest.quant=[8,0];
~chest.fadeTime=0.02;
~chest={
  var pat = [1,0,0,0, 1,0,0,0, 1,0,0,0, 1,0,1,0].rotate(1);
  var imp = PulseDivider.kr(~tick.kr,16,~counter.kr%pat.size);
  var hit = Select.kr(PulseCount.kr(imp)%pat.size,pat);
  var env = EnvGen.ar(Env([0.001,1,0.0001],[0.005,0.4],[3,-3]),imp*hit);
  var chord = Duty.kr([2,4]/~tempo,0,Dseq([1,1.5,1.33333,2],inf));
  var f = (55).midicps/chord + (env**6*40);
  var sig = SinOsc.ar(f,env**20*2pi) + LFSaw.ar(f*1.001,mul:0.3);
  sig = RLPF.ar(sig,f*8,LFNoise2.kr(~tempo/2).range(0.1,0.5));
  sig = CompanderD.ar(sig,3/4,1/2,1);
  sig = sig*env;
  Splay.ar(sig,0.5,0.9);
};
~chest.play;
);
~chest.stop(4);
~chest.clear;
~chest.pause;
~chest.resume;

// chime synth ///////////////////////////////////////

(
~chime.ar(2);
~chime.quant=4;
~chime.fadeTime=2;
~chime={
  var transpose = Duty.kr(32*4/~tempo,0,Dseq([1,2,1,1.5,1,1.33333],inf));
  var notes = (Duty.kr([4,16,64]/~tempo,0,Dseq(fib(24)%7,inf))/12+1)**2;
  var base = (55).midicps*notes/transpose;
  var detune = SinOsc.ar(~tempo/[5,6,7]).range(-1,1);
  var env = {EnvGen.ar(Env([0.001,1,0.001],[0.005,0.3],[3,-3]),Impulse.ar(~tempo*2/(fib(24)%16)))};
  var sig = SinOsc.ar(base*[1,1.003,2]+detune,mul:0.2)
    + Formant.ar(base,base/2,base*3)*0.2;
  sig = sig*env;
  sig = Vibrato.ar(sig);
  sig = CombN.ar(sig,4/~tempo,1/~tempo*[1,2,1.5],~tempo/2)/4+sig;
  sig = Resonz.ar(sig,base,LFNoise2.kr(~tempo/4!3).range(0.1,0.5));
  sig = LeakDC.ar(sig);
  Splay.ar(sig,0.6,0.4);
};
~chime.play;
);
~chime.stop(4);
~chime.clear;
~chime.pause;
~chime.resume;

// thump synth ///////////////////////////////////////

(
~thump.ar(2);
~thump.quant=[8,0];
~thump.fadeTime=0.02;
~thump={
  var pat = [1,0,0,0, 0,0,0,0, 1,0,0,0, 0,0,1,0].rotate(1);
  var imp = PulseDivider.kr(~tick.kr,16,~counter.kr%pat.size);
  var hit = Select.kr(PulseCount.kr(imp)%pat.size,pat);
  var env = EnvGen.ar(Env([0.001,1,0.0001],[0.002,2],[3,-3]),imp*hit);
  var sig = SinOsc.ar(28+(env**20*70)+BrownNoise.ar(env**10!2),env**50*8pi);
  sig = SinOsc.ar(30.1,env**0.92*8pi)*sig + PinkNoise.ar(0.95*(env**80));
  sig = LPF.ar(sig,900);
  sig = CombN.ar(sig,~tempo/4,~tempo/4,2);
  sig = sig*env;
  Splay.ar(sig,0.75,0.95);
};
~thump.play;
);
~thump.stop(4);
~thump.clear;
~thump.pause;
~thump.resume;

(
//////////////////////////  FADE -> OUT ///////////////////////////////////////////////////////
{
  p.arProxyNames.do({|synth| if(synth.asSymbol!=\master){p[synth.asSymbol].clear(45);};});
}.fork;
)
