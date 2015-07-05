



(
  p=ProxySpace.push(s.reboot);
  e=ProxySubmix.new(\filter);
);



// switcher synth ///////////////////////////////////////


// demon synth ///////////////////////////////////////

(
~demon.quant=2;
~demon.fadeTime=5;
~demon={
  var sig = VarSaw.ar(432*[1,2,4,1.5],mul:0.2) * Pulse.ar(4/[1,1.5]);
  sig = sig * LFSaw.ar(1/4/(1..8)).exprange(0.001,1);
  sig = LPF.ar(sig,420*LFSaw.ar(1/4).exprange(0.001,1)+100);
  Splay.ar(sig.flat,0.25,0.75);
};
e.addMix(~demon,postVol:true);
~demon.play;
);
~demon.stop(7);
~demon.clear;

(
  ~switcher.quant=2;
  ~switcher.fadeTime=0.02;
  ~switcher={
    var duty = Duty.kr(4,0,Dseq([1,2,1.5,1.25],inf));
    var mod = Duty.kr(16,0,Dseq([1,2,1.5,1.25].pyramid,inf));
    var freq = [60,58,55,72].midicps*2/(mod*pi)*(1.001**(1..8))*duty;
    var puls = EnvGen.ar(Env([0,1,0],[0.002,0.75/(mod*duty)],[3,-3]),Impulse.ar(1,(0..3)++0.5/4));
    var sig = [
      SinOsc.ar(freq+(puls*10)),
      WhiteNoise.ar(0.4),
      LFSaw.ar(freq+(puls*10)),
      PinkNoise.ar(0.7)
    ];
    sig = Select.ar(LFSaw.kr(1/4).exprange(0.001,sig.size+1.1),sig/2);
    sig = BBandPass.ar(sig,4320/(1..8)) * LFSaw.ar(1/4/fib(8)).exprange(0.001,1);
    sig = sig + (SinOsc.ar(50+(puls**2*150),mul:0.045)*Pulse.ar(4/[1,1.5]));
    sig = sig + (LFPulse.ar(1/4)*AllpassN.ar(sig,1/4.01*(mod**4),1/8*(duty**2),4) * LFSaw.ar(1/4/fib(8)).exprange(0.001,1));
    sig = LPF.ar(sig,10000);
    sig = CompanderD.ar(sig,4/3,1/3,1/2);
    sig = sig * puls;

    Splay.ar(sig,0.125,0.025);
  };
  e.addMix(~switcher,postVol:true);
  ~switcher.play;
);
~switcher.stop(7);
~switcher.clear;

// filt filter ///////////////////////////////////////

(
  ~filt.quant=2;
  ~filt.fadeTime=5;
  ~filt={
    var high,mid,low;
    var sig = e.ar;
    sig = GVerb.ar(sig/2,4,10*LFSaw.ar(1/16).exprange(0.001,1),0.19,LFSaw.ar(1).exprange(0.001,1),3,LFSaw.ar(1/4).exprange(0.001,1))+sig;
    low = CompanderD.ar(LPF.ar(sig,800),4/3,1/2,1/2);
    mid = CompanderD.ar(BPF.ar(sig,1000,2),4/3,1/4,1/2);
    high = CompanderD.ar(HPF.ar(sig,1200),4/3,1/2,1/2);
    sig = CompanderD.ar((high+mid+low).flat/3,4/3,1/2,1/2);
    Splay.ar(sig,0.25,0.5);
  };
  ~filt.play;
);
~filt.stop(7);
