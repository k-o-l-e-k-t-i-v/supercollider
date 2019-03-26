





p.push();
p.bpm(240)


// weird synth ///////////////////////////////////////

(
~weird.ar(2);
~weird.quant=[16,0];
~weird.fadeTime=0.02;
~weird={
  //  |       |       |       |       |  
  var pat = [
    1,0,0,0, 0,0,0,0, 1,0,0,0, 0,0,0,0,
    1,0,0,0, 0,0,0,0, 1,0,0,0, 1,0,0,0,
    1,0,0,0, 0,0,0,0, 1,0,0,0, 0,0,0,0,
    1,0,0,0, 0,0,0,0, 1,0,0,0, 1,0,1,0,
  ].rotate(5);
  var imp = PulseDivider.kr(~tick.kr,1,~counter.kr%pat.size);
  var hit = Select.kr(PulseCount.kr(imp)%pat.size,pat);
  var mod = Duty.kr(32/~tempo*[1,2,3,4],0,Dseq([1,2,1.5,1.33333],inf));
  var env = EnvGen.ar(Env([0.001,1,0.0001],[0.002,0.55],[3,-3]),imp * hit) * SinOsc.ar(1600/mod/1.5);
  var sig = Perlin3.ar(env**0.3,env*SinOsc.ar(1/2500)*20,env * LFSaw.ar(1/51));
  sig = sig * (env);
  Splay.ar(sig,0.75,0.25,SinOsc.ar(20)/4);
};
~weird.play;
);
~weird.stop(4);
~weird.clear;
~weird.pause;
~weird.resume;

1// puls synth ///////////////////////////////////////

(
~puls.ar(2);
~puls.quant=16;
~puls.fadeTime=8;
~puls={
    var t = LFSaw.ar([1,2,3]/16)+LFSaw.ar(22000/[2,4,8]/1.5/[1,2,1.5]) +LFSaw.ar(1/6000) + Pulse.ar(1/4/[1,2,3]);
  var sig = Perlin3.ar(t[0],t[1],t]) * LFTri.ar(4/[1,2,3]) * Pulse.ar([4,5,8]);
  Splay.ar(sig,0.5,0.255,SinOsc.ar(1/4/[1,2,3])/4);
};
~puls.play;
);
~puls.stop(4);
~puls.clear;
~puls.pause;
~puls.resume;

s.scope
// saw synth ///////////////////////////////////////

(
~saw.ar(2);
~saw.quant=[16,0];
~saw.fadeTime=0.02;
~saw={
  //  |       |       |       |       |  
  var pat = [
    1,0,0,0, 0,0,0,0, 0,0,0,0, 0,0,0,0,
    0,0,0,0, 0,0,0,0, 0,0,0,0, 0,0,0,0,
    0,0,0,0, 0,0,0,0, 0,0,0,0, 0,0,0,0,
    0,0,0,0, 0,0,0,0, 0,0,0,0, 0,0,0,0,
  ].rotate(1);
  var imp = PulseDivider.kr(~tick.kr,1,~counter.kr%pat.size);
  var hit = Select.kr(PulseCount.kr(imp)%pat.size,pat);
  var env = EnvGen.ar(Env([0.001,1,0.0001],[0.92,6.5],[3,-3]),imp * hit);
  var mod = Duty.kr(32/~tempo,0,Dseq([1,2,1.5,1.33333],inf));
  var sig = LFSaw.ar(75/mod,mul:0.18) * Pulse.ar(4);
  sig = sig * env;
  Splay.ar(sig,0.75,0.5);
};
~saw.play;
);
~saw.stop(4);
~saw.clear;
~saw.pause;
~saw.resume;

// kick synth ///////////////////////////////////////

(
~kick.ar(2);
~kick.quant=[16,0];
~kick.fadeTime=0.02;
~kick={
  //  |       |       |       |       |  
  var pat = [
    1,0,0,0, 0,0,0,0, 1,0,0,0, 0,0,0,0,
    1,0,0,0, 0,0,0,0, 1,0,0,0, 0,0,0,0,
    1,0,0,0, 0,0,0,0, 1,0,0,0, 0,0,0,0,
    1,0,0,0, 0,0,0,0, 1,0,0,0, 1,0,1,0,
  ].rotate(1);
  var imp = PulseDivider.kr(~tick.kr,1,~counter.kr%pat.size);
  var hit = Select.kr(PulseCount.kr(imp)%pat.size,pat);
  var env = EnvGen.ar(Env([0.001,1,0.0001],[0.002,0.5],[3,-3]),imp * hit);
  var sig = SinOsc.ar(50!2+[1,2,3],env**8pi) ;
  sig = sig * env;
  Splay.ar(sig,1,1);
};
~kick.play;
);
~kick.stop(4);
~kick.clear;
~kick.pause;
~kick.resume;

// kick2 synth ///////////////////////////////////////

(
~kick2.ar(2);
~kick2.quant=[16,0];
~kick2.fadeTime=0.02;
~kick2={
  //  |       |       |       |       |  
  var pat = [
    1,0,0,0, 0,0,0,0, 1,1,1,0, 0,0,0,0,
    1,0,1,0, 0,0,0,0, 1,0,0,0, 0,0,0,0,
    1,0,0,0, 0,0,0,0, 1,0,0,0, 0,0,0,0,
    1,0,1,0, 0,0,0,0, 1,1,1,0, 0,0,0,0,
  ].rotate(5);
  var imp = PulseDivider.kr(~tick.kr,1,~counter.kr%pat.size);
  var hit = Select.kr(PulseCount.kr(imp)%pat.size,pat);
  var env = EnvGen.ar(Env([0.001,1,0.0001],[0.002,0.15],[3,-3]),imp * hit);
  var sig = BrownNoise.ar(0.8!2);
  sig = sig * env;
  Splay.ar(sig,0.75,0.5,SinOsc.kr(7.5/4));
};
~kick2.play;
);
~kick2.stop(4);
~kick2.clear;
~kick2.pause;
~kick2.resume;

(
//////////////////////////  FADE -> OUT ///////////////////////////////////////////////////////
{
  p.arProxyNames.do({|synth| if(synth.asSymbol!=\master){p[synth.asSymbol].clear(20);};});
}.fork;  
)

(
  s.latency=0.2;
  //p.clock.tempo_(120/60);
  p.arProxyNames.do({|synth| if(synth.asSymbol!=\master){p[synth.asSymbol].rebuild;};});
  ~tick.kr(1);
  ~tick.quant = 16;
  ~counter.quant = 16;
  ~counter = {PulseCount.kr(~tick.kr);};
  ~tick = { Impulse.kr( ~tempo * 4 ); };
);
(
//////////////////////////  FADE -> OUT ///////////////////////////////////////////////////////
{
  p.arProxyNames.do({|synth| if(synth.asSymbol!=\master){p[synth.asSymbol].clear(20);};});
}.fork;  
)



