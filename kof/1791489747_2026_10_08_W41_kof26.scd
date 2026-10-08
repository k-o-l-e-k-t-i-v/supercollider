p.push();


// one synth ///////////////////////////////////////

(
~one.ar(2);
~one.quant=4;
~one.fadeTime=2;
~one={
  var base = Duty.kr(4/~tempo,0,Dseq([48,60,65,36,72],inf)).midicps/[1,1.5,11/5];
  var sig = LFSaw.ar(base*(2**([1,5,8]/12)+1),SinOsc.ar(1.5/[1,2,3,4]) )*(LFSaw.ar(1/[4,2,1,3])**2);
  Splay.ar(sig,0.5,0.15);
};
~one.play;
);
~one.stop(4);
~one.clear;
~one.pause;
~one.resume;
