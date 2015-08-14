
//////////////////////////////////////////////////////
//////////////////////////////////////////////////////

(
  p=ProxySpace.push(s.reboot);
);


//////////////////////////////////////////////////////
//////////////////////////////////////////////////////
(
  var tempo = 8/3;
  var offset = (0..7)/8;
  t = TempoClock.new(tempo);
  ~tick.quant = 1;
  ~tick = {Mix(Impulse.kr( tempo / 2 , offset ))};
  
  offset = (0..7)+0.5/8;
  ~tick2.quant = 1;
  ~tick2 = {Mix(Impulse.kr( tempo / 2 , offset ))};
  ~counter = {PulseCount.kr(~tick.kr)};
  ~time = {LFSaw.kr(tempo/4).range(0,1)};
)


// bang synth ///////////////////////////////////////

(
~bang.quant=1;
~bang.fadeTime=3.02;
~bang={
  var mod = Duty.kr(9*[1,2,3,4],0,Dseq([1,1,1,1,2,1.5,1.25],inf)).lag(1);
  var imp = PulseDivider.kr(~tick.kr,[1,2,3,4]*2,~counter.kr);
  var env = EnvGen.ar(Env([0.001,1,0.001],[0.0025,0.5],[3,-2]),imp);
  var freq = env**10*[40,500,6,700]+(44*16/([1,8,2,4]*mod*pi));
  var sig = [] ++ SinOsc.ar(freq,mul:0.5) ++ LFSaw.ar(freq) ++ Pulse.ar(freq + SinOsc.ar([3,4,5,6]).range(-4,4)) ++ Formant.ar(freq,freq*1.5,200,mul:0.2);
  sig = Select.ar(~counter%sig.size,sig);
  sig = sig * env;
  Splay.ar(sig,0.75,0.5);
};
~bang.play;
);
~bang.stop(7);
~bang.clear;



// hh synth ///////////////////////////////////////

(
~hh.quant=1;
~hh.fadeTime=0.02;
~hh={
  var imp = PulseDivider.kr(~tick.kr,[1,2,3,4]*2,~counter.kr);
  var env = EnvGen.ar(Env([0.001,1,0.001],[0.002,0.5*(1..4)],[3,-3]),TDelay.kr(imp,2/3/4));
  var sig = WhiteNoise.ar(0.4!2);
  sig = BPF.ar(sig,LFNoise2.kr(1/4!4).range(1000,16000),0.2)*4;
  sig = sig * env;
  Splay.ar(sig,0.75,0.5);
};
~hh.play;
);
~hh.stop(7);
~hh.clear;



// kick synth ///////////////////////////////////////

(
~kick.quant=1;
~kick.fadeTime=0.02;
~kick={
  var imp = PulseDivider.kr(~tick.kr,[1,2,3,4]*4,~counter.kr);
  var env = EnvGen.ar(Env([0.001,1,0.001],[0.0002,3.75],[3,-3]),imp);
  var sig = SinOsc.ar(env**100*200+50);
  sig = Resonz.ar(sig,env**2*200+90,0.2) + LPF.ar(sig,420);
  sig = sig * env;
  Splay.ar(sig,0.25,0.75);
};
~kick.play;
);
~kick.stop(7);
~kick.clear;

// aaa filter ///////////////////////////////////////

(
~aaa.quant=1;
~aaa.fadeTime=1;
~aaa={
  var high,mid,low;
  var sig = ~hh.ar + ~bang.ar + ~kick.ar;
  sig = GVerb.ar(HPF.ar(sig,400),80,spread:90)/16 + LPF.ar(sig,400);
  low = CompanderD.ar(LPF.ar(sig,800),3/4,1/2,1/2);
  mid = CompanderD.ar(BPF.ar(sig,800),3/4,1/2,1/2);
  high = CompanderD.ar(HPF.ar(sig,800),3/4,1/2,1/2);
  sig = CompanderD.ar((high+mid+low).flat,3/4,1/1.1,1/1.1);
  Splay.ar(sig,0.25,0.5);
};
~aaa.play;
);
~aaa.stop(7);
~aaa.clear;
