

(
  p=ProxySpace.push(s.reboot);
//  e=ProxySubmix.new(\filter);
);


(
  var tempo = 1/3/2;
  var offset = (0..7)/8;
  t = TempoClock.new(tempo);
  ~tick.quant = 1;
  ~tick = {Mix(Impulse.kr( tempo / 2 , offset ))};
  
  offset = (0..7)+0.5/8;
  ~tick2.quant = 1;
  ~tick2 = {Mix(Impulse.kr( tempo / 2 , offset ))};
  ~counter = {PulseCount.kr(~tick.kr)};
  ~time = {LFSaw.kr(tempo/4).range(0,1)};
)

// aaa synth ///////////////////////////////////////

(
~aaa.quant=1;
~aaa.fadeTime=4.02;
~aaa={
  var x,y;
  var imp = PulseDivider.kr(~tick.kr,[1,2,3,4],~counter.kr);
  var env = EnvGen.ar(Env([0.001,1,0.001],[2.002,0.5],[6,-3]),imp);
  var sig = SinOsc.ar(4320/6/([1.5,2,4,8]*[0.25,3.5,0.25,3.51]*pi)+LFNoise2.kr(1/40!8).range(-2,2+(env*8)),LFNoise2.kr(1/40!4).exprange(0.001,8pi));
  #x,y=Rotate2.ar(sig[0]+sig[1],sig[2]+sig[3],SinOsc.ar(1/8));
  sig = sig * SinOsc.ar(43.04,[x,y]*0.02pi) ;//* SinOsc.ar(44);
  sig = Normalizer.ar(sig,0.9).softclip;
  
  //sig = Mix(sig);

  sig = sig * env;
  sig = CompanderD.ar(sig,2/3,1/3,1/3);
  Splay.ar(sig,2.5,0.95);
};
//      e.addMix(~aaa,postVol:true);
~aaa.play;
);
~aaa.stop(7);
~aaa.clear;
