

p=ProxySpace.push(s);
~tempo={1/0.432};

// formant synth ///////////////////////////////////////

(
~formant.ar(2);
~formant.quant=4;
~formant.fadeTime=2;
~formant={
  var notes = 2**(Duty.kr([4,16,64]/~tempo,0,Dseq([1,5,1,8,1,7,1,6].pyramid,inf))/12+1);
  var base = [36,48,60].midicps * notes;
  var filter = LFSaw.kr(~tempo/4/[1,2,3]).range(1,4);
  var sig = Formant.ar(base,base/filter,base*filter) * [0.4,0.2,0.1];
  var env = {EnvGen.ar(Env([0.001,1,0.001],[0.002,0.5*[1,2,3]],[3,-3]),Impulse.ar(~tempo*2/[1,2,3]))};
  sig = sig * env;
  Splay.ar(sig,0.5,0.25);
};
~formant.play;
);
~formant.stop(4);
~formant.clear;
~formant.pause;
~formant.resume;
