
s.reboot;
p=ProxySpace.push(s);
~tempo={1/0.432};

// formant synth ///////////////////////////////////////

(
~formant.ar(2);
~formant.quant=4;
~formant.fadeTime=2;
~formant={
  var detune = SinOsc.ar(~tempo/[7,6,5]+LFNoise1.kr(~tempo/[3,6,7])).range(-1,1);
  var transpose = Duty.kr([32,16,8]*4/~tempo,0,Dseq([1,2,1,1.5,1,1.33333],inf));
  var notes = (Duty.kr([4,16,64,128]*4/~tempo,0,Dseq(fib(32)%7,inf))/12+1)**2;
  var base = (65).midicps * notes / transpose + detune;
  var filter = LFSaw.kr(~tempo/16/[1,2,3]).range(1,4);
  var sig = SinOsc.ar(base+LFNoise1.kr(0.1!2),mul:0.2) + Formant.ar(base+LFNoise1.kr(0.1!2),base/2*filter,base*2*filter) * [0.5,0.3,0.05];
  var env = {EnvGen.ar(Env([0.001,(8..1)/8,0.001],[0.002,0.15*[1,2,3]],[3,-3]),Impulse.ar(~tempo*2/(fib(24)%16)))};
  sig = sig * env;
  //sig = PitchShift.ar(sig,0.2,LFNoise1.kr(1).range(0.95,1.05)*transpose)/4+sig;
  sig = Vibrato.ar(sig);
  sig = CombN.ar(sig,1/~tempo,2/base.lag(0.2),~tempo/2)/16+sig;
  sig = LeakDC.ar(sig);
  sig = CompanderD.ar(sig,3/4,1/2,1)/2+sig;
  sig = LPF.ar(sig,base*3);
  sig = GVerb.ar(HPF.ar(sig,120),90,3)/8+sig;
  Splay.ar(sig,0.2,0.5);
};
~formant.play;
);
~formant.stop(4);
~formant.clear;
~formant.pause;
~formant.resume;


s.scope;
