


p.push();
p.bpm(79);

// non synth ///////////////////////////////////////

(
~non.ar(2);
~non.clock = p.clock;
~non.quant=2;
~non.fadeTime=4;
~non={
    var f = TChoose.kr(Impulse.kr([1,2,3]*~tempo/64),[60,36,72].midicps /.x [1,2,1.5,1.33333,1.66666] *.x [1,1.33333,1.5]) + SinOsc.ar(1/[5,6,7]*2,mul:0.1pi) * [1,1.5,1.33333] * [1/2,1,1/1.5];
    var phase = DelayN.ar(LocalIn.ar(2),1/f,1/f);
  var sig = SinOsc.ar(50!2,phase*1.95pi) + BrownNoise.ar(0.3!3);
 sig = LPF.ar(sig,1500);
 sig= PitchShift.ar(sig,1/f,LFNoise2.kr(~tempo/16/[1,2,3]).range(0.5,1.515));
  sig = MoogFF.ar(Resonz.ar(sig,f*0.995,0.2),f*2,LFNoise2.kr(~tempo/16!3).range(1.5,3.5)) * 2;
  sig = CompanderD.ar(sig,3/4,1/2,1);
  sig = Limiter.ar(sig);
  LocalOut.ar(NumChannels.ar(sig,2));
  sig = HPF.ar(sig,20);
  sig = Normalizer.ar(sig) ;
  sig = CombC.ar(sig.softclip/16,~tempo,~tempo/f,~tempo) * (LFTri.ar([1,2,3]*~tempo/64)**2);
  sig = CompanderD.ar(sig,3/4,1/2,1) + (SinOsc.ar(f*16,mul:0.01) * Pulse.ar(~tempo*[1,2,3]*.x[1,2,3]) * LFPulse.ar(~tempo/[4,8,16]));
  sig = (CompanderD.ar(sig,3/4,1,1/2)/4) + (Formant.ar(f/2,f*2,f*2.01)/16);
  Splay.ar(sig,0.75,0.88);
};
~non.play;
  ~non[10] = \filter -> {|sig| DWGReverbC1C3.ar(NumChannels.ar(sig,2),[2000,2010],1/10)/4 };
);
~non.stop(4);
~non.clear;
~non.pause;
~non.resume;


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
