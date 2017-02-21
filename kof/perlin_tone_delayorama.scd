
s.boot();
p.push()

(
  ~master.quant=2;
  ~master.play;
  ~master.fadeTime = 0.01;
  ~master = {|wet=0.25,lp=3500,hp=250,len=10,rev = 3|
  var sig = In.ar([0,1]);
  var orig = sig;
  var fx;
  //fx = Limiter.ar(sig,0.95);
  sig = CompanderD.ar(sig,3/4,1/1.5,1);
  fx = LPF.ar(sig,lp);
  fx = HPF.ar(fx,hp);
  fx = DWGReverb.ar(NumChannels.ar(fx,2),[5000,5010],1/len)/rev;
  sig = SelectX.ar(wet,[orig,fx]);
  sig = NumChannels.ar(sig,2);
  sig = CompanderD.ar(sig,3/4,1/1.5,1);
  ReplaceOut.ar(0,sig);
  };
);
p.moveNodeToTail(\master);

p.push();


// perlin_dalay synth ///////////////////////////////////////

(
~perlin_dalay.ar(2);
~perlin_dalay.clock = p.clock;
~perlin_dalay.quant=16;
~perlin_dalay.fadeTime=1;
~perlin_dalay={
  var sin = SinOsc.ar([1/4000*((1..3).reciprocal+0.5),1/1600/(1..3),50]).range(50,1000*LFNoise2.kr(1/160/[1,2,3]).range(1/4,4));
  var t1 = CombN.ar(Formant.ar(sin,sin*LFNoise2.kr(1/32)*4,sin*LFNoise2.kr(1/32)*4),1/500,1/5,16) * [1/16,1/4,1/40];
  var t = AllpassN.ar(LPF.ar(t1,[1500,501,1500]),1/50,1/5.001,4);
  var sig = Perlin3.ar(t[0],t[1],t[2]);
  sig = LeakDC.ar(sig);
  sig = CompanderD.ar(sig,3/4,1/2,1);
  Splay.ar(sig,0.5,0.25);
};
~perlin_dalay.play;
);
~perlin_dalay.stop(50);
~perlin_dalay.clear;
~perlin_dalay.pause;
~perlin_dalay.resume;

// formann synth ///////////////////////////////////////

(
~formann.ar(2);
~formann.clock = p.clock;
~formann.quant=16;
~formann.fadeTime=60;
~formann={
  var note = [50,100,200]*{[1,1/[2,3,4].choose,[2,3,4].choose/[1,1.5,2,1.33333].choose]*[1,1.5,1.3333,2]}!3;
  var sig = Formant.ar([note],note*4+SinOsc.kr(1/16/[1,2,3,4] + [0.0001,0.01,0.001,0.00001],mul:note),note*8+SinOsc.ar(1/16/[1,2,3,4],mul:note*8));
  sig = LPF.ar(sig,3000)*0.25;
  //sig = Compander.ar(sig,Pulse.ar(2/[1,2,3]),0.1,1,0.1);
  Splay.ar(sig,0.5,0.005);
};
~formann.play;
);
~formann.stop(40);
~formann.clear;
~formann.pause;
~formann.resume;
