
(
~puls.quant=1;
~puls.fadeTime=0.15;
~puls.play;
~puls={
    var mel = Duty.kr(16,0,Dseq([1,2,1.5,1.33333],inf));
    var mel2 = Duty.kr(32,0,Dseq([1,2,1.5,1.3333],inf));
    var mel3 = Duty.kr(64,0,Dseq([1,2,1.5,1.333],inf));
    var mel4 = Duty.kr(128,0,Dseq([1,2,1.5,1.33],inf));
  var pat = 4/[1,1,1,1];
  var off = [0,0,3/4,1/2];
  var env = DelayN.ar(Pulse.ar(pat),off,off);
  var sig = SinOsc.ar(15000/[100/mel,200/mel2,1/mel3,2/mel4],Pulse.ar(pat)) * env;
  //sig = sig + (SinOsc.ar(16000/[1,1.5,4/3,10]/1.5/1.33333/1.5) * LFSaw.ar(1/4/[1,2,3,4]).pow(40));
  Splay.ar(sig,0,0.95);
};
)



Pulse.help;
