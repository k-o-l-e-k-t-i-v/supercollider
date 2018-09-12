

p.push();


// atanInv synth ///////////////////////////////////////

(
~atanInv.ar(2);
~atanInv.clock = p.clock;
~atanInv.quant=4;
~atanInv.fadeTime=16;
~atanInv={
  var sig = Mix.ar(Pulse.ar(43.2+((8..500)/10000))) + LPF.ar(Dust.ar(4)*4,5000);
  
  var one = LFTri.ar(1/14.9).exprange(1/48000,1/480);
  var two = LFTri.ar(1/15).exprange(1/48000,1/480);
  sig = CombC.ar(sig,1/50,1/50+SinOsc.kr(43.1/[1,1.001]).range(-0.001,0.001),1);
  sig = Normalizer.ar(sig);
  sig = atan(0.5pi*[sig[0],sig[1]*(-1)]);
  sig = LPF.ar(sig,12000);
  sig= CompanderD.ar(sig,3/4,1/3,1);
  Splay.ar([DelayN.ar(sig[0]*(-1),one,one),DelayN.ar(sig[1],two,two)],1,0.25);
};
~atanInv.play;
);
~atanInv.stop(4);
~atanInv.clear(30);
~atanInv.pause;
~atanInv.resume;


// atanfeedback synth ///////////////////////////////////////

(
~atanfeedback.ar(2);
~atanfeedback.clock = p.clock;
~atanfeedback.quant=2;
~atanfeedback.fadeTime=4;
~atanfeedback={
    var f = 432/2;
  var sig = Pulse.ar(1)*WhiteNoise.ar(1) + LocalIn.ar(1);
  sig = DelayL.ar(sig,1/f,1/f);
  sig = Normalizer.ar(sig);
  sig = atan(0.5pi*sig)+sig;
  sig = BPF.ar(sig,f,0.24);
  LocalOut.ar(sig);
  Splay.ar(sig,0.5,0.25);
};
~atanfeedback.play;
);
~atanfeedback.stop(4);
~atanfeedback.clear;
~atanfeedback.pause;
~atanfeedback.resume;


// phaseInv synth ///////////////////////////////////////

(
~phaseInv.ar(2);
~phaseInv.clock = p.clock;
~phaseInv.quant=4;
~phaseInv.fadeTime=4;
~phaseInv={
  var sig = SinOsc.ar(432/[1.5,1,2]);
  var one = LFTri.ar(1/32).exprange(1/48000,1/480);
  var two = LFTri.ar(1/16).exprange(1/48000,1/480);
  Splay.ar([DelayN.ar(sig*(-1),one,one),DelayN.ar(sig,two,two)],1,0.25);
};
~phaseInv.play;
);
~phaseInv.stop(4);
~phaseInv.clear;
~phaseInv.pause;
~phaseInv.resume;

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
