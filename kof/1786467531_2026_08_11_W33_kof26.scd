
p.push();
// overtones synth ///////////////////////////////////////

(
~overtones.ar(2);
~overtones.quant=4;
~overtones.fadeTime=2;
~overtones={
 
var flow = 100;     // Lowest frequency (Hz)
var fhigh = 1200;   // Highest frequency (Hz)
var n = 7;          // Number of voices

var semitoneSpan = 12 * (log(fhigh / flow) / log(2));
var delta = semitoneSpan / (n - 1);
var freqs = flow * (2 ** ((Array.series(n, 0, 1) * delta) / 12));

 var sig = SinOsc.ar(freqs,mul:0.2);
  Splay.ar(sig,0.5,0.25);
};
~overtones.play;
);
~overtones.stop(4);
~overtones.clear;
~overtones.pause;
~overtones.resume;
