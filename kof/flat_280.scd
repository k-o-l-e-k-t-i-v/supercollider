


p.push();
p.bpm(140*2);


(
  ~master.quant=2;
  ~master.play;
  ~master.fadeTime = 0.01;
  ~master = {|wet=0.25,lp=3500,hp=250,len=10,rev = 3|
    var sig = In.ar([0,1]);
    var orig = sig;
    var fx;
    //fx = Limiter.ar(sig,0.95);
    sig = CompanderD.ar(sig,3/4,1/1.1,1/3);
    fx = LPF.ar(sig,lp);
    fx = HPF.ar(fx,hp);
    fx = DWGReverb.ar(NumChannels.ar(fx,2),[5000,5010],1/len)/rev;
    sig = SelectX.ar(wet,[orig,fx]);
    sig = NumChannels.ar(sig,2);
    ReplaceOut.ar(0,sig);
  };
  p.moveNodeToTail(\master);
);

// kick synth ///////////////////////////////////////

(
  ~kick.ar(2);
  ~kick.clock = p.clock;
  ~kick.quant=[16,0];
  ~kick.fadeTime=0.02;
  ~kick={
    //  |       |       |       |       |  
    var pat = [


      1,0,0,0, 0,0,0,0, 1,0,0,0, 0,0,0,0, 1,0,0,0, 0,0,0,0, 1,0,0,0, 0,0,0,0,
      1,0,0,0, 0,0,0,0, 1,0,0,0, 0,0,0,0, 1,0,0,0, 0,0,0,0, 1,0,0,0, 0,0,0,0,
      1,0,0,0, 0,0,0,0, 1,0,0,0, 0,0,0,0, 1,0,0,0, 0,0,0,0, 1,0,0,0, 0,0,0,0,
      1,0,0,0, 0,0,0,0, 1,0,0,0, 0,0,0,0, 1,0,0,0, 0,0,0,0, 1,0,0,0, 1,1,1,1,

      1,0,0,0, 0,0,0,0, 1,0,0,0, 0,0,0,0, 1,0,0,0, 0,0,0,0, 1,0,0,0, 0,0,0,0,
      1,0,0,0, 0,0,0,0, 1,0,0,0, 0,0,0,0, 1,0,0,0, 0,0,0,0, 1,0,0,0, 0,0,0,0,
      1,0,0,0, 0,0,0,0, 1,0,0,0, 0,0,0,0, 1,0,0,0, 0,0,0,0, 1,0,0,0, 0,0,0,0,
      1,0,0,0, 0,0,0,0, 1,0,0,0, 0,0,0,0, 1,0,0,0, 0,0,0,0, 1,0,0,0, 1,1,1,1,

      1,0,0,0, 0,0,0,0, 1,0,0,0, 0,0,0,0, 1,0,0,0, 0,0,0,0, 1,0,0,0, 0,0,0,0,
      1,0,0,0, 0,0,0,0, 1,0,0,0, 0,0,0,0, 1,0,0,0, 0,0,0,0, 1,0,0,0, 0,0,0,0,
      1,0,0,0, 0,0,0,0, 1,0,0,0, 0,0,0,0, 1,0,0,0, 0,0,0,0, 1,0,0,0, 0,0,0,0,
      1,0,0,0, 0,0,0,0, 1,0,0,0, 0,0,0,0, 1,0,0,0, 1,0,1,0, 1,0,0,0, 1,1,1,1,

      1,0,0,0, 0,0,0,0, 1,0,0,0, 0,0,0,0, 1,0,0,0, 0,0,0,0, 1,0,0,0, 0,0,0,0,
      1,0,0,0, 0,0,0,0, 1,0,0,0, 0,0,0,0, 1,0,0,0, 0,0,0,0, 1,0,0,0, 0,0,0,0,
      1,0,0,0, 0,0,0,0, 1,0,0,0, 0,0,0,0, 1,0,0,0, 0,0,0,0, 1,0,0,0, 0,0,0,0,
      1,0,0,0, 0,0,0,0, 1,0,0,0, 0,0,0,0, 1,0,0,0, 1,0,0,0, 1,0,0,0, 1,1,1,1,
    ].rotate(1);
    var imp = PulseDivider.kr(~tick.kr,1,~counter.kr%pat.size);
    var hit = Select.kr(PulseCount.kr(imp)%pat.size,pat);
    var env = EnvGen.ar(Env([0.001,1,0.0001],[0.002,2.5],[3,-3]),imp * hit);
    var sig = SinOsc.ar(50!2,env**80*8pi + BrownNoise.ar(0.2!2*env**100));
    sig = sig * env;
    Splay.ar(sig,0.75,0.95);
  };
  ~kick.play;
);
~kick.stop(60);
~kick.clear;
~kick.pause;
~kick.resume;


