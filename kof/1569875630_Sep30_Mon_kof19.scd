
  sig = Normalizer.ar(sig);

p.push()
p.bpm(138.88)

// one synth ///////////////////////////////////////

(
~one.ar(2);
~one.quant=2;
~one.fadeTime=4;
~one={
    var mod = Duty.kr([4,8,16]/~tempo,0,Dseq([1,2,1.5,1.33333],inf))/2;
    var f = ([60,61,65].midicps.reciprocal/mod).lag(~tempo/2) + (SinOsc.kr([1,1.01,1.0001]+(~tempo*10))/1000.0);
  var sig = GrayNoise.ar(0.05!3) * Pulse.ar(~tempo/[1,5,10]) + LocalIn.ar(3);
  10.do{
  sig = CombL.ar(sig,f,f)+sig;
  sig = DelayN.ar(sig,f,f);
  sig = LeakDC.ar(sig);
  sig = LPF.ar(sig,1/f);
  sig = Normalizer.ar(sig)/1.01;
  };
  LocalOut.ar(sig);
  Splay.ar(sig,0.15,0.15);
};
~one.play;
);
~one.stop(4);
~one.clear;
~one.pause;
~one.resume;
