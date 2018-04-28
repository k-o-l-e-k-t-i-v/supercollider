

p.push(120)
s.latency = 1;


// test synth ///////////////////////////////////////

(
~test.ar(2);
~test.clock = p.clock;
~test.quant=0;
~test.fadeTime=4;
~test={
  var sig = SinOsc.ar(15000*[3/4]/(1..16).nthPrime,Pulse.ar(~tempo*1/4/[1,2,3,4])) + (WhiteNoise.ar(Pulse.ar(4)*0.1));
  Splay.ar(sig,0.5,0.25,SinOsc.ar(7.5));
};
~test.play;
);
~test.stop(4);
~test.clear;
~test.pause;
~test.resume;



// ickvar synth ///////////////////////////////////////

(
~ickvar.ar(2);
~ickvar.clock = p.clock;
~ickvar.quant=0;
~ickvar.fadeTime=0.02;
~ickvar={
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
  var sig = VarSaw.ar(50!2,env**0.5..1*8pi);
  sig = sig * env;
  Splay.ar(sig,0.75,0.95);
};
~ickvar.play;
);
~ickvar.stop(4);
~ickvar.clear;
~ickvar.pause;
~ickvar.resume;
