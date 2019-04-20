

p.push();
s.options.numWireBufs=512;
// puls synth ///////////////////////////////////////

(
~puls.ar(2);
~puls.quant=8;
~puls.fadeTime=4;
~puls={
  var sig = [
      Pulse.ar(8/(2..5),0.01) *.x
      Pulse.ar(1250/(2..5).log2,mul:0.5),
  ].scramble
  * LFPulse.ar(1/16,(1..16).normalize.scramble,1/4);
  sig = BPF.ar(sig,[15000,5000,250]/(2..17).log2,[0.1,0.2,0.6]);
  Splay.ar(sig,0.15,0.25,levelComp:false);
};
~puls.play;
);
~puls.stop(4);
~puls.clear;
~puls.pause;
~puls.resume;
