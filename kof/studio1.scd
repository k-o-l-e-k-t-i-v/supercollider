

(
  p=ProxySpace.push(s.reboot);
  e=ProxySubmix.new(\filter);
);

// one synth ///////////////////////////////////////

(
~one.quant=1;
~one.fadeTime=4.02;
~one={
    var sig = Mix.fill(7,{|i|SinOsc.ar(4400/[1.001+(i/100),1.01+(i/1000),2,4],mul:0.56)});
    sig = sig * LFSaw.ar(1/8/[1,2,4,8]).exprange(0.001,1);
    sig = RLPF.ar(sig,LFSaw.ar(4/fib(8)).exprange(40.001,4000));
    
  Mix.ar(sig/32);
};
e.addMix(~one,postVol:true);
~one.play;
);
~one.stop(7);
~one.clear;



// two synth ///////////////////////////////////////

(
~two.quant=1;
~two.fadeTime=1.02;
~two={
    var sig = HPF.ar(WhiteNoise.ar(0.3!2),8000+LFDNoise1.ar(1).range(1000,12000));
    sig = sig * Pulse.ar(4/fib(8));
    sig = GVerb.ar(sig,20)/8+sig;
  Splay.ar(sig.flat,0,0.00045);
};
e.addMix(~two,postVol:true);
~two.play;
);
~two.stop(7);
~two.clear;



// slal synth ///////////////////////////////////////

(
~slal.quant=1;
~slal.fadeTime=4.02;
~slal={
    var sig = LFSaw.ar(90*[1,1.5]+((1..8)/100.0),mul:0.19);
    sig = LPF.ar(sig,800 * LFSaw.ar(2/4/fib(8)).exprange(0.001,1) + 10) * LFSaw.ar(1/4).exprange(0.001,1);
  Mix.ar(sig);
};
e.addMix(~slal,postVol:true);
~slal.play;
);
~slal.stop(7);
~slal.clear;



// dust synth ///////////////////////////////////////

(
~dust.quant=1;
~dust.fadeTime=0.02;
~dust={
    var sig = Impulse.ar(4/fib(8));
  sig = RLPF.ar(sig*80,90);
  Splay.ar(sig,0.05,0.5);
};
e.addMix(~dust,postVol:true);
~dust.play;
);
~dust.stop(7);
~dust.clear;

// asd filter ///////////////////////////////////////

(
~asd.quant=1;
~asd.fadeTime=1;
~asd={
  var high,mid,low;
  var sig = e.ar;
  //sig = GVerb.ar(sig,40,3,0.01,0.95,65)/8 + sig;
  low = CompanderD.ar(LPF.ar(sig,800),4/3,1/2,1/2);
  mid = CompanderD.ar(BPF.ar(sig,2000,2),4/3,1/2,1/2);
  high = CompanderD.ar(HPF.ar(sig,4200),4/3,1/2,1/2);
  sig = CompanderD.ar((high+mid+low).flat,4/3,1/1.1,1/1.1);
  Splay.ar(sig,0.25,0.15);
};
~asd.play;
);
~asd.stop(7);
