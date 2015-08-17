

(
  p=ProxySpace.push(s.reboot);
);


(
  ~tempo = {64/3 * m.kr(0,5)};
  ~offset = (0..7)/8;
  t = TempoClock.new(~tempo);
  ~tick.quant = 1;
  ~tick = {Mix(Impulse.kr( ~tempo / 2 , ~offset ))};
  
  ~offset = (0..7)+0.5/8;
  ~tick2.quant = 1;
  ~tick2 = {Mix(Impulse.kr( ~tempo / 2 , ~offset ))};
  ~counter = {PulseCount.kr(~tick.kr)};
  ~time = {LFSaw.kr(~tempo/4).range(0,1)};
)


// lala synth ///////////////////////////////////////

(
~lala.quant=1;
~lala.fadeTime=0.02;
~lala={
  var imp = PulseDivider.kr(~tick.kr,2,~counter.kr);
  var env = EnvGen.ar(Env([0.001,1,0.001],[m.kr(0,1)*16,m.kr(0,2)*16],[3,-3]),imp);
  var sig = SinOsc.ar(m.kr(0,6)*500+(env**(m.kr(0,3)*200)*(m.kr(0,4)*15000)));
  sig = sig * env * LFPulse.ar(m.kr(0,7)*160);
  Splay.ar(sig,0.75,m.kr(0,8));
};
~lala.play;
);
~lala.stop(7);
~lala.clear;



// filt filter ///////////////////////////////////////

(
~filt.quant=1;
~filt.fadeTime=1;
~filt={
  var high,mid,low;
  var sig = ~lala;
  
  sig = GVerb.ar(LPF.ar(sig,5000)+HPF.ar(sig,500),40,[3,4,5,6],spread:[4,90])/8 + sig;
  low = CompanderD.ar(LPF.ar(sig,600),3/4,1/2,1/2);
  mid = CompanderD.ar(BPF.ar(sig,800,2),3/4,1/2,1/2);
  high = CompanderD.ar(HPF.ar(sig,900),3/4,1/2,1/2);
  sig = CompanderD.ar((high+mid+low).flat,3/4,1/1.1,1/1.1);
  Splay.ar(sig,0.75,0.25);
};
~filt.play;
);
~filt.stop(7);
~filt.clear;
