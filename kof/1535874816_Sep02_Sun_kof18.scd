


p.push();


// quarter synth ///////////////////////////////////////

(
~quarter.ar(2);
~quarter.clock = p.clock;
~quarter.quant=2;
~quarter.fadeTime=4;
~quarter={
    var last = Duty.kr(1/4/~tempo,0,Dseq([67,69],inf));
    var f = [65,60,last].midicps/[1,2,1.5,4,8,16]/.x[1,1.5] + SinOsc.kr(4/[5,6,7],mul:0.5);
    var r = LFTri.ar(f/(1..32)).range(0,4/(1..32)) + BrownNoise.ar(0.001);
  var sig = LFSaw.ar(1/4/(1..32)).range(0,2pi);
  var x = sig.cos+1*r;
  var y = sig.sin+1*r;
  sig = Perlin3.ar(x,y,SinOsc.ar(f)+1) * LFNoise1.kr(1/16/(1..32));
  sig = LeakDC.ar(sig)*2;
  sig = atan(sig*0.5pi);
  sig = LPF.ar(sig,f);
  Splay.ar(sig,0.5,0.5);
};
~quarter.play;
);
~quarter.stop(4);
~quarter.clear;
~quarter.pause;
~quarter.resume;
