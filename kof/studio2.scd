

(
  p=ProxySpace.push(s.reboot);
  e=ProxySubmix.new(\filter);
);



// four synth ///////////////////////////////////////

(
~four.quant=1;
~four.fadeTime=4.02;
~four={
    var sig = BPF.ar(LFSaw.ar(9000*[1,1.5,2,4]),15000/[1,2,4,8]);
    sig = sig * LFSaw.ar(1/fib(8)).range(100.0001,10000) * LFPulse.ar(8/fib(8)) * Pulse.ar(4);
  Splay.ar(sig,0.25,0.0000065);
};
e.addMix(~four,postVol:true);
~four.play;
);
~four.stop(7);
~four.clear;


// two synth ///////////////////////////////////////

(
~two.quant=1;
~two.fadeTime=0.02;
~two={
    var sig = Pulse.ar(1/4/fib(8));
  sig = RLPF.ar(sig,[99*4,80*4,900/2,18000/8]);
  Splay.ar(sig,0.25,0.15);
};
e.addMix(~two,postVol:true);
~two.play;
);
~two.stop(7);
~two.clear;


// qua filter ///////////////////////////////////////

(
~qua.quant=1;
~qua.fadeTime=1;
~qua={
  var high,mid,low;
  var sig = e.ar;
  sig = GVerb.ar(sig,20,3,0.01,0.95,65)/16 + sig;
  low = CompanderD.ar(LPF.ar(sig,180),4/3,1/1,1/2);
  mid = CompanderD.ar(BPF.ar(sig,2000,2),4/3,1/2,1/2);
  high = CompanderD.ar(HPF.ar(sig,14200),4/3,1/3,1/2);
  sig = CompanderD.ar((high+mid+low).flat,4/3,1/1.1,1/1.1);
  Splay.ar(sig,0.25,0.045);
};
~qua.play;
);
~qua.stop(7);
~qua.clear


// lala filter ///////////////////////////////////////

(
~lala.quant=1;
~lala.fadeTime=1;
~lala={
  var high,mid,low;
  var sig = e.ar;
  //sig = GVerb.ar(sig,20,3,0.01,0.95,65)/4 + sig;
  low = CompanderD.ar(LPF.ar(sig,800),4/3,1/2,1/2);
  mid = CompanderD.ar(BPF.ar(sig,2000,2),4/3,1/2,1/2);
  high = CompanderD.ar(HPF.ar(sig,4200),4/3,1/2,1/2);
  sig = CompanderD.ar((high+mid+low).flat,4/3,1/1.1,1/1.1);
  Splay.ar(sig,0.25,0.25);
};
~lala.play;
);
~lala.stop(7);
