


(
  p=ProxySpace.push(s.reboot);
);


(
  var tempo = 1/3;
  var offset = (0..7)/8;
  t = TempoClock.new(tempo);
  ~tick.quant = 1;
  ~tick = {Mix(Impulse.kr( tempo / 2 , offset ))};

  offset = (0..7)+0.5/8;
  ~tick2.quant = 1;
  ~tick2 = {Mix(Impulse.kr( tempo / 2 , offset ))};
)


// kick synth ///////////////////////////////////////

(
  ~kick.quant=1;
  ~kick.fadeTime=2.02;
  ~kick={
    var high,mid,low;
    var imp = PulseDivider.kr(~tick.kr,[8,16]);
    var env = EnvGen.ar(Env([0.001,1,0.001],[3.002,1],[6,-3]),imp);
    var sig = Pulse.ar([50,60]) * SinOsc.ar(10*(env**5)) + SinOsc.ar(44*(env**40+1),mul:0.5);
    sig = LeakDC.ar(sig);
    sig = sig * env;
    sig = CombN.ar(sig,1/7,1/7+LFNoise2.kr(1/128!2).range(0.001,0.2),8) + sig;

    sig = GVerb.ar(HPF.ar(sig,500),100) + LPF.ar(sig,500);
    low = CompanderD.ar(LPF.ar(sig,800),3/4,1/3,1/2);
    mid = CompanderD.ar(BPF.ar(sig,800,2),3/4,1/3,1/2);
    high = CompanderD.ar(HPF.ar(sig,800),3/4,1/2,1/2);
    sig = CompanderD.ar((high+mid+low).flat,3/4,1/1.1,1/1.1);Splay.ar(sig,0.25,0.5);
  };
  e.addMix(~kick,postVol:true);
  ~kick.play;
);