// kick synth ///////////////////////////////////////

(
  ~kick2.ar(2);
  ~kick2.clock = p.clock;
  ~kick2.quant=[16,0];
  ~kick2.fadeTime=32.02;
  ~kick2={
    //  |       |       |       |       |  
    var pat = [
      1,0,0,0, 0,0,0,0, 1,0,0,0, 0,0,0,0, 1,0,0,0, 0,0,0,0, 1,0,0,0, 0,0,0,0,
      1,0,0,0, 0,0,0,0, 1,0,0,0, 0,0,0,0, 1,0,0,0, 0,0,0,0, 1,0,0,0, 0,0,0,0,
      1,0,0,0, 0,0,0,0, 1,0,0,0, 0,0,0,0, 1,0,0,0, 0,0,0,0, 1,0,0,0, 0,0,0,0,
      1,0,0,0, 0,0,0,0, 1,0,0,0, 0,0,0,0, 1,0,0,0, 0,0,0,0, 1,0,0,0, 1,1,1,1,
    ].rotate(1);
    var mod = Duty.kr(64*[1,2,3,4]/~tempo,0,Dseq([1,2,1.5,1.33333],inf))*[1.5,1,1/2];
    var imp = PulseDivider.kr(~tick.kr,8,~counter.kr%pat.size);
    var hit = Select.kr(PulseCount.kr(imp)%pat.size,pat);
    var env = EnvGen.ar(Env([0.001,1,0.0001],[1.5,2.5],[3,-3]),imp * hit);
    var sig = VarSaw.ar([1000,2000,8000]!2/mod,0,env**0.1+SinOsc.kr(1/4/[1,2,3,4])).pow(1/(env**4+1)) * LFSaw.ar(500+[0.001,0.002]+env);
    sig = sig * env;
    sig = MoogFF.ar(sig,[500,1500,750]/mod,[2.5,1.5,2.7]);
    sig = Compander.ar(sig,~kick.ar,0.1,1,0.1);
    sig = CompanderD.ar(sig,3/4,1/1.5,1);
    Splay.ar(sig,0.75,0.95);
  };
  ~kick2.play;
);
~kick2.stop(60);
~kick2.clear;
~kick2.pause;
~kick2.resume;


// hat synth ///////////////////////////////////////

(
  ~hat2.ar(2);
  ~hat2.clock = p.clock;
  ~hat2.quant=[16,0];
  ~hat2.fadeTime=0.02;
  ~hat2={
    //  |       |       |       |       |  
    var pat = [
      1,0,1,0, 1,0,1,0, 1,0,1,0, 1,0,1,0, 1,0,1,0, 1,0,1,0, 1,0,1,0, 1,0,1,0,
      1,0,0,0, 0,0,0,0, 1,0,0,0, 0,0,0,0, 1,0,0,0, 0,0,0,0, 1,0,0,0, 0,0,0,0,
      1,0,0,0, 1,0,0,0, 1,0,0,0, 1,0,0,0, 1,0,0,0, 1,0,0,0, 1,0,0,0, 1,0,0,0,
      1,0,0,0, 0,0,0,0, 1,0,0,0, 0,0,0,0, 1,0,0,0, 0,0,0,0, 1,0,0,0, 1,1,1,1,
    ].rotate(5);
    var imp = PulseDivider.kr(~tick.kr,[1,2,8,4],~counter.kr%pat.size);
    var hit = Select.kr(PulseCount.kr(imp)%pat.size,pat);
    var env = EnvGen.ar(Env([0.001,1,0.0001],[0.001,0.075*[1,2,4,20]],[3,-3]),imp * hit);
    var sig = WhiteNoise.ar(env**[20,40,10,5]) + Pulse.ar(env**4*8*~tempo);
    sig = HPF.ar(sig,[300,400,4000,15000]);
    sig = sig * env;
    sig = Compander.ar(sig,~kick.ar,0.1,1,0.1);
    Splay.ar(sig,0.25,0.95);
  };
  ~hat2.play;
);
~hat2.stop(60);
~hat2.clear;
~hat2.pause;
~hat2.resume;

(
  s.latency=0.5;
  //p.clock.tempo_(120/60);
  p.arProxyNames.do({|synth| if(synth.asSymbol!=\master){p[synth.asSymbol].rebuild;};});
  ~tick.kr(1);
  ~tick.clock = p.clock;
  ~tick.quant = 16;
  ~counter.clock = p.clock;
  ~counter.quant = 16;
  ~counter = {PulseCount.kr(~tick.kr);};
  ~tick = { Impulse.kr( ~tempo * 4 ); };
);


