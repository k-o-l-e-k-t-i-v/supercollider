:e .
(
  p=ProxySpace.push(s.reboot);
  e=ProxySubmix.new(\filter);
);


// alalla synth ///////////////////////////////////////

(
~alalla.quant=1;
~alalla.fadeTime=0.02;
~alalla={
  var imp = EnvGen.ar(Env([0,1,0],[0.002,0.25],[3,-3]),Impulse.ar(1,(0..3)/4));
  //var sig = imp * EnvGen.ar(Env([0,1,0],[1.002,1.5],[3,-3]),Impulse.ar(1/4,(0..3)/4));
  var sig = SinOsc.ar(sig+(imp**2*350));
  Splay.ar(sig.flat,0.25,0.195);
};
e.addMix(~alalla,postVol:true);
~alalla.play;
);
~alalla.stop(7);
~alalla.clear;


// hist synth ///////////////////////////////////////

(
~hist.quant=1;
~hist.fadeTime=0.02;
~hist={
  var sig = WhiteNoise.ar(0.4!2);
  sig = sig * LFSaw.ar(1/fib(8)).exprange(0.001,1);
  sig = RLPF.ar(sig,LFSaw.ar(1/4).exprange(10.001,12000),LFSaw.ar(1/4).exprange(0.01,0.4)) * Pulse.ar(4/fib(8));
  Splay.ar(sig.flat,0.5,0.145);
};
e.addMix(~hist,postVol:true);
~hist.play;
);
~hist.stop(7);
~hist.clear;


// poison synth ///////////////////////////////////////

(
~poison.quant=1;
~poison.fadeTime=4.02;
~poison={
  var sig = LFSaw.ar(75);
  sig = RLPF.ar(sig,LFSaw.ar(1/4/fib(8)).exprange(0.001,1)*10000+10);
  Splay.ar(sig,0.25,0.0095);
};
e.addMix(~poison,postVol:true);
~poison.play;
);
~poison.stop(7);
~poison.clear;

// lalal filter ///////////////////////////////////////

(
~dadal.quant=1;
~dadal.fadeTime=1;
~dadal={
  var high,mid,low;
  var sig = e.ar;
  sig = GVerb.ar(sig,100)/2+sig;
  low = CompanderD.ar(LPF.ar(sig,160),4/3,1/4,1/2);
  mid = CompanderD.ar(BPF.ar(sig,400,2),4/3,1/1.025,1/2);
  high = CompanderD.ar(HPF.ar(sig,12000),4/3,1/4,1/2);
  sig = CompanderD.ar((high+mid+low).flat.clip,4/3,1/1.1,1/1.1);
  Splay.ar(sig,0.25,0.242);
};
~dadal.play;
);
~dadal.stop(7);



// laponica synth ///////////////////////////////////////

(
~laponica.quant=1;
~laponica.fadeTime=0.02;
~:qlaponica={
  var sig = LFPulse.ar(50*[1,1])/4 * LFPulse.ar(1/fib(8)) * LFPulse.ar(4) * LFPulse.ar(1/2);
  sig = RLPF.ar(sig,LFSaw.ar(1/4).exprange(100.001,10000) );
  Splay.ar(sig.flat,0.25,0.5);
};
e.addMix(~laponica,postVol:true);
~laponica.play;
);
~laponica.stop(7);
~laponica.clear;
