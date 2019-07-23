p.push()
p.bpm(125)


// beep synth ///////////////////////////////////////

(
~beep.ar(2);
~beep.quant=[16,0];
~beep.fadeTime=0.02;
~beep={
  //  |       |       |       |       |  
  var pat = [
    1,0,0,0, 0,0,0,0, 1,0,0,0, 0,0,0,0,
    1,0,0,0, 0,0,0,0, 1,0,0,0, 0,0,0,0,
    1,0,0,0, 0,0,0,0, 1,0,0,0, 0,0,0,0,
    1,0,0,0, 0,0,0,0, 1,0,0,0, 0,0,0,0,
  ].rotate(1);
  var imp = PulseDivider.kr(~tick.kr,1,~counter.kr%pat.size);
  var hit = Select.kr(PulseCount.kr(imp)%pat.size,pat);
  var env = EnvGen.ar(Env([0.001,1,0.0001],[0.002,0.25],[3,-3]),imp * hit);
  var sig = SinOsc.ar(500!2,mul:0.2);
  sig = sig * env;
  Splay.ar(sig,0.75,0.25);
};
~beep.play;
);
~beep.stop(4);
~beep.clear;
~beep.pause;
~beep.resume;

// one synth ///////////////////////////////////////

(
~one.ar(2);
~one.quant=2;
~one.fadeTime=4;
~one={
  var sig = SinOsc.ar(50);
  Splay.ar(sig,0.5,0.25);
};
~one.play;
);
~one.stop(4);
~one.clear;
~one.pause;
~one.resume;

// one synth ///////////////////////////////////////

(
~one.ar(2);
~one.quant=16;
~one.fadeTime=16;
~one={
  var sig = LFSaw.ar([50,50.1,75,25.01]/1.5)*LFSaw.ar(~tempo/4/[1,2,3,4]);
  sig = LPF.ar(sig,LFNoise1.kr(~tempo/16/[1,3]).range(500,9000)) + (HPF.ar(sig,10000/[1,2,3,4],mul:0.01));
  sig = sig * LFSaw.ar(~tempo/8/[1,2,3,4]);
  Splay.ar(sig,0.95,0.1,SinOsc.ar(~tempo/[1,2,3,4])/4);
};
~one.play;
);
~one.stop(4);
~one.clear;
~one.pause;
~one.resume;

// one synth ///////////////////////////////////////

(
~one.ar(2);
~one.quant=2;
~one.fadeTime=4;
~one={
  var sig = SinOsc.ar([50,56],Pulse.ar(1/4));
  Splay.ar(sig,0.5,0.25);
};
~one.play;
);
~one.stop(4);
~one.clear;
~one.pause;
~one.resume;

(
  //s.latency=0.2;
  //p.clock.tempo_(120/60);
  p.arProxyNames.do({|synth| if(synth.asSymbol!=\master){p[synth.asSymbol].rebuild;};});
  ~tick.kr(1);
  ~tick.quant = 16;
  ~counter.quant = 16;
  ~counter = {PulseCount.kr(~tick.kr);};
  ~tick = { Impulse.kr( ~tempo * 4 ); };
);
~tempo={4};

// perlKick synth ///////////////////////////////////////

(
~perlKick.ar(2);
~perlKick.quant=[16,0];
~perlKick.fadeTime=0.02;
~perlKick={
  //  |       |       |       |       |  
  var pat = [
    1,0,0,0, 0,0,0,0, 1,0,0,0, 0,0,0,0,
    1,0,0,0, 0,0,0,0, 1,0,0,0, 0,0,0,0,
    1,0,0,0, 0,0,0,0, 1,0,0,0, 0,0,0,0,
    1,0,0,0, 0,0,0,0, 1,0,0,0, 1,1,1,1,
  ].rotate(1);
  var imp = PulseDivider.kr(~tick.kr,[1,2,3,4],~counter.kr%pat.size);
  var hit = Select.kr(PulseCount.kr(imp)%pat.size,pat);
  var env = EnvGen.ar(Env([0.001,1,0.0001],[0.002,0.005*[1,10,20]],[3,-3]),imp * hit);
  var sig = Perlin3.ar(env,env*LFNoise2.kr(1/16!16),LFSaw.ar([50,50.1,50,1500]));
  sig = sig * env;
  Splay.ar(sig,0.95,0.15,SinOsc.ar([3,4]));
};
~perlKick.play;
);
~perlKick.stop(4);
~perlKick.clear;
~perlKick.pause;
~perlKick.resume;


// one synth ///////////////////////////////////////

(
~one.ar(2);
~one.quant=16;
~one.fadeTime=4;
~one={
    var mod2=  Duty.kr(16/~tempo,0,Dseq([1,2,1.5,1.33333],inf));
    var mod = [200,150,1000/1.5,1500*mod2]/mod2/Duty.kr([4,8,16,32]/~tempo,0,Dseq([1,2,1.5,1.33333],inf)) + SinOsc.ar([3,4,5]);
  var sig = LFSaw.ar([[50,mod+0.01,mod],1/4,1/8]) * [LFSaw.ar(1/4/[1,2,3,4]).exprange(0.01,16),2pi,2pi];
  sig = Perlin3.ar(sig[0],sig[1].sin,sig[2].cos);
  sig = LPF.ar(sig,500+LFSaw.ar(1/16/[1,7,9,17]).range(0,[1,2,3,4]*8000));
  sig = sig + HPF.ar(sig*Pulse.ar([4,3,2]),15000);
  sig = sig * LFTri.ar(~tempo/32/[1,2,3,4]);
  sig = LeakDC.ar(sig);
  //sig = Compander.ar(sig,Pulse.ar(4/[1,2,3]),0.1,1,0.1);
  Splay.ar(sig,0.95,0.05,SinOsc.ar(~tempo/[1,2,3]));
};
~one.play;
);
~one.stop(4);
~one.clear;
~one.pause;
~one.resume;

(
  ~master.quant=2;
  ~master.play;
  ~master.fadeTime = 0.01;
  ~master = {|wet=0.15,lp=3500,hp=250,len=10,rev = 3|
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

// kick synth ///////////////////////////////////////

(
~kick.ar(2);
~kick.quant=[16,2];
~kick.fadeTime=0.02;
~kick={
  //  |       |       |       |       |  
  var pat = [
    1,0,0,0, 1,0,0,0, 1,0,0,0, 1,0,0,0,
    1,0,0,0, 1,0,0,0, 1,0,0,0, 1,0,0,0,
    1,0,0,0, 1,0,0,0, 1,0,0,0, 1,0,0,0,
    1,0,0,0, 1,0,0,0, 1,0,0,0, 1,1,1,1,
  ].rotate(1);
  var imp = PulseDivider.kr(~tick.kr,16,~counter.kr%pat.size);
  var hit = Select.kr(PulseCount.kr(imp)%pat.size,pat);
  var env = EnvGen.ar(Env([0.001,1,0.0001],[0.002,1.5],[3,-3]),imp * hit);
  var sig = SinOsc.ar(50!2+(env**50*50),env**50*8pi) + BrownNoise.ar(env**20);
  sig = CombN.ar(sig,1/50,1/50,1);
  sig = sig * env;
  Splay.ar(sig,0.75,0.15);
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



