
s.reboot;
p=ProxySpace.push(s);
~tempo={1/0.432};

// formant synth ///////////////////////////////////////

(
~formant.ar(2);
~formant.quant=4;
~formant.fadeTime=2;
~formant={
  var detune = SinOsc.ar(4/[7,6,5]).range(-2,2);
  var transpose = Duty.kr([32,16,8]*4/~tempo,0,Dseq([1,2,1,1.5,1,1.33333],inf));
  var notes = (Duty.kr([4,16,64,128]*4/~tempo,0,Dseq([1,5,1,0],inf))/12+1)**2;
  var base = ([48,55,60]).midicps * (notes *.x transpose) +.x detune;
  var filter = LFSaw.kr(~tempo/16/[1,2,3]).range(1,4);
  var sig = SinOsc.ar(base+BrownNoise.kr(1!2),mul:0.2) + Formant.ar(base+BrownNoise.kr(1!2),base/2*filter,base*2*filter) + Blip.ar(base,mul:0.2) * [0.5,0.3,0.05];
  var env = {EnvGen.ar(Env([0.001,1,0.001],[0.02,0.5*[1,2,3]],[3,-3]),CombN.ar(Impulse.ar(~tempo/[1,2,3])),1,1,1)};
  sig = sig * env;
  sig = Vibrato.ar(sig);
  sig = CombN.ar(sig,1/~tempo,2/base.lag(0.2),~tempo/4)/8+sig;
  sig = CompanderD.ar(sig,3/4,1/2,1)/2+sig;
  sig = LPF.ar(sig,base*3);
  sig = GVerb.ar(HPF.ar(sig,120),90,3)/16+sig;
  sig = LeakDC.ar(sig);
  Splay.ar(sig,0.2,0.5);
};
~formant.play;
);
~formant.stop(4);
~formant.clear;
~formant.pause;
~formant.resume;


s.scope;
