



// saw synth ///////////////////////////////////////

(
~saw.quant=1;
~saw.fadeTime=4.02;
~saw={
  var env = EnvGen.ar(Env([0,1,0],[0.002,0.15],[3,-3]),Impulse.ar(2,(0..3)/4));
    var sig = LFSaw.ar(50 + (env**0.1*10) * [1,2,4,8] * (1.01**(1..8)));
    sig = sig * env * LFSaw.ar(1/4/fib(8)).exprange(0.001,1);
    sig = GVerb.ar(LPF.ar(sig,1400),100)/4+sig;
  Mix.ar(sig) * 0.00055;
};
e.addMix(~saw,postVol:true);
~saw.play;
);
~saw.stop(7);
~saw.clear;

// filter2 filter ///////////////////////////////////////

(
~filter2.quant=1;
~filter2.fadeTime=1;
~filter2={
  var high,mid,low;
  var sig = e.ar;
  sig = GVerb.ar(sig,40)/16 + sig;
  low = CompanderD.ar(LPF.ar(sig,800),4/3,1/4,1/2);
  mid = CompanderD.ar(BPF.ar(sig,2000,2),4/3,1/2,1/2);
  high = CompanderD.ar(HPF.ar(sig,4200),4/3,1/2,1/2);
  sig = CompanderD.ar((high+mid+low).flat,4/3,1/1.1,1/1.1);
  Mix.ar(sig * 0.0125);
};
~filter2.play;
);
~filter2.stop(7);
~filter2.clear;



//Fri Jul 24 19:40:13 CEST 2015
