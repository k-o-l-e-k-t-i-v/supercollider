
s.reboot;
p=ProxySpace.push(s);
~tempo={1/0.432};

// formant synth ///////////////////////////////////////

(
~formant.ar(2);
~formant.quant=4;
~formant.fadeTime=2;
~formant={
  var detune = SinOsc.ar(1/[7,6,5]).range(-2,2);
  var transpose = Duty.kr([16,4,8]/~tempo,0,Dseq([1,2,1.5,1.33333],inf));
  var notes = (Duty.kr([4,16,64]/~tempo,0,Dseq([1,5,1,8,1].pyramid,inf))/12+1)**2;
  var base = ([36,48,60]).midicps * (transpose ** notes);
  var filter = LFSaw.kr(~tempo/4/[1,2,3]).range(1,4);
  var sig = Formant.ar(base+detune,base/filter,base*filter) * [0.4,0.2,0.1];
  var env = {EnvGen.ar(Env([0.001,1,0.001],[0.002,0.5*[1,2,3]],[3,-3]),Impulse.ar(~tempo*2/[1,2,3]))};
  sig = sig * env;
  sig = Vibrato.ar(sig);
  sig = CombC.ar(sig,1/~tempo,1/~tempo,~tempo)/8+sig;
  sig = GVerb.ar(sig,90,3)/8+sig;
  sig = LeakDC.ar(sig);
  sig = CompanderD.ar(sig,3/4,1/2,1);
  Splay.ar(sig,0.2,0.35);
};
~formant.play;
);
~formant.stop(4);
~formant.clear;
~formant.pause;
~formant.resume;


s.scope;
