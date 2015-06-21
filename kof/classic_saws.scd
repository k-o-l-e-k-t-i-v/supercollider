


// saw synth ///////////////////////////////////////

(
~saw.quant=2;
~saw.fadeTime=5;
~saw={
  var note = [60,72,48+12,60].midicps*[2,1.25]/([1,1.25,2,1.5,0.25,0.1125,1/64]*0.5pi);
  var sig = LFSaw.ar(note+SinOsc.ar(0.1).range(-2,2));
  sig = RLPF.ar(sig,LFSaw.ar(1/fib(8)).exprange(0.001,1)*15500+50);
  sig = sig + (Resonz.ar(sig,LFSaw.ar(1/2/fib(8)).exprange(0.001,1)*15000+50));
  sig = sig * LFSaw.ar(4/fib(8)).exprange(0.001,1);
  sig = GVerb.ar(sig,100) + LPF.ar(sig/2,800);
  Splay.ar(sig.flat,0.25,0.5);
};
e.addMix(~saw,postVol:true);
~saw.play;
);
~saw.stop(30);


History.end;
