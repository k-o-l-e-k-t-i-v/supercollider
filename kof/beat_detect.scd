

Kolektiv(\kof)

(
  p=ProxySpace.push(s.boot);
  p.makeTempoClock;
);


(
  p.clock.tempo_(60/60);
  
  ~offset = (0..7)/8;
  
  ~tick.quant = 1;
  ~tick = {Mix(Impulse.kr( ~tempo / 2 , ~offset ))};
  
  ~counter = {PulseCount.kr(~tick.kr)};
);


s.scope;
// bpm synth ///////////////////////////////////////

(
~bpm.quant=2;
~bpm.fadeTime=0.2;
~bpm={
  //         |       |       |       |       |  
  var sig1,sig2;
  var z1 = Buffer.alloc(s, 512);
  var z2 = Buffer.alloc(s, 512);
  var sig = AudioIn.ar([0,1]);
  
  var chain1 = FFT(z1,LPF.ar(sig,150,2));
  var chain2 = FFT(z2,BPF.ar(sig,10000,2));
  
  var imp1 = PulseDivider.kr(Onsets.kr(chain1, 0.5 , \rcomplex), 2);
  var imp2 = PulseDivider.kr(Onsets.kr(chain2, 0.5 , \rcomplex), 2);
  
  var env1 = EnvGen.ar(Env([0.001,1,0.001],[0.002,1.5],[3,-3],curve:'exp'),imp1);
  var env2 = EnvGen.ar(Env([0.001,1,0.001],[0.002,0.15],[3,-3],curve:'exp'),imp2);

  sig1 = SinOsc.ar(50+(env1**10*150)); 
  sig1 = env1 * sig1;

  sig2 = WhiteNoise.ar(1); 
  sig2 = env2 * sig2;


  //sig = sig * env;
  Splay.ar(sig1+sig2,0.75,0.75);
};
~bpm.play;
);
~bpm.stop(7);
~bpm.clear;


// ff filter ///////////////////////////////////////

(
~ff.quant=1;
~ff.fadeTime=1;
~ff={
  var high,mid,low;
  var sig = ~bpm;
  
  sig = GVerb.ar(LPF.ar(sig,5000)+HPF.ar(sig,500),40,[3,4,5,6],spread:[40,90])/8 + sig;
  low = CompanderD.ar(LPF.ar(sig,400),3/4,1/2,1/2);
  mid = CompanderD.ar(BPF.ar(sig,600,2),3/4,1/2,1/2);
  high = CompanderD.ar(HPF.ar(sig,900),3/4,1/2,1/2);
  sig = CompanderD.ar((high+mid+low).flat,3/4,1/1.1,1/1.1);
  Splay.ar(sig,0.75,0.25);
};
~ff.play;
);
~ff.stop(7);
~ff.clear;
