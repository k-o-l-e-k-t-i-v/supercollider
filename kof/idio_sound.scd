
p.push();
OpenObject.start
OpenObject.openInterpreter;

(
  ~master.quant=2;
  ~master.play;
  ~master.fadeTime = 0.01;
  ~master = {|wet=0.15,lp=3500,hp=250,len=10,rev = 3|
  var sig = In.ar([0,1]);
  var orig = sig;
  var fx;
  //fx = Limiter.ar(sig,0.95);
  sig = Compander.ar(sig,3/4,1/1.1,1/3);
  fx = LPF.ar(sig,lp);
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
~one.quant=2;
~one.fadeTime=0.001;
~one={|x,y,ax,ay|
  var sx = x.lag(1/30);
  var sy = y.lag(1/30);
  var sax = ax.lag(1/30);
  var say = ay.lag(1/30);
  var sig = SinOsc.ar([sax,say,[sx,sy].range(84.midicps,84.1.midicps)],[say,sax]*8pi) ** 0.04 / (3*[sx,sy]) ;
  sig = Perlin3.ar(sig[0],sig[1],sig[2]) * SinOsc.ar(([ax,ay,x,y]**0.4).range(60.midicps,60.1.midicps)) * [sax,say] * 16;
  Splay.ar(sig,0.85,0.75,SinOsc.kr(29.97/2)/4);
};
~one.play;
);
~one.stop(4);
~one.clear;
~one.pause;
~one.resume;


// tone synth ///////////////////////////////////////

(
~tone.ar(2);
~tone.clock = p.clock;
~tone.quant=2;
~tone.fadeTime=4;
~tone={
  var sig = SinOsc.ar(5000!2) * LFPulse.ar(8);
  Splay.ar(sig,0.5,0.25);
};
~tone.play;
);
~tone.stop(4);
~tone.clear;
~tone.pause;
~tone.resume;
