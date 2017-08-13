

p.push();

// rezonateur synth ///////////////////////////////////////

(
~rezonateur.ar(2);
~rezonateur.clock = p.clock;
~rezonateur.quant=4;
~rezonateur.fadeTime=4;
~rezonateur={
    var sp = 2 * 1.5;
    var mod2 = TChoose.kr(Impulse.kr(sp/30/[1,2,3]),[1,2,1.5,1.3333334,1.666667,1/2,4,1/1.3333,1/1.5]);
    var mod = TChoose.kr(Impulse.kr(sp/16/30/[1,2,3]),[1,2,1.5,1.3333334,1.666667,1/2,4,1/1.3333,1/1.5]);
    var q = LFNoise2.kr(1/16!3).range(0.001,0.44);
    var f = 500/mod*mod2/1.338 + SinOsc.ar(10/1.3387,mul:4);
    var pa = LFNoise1.kr(1/32!3).range(1/4,2);
  var sig = [SinOsc.ar(f/640*0.994,add:1),SinOsc.ar(f/320.01*0.99,add:1),SinOsc.ar(f*1.0001,add:1)] * pa;
  sig= Perlin3.ar(sig[0],sig[1],sig[2]);
  sig = Resonz.ar(sig,f,q) * Pulse.ar(4/[1,2,3]) + MoogFF.ar(sig,f,2+(q*2));
  sig = sig * (LFTri.ar(sp/30/[1,2,3])**10) + (sig/2);
  
  Splay.ar(sig,0.5,0.75);
};
~rezonateur.play;
);
~rezonateur.stop(4);
~rezonateur.clear;
~rezonateur.pause;
~rezonateur.resume;


(
  ~master.quant=2;
  ~master.play;
  ~master.fadeTime = 0.01;
  ~master = {|wet=0.15,lp=3500,hp=250,len=10,rev = 3|
  var sig = In.ar([0,1]);
  var orig = sig;
  var fx;
  fx = Limiter.ar(sig,0.95);
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


FSinOsc.help
