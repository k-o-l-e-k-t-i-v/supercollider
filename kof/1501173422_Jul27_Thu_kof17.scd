
p.push();
p.bpm(90);

// spark synth ///////////////////////////////////////

(
~spark.ar(2);
~spark.clock = p.clock;
~spark.quant=2;
~spark.fadeTime=4;
~spark={
  var sig = SinOsc.ar(49.999+[0.001,0.002,0.0003],SinOsc.ar(49.95+[0.01,0.002,0.0003])*(LFNoise1.kr(~tempo/64!3).range(0,8pi)),add:LFTri.ar(~tempo/600/[1,2,4]),mul:LFNoise2.kr(~tempo/64!3).range(1/8,4));
  sig = Perlin3.ar(sig[0],sig[1],sig[2]);
  sig = BBandPass.ar(sig,[5000,500,15000]/.x(3*(2..17).log),0.05,mul:LFTri.ar(~tempo/4/(1..16))**2 );
  sig = CompanderD.ar(sig,3/4,1/LFNoise2.kr(~tempo/16!16).range(1,2),1) * SinOsc.ar(~tempo*4/(2..17).log);
  //sig = Normalizer.ar(sig);
  sig = Compander.ar(sig,~kick.ar,0.1,1,0.1);
  Splay.ar(sig,0.5,0.95);
};
~spark.play;
);
~spark.stop(4);
~spark.clear;
~spark.pause;
~spark.resume;




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


// kick synth ///////////////////////////////////////

(
~kick.ar(2);
~kick.clock = p.clock;
~kick.quant=[16,0];
~kick.fadeTime=0.02;
~kick={
  //  |       |       |       |       |  
  var pat = [
    1,0,0,0, 1,0,0,0, 1,0,0,0, 1,0,0,0,
    1,0,0,0, 1,0,0,0, 1,0,0,0, 1,0,0,0,
    1,0,0,0, 1,0,0,0, 1,0,0,0, 1,0,0,0,
    1,0,0,0, 1,0,0,0, 1,0,0,0, 1,0,0,0,
  ].rotate(1);
  var imp = PulseDivider.kr(~tick.kr,1,~counter.kr%pat.size);
  var hit = Select.kr(PulseCount.kr(imp)%pat.size,pat);
  var env = EnvGen.ar(Env([0.001,1,0.0001],[0.002,1.25],[3,-3]),imp * hit);
  var sig = SinOsc.ar(49!2,env*40*8pi);
  sig = sig * env;
  Splay.ar(sig,0.75,0.95);
};
~kick.play;
);
~kick.stop(4);
~kick.clear;
~kick.pause;
~kick.resume;
