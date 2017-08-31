

p.push();



// olaola synth ///////////////////////////////////////

(
~olaola.ar(2);
~olaola.clock = p.clock;
~olaola.quant=4;
~olaola.fadeTime=4;
~olaola={
    var mod2 = Duty.kr(3*16,0,Dseq([1,2,1.5,1.33333],inf));
    var mod = SinOsc.ar(10/[1.1,1.2,1.3]).range(0.99,1.01);
  var sig = SinOsc.ar([48000/1.001,50/mod*mod2,250/mod/mod2],SinOsc.ar(59.95/[4,5,6]/8000),mul:(LFTri.ar(1/16/[1,2,3]))**16+0.01).range(1/4,8);// + LFPulse.ar(1.5*[1,2,4]/16);
  //sig = RLPF.ar(sig,250/[1,2,4],0.2);
  sig = Perlin3.ar(sig[0],sig[1],sig[2]);
  //sig = Compander.ar(sig,Pulse.ar(4/[1,2,4]),0.1,1,0.1,relaxTime:LFNoise2.kr(1/4).range(0.01,0.5));

  //sig = Resonz.ar(sig,[50,150,250],0.11)*sig;
  sig = Normalizer.ar(sig)/2;
  sig = CompanderD.ar(sig,3/4,1,1/5)*4/3;
  Splay.ar(sig,0.5,0.75);
};
~olaola.play;
);
~olaola.stop(4);
~olaola.clear;
~olaola.pause;
~olaola.resume;

Compander.help

(
  ~master.quant=2;
  ~master.play;
  ~master.fadeTime = 0.01;
  ~master = {|wet=0.25,lp=3500,hp=250,len=10,rev = 3|
  var sig = In.ar([0,1]);
  var orig = sig;
  var fx;
  //fx = Limiter.ar(sig,0.95);
  sig = CompanderD.ar(sig,3/4,1/1,1/3)*1.5;
  fx = LPF.ar(sig,lp);
  fx = HPF.ar(fx,hp);
  fx = DWGReverbC1C3.ar(NumChannels.ar(fx,2),[5000,5010],1/len)/rev;
  sig = SelectX.ar(wet,[orig,fx]);
  sig = NumChannels.ar(sig,2);
  ReplaceOut.ar(0,sig);
  };
);
p.moveNodeToTail(\master);
