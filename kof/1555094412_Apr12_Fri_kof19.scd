
s.boot;
p.push

// one synth ///////////////////////////////////////

(
~one.ar(2);
~one.quant=2;
~one.fadeTime=4;
~one={
    var f = Duty.kr([4,16,32]/~tempo,0,Dseq(([62,67,64,60,69,72,71]).midicps,inf))/1.5;
  var sig = Pluck.ar(BrownNoise.ar(0.1!f.size),Impulse.ar(5),1/f,1/f,LFNoise1.kr(1/4!f.size).range(0.1,2));
  sig = LPF.ar(sig,50)+HPF.ar(sig,10000);
  sig = CompanderD.ar(sig,3/4,1/2,1);
  Splay.ar(sig,0.05,0.25);
};
~one.play;
);
~one.stop(4);
~one.clear;
~one.pause;
~one.resume;
