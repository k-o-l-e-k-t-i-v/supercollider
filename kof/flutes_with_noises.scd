



(
  p=ProxySpace.push(s.reboot);
  e=ProxySubmix.new(\filter);
);


// aa synth ///////////////////////////////////////

(
  ~aa.quant=1;
  ~aa.fadeTime=0.02;
  ~aa={
    var mod = Duty.kr(4,0,Dseq([1,2,1.5,1.25],inf));
    var tempo = 1/4/fib(12);
    var sig = BPF.ar(WhiteNoise.ar(2!4),LFSaw.ar(4/fib(8)).exprange(40.001,2000)+SinOsc.kr(1).range(-4,40),1.2);
    sig = sig * LFSaw.ar(11+LFSaw.ar(1/4/fib(8)).exprange(0.001,1)) * LFSaw.ar(111+(1..8),mul:0.5);
    sig = sig * LFSaw.ar(4/fib(8)).exprange(0.001,1);
    sig = Formant.ar(sig,[60,58,72,55].midicps*[4*1.5,3,8]/([1,2,1.5,1.25]*pi*mod),0.002,0.4) + sig * EnvGen.ar(Env([0,1,0],[2.002,1],[3,-3]),Impulse.ar(1/4,(0..3)/4));
    Splay.ar(sig,0.05,1);
  };
  e.addMix(~aa,postVol:true);
  ~aa.play;
);
~aa.stop(7);
~aa.clear;


s.scope


// test filter ///////////////////////////////////////

(
  ~test.quant=1;
  ~test.fadeTime=1;
  ~test={
    var high,mid,low;
    var sig = e.ar;
    sig = GVerb.ar(sig,30,10,0.021,0.51,80);
    low = CompanderD.ar(LPF.ar(sig,200),4/3,1/2,1/2);
    mid = CompanderD.ar(BPF.ar(sig,800,2),4/3,1/2,1/2);
    high = CompanderD.ar(HPF.ar(sig,12000),4/3,1/2.1,1/2);
    sig = (high+mid+low).flat;
    Splay.ar(sig,0.25,0.5);
  };
  ~test.play;
);
~test.stop(7);
