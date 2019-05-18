

p.push();
p.bpm(129.33)

// kick synth ///////////////////////////////////////

(
~kick.ar(2);
~kick.quant=[16,0];
~kick.fadeTime=0.02;
~kick={
  //  |       |       |       |       |  
  var pat = [
    1,0,0,0, 1,0,0,0, 1,0,0,0, 1,0,0,0,
    1,0,0,0, 1,0,0,0, 1,0,0,0, 1,1,0,0,
    1,0,0,0, 1,0,0,0, 1,0,0,0, 1,0,1,1,
    1,0,0,0, 1,0,0,0, 1,0,0,0, 1,0,0,0,
    1,0,0,0, 1,0,0,0, 1,0,0,0, 1,0,0,0,
    1,0,0,0, 1,0,0,0, 1,0,0,0, 1,0,1,0,
    1,0,0,0, 1,0,0,0, 1,0,0,0, 1,0,0,0,
    1,0,0,0, 1,0,0,0, 1,0,0,0, 1,0,0,0,
    1,0,0,0, 1,0,0,0, 1,0,0,0, 1,0,0,1,
    1,0,0,0, 1,0,0,0, 1,0,0,0, 1,0,0,0,
    1,0,0,0, 1,0,0,0, 1,0,0,0, 1,1,1,1,
  ].rotate(1);
  var imp = PulseDivider.kr(~tick.kr,1,~counter.kr%pat.size);
  var hit = Select.kr(PulseCount.kr(imp)%pat.size,pat);
  var env = EnvGen.ar(Env([0.001,1,0.0001],[0.002,LFNoise1.kr(~tempo/16).range(0.5,1.75)],[3,-3]),imp * hit);
  var perl = Perlin3.ar(env,SinOsc.ar(~tempo/4*(env**0.1)),LFSaw.ar(~tempo/64));
  var sig = SinOsc.ar(45!2+(env**80*125),perl*4pi);
  sig = Resonz.ar(sig,[45],0.2)+sig;
  sig = sig * env;
  sig = Mix(LPF.ar(sig,500))+HPF.ar(sig,500);
  Splay.ar(sig,0.05,0.25);
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
~hiss.quant=[16,3];
~hiss.fadeTime=0.02;
~hiss={
  //  |       |       |       |       |  
  var pat = [
    1,0,1,0, 1,0,0,0, 1,0,0,0, 1,1,0,0,
    1,0,0,0, 1,0,1,0, 1,1,0,0, 1,0,0,0,
    1,0,0,0, 1,1,0,0, 1,0,1,0, 1,0,0,0,
    1,1,0,0, 1,0,0,0, 1,0,0,0, 1,0,1,0,
  ].rotate(0);
  var imp = PulseDivider.kr(~tick.kr,1,~counter.kr%pat.size);
  var hit = Select.kr(PulseCount.kr(imp)%pat.size,pat);
  var env = EnvGen.ar(Env([0.001,1,0.0001],[0.002,0.05],[3,-3]),imp * hit);
  var sig = ClipNoise.ar(0.9);
  sig = HPF.ar(sig,5000);
  sig = Resonz.ar(sig,15000,0.2);
  sig = sig * env;
  Splay.ar(sig,0.75,0.5);
};
~hiss.play;
);
~hiss.stop(4);
~hiss.clear;
~hiss.pause;
~hiss.resume;


// harp synth ///////////////////////////////////////

(
~harp.ar(2);
~harp.quant=[16,0];
~harp.fadeTime=0.02;
~harp={
  //  |       |       |       |       |  
  var pat = [
    1,0,0,0, 1,0,0,0, 1,0,0,0, 1,0,0,0,
    1,0,1,0, 1,0,1,0, 1,0,1,0, 1,0,1,0,
    1,0,0,0, 1,0,0,0, 1,0,0,0, 1,0,0,0,
    1,0,0,0, 1,0,0,0, 1,0,0,0, 1,0,1,0,
  ].rotate(1);
  var imp = PulseDivider.kr(~tick.kr,1,~counter.kr%pat.size);
  var hit = Select.kr(PulseCount.kr(imp)%pat.size,pat);
  var env = EnvGen.ar(Env([0.001,1,0.0001],[0.02,1.5],[3,-3]),imp * hit);
  var sig = SinOsc.ar(45*([1,2,1.5,4,8,16,32]*.x[1,1.5,1/1.5,1,4/3,15/8]/.x[1,2,4,8]).scramble+SinOsc.kr(~tempo/16,mul:3),SinOsc.kr(~tempo/16/[1,2,3]).abs);
  sig = SelectX.ar(LFTri.kr(~tempo/[5,6,30]/128).range(0,sig.size+1),sig);
  sig = sig * env;
  Splay.ar(sig,0.75,0.15);
};
~harp.play;
);
~harp.stop(4);
~harp.clear;
~harp.pause;
~harp.resume;



(
  //s.latency=0.2;
  //p.clock.tempo_(120/60);
  p.arProxyNames.do({|synth| if(synth.asSymbol!=\master){p[synth.asSymbol].rebuild;};});
  ~tick.kr(1);
  ~tick.quant = 16;
  ~counter.quant = 16;
  ~counter = {PulseCount.kr(~tick.kr);};
  ~tick = { Impulse.kr( ~tempo * 4 ); };
);
