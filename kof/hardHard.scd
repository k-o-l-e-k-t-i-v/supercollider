p.push()

(
  //s.latency=0.2;
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

(
//////////////////////////  FADE -> OUT ///////////////////////////////////////////////////////
{
  p.arProxyNames.do({|synth| if(synth.asSymbol!=\master){p[synth.asSymbol].clear(2);};});
}.fork;  
)
(
  p.clock.tempo_(240/60);
  
  ~offset = (0..7)/8;
  
  ~tick.quant = 1;
  ~tick = {Mix(Impulse.kr( ~tempo / 2 , ~offset ))};
  
  ~counter = {PulseCount.kr(~tick.kr)};
);


(
  ~master.quant=2;
  ~master.play;
  ~master.fadeTime = 0.01;
  ~master = {|wet=0.15,lp=3500,hp=250,len=10,rev = 3|
  var sig = In.ar([0,1]);
  var orig = sig;
  var fx;
  //fx = Limiter.ar(sig,0.95);
  sig = Compander.ar(sig,3/4,1/1.1,1/3);
  fx = LPF.ar(sig,lp);
  fx = HPF.ar(fx,hp);
  fx = DWGReverb.ar(NumChannels.ar(fx,2),[5000,5010],1/len)/rev;
  sig = SelectX.ar(wet,[orig,fx]);
  sig = NumChannels.ar(sig,2);
  ReplaceOut.ar(0,sig);
  };
);
p.moveNodeToTail(\master);

/// 8 KICK start

(
    ~kick.ar(2);
    ~kick.clock = p.clock;
    ~kick.quant = [16];
    ~kick.fadeTime=0.2;
    ~kick={
        //         |       |       |       |       |  
        var pat = [
            1,0,0,0,1,0,0,0,1,0,0,0,1,0,0,0,
            1,0,0,0,1,0,0,0,1,0,0,0,1,0,0,0,
            1,0,0,0,1,0,0,0,1,0,0,0,1,0,0,0,
            1,0,0,0,1,0,0,0,1,0,0,0,1,0,0,0,
        ].rotate(1);
        var mod2 = LFNoise2.kr(~tempo/160).range(20,80);
        var mod = LFDNoise1.kr(~tempo/160).range(20,80);
        var imp = PulseDivider.kr(~tick.kr,1,~counter.kr%pat.size);
        var hit = Select.kr(PulseCount.kr(imp)%pat.size,pat);
        var env = EnvGen.ar(Env([0.001,1,0.0001],[0.002,2.5],[mod,-3.3]), imp * hit);
        var sig;
        var hum = LFDNoise1.kr(~tempo).range(0.0,0.01);

        // env = DelayN.ar(env,hum,hum);

        sig = Mix.fill(4,{|i|SinOsc.ar(33.midicps+(env**mod2*33.midicps),env**(mod2+i)*8pi)})/2;
        sig = sig * env;
        Splay.ar(sig,0.75,0.5);
    };
    ~kick.play;
);
~kick.stop(10);
~kick.clear(6);
~kick.pause;
~kick.resume;


// one synth ///////////////////////////////////////

(
~onea.ar(2);
~onea.quant=16;
~onea.fadeTime=0.2;
~onea={
  //         |       |       |       |       |  
  var pat = [
    1,0,0,0,1,0,0,0,1,0,0,0,1,0,0,0,
    1,0,0,0,1,0,0,0,1,0,0,0,1,0,0,0,
    1,0,0,0,1,0,0,0,1,0,0,0,1,0,0,0,
    1,0,0,0,1,0,0,0,1,0,1,0,1,1,0,0,
  ].rotate(1);
  var imp = PulseDivider.kr(~tick.kr,1,~counter.kr);
  var imp2 = PulseDivider.kr(~tick.kr,[4,8,16,3],~counter.kr);
  var hit = Select.kr(PulseCount.kr(imp)%pat.size,pat);
  var hit2 = Select.kr(PulseCount.kr(imp2)%pat.size,pat);
  var env = EnvGen.ar(Env([0.001,1,0.0001],[0.002,2.5],[3,-3],curve:'exp'),imp * hit);
  var env2 = EnvGen.ar(Env([0.001,1,0.0001],[0.002,3.5],[3,-3],curve:'exp'),imp2 * hit2);
  var sig = SinOsc.ar(50!2 + (env**50*500));
  
  sig = LFSaw.ar(49+(env2**4*150))/2+sig;
  sig = LPF.ar(sig,900);
  
  sig = sig * env;
  
  sig = GVerb.ar(HPF.ar(sig,900),10,3)/4+sig;
  sig = GVerb.ar(LPF.ar(sig,900),100,10)/4+sig;
  sig = CompanderD.ar(sig,1/2,1/2,1/2);
  Splay.ar(sig,0.75,0.065);
};
~onea.play;
);
~onea.stop(4);
~onea.clear;
~onea.pause;
~onea.resume;
