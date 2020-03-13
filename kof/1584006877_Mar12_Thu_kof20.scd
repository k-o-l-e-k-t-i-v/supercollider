

p.push();


// one synth ///////////////////////////////////////

(
~one.ar(2);
~one.quant=2;
~one.fadeTime=4;
~one={
  var sig = SinOsc.ar(~tempo/4)+1*10 + SinOsc.ar(1500/[1,2,1.5,4],mul:0.2);
  3.do{|i|
      i=i+1;
    sig = CombN.ar(sig,i/4,i/4,1);
    sig = LeakDC.ar(sig);
    sig = Normalizer.ar(sig);
  };
 // sig = LPF.ar(sig,1500);
  sig = Perlin3.ar((LFSaw.ar(~tempo/4)*2pi).cos+1,(LFSaw.ar(~tempo/4)*2pi).sin+1,sig);
  sig = LeakDC.ar(sig);
  Splay.ar(sig,1,0.95);
};
~one.play;
);
~one.stop(4);
~one.clear;
~one.pause;
~one.resume;
