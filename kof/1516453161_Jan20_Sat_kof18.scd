



p.push();
p.bpm(90);

120/8*7

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
  ~tick = { Mix(Impulse.kr( ~tempo * [1,2,3] )); };
);
// one synth ///////////////////////////////////////

(
~one.ar(2);
~one.clock = p.clock;
~one.quant=[16,4];
~one.fadeTime=4;
~one={
    var step = Duty.kr(64/~tempo/[1,2,3],0,Dseq([0,7,0,-7,12,-12,24,-24],inf));
    var base = Duty.kr(4/~tempo*[1,2,4],0,Dseq([60,65,60,67,60,36,72],inf))-step;
    var mod0 = Duty.kr(64/~tempo*[1,2],0,Dseq([1,2,4,1/2],inf));
    var mod = Duty.kr(8/~tempo*[1,2],0,Dseq([1,2,4,1/2],inf));
    var mod2 = Duty.kr([4,8,16]/~tempo,0,Dseq([1,2,1.5,1.33333,1,2,1.5,1.33334,15/8],inf));
  var f = base.midicps*[1,1/2,1/4]/mod2*mod0/mod*2;
    var sig = LFSaw.ar(f+SinOsc.ar(~tempo/[1,2,3,4]/16),0,SinOsc.ar(~tempo/16/[1,2,3,4]).range(0,2pi));
  sig = MoogFF.ar(sig,f*2,LFTri.ar(~tempo/16/[1,2,3,4])*3.5) + (sig.distort);
  sig = sig * LFTri.ar(~tempo/4/[1,2,3,4]);
  sig = Compander.ar(sig,~kick.ar,0.1,1,0.1);
  Splay.ar(sig,0.5,0.25);
};
~one.play;
);
~one.stop(4);
~one.clear;
~one.pause;
~one.resume;

// kick synth ///////////////////////////////////////

(
~kick.ar(2);
~kick.clock = p.clock;
~kick.quant=[16,0];
~kick.fadeTime=0.02;
~kick={
  //  |       |       |       |       |  
  var pat = [
    1,0,0,0, 1,0,0,0, 1,0,0,0, 1,0,0,0,
    1,0,0,0, 1,0,0,0, 1,0,0,0, 1,0,0,0,
    1,0,0,0, 1,0,0,0, 1,0,0,0, 1,0,0,0,
    1,0,0,0, 1,0,0,0, 1,0,0,0, 1,0,0,0,
  ].rotate(1);
  var imp = PulseDivider.kr(~tick.kr,1,~counter.kr%pat.size);
  var hit = Select.kr(PulseCount.kr(imp)%pat.size,pat);
  var env = EnvGen.ar(Env([0.001,1,0.0001],[0.002,2.5],[3,-3]),imp * hit);
  var sig = SinOsc.ar(50!2,env**80*4pi);
  sig = sig * env;
  Splay.ar(sig,0.75,0.5);
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
~hiss.quant=[16,3];
~hiss.fadeTime=0.02;
~hiss={
  //  |       |       |       |       |  
  var pat = [
    1,0,1,0, 1,0,1,0, 1,0,1,0, 1,0,1,0,
    1,0,1,0, 1,0,1,0, 1,0,1,0, 1,0,1,0,
    1,0,1,0, 1,0,1,0, 1,0,1,0, 1,0,1,0,
    1,0,1,0, 1,0,1,0, 1,0,1,0, 1,0,1,0,
  ].rotate(1);
  var imp = PulseDivider.kr(~tick.kr,[1,2,3],~counter.kr%pat.size);
  var hit = Select.kr(PulseCount.kr(imp)%pat.size,pat);
  var env = EnvGen.ar(Env([0.001,1,0.0001],[0.005,0.025],[3,-3]),imp * hit);
  var sig = WhiteNoise.ar(env);
  var d = 1/(Duty.kr(64/~tempo/[1,2,3],0,Dseq([1,2,1.5,1.33333],inf))*50);
  sig = sig * env;

  Splay.ar(sig,0.75,0.25);
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
  ~master = {|wet=0.25,lp=3500,hp=250,len=10,rev = 3|
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




