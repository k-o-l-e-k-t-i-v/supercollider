


(
  p=ProxySpace.push(s.reboot);
  e=ProxySubmix.new(\filter);
);


// feedback synth ///////////////////////////////////////

(
  ~feedback.quant=1;
  ~feedback.fadeTime=0.002;
  ~feedback={
    var sig = SinOsc.ar(55.2!2,mul:0.125);
    sig = CombN.ar(sig,4,LFSaw.ar(5000*LFSaw.ar(1/32).exprange(0.00001,1)*(1.0001**(1..8))).exprange(0.0001,1),8);
    sig = Normalizer.ar(sig)/2;
    sig = Rotate2.ar(sig/2,sig/2,SinOsc.ar(1/8/fib(8)).range(-0.75,0.75));
    sig = RLPF.ar(sig,16000*LFSaw.ar(1/4/fib(8)).exprange(0.0001,1)+40);
    sig = Limiter.ar(sig);

    Splay.ar(sig,0.75,0.75);
  };
  e.addMix(~feedback,postVol:true);
  ~feedback.play;
);
~feedback.stop(7);
~feedback.clear;


// abc filter ///////////////////////////////////////

(
  ~abc.quant=1;
  ~abc.fadeTime=1;
  ~abc={
    var high,mid,low;
    var sig = e.ar;
    sig = GVerb.ar(sig,100,20,0.91,0.95,65);
    low = CompanderD.ar(LPF.ar(sig,800),4/3,1/3,1/2);
    mid = CompanderD.ar(BPF.ar(sig,2000,2),4/3,1/2,1/2);
    high = CompanderD.ar(HPF.ar(sig,4200),4/3,1/3,1/2);
    sig = CompanderD.ar((high+mid+low).flat.clip(-1,1),4/3,1/1.1,1/1.1);
    Splay.ar(sig,0.25,0.25);
  };
  ~abc.play;
);
~abc.stop(7);

s.scope;
