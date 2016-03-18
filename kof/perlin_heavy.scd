

(
  p.clock.tempo_(240/60/2);

  ~offset = (0..7)/8;

  ~tick.quant = 1;
  ~tick = {Mix(Impulse.kr( ~tempo / 2 , ~offset ))};

  ~counter = {PulseCount.kr(~tick.kr)};
);


(
  ~one.quant=2;
  ~one.fadeTime=4;
  ~one={
    var cc = LFSaw.ar(15000.1 /(1+(1..8).reciprocal**16),add:LFTri.ar(1/500/(1..8))*50);
    var sig = Perlin3.ar(cc,cc**[1.1,1.102],LFSaw.ar(50)+LFTri.kr(1/50,mul:5));
    sig = sig * LFDNoise1.kr(1/4!8) * LFPulse.ar(fib(8));
    sig = LeakDC.ar(sig);
    sig = BBandPass.ar(sig,[40,50,750,20000],0.02,mul:[1,0.7,0.4,0.8]);
    sig = CompanderD.ar(sig,1/2,1/2,1/2).softclip(-0.9,0.9);
    sig = NumChannels.ar(sig,2);
    sig = AllpassN.ar(sig,1/400,1/2,4);
    sig = DWGReverb.ar(sig,4000)+sig/2;
    //sig = Normalizer.ar(sig).softclip/4;
    sig!2;
  };
  ~one.play;
)




// hiss synth ///////////////////////////////////////

(
  ~hiss.ar(2);
  ~hiss.quant=2;
  ~hiss.fadeTime=0.2;
  ~hiss={
    //         |       |       |       |       |  
    var pat = [1,0,1,0,1,1,0,0,1,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,1,1,1].rotate(1).pyramid;
    var imp = PulseDivider.kr(~tick.kr,fib(8),~counter.kr);
    var hit = Select.kr(PulseCount.kr(imp)%pat.size,pat);
    var env = EnvGen.ar(Env([0.001,1,0.0001],[0.00052,0.5],[3,-3],curve:'exp'),imp * hit);
    var sig = LFDNoise1.ar(22000/(1..8));
    sig = BBandPass.ar(sig,[100,2000,10000,20000],0.04*[1,2,8,10])*4;
    sig = sig * env;
    sig = CompanderD.ar(sig,3/4,1/2,1/2);
    sig = AllpassN.ar(sig,1/100,1,4);
    sig = DWGReverb.ar(sig,4000)/4+sig;
    Splay.ar(sig,0.75,0.5,SinOsc.kr(1/4));
  };
  ~hiss.play;
);
~hiss.stop(4);
~hiss.clear;
~hiss.pause;
~hiss.resume;
