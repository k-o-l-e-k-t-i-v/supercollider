
(
  p=ProxySpace.push(s.reboot);
  e=ProxySubmix.new(\filter);
);

// lalal synth ///////////////////////////////////////

(
  ~lalal.quant=2;
  ~lalal.fadeTime=5;
  ~lalal={
    var duty = Duty.kr(4,0,Dseq([1,2,1.5,1.25].pyramid,inf));
    var sig = LFSaw.ar(432/([1,2,4,8,1.5,1.25]*duty*[0.125,0.25,0.5]*pi)).lag(LFDNoise1.kr(11!4).range(0.0001,0.01));
    sig = sig * EnvGen.ar(Env([0,1,0],[0.005,3],[3,-3]),Impulse.ar([1,1/2,1/4],(0..3)/4));
    sig = GVerb.ar(sig,[1,10]);
    Splay.ar(sig.flat,0.25,0.5);
  };
  e.addMix(~lalal,postVol:true);
  ~lalal.play;
);
~lalal.stop(7);
