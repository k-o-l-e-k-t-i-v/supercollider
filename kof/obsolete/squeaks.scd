

(
  p=ProxySpace.push(s.reboot);
  e=ProxySubmix.new(\filter);
);

// squeaks synth ///////////////////////////////////////

(
  ~squeaks.quant=2;
  ~squeaks.fadeTime=5;
  ~squeaks={
    var sig = LFSaw.ar([1000,200,50,4000]);
    5.do{|i|
         sig = BBandPass.ar(sig,LFSaw.ar(111/(i+1)/fib(8)).range(200,8000)+BrownNoise.ar(1!8).range(-4,4),0.15);
         sig = Normalizer.ar(sig);
        };
    sig = sig * LFSaw.ar(1/4/fib(8)).exprange(0.001,1);
    sig = CombN.ar(sig,1,LFDNoise1.ar(1!8).exprange(0.0002,0.2),2)/4+sig;
    sig = Pulse.ar([1,2,4,8])/3+(sig/8);
    sig = LPF.ar(sig,400) + Resonz.ar(sig,LFSaw.ar(1/4/fib(8)).exprange(40.001,2000));
    sig= GVerb.ar(sig,10)/4+sig;
    Splay.ar(sig.flat,0.25,0.5);
  };
  e.addMix(~squeaks,postVol:true);
  ~squeaks.play;
);
~squeaks.stop(7);
