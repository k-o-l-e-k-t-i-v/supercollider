


p.push();


(
  ~master.quant=16;
  ~master.play;
  ~master.fadeTime = 0.01;
  ~master = {|wet=0.5,lp=7500,hp=250,len=10,rev = 3|
  var sig = In.ar([0,1]);
  var orig = sig;
  var fx;
  //fx = Limiter.ar(sig,0.95);
  sig = CompanderD.ar(sig,3/4,1/1.2,1/3);
  fx = LPF.ar(sig,lp);
  fx = HPF.ar(fx,hp);
  fx = DWGReverb.ar(NumChannels.ar(fx,2),[5000,5010],1/len)/rev;
  sig = SelectX.ar(wet,[orig,fx]);
  sig = NumChannels.ar(sig,2);
  ReplaceOut.ar(0,sig);
  };
p.moveNodeToTail(\master);
);



// gem synth ///////////////////////////////////////

(
~gem.ar(2);
~gem.clock = p.clock;
~gem.quant=16;
~gem.fadeTime=4;
~gem={
  var sig = VarSaw.ar([50,55,20000],0,SinOsc.kr(1/16/(1..16)),mul:[1,0.7,LFPulse.ar(16/[1,2,3,4],mul:0.002)]);
  sig = Resonz.ar(sig,[200,2000,1500,20000]/.x[1,4,3],LFTri.kr(1/4/[1,2,3,4]).range(0.2,1) ** LFNoise0.kr(1/4/(1..16)).range(0.2,1.6));
  sig = BPF.ar(sig,[50,75,55,50.001],0.2)*4 + sig;
  sig = HPF.ar(sig,5);
  sig = CompanderD.ar(sig,3/4,1/3,1);
  sig = Normalizer.ar(sig) * LFNoise2.kr(1/16!4).exprange(0.01,0.995);
  //sig = Compander.ar(sig,~kick.ar,0.1,1,0.1,0.002,1);

  Splay.ar(sig,0.75,0.25,SinOsc.ar(1/[4,5,6,1/7]));
};
~gem.play;
);
~gem.stop(4);
~gem.clear;
~gem.pause;
~gem.resume;

// obligatoir_perlin synth ///////////////////////////////////////

(
~obligatoir_perlin.ar(2);
~obligatoir_perlin.clock = p.clock;
~obligatoir_perlin.quant=16;
~obligatoir_perlin.fadeTime=4;
~obligatoir_perlin={
  var pret = SinOsc.ar([1/3000,1/32,1/[3,16,19]] + (LFSaw.ar(500/[1,2,4,8])*LFPulse.ar(1/[4,2,3,4]))) * 2;
  var t = SinOsc.ar([1,4,3]) + SinOsc.ar([50,150,15000]) + Perlin3.ar(pret[0],pret[1],pret[2]);
  var sig = Perlin3.ar(t[0],t[1],t[2]);
  sig = sig + (Decay2.ar(Dust.ar(1/16),2,4)*BrownNoise.ar(0.2!4)*LFSaw.ar([20,30,40]));
  sig = Compander.ar(sig,~kick.ar,0.1,1,0.1);
  Splay.ar(sig,0.85,0.15);
};
~obligatoir_perlin.play;
);
~obligatoir_perlin.stop(4);
~obligatoir_perlin.clear;
~obligatoir_perlin.pause;
~obligatoir_perlin.resume;

(
  s.latency=0.2;
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

// kick synth ///////////////////////////////////////

(
~kick.ar(2);
~kick.clock = p.clock;
~kick.quant=[16,0];
~kick.fadeTime=0.02;
~kick={
  //  |       |       |       |       |  
  var pat = [
    1,0,0,0, 0,0,0,0, 1,0,1,0, 0,0,0,0,
    0,0,0,0, 0,0,0,0, 0,0,0,0, 0,0,0,0,
    1,0,0,0, 0,0,0,0, 1,0,0,0, 0,0,0,0,
    1,0,0,0, 1,0,0,0, 1,0,0,0, 1,0,0,0,
    
    1,0,0,0, 0,0,0,0, 1,0,1,0, 0,0,0,0,
    0,0,0,0, 0,0,0,0, 0,0,0,0, 0,0,0,0,
    1,0,0,0, 0,0,0,0, 1,0,0,0, 0,0,0,0,
    1,0,0,0, 1,0,0,0, 1,0,0,0, 1,0,1,0,
    
    1,0,0,0, 0,0,0,0, 1,0,1,0, 0,0,0,0,
    0,0,0,0, 0,0,0,0, 0,0,0,0, 0,0,0,0,
    1,0,0,0, 0,0,0,0, 1,0,0,0, 0,0,0,0,
    1,0,0,0, 1,0,0,0, 1,0,0,0, 1,0,1,0,
    
    1,0,0,0, 0,0,0,0, 1,0,1,0, 0,0,0,0,
    0,0,0,0, 0,0,0,0, 0,0,0,0, 0,0,0,0,
    1,0,0,0, 0,0,0,0, 1,0,0,0, 0,0,0,0,
    1,0,0,0, 1,0,0,0, 1,0,0,0, 1,0,0,0,  ].rotate(1);
  var imp = PulseDivider.kr(~tick.kr,1,~counter.kr%pat.size);
  var hit = Select.kr(PulseCount.kr(imp)%pat.size,pat);
  var env = {EnvGen.ar(Env([0.001,1,0.0001],[0.002,1.5*LFNoise2.kr(1/32!4).range(1,4)],[3,-3]),imp * hit)};
  var sig = SinOsc.ar(50+(env**80*[50,100,5,150]),env**[80,20,40,120]*8pi);
  sig = sig * env;
  Splay.ar(sig,0.25,0.05);
};
~kick.play;
);
~kick.stop(4);
~kick.clear;
~kick.pause;
~kick.resume;

(
//////////////////////////  FADE -> OUT ///////////////////////////////////////////////////////
{
  p.arProxyNames.do({|synth| if(synth.asSymbol!=\master){p[synth.asSymbol].clear(20);};});
}.fork;  
)




