
p.push();
p.bpm(121.35);


// one synth ///////////////////////////////////////

(
~one.ar(2);
~one.quant=0;
~one.fadeTime=1;
~one={
    var fl = LFSaw.kr(~tempo/[16,24,32]) * 100.0;
  var sig = LFSaw.ar(SinOsc.ar([1,1.001]*fl*.x[1/16,1/32,1/24]).exprange(40,1200)) + 1 / 2;
  sig = Perlin3.ar(sig[0],sig[1],sig[2] * Pulse.ar(~tempo/[4,3,2,1]/4));
  sig = MoogFF.ar(sig,[1,2,4,8]*1100,1.5);
  sig = CompanderD.ar(sig,3/4,1/2,1);
  Splay.ar(sig,1.0,0.5,0);
};
~one.play;
);
~one.stop(4);
~one.clear;
~one.pause;
~one.resume;


(
  ~master.quant=2;
  ~master.play;
  ~master.fadeTime = 0.01;
  ~master = {|wet=0.15,lp=3500,hp=250,len=10,rev = 3|
  var sig = In.ar([0,1]);
  var orig = sig;
  var fx;
  //fx = Limiter.ar(sig,0.95);
  sig = CompanderD.ar(sig,3/4,1/1.1,1/3);
  fx = LPF.ar(sig,lp);
  fx = HPF.ar(fx,hp);
  fx = DWGReverbC1C3.ar(NumChannels.ar(fx,2),[5000,5010],1/len)/rev;
  sig = SelectX.ar(wet,[orig,fx]);
  sig = NumChannels.ar(sig,2);
  ReplaceOut.ar(0,sig);
  };
);
p.moveNodeToTail(\master);
