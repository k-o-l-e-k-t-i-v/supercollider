



(
  ~master.quant=2;
  ~master.play;
  ~master.fadeTime = 0.01;
  ~master = {|wet=0.5,lp=1500,hp=250,len=10,rev = 8|
  var sig = In.ar([0,1]);
  var orig = sig;
  var fx;
  //fx = Limiter.ar(sig,0.95);
  sig = sig * LFSaw.ar(2*~tempo)**2;
  sig = Compander.ar(sig,3/4,1,1/3);
  fx = LPF.ar(sig,lp);
  fx = HPF.ar(fx,hp);
  fx = HPF.ar(fx,hp);
  fx = HPF.ar(fx,hp);
  fx = DWGReverb.ar(NumChannels.ar(fx,2),[5000,5010],1/len)/rev;
  sig = SelectX.ar(wet,[orig,fx]);
  sig = NumChannels.ar(sig,2);
  ReplaceOut.ar(0,sig);
  };
);
p.moveNodeToTail(\master);



// one synth ///////////////////////////////////////

(
~one.ar(2);
~one.clock = p.clock;
~one.quant=[16,0];
~one.fadeTime=0.12;
~one={
  //  |       |       |       |       |  
  var pat = [
    1,0,0,0, 1,0,0,0, 1,0,0,0, 1,0,0,0,
    1,0,0,0, 1,0,0,0, 1,0,0,0, 1,0,0,0,
    1,0,0,0, 1,0,0,0, 1,0,0,0, 1,0,0,0,
    1,0,0,0, 1,0,0,0, 1,0,0,0, 1,0,0,0,
  ];
  var imp = PulseDivider.kr(~tick.kr,1,~counter.kr%pat.size);
  var hit = Select.kr(PulseCount.kr(imp)%pat.size,pat);
  var env = EnvGen.ar(Env([0.001,1,0.0001],[0.002,2.5],[3,-3]),imp * hit);
  var sig = SinOsc.ar(50!2,env**40*8pi);
  sig = sig * env;
  Splay.ar(sig,0.75,0.5);
};
~one.play;
);
~one.stop(4);
~one.clear(16);
~one.pause;
~one.resume;

// hiss synth ///////////////////////////////////////

(
~hiss.ar(2);
~hiss.clock = p.clock;
~hiss.quant=[16,0];
~hiss.fadeTime=16.02;
~hiss={
  //  |       |       |       |       |  
  var pat = [
    1,0,1,0, 0,0,1,0, 0,0,1,0, 0,0,1,0,
    0,0,1,0, 0,0,1,0, 0,0,1,0, 0,0,1,0,
    0,0,1,0, 0,0,1,0, 0,0,1,0, 0,0,1,0,
    0,0,1,0, 0,0,1,0, 0,0,1,0, 0,0,1,0,
  ];
  var imp = PulseDivider.kr(~tick.kr,[1,2,4],~counter.kr%pat.size);
  var hit = Select.kr(PulseCount.kr(imp)%pat.size,pat);
  var env = EnvGen.ar(Env([0.001,1,0.0001],[0.002,0.25*[1,2,4]],[20,-3]),imp * hit);
  var sig = WhiteNoise.ar(0.12!3);
  sig = DFM1.ar(sig,env**2*8000+500,0.2*[1,2,4] * LFNoise2.kr(1/4*~tempo!3).range(0.1,0.9));
  sig = sig * env;
  Splay.ar(sig,0.75,0.15);
};
~hiss.play;
);
~hiss.stop(4);
~hiss.clear(16);
~hiss.pause;
~hiss.resume;



// perlin synth ///////////////////////////////////////

(
~perlin.ar(2);
~perlin.clock = p.clock;
~perlin.quant=[16,3/16];
~perlin.fadeTime=16;
~perlin={
  var sig = SinOsc.ar(1/[64,128,[1,2,1/50]] * ~tempo.kr) +1 ** 0.2 * 44100 * ~tempo.kr * 16;
  sig = Perlin3.ar(sig[0],sig[1],sig[2]) * Pulse.ar(2*~tempo/[1,2,4]);
  sig = LPF.ar(sig,900*[1,2,10]);
  Splay.ar(sig,0.05,0.05);
};
~perlin.play;
);
~perlin.stop(4);
~perlin.clear;
~perlin.pause;
~perlin.resume;
