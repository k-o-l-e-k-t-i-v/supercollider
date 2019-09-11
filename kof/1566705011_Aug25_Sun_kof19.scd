
p.push()

// one synth ///////////////////////////////////////

(
~one.ar(2);
~one.quant=2;
~one.fadeTime=4;
~one={
    var mod = Duty.kr(4/~tempo,0,Dseq([1,2,1.5,1.33333],inf));
  var sig = SinOsc.ar([300,300,50,60]/mod,SinOsc.ar(1/[4,5,6,7])*2pi);
  sig = BPeakEQ.ar(sig,16000/(1..16),1,LFNoise2.kr(1/4!16).exprange(0.01,96) * (-1));
  Splay.ar(sig,0.5,0.15);
};
~one.play;
);
~one.stop(4);
~one.clear;
~one.pause;
~one.resume;
