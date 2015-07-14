
(
  p=ProxySpace.push(s.reboot);
  e=ProxySubmix.new(\filter);
);



// geom synth ///////////////////////////////////////

(
  ~t={SinOsc.ar(1/60).exprange(0.0001,60)};
  ~geom.quant=1;
  ~geom.fadeTime=0.02;
  ~geom={
    var sig = VarSaw.ar(4320.0/([1,1.25,1.5,1.75]*8pi),mul:0.1);
    sig = sig * EnvGen.ar(Env([0,1,0],[4.002,4.05],[3,-3]),Impulse.ar(1/48,(0..15)/16));
    sig = Mix(sig)!2;
    12.do{|i|
          sig = sig * SinOsc.ar(0.32/(1..8)*LFTri.ar(1/4+i).exprange(0.001,1)).range(0.01,1);
          sig = RLPF.ar(sig,800+sin(~t.ar*(i+1*10)).range(1,18000)) + BrownNoise.ar(0.00002);

         };

    sig = GVerb.ar(sig,100,15,0.01,0.95,60);
    sig = CompanderD.ar(sig,4/3,1/2,1/2);
    Splay.ar(sig.flat,0.5,0.45);
  };
  e.addMix(~geom,postVol:true);
  ~geom.play;
);
~geom.stop(7);
~geom.clear;
