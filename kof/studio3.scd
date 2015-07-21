
(
  p=ProxySpace.push(s.reboot);
  e=ProxySubmix.new(\filter);
);



// dustyy synth ///////////////////////////////////////

(
~dustyy.quant=1;
~dustyy.fadeTime=1.02;
~dustyy={
    //var sig = LFSaw.ar(43.0*8/([1,2,4,8]*0.5pi)*[1,1.25,4,8,0.5]) * EnvGen.ar(Env([0,1,0],[0.002,4.5],[3,-3]),Impulse.ar(1,(0..3)/4));
    var sig = LFSaw.ar(44.1) * LFPulse.ar(1/4) + (LFSaw.ar(400,mul:0.1) * Pulse.ar(1/4));
    sig = LPF.ar(sig,4410) ;//* LFSaw.ar(1/4/fib(8)).exprange(0.001,1);// + DelayN.ar(~dustyy.ar,4,4);
  Splay.ar(sig,0,0.15);
};
e.addMix(~dustyy,postVol:true);
~dustyy.play;
);
~dustyy.stop(7);
~dustyy.clear;


// asdaa filter ///////////////////////////////////////

(
~asdaa.quant=1;
~asdaa.fadeTime=1;
~asdaa={
  var high,mid,low;
  var sig = e.ar;
  sig = GVerb.ar(sig,20,3,0.01,0.95,65)/8 + sig;
  low = CompanderD.ar(LPF.ar(sig,800),4/3,1/2,1/2);
  mid = CompanderD.ar(BPF.ar(sig,200,2),4/3,1/0.2,1/2);
  high = CompanderD.ar(HPF.ar(sig,1200),4/3,1/1.0,1/2);
  sig = CompanderD.ar((high+mid+low).flat,4/3,1/1.1,1/1.1);
  Splay.ar(sig,0.25,0.125);
};
~asdaa.play;
);
~asdaa.stop(7);
~asdaa.clear
