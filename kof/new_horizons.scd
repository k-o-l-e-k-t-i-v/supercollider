
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
  ~time = {LFSaw.kr(~tempo/4).range(0,1)};
)

// pol synth ///////////////////////////////////////

(
  ~pol.quant=2;
  ~pol.fadeTime=0.2;
  ~pol={
    //         |       |       |       |       |  
    var pat = [1,0,0,0,1,0,0,0,1,0,0,0,1,0,0,0].rotate(1);
    var imp = PulseDivider.kr(~tick.kr,8*fib(4),~counter.kr);
    var hit = Select.kr(PulseCount.kr(imp)%pat.size,pat);
    var mld = Select.kr(PulseCount.kr(hit/4)%4,[1,2,4,8]);
    var env = EnvGen.ar(Env([0.001,1,0.25,0.5,0.001],[4.002,0.5,1,1]*[1,2,3,4]/4,[3,-3],curve:'exp'),imp * hit);
    var sig = LFSaw.ar([60,64,60,67].midicps/4 * mld + SinOsc.ar(env**2*11).range(-4*env,4*env)) + Crackle.ar(1.5,2);

    sig = MoogFF.ar(sig,400*mld,3.5*LFNoise2.kr(fib(4)));
    sig = sig * env;
    sig = HPF.ar(Greyhole.ar(sig,4),100)+sig/2;
    sig = GVerb.ar(sig,60,[3,4,5,6],spread:[70,90])/4+sig;
    sig = CompanderD.ar(sig,3/4,1/2,1/2);
    Splay.ar(sig.flat,0.75,0.5);
  };
  ~pol.play;
);
~pol.stop(7);
~pol.clear;
