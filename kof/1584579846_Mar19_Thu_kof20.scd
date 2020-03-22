


p.push();
p.bpm(120)

b=Buffer.alloc(s,48000,4);



// one synth ///////////////////////////////////////

(
~one.ar(2);
~one.quant=2;
~one.fadeTime=0.4;
~one={
    var pat = Duty.kr(1/~tempo,0,Dseq([[0,20,12,16],[0,12,16,21],[2,3,4,5],[0,6,12,16]],inf));
    var f = (2**(([60,65,67,48]-49)/(12)))*440;
  var sig = Pulse.ar(~tempo/4!4);
  var time = 1/24*pat * LFNoise1.kr(~tempo*4).range(0.995,1.005);
  sig = BufDelayL.ar(b,sig,time);
sig = SinOsc.ar(f,sig*2pi) * sig;
  Splay.ar(sig,0.95,0.25);
};
~one.play;
);
~one.stop(4);
~one.clear;
~one.pause;
~one.resume;
