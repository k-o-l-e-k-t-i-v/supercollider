

(
  p=ProxySpace.push(s.reboot);
  e=ProxySubmix.new(\filter);
);


// lala synth ///////////////////////////////////////

(
  ~lala.quant=1;
  ~lala.fadeTime=0.02;
  ~lala={
    var sig = SinOsc.ar(10000+SinOsc.ar(LFSaw.ar(1/4/fib(8)).exprange(0.001,1)*10000).range(-10,10000)) * Pulse.ar(LFSaw.ar(1/fib(8)).exprange(0.001,1)*4);
    //sig = AllpassN.ar(sig,1/2,1/2,16);
    //sig = GVerb.ar(sig,100,4,0.01,0.1,12);
    Splay.ar(sig.flat,0.25,0.75);
  };
  e.addMix(~lala,postVol:true);
  ~lala.play;
);
~lala.stop(7);
~lala.clear;
