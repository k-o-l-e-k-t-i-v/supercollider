


p.push();
s.latency=0.2;

Tdef(\mel,{loop{~ssimp.rebuild;8.wait;~ssimp2.rebuild;8.wait;}}).play;

// ssimp synth ///////////////////////////////////////

(
~ssimp.ar(2);
~ssimp.clock = p.clock;
~ssimp.quant=4;
~ssimp.fadeTime=3;
~ssimp={
    var chord = [[1,5,12],[0,5,7],[5,7,11],[0,12,0],[0,4,5]].choose.scramble;
    var env = LFTri.kr(~tempo/16)**2*2;
    var base = {[36,48,60,72,84].midicps.choose}!3 * ([1.5,2,1,4/3,2].choose);
  var sig = base /.x {[1,2.004,1.5001,1,2.01,1.501,4/3,15/8].choose}!2 + SinOsc.kr(~tempo/[4,5,6,7],mul:2.5*env) ;
  sig = [] ++ SinOsc.ar(sig[0],mul:0.5) ++ LFPulse.ar(sig[1],mul:0.5) ++ LFSaw.ar(sig[2]) ++ Formant.ar(sig[3],sig[3]/4,sig[3]/8);
  sig = Perlin3.ar(LFTri.ar(~tempo/16)**2*4,LFTri.ar(~tempo/8/(1..4))*sig+1*env,sig+1*env) + LPF.ar(sig,base*2);
  sig = LeakDC.ar(sig);
  sig = MoogVCF.ar(sig,base*(2**(chord/12)),LFTri.kr(~tempo/4/[1,2,3]).exprange(0.1,0.9)**2);
  sig = CompanderD.ar(sig,1/2,1/2,1);
  Splay.ar(sig,0.5,0.15);
};
~ssimp.play;
);
~ssimp.stop(4);
~ssimp.clear;
~ssimp.pause;
~ssimp.resume;

// ssimp synth ///////////////////////////////////////

(
~ssimp2.ar(2);
~ssimp2.clock = p.clock;
~ssimp2.quant=4;
~ssimp2.fadeTime=3;
~ssimp2={
    var chord = [[1,5,12],[0,5,7],[5,7,11],[0,12,0],[0,4,5]].choose.scramble;
    var env = LFTri.kr(~tempo/16)**2*2;
    var base = {[36,48,60,72,84].midicps.choose}!3 / [4,2].choose * ([1.5,2,1,4/3,2].choose);
  var sig = base /.x {[1,2.004,1.5001,1,2.01,1.501,4/3,15/8].choose}!2 + SinOsc.kr(~tempo/[5,6,7,8],mul:2.5*env) ;
  sig = [] ++ SinOsc.ar(sig[0],mul:0.5) ++ LFPulse.ar(sig[1],mul:0.5) ++ LFSaw.ar(sig[2]) ++ Formant.ar(sig[3],sig[3]/4,sig[3]/8);
  sig = Perlin3.ar(LFTri.ar(~tempo/16)**2*4,LFTri.ar(~tempo/8/(1..4))*sig+1*env,sig+1*env) + LPF.ar(sig,base*4);
  sig = LeakDC.ar(sig);
  sig = MoogVCF.ar(sig,base*(2**(chord/12)),LFTri.kr(~tempo/4/[1,2,3]).exprange(0.1,0.9)**2);
  sig = CompanderD.ar(sig,1/2,1/2,1);
  Splay.ar(sig,0.5,0.15);
};
~ssimp2.play;
);
~ssimp2.stop(4);
~ssimp2.clear;
~ssimp2.pause;
~ssimp2.resume;



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
