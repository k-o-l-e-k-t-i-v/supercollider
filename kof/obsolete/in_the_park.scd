

// parksynth synth ///////////////////////////////////////

(
~parksynth.quant=2;
~parksynth.fadeTime=4;
~parksynth={
  var mod = Duty.kr(1/[4,1/4],0,Dseq(([24,48]+[12,24,0,5].scramble).midicps/[1,2,1.5,1.25]*1pi,inf));
  var sig = Blip.ar(mod,LFSaw.ar(1/4).exprange(0.001,1)*4+2) + WhiteNoise.ar(0.5!2);
  sig = CombN.ar(sig,1/4,LFDNoise1.ar(1/16*fib(8)).exprange(0.0002,2).round(0.02),8)/16+sig;
  sig = BPF.ar(sig,LFSaw.ar(4/fib(8)).exprange(0.001,1)*18000+50,0.2);
  sig = Greyhole.ar(sig,0.8,0.91,15)/2+sig;
  sig = sig;
  Splay.ar(sig.flat,0,0.985,1);
};
~parksynth.play;
);
~parksynth.stop(15);


History.end

~parksynth={};

