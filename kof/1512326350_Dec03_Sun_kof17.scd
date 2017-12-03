
p.push();
p.bpm(120);


// lala synth ///////////////////////////////////////

(
~lala.ar(2);
~lala.clock = p.clock;
~lala.quant=2;
~lala.fadeTime=4;
~lala={
  var sig = SinOsc.ar(MouseX.kr(50,500),SinOsc.ar(MouseY.kr(1/4,8)*~tempo)*8pi) * SinOsc.ar(8);
  Splay.ar(sig,0.5,0.05);
};
~lala.play;
);
~lala.stop(4);
~lala.clear;
~lala.pause;
~lala.resume;



// klang synth ///////////////////////////////////////

(
~klang.ar(2);
~klang.clock = p.clock;
~klang.quant=[16,0];
~klang.fadeTime=0.02;
~klang={
  //  |       |       |       |       |  
  var pat = [
    1,0,0,0, 0,0,0,0, 0,0,0,0, 0,0,0,0,
    1,0,0,0, 0,0,0,0, 1,0,0,0, 0,0,0,0,
    1,0,0,0, 0,0,0,0, 0,0,0,0, 0,0,0,0,
    1,0,0,0, 0,0,0,0, 1,0,0,0, 1,1,1,1,


  ].rotate(1);
  var imp = PulseDivider.kr(~tick.kr,[1,2,3],~counter.kr%pat.size);
  var hit = Select.kr(PulseCount.kr(imp)%pat.size,pat);
  var env = EnvGen.ar(Env([0.001,1,0.0001],[0.002,1.5*LFNoise1.kr(4!4)],[3,-3]),imp * hit);
  var sig = SinOsc.ar(50!2);
  var f = MouseX.kr(5,5000/[1,2,4]).round((2**([0,2,7,9]/12)));
  sig = sig * env + LocalIn.ar(2);
  sig = DelayN.ar(sig,2/f,2/f);
  sig = BPF.ar(sig,f,0.1+LFSaw.ar(~tempo/4/[1,2,3]).range(0.001,0.4));
  sig = CompanderD.ar(sig,3/4,1/3,1);
  LocalOut.ar(sig);
  sig = CompanderD.ar(sig,3/4,1/1.5,1);
  Splay.ar(sig,0.75,0.15,SinOsc.ar(~tempo*[1,2,3]));
};
~klang.play;
);
~klang.stop(4);
~klang.clear;
~klang.pause;
~klang.resume;

// oneone synth ///////////////////////////////////////

(
~oneone.ar(2);
~oneone.clock = p.clock;
~oneone.quant=4;
~oneone.fadeTime=16;
~oneone={
  var mod = Duty.kr([1,2,3]*16/~tempo,0,Dseq([1,2,1.5,1.33333],inf)) ** 2;
  var sig = LFSaw.ar([50,1/500.01,1]*mod,0,Pulse.ar(~tempo/[1,2,3,4]),mul:0.1) * LFSaw.ar(~tempo/16/[1,2,3]);
  sig = Perlin3.ar(sig[0],sig[1],sig[2]) * ToggleFF.ar(Impulse.ar(~tempo/[1,2,3]*4) );
  sig = CombN.ar(sig,1/MouseY.kr(50,5000),1/MouseX.kr(50,50000),1);
  sig = sig * Pulse.ar(~tempo*2);
  Splay.ar(sig,0.5,0.15);
};
~oneone.play;
);
~oneone.stop(4);
~oneone.clear;
~oneone.pause;
~oneone.resume;

(
~tempo = {2};
)

// kick synth ///////////////////////////////////////

(
~kick.ar(2);
~kick.clock = p.clock;
~kick.quant=[16,0];
~kick.fadeTime=0.02;
~kick={
  //  |       |       |       |       |  
  var pat = [
    1,0,1,0, 1,0,1,0, 1,0,1,0, 1,0,1,0,
    1,0,1,0, 1,0,1,0, 1,0,1,0, 1,0,1,0,
    1,0,1,0, 1,0,1,0, 1,0,1,0, 1,0,1,0,
    1,0,1,0, 1,0,1,0, 1,0,1,0, 1,1,1,1,
  ].rotate(1);
  var imp = PulseDivider.kr(~tick.kr,[1,2,3,4],~counter.kr%pat.size);
  var hit = Select.kr(PulseCount.kr(imp)%pat.size,pat);
  var env = EnvGen.ar(Env([0.001,1,0.0001],[0.002,2.75*LFNoise2.kr(~tempo/60)],[3,-3]),imp * hit);
  var sig = SinOsc.ar(50+env,env**(20+(100*ToggleFF.kr(hit/[1,2,3,4])))*8pi);
  sig= sig + VarSaw.ar(50+env,0,env**0.22*0.5,mul:0.8);
  sig = sig * env;
  Splay.ar(sig,0.05,0.5);
};
~kick.play;
);
~kick.stop(4);
~kick.clear;
~kick.pause;
~kick.resume;

// hiss synth ///////////////////////////////////////

(
~hiss.ar(2);
~hiss.clock = p.clock;
~hiss.quant=[16,0];
~hiss.fadeTime=0.02;
~hiss={
  //  |       |       |       |       |  
  var pat = [
    1,0,0,0, 0,0,0,0, 1,0,0,0, 0,0,0,0,
    0,0,0,0, 1,0,0,0, 0,0,0,0, 1,0,0,0,
    0,0,0,0, 0,0,0,0, 1,0,0,0, 0,0,0,0,
    0,0,0,0, 1,0,0,0, 1,0,0,0, 1,1,1,1,
  ].rotate(3);
  var imp = PulseDivider.kr(~tick.kr,(1..12),~counter.kr%pat.size);
  var hit = Select.kr(PulseCount.kr(imp)%pat.size,pat);
  var env = EnvGen.ar(Env([0.001,1,0.0001],[0.002,0.05],[3,-3]),imp * hit);
  var sig = HPF.ar(WhiteNoise.ar(env**4),LFNoise1.kr(~tempo/[1,2,3,4]).range(50,19000));
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
  wet = LFSaw.ar(~tempo*[4,3]).range(0.1,0.4);
  sig = SelectX.ar(wet,[orig,fx]);

  sig = NumChannels.ar(sig,2);
  ReplaceOut.ar(0,sig);
  };
);
p.moveNodeToTail(\master);

(
//////////////////////////  FADE -> OUT ///////////////////////////////////////////////////////
{
  p.arProxyNames.do({|synth| if(synth.asSymbol!=\master){p[synth.asSymbol].clear(20);};});
}.fork;  
)
