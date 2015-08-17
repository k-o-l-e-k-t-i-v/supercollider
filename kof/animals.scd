


(
  p=ProxySpace.push(s.reboot);
);


(
  ~tempo = 4/3;
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



// low synth ///////////////////////////////////////

(
  ~low.quant=1;
  ~low.fadeTime=0.02;
  ~low={
    var imp = PulseDivider.kr(~tick.kr,64,~counter.kr);
    var env = EnvGen.ar(Env([0.001,1,0.001],[4.002,8.5],[3,-3]),imp);
    var sig = Formant.ar(9+(env**4*5),50+(env*4*100),100);
    sig = sig * env;
    sig = GVerb.ar(sig,[20,30],[2,3],spread:[5,90])/16+sig;
    Splay.ar(sig.flat,0.75,0.5);
  };
  ~low.play;
);
~low.stop(7);
~low.clear;

// standard synth ///////////////////////////////////////

(
  ~standard.quant=1;
  ~standard.fadeTime=3.02;
  ~standard={
    var imp = PulseDivider.kr(~tick.kr,[2,3,4,8]*16,~counter.kr);
    var env = EnvGen.ar(Env([0.001,1,0.001],[2.202,8.5]/fib(8),[3,-3]),imp);
    var sig = Formant.ar([5/8*250,5/8*2500,250/4,5000]/(TExpRand.kr(0.25,8,imp).round(0.25)*0.5pi)+(env**2*(5/8*50)) + SinOsc.kr(1/fib(8)+(env**4*10)).range(-10,10),45.midicps,[90,1200,4000]*LFNoise2.kr(1!4)) + GrayNoise.ar(0.05!4);
    sig = MoogFF.ar(sig,env**7*100+24.midicps,3)+sig;
    sig = BBandPass.ar(sig,15000/16*(1..16)+200,0.5,mul:LFNoise2.kr(1/4!16).exprange(0.001,0.5));
    sig = CompanderD.ar(sig,3/4,1/3,1/2);
    sig = Limiter.ar(sig);
    sig = GVerb.ar(sig,[10,45],[2,3,4,5],spread:[5,90]);

    sig = sig * env;
    Splay.ar(sig.flat,0.75,0.75);
  };
  ~standard.play;
);
~standard.stop(7);
~standard.clear;


// tick synth ///////////////////////////////////////

(
  ~ticka.quant=1;
  ~ticka.fadeTime=0.02;
  ~ticka={
    var imp = PulseDivider.kr(~tick.kr,fib(16,1,2)+4,~counter.kr);
    var env = EnvGen.ar(Env([0.001,1,0.001],[0.02,0.05*fib(8)],[3,-3]),imp);
    var sig = Dust.ar(env**4*12000) * 0.5;
    sig = RHPF.ar(sig,1500+(LFNoise2.kr(1!16).range(0,10000))+(env**8*1000));
    sig = sig * env;
    sig = BBandPass.ar(sig,12000/8*(1..16)+1500,2,mul:LFNoise2.kr(4!16));
    sig = CombN.ar(sig,1,2,4)/4+sig;
    sig = CompanderD.ar(sig,1/2,1/3,2);
    sig = GVerb.ar(sig,[10,45],[2,3,4,5],spread:[5,90]);
    Splay.ar(sig.flat,0.75,0.5);
  };
  ~ticka.play;
);
~tick.stop(7);
~tick.clear;



// noises filter ///////////////////////////////////////

(
  ~noises.quant=1;
  ~noises.fadeTime=1;
  ~noises={
    var high,mid,low;
    var sig = ~standard.ar + ~low.ar;

    sig = Resonz.ar(sig,LFCub.kr(~tempo/88/fib(16)).exprange(100.01,10000),0.05)*4 * SinOsc.ar(LFNoise2.kr(1!8).range(1/44,11)).range(0,1) * LFNoise2.kr(1/16!8).exprange(0.001,0.5);
    low = CompanderD.ar(LPF.ar(sig,600),3/4,1/1.1,1/2);
    mid = CompanderD.ar(BPF.ar(sig,800,2),3/4,1/2,1/2);
    high = CompanderD.ar(HPF.ar(sig,900),3/4,1/3,1/2);
    sig = CompanderD.ar((high+mid+low).flat,3/4,1/1.1,1/1.1);
    Splay.ar(sig,0.75,0.25);
  };
  ~noises.play;
);
~noises.stop(7);
~noises.clear;
