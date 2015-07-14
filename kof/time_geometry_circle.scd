

(
  p=ProxySpace.push(s.reboot);
  e=ProxySubmix.new(\filter);
);


// circle synth ///////////////////////////////////////

~t={SinOsc.kr(1/120).exprange(0.0001,1)};

(
  ~circle.quant=1;
  ~circle.fadeTime=0.02;
  ~circle={
    var sig = LFSaw.ar(sin(~t.kr*610*(1.00002**(1..8))).exprange(40.1,10000));
    sig = sig ++ LFSaw.ar(cos(~t.kr*620*(1.00001**(1..8))).exprange(40.1,10000));
    sig = sig + BrownNoise.ar(0.1!2);
    sig = Resonz.ar(sig,43.2*[1,2,4,8,1.5,1.125],0.02)+sig;
    sig = GVerb.ar(sig,[100,100.01]/(sin(~t.kr*600).range(1.00001,10)))/4+sig/2;
    sig = LPF.ar(sig,2000) + LocalIn.ar(2);
    sig = CompanderD.ar(sig,0.9,1/1.1,4);
    Splay.ar(sig.flat,0.75,0.25);
  };
  e.addMix(~circle,postVol:true);
  ~circle.play;
);
~circle.stop(7);
~circle.clear;
