
s.prepareForRecord("/tmp/polo_shirt.aif");
    s.record;
s.stopRecording;

(
  p=ProxySpace.push(s.boot);
  p.makeTempoClock;
);


(
  p.clock.tempo_(240/60);
  
  ~offset = (0..7)/8;
  
  ~tick.quant = 1;
  ~tick = {Mix(Impulse.kr( ~tempo / 2 , ~offset ))};
  
  ~counter = {PulseCount.kr(~tick.kr)};
);

// ss synth ///////////////////////////////////////

(
~ss.ar(2);
~ss.quant=2;
~ss.fadeTime=0.2;
~ss={
  //         |       |       |       |       |  
  var pat = [1,0,0,0,1,1,0,0,1,0,0,0,1,1,0,0].rotate(1);
  var imp = PulseDivider.kr(~tick.kr,4,~counter.kr);
  var hit = Select.kr(PulseCount.kr(imp)/[1,2,3,4]%pat.size,pat);
  var env = EnvGen.ar(Env([0.001,1,0.001],[1.002,1.5],[3,-3],curve:'exp'),imp * hit);
  var sig = AudioIn.ar([0,1])*4;
  sig = Normalizer.ar(sig);
  sig = RLPF.ar(sig,400+LFNoise2.kr(1/4!16).range(0,10000)) * LFSaw.ar(~tempo/8/fib(16)).exprange(0.1,1);
  //sig = Resonz.ar(sig,432*[1,1.25,2,4,8]) + sig;
  sig = PitchShift.ar(sig,0.1+SinOsc.ar(8/fib(8)).range(0.1,0.55),[0.25,0.5,0.75,1,1.5,1.75,4,8]) ;
  sig = LeakDC.ar(sig);
  sig = sig * env;
  Splay.ar(sig,0.55,0.5);
};
~ss.play;
);
~ss.stop(7);
~ss.clear;


// ff filter ///////////////////////////////////////

(
~ff.quant=1;
~ff.fadeTime=1;
~ff={
  var high,mid,low;
  var sig = ~ss.ar;

  
  sig = GVerb.ar(LPF.ar(sig,15000)+HPF.ar(sig,500),200,[3,4,5,6],spread:[40,90])/8 + sig;
  low = CompanderD.ar(LPF.ar(sig,LFNoise2.kr(1/4).range(100,400)),3/4,1/4,1/2);
  mid = CompanderD.ar(BPF.ar(sig,LFNoise2.kr(1/4).range(400,800),2),3/4,1/1,1/2);
  high = CompanderD.ar(HPF.ar(sig,LFNoise2.kr(1/4).range(800,4800)),3/4,1/3,1/2);
  sig = CompanderD.ar((high+mid+low).flat,3/4,1/1.1,1/1.1);
  sig = LeakDC.ar(sig);
  Splay.ar(sig,0.75,0.25);
};
~ff.play;
);
~ff.stop(7);
~ff.clear;
