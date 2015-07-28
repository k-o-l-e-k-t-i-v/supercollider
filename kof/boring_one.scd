



(
  p=ProxySpace.push(s.reboot);
  e=ProxySubmix.new(\filter);
);


// morda synth ///////////////////////////////////////

(
~morda.quant=1;
~morda.fadeTime=0.02;
~morda={
  var env = Pulse.ar(4/[1,2,3,4]);
  var sig = Formant.ar([55,77],55.2,40+LFNoise2.kr(1/4!4).range(0,100));
  var mul = [
    SinOsc.ar(8000,mul:0.2),
    GrayNoise.ar(0.3),
    Pulse.ar(75),
    WhiteNoise.ar(0.3)
  ];
  mul = Select.ar(LFSaw.ar(1/4).range(0,mul.size+0.1),mul) / 2;
  sig = (sig * env) + (mul * DelayN.ar(env,0.125,0.125));
  Splay.ar(sig,0.25,0.75);
};
e.addMix(~morda,postVol:true);
~morda.play;
);
~morda.stop(7);
~morda.clear;


// fil filter ///////////////////////////////////////

(
~fil.quant=1;
~fil.fadeTime=1;
~fil={
  var high,mid,low;
  var sig = e.ar;
  sig = GVerb.ar(HPF.ar(sig,400),60)/2 + LPF.ar(sig,400) + sig;
  low = CompanderD.ar(LPF.ar(sig,400),3/4,1/3,1/2);
  mid = CompanderD.ar(BPF.ar(sig,5000,2),3/4,1/2,1/2);
  high = CompanderD.ar(HPF.ar(sig,12000),3/4,1/2,1/2);
  sig = CompanderD.ar((high+mid+low).flat,3/4,1/1.1,1/1.1);
  Splay.ar(sig,0.25,0.25);
};
~fil.play;
);
~fil.stop(7);
~fil.clear;
