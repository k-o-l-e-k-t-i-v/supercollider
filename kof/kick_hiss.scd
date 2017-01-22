
p.push()

p.bpm(105);
(
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

// one synth ///////////////////////////////////////

(
~one.ar(2);
~one.clock = p.clock;
~one.quant=[16,0];
~one.fadeTime=0.02;
~one={
  //  |       |       |       |       |  
  var pat = [
    1,0,0,0, 1,0,0,0, 1,0,0,0, 1,0,0,0,
    1,0,0,0, 1,0,0,0, 1,0,0,0, 1,0,0,0,
    1,0,0,0, 1,0,0,0, 1,0,0,0, 1,0,0,0,
    1,0,0,0, 1,0,0,0, 1,0,0,0, 1,0,0,0,
  ].rotate(1);
  var imp = PulseDivider.kr(~tick.kr,1,~counter.kr%pat.size);
  var hit = Select.kr(PulseCount.kr(imp)%pat.size,pat);
  var env = {EnvGen.ar(Env([0.001,1,0.0001],[0.002,2.15]*LFNoise2.kr(1/32).range(0.15,2.5),[3,-3]),imp * hit)};
  var sig = SinOsc.ar(50!2,LPF.ar(BrownNoise.ar(0.12!2),env**LFNoise1.kr([4,1/2,1/16]).range(0.1,80)*15000+100)+(env**80*8pi));
  sig = sig + (VarSaw.ar(50+(env**500*15000),0,env**0.9*2,mul:LFNoise2.kr(1/32).range(0.0001,0.15)));
  sig =  Mix(sig * env);
  Splay.ar(sig,0.005,0.055);
};
~one.play;
~hiss.play;
);
)
~one.stop(15);
~one.clear;
~one.pause;
~one.resume;

// hiss synth ///////////////////////////////////////

(
~hiss.ar(2);
~hiss.clock = p.clock;
~hiss.quant=[16,0];
~hiss.fadeTime=0.02;
~hiss={
  //  |       |       |       |       |  
  var pat = [
    1,0,1,0, 1,0,1,0, 1,0,1,0, 1,0,1,0,
    1,0,1,0, 1,0,1,0, 1,0,1,0, 1,0,1,0,
    1,0,1,0, 1,0,1,0, 1,0,1,0, 1,0,1,0,
    1,0,1,0, 1,0,1,0, 1,0,1,0, 1,1,1,1,
  ].rotate(1);
  var imp = PulseDivider.kr(~tick.kr,[1,2,3,4],~counter.kr%pat.size);
  var hit = Select.kr(PulseCount.kr(imp)%pat.size,pat);
  var env = EnvGen.ar(Env([0.001,1,0.0001],[0.005/[1,20,2,40],0.15/[1,2,3,10]],[3,-3]),imp * hit);
  var sig = RHPF.ar(WhiteNoise.ar(0.7!4),[100,5000,15000,1200]*Pulse.ar([8,2,16,50].scramble).abs.softclip+100,0.26);
  sig = sig * env;
  sig = Compander.ar(sig,~one.ar,0.1,1,0.001);
  Splay.ar(sig,SinOsc.kr(1/8*~tempo).abs,0.25);
};
//~hiss.play;
);
~hiss.stop(32);
~hiss.clear;
~hiss.pause;
~hiss.resume;

// perl synth ///////////////////////////////////////

(
~perl.ar(2);
~perl.clock = p.clock;
~perl.quant=[0,3];
~perl.fadeTime=1.02;
~perl={
  //  |       |       |       |       |  
  var pat = [
    1,0,0,0, 1,0,0,0, 1,0,0,0, 1,0,0,0,
    1,0,0,0, 1,0,0,0, 1,0,0,0, 1,0,0,0,
    1,0,0,0, 1,0,0,0, 1,0,0,0, 1,0,0,0,
    1,0,0,0, 1,0,0,0, 1,0,0,0, 1,1,1,1,
  ].rotate(3);
  var imp = PulseDivider.kr(~tick.kr,[1,2,4]*4,~counter.kr%pat.size);
  var hit = Select.kr(PulseCount.kr(imp)%pat.size,pat);
  var env = EnvGen.ar(Env([0.001,1,0.0001],[0.025,0.15*[1,2,4]].scramble,[3,-3]),imp * hit);
  var mod = Duty.kr(128/~tempo,0,Dseq([1,2,1.5,1.33333].scramble,inf)) * [4,2,1,8].scramble;
  var f = [[64,60,60,60,36,48,69].choose,72,84].midicps.scramble / {[8,16,2,1,32,1/2,1/4].choose}!3 / Duty.kr([4,16,64,128].scramble * (8/[16,32,64].scramble) / (~tempo/2),0,Dseq([1,2,1.5,1.33333,1,2,1/2,4].scramble,inf)).lag(1/[128,512,2048]) * mod   ;
  var t = VarSaw.ar([1/4,1/160,f],0,env**[1/8,20,200].scramble,mul:0.01) + SinOsc.ar(f*2,SinOsc.kr(1/4/[1,2,3].scramble,mul:LFTri.ar(1/16/[1,2,3,4]*~tempo)) * pi,mul:0.25) + LFTri.ar(f/2560/[16,64,512],mul:LFNoise2.kr(1/160!3).range(0.01,1/[4,8,1/100]));
  var sig = Perlin3.ar(t[0],t[1],t[2]) ** LFSaw.ar(~tempo*4).range(0.5,1.5);
  sig = sig * env;
  sig = LeakDC.ar(sig) ;
  
  sig = sig + (sig * ToggleFF.kr(~tempo * 8 / {[1,2,3,4,5,6,7,8,1/4,1/2,1/4,1/8,1/16].choose}!8) );
  sig = Compander.ar(sig,~one.ar,0.1,1,0.1);
  sig = LPF.ar(sig,2000) + (Pulse.ar(~tempo*4/[1,2,3,4]*[1,2,4].choose)*HPF.ar(sig,1000));
  sig = CompanderD.ar(sig,1/2,1/2,1);
  Splay.ar(sig,0.575,0.15);
};
~perl.play;
);
~perl.stop(120);
~perl.clear;
~perl.pause;
~perl.resume;

(
//////////////////////////  FADE -> OUT ///////////////////////////////////////////////////////
{
  p.arProxyNames.do({|synth| if(synth.asSymbol!=\master){p[synth.asSymbol].clear(20);};});
}.fork;  
)


(
r = Tdef(\resync,{
loop{
    ~perl.rebuild;
    (18.28571).wait;
};
};);

120/105*16

(
  p.clock.sched(p.clock.timeToNextBeat(1 * 16),{ 
    r.play(); 
  });
);

)
r.stop;



(
  ~master.quant=16;
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
