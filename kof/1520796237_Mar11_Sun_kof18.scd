

p.push();
p.bpm(71);



// one synth ///////////////////////////////////////

(
~one.ar(2);
~one.clock = p.clock;
~one.quant=2;
~one.fadeTime=4;
~one={
  var base = 50 * (71/60) / (2**([102,304,1008,600]/1200));
  var mod = Duty.kr(4/~tempo,0,Dseq([1,2,1.5,1.33333],inf));
  var sig = SinOsc.ar(base+((1..12)/1200),Pulse.ar(~tempo/(2..13))) * 4 * LFSaw.ar(~tempo/8/(1..12));
  sig = Perlin3.ar(sig,sig,sig);
  sig = LPF.ar(sig,1500);
  sig = CombC.ar(sig/4,mod/base,1/base,1);
  sig = LeakDC.ar(sig);
  Splay.ar(sig,0.5,0.25);
};
~one.play;
);
~one.stop(4);
~one.clear;
~one.pause;
~one.resume;
