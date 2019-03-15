



p.push();


p.bpm(121.3*4);


// kicker synth ///////////////////////////////////////

(
~kicker.ar(2);
//~kicker.clock = p.clock;
~kicker.quant=[16,0];
~kicker.fadeTime=0.02;
~kicker={
  //  |       |       |       |       |  
  var pat = [
    1,0,0,0, 1,0,0,0, 1,0,0,0, 1,0,0,0,
    1,0,0,0, 1,0,0,0, 1,0,0,0, 1,0,0,0,
    1,0,0,0, 1,0,0,0, 1,0,0,0, 1,0,0,0,
    1,0,0,0, 1,0,0,0, 1,0,0,0, 1,1,1,1,
  ].rotate(1);
  var imp = PulseDivider.kr(~tick.kr,2,~counter.kr%pat.size);
  var hit = Select.kr(PulseCount.kr(imp)%pat.size,pat);
  var env = EnvGen.ar(Env([0.001,1,0.0001],[0.002,0.5],[3,-3]),imp * hit);
  var sig = SinOsc.ar([45,50,55,60]+(env**20*250),env**60*2pi);
  sig = sig * env;
  sig = sig.softclip;
  sig = Mix(sig);
  Splay.ar(sig,0.75,0.25);
};
~kicker.play;
);
~kicker.stop(4);
~kicker.clear;
~kicker.pause;
~kicker.resume;


// kicker2 synth ///////////////////////////////////////

(
~kicker2.ar(2);
//~kicker2.clock = p.clock;
~kicker2.quant=[16,0];
~kicker2.fadeTime=0.02;
~kicker2={
  //  |       |       |       |       |  
  var pat = [
    1,0,0,0, 0,0,0,0, 1,0,0,0, 0,0,0,0,
    1,0,0,0, 0,0,0,0, 1,0,0,0, 0,0,0,0,
    1,0,0,0, 0,0,0,0, 1,0,0,0, 0,0,0,0,
    1,0,0,0, 0,0,0,0, 1,0,0,0, 0,0,0,0,
  ].rotate(1);
  var mel = Duty.kr(16/~tempo*[1,2,3],0,Dseq([1,2,1.5,1.33333],inf)) ;
  var imp = PulseDivider.kr(~tick.kr,2,~counter.kr%pat.size);
  var hit = Select.kr(PulseCount.kr(imp)%pat.size,pat);
  var env = EnvGen.ar(Env([0.001,1,0.0001],[0.02,2.5],[3,-3]),imp * hit);
  var sig = LFSaw.ar((50..65),env**LFNoise1.kr(~tempo/4).range(0.1,0.9));
  sig = sig * env;
  sig = MoogFF.ar(sig,[1500,1501]/mel,env*3.5+0.1);
  sig = Compander.ar(sig,~kicker.ar,0.1,1,0.1);
  Splay.ar(sig,0.75,0.25);
};
~kicker2.play;
);
~kicker2.stop(4);
~kicker2.clear;
~kicker2.pause;
~kicker2.resume;

// hiss synth ///////////////////////////////////////

(
~hiss.ar(2);
//~hiss.clock = p.clock;
~hiss.quant=[16,0];
~hiss.fadeTime=0.02;
~hiss={
  //  |       |       |       |       |  
  var pat = [
    1,0,0,0, 0,0,0,0, 1,0,0,0, 0,0,0,0,
    1,0,0,0, 0,0,0,0, 1,0,0,0, 0,0,0,0,
    1,0,0,0, 0,0,0,0, 1,0,0,0, 0,0,0,0,
    1,0,0,0, 0,0,0,0, 1,0,0,0, 1,1,1,1,

    1,0,0,0, 1,0,0,0, 1,0,0,0, 0,0,0,0,
    1,0,0,0, 0,0,0,0, 1,0,0,0, 0,0,0,0,
    1,0,0,0, 1,0,0,0, 1,0,0,0, 1,0,1,0,
    1,0,0,0, 0,0,0,0, 1,0,0,0, 1,1,1,1,
   ].rotate(3);
  var imp = PulseDivider.kr(~tick.kr,[1,2,3,4],~counter.kr%pat.size);
  var hit = Select.kr(PulseCount.kr(imp)%pat.size,pat);
  var env = EnvGen.ar(Env([0.001,1,0.0001],[0.2,0.015],[3,-3]),imp * hit);
  var sig = WhiteNoise.ar(env**25/[1,2,3,4]);
  sig = sig * env;
  Splay.ar(sig,0.75,0.5);
};
~hiss.play;
);
~hiss.stop(4);
~hiss.clear;
~hiss.pause;
~hiss.resume;

(
  //s.latency=0.2;
  //p.clock.tempo_(120/60);
  p.arProxyNames.do({|synth| if(synth.asSymbol!=\master){p[synth.asSymbol].rebuild;};});
  ~tick.kr(1);
  //~tick.clock = p.clock;
  ~tick.quant = 16;
  //~counter.clock = p.clock;
  ~counter.quant = 16;
  ~counter = {PulseCount.kr(~tick.kr);};
  ~tick = { Impulse.kr( ~tempo * 4 ); };
);

(
//////////////////////////  FADE -> OUT ///////////////////////////////////////////////////////
{
  p.arProxyNames.do({|synth| if(synth.asSymbol!=\master){p[synth.asSymbol].clear(20);};});
}.fork;  
)


(
  ~master.quant=2;
  ~master.play;
  ~master.fadeTime = 0.01;
  ~master = {|wet=0.05,lp=3500,hp=250,len=10,rev = 3|
  var sig = In.ar([0,1]);
  var orig = sig;
  var fx;
  //fx = Limiter.ar(sig,0.95);
  sig = CompanderD.ar(sig,3/4,1/1.1,1/3);
  fx = LPF.ar(sig,lp);
  fx = HPF.ar(fx,hp);
  fx = DWGReverbC1C3.ar(NumChannels.ar(fx,2),[5000,5010],1/len)/rev;
  sig = SelectX.ar(wet,[orig,fx]);
  sig = NumChannels.ar(sig,2);
  ReplaceOut.ar(0,sig);
  };
);
p.moveNodeToTail(\master);
